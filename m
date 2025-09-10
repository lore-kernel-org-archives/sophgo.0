Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4056E24728E
	for <sophgo@lists.linux.dev>; Wed, 10 Sep 2025 02:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757472989; cv=none; b=sX9mqx4XVErBeY5I80qHxyfDx+Xsx/eb8i+1Yir31IlhWVTKgqG6llJD6cBpgSa1xj73wWqJIRstkoEP3c14vgpLMKs8Gcs0yB1ClYtmU+n4Ert4nTCKmtf13GMgVq9tmms6huPcWZarwv46K54t57q8bRN7RH5GbqBas8WZMF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757472989; c=relaxed/simple;
	bh=9aZWBowem9quzBxMewIkYmZOsbgydJUvO2LjN/H0tPI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9LJztbJ40tPcuNs3XyCpcDo9fVdj+AQ4HEnw899eZf8SQ5psVGaR2ZBB9YhjykprOAK32yqrYSV3sGhZkjZHZKEPJJeMvAus+Vm/UL7u+eMjxr539zm6RuGPvQaPZjS7XUWZkSu2CsiYbp07urz4+m4YHXswBuuama0UQHersY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmokqYgy; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmokqYgy"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24c7848519bso64785735ad.1
        for <sophgo@lists.linux.dev>; Tue, 09 Sep 2025 19:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757472987; x=1758077787; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bccMpZ/9BOkjWFOHbeJr/ZW3cHQMAN90oKmu+ORNptc=;
        b=KmokqYgy/hMDPMBnMYoE8Bm+pRw8ojNOLxxk1v0qekOyMkALfY/GTiHvw4+p6adbS6
         QVyYEfmKuvzaveuYU+W/WIoTMJTXqqGpiNQei30CBnibtkH+at5eGYX1e9SZCkmqPAid
         tKNYuo4LpXDAKVUzxT8ZWFZoObygptw42sn/+ZD6s1YGnJqj2ocsBRllsQD2e2Z3DzKG
         /AHX57bAbyZHzO54XkzAcvBMcsHCT7V9gOFOccrem/oniVxdjNVZO3X8giGsCC4Ov8LH
         0rc/j0Ctq7UWBvJ/LXMCO4omvUiDI+gC+4Hf0al/qzPah75cmuBVM3mMJcm3OEz8XpUN
         xL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757472987; x=1758077787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bccMpZ/9BOkjWFOHbeJr/ZW3cHQMAN90oKmu+ORNptc=;
        b=QWOZN9Urnr3s1T5SaSlEIAj7hm3OOIz9EcT6AvcSxiKK02A0rFUz5qKjES2R0f86c9
         fPzWPRHto3DPusHr+MyF3NYfJebasg/zYB+F73qc+niwwnBZocNKMlL5wXriTRHwIgPv
         07UxGN2oEQIXAkNDyv5K7NauL/BErZhKRNmzG4zrLXDchTUeYw0T5TnEagsibBbUtpfL
         MW5o67IPMxSWC5oBz/lQIdZuYITWYrTsVnhDaeocnETfusDZOiwVtVjVMfgSPkJpPEX8
         EUfUV06IFe4iSd2bZw7Y4Ji7z4DC+F2PWy5Dal3exHSdsWFVpKw0Q0eHmnnS+rMdfOQi
         IbxA==
X-Forwarded-Encrypted: i=1; AJvYcCUbREeLUwvEAiqTyCTrinB2Awfy+Sn3bhCOMtFthNZhuEXdEJcfRRXZmG0431gKjSWQABkW7po=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBEMKdI6/NjDmyczvqhJ9CKpzhdYCG7JJW+rX9QUqY5lnyn+gB
	LxiwDImQ9xcNu7RGprDgpIXapYkRGXs+PSyrnD9LYU/b8uYTyXn8a4Z6
