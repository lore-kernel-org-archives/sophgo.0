Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A634EA370
	for <sophgo@lists.linux.dev>; Thu,  2 Jul 2026 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985921; cv=none; b=Gf2QX4FTB+vLpDHolRragm+y8BnbkkV1rgHmgHCed4Q1Q1cbjBwZ+J3UbXB9DqGwexUIeV51eO5Y//22kNnhbBrRc0GvLKWZhg6aRLMHoS5yEgBdPIOnuu5egMwVu80pQXKUvYvcTf9b4wyMpdQS3KrClkm8UN2VvMlwSnDKXfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985921; c=relaxed/simple;
	bh=Aa+4CLq/1lEPi+3KENlRBYE/WUmOxjgIgxXkSN2a0b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqC0ABVUa/iYAxtECYll6x/CG3j3TSjnElrSM1U4Lax+esv+DCnTIp0CD+gEQ2D2PJAwMxH/ivHvsX9og4x5w+Huhq7hWasXPPwLFBMdyBlVZZ+/SFNOB7yUUDnIS6pf7TLG/gHlnlrJp9yw3HcfG4sf6+DkZLVNegH0jDaF/Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlaTG6XR; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlaTG6XR"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-847a483e344so417203b3a.0
        for <sophgo@lists.linux.dev>; Thu, 02 Jul 2026 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782985919; x=1783590719; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YDRpB2DKaayDiWw9YLXhH5c/W2DOhBpZscwPdMD2aSs=;
        b=NlaTG6XRtmvy0LlmxkFPel0PM9kskgWxKnAKA4ZDtsjvB+8j108N1m7WHb0xA71KMG
         RtwNHRaTRhO42F3muzbRds0efGRZR2vcslnqvmz1uLauBAlN0NJ7QqlNg+JGzW6/SaDa
         jnGnki5XZnR9TIfkt31WzVlYOOXMTdzb85Hy/XAn7F1l3JkEmhQzwD3Bh6mv6Q/DFyUJ
         b83pJt4GgoAuSn05F0PnZ8RXPvIqixloZwmlMj8cKyxgBGb8WZ3/WTI96uZXw0fXGN9c
         DyzUENcPR9O5NqLUjXqYaa993k77c23RI6ttQOzLFQmSh8bqJkZ+r7yLcuRPw+vVFeGj
         +iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985919; x=1783590719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDRpB2DKaayDiWw9YLXhH5c/W2DOhBpZscwPdMD2aSs=;
        b=gcYLAk+wdDxGx92+DQIm7KUX4ky93gmTbu5a8Ub078sHJScebQB0kBOWplPiZZCJwD
         mZbsCp2yQZKobqu2F6QHIjTp6PW7z9vtVSdstBk6ABoRuW/N0cdEG6R/0WuD1az8dvjt
         qeubC67BP+kvrH453W3JTWUWF1vPDC4w4+vN7coc7hycc9UEILxnNcTaOLvzWtaM7V1I
         WrNhxJN4YAc6dyChh9TSDBa0AZ4xEa8GR0PiZefPqAvMco+ulGZXllkFr9frjqF60pNf
         Q+GMKYzq8ABNTOZtzj/dV8P1HIFeLyVPz5E2gwxxfUNlqqTG34o8B2iaFHigsRx6HLno
         W9UA==
X-Forwarded-Encrypted: i=1; AFNElJ+cUlqsJAdVxvOj4/mLWBpttD2X0sNbWx7ogaz2KP8c4BTdyVA9NsuLWocwneLArlMOGYz+g/E=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKr9iPD7QBjHxYkbxk3NN86oWSSJIfqSwi9DuBv45vEn9qkeCf
	F+mSDY9dpSlNZGx2eXjwXg/wZs9q4/eAUvFhzA7yd0BcOT44AJUkYljy
X-Gm-Gg: AfdE7cmggSDzG9ZzuxAFFy/QKaNAPX6s0A+fbd/A9fVU+qC9pxbdzeVBpdAn/RL2sJ9
	uokr0MnqeFMToUhj/Tim1Zmb5uvn/M8I+0vhzRT2j790DdHWyZSm6uVidKAA36zC/VX/TvODuE7
	A7zVCVuZfRYkPB7DdD7lMtd7+1lCHo78jZe22aB07L57nLT3SFaVDfnkCwCO6rVDd3laR4uCa81
	lEZvIR4edtCGT4Uuwljx8taxwDWAj+h+5fz5yDtf4buJwMqEGdIAu3xxxbfIX0CqOh6/jJK529/
	gI9JaOlGhIYNBayK548QF6hAgWnuzPjKq7ptmKE0uAlZ+vi4R1Mm8cpxe3K054xnfrLYoeRz51g
	YgpppC5nuHSZBfH8hOZI4RyNWKFaT65oc+XZoCNE1VhuP+05RCKQqsaLZJ2/JA8FS
X-Received: by 2002:a05:6a00:13a1:b0:847:8bd0:1b96 with SMTP id d2e1a72fcca58-847bf9d4b0amr4742033b3a.23.1782985918713;
        Thu, 02 Jul 2026 02:51:58 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb7933e1sm1069821b3a.26.2026.07.02.02.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:51:58 -0700 (PDT)
