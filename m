Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241A24EB50
	for <sophgo@lists.linux.dev>; Sat, 22 Feb 2025 00:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740185046; cv=none; b=a7UWJxR6BOXvLJWzMLF6F2l+jl9UL03H47v9gDTodcGt6/pSMonUMDZkB3sjV6ai4/oL3FrWz8NEjkAZcQ6Xg4gbqvFDtOV5L/gdADKtkzJLS0u9C/yN6kjy3JzFpTZq4zWsTJ6MUdF3prLGjrydpcNQkLcUAXCfbKD5cLNSIFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740185046; c=relaxed/simple;
	bh=rVIkEHAtGYkLu2/McHlDwK6UU1jTxU5sHLOBbtEgOcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+nEv0sQZU5/7aVbepCZSXiSmbS6yodaCq+qLuAo3C65u4nrw2c3wn5nNqT58Ml8omhybJFDrtyzlHlfHMRK4dpBnB0Fz2s+GwzR/xvOhcd+7lVgKT2iVRdYbttpqO4sw+RbUWGaAn8yKgZpMNr2DXqX21Ku1r0IuYuRr8e84HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9OOhXm2; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9OOhXm2"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c0818add57so278321885a.3
        for <sophgo@lists.linux.dev>; Fri, 21 Feb 2025 16:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740185044; x=1740789844; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0mfYiMV8kidUXmGLYF/BaWuuheQWf14kVQL8yo9io9o=;
        b=B9OOhXm2fyNv24APLCAVP2Y/bCLf4QWvZmggerACafHw5JmuEqAvFiPJtxIPLSjIpK
         BoXGzV1S2z7NZB+en8qxXU8sxeCnRT4TiQ/HHFA1R3LN04E0K5JNrEsF4r1uzVI6KbNy
         Sls5aqQ72tlqG0uCpOi4Ao+1rOKITiXhBgUL/XbZQI6BhIIreuUOo/wjtdKygoE7xVKU
         /1QO7Uopkxnfr80ZIfzaCk+ApQlMzh+kH4nqNEUb5Tjla9orX+WpOZHGANFqfJlsrnBW
         CRvlHThgzrir9ZPBMeWjZJI407GIxkrbS1xT3i53PcP/bNX5OrRZOXK+ws7ay9VtrqJ8
         lCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740185044; x=1740789844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mfYiMV8kidUXmGLYF/BaWuuheQWf14kVQL8yo9io9o=;
        b=KKwL/mLxdbjWUoJjU5mPEq+ijD5uC2Ws/dwjMxMIEMQlfD43m244Ey++Rg5qC1Xmn2
         ZRGSp/sPWXecPXyK47cbkGHa7dLY8IJ1wgNQJOAAaQtdlOMelBgvGmEkvO6qjoGS+26n
         OPp4R6a+b53BbkqVTD+LneD7kkYkI88hB93Gvi44OYe4ZjWPdNl1FqSd7JjklDZEuumh
         +Ne5jziCDy7VzWe6SSpd3FsHiDsTXHkV4KbQay/kegw7XztBRLivUg+c+JbXOPxTwCQi
         Gyk/KYVsrQPePUNJOe+2yN5Kz+Z4YP51UyFFQq20yd7lxvAb5HnmF/CNDvCcg7yI5ZRs
         lD8A==
X-Forwarded-Encrypted: i=1; AJvYcCWavaYu64KXULSVR+Qg+4SsdvMZVgrxUAuU6NLS3Gu0MqpurIX/JkRNhEEC9kYP62ipIXpoBAk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5JQkAO4vn+Y5M/gYPuOO0K98RAjIGjeElJFDf9c+I8naRZoV5
	xotgC9wpWgN+stL8YI1MxkTSNSTDEaUw6WneRZQ4ovVgdCcF31HT
X-Gm-Gg: ASbGnctm3Dl9iG6C3TJYnsH+ggQ4mU8MaxyxpblwdXlQuueSNlLaAMOx+bq//WGmSwx
	0VfvBXDDKQebcfS2AlCWq4yfeg0KD1Gdick1HnDhNbLq5Jfm92L0WPkuXmUS2clfuLED8qXCapr
	mbR3sXrq7btg5s8ngg8dwxdNJP0Kqb3l5yVEpYfXHe3o2S9qBRUkWCfCmScDmF1+FNt7DqYz1/x
	M2M3IJKkrvw9NiEwR1Cv79OwnlQtUHlxWc0J5LjtVc0gtpo+jYxIKTse7q8GZmfkXgbX8wfSQxQ
	WA==
