Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2133933B962
	for <sophgo@lists.linux.dev>; Wed, 25 Feb 2026 22:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772058772; cv=none; b=bhdwTOQExAdUsTrlYiNEM7/WRdPj329nmkUIylshamaUErnMP3NqScYILQfg50D0tHzMbwlw9rygP+ibVHFKIpebwT6MoVzNrpLCWMoH4pJeRavVdEQazLZOKYi8jkpLloe/2YXNlOxkrn6ili9AilLaJPqz4Pl1Gh+YvRIx/Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772058772; c=relaxed/simple;
	bh=9Sy6ZGAWwM4BDtYLlDmcNrsetGgvhNaBEJsEbo8uY+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KeVonhJD+ZX6LnnK8UZ18WNQOpG3dP0RbjCmGsGPslEyb7/xwId9guaA1kg4raLeOiDvXfYhuGLb82ZjmEscCF3s8Yz++7ub/j8sGk8YUURlu3e5K/Q81Aaf9/nCIcQewepSW/kzAHxv5zKd2J2kpA9LqFg7PTcG5hN60VFXJmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pd1ACRQW; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pd1ACRQW"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-824c9da9928so139753b3a.3
        for <sophgo@lists.linux.dev>; Wed, 25 Feb 2026 14:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772058769; x=1772663569; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n4i2IRBgsk5p1jTMDi9j/dN7YnnN1etbWBu+Qol+1xk=;
        b=Pd1ACRQW6tdUvjVA1V/74ztLX2ZAmEJBLcvC6l1Ybpel607QrM0cTULiMqqtkZNBxT
         ZV8Mg73hB/POBeHCIRVrSPzF8gZ5qXYKlKsvRSg26wHOYbEuTtBpL8Sop6qSUVSACRVI
         7t4IIaWPKnxASknzv0jIibFBMGngeWFPJGMlj9FbDGYcXd/tnHkE6mjvW0I93wVAbKfu
         vf4FnsL38sbu8teCTMdhCjIVF0E5QWYIp24gUS27670Y0i8Hvq9TjhrlZ+LbsK7hFjna
         Sk6zuK4O02n7lWeiAArebnWuWil2Z1+guEucWZBUHkBcTOFWnmcfaIRrDTkb9e+cT0NV
         EYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772058769; x=1772663569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4i2IRBgsk5p1jTMDi9j/dN7YnnN1etbWBu+Qol+1xk=;
        b=IRyX04OTkD/33Kwb6czTk5FYr7BEnUJ4DatLpI7VQuptFp9K7F6CNv+9iqRtXVGobw
         AKDbOvW6CssiiAMd+XPSKj1hdwSu02JbN4PqMpbZQqDh4Tb3DDSu/pUwWj55zZ0YPyOX
         xzhAIGRGpzNLEJA0KLTAQ8Ux6+OlYTM83ZIMABKx3mvtdV9N6TMQzzMmwoP+CPU1mcGr
         pIGNd2T0N25XfXEQnJ+U/4n76+CJPFqQf8x2T6dP0o9zqtvkRJAIiFSZdeDqrkYgTRcH
         +u3KYZFJm+uVSxX2gUvr5VeVI/NHJU+xtdIFdlmQzELf4gNZGtNzfC/pJvznmgvs0ZcP
         /v+g==
X-Forwarded-Encrypted: i=1; AJvYcCXJ5YyJr9Sa05xMD9g4MynxI1T0uyp2inIO84BVAzwh9VUwqB3FtGH3ZNp6FaTGRlMZJgjdif4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz4LmypXfYjHpH+Eh5YGUN3gVoTXX/rIx58fxrj832r5iT+kVz
	mEduR56i0hVb11QOqzYw3ICOQiZ2sxkn41KfrAM8TVUKHcZKRbEFTTIc
X-Gm-Gg: ATEYQzxxXaNb/xFPnjrAW4I5gn+J6w9Sriu/clUdnt1LrxEad4jn7grNkYOR7cdFzSK
	Ef7iV/8CQvFCb5fXIHCoKf5kEMYO6RaW1qX2inCchWxCLk+mRfalbU7obPuvmSk5Lc5b4okhngb
	a7xGQUm5Y4w0QkPz9zc7oEjwA8+wqHYpHblUVOWeqxiJuBpIyV6t5Q45WryfvHJ2Sl5Tbtk2VYo
	rUzxuh3TZDpntg1GTA7bsn4ZdqpkGClN1lB3thcU6p50UqkNcRLEtRWIcxEyYAZnA5tKCjuUyka
	boE4DKTUsDIUjr1yJImAjiVQ90eYVn6QUg3z0+VaVDQ+oDTyNtwJkVPNd2gSWLw37HRhY8nl1uy
	+kLZv6KVZHcZZjJLZNf5MlozX2Xxp2B5KQJkhSRCdqr5wHc4nDEuApMN1a2uor3EuyD44PhcMrE
	EFZ5jHy8zjnxKjGFxeFEqBrw==
X-Received: by 2002:a05:6a00:6d5a:10b0:827:28db:7a78 with SMTP id d2e1a72fcca58-82728db7ea0mr2323867b3a.17.1772058769463;
        Wed, 25 Feb 2026 14:32:49 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01a9dasm289317b3a.49.2026.02.25.14.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:32:49 -0800 (PST)
Date: Thu, 26 Feb 2026 06:32:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 6/6] riscv: dts: sophgo: dts nodes for i2s tdm modules
Message-ID: <aZ939evsOs6nCd5I@inochi.infowork>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-6-6ef787dc6426@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-6-6ef787dc6426@gmail.com>

