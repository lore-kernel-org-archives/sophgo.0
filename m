Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214F025760
	for <sophgo@lists.linux.dev>; Tue,  1 Jul 2025 00:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751330192; cv=none; b=McrtMXLovRFCmixYg5/wIHjcyu2jpdFmr1rTQ/hKuJ4TETRbgIaMl5EIQEXouTcrIrqOqWJU+7j42Z873KoGop7jDM+GvXbv6HQ0J9k0RAf9b3FG9oyY5QolwyNT1PVtLCJiouNf/eEWKS8ZKYMgP+QDiSLfUZi9x8m3PIWFv0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751330192; c=relaxed/simple;
	bh=U29TfWta/+jEYM0KLBYGjTQGmU2hqhx1SBmhAIlL0Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpI0UBmEo0Hzdw7E6U735Zhk1LkQAAjwcU6HlXJ2/5+cxdEeauJfBTbR1xR6PJsjxgD3KuoT/InMEqqNewAPI0GMN8lwS7UhoQsDuGIjE2DK3SAThdqobviUL6lI5sADY5JkdQJYMflFzQzgyvn9YACBBkcFQ5Is8zq02FtS/nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+EQZLpF; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+EQZLpF"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7481600130eso3470896b3a.3
        for <sophgo@lists.linux.dev>; Mon, 30 Jun 2025 17:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751330190; x=1751934990; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fYK0EMxlksXo/Dbg3CdSxsVmRLSPWk16y3vUzHbd8ns=;
        b=J+EQZLpFqRoumlHcQKI5c9W/azFovbVMZHh3Kw5OhHqlimG263ZHu51Ns7iGQx2iPF
         tZRc1YK0w+NrXFaIAOzM2Qm3UGvdNh40N97dodt1MZw2POxRHk+ziT2cQRTIGDjlYzvI
         QIjPiaisdzkibqnYaSC3v7N3BBgV7Mq3/QZREH+IqMxJEGqbRIqNFUQ5TPvSGNRqlNvN
         3/EQo8JKzmLzJrTKm1R5MK5uqwHYVNLY7PVDeM19J2egE8D34f1IJUECMKTTfEml3Jlb
         fnTqcvG2VB+sLz23qvb0Eo/gPmqn060EhxgqrNC7wx/9SfzPpLiuMGRbHiTOKxXvY1tr
         OsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751330190; x=1751934990;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fYK0EMxlksXo/Dbg3CdSxsVmRLSPWk16y3vUzHbd8ns=;
        b=iY4C/U+ZNIhY5Cx1uAYZ51UWQGP4nbWWUzI6llTYAgjoHLNj0wMWZZQF81H1nrg13k
         S0XGzcRgzYAwmwrhrqsuXTw9WLi+BJYFwNsrgVBqEJtxk+qxC8LxLR2YRULkVIdvWkFb
         pM4WkadyxV24GEV3J73gWz05RiI0Gg9VY+Bgveei+4aYNV7Kso79ZTVNi0mDTXnZMNY5
         7zmJNgO1PdiSjfCn6c6xmxsUEPHGhhDZ2XmHn2k3vyM8MH+qZ+S7f05Hz2Tc6P9NTVpC
         FarhoQbLbfFbAQT+6ynX8db1Tv+1uklIGXSbbYbcBs1URRS3BzzTAa1Cs4xwWVYL0hMA
         qN8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUP8AFswr/3SvpjCqWo5Dch1H0ZfDY5ee9HcCIMz3R/FtiYfEZLB4RMH1LkeF4yqIzcYcJKKU0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNswEqJe4CCcm9WOqsBctCELMWOTvkFUPUVSBFSP1Hc469LuHy
	/wi1jOYMf8kVan3ZNfDztaLvsiQacYD0PNRfDy58cHwZPgqfCL4AX4Gt
