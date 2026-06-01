Received: from mail2.viabit.com (mail2.viabit.com [65.246.80.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EAA3C1F
	for <sophgo@lists.linux.dev>; Mon,  1 Jun 2026 06:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.246.80.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296461; cv=none; b=amfDgvdCdCIdoft96HT20MKHNVrYzxkpO6U+MhBPGUzErzXTrGu8+2blPB+pC+gQOYDHgj28eKWve2pPa/TGajiRbtSUXeJEkucOVuPLHUuczTtBLRVC68uR0R5NqPMb1JPmbWxKIOi1e6vUH02zuBG8DdihFJs9HF3CvrR5qAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296461; c=relaxed/simple;
	bh=MfHClQgOQIpIIZciJg8kGuQ8UxW1tojlfs9GhKvR3cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbcIggxnD8aYT1nx+FyAAifxlXl4G83ucWbkIvGT3Qu70La7JPKa/VDiecR2JexiWjujFl0/kgxkxOYEHmWjzX+EFgU7lxwQjQV0QSTcdPMTpBGHOCT2rfNlMRF86omEfWes0Q6wGoYM+bL8Zk0aDTbNc4t3KA+guRELjitjHdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com; spf=pass smtp.mailfrom=orlitzky.com; dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b=HvQEXNbw; arc=none smtp.client-ip=65.246.80.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b="HvQEXNbw"
Received: from mertle.michael.orlitzky.com (vpn1.metro-data.com [65.213.236.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.viabit.com (Postfix) with ESMTPSA id 4gTPfC5Zxmz40d0;
	Mon, 01 Jun 2026 02:47:31 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=orlitzky.com; s=mail2;
	t=1780296452; bh=MfHClQgOQIpIIZciJg8kGuQ8UxW1tojlfs9GhKvR3cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HvQEXNbwmLr95tWN3GUIATJXCU39LBudYMcQ7Rmfnid3h+t44dSqMVpVjn5bHZDBT
	 qZ/AymE8vZp3OIif+UDjlXltISXeAldUQUrOfqT+EPy9yC/ibg1R80S107x0Xt8ZVL
	 fPnXKZsxnMbqOEyZbx5vjcUPcCcRYcZ4DvwR5zIA=
Received: by mertle.michael.orlitzky.com (Postfix, from userid 1000)
	id 1A4EF12C349D; Mon, 01 Jun 2026 02:47:31 -0400 (EDT)
Date: Mon, 1 Jun 2026 02:47:31 -0400
From: Michael Orlitzky <michael@orlitzky.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: sophgo@lists.linux.dev, Han Gao <rabenda.cn@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: SG2042 SATA (DMA?) issues
Message-ID: <ah0rA-c34RLkHWYt@mertle>
References: <ahu57vcS0oOFmCI9@mertle>
 <ahxOMJqJTqKfY9SI@mertle>
 <MA5PR01MB125002F8416D3FC82656A5262FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <ahzs8MSmNU7_vsIT@mertle>
 <MA5PR01MB12500AE1ED1AD25C00C4BA706FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MA5PR01MB12500AE1ED1AD25C00C4BA706FE152@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>

On 2026-06-01 14:06:29, Chen Wang wrote:
> >
> >    * SRA1-20.fd (20251209)
> >    * fip.bin (20251209, from the bootloader-riscv repo)
> >    * fw_dynamic.bin (20251106)
> >    * zsbl.bin (20251215)
> >    * mango-milkv-pioneer.dtb (20251215)
>
> Are these firmware components correspond to the https://github.com/sophgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7893937183165af36?

The dates listed above are before any dma-coherent patches. This set
of firmware files is OK, no filesystem corruption.


> Just want to double-confirm if we use
> https://github.com/sophgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7893937183165af36
> plus the dts dma-coherenet patch, how the SATA works?

The older firmware, without the patch, works. It is the newer firmware
(plus the dma-coherent patch) that appears to cause the problem.
