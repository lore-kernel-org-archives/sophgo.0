Received: from mail2.viabit.com (mail2.viabit.com [65.246.80.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD5919CC0C
	for <sophgo@lists.linux.dev>; Sun, 31 May 2026 15:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.246.80.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780239924; cv=none; b=UtKFVQ3D8pDw1QBI1uVByi/Td6bWnRHiCrUgvWLzURrVfW4cwzyLLHLw5r6jOAZJCMGW2oKJdhygjEpMFmKH+Tq4bBN26HXBVsVPvqQ7MhWaLvfvfY7PxnUvGUFcuT6cjNnW+JMSN5r1DuqYivyDDmXQTzD+xVaC/4pcHZ2pCVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780239924; c=relaxed/simple;
	bh=2M/tTSPFLqMORzT5l+fsikjERMsz7VbQAs1j+hPf/ws=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hsvyl1ZUuiVBnpmrut8mh8K4kkWWBC71daHVFsyYiPVntjD+ZNO9OdXebXfY0D62mjKHuW3guKaMNFu6Frk7UD/KCMOq31EzhXLiWey0x+a5uSmmj+1uCm26rKbRWsV18EOxs6+zldewxJtYNiuZJ4yjbsoxt85wDLY/2wysjVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com; spf=pass smtp.mailfrom=orlitzky.com; dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b=hAmQCmkF; arc=none smtp.client-ip=65.246.80.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b="hAmQCmkF"
Received: from mertle.michael.orlitzky.com (vpn1.metro-data.com [65.213.236.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.viabit.com (Postfix) with ESMTPSA id 4gT0l472Pyz40VF
	for <sophgo@lists.linux.dev>; Sun, 31 May 2026 11:05:20 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=orlitzky.com; s=mail2;
	t=1780239921; bh=2M/tTSPFLqMORzT5l+fsikjERMsz7VbQAs1j+hPf/ws=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=hAmQCmkFAUwivdotXxyMm0majHdrLMjc90skUibvB3W7AGlUQI1a7q2wsOYDrWuvK
	 SMDhVXJ+QIhcEZcYY6ZhEAX6Ggc0oOFE1CvYl9OLLXNfXkV8s7AGU7aTLup9sqfZcL
	 0nPjtMaXxrLerdNn2aWgGsZSmDL+nMu/m9K5whZs=
Received: by mertle.michael.orlitzky.com (Postfix, from userid 1000)
	id 215BB12C0BDB; Sun, 31 May 2026 11:05:20 -0400 (EDT)
Date: Sun, 31 May 2026 11:05:20 -0400
From: Michael Orlitzky <michael@orlitzky.com>
To: sophgo@lists.linux.dev
Subject: Re: SG2042 SATA (DMA?) issues
Message-ID: <ahxOMJqJTqKfY9SI@mertle>
References: <ahu57vcS0oOFmCI9@mertle>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ahu57vcS0oOFmCI9@mertle>

On 2026-05-31 00:32:46, Michael Orlitzky wrote:
> Has anyone tried the recent SG2042 firmware and DMA coherence
> patches with the onboard SATA? ... I am testing with
> linux-next-20260529, and the following patches from the mailing
> list. OpenSBI, zsbl, EDK2, and fip.bin are all up-to-date.

Just to confirm, downgrading the firmware (zsbl, edk2, fip.bin) to
snapshots from December 2025 and reverting the dma-coherent dts
changes (e728a57834d) does fix the issue. It looks like something may
be seriously wrong, be careful if you have anything important on a
SATA drive.
