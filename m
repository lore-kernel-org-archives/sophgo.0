Received: from mail2.viabit.com (mail2.viabit.com [65.246.80.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F18126C03
	for <sophgo@lists.linux.dev>; Mon,  1 Jun 2026 02:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.246.80.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780280566; cv=none; b=UuwSGpYDbfsBEWg0q/6oMTj9ntxT8/HJ6on/APIPEjAHzP+ifQE7OZOVN1pYGBO/TE9tMRg5qHgfsTZddcb2v5w1fW3QXbmJx2C1U4QtpCzaFtVEICFp1ANmSW7wgoCWBVoE56tvuX1UauHKldCgO5LxFl6Y4ascyBIwnP4JiME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780280566; c=relaxed/simple;
	bh=4gBvB7APdHp9Z0as8JZigWPFZlaFV6XnB/Dz41TN/NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzUmPjfENvgjrBdrlV68UrbnRsfbOxfk4LOwA0+5rC2AdDZHBEBCo4lf7f0MpzXmDlKZThPeiuJoHJ9MXRQd5CibKP5qj1Pm2oMcmyaLhGu69KTRnXNlC6WuGQhKAcT4JOQg40SP4QTRQiRS1STDg5IgFnhAsTwCXNPUnivl0S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com; spf=pass smtp.mailfrom=orlitzky.com; dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b=MwNHZsdp; arc=none smtp.client-ip=65.246.80.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b="MwNHZsdp"
Received: from mertle.michael.orlitzky.com (vpn1.metro-data.com [65.213.236.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.viabit.com (Postfix) with ESMTPSA id 4gTHmd2kmQz3ybP;
	Sun, 31 May 2026 22:22:41 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=orlitzky.com; s=mail2;
	t=1780280562; bh=4gBvB7APdHp9Z0as8JZigWPFZlaFV6XnB/Dz41TN/NU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MwNHZsdpfg448m2QcrKzPlOQLdK6jO8FvFT6MEzfKgmDRJQkek43KqJKHQ6ow4RUF
	 nqI//F5+yQrGnQMFY8nRfgZ+q0+ViMV7596xk3pYRHD9XgJME5WsIDlNWu9KwRFL8H
	 NBy5ih60rsVyl4czJshJsDVkbHepU6Y7/0Gcjzzo=
Received: by mertle.michael.orlitzky.com (Postfix, from userid 1000)
	id A161512C0BDB; Sun, 31 May 2026 22:22:40 -0400 (EDT)
Date: Sun, 31 May 2026 22:22:40 -0400
From: Michael Orlitzky <michael@orlitzky.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: sophgo@lists.linux.dev, Han Gao <rabenda.cn@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: SG2042 SATA (DMA?) issues
Message-ID: <ahzs8MSmNU7_vsIT@mertle>
References: <ahu57vcS0oOFmCI9@mertle>
 <ahxOMJqJTqKfY9SI@mertle>
 <MA5PR01MB125002F8416D3FC82656A5262FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MA5PR01MB125002F8416D3FC82656A5262FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>

On 2026-06-01 08:31:21, Chen Wang wrote:
> 
> Changes related to DMA can be referred to at 
> https://lore.kernel.org/linux-riscv/20260331171248.973014-1-gaohan@iscas.ac.cn/
> 
> Hi Michael,
> 
> please confirm whether you have updated the firmware mentioned in the 
> patch email. If there are still issues after updating the firmware, this 
> patch may need to be reassessed.

Yes, I have git checkouts of

  * edk2-non-osi.git
  * edk2-platforms.git
  * edk2.git
  * opensbi.git
  * zsbl.git

from github.com/sophgo and am using the sg2042-dev branch where
applicable. The problem occurs with fip.bin from,

  commit b379b0674328be40c9811032193014195944c664
  Author: Chao Wei <chao.wei@sophgo.com>
  Date:   Mon Mar 30 21:27:39 2026 +0800

    SG2042/Boot: Update fip.bin

    SG2042: Disable PCIe write reorder on single chip

which is one commit ahead of the one linked by Han Gao. All other
firmware components are at their most recent commits.

The SATA drives had been working for over a year without issue. The
first occurrence of the problem in my kernel logs is immediately after
a kernel/firmware update, so to confirm, I looked through the git logs
and reverted each firmware component to an earlier commit:

  * SRA1-20.fd (20251209)
  * fip.bin (20251209, from the bootloader-riscv repo)
  * fw_dynamic.bin (20251106)
  * zsbl.bin (20251215)
  * mango-milkv-pioneer.dtb (20251215)

and of course, I reverted the kernel patch that adds dma-coherent to
the dts, and replaced sg2042-milkv-pioneer.dtb.

This seems to fix the problem: I mounted and unmounted, copied to and
from, both partions for a few minutes without error. (I get an
unrelated kernel panic in amdgpu_irq.c with this firmware/kernel, but
was able to test over SSH after removing the GPU).