On Tue, Jan 20, 2026 at 11:06:08PM +0400, Anton D. Stavinskii wrote:
> Introduced I2S nodes and internal dac and adc nodes as well
> The new header file provided in order to make DMA channel names
> more readable.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv180x-dmamux.h | 57 ++++++++++++++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi     | 55 ++++++++++++++++++++++++++++
>  2 files changed, 112 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h b/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h
> new file mode 100644
> index 000000000000..6314bf6e9dc8
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
> + */
> +
> +#ifndef _SOPHGO_CV18XX_DMAMUX
> +#define _SOPHGO_CV18XX_DMAMUX
> +
> +#define DMA_I2S0_RX		0
> +#define DMA_I2S0_TX		1
> +#define DMA_I2S1_RX		2
> +#define DMA_I2S1_TX		3
> +#define DMA_I2S2_RX		4
> +#define DMA_I2S2_TX		5
> +#define DMA_I2S3_RX		6
> +#define DMA_I2S3_TX		7
> +#define DMA_UART0_RX	8
> +#define DMA_UART0_TX	9
> +#define DMA_UART1_RX	10
> +#define DMA_UART1_TX	11
> +#define DMA_UART2_RX	12
> +#define DMA_UART2_TX	13
> +#define DMA_UART3_RX	14
> +#define DMA_UART3_TX	15
> +#define DMA_SPI0_RX		16
> +#define DMA_SPI0_TX		17
> +#define DMA_SPI1_RX		18
> +#define DMA_SPI1_TX		19
> +#define DMA_SPI2_RX		20
> +#define DMA_SPI2_TX		21
> +#define DMA_SPI3_RX		22
> +#define DMA_SPI3_TX		23
> +#define DMA_I2C0_RX		24
> +#define DMA_I2C0_TX		25
> +#define DMA_I2C1_RX		26
> +#define DMA_I2C1_TX		27
> +#define DMA_I2C2_RX		28
> +#define DMA_I2C2_TX		29
> +#define DMA_I2C3_RX		30
> +#define DMA_I2C3_TX		31
> +#define DMA_I2C4_RX		32
> +#define DMA_I2C4_TX		33
> +#define DMA_TDM0_RX		34
> +#define DMA_TDM0_TX		35
> +#define DMA_TDM1_RX		36
> +#define DMA_AUDSRC		37
> +#define DMA_SPI_NAND	38
> +#define DMA_SPI_NOR		39
> +#define DMA_UART4_RX	40
> +#define DMA_UART4_TX	41
> +#define DMA_SPI_NOR1	42
> +
> +#define DMA_CPU_A53		0
> +#define DMA_CPU_C906_0	1
> +#define DMA_CPU_C906_1	2
> +
> +#endif // _SOPHGO_CV18XX_DMAMUX
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index 06b0ce5a2db7..ebe5e8113939 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include "cv18xx-reset.h"
> +#include "cv180x-dmamux.h"
>  
>  / {
>  	#address-cells = <1>;
> @@ -448,6 +449,60 @@ usb: usb@4340000 {
>  			status = "disabled";
>  		};
>  
> +		i2s0: i2s@4100000 {
> +			compatible = "sophgo,cv1800b-i2s";
> +			reg = <0x04100000 0x1000>;
> +			clocks = <&clk CLK_APB_I2S0>, <&clk CLK_SDMA_AUD0>;
> +			clock-names = "i2s", "mclk";
> +			dmas = <&dmamux DMA_I2S0_RX 1>, <&dmamux DMA_I2S0_TX 1>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};

This magic number 1 is bind to the RISC-V cores, I think we should add a
macro DMA_CPU_ID into CPU file to route the CPU id to real cores.
Or, just let the borad dts configure which dma is enabled.

Regards,
Inochi

> +
> +		i2s1: i2s@4110000 {
> +			compatible = "sophgo,cv1800b-i2s";
> +			reg = <0x04110000 0x1000>;
> +			clocks = <&clk CLK_APB_I2S1>, <&clk CLK_SDMA_AUD1>;
> +			clock-names = "i2s", "mclk";
> +			dmas = <&dmamux DMA_I2S1_RX 1>, <&dmamux DMA_I2S1_TX 1>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
> +		i2s2: i2s@4120000 {
> +			compatible = "sophgo,cv1800b-i2s";
> +			reg = <0x04120000 0x1000>;
> +			clocks = <&clk CLK_APB_I2S2>, <&clk CLK_SDMA_AUD2>;
> +			clock-names = "i2s", "mclk";
> +			dmas = <&dmamux DMA_I2S2_RX 1>, <&dmamux DMA_I2S2_TX 1>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
> +		i2s3: i2s@4130000 {
> +			compatible = "sophgo,cv1800b-i2s";
> +			reg = <0x04130000 0x1000>;
> +			clocks = <&clk CLK_APB_I2S3>, <&clk CLK_SDMA_AUD3>;
> +			clock-names = "i2s", "mclk";
> +			dmas = <&dmamux DMA_I2S3_RX 1>, <&dmamux DMA_I2S3_TX 1>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
> +		int_adc: codec@300a100 {
> +			compatible = "sophgo,cv1800b-sound-adc";
> +			#sound-dai-cells = <0>;
> +			reg = <0x300a100 0x100>;
> +			status = "disabled";
> +		};
> +
> +		int_dac: codec@300a000 {
> +			compatible = "sophgo,cv1800b-sound-dac";
> +			#sound-dai-cells = <0>;
> +			reg = <0x300a000 0x100>;
> +			status = "disabled";
> +		};
> +
>  		rtc@5025000 {
>  			compatible = "sophgo,cv1800b-rtc", "syscon";
>  			reg = <0x5025000 0x2000>;
> 
> -- 
> 2.43.0
> 
