Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE57D2EAB99
	for <sophgo@lists.linux.dev>; Wed, 26 Nov 2025 22:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764195845; cv=none; b=Uv7EeSG/e3Job6fMLM4+SESmZN3WPR9xDRgPO5VbbHF/E1vIqMFyfoNTnjfDf5xthGuXhggdWuyTWrqELplyY2W18YcsFjNI9ILIU3Z3tBMdOSA7LJWZzHBDrxNYhu6+CFz9kJc7QcZ5/HtK9jGryOr/9dAhYzCIFKtuj76EDo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764195845; c=relaxed/simple;
	bh=tj2DSsgX/0WGrBP881V3uUX+/SGSqokxbP5df1Yh5lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0dfJvXyu2X5fSjjikm591ySKLp2C/a5Q6ed1+pYALcS+IQp9MsR7S2caD/MZIVCirYquD61Mfdp+Nq1cTsoe9I53E5NLc4JG4+emhULjF/qoc6EOt0BW4M7tbGalhnMke3LCZKCf9a4X1GZnrSBZdlJOQTjnWEwF+mEBPJ8HU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjTKJddt; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjTKJddt"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b99bfb451e5so182499a12.2
        for <sophgo@lists.linux.dev>; Wed, 26 Nov 2025 14:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764195843; x=1764800643; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BZOu5aEyKENky2c9G/LxIdAHXqDSwAK1EmrizLVcA3A=;
        b=cjTKJddt23uSvlwgaE4J/Lq7HcAU003tajMCXMjCTF1g0RPFd3nTns84BAuSVwaYoh
         r9xU0o3OYRJi+1jJg6qQW4Jo/ys11Hf6B9FkXm/uGvMtCxfuIEGaQdvaP/2qGVJpCRam
         ani1gDJt3TThhBSUVAi0ICcVNcodyEHWEdbCuCZWCTuo1U5UqKr7eDqy09dK+3WUeCNw
         eHnfaWYxmCUcEs2ynOygkMycTcInUys6HCEyVYJcd966dfCPnfSGZ2SFfmzOSv56nfBF
         YFdQ1f65D7biHXjG0V6f153AATFzZKxx45FiGdHTfN0l83eTTdcRn1rWPBe6SGKLc2pY
         Esjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764195843; x=1764800643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZOu5aEyKENky2c9G/LxIdAHXqDSwAK1EmrizLVcA3A=;
        b=Fe2uz2LEPrq4vdP+xi3p6ehFuv0QWyoei15UQyzIElhFPLNzw4BaOqbTKhUyuEiEFn
         KaXUeVibInXteekiy/g+tSIgy0BpeypLeuac37PiqZ2YAbcLmN3sPV2dDDJG4ncVtABj
         947vkyVwGqQYIetng6AJXFJjNotcQYCzfAGQe6sqF8l+pwFLWO16dV/Sp04xirsoAVV5
         6nTt1MMWkZNCfElWLJ6qzBdC32hdF/FUB06z9YEE6ec+tjxVSQe1iRrIQ9cNxkkFTY9z
         1DVfWhoqgXxcUtQ3zotB1SX9offT0A0HrWKFK4R9IPXfyNlUr4fI3uCO2lGtC3N+zo24
         ofEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOxVDS4s9+mqJOL5mgIlGgDBjAh7Ubrw3XFe6kowBhDstntPRGXG9V+JPHvNknT8w63XuU/TI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb30e5sopx3EZfIoc+sRikc0Z2a6XnLaV+xcvmB8ivt1DDnhJK
	1dw5NwGehLCQWLroA06Tj85WTHucQeguRgRoUi8npTyN9Od21knGm30vHM9UuirN