X-Google-Smtp-Source: AGHT+IFzV+P0z5pv+ZCpM8NN+jOatwS5dJ8bp2X5/A+AMv3Hu8hpM6OiyB0lB2UVj8l8h5auvYUeaw==
X-Received: by 2002:a05:620a:801b:b0:7c0:c42a:7078 with SMTP id af79cd13be357-7c0cf96d0f1mr710092885a.52.1740185043862;
        Fri, 21 Feb 2025 16:44:03 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c096443dc4sm721179685a.60.2025.02.21.16.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 16:44:02 -0800 (PST)
Date: Sat, 22 Feb 2025 08:43:46 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Niklas Cassel <cassel@kernel.org>, 
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
Message-ID: <fanm6m6fx6cqwalhdvrxmjzsluiyptbvrwbi5ufwbqmxsf62xl@lntprhkjv6tm>
References: <20250221013758.370936-3-inochiama@gmail.com>
 <20250221234958.GA372914@bhelgaas>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221234958.GA372914@bhelgaas>

On Fri, Feb 21, 2025 at 05:49:58PM -0600, Bjorn Helgaas wrote:
> On Fri, Feb 21, 2025 at 09:37:56AM +0800, Inochi Amaoto wrote:
> > Add support for DesignWare-based PCIe controller in SG2044 SoC.
> 
> > @@ -341,6 +341,16 @@ config PCIE_ROCKCHIP_DW_EP
> >  	  Enables support for the DesignWare PCIe controller in the
> >  	  Rockchip SoC (except RK3399) to work in endpoint mode.
> >  
> > +config PCIE_SOPHGO_DW
> > +	bool "SOPHGO DesignWare PCIe controller"
> 
> What's the canonical styling of "SOPHGO"?  I see "Sophgo" in the
> subject line and in Chen Wang's SG2042 series.  Pick the official
> styling and use it consistently.
> 

This is my mistake. It should be "Sophgo", I will change it.

> Reorder this so the menuconfig menu items remain alphabetically
> sorted.
> 

I think this order is applied to the entry title in menuconfig,
and is not the config key? If so, I will change it.

> > +	depends on ARCH_SOPHGO || COMPILE_TEST
> > +	depends on PCI_MSI
> > +	depends on OF
> > +	select PCIE_DW_HOST
> > +	help
> > +	  Enables support for the DesignWare PCIe controller in the
> > +	  SOPHGO SoC.
> > +
> >  config PCI_EXYNOS
> >  	tristate "Samsung Exynos PCIe controller"
> >  	depends on ARCH_EXYNOS || COMPILE_TEST
> 
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * PCIe host controller driver for Sophgo SoCs.
> 
> Looks too generic, since Chen Wang's series says Sophgo SG2042 SoC is
> Cadence-based, so this driver apparently doesn't cover all Sophgo
> SoCs.
> 

OK, I will change the description to point it only cover
the controller based on the DesignWare core.

