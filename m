Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E47BBE65
	for <sophgo@lists.linux.dev>; Tue, 25 Feb 2025 02:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740451615; cv=none; b=Xy/l8emitCcSxUo6y6EAw54ktQJ+yePBtaAswTbxf+x6oELCBZ3H37R+U56gGMwqSY9Xs6pSu3S444MHPhbZByi0/u+CKrd+6uIBWdYzOcAjci+6WJ1rDlcoFUgxP+j3lMMbFENTK3edZmkufbTXqxOveG2SyCWRdI3tv2wu/7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740451615; c=relaxed/simple;
	bh=9sjMRPauckJrui2CkfrQ3cYi2VYBntbBubLUjwdMQjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRyMbU0r0Uo3PzG9Q2ev5iIxqnsmfjQ/cHfdXwAzg2iYqohihHYWiVsdcOV/OWiKWXxrbaN4zrVxvIT8sFv+gMJw3BQIEOpbvuuFo9uDKm3/rL+KtpVqCjTlzTyu1lGebj4krPMi40CKMxTviPUwgH/M7lJR0uQnR4WJi20pyWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSt1GxDa; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSt1GxDa"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220c8f38febso107871675ad.2
        for <sophgo@lists.linux.dev>; Mon, 24 Feb 2025 18:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740451613; x=1741056413; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BmIWyDzbi7XG4PWOrNU7Jp5a97tuft4JsdTFHE1ZFT4=;
        b=SSt1GxDaXqYy1ew0SZUkpDrqTwjzWbHtlZyjiC0Kr8eTvTcC1hC4SOLtyQBEZuIg4Q
         Pqg8WB/A/C3/Ve/C4/aQt4fdCNllfKV1N5iaH6f448UPCbaP+fhCE3tAeXYaU914xveU
         ZSpUeX63vxYbYPC0ZOohWmibidZUTzrBPGUKSwguNQIdCfw2emMXIuG0bjvLDaoSmkjB
         TIYbwLqyCMOJHa1YiriBFsJXBOiSfElIb6O6Mo/QdwBjG2zZeBnAn+V589f083tQushC
         QVvWcrfH7+PgLuoALRPFJmpGgx2a4t/0jMvABhUWDQB67v+0pxB1jdrXYK1Et2ztK7ce
         GQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740451613; x=1741056413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmIWyDzbi7XG4PWOrNU7Jp5a97tuft4JsdTFHE1ZFT4=;
        b=gPUD7CtTIDgRId5kS6HlZo6sBSaNZSg7QigOAvvmDEOyrde7cKrstHqgG4L3yWvdfX
         oikLUoZ8sstEOwDKqIkkOGbGmBvYSbfP+XzJ4nrEA8Eea+dLcXyuZmjAXkDAzKP7KDfy
         /oZXYC70Jcz6Wi147VX313rci3NA3xJ/kNgzSO8ymHjLIRVPqHG8vm7WM2m5A++nYrz4
         wtTN9AoXk8EqOjDfF1ALyhJ3sbU4KcGX62ae30DuOhoS49J3xBchelO5yF/BcsUP+M7G
         vFLRQFD2PfBf925HBHTSKGWJFZmWi5pWDA2aT2ZmnjtB5yKDNGcF6KQM+s9f1L46ODGn
         PqEg==
X-Forwarded-Encrypted: i=1; AJvYcCW6/9KziEH/2GZJJTiOIYnC9U7yLhijuP/XGDbKZ3HkGtWPY7f1OibXftDTocmaVtT1+iLWW0I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz74NQjkUxtIQnqi6EWXOQkhptZ2nI3uqmIKb6cW0HD3i6aANPd
	S6E8bw/PQ6Ynh383XGKj5AzaMrKqKbTwvxGPKDWchANd457f3/Cj
X-Gm-Gg: ASbGncvPTw729QtjKWPOkr1ckBJdqmUzlGDOQV60HgQdRV9MpaAUNWIJ+SF3OK6lVZ/
	VwELnMJffpTc7Dkwe7GZyIlkOGSQEJHfS8I7zVo62pQ0Fx999+T+fKH08uQFoZiiGy5Q3yWGbM5
	yq0Jdgz1yguC8IA/0FmKBHwCS3Y8IVha8xZSQxyeOufvnaMKKDvjrD2iBt3EL2GABJoR/8uOg1J
	EwsF4DBXByriXQRa34wvicy2QPAcHC/TF0cO9/CcdBjFE4QWe3uHKCjEqfu4ucCTvPyZGK9E3Vr
	kQKsGdCVGQXSke8fSjop4hk=
X-Google-Smtp-Source: AGHT+IG62mV9bUNCTrCikvFZ49tzCfx9NyDU8cgaFnBUFHLGXzqnYJ/ncZN2tiei9ufed4SF/bBPXw==
X-Received: by 2002:a17:903:41d2:b0:21f:33:ad2 with SMTP id d9443c01a7336-221a003892emr229965215ad.52.1740451613128;
        Mon, 24 Feb 2025 18:46:53 -0800 (PST)
