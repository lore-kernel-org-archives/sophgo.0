Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5381828BAAC
	for <sophgo@lists.linux.dev>; Tue, 10 Jun 2025 10:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550231; cv=none; b=ZVKTDzUMxcH9fDGRrp2gsDzL6m8FtHdJoh5+SP/o+792wgckLQwdTTjMKXhOVo5IaWAQxYhH3oXT/ciLVUA+TG2tANtkeAbzeO8Hkwmp7sltMs7ng6r+Z/ckDtgwbECG5kpV7lIOtkuJbv0oT2qZ6ar3oOEbf33lI0EkXFZQd+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550231; c=relaxed/simple;
	bh=1a2uGR6Hggo8VOu0l5znHZcibGlIdUBFaSSRApoVO0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcBZYlIUd3TqFYy2+BLHSUmMg3TIvCx/g3CE5ZMns85cxP8aHBCtGHgEsNiNTu7qdwD5E+Q3F+yuwzy8ZR833EZB9GfiCX7AWEnE1JNBuJF0z0xtsltx9RQ2XrN2zVLkR0Ra5kbt/yrpoYTvX+BQ94AQNxlFHk69PIhljfiIb1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W105gw8c; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W105gw8c"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6facc3b9559so74290516d6.0
        for <sophgo@lists.linux.dev>; Tue, 10 Jun 2025 03:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749550228; x=1750155028; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gf3+7W19a2JpnTuA8J09L80i/ft8MJ4HAXM5aOSCHo0=;
        b=W105gw8cWuiOHNauSUy/yo8v8a0kNupTnX8HLDeJDLdiuvMmxNhpW4EHjnAf/s7XTw
         OzULndg9lIcX/kpxmHGaYrBZAqvtNZOkrnoPvA41gU8iIPDO77zwQC/TJg3AU/D5No0d
         ayJfnoheUeloyzopPiAYF8ZEiFxptWRYHcq9J6qLlW979f8Mpe4DibFMEueRzoVthuS9
         iUBNFX153m0yF+YGErx4bKLspAwPaxZFoON2c7oURHL6YgWRVuwbSsjHTt3JzeCV5zYp
         5AkQEW2JtdIbKxJ+k/0iUzK1lJPzkBvp9omz7xdbS17Zd1ZlRpC4x6M3TmvGbfb4gRyP
         OC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550228; x=1750155028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf3+7W19a2JpnTuA8J09L80i/ft8MJ4HAXM5aOSCHo0=;
        b=DxwgkmfixgPfUpPYwQjFC3h/cWkCEiY75GaINmvAJ8fA4I83dezx7I85ZBkDY3kLRq
         P/Z2V6XB9Rd5Y/ijK/PZrDHcNtNS5ja9xyKDkTlsJU+ebOl9SrXV+OmydU7SUTtQRzBx
         9/SQJP9vzFkw/nVkSO2kraZM9piozi9O2Dk7hc6seeqhXWrN05EmbFQxBM8XGc0zSJuV
         dSVwNlgOQ515++5zmvhxzZCg/JdTrKofuA8kfziLQvWj/eX9y3e+1yYEdtnJMj62ohyi
         5ONzgq4WGWLkX0ZCbTSuLh/wpqWd6MOeYc3GBaCQbCr6vHR+XLeMCtpwm8x4CwSdBY+p
         WHVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfLZkFRD0w/MhW/UUjdPA8hyVUWlR3tYSw72NBMa1Men45t8Um7MNjEoBEZgTzHCY9l8vGq2Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YylC66lYuvgvCEzrNGfGkR6VatmLvfeiM6zHjD55/8FLJbL/T9G
	jf6DYmuk8yFGnqsoY0Q70ee8dhSpgu+jeV/RE7rwnNCtL75O6Z6SbkS7
X-Gm-Gg: ASbGncvwTMG8KCw5GWIuXuL/3LyTIGiZh0aP1R/kUF1D7ULrt+V9KQ0lPJDhKsltEX/
	8SX8pU7jazxh4o96oGBT09CBqwLr614xz9MEQT/8/TdK6+IEsLfQwF+eO9xNbVypWHbksyEjbHr
	2zcF6O7auV/FGVgYzFy+b5FUmqPZq3VGZaj4/IxkF2Ux5uBJNZu4IcCA7tNUx+4kcNNUxx7KxVY
	1rsbKrbhGbdzhuxJqFlW8yL1HQHWRQEVpO7ZsVL0ByopGKTutlx9KEtAfuc7Hvk4EHlQcCXPpM7
	jExICUbRCyGQy7M64gFyS7m1/DVpnCLZiMYlTA==
