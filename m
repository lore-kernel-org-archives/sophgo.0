Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1331335BA
	for <sophgo@lists.linux.dev>; Sat, 22 Feb 2025 00:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740184225; cv=none; b=TPm4kweIbP9Jin+RcaAmUcPoCx3UOn8boSJDR3bZCHw7+QQ5caAHJJ+9QzU793Sh2aWDsdLjdu6LuvGDI20xuvliWDQhVoGnFhxKZ6jRJaRK27v9l0V+r9+zqZDjws9UxSRsZ6Cm7lXGuPCBVCUSmmQrC64bUQsbD049VCg48HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740184225; c=relaxed/simple;
	bh=KuzXW3kq2XXsM0NjjSzvtwehF2ywXjUmDWXyxtz1xpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6ZV6cEYv62jLthautzO67UDzvpEVKbb4y95FBHE+/hx2hLPl/SN0eFnIffhOVaZ0hi5uBmlosigfDXPahyEiH5w3Iz38/bzJc+/SPJ809svntnbtvQgCnyYLXBbQ8kO8L22IWAGxpvOdgqaa/pGpZvOsjA0JD2t7a5onBmdZAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc5DrA9e; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc5DrA9e"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-471f9d11176so29516751cf.0
        for <sophgo@lists.linux.dev>; Fri, 21 Feb 2025 16:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740184222; x=1740789022; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5jZqoRf6sss+7D2DNzyKiOZnwgWa7edWmqX7FcgvgLo=;
        b=Xc5DrA9el2d9+L5tTYa38DAaG+errYzRmsW/QLRK9ssrCe7dJwsQHVOGi6V4aBVT1M
         rxIJ3Qk/UKS4ONWcxvVD5DIN4132urbOd7mxY2HkxgzGxa2i3sC1nx50FJ2AvfyTMxvv
         0LyKdsTRPMynfcAW/2IcaZVWfBaKTM+mkNtgavT40lI47IDHaQSd/PyI6Hf4B89+gvnD
         gtatbODwovpi/D4nSWfpvLmRzP7KdzixL06LGLf3BVxUJZwdYtNFOwn7DgGDhJi+wzzp
         HxBB8mjd8ry4UWglVeeSV1t9a6WfogOjyHwXSV/6qZNEtHmp1yPu7zhI2lZqSphzgRTC
         wReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740184222; x=1740789022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jZqoRf6sss+7D2DNzyKiOZnwgWa7edWmqX7FcgvgLo=;
        b=lrmjh1lj8ZIrfc2vf7xmPg6MM2mOuo4H3+bbM4e1nE2lZTqrlATQ2PT/3mdVLfS86/
         tMbSH7XZm7NB5TGr0UPf8veNcymJVe7KBPkZYrdSIwRSQjc/Tix830t3ylkoBoFhei2e
         fKWT+Ix5IJkF7wgqwrQJNGBI3fHaRO+o6NQZqyZJTXX09wGrVQ2WbEAFj1LPZMVQg14G
         AcWI40RPbKORwznbMMtuRjnPb4eprHivcw2nJg1xIZzBv4i+lGrumGrId+nCfrYpEucs
         WHfOGvyAF3JIelLzCjtmfE2xO/W6qlXHrd+7jMZ3/IwY5yVxOm6hdkS1n0+XCCLadQtw
         sIFA==
X-Forwarded-Encrypted: i=1; AJvYcCUedifqiiXvU2h+rdthhIXr0ciyKiCh9RRLoK2Ia2I5aCS1mjq59ki4z96A11qbs526zoZVbHk=@lists.linux.dev
X-Gm-Message-State: AOJu0YybHcbJvXX9Ar7jley/FBVsyodTGoYTWELxF8jzum92sc7kDxxY
	+iLUZ4U0iaP5/wmwZPh+n6Kn8teexhpm5v8S9rddrcRYPGcIOW6F
