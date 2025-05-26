Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEBA16419
	for <sophgo@lists.linux.dev>; Mon, 26 May 2025 22:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748299738; cv=none; b=gfVC0IFZB1vli0YWWdIOn6wzA08hX12xcWnRydm/EN07wbiW61qrUSfY09v3/LACKL8xkTNgGeeummIqxhgtmVflmIUGjBrTELI6ybvEvNS2cKQXUirLyyI8wXB0RcFJcWbTUtGmoLH9BkzHqag7dwR2AFRFW5uX43mf1RPMSP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748299738; c=relaxed/simple;
	bh=uolzGkj7lS4cxGcaNey6Eo8aZi3ZI/PC2nzy7WLFnLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOg6o20M1vI7QBDKAUU3d9nnKfioGxmVHFlYTWSn6rFCo9Kx+vbzUfGdBkG+22vH453Wc6V/VWyFAAMusNpaUuvoeDUJD/mqzYm6Zn2eflahEx9zK80UjvrdKITgUIdeWotngGZe1yniGdE52V1KxY0B5LIujqgzCL7gWs4u7ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBblu0nT; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBblu0nT"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c559b3eb0bso147187785a.1
        for <sophgo@lists.linux.dev>; Mon, 26 May 2025 15:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748299735; x=1748904535; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DxU+IS3NoOt3HdLFHXPgdhqzIwbodDbspZNewqvS2bY=;
        b=NBblu0nTA7rtRL9V58aACFJbnE63QIlbe0vBhc90cCRFuo6eSXUZCmvUpu7o5qzANT
         Ud8uRvTgni8Xickc8/YuwjgIBK5evTt0x+YtsFSYZoAzrGgMrpfOj48S4FbA4T3VbX/v
         mIk5wGE1m7xEOkp2PXYruU5T6oSmeCR8Hz2W9iJ6N2VE631YWIO/bYt4ekYHF6O+SU6y
         jQPCOa7fdVpCFk0Zszo6jTLYnWl1mKBtHFx/YXACPDndXxnbbe7y/Zy0uqCCcrY++6So
         I/SRM4L+0IwpQUCjbY9nTRe+PuaQlAF2mF1PU5DpPdSY9+Vh5L5TkgqaqRipkKL+PzAe
         FukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748299735; x=1748904535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxU+IS3NoOt3HdLFHXPgdhqzIwbodDbspZNewqvS2bY=;
        b=Gp2WQmvmiT8+yxP7koCdi8G2YqqByH5cPxQYY03mI9CjEoasosOKEdyDz3iJid9WKm
         FIw0xoNwiRluHw8pVBM31V00c3/3Rwcnsc4N8ZrKCM/1LZ99V5z6+qu/XdcmghUJuMxC
         nApDatpWemSlWQtRCyENzeQaelc1sDMa/jAIczXbeTgdpHoIFahlsSimnvL73wgPGncP
         NyVkff+F/iTgNM+LEL1h/moT2H9AmKj6850Q8+BLNL9lt8VTuJNYAPJv+p3S2MZtYIzY
         oXuMec18b/JB02BPWWe/oIFYfbbxwkyNzD6OFPX5JcGstRdnwSIXyctoY8nK/KRvGuUp
         qWXg==
X-Forwarded-Encrypted: i=1; AJvYcCVMSTA6ZNcESxMlQQGZE7K8HPEpFF5pj5Kwowg00y37Okiqo2lZ0BeYNvCTBwjFl5jZHDVnrYw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQw6ULFAC8ZCcAiAgIpU93M/rr1SX7+yKPZufmwn5HCSXyW4Fm
	WPbLkUW0x4vO4oVcZLp7M9x/GS67dDXnFFzAx1CK+02+LaU7bpwqvh6T6qzHWknF
X-Gm-Gg: ASbGnctBqPyYKiCztuHZ2C455VDqeadxKdCrd3Rb32qJEOHemcbUVmKXrczMK3BvUC1
	809owN5ivrs4KH9aErJAhuEdCqUx0H7MkX+pfk1CBueeEV88/Ah756J3GbhJC4yfn+7iMFKLcRr
	BGTzUCVSrHLlomyNMCsRQvwhuLl7E1D7WTct1NYta68H1d0juQE0v8nJEmrJ/3vWeX9lOHLxny9
	rhWMcE8bjUj2R8sBkhutwYaUm2S6W4EXRHgCQbdvP8fshNIRi9C4+KrSBgWCJkDB90013GdkTnV
	hlt+Gxnj0vM2rrLLAPBqrG0hPME=
X-Google-Smtp-Source: AGHT+IGb426KXAna7tUbXhwL2CIur79DWxmDcI/E5an7rbk9SRJUL7gdvaP3a93TzMAL6SvIIh8Q5w==
X-Received: by 2002:ad4:4ea2:0:b0:6f5:41b8:47ed with SMTP id 6a1803df08f44-6fa9ce38689mr191223316d6.0.1748299735279;
        Mon, 26 May 2025 15:48:55 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6faa050c0b8sm36106276d6.74.2025.05.26.15.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 15:48:54 -0700 (PDT)
Date: Tue, 27 May 2025 06:48:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
Message-ID: <ykswyhohgty646c5s7pow46dn5gjvgvpq7vq46kbh2gf2f5hub@xabjhqv7pzfn>
References: <20250513203128.620731-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513203128.620731-1-alexander.sverdlin@gmail.com>

On Tue, May 13, 2025 at 10:31:25PM +0200, Alexander Sverdlin wrote:
> Add the RTCSYS MFD node: in Cvitek CV18xx and its successors RTC Subsystem
> is quite advanced and provides SoC power management functions as well.
> 
> The SoC family also contains DW8051 block (Intel 8051 compatible CPU core)
> and an associated SRAM. The corresponding control registers are mapped into
> RTCSYS address space as well.
> 
> Link: https://github.com/sophgo/sophgo-doc/tree/main/SG200X/TRM
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

I am happy to see the rtc driver is merged. So I will queue this
patch for the next rc1. If you need a rebase, please let me know.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index ed06c3609fb2..280c45bd3b3d 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -307,5 +307,17 @@ dmac: dma-controller@4330000 {
>  			snps,data-width = <2>;
>  			status = "disabled";
>  		};
> +
> +		rtc@5025000 {
> +			compatible = "sophgo,cv1800b-rtc", "syscon";
> +			reg = <0x5025000 0x2000>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(1) IRQ_TYPE_LEVEL_HIGH>,
> +				     <SOC_PERIPHERAL_IRQ(2) IRQ_TYPE_LEVEL_HIGH>,
> +				     <SOC_PERIPHERAL_IRQ(3) IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "alarm", "longpress", "vbat";
> +			clocks = <&clk CLK_RTC_25M>,
> +				 <&clk CLK_SRC_RTC_SYS_0>;
> +			clock-names = "rtc", "mcu";
> +		};
>  	};
>  };
> -- 
> 2.49.0
> 