> > + *
> 
> Spurious blank line.
> 
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/irqchip/chained_irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/property.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset.h>
> > +
> > +#include "pcie-designware.h"
> > +
> > +#define to_sophgo_pcie(x)		dev_get_drvdata((x)->dev)
> > +
> > +#define PCIE_INT_SIGNAL			0xc48
> > +#define PCIE_INT_EN			0xca0
> > +
> > +#define PCIE_SIGNAL_INTX_SHIFT		5
> > +#define PCIE_INT_EN_INTX_SHIFT		1
> 
> Define masks with GENMASK() and get rid of the _SHIFT #defines.
> 
> > +#define PCIE_INT_EN_INT_SII		BIT(0)
> > +#define PCIE_INT_EN_INT_INTA		BIT(1)
> > +#define PCIE_INT_EN_INT_INTB		BIT(2)
> > +#define PCIE_INT_EN_INT_INTC		BIT(3)
> > +#define PCIE_INT_EN_INT_INTD		BIT(4)
> 
> These are unused, drop them.
> 
> > +#define PCIE_INT_EN_INT_MSI		BIT(5)
> > +
> > +struct sophgo_pcie {
> > +	struct dw_pcie pci;
> > +	void __iomem *app_base;
> > +	struct clk_bulk_data *clks;
> > +	unsigned int clk_cnt;
> > +	struct reset_control *rst;
> > +	struct irq_domain *irq_domain;
> 
> Indent the member names to align vertically as most other drivers do.
> 
> > +};
> > +
> > +static int sophgo_pcie_readl_app(struct sophgo_pcie *sophgo, u32 reg)
> > +{
> > +	return readl_relaxed(sophgo->app_base + reg);
> > +}
> > +
> > +static void sophgo_pcie_writel_app(struct sophgo_pcie *sophgo, u32 val, u32 reg)
> > +{
> > +	writel_relaxed(val, sophgo->app_base + reg);
> > +}
> > +
> > +static void sophgo_pcie_intx_handler(struct irq_desc *desc)
> > +{
> > +	struct dw_pcie_rp *pp = irq_desc_get_handler_data(desc);
> > +	struct irq_chip *chip = irq_desc_get_chip(desc);
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct sophgo_pcie *sophgo = to_sophgo_pcie(pci);
> > +	unsigned long hwirq = PCIE_SIGNAL_INTX_SHIFT;
> > +	unsigned long reg;
> > +
> > +	chained_irq_enter(chip, desc);
> > +
> > +	reg = sophgo_pcie_readl_app(sophgo, PCIE_INT_SIGNAL);
> > +
> > +	for_each_set_bit_from(hwirq, &reg, PCI_NUM_INTX + PCIE_SIGNAL_INTX_SHIFT)
> 
> Use FIELD_GET() here and iterate through PCI_NUM_INTX.  Then you don't
> need for_each_set_bit_from() and shouldn't need PCIE_SIGNAL_INTX_SHIFT
> here and below.
> 

OK, I will change it

> > +		generic_handle_domain_irq(sophgo->irq_domain,
> > +					  hwirq - PCIE_SIGNAL_INTX_SHIFT);
> > +
> > +	chained_irq_exit(chip, desc);
> > +}
> > +
> > +static void sophgo_intx_mask(struct irq_data *d)
> > +{
> > +	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct sophgo_pcie *sophgo = to_sophgo_pcie(pci);
> > +	unsigned long flags;
> > +	u32 val;
> > +
> > +	raw_spin_lock_irqsave(&pp->lock, flags);
> > +
> > +	val = sophgo_pcie_readl_app(sophgo, PCIE_INT_EN);
> > +	val &= ~BIT(d->hwirq + PCIE_INT_EN_INTX_SHIFT);
> 
> FIELD_PREP().
> 
> > +	sophgo_pcie_writel_app(sophgo, val, PCIE_INT_EN);
> > +
> > +	raw_spin_unlock_irqrestore(&pp->lock, flags);
> > +};
> > +
> > +static void sophgo_intx_unmask(struct irq_data *d)
> > +{
> > +	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct sophgo_pcie *sophgo = to_sophgo_pcie(pci);
> > +	unsigned long flags;
> > +	u32 val;
> > +
> > +	raw_spin_lock_irqsave(&pp->lock, flags);
> > +
> > +	val = sophgo_pcie_readl_app(sophgo, PCIE_INT_EN);
> > +	val |= BIT(d->hwirq + PCIE_INT_EN_INTX_SHIFT);
> 
> Ditto.
> 
> > +	sophgo_pcie_writel_app(sophgo, val, PCIE_INT_EN);
> > +
> > +	raw_spin_unlock_irqrestore(&pp->lock, flags);
> > +};
> > +
> > +static void sophgo_intx_eoi(struct irq_data *d)
> > +{
> > +}
> > +
> > +static struct irq_chip sophgo_intx_irq_chip = {
> > +	.name			= "INTx",
> > +	.irq_mask		= sophgo_intx_mask,
> > +	.irq_unmask		= sophgo_intx_unmask,
> > +	.irq_eoi		= sophgo_intx_eoi,
> 
> Name these ending with the irq_chip field names, e.g.,
> sophgo_intx_irq_mask(), to make them easier to find with grep.
> 
> Bjorn

Thanks, I will take all the comments and improve the driver.

Regards,
Inochi
