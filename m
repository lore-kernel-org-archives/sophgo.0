Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8521732B10D
	for <sophgo@lists.linux.dev>; Thu,  2 Jul 2026 03:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782963523; cv=none; b=fVvOzTWwykp8jfnRttveuVRxo4WOyiWvkszeLp9DdQ5GEHX4OrmOJu4qEV1wQL0+mVvsBgL9CTFNTj4eIQRpsE27Ux1X5q/vghK9HZ2gqfWM3mEAYgYEaWFrqqYEtpByGKcjb0btKQExleMn/KcGSD2GLSR/O4H6OdkDDPCMh2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782963523; c=relaxed/simple;
	bh=KzWBJrt0LTfwXDmdDpphpR4xZvwOIhGKBcmFfnwRM04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxnrz0NhhU0MZ5UPuGCc/6ZAf9HjMuPD8WgP63So6A7VNDvL4sQwYaayY0YIgzjCXJvgXM8lwEdK2cDPyDdCLix58xsD2Fdzmv0QLV73XA8mN/N/Us1NiljyixZhoms2K/XABpQuVnDSPJIa7XXC+d4fi3M1wcnmnzpplt0MbZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cymHqsWS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cymHqsWS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso1058731a91.2
        for <sophgo@lists.linux.dev>; Wed, 01 Jul 2026 20:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782963519; x=1783568319; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=avurPdrjTdWxBa40lvn4lDnsj5ihohdyVToiWVzOQRs=;
        b=cymHqsWSzjGSk9Ups5P4RyFGmPAeEsDMO09SGp9vLsfRGm5nioN9OEJ+gt7KOjWak7
         hY7xwBrJjoiYXqnGRqbMSV58pDASgEyC4c1I2YopzqDysN15dG2ZawtiHxELSplBYPn5
         IGHOWLP1NgUXl3haIk9ubgmxJ6cktLRWVlxnh+YHulAngFeQ33Xrz9j3t9Uki+Wruwnt
         EV3aN4H5h/NaRbtCjX/EFFUqU2A1kzMxn2E+lszDxg9o3zHFR05wn0eV+5ujwSvylWQq
         Cfj6czluhbN0P0aZ27tdpprUtNU+vLQQE+rtOd+RIqctyc9voORvGLTz3STRMmgAxiJL
         25Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782963519; x=1783568319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avurPdrjTdWxBa40lvn4lDnsj5ihohdyVToiWVzOQRs=;
        b=XPDK9VMFq0Q93qbgEOHDCOUPgF67YjFqN+r69tIjuU+YtLkSPwD8h0wBZi9FvWVYTw
         mgZiRT24tk6qcsSEGwliXBxkHDekv26IDE2r7ZKHKQCsOm6AHaJKvgI/wVBmVXn7wXK8
         ZQYfiEkxFJ8egxNdFLGuWk63+YWsATxw5oDsIqfS1m8ugBF3qAEbkc42yOb20GNRlkNG
         OWgoysHi5OXXTGJ0Y4eSs8kr7n+jTG2oUsPUL613WXqytZsTRc+udkmi97g6I1GRBcVL
         f6gH3VTv9+23L9qwBgHopbKMuBHdZelIfe37AY4Jl1vAAQTnVG34GWoTJC8K31RjBYPL
         b6FQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmINAj3BqKPMBn3ZkTX7tJ2qi8x4SWmygpnScWC4Jf3ZYov0bq9BFoKsXW73rKQ5/1zZZcSRQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn0Udp97sjl0x21JFZPLidXojQMvyjN21Oilg+Ok6yWdogMtUD
	cDKA6PHKxcMstCIngO/4OBaYpzfBNJhVwtImYU8DBcJHcoTcHQp3+j65
