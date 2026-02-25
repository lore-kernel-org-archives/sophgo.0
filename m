Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7644632937A
	for <sophgo@lists.linux.dev>; Wed, 25 Feb 2026 22:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772058032; cv=none; b=dWWZuNXtYmSod69CN3giGKsjEhfbA1nBTm9C0o9jPtN/BYva+/t0LZyqMzsZvRQFRLeyfH/MKvUFBoo3iV9dG65zB29YcmMDeR/RZ5Zb9M9Ig3DrejRRr8MdqFksIo9+OC7RXSxv9lKq3U92+gp8JRRFu2UaoVWMIOS3n6iVGxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772058032; c=relaxed/simple;
	bh=N2g4ZoqMWVGUlpBgsv7+PSNbpQ7Er9/ae4GSUKSze4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3UXWQ/u6xQ6Wsjw8LP6rc+zuz9iUrV5AnIeGyx2dhVY/dqdYHBoG9AJN6Ia+IW1bfHtySa/LWGxv3yji426hgDSLEWWe5RXfmz2YMs/3foExbps/o04YAGyi+/Cff6RO2XQPegV3Yc7rNdh32EZiZM3/0uE4tuuK13v5hqAvQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPVRsMEo; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPVRsMEo"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-824ba8f0acaso118449b3a.1
        for <sophgo@lists.linux.dev>; Wed, 25 Feb 2026 14:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772058027; x=1772662827; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F50crxFeK9XeDJJq/qBM5+VtsXIjYPfgaWG7L+GSg6s=;
        b=BPVRsMEowGXJ2WicCuBQHBb2o+9shTHMPf8msl9xaFqgmwbZZgeC9oHCZgS/vQiFs/
         oqWNiv16p0iVheU47bje285Sa+E9jWxbkbcPVmKY10DK206FI3KxBYaWip9pFOXTG3CR
         jbNZPgA7l+BrXJM3odBaKpVkRSkCvoep1SlfLAzrL8KZf2irmjoL7W8ffgIGMAWv7gls
         IIjMmEBGa4NordXzIKPiVHv9uKfMQ5s4yRKoHeWlnYW7NVmkga9mCA0yP5UsK+Qgncfb
         Wn3V3Zfcbj0Zl8TxytUp1rLeFWlMgHPuHeN/zo09JmLbjqeMK3A9lfN+JfCLFl9N70yR
         rOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772058027; x=1772662827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F50crxFeK9XeDJJq/qBM5+VtsXIjYPfgaWG7L+GSg6s=;
        b=TXOvC4k1l8XwkOi/1V2eLUZIoFwdAn8O1b/HfqPpRUuucneTrX/WrlkVcUD6AlPf4o
         9mhQT19UO3PWmO84i1sPhlyrSKsZujukmQZVQ6ZAjPd3OaGktTT+V9cbMg8WR2GqF24u
         P6WBDVwpJcXZiXRR5M2KLM6arZLCFMHZ6KEI/Uz1jeWe9gJJzkqlAx1jeV0AkaFXKmWR
         km22ajD/+TP5svlfebMullHncuFbScVBxwG+aLjIgP5Oah3JBtCs/IbycpRQe1As0cMv
         QCeyGc527YdAaeskg5C7iPUUYs/GYvcoucwgYmtdQBABo1fcQiXQtgSAgN1er8W0VdQe
         WzAg==
X-Forwarded-Encrypted: i=1; AJvYcCUMgI8OPgI2WYg94otVI2jVDle317NMMACok+b566wN+cS0wsZBQAl4GOgKv7e5TRswfsWWq+s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+zfNa2og27Dfl3RuAg1pSKJM8Zk8xx/jzkGlpzrkcleKxjz6z
	XOP8LpHgl0ME7FyelW697rudM6+b1zPE7cyfK27Hy7rBWMykCfD4JEIY
X-Gm-Gg: ATEYQzz7tp4A099ZYoKJz4UjPAeYp51fkH7Ssrk0kvppI6pxEvJgBKM1Sn4stXjHnZr
	uxDkVyePwk9xkKRz/4YHYHTrYxlQM2KT1TJb6ycfZ8SklSl1ZIpsh5qiNkVZvkgLBE8TjzBtBZ2
	nQLLqYo3F2yOWXTH44qj0vvoCILhKUDqtABEIU58i9fejSZ9tJ9zm7nEX09xkk77EFnSzvAg7z2
	Dffoiazt+/6HIn9z3ZG5BmEF1xcCkou0Lx1oC0OIlFDMofr5psC2VBC9yrdHM+hvjDFXbxDWN2g
	CLtUC3xwp4V477DXYWZLWreEK63wd5GszQFDM4SAxvpYhc0me7ThhE+yT7HUKTx3MZN1kUH2iVz
	CCzyuZ4eX2hEdnhV1cb7qyNOiAxK6r4EMnhbStwtd58+5AKnJ3iozQs/FLp/rUbNbLRTCIN7Kmx
	uWD+kCIInhKX4V5vjeZNTjvA==
X-Received: by 2002:a05:6a20:6a05:b0:394:8455:d1aa with SMTP id adf61e73a8af0-39545ed55eamr16074081637.25.1772058026470;
        Wed, 25 Feb 2026 14:20:26 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359037afe31sm3693376a91.16.2026.02.25.14.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:20:26 -0800 (PST)
Date: Thu, 26 Feb 2026 06:20:03 +0800
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
Message-ID: <aZ91NjoJLr--BEmZ@inochi.infowork>
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

Hi, Anton,

Can you send a new version with the all device nodes sorted by address?
So I can take them, Thanks.

Regards,
Inochi

>  		rtc@5025000 {
>  			compatible = "sophgo,cv1800b-rtc", "syscon";
>  			reg = <0x5025000 0x2000>;
> 
> -- 
> 2.43.0
> 
