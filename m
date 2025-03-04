Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7022778F4C
	for <sophgo@lists.linux.dev>; Tue,  4 Mar 2025 00:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741048934; cv=none; b=npuyFSTrMZmUS126zGtDs/T2lBOUWS0PjX5OGi6eIgBe1n6G71sdyxCM+RUzTxFv1kSE6a8tu18yGKY7k/YkWo/1zbC50xXguX1bTFCFVOwx/PvZWibbjZFIKbrdInBEgiiKJ+5G8aP0pMZkIvLmSH8TOzdudt92I1rI6DOYkvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741048934; c=relaxed/simple;
	bh=GNfL2qC5c4jUOHJOSM6S0gz/n3qbC3I+1m4V2d8XCc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqHVzAa1fGjoH3g4LkEfepC+F8lcZvCUQsA3DRV61xPTvvMR9PHGeGitWwUDb1moNxUZCIDE/ZlTJFsrPRJB6PeKIsgh1w0yhtSpsIHwPdg2zDSY+Qd4RoEvEqa8swkXvhXVxwyGoHGnfw0OA7LV/K13XbVZ6BIM6HAbfp1qED4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbKJMuoi; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbKJMuoi"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c3b3e11f28so221571185a.1
        for <sophgo@lists.linux.dev>; Mon, 03 Mar 2025 16:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741048931; x=1741653731; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gxNe4AxjqQpAaoybhGjdA9/tvpgF72J/S4MlsUJ3y90=;
        b=nbKJMuoixylzeF6Z/n0XOt/0X/4P7ybFaX7dpqgEsdhxJhAOz0vY3WMGdnjruaKMHN
         Z19IFGjCFBDI7PnWBe7zGnpBww7bOxCf1UE4TWCcrFc4y8HkQlT7llCdP6UIR3W5PGcZ
         Ny6kL6pS5yfI1e5IcfvPY7D2i7P0zxoURDqaiQUk0N3NbbWD8gdNV19UTbp8vZp6OrBw
         fJszG1zGBZqTl+rOlGvSIPCSf9nn3vg3cFl/UxbRwr+1ANdAxHxbQDYXPMElJb/wiXaL
         I7rnN8VQwmgvu9uT9+QL5nFyvCScH2MYa2JP4XWkA1a+hF/rnEkeIaSypVIAsF1cB2gp
         lPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741048931; x=1741653731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxNe4AxjqQpAaoybhGjdA9/tvpgF72J/S4MlsUJ3y90=;
        b=DXhUnrk6Q5MhKPUrKN8WsiiYdfX1iQm6xSLvarP03U3zjXQcEkKuF5+Sh8YQ7DyoxC
         PiK+YglbQv6ok74RbNP8XGrA4U73t8BLcGWD2pmBVMU63Wd6TekOrvsA+H93FNBFfSAi
         7MSAiI8WdcsbYdK9dBKYy2oDAg63ZOyWlZ1Z4jajzrwFrcgKuuzBecl2ULg3xy+KB0WT
         PzDHOtQQvWDEgUx5cUYvFaIcFpeJ5ISwHCmmg3Ivt8lmHdcAb2bAs2zOgMT3ELJdp363
         +WmEFOisYJ2GbUQv2AcnOHuV6QPHZSB8pqeQb6PndD3eoauCqaqPbXh4SDEY9OviyWg3
         ycfA==
X-Forwarded-Encrypted: i=1; AJvYcCX8Vu93IqrKaKloauAu0fI1RvAOB+qyArvlPaua1KCo1/kqdPjcqnXI5MXa1KHeYrjGUaRgTgk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8nXY4IWAn9eSHv1yvmT1ViWKoPA3avYxWXinEQojx6joX6EjS
	Je2kPZpV3gPGjt991Yrv40HwwuwLMevc1rZWqoULBpdhwRIClQ/7
X-Gm-Gg: ASbGncswm02GQtJhv70r53eTnI10YXQOTvL942SFQKH9l0er3QpHkHdw9BeAjdQ3+Q1
	foDNJC98vcGAl43u5CsBAi4KJwh/OZ473xofcagZckTiWUKhsJSZD2DBm4gw+tj5G68UQAPiB3e
	mxzqUw/7A69MUP5H6RMbfgh630zIRV4i1NMQTZzYduLcdgWXzlUfI42Ja5+ZJoCtOAux/srA7d0
	AcuNtXw+wEfMBYCYhylkAdJz9ugqGvRDv7gAFQjQh7AmhRyKrp7tebHis1510r8FlUmLZOvW6xU
	urCccftsml0PdVYY6o6b