X-Gm-Gg: AfdE7cnAYB/1LIjrCvY2L7Sn1qOc6myQKkNzC7AciZHk3tCOmJMxjgbv2pew4W5gumN
	8QodCM8hmX62BBN3DmtITtTMYRotzKcO+8Iji0vOnO2IEsM4PPK/csrN1FthrvJ8FW8MfhQLoj5
	89okwU/wy7P/6H01C5JbaVqudCbEaW1mxV65hR5Q/l18MYAq+113Y7uq1uKavh9vZJa6YSEa4H6
	6DUhXZNqPSopUE6Op91KnnyPkrTlHS7Me5J+htRDmrbs7Hf0Y2vK8/i47R3LXWp7mdsuZv3MqC+
	YGkiNBH4JQ9Z/TRFfaR0mTF+DAhxuDAegwPlV0rxqAsiaidxz+rVyu8FOWzfNXozMHt6PZ6to0I
	3UoiUeanrRDe2LA3+X7yHFabrs3UOxfycRy4Te8NZfz/4fqvL0gQbGMgqesHwl+uW
X-Received: by 2002:a17:90b:314d:b0:37f:9ce2:348b with SMTP id 98e67ed59e1d1-380aa207d9amr4283004a91.28.1782963519037;
        Wed, 01 Jul 2026 20:38:39 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e15e7032sm256154a91.7.2026.07.01.20.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 20:38:38 -0700 (PDT)
Date: Thu, 2 Jul 2026 11:38:09 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, unicorn_wang@outlook.com, 
	inochiama@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Han Gao <rabenda.cn@gmail.com>, 
	Nutty Liu <liujingqi@lanxincomputing.com>, Longbin Li <looong.bin@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: Add Milk-V Duo 256M board
 support
Message-ID: <akXbk7l9bZ_W0GLR@inochi.infowork>
References: <20260610121026.1517621-1-chenyou910331@gmail.com>
 <20260610121026.1517621-2-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610121026.1517621-2-chenyou910331@gmail.com>

On Wed, Jun 10, 2026 at 08:10:10PM +0800, Chen-Yu Yeh wrote:
> The Milk-V Duo 256M is a small form factor development board based on
> the Sophgo SG2002 SoC.
> 
> This patch adds basic device tree support for the board, including:
> - UART console
> - SD/MMC controller
> - USB host
> - Onboard blue status LED (connected to PWR_GPIO[2] / porte 2)
> 

> Tested on actual Milk-V Duo 256M hardware, verified boot to shell and
> heartbeat LED functionality.
> 

IIRC the led is not controlled by the small core, so the node should
be described in the dts.

I see the Sashiko does provide some good question, please check.

> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
> Changes since v1:
> - Removed the leds node because &porte is not yet supported in cv180x.dtsi,
>   which would cause a dtc compilation error.
> - Retained the &usb node because it is already defined in cv180x.dtsi.
> - Cleaned up the trailing blank line in the Makefile.
> 
>  arch/riscv/boot/dts/sophgo/Makefile           |   3 +-
>  .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 108 ++++++++++++++++++
>  2 files changed, 110 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> 
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 6f65526d4193..f9415c30a2c5 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -2,7 +2,8 @@
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
> -dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
> \ No newline at end of file


Why you change this? Please do not touch unrelated things.

> diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> new file mode 100644
> index 000000000000..4cf441ab3790
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>

I guess a right copyright is needed for your code.

> + */
> +
> +/dts-v1/;
> +
> +#include "sg2002.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "Milk-V Duo 256M";
> +	compatible = "milkv,duo256m", "sophgo,sg2002";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		coprocessor_rtos: region@83f40000 {
> +			reg = <0x83f40000 0xc0000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&pinctrl {
> +	uart0_cfg: uart0-cfg {
> +		uart0-pins {
> +			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> +				 <PINMUX(PIN_UART0_RX, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +
> +	sdhci0_cfg: sdhci0-cfg {
> +		sdhci0-clk-pins {
> +			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <16100>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-cmd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-data-pins {
> +			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
> +				 <PINMUX(PIN_SD0_D1, 0)>,
> +				 <PINMUX(PIN_SD0_D2, 0)>,
> +				 <PINMUX(PIN_SD0_D3, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-cd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +};
> +
> +&sdhci0 {
> +	pinctrl-0 = <&sdhci0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +	bus-width = <4>;
> +	no-1-8-v;
> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +};
> +
> +&uart0 {
> +	pinctrl-0 = <&uart0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&usb {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> -- 
> 2.43.0
> 