X-Google-Smtp-Source: AGHT+IFyUuIa85S9G+RrD2cesl/4jo/tt/ymXl8MdbmntlE1uodK2NX+6K9rfUlhfxF2KwH4Zl8yUQ==
X-Received: by 2002:a05:6214:1d23:b0:6e8:f770:5045 with SMTP id 6a1803df08f44-6fb08fccd19mr282965336d6.28.1749550228071;
        Tue, 10 Jun 2025 03:10:28 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ac94dcsm63471656d6.39.2025.06.10.03.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:10:27 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:09:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anup Patel <anup@brainfault.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
Subject: Re: [PATCH v2 4/7] irqchip: MIPS P800 variant of aclint-sswi
Message-ID: <iewyo4h3yiqnyn6qrgmckwcaalovpv2udf46jwpor4s5ni5bvu@eg2ikgmswcbg>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>

On Tue, Jun 10, 2025 at 01:05:37PM +0300, Vladimir Kondratiev wrote:
> Refactor Thead specific implementation of the ACLINT-SSWI irqchip.
> Factor out generic code that serves both Thead and MIPS variants.
> This generic part is according to the RISC-V draft spec [1].
> 
> Link: https://github.com/riscvarchive/riscv-aclint [1]
> 
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
>  drivers/irqchip/Kconfig                       | 16 ++++
>  drivers/irqchip/Makefile                      |  2 +-
>  ...d-c900-aclint-sswi.c => irq-aclint-sswi.c} | 93 +++++++++++++------
>  3 files changed, 82 insertions(+), 29 deletions(-)
>  rename drivers/irqchip/{irq-thead-c900-aclint-sswi.c => irq-aclint-sswi.c} (67%)
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 0d196e447142..be9b54900482 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -634,12 +634,28 @@ config STARFIVE_JH8100_INTC
>  
>  	  If you don't know what to do here, say Y.
>  
> +config ACLINT_SSWI
> +	bool
> +
> +config MIPS_P8700_ACLINT_SSWI
> +	bool "MIPS P8700 ACLINT S-mode IPI Interrupt Controller"
> +	depends on RISCV
> +	depends on SMP
> +	select IRQ_DOMAIN_HIERARCHY
> +	select GENERIC_IRQ_IPI_MUX
> +	select ACLINT_SSWI
> +	help
> +	  This enables support for MIPS P8700 specific ACLINT SSWI device
> +
> +	  If you don't know what to do here, say Y.
> +
>  config THEAD_C900_ACLINT_SSWI
>  	bool "THEAD C9XX ACLINT S-mode IPI Interrupt Controller"
>  	depends on RISCV
>  	depends on SMP
>  	select IRQ_DOMAIN_HIERARCHY
>  	select GENERIC_IRQ_IPI_MUX
> +	select ACLINT_SSWI
>  	help
>  	  This enables support for T-HEAD specific ACLINT SSWI device
>  	  support.
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 23ca4959e6ce..0458d6c5d161 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -105,7 +105,7 @@ obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
>  obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
>  obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
>  obj-$(CONFIG_STARFIVE_JH8100_INTC)	+= irq-starfive-jh8100-intc.o
> -obj-$(CONFIG_THEAD_C900_ACLINT_SSWI)	+= irq-thead-c900-aclint-sswi.o
> +obj-$(CONFIG_ACLINT_SSWI)		+= irq-aclint-sswi.o
>  obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
>  obj-$(CONFIG_IMX_INTMUX)		+= irq-imx-intmux.o
>  obj-$(CONFIG_IMX_MU_MSI)		+= irq-imx-mu-msi.o
> diff --git a/drivers/irqchip/irq-thead-c900-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
> similarity index 67%
> rename from drivers/irqchip/irq-thead-c900-aclint-sswi.c
> rename to drivers/irqchip/irq-aclint-sswi.c
> index 8ff6e7a1363b..ec21785df518 100644
> --- a/drivers/irqchip/irq-thead-c900-aclint-sswi.c
> +++ b/drivers/irqchip/irq-aclint-sswi.c
> @@ -3,7 +3,7 @@
>   * Copyright (C) 2024 Inochi Amaoto <inochiama@gmail.com>
>   */
>  
> -#define pr_fmt(fmt) "thead-c900-aclint-sswi: " fmt
> +#define pr_fmt(fmt) "aclint-sswi: " fmt
>  #include <linux/cpu.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> @@ -21,56 +21,51 @@
>  #include <asm/sbi.h>
>  #include <asm/vendorid_list.h>
>  
> -#define THEAD_ACLINT_xSWI_REGISTER_SIZE		4
> -
> -#define THEAD_C9XX_CSR_SXSTATUS			0x5c0
> -#define THEAD_C9XX_SXSTATUS_CLINTEE		BIT(17)
> -
>  static int sswi_ipi_virq __ro_after_init;
>  static DEFINE_PER_CPU(void __iomem *, sswi_cpu_regs);
>  
> -static void thead_aclint_sswi_ipi_send(unsigned int cpu)
> +static void aclint_sswi_ipi_send(unsigned int cpu)
>  {
>  	writel(0x1, per_cpu(sswi_cpu_regs, cpu));
>  }
>  
> -static void thead_aclint_sswi_ipi_clear(void)
> +static void aclint_sswi_ipi_clear(void)
>  {
>  	writel_relaxed(0x0, this_cpu_read(sswi_cpu_regs));
>  }
>  
> -static void thead_aclint_sswi_ipi_handle(struct irq_desc *desc)
> +static void aclint_sswi_ipi_handle(struct irq_desc *desc)
>  {
>  	struct irq_chip *chip = irq_desc_get_chip(desc);
>  
>  	chained_irq_enter(chip, desc);
>  
>  	csr_clear(CSR_IP, IE_SIE);
> -	thead_aclint_sswi_ipi_clear();
> +	aclint_sswi_ipi_clear();
>  
>  	ipi_mux_process();
>  
>  	chained_irq_exit(chip, desc);
>  }
>  
> -static int thead_aclint_sswi_starting_cpu(unsigned int cpu)
> +static int aclint_sswi_starting_cpu(unsigned int cpu)
>  {
>  	enable_percpu_irq(sswi_ipi_virq, irq_get_trigger_type(sswi_ipi_virq));
>  
>  	return 0;
>  }
>  
> -static int thead_aclint_sswi_dying_cpu(unsigned int cpu)
> +static int aclint_sswi_dying_cpu(unsigned int cpu)
>  {
> -	thead_aclint_sswi_ipi_clear();
> +	aclint_sswi_ipi_clear();
>  
>  	disable_percpu_irq(sswi_ipi_virq);
>  
>  	return 0;
>  }
>  
> -static int __init thead_aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
> -					      void __iomem *reg)
> +static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
> +					void __iomem *reg)
>  {
>  	struct of_phandle_args parent;
>  	unsigned long hartid;
> @@ -97,7 +92,7 @@ static int __init thead_aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
>  
>  		cpu = riscv_hartid_to_cpuid(hartid);
>  
> -		per_cpu(sswi_cpu_regs, cpu) = reg + i * THEAD_ACLINT_xSWI_REGISTER_SIZE;
> +		per_cpu(sswi_cpu_regs, cpu) = reg + hart_index * 4;
>  	}
>  
>  	pr_info("%pfwP: register %u CPU%s\n", fwnode, contexts, str_plural(contexts));
> @@ -105,17 +100,12 @@ static int __init thead_aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
>  	return 0;
>  }
>  
> -static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
> +static int __init aclint_sswi_probe(struct fwnode_handle *fwnode)
>  {
>  	struct irq_domain *domain;
>  	void __iomem *reg;
>  	int virq, rc;
>  
> -	/* If it is T-HEAD CPU, check whether SSWI is enabled */
> -	if (riscv_cached_mvendorid(0) == THEAD_VENDOR_ID &&
> -	    !(csr_read(THEAD_C9XX_CSR_SXSTATUS) & THEAD_C9XX_SXSTATUS_CLINTEE))
> -		return -ENOTSUPP;
> -
>  	if (!is_of_node(fwnode))
>  		return -EINVAL;
>  
> @@ -124,7 +114,7 @@ static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
>  		return -ENOMEM;
>  
>  	/* Parse SSWI setting */
> -	rc = thead_aclint_sswi_parse_irq(fwnode, reg);
> +	rc = aclint_sswi_parse_irq(fwnode, reg);
>  	if (rc < 0)
>  		return rc;
>  
> @@ -146,22 +136,68 @@ static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
>  	}
>  
>  	/* Register SSWI irq and handler */
> -	virq = ipi_mux_create(BITS_PER_BYTE, thead_aclint_sswi_ipi_send);
> +	virq = ipi_mux_create(BITS_PER_BYTE, aclint_sswi_ipi_send);
>  	if (virq <= 0) {
>  		pr_err("unable to create muxed IPIs\n");
>  		irq_dispose_mapping(sswi_ipi_virq);
>  		return virq < 0 ? virq : -ENOMEM;
>  	}
>  
> -	irq_set_chained_handler(sswi_ipi_virq, thead_aclint_sswi_ipi_handle);
> +	irq_set_chained_handler(sswi_ipi_virq, aclint_sswi_ipi_handle);
>  
>  	cpuhp_setup_state(CPUHP_AP_IRQ_THEAD_ACLINT_SSWI_STARTING,
> -			  "irqchip/thead-aclint-sswi:starting",
> -			  thead_aclint_sswi_starting_cpu,
> -			  thead_aclint_sswi_dying_cpu);
> +			  "irqchip/aclint-sswi:starting",
> +			  aclint_sswi_starting_cpu,
> +			  aclint_sswi_dying_cpu);
>  
>  	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
>  
> +	return 0;
> +}
> +