X-Google-Smtp-Source: AGHT+IHEle02VkkTCUKA++q4iryvBoKPXpR9o6rZ7Y0oiuWfh62nccflHOETM6sqmAhK1Bt/TseLOA==
X-Received: by 2002:a05:620a:8903:b0:7c3:cd78:df38 with SMTP id af79cd13be357-7c3cd78e308mr127164285a.10.1741048931148;
        Mon, 03 Mar 2025 16:42:11 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c36fee8abasm669532785a.7.2025.03.03.16.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 16:42:10 -0800 (PST)
Date: Tue, 4 Mar 2025 08:41:44 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI
 interrupt controller
Message-ID: <757rsspeayo5yzfrlzd7pe7aqzkhiycjsow6rfgo75sqkaow5t@b3eahj6dclmb>
References: <20250303111648.1337543-1-inochiama@gmail.com>
 <20250303111648.1337543-3-inochiama@gmail.com>
 <87y0xlc3mz.ffs@tglx>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0xlc3mz.ffs@tglx>

On Mon, Mar 03, 2025 at 08:31:32PM +0100, Thomas Gleixner wrote:
> On Mon, Mar 03 2025 at 19:16, Inochi Amaoto wrote:
> > Add support for Sophgo SG2044 MSI interrupt controller.
> 
> This patch fails to apply on top of:
> 
>      git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
> 
> Please always ensure that your patches apply against the tree/branch
> into which they are supposed to be merged. Grabbing random patches from
> the mailing list as base is not sufficient. It's clearly documented
> against what you should work.
>      

Thanks for pointing that, I will check the tip tree and see what
is conflicted. I forgot there will be something changed when
merging patch.

> > +struct sg2042_msi_of_data {
> 
> There is nothing specific to OF in this data structure. This structure
> contains the chip and the MSI parent ops of each variant. So something
> like sg204x_chip_info is way more descriptive.
> 

Yeah, chip_info it more clear than of_data. I have forgotten this
driver is not just for dtb but also UEFI fdt.

> > +	const struct irq_chip		*irqchip;
> > +	const struct msi_parent_ops	*parent_ops;
> > +};
> > +
> >  struct sg2042_msi_chipdata {
> 
> and rename that one to sg204x_... as it is not longer sg2042 specific.
> 

This is OK for me.

> >  	void __iomem	*reg_clr;	// clear reg, see TRM, 10.1.33, GP_INTR0_CLR
> >  
> > @@ -29,8 +34,10 @@ struct sg2042_msi_chipdata {
> >  	u32		irq_first;	// The vector number that MSIs starts
> >  	u32		num_irqs;	// The number of vectors for MSIs
> >  
> > -	DECLARE_BITMAP(msi_map, SG2042_MAX_MSI_VECTOR);
> > +	unsigned long	*msi_map;
> >  	struct mutex	msi_map_lock;	// lock for msi_map
> > +
> > +	const struct sg2042_msi_of_data	*data;
> 
> Please keep the tabular formatting of this struct. See:
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#coding-style-notes
> 
> >  };
> >  
> >  static int sg2042_msi_allocate_hwirq(struct sg2042_msi_chipdata *data, int num_req)
> > @@ -81,6 +88,37 @@ static const struct irq_chip sg2042_msi_middle_irq_chip = {
> >  	.irq_compose_msi_msg	= sg2042_msi_irq_compose_msi_msg,
> >  };
> >  
> > +static void sg2044_msi_irq_ack(struct irq_data *d)
> > +{
> > +	struct sg2042_msi_chipdata *data = irq_data_get_irq_chip_data(d);
> > +
> > +	writel(0, (unsigned int *)data->reg_clr + d->hwirq);
> > +
> 
> Pointless newline
> 
> > +	irq_chip_ack_parent(d);
> > +}
> > +
> > +static void sg2044_msi_irq_compose_msi_msg(struct irq_data *d,
> > +					   struct msi_msg *msg)
> 
> No line break required. Please use up to 100 characters.
> 
> >  static int sg2042_msi_parent_domain_alloc(struct irq_domain *domain,
> >  					  unsigned int virq, int hwirq)
> >  {
> > @@ -119,7 +157,7 @@ static int sg2042_msi_middle_domain_alloc(struct irq_domain *domain,
> >  			goto err_hwirq;
> >  
> >  		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
> > -					      &sg2042_msi_middle_irq_chip, data);
> > +					      data->data->irqchip, data);
> 
> The conversion of the existing code to this should be a preparatory patch
> for ease of review and the support for the new chip built on top.
> 
> Also please come up with a sensible name for this new 'data' pointer.
> 
>      data->data->
> 
> is horribly unintuitive. It's not the same data type. 
> 
>      data->chip_info
> 
> or such makes it clear what this is about.
> 

Good, I will take care of that.

Regards,
Inochi
