Received: from mail2.viabit.com (mail2.viabit.com [65.246.80.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CCF64AA4
	for <sophgo@lists.linux.dev>; Sun, 31 May 2026 04:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.246.80.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780202393; cv=none; b=dFq3+7uqjwylJ8tjNq1034rOLtjHn7L/8YxpFw223VgxBJWttsPRiffCInTFMDFMkUEJ88ljyKHHL73BM+ZyR+vqiTNM2iFTVZXnPGPx7fDzPXwIOquDuEV1zO1QXubhpJQHlpfaMYx5Sf/7qappzYxkTiaooG8tfaboON4SA0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780202393; c=relaxed/simple;
	bh=mpo2njQ/2pJZolC/w57V2Eefq40iDIPbOMD27vI0ETc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EgUQpPUKzaul91HgWmZKMYsS8tYfqnP7YrRDqJpsZgU3rU1sah3wycXCshZE1S3R1LAUyyeBnTrxkSYTTJvFiyatyWge1Br/9in4qEBmLIDjr5+Ai2ATAC6qh66rIYxgFbptm1t+l8HT+kxSm8y4vsK//RGvrPxSAOGIPzB4NFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com; spf=pass smtp.mailfrom=orlitzky.com; dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b=wlL/Z+90; arc=none smtp.client-ip=65.246.80.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b="wlL/Z+90"
Received: from mertle.michael.orlitzky.com (vpn1.metro-data.com [65.213.236.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.viabit.com (Postfix) with ESMTPSA id 4gSkjC2Bs4z40VF
	for <sophgo@lists.linux.dev>; Sun, 31 May 2026 00:32:47 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=orlitzky.com; s=mail2;
	t=1780201967; bh=mpo2njQ/2pJZolC/w57V2Eefq40iDIPbOMD27vI0ETc=;
	h=Date:From:To:Subject;
	b=wlL/Z+901gZd2qgPjGZ7flmh8jf4jUw39pSi8s4v/SvGs+Mwn164i+D6cyawCRrYf
	 cJf7Ergeksw5g6rKpKoEGzC41pxbN3WMG/8ynufrYYg5lEzu7pzgFxth7wwR4ad6p9
	 CZr7RmVcXcT5mOHPItBO4+dCFE89LICxuAwqzoBM=
Received: by mertle.michael.orlitzky.com (Postfix, from userid 1000)
	id 822B912C1EF5; Sun, 31 May 2026 00:32:46 -0400 (EDT)
Date: Sun, 31 May 2026 00:32:46 -0400
From: Michael Orlitzky <michael@orlitzky.com>
To: sophgo@lists.linux.dev
Subject: SG2042 SATA (DMA?) issues
Message-ID: <ahu57vcS0oOFmCI9@mertle>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Has anyone tried the recent SG2042 firmware and DMA coherence patches
with the onboard SATA? I am currently in the process of learning an
important lesson and wish I weren't. After a recent update, any ext4
filesystem that I put on a SATA drive quickly becomes corrupt. For
example,

EXT4-fs (sda1): mounted filesystem 54f42dce-97ef-4b4d-8a92-dab5d72a527b r/w with ordered data mode. Quota mode: disabled.
EXT4-fs error (device sda1): ext4_validate_block_bitmap:423: comm ext4lazyinit: bg 103: bad block bitmap checksum
EXT4-fs error (device sda1): ext4_validate_block_bitmap:423: comm ext4lazyinit: bg 255: bad block bitmap checksum
EXT4-fs error (device sda1): ext4_validate_block_bitmap:423: comm ext4lazyinit: bg 350: bad block bitmap checksum
EXT4-fs error (device sda1): ext4_validate_block_bitmap:423: comm ext4lazyinit: bg 886: bad block bitmap checksum
...

Here's a different error, from a different drive:

EXT4-fs (sdb1): ext4_check_descriptors: Block bitmap for group 109 overlaps superblock
EXT4-fs (sdb1): group descriptors corrupted!

These are two new drives, fresh out of the box. Running fsck doesn't
help -- the corruption returns almost immediately. Similarly after a
reformat.

I am testing with linux-next-20260529, and the following patches from
the mailing list. OpenSBI, zsbl, EDK2, and fip.bin are all up-to-date.

commit fe7d4d1c81361d02c8156c3989b8b07edebf96bf
Author: Vivian Wang <wangruikang@iscas.ac.cn>
Date:   Mon Mar 9 19:09:38 2026 +0800

    riscv: mm: Define DIRECT_MAP_PHYSMEM_END

commit 8e12c1f0ee16bd901df098d5133a2041a3f5383a
Author: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
Date:   Tue Apr 21 10:31:40 2026 -0400

    riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup

commit d2c0c75176d2c220b7c13ae1dc2ca029d99f42fe
Author: Inochi Amaoto <inochiama@gmail.com>
Date:   Tue Apr 7 07:26:55 2026 +0800

    riscv: dts: sophgo: sg2042: use hex for CPU unit address

commit f582c404b9e034efa5891db6a5a0751a7488659c
Author: Han Gao <gaohan@iscas.ac.cn>
Date:   Wed Apr 1 01:56:58 2026 +0800

    PCI: Add quirk to disable PCIe port services on Sophgo SG2042

commit 6b2339e1faf20f8e819f729fd0b8b94a0169e6d2
Author: Han Gao <gaohan@iscas.ac.cn>
Date:   Wed Apr 1 01:56:57 2026 +0800

    PCI: Add per-device flag to disable native PCIe port services

commit 7e9fc0eb8ecdc96d31af68920b55f1885683ec88
Author: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Date:   Wed Apr 8 00:01:43 2026 +0800

    riscv: dts: sophgo: reduce SG2042 MSI count to 16