X-Gm-Gg: ASbGnct8aCSXe6fORUQZ16WEAAlzvNmczKGEutsjB1yVavr+XyiiG05+8DTRueTocwG
	V3VxZ1xwjtAG6JY6K+WE24B6yCb9EIGY7MJ/LNbiFKijfg4vy+Y4/eHSQFNgkw6TIgcH3hUjYn4
	xC+5fSf+tWrMxMcUEkMAgInF04zPxbuut+mhuKMdYNkXQVNUMZKQFZbpIOd678hsB1K3+W6YlT2
	7gpNn1DA6BV+f3+kVZH13a+ZjJuGNc9xEtXTgjMyrAT14OaM1fhLBZO607cWs1RiY+clieNZC+7
	Ws6TP4qwwomQ0hZKAlgSM8gV18NY1LMEfmaTlO7vkQfzy2XnDGEjAaOqN+Ju4IA63bzTKiNL
X-Google-Smtp-Source: AGHT+IGKImkUMqI2z1gYD78QbviBmg1fxYvY1gFIlaFkYpHjQXCCeDUr0So2MH05sHoga4eLCxoPHg==
X-Received: by 2002:a05:6a00:b42:b0:736:31cf:2590 with SMTP id d2e1a72fcca58-74af70291e3mr20221152b3a.16.1751330190407;
        Mon, 30 Jun 2025 17:36:30 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af541b6e5sm9662133b3a.43.2025.06.30.17.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 17:36:29 -0700 (PDT)
Date: Tue, 1 Jul 2025 08:36:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 2/2] net: mdio-mux: Add MDIO mux driver for
 Sophgo CV1800 SoCs
Message-ID: <255j5pbi3pty5n3dmcalq4uhsoj37rsq5263fijn76o3vrkbs5@cctlwa5567om>
References: <20250611080228.1166090-1-inochiama@gmail.com>
 <20250611080228.1166090-3-inochiama@gmail.com>
 <b8e37f3b89209f6674b0419ec28e0302de6b3c4e.camel@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8e37f3b89209f6674b0419ec28e0302de6b3c4e.camel@gmail.com>