Received: from localhost ([111.34.70.129])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2230a00ab6bsm3279565ad.58.2025.02.24.18.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 18:46:52 -0800 (PST)
Date: Tue, 25 Feb 2025 10:46:49 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	looong.bin@gmail.com
Subject: Re: [PATCH 2/3] spi: sophgo: add Sophgo SPI NOR controller driver
Message-ID: <6sjygqay4kpwupau7gx5uulo4t32c3rn5kiktqxp6t2phi45ly@elsqfqzpnumz>
References: <20250224101213.26003-1-looong.bin@gmail.com>
 <20250224101213.26003-3-looong.bin@gmail.com>
 <20250224132115-GYA41655@gentoo>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224132115-GYA41655@gentoo>

On Mon, Feb 24, 2025 at 01:21:15PM +0000, Yixun Lan wrote:
> Hi Longbin:
> 
> On 18:12 Mon 24 Feb     , Longbin Li wrote:
> > Add support for Sophgo SPI NOR controller in Sophgo SoC.
> > 
> > Signed-off-by: Longbin Li <looong.bin@gmail.com>
> > ---
> >  drivers/spi/Kconfig          |   9 +
> >  drivers/spi/Makefile         |   1 +
> >  drivers/spi/spi-sophgo-nor.c | 501 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 511 insertions(+)
> >  create mode 100644 drivers/spi/spi-sophgo-nor.c
> > 
> > diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> > index ea8a31032927..6b6d7b348485 100644
> > --- a/drivers/spi/Kconfig
> > +++ b/drivers/spi/Kconfig
> > @@ -1021,6 +1021,15 @@ config SPI_SN_F_OSPI
> >  	  for connecting an SPI Flash memory over up to 8-bit wide bus.
> >  	  It supports indirect access mode only.
> > 
> > +config SPI_SOPHGO_NOR
> > +	tristate "Sophgo SPI NOR Controller"
> > +	depends on ARCH_SOPHGO || COMPILE_TEST
> > +	help
> > +	  This enables support for the Sophgo SPI NOR controller,
> > +	  which supports Dual/Qual read and write operations while
> > +	  also supporting 3Byte address devices and 4Byte address
> > +	  devices.
> > +
> >  config SPI_SPRD
> >  	tristate "Spreadtrum SPI controller"
> >  	depends on ARCH_SPRD || COMPILE_TEST
> > diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
> > index 9db7554c1864..9ded1de4b2fd 100644
> > --- a/drivers/spi/Makefile
> > +++ b/drivers/spi/Makefile
> > @@ -134,6 +134,7 @@ obj-$(CONFIG_SPI_SH_SCI)		+= spi-sh-sci.o
> >  obj-$(CONFIG_SPI_SIFIVE)		+= spi-sifive.o
> >  obj-$(CONFIG_SPI_SLAVE_MT27XX)          += spi-slave-mt27xx.o
> >  obj-$(CONFIG_SPI_SN_F_OSPI)		+= spi-sn-f-ospi.o
> > +obj-$(CONFIG_SPI_SOPHGO_NOR)	+= spi-sophgo-nor.o
> >  obj-$(CONFIG_SPI_SPRD)			+= spi-sprd.o
> >  obj-$(CONFIG_SPI_SPRD_ADI)		+= spi-sprd-adi.o
> >  obj-$(CONFIG_SPI_STM32) 		+= spi-stm32.o
> > diff --git a/drivers/spi/spi-sophgo-nor.c b/drivers/spi/spi-sophgo-nor.c
> > new file mode 100644
> > index 000000000000..1139deeac327
> > --- /dev/null
> > +++ b/drivers/spi/spi-sophgo-nor.c
> > @@ -0,0 +1,501 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Sophgo SPI NOR controller driver
> > + *
> > + * Copyright (c) 2025 Longbin Li <looong.bin@gmail.com>
> > + */
> > +
> > [...]
> > +struct sophgo_spifmc {
> > +	struct spi_controller *ctrl;
> > +	void __iomem *io_base;
> > +	struct device *dev;
> > +	struct mutex lock;
> it will be great to document the lock

Thanks, but I don't think the function of this lock is complicated,
adding comments may be useless.

> > +	struct clk *clk;
> > +};
> > +
> > +static int sophgo_spifmc_wait_int(struct sophgo_spifmc *spifmc, u8 int_type)
> > +{
> > +	u32 stat;
> > +
> > +	return readl_poll_timeout(spifmc->io_base + SPIFMC_INT_STS, stat,
> > +				  (stat & int_type), 0, 1000000);
> > +}
> > +
> > +
> > [...]
> > +static ssize_t sophgo_spifmc_trans_reg(struct sophgo_spifmc *spifmc,
> > +				       const struct spi_mem_op *op)
> > +{
> > +	const u8 *dout = NULL;
> > +	u8 *din = NULL;
> > +	size_t len = op->data.nbytes;
> > +	u32 reg;
> > +	int ret;
> > +	int i;
> squash them which save one line:
> 	int i, ret;
> 

Thanks, I will modify it.

> > +
> > +	if (op->data.dir == SPI_MEM_DATA_IN)
> > +		din = op->data.buf.in;
> > +	else
> > +		dout = op->data.buf.out;
> > +
> > +	reg = sophgo_spifmc_init_reg(spifmc);
> > +	reg |= SPIFMC_TRAN_CSR_FIFO_TRG_LVL_1_BYTE;
> > +	reg |= SPIFMC_TRAN_CSR_WITH_CMD;
> > +
> > +	if (din) {
> > +		reg |= SPIFMC_TRAN_CSR_BUS_WIDTH_1_BIT;
> > +		reg |= SPIFMC_TRAN_CSR_TRAN_MODE_RX;
> > +		reg |= SPIFMC_TRAN_CSR_TRAN_MODE_TX;
> > +
> > +		writel(SPIFMC_OPT_DISABLE_FIFO_FLUSH, spifmc->io_base + SPIFMC_OPT);
> > +	} else {
> > +		/*
> > +		 * If write values to the Status Register,
> > +		 * configure TRAN_CSR register as the same as
> > +		 * sophgo_spifmc_read_reg.
> > +		 */
> > +		if (op->cmd.opcode == 0x01) {
> > +			reg |= SPIFMC_TRAN_CSR_TRAN_MODE_RX;
> > +			reg |= SPIFMC_TRAN_CSR_TRAN_MODE_TX;
> > +			writel(len, spifmc->io_base + SPIFMC_TRAN_NUM);
> > +		}
> > +	}
> > +
> > +
> > [...]
> > +static const struct spi_controller_mem_ops sophgo_spifmc_mem_ops = {
> > +	.exec_op = sophgo_spifmc_exec_op,
> > +};
> > +
> > +static void sophgo_spifmc_init(struct sophgo_spifmc *spifmc)
> > +{
> > +	u32 tran_csr;
> > +	u32 reg;
> > +
> > +	writel(0, spifmc->io_base + SPIFMC_DMMR);
> > +
> > +	reg = readl(spifmc->io_base + SPIFMC_CTRL);
> > +	reg |= SPIFMC_CTRL_SRST;
> ..
> > +	reg &= ~((1 << 11) - 1);
> so this is a mask? use macro to define, instead of using magic number

Yes, this is a mask to init SPI Clock Divider, I will add a macro, thanks.

> > +	reg |= 1;
> > +	writel(reg, spifmc->io_base + SPIFMC_CTRL);
> > +
> > +	writel(0, spifmc->io_base + SPIFMC_CE_CTRL);
> > +
> > +	tran_csr = readl(spifmc->io_base + SPIFMC_TRAN_CSR);
> > +	tran_csr |= (0 << SPIFMC_TRAN_CSR_ADDR_BYTES_SHIFT);
> > +	tran_csr |= SPIFMC_TRAN_CSR_FIFO_TRG_LVL_4_BYTE;
> > +	tran_csr |= SPIFMC_TRAN_CSR_WITH_CMD;
> > +	writel(tran_csr, spifmc->io_base + SPIFMC_TRAN_CSR);
> > +}
> > +
> > +static int sophgo_spifmc_probe(struct platform_device *pdev)
> > +{
> > +	struct spi_controller *ctrl;
> > +	struct sophgo_spifmc *spifmc;
> > +	void __iomem *base;
> > +	int ret;
> > +
> > +	ctrl = devm_spi_alloc_host(&pdev->dev, sizeof(*spifmc));
> > +	if (!ctrl)
> > +		return -ENOMEM;
> > +
> > +	spifmc = spi_controller_get_devdata(ctrl);
> > +	dev_set_drvdata(&pdev->dev, ctrl);
> > +
> ..
> > +	spifmc->clk = devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(spifmc->clk)) {
> > +		dev_err(&pdev->dev, "AHB clock not found.\n");
> > +		return PTR_ERR(spifmc->clk);
> > +	}
> > +
> > +	ret = clk_prepare_enable(spifmc->clk);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Unable to enable AHB clock.\n");
> > +		return ret;
> > +	}
> you can combine above with devm_clk_get_enabled(), and simplify 
> return routine by using "return dev_err_probe(..)"
> 

Thanks, I will modify it.

> > +
> > +	spifmc->dev = &pdev->dev;
> > +	spifmc->ctrl = ctrl;
> > +
> > +	spifmc->io_base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	ctrl->num_chipselect = 1;
> > +	ctrl->dev.of_node = pdev->dev.of_node;
> > +	ctrl->bits_per_word_mask = SPI_BPW_MASK(8);
> > +	ctrl->auto_runtime_pm = false;
> > +	ctrl->mem_ops = &sophgo_spifmc_mem_ops;
> > +	ctrl->mode_bits = SPI_RX_DUAL | SPI_TX_DUAL | SPI_RX_QUAD | SPI_TX_QUAD;
> > +
> > +	mutex_init(&spifmc->lock);
> strictly, you still need to do error handler, e.g, destroy mutex if probe fail

Thanks, I will add it.

> > +
> > +	sophgo_spifmc_init(spifmc);
> > +	sophgo_spifmc_init_reg(spifmc);
> > +
> > +	return devm_spi_register_controller(&pdev->dev, ctrl);
> > +}
> > +
> > [...]
> 
> -- 
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55