X-Gm-Gg: ASbGncujGj6bkUUa91zzUKVe1Gh7dLnYrwPMyDFQz+YbuQf5qDv7qgvsfij5TDIsWMx
	jgDjg5aC/+kDCylWFCZO7UtFMSywOZb02tl+suPyBNXmQYXbHHKs4bKT7YMc0/Dh8FKJAY/1J9G
	B9EhsDxgsLzvoJO3TjWjYnUu5Xhy1KKguDRxrcEhLXdQxWeVjsJRnb0hABP2zGa2Mo4mBTlDGPc
	kmCq5z46oQ0d/lPLnKNEshQ3T2V2I+b7GBJ2CNbQGElU35OKP0+FdPbr0ZhOAkr2JWK8Xi50UWd
	L/A/dKIhbcddxLinrSjVSz6AQTD0QE4qjw/u4i9f0q3sAAiE3TQEjVMB51/zpPjJ3/so8L5CA6l
	ba+TtkjGS8uES0gPZoFaVl2808Z81Ejmp5hziX6FuEQ1fvSxJUuBt3p39gusLglO4o7tvimpZsl
	YfgkDzlu/QAQ==
X-Google-Smtp-Source: AGHT+IGsvWka9Dm9jnaO3xye2c/MAvR38kBdVohFIuX1a8i2UEEMWVrspUwb2b/Cg5A4pKC1TEkD5w==
X-Received: by 2002:a05:7022:ec85:b0:11a:61df:252a with SMTP id a92af1059eb24-11cb3ecc587mr5507782c88.6.1764195842702;
        Wed, 26 Nov 2025 14:24:02 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e5674csm99352914c88.8.2025.11.26.14.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 14:24:02 -0800 (PST)
Date: Thu, 27 Nov 2025 06:23:22 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>, inochiama@gmail.com
Cc: alex@ghiti.fr, alexander.sverdlin@gmail.com, aou@eecs.berkeley.edu, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, dlan@gentoo.org, huangze@whut.edu.cn, 
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	looong.bin@gmail.com, palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, 
	sophgo@lists.linux.dev, thomas.bonnefille@bootlin.com, unicorn_wang@outlook.com, 
	yu.yuan@sjtu.edu.cn
Subject: Re: [PATCH] riscv: dts: sophgo: cv180x: fix USB dwc2 FIFO sizes
Message-ID: <iwp4jewumabd2niwhsvml4p7kfouptirdk6wxv37ejuqyipmr2@p24wd3pv7iub>
References: <20250611082452.1218817-4-inochiama@gmail.com>
 <20251126172115.1894190-2-stavinsky@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126172115.1894190-2-stavinsky@gmail.com>

On Wed, Nov 26, 2025 at 09:21:16PM +0400, Anton D. Stavinskii wrote:
> I've tested the current dwc2 FIFO configuration and found that USB
> device mode breaks in ECM mode when transmitting frames larger than
> 128 bytes. For example, large ICMP packets or iperf3 traffic cause
> the USB link to hang and eventually disconnect without any messages in
> dmesg.
> 
> After switching to more conservative FIFO sizes, ECM becomes stable
> and no longer drops the connection. iperf3 now shows ~130 Mbit/s RX
> and ~100 Mbit/s TX on SG2002 (MilkV Duo 256M).
> 
> Fix the FIFO sizes accordingly.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index 1b2b1969a648..06b0ce5a2db7 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -438,8 +438,8 @@ usb: usb@4340000 {
>  			clocks = <&clk CLK_AXI4_USB>, <&clk CLK_APB_USB>;
>  			clock-names = "otg", "utmi";
>  			g-np-tx-fifo-size = <32>;
> -			g-rx-fifo-size = <536>;
> -			g-tx-fifo-size = <768 512 512 384 128 128>;
> +			g-rx-fifo-size = <1536>;
> +			g-tx-fifo-size = <128 128 64 64 64 64 32 32>;
>  			interrupts = <SOC_PERIPHERAL_IRQ(14) IRQ_TYPE_LEVEL_HIGH>;
>  			phys = <&usbphy>;
>  			phy-names = "usb2-phy";
> -- 
> 2.43.0
> 

Please add a fix tag next time, I will add it by myself this time,
otherwise LGTM.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Fixes: e307248a3c2d ("riscv: dts: sophgo: Add USB support for cv18xx")

Regards,
Inochi