> +#if defined(CONFIG_MIPS_P8700_ACLINT_SSWI)
> +/* generic/MIPS variant */

I do not think there is a must to add these defines

Regards,
Inochi

> +static int __init generic_aclint_sswi_probe(struct fwnode_handle *fwnode)
> +{
> +	int rc;
> +
> +	rc = aclint_sswi_probe(fwnode);
> +	if (rc)
> +		return rc;
> +
> +	/* Announce that SSWI is providing IPIs */
> +	pr_info("providing IPIs using ACLINT SSWI\n");
> +
> +	return 0;
> +}
> +
> +static int __init generic_aclint_sswi_early_probe(struct device_node *node,
> +						  struct device_node *parent)
> +{
> +	return generic_aclint_sswi_probe(&node->fwnode);
> +}
> +IRQCHIP_DECLARE(generic_aclint_sswi, "mips,p8700-aclint-sswi", generic_aclint_sswi_early_probe);
> +#endif /* CONFIG_MIPS_P8700_ACLINT_SSWI */
> +
> +#if defined(CONFIG_THEAD_C900_ACLINT_SSWI)
> +
> +#define THEAD_C9XX_CSR_SXSTATUS			0x5c0
> +#define THEAD_C9XX_SXSTATUS_CLINTEE		BIT(17)
> +
> +/* THEAD variant */
> +static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
> +{
> +	int rc;
> +
> +	/* If it is T-HEAD CPU, check whether SSWI is enabled */
> +	if (riscv_cached_mvendorid(0) == THEAD_VENDOR_ID &&
> +	    !(csr_read(THEAD_C9XX_CSR_SXSTATUS) & THEAD_C9XX_SXSTATUS_CLINTEE))
> +		return -ENOTSUPP;
> +
> +	rc = aclint_sswi_probe(fwnode);
> +	if (rc)
> +		return rc;
> +
>  	/* Announce that SSWI is providing IPIs */
>  	pr_info("providing IPIs using THEAD ACLINT SSWI\n");
>  
> @@ -174,3 +210,4 @@ static int __init thead_aclint_sswi_early_probe(struct device_node *node,
>  	return thead_aclint_sswi_probe(&node->fwnode);
>  }
>  IRQCHIP_DECLARE(thead_aclint_sswi, "thead,c900-aclint-sswi", thead_aclint_sswi_early_probe);
> +#endif /* CONFIG_THEAD_C900_ACLINT_SSWI */
> -- 
> 2.43.0
> 