On Mon, Jun 30, 2025 at 11:08:37PM +0200, Alexander Sverdlin wrote:
> Hi Inochi!
> 
> On Wed, 2025-06-11 at 16:02 +0800, Inochi Amaoto wrote:
> > Add device driver for the mux driver for Sophgo CV18XX/SG200X
> > series SoCs.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/net/mdio/Kconfig            |  10 +++
> >  drivers/net/mdio/Makefile           |   1 +
> >  drivers/net/mdio/mdio-mux-cv1800b.c | 119 ++++++++++++++++++++++++++++
> >  3 files changed, 130 insertions(+)
> >  create mode 100644 drivers/net/mdio/mdio-mux-cv1800b.c
> > 
> > diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
> > index 7db40aaa079d..fe553016b77d 100644
> > --- a/drivers/net/mdio/Kconfig
> > +++ b/drivers/net/mdio/Kconfig
> > @@ -278,5 +278,15 @@ config MDIO_BUS_MUX_MMIOREG
> >  
> >  	  Currently, only 8/16/32 bits registers are supported.
> >  
> > +config MDIO_BUS_MUX_SOPHGO_CV1800B
> > +	tristate "Sophgo CV1800 MDIO multiplexer driver"
> > +	depends on ARCH_SOPHGO || COMPILE_TEST
> > +	depends on OF_MDIO && HAS_IOMEM
> > +	select MDIO_BUS_MUX
> > +	default m if ARCH_SOPHGO
> > +	help
> > +	  This module provides a driver for the MDIO multiplexer/glue of
> > +	  the Sophgo CV1800 series SoC. The multiplexer connects either
> > +	  the external or the internal MDIO bus to the parent bus.
> >  
> >  endif
> > diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
> > index c23778e73890..a67be2abc343 100644
> > --- a/drivers/net/mdio/Makefile
> > +++ b/drivers/net/mdio/Makefile
> > @@ -33,3 +33,4 @@ obj-$(CONFIG_MDIO_BUS_MUX_MESON_G12A)	+= mdio-mux-meson-g12a.o
> >  obj-$(CONFIG_MDIO_BUS_MUX_MESON_GXL)	+= mdio-mux-meson-gxl.o
> >  obj-$(CONFIG_MDIO_BUS_MUX_MMIOREG) 	+= mdio-mux-mmioreg.o
> >  obj-$(CONFIG_MDIO_BUS_MUX_MULTIPLEXER) 	+= mdio-mux-multiplexer.o
> > +obj-$(CONFIG_MDIO_BUS_MUX_SOPHGO_CV1800B) += mdio-mux-cv1800b.o
> > diff --git a/drivers/net/mdio/mdio-mux-cv1800b.c b/drivers/net/mdio/mdio-mux-cv1800b.c
> > new file mode 100644
> > index 000000000000..6c69e83c3dcd
> > --- /dev/null
> > +++ b/drivers/net/mdio/mdio-mux-cv1800b.c
> > @@ -0,0 +1,119 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Sophgo CV1800 MDIO multiplexer driver
> > + *
> > + * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/delay.h>
> > +#include <linux/clk.h>
> > +#include <linux/io.h>
> > +#include <linux/mdio-mux.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define EPHY_PAGE_SELECT		0x07c
> > +#define EPHY_CTRL			0x800
> > +#define EPHY_REG_SELECT			0x804
> > +
> > +#define EPHY_PAGE_SELECT_SRC		GENMASK(12, 8)
> > +
> > +#define EPHY_CTRL_ANALOG_SHUTDOWN	BIT(0)
> > +#define EPHY_CTRL_USE_EXTPHY		BIT(7)
> > +#define EPHY_CTRL_PHYMODE		BIT(8)
> > +#define EPHY_CTRL_PHYMODE_SMI_RMII	1
> > +#define EPHY_CTRL_EXTPHY_ID		GENMASK(15, 11)
> > +
> > +#define EPHY_REG_SELECT_MDIO		0
> > +#define EPHY_REG_SELECT_APB		1
> > +
> > +#define CV1800B_MDIO_INTERNAL_ID	1
> > +#define CV1800B_MDIO_EXTERNAL_ID	0
> > +
> > +struct cv1800b_mdio_mux {
> > +	void __iomem *regs;
> > +	void *mux_handle;
> > +};
> > +
> > +static int cv1800b_enable_mdio(struct cv1800b_mdio_mux *mdmux, bool internal_phy)
> > +{
> > +	u32 val;
> > +
> > +	val = readl(mdmux->regs + EPHY_CTRL);
> > +
> > +	if (internal_phy)
> > +		val &= ~EPHY_CTRL_USE_EXTPHY;
> > +	else
> > +		val |= EPHY_CTRL_USE_EXTPHY;
> > +
> > +	writel(val, mdmux->regs + EPHY_CTRL);
> > +
> > +	writel(EPHY_REG_SELECT_MDIO, mdmux->regs + EPHY_REG_SELECT);
> > +
> > +	return 0;
> > +}
> 
> Seems that it actually doesn't multiplex the buses? As seen on SG2000:
> 

A switch is also a multiplexer.

> # mdio mdio_mux-0.0
>  DEV      PHY-ID  LINK
> 0x00  0x00435649  up
> 0x01  0x00435649  up
> 0x02  0x00000000  down
> ...
> # mdio mdio_mux-0.1
>  DEV      PHY-ID  LINK
> 0x00  0x00435649  up
> 0x01  0x00435649  up
> ...
> 
> The single internal PHY appears on two addresses (0 and 1) and on both buses.

Only address 1 is right, all phy will respond address 0.
And you should not probe bus 1 when using internal bus,
it is not existed.

> Maybe it just switches the external MDIO master on/off?

Yes

> Seems that we need the documentation for this thing ;-)
> 

Please ask for the vendor.

> BTW, above LINK up is unfortunately without any cable attached...

I have repeat the led problem. After setting the right pinctrl,
It is always light and not blink. I guess there may be a internal
bug for it. I will ignore this problem as it is not the driver
issue.

Regards,
Inochi
