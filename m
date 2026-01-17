Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A4B2FB08C
	for <sophgo@lists.linux.dev>; Sat, 17 Jan 2026 02:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768617344; cv=none; b=emm0CzZLef3W/JNTe2rje7f/7GBFJH8/2mM/W++VvTsTDWwQqNumuM0l0lEwHh+wW2V8LMIKQwS/FuZT7Bl28Rt55VHpWCErXY0cmk2mO+kUDsWbUGMRj2MnZPdhS4US3g20/Qai7XkIWaGd4p8uNbC42TTaw6eYAcZ4ui9+dSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768617344; c=relaxed/simple;
	bh=WnbZ+diR5kVGMAEUJH5qwKXMKHbtB3/wTuJv9BYk9MY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRU207ddBg4QFXARXbtJEHE9qgiK6BFsHKHSzYopHmJV6OrmlokOtTincrTFJz83tODcrMWTfh8gUvOdpSumEtKk89s2OTzzXA7b377KOuxVq6uRcmVcZHd1baHd1F1rRM/DjbzblHpHDlx3kNKF7TnmRgE0g5rvtBdpT33E8IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjUE8qEV; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjUE8qEV"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8887f43b224so50181866d6.1
        for <sophgo@lists.linux.dev>; Fri, 16 Jan 2026 18:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768617338; x=1769222138; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dta8pivS2rued3Q3ChMqGgKi/kS9yYaS8vWr9CkDH7o=;
        b=BjUE8qEVsEt2OvhCjZ1Wy+gezrG9XAM10xzNEly6QjGns+ck8K74iTmwVxU6INS+5s
         mEtEbR5F2rrCPMJRER5REQ985gvgG8Zv5JwHlhTA1Or+eSXoMPMqKWVQdAzXeQE6L2py
         jITIAJAkSeqojWJjHlrqnnqc3W5x4AtK8TMQi1zL1FxhYk+vuDXKt6c9USC8lcCNCi6Q
         i788pzu8U5l5VLihdYPUAQMai2UcepuH87ezA1oXgp0rx73t/kHF6gU7rDojOkTiVaXv
         8lsyMzdnk4klEfQvXKp4KzEyk9wmear2Cw/UmlkZQsSn2GoNR+CNiSM+igRm0843o/cw
         Fj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768617338; x=1769222138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dta8pivS2rued3Q3ChMqGgKi/kS9yYaS8vWr9CkDH7o=;
        b=ni/8LADoClMB5GbYZ0f6/t7z2ipX4T2qaGLFno26DdQPrlIUDE5Hkz2KqmsVuSJDie
         crguxSeTly0tnPrBbqzWLCV5FG0GhVdcWZZN4wNtf/KTp8ElWyhXNZSf1mkpK/1b5qHf
         H9uSlseLtUElW9TvOmlhgw9yq/ZUDVJRGorQWNKGzLctQaLo4eByCXAXc7RxH+ugcUWZ
         v148PK42nbHCI0kHPG5W5dx/vxzMwpk0Z/XGqACMs5mWKpcSS7mGqHxcYSr4XKp9MHnM
         CMH3BKf0vnMNeC6VCW3MHCHLWdwPmA7IiPi7tEjHE08id/treaV9JhKSktT1U65GgLqz
         S8vg==
X-Forwarded-Encrypted: i=1; AJvYcCWdqraK4h/LmjyxW5qbxvZ9W1972Z3bSQZRQKwjG7dPjuNyjQgYyifVwpufENKzPepwa6L4ti8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSb+2RzuOiaPPLSrWKViLnJiEwIyar8y+Q6z1SSucjDcmr90iA
	NloZCi0UK+2dYIp4guBBKJAslGWT7oiq+D4sVoAfXqXuI8Glbk0KZQo02AmXFg0+xDg=
X-Gm-Gg: AY/fxX4JzqxwTxRybpn+5QwyNlQrtMvUUfKdwVqxHPE3hkSY85vz3nsIQQWChqfcbsY
	/MluOra97eiJiLP5b2eOS68+V9+sRAwA1Burw2DJUeRGmEEdA2tAVnSjSid+3WidgkZAKMBpson
	+r+Hv7EWCXTUbj//BLtjPuhpHV0fQVZlLu/0xqttCpkaL0FjbicgXWqeVvjGBk1UMIoxaryeOd9
	nQvDpUOVHjBbRuvvKyEK9E1/EMpGQTEQICtjiKweEaHOModYWsb7fBtEg9k8RPqSZVWo2CFVakF
	A6NvthHp8TUWTS5yXnvXw79caOKs5py6LLhX4TYVdZcpe5PCjAOII6oJd7JTXg4Ry+whDFBSjv4
	adz5/Bf/6j27isbj1sT98zK9/c61hrdupPTn6KHFrqQgLGaLrs7yKB7FV/ImRiMbhNOt/W6Q1rW
	VJyX/V7ZZ6qA==
X-Received: by 2002:a05:7022:4588:b0:123:3bba:fc4c with SMTP id a92af1059eb24-1244b381373mr3575104c88.38.1768609928525;
        Fri, 16 Jan 2026 16:32:08 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad740c5sm5332461c88.8.2026.01.16.16.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:32:08 -0800 (PST)
Date: Sat, 17 Jan 2026 08:32:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Frank Li <Frank.li@nxp.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Longbin Li <looong.bin@gmail.com>, Ze Huang <huangze@whut.edu.cn>, 
	"Anton D . Stavinskii" <stavinsky@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: cv180x: Allow the DMA
 multiplexer to set channel number for DMA controller
Message-ID: <aWrYSw94WjqPrUkK@inochi.infowork>
References: <20251214224601.598358-1-inochiama@gmail.com>
 <20251214224601.598358-4-inochiama@gmail.com>
 <aWpcfqHDFaq8Lsv5@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWpcfqHDFaq8Lsv5@lizhi-Precision-Tower-5810>

On Fri, Jan 16, 2026 at 10:42:54AM -0500, Frank Li wrote:
> On Mon, Dec 15, 2025 at 06:46:00AM +0800, Inochi Amaoto wrote:
> > Change the DMA controller compatible to the sophgo,cv1800b-axi-dma,
> > which supports setting DMA channel number in DMA phandle args.
> 
> 
> Does it need update DMA comsumer?
> 
> Frank


Not needed, this is handle by the dmamux driver, it is allocate and
configure the DMA channel dynamicly.

Regards,
Inochi

> >
> > Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
> > Reported-by: Anton D. Stavinskii <stavinsky@gmail.com>
> > Closes: https://github.com/sophgo/linux/issues/9
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > index 1b2b1969a648..e1b515b46466 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > @@ -417,7 +417,7 @@ sdhci1: mmc@4320000 {
> >  		};
> >
> >  		dmac: dma-controller@4330000 {
> > -			compatible = "snps,axi-dma-1.01a";
> > +			compatible = "sophgo,cv1800b-axi-dma";
> >  			reg = <0x04330000 0x1000>;
> >  			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
> >  			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
> > --
> > 2.52.0
> >