X-Gm-Gg: ASbGnctsEHLBILw2kia4/5xYBj5oI1xX2FTqEVjUA+btl1HfLCnKLSALDscvQcewq1P
	NqwromRZoGaP9F/vXd/Z9a7yIkTx7pgUYBU9whGsePi0LqtTaW/l5pF08c6+NVbe2OhlSDfTPTQ
	4/XbW3E++JTtlCO/7tYmsx51xic8tGoeDx1foYP2ds1Qmr1V0Pm3lFpvH/uwq6d51OA1wwWWY9v
	uHXubRpXwrKyI2UDkxfurMp9LXVbEHH9ENwZHFOUZkeUcv8TXatCcGFMAyaWsUTxVpaXwYu4JZt
	8Xjijj8gv9gpwz1G7EhKMMGW1sA7cSiahmpNpmjnE0nWjGYIC3f6QNrAzks1GKm1iMSk/RXpIvC
	imjerBT6fmaotU31hiSwyG+kJZKq52nmQ
X-Google-Smtp-Source: AGHT+IFNBos7noDUln9W5GM7yi+/GGgz4QmYFcZtpZbyom0FkxzLpYxnYCZbcxZV/hMMSxTnIj0g7Q==
X-Received: by 2002:a17:903:1c2:b0:249:1213:6725 with SMTP id d9443c01a7336-251753d88d0mr190803255ad.50.1757472987403;
        Tue, 09 Sep 2025 19:56:27 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-32dbb5efe7asm650016a91.17.2025.09.09.19.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:56:27 -0700 (PDT)
Date: Wed, 10 Sep 2025 10:56:23 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicornxw@gmail.com>, kwilczynski@kernel.org, 
	u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, alex@ghiti.fr, arnd@arndb.de, 
	bwawrzyn@cisco.com, bhelgaas@google.com, unicorn_wang@outlook.com, 
	conor+dt@kernel.org, 18255117159@163.com, inochiama@gmail.com, kishon@kernel.org, 
	krzk+dt@kernel.org, lpieralisi@kernel.org, mani@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh@kernel.org, s-vadapalli@ti.com, tglx@linutronix.de, 
	thomas.richard@bootlin.com, sycamoremoon376@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, rabenda.cn@gmail.com, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
Subject: Re: [PATCH v2 3/7] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Message-ID: <xmk5uvnw7mcizxpaoarvx2c2sejaz2skaiyyac7oo5y6loyjgp@5v3sldwbqpw5>
References: <cover.1757467895.git.unicorn_wang@outlook.com>
 <162d064228261ccd0bf9313a20288e510912effd.1757467895.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162d064228261ccd0bf9313a20288e510912effd.1757467895.git.unicorn_wang@outlook.com>