X-Gm-Gg: ASbGncsss1C2uNyc/pYEu9/TJybuk/zZbPGPW/T4HFmRDMkpkvt/wpYuz4MHpmUMnTy
	/cW4/yDTHq5P/Sl38OeYzt/wY0VQ0gItElySAmznEPvvjoCxgPj3Z66+RMSIhIiaJ9CqsUZC80s
	RoJizS25VjVUfL/gCl6cNWAhUMA3HyjhiWb74EO30ayAylF6JjgcNgaGu+4qL5CBFHcydphFhAi
	TAAOygI8P50bYiB/kwQTBInFQKHbu0yQC3nOzU78PCvAdL6NGN0GTru/xP9UVwJ0hM9Dxzu67sE
	1A==
X-Google-Smtp-Source: AGHT+IGzSztHttj2eqWBMxKIMx7sJIW+3HS3UjtU9KRJWKyCjr0SAYSd6roWKk1avtZ7VxOsb59iBA==
X-Received: by 2002:a05:6214:d65:b0:6e4:2f90:a9ca with SMTP id 6a1803df08f44-6e6b0036108mr76427546d6.3.1740184222448;
        Fri, 21 Feb 2025 16:30:22 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c0a71326b4sm586886485a.4.2025.02.21.16.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 16:30:21 -0800 (PST)
Date: Sat, 22 Feb 2025 08:30:04 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
	Inochi Amaoto <inochiama@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Niklas Cassel <cassel@kernel.org>, Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
Message-ID: <sbvui5ezehqtfxttga62jlkyzytnwq4fzra3kxfmbmqtxigfyx@zuzs2hcaymmv>
References: <20250221013758.370936-1-inochiama@gmail.com>
 <20250221013758.370936-3-inochiama@gmail.com>
 <d31a48ebfc0f91de615af75e313caa6afbdd597d.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d31a48ebfc0f91de615af75e313caa6afbdd597d.camel@pengutronix.de>

On Fri, Feb 21, 2025 at 10:07:54AM +0100, Philipp Zabel wrote:
> On Fr, 2025-02-21 at 09:37 +0800, Inochi Amaoto wrote:
> > Add support for DesignWare-based PCIe controller in SG2044 SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/pci/controller/dwc/Kconfig          |  10 +
> >  drivers/pci/controller/dwc/Makefile         |   1 +
> >  drivers/pci/controller/dwc/pcie-dw-sophgo.c | 282 ++++++++++++++++++++
> >  3 files changed, 293 insertions(+)
> >  create mode 100644 drivers/pci/controller/dwc/pcie-dw-sophgo.c
> > 
> [...]
> > diff --git a/drivers/pci/controller/dwc/pcie-dw-sophgo.c b/drivers/pci/controller/dwc/pcie-dw-sophgo.c
> > new file mode 100644
> > index 000000000000..a4ca4f1e26e0
> > --- /dev/null
> > +++ b/drivers/pci/controller/dwc/pcie-dw-sophgo.c
> > @@ -0,0 +1,282 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * PCIe host controller driver for Sophgo SoCs.
> > + *
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
> 
> Drop this ...
> 
> > +
> > +#include "pcie-designware.h"
> > +
> > +#define to_sophgo_pcie(x)		dev_get_drvdata((x)->dev)
> > +
> > +#define PCIE_INT_SIGNAL			0xc48
> > +#define PCIE_INT_EN			0xca0
> > +
> > +#define PCIE_SIGNAL_INTX_SHIFT		5
> > +
> > +#define PCIE_INT_EN_INTX_SHIFT		1
> > +#define PCIE_INT_EN_INT_SII		BIT(0)
> > +#define PCIE_INT_EN_INT_INTA		BIT(1)
> > +#define PCIE_INT_EN_INT_INTB		BIT(2)
> > +#define PCIE_INT_EN_INT_INTC		BIT(3)
> > +#define PCIE_INT_EN_INT_INTD		BIT(4)
> > +#define PCIE_INT_EN_INT_MSI		BIT(5)
> > +
> > +struct sophgo_pcie {
> > +	struct dw_pcie pci;
> > +	void __iomem *app_base;
> > +	struct clk_bulk_data *clks;
> > +	unsigned int clk_cnt;
> > +	struct reset_control *rst;
> 
> ... and this. It is unused.
> 
> 
> regards
> Philipp

Thanks, I will remove this.

Regards,
Inochi