Date: Thu, 2 Jul 2026 17:51:28 +0800
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
Message-ID: <akY0kY8yWAU_J3Eu@inochi.infowork>
References: <20260610121026.1517621-1-chenyou910331@gmail.com>
 <20260610121026.1517621-2-chenyou910331@gmail.com>
 <akXbk7l9bZ_W0GLR@inochi.infowork>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akXbk7l9bZ_W0GLR@inochi.infowork>

On Thu, Jul 02, 2026 at 11:38:09AM +0800, Inochi Amaoto wrote:
> On Wed, Jun 10, 2026 at 08:10:10PM +0800, Chen-Yu Yeh wrote:
> > The Milk-V Duo 256M is a small form factor development board based on
> > the Sophgo SG2002 SoC.
> > 
> > This patch adds basic device tree support for the board, including:
> > - UART console
> > - SD/MMC controller
> > - USB host
> > - Onboard blue status LED (connected to PWR_GPIO[2] / porte 2)
> > 
> 
> > Tested on actual Milk-V Duo 256M hardware, verified boot to shell and
> > heartbeat LED functionality.
> > 
> 
> IIRC the led is not controlled by the small core, so the node should
> be described in the dts.
> 
> I see the Sashiko does provide some good question, please check.
> 
> > Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> > ---
> > Changes since v1:
> > - Removed the leds node because &porte is not yet supported in cv180x.dtsi,
> >   which would cause a dtc compilation error.
> > - Retained the &usb node because it is already defined in cv180x.dtsi.
> > - Cleaned up the trailing blank line in the Makefile.
> > 


So why not adding the porte?

Regards,
Inochi

> >  arch/riscv/boot/dts/sophgo/Makefile           |   3 +-
> >  .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 108 ++++++++++++++++++
> >  2 files changed, 110 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> > index 6f65526d4193..f9415c30a2c5 100644
> > --- a/arch/riscv/boot/dts/sophgo/Makefile
> > +++ b/arch/riscv/boot/dts/sophgo/Makefile
> > @@ -2,7 +2,8 @@
> >  dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
> >  dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
> >  dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
> > +dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
> >  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
> >  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
> >  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
> > -dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
> > +dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
> > \ No newline at end of file
> 
> 
> Why you change this? Please do not touch unrelated things.
> 
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > new file mode 100644
> > index 000000000000..4cf441ab3790
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > @@ -0,0 +1,108 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> 
> I guess a right copyright is needed for your code.
> 
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sg2002.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +	model = "Milk-V Duo 256M";
> > +	compatible = "milkv,duo256m", "sophgo,sg2002";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +		serial1 = &uart1;
> > +		serial2 = &uart2;
> > +		serial3 = &uart3;
> > +		serial4 = &uart4;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +
> > +	reserved-memory {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges;
> > +
> > +		coprocessor_rtos: region@83f40000 {
> > +			reg = <0x83f40000 0xc0000>;
> > +			no-map;
> > +		};
> > +	};
> > +};
> > +
> > +&osc {
> > +	clock-frequency = <25000000>;
> > +};
> > +
> > +&pinctrl {
> > +	uart0_cfg: uart0-cfg {
> > +		uart0-pins {
> > +			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> > +				 <PINMUX(PIN_UART0_RX, 0)>;
> > +			bias-pull-up;
> > +			drive-strength-microamp = <10800>;
> > +			power-source = <3300>;
> > +		};
> > +	};
> > +
> > +	sdhci0_cfg: sdhci0-cfg {
> > +		sdhci0-clk-pins {
> > +			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
> > +			bias-pull-up;
> > +			drive-strength-microamp = <16100>;
> > +			power-source = <3300>;
> > +		};
> > +
> > +		sdhci0-cmd-pins {
> > +			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
> > +			bias-pull-up;
> > +			drive-strength-microamp = <10800>;
> > +			power-source = <3300>;
> > +		};
> > +
> > +		sdhci0-data-pins {
> > +			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
> > +				 <PINMUX(PIN_SD0_D1, 0)>,
> > +				 <PINMUX(PIN_SD0_D2, 0)>,
> > +				 <PINMUX(PIN_SD0_D3, 0)>;
> > +			bias-pull-up;
> > +			drive-strength-microamp = <10800>;
> > +			power-source = <3300>;
> > +		};
> > +
> > +		sdhci0-cd-pins {
> > +			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
> > +			bias-pull-up;
> > +			drive-strength-microamp = <10800>;
> > +			power-source = <3300>;
> > +		};
> > +	};
> > +};
> > +
> > +&sdhci0 {
> > +	pinctrl-0 = <&sdhci0_cfg>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +	bus-width = <4>;
> > +	no-1-8-v;
> > +	no-mmc;
> > +	no-sdio;
> > +	disable-wp;
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-0 = <&uart0_cfg>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +};
> > +
> > +&usb {
> > +	dr_mode = "host";
> > +	status = "okay";
> > +};
> > -- 
> > 2.43.0
> > 