On Wed, Sep 10, 2025 at 10:08:39AM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add support for PCIe controller in SG2042 SoC. The controller
> uses the Cadence PCIe core programmed by pcie-cadence*.c. The
> PCIe controller will work in host mode only, supporting data
> rate(gen4) and lanes(x16 or x8).
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  drivers/pci/controller/cadence/Kconfig       |  10 ++
>  drivers/pci/controller/cadence/Makefile      |   1 +
>  drivers/pci/controller/cadence/pcie-sg2042.c | 104 +++++++++++++++++++
>  3 files changed, 115 insertions(+)
>  create mode 100644 drivers/pci/controller/cadence/pcie-sg2042.c
> 
> diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
> index 666e16b6367f..02a639e55fd8 100644
> --- a/drivers/pci/controller/cadence/Kconfig
> +++ b/drivers/pci/controller/cadence/Kconfig
> @@ -42,6 +42,15 @@ config PCIE_CADENCE_PLAT_EP
>  	  endpoint mode. This PCIe controller may be embedded into many
>  	  different vendors SoCs.
>  
> +config PCIE_SG2042_HOST
> +	tristate "Sophgo SG2042 PCIe controller (host mode)"
> +	depends on OF && (ARCH_SOPHGO || COMPILE_TEST)
> +	select PCIE_CADENCE_HOST
> +	help
> +	  Say Y here if you want to support the Sophgo SG2042 PCIe platform
> +	  controller in host mode. Sophgo SG2042 PCIe controller uses Cadence
> +	  PCIe core.
> +
>  config PCI_J721E
>  	tristate
>  	select PCIE_CADENCE_HOST if PCI_J721E_HOST != n
> @@ -67,4 +76,5 @@ config PCI_J721E_EP
>  	  Say Y here if you want to support the TI J721E PCIe platform
>  	  controller in endpoint mode. TI J721E PCIe controller uses Cadence PCIe
>  	  core.
> +
>  endmenu
> diff --git a/drivers/pci/controller/cadence/Makefile b/drivers/pci/controller/cadence/Makefile
> index 9bac5fb2f13d..5e23f8539ecc 100644
> --- a/drivers/pci/controller/cadence/Makefile
> +++ b/drivers/pci/controller/cadence/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_PCIE_CADENCE_HOST) += pcie-cadence-host.o
>  obj-$(CONFIG_PCIE_CADENCE_EP) += pcie-cadence-ep.o
>  obj-$(CONFIG_PCIE_CADENCE_PLAT) += pcie-cadence-plat.o
>  obj-$(CONFIG_PCI_J721E) += pci-j721e.o
> +obj-$(CONFIG_PCIE_SG2042_HOST) += pcie-sg2042.o
> diff --git a/drivers/pci/controller/cadence/pcie-sg2042.c b/drivers/pci/controller/cadence/pcie-sg2042.c
> new file mode 100644
> index 000000000000..c026e1ca5d6e
> --- /dev/null
> +++ b/drivers/pci/controller/cadence/pcie-sg2042.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * pcie-sg2042 - PCIe controller driver for Sophgo SG2042 SoC
> + *
> + * Copyright (C) 2025 Sophgo Technology Inc.
> + * Copyright (C) 2025 Chen Wang <unicorn_wang@outlook.com>
> + */
> +
> +#include <linux/mod_devicetable.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "pcie-cadence.h"
> +
> +/*
> + * SG2042 only supports 4-byte aligned access, so for the rootbus (i.e. to
> + * read/write the Root Port itself, read32/write32 is required. For
> + * non-rootbus (i.e. to read/write the PCIe peripheral registers, supports
> + * 1/2/4 byte aligned access, so directly using read/write should be fine.
> + */
> +
> +static struct pci_ops sg2042_pcie_root_ops = {
> +	.map_bus	= cdns_pci_map_bus,
> +	.read		= pci_generic_config_read32,
> +	.write		= pci_generic_config_write32,
> +};
> +
> +static struct pci_ops sg2042_pcie_child_ops = {
> +	.map_bus	= cdns_pci_map_bus,
> +	.read		= pci_generic_config_read,
> +	.write		= pci_generic_config_write,
> +};
> +
> +static int sg2042_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct pci_host_bridge *bridge;
> +	struct cdns_pcie *pcie;
> +	struct cdns_pcie_rc *rc;
> +	int ret;
> +
> +	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*rc));
> +	if (!bridge) {
> +		dev_err_probe(dev, -ENOMEM, "Failed to alloc host bridge!\n");
> +		return -ENOMEM;
> +	}
> +
> +	bridge->ops = &sg2042_pcie_root_ops;
> +	bridge->child_ops = &sg2042_pcie_child_ops;
> +
> +	rc = pci_host_bridge_priv(bridge);
> +	pcie = &rc->pcie;
> +	pcie->dev = dev;
> +
> +	platform_set_drvdata(pdev, pcie);
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_no_callbacks(dev);
> +	devm_pm_runtime_enable(dev);
> +
> +	ret = cdns_pcie_init_phy(dev, pcie);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to init phy!\n");
> +		return ret;
> +	}
> +
> +	ret = cdns_pcie_host_setup(rc);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to setup host!\n");
> +		cdns_pcie_disable_phy(pcie);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +

> +static void sg2042_pcie_remove(struct platform_device *pdev)
> +{
> +	struct cdns_pcie *pcie = platform_get_drvdata(pdev);
> +
> +	cdns_pcie_disable_phy(pcie);
> +}
> +

I think this remove is useless, as it is almost impossible to
remove a pcie at runtime.

Regards,
Inochi
