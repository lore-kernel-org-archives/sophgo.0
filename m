Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56128207DEA
	for <sophgo@lists.linux.dev>; Mon, 24 Feb 2025 23:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740440376; cv=none; b=C8sCL+pKwv4wHKUaHGC31VDYCOztJ44A+Ay5AvTdYbH2rla5x5k8HbKUpRVt7bgyUcc5DW/sxesYNvwvZexONoCoDdox2n6djspiXyDJ2111DXDqImSwo86fOfGlhXuIunJO1nlVms2TPwwLCv+MHtew+hZbD7hEGfIpLJf0nrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740440376; c=relaxed/simple;
	bh=H/fdp/lgu3P0d5FbePVHc4hZ2QR1bTnY+ap8F4xxnTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nt8bBMtFydHkn2OQ5KKCzMXjOjzfMy6ZiTBg3wtJpXJCISN7ASHrOPQ8zzxdHYpypfe9LY0EflN4JCY3UIsmHa9rbYgZ3RWiEbLWhL4S+HJ+dA6RLYsGGn70hCe28P/60Gd20HU9lbzpwTm5BolDsOwqGlr+G773piz95gbSyyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6h/zwaK; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6h/zwaK"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c0ba9825e9so318087685a.0
        for <sophgo@lists.linux.dev>; Mon, 24 Feb 2025 15:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740440373; x=1741045173; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I28BvW8sYtCIJpp5k7EPbcyeOkG6IabIbB4ctmQvitg=;
        b=Q6h/zwaKt9AOJVwuXscLy9jQEfFbljmlLd1haHzxfVEHmgAil855QfSOmn05LtZCTQ
         vsdoatyD9ppuJIAql/mrbBqTHomuySCbDX4x7LxtdUDCWmd1aQeX/0uuoJlEgSjCWAMM
         5X3jarXalPytWYDV8SoEfMgUVzMssnEyRHRoHrHlwcRGiXutRw2rBh98nRpLruEFaF1G
         /FjtAOxYjr8L1925YGBfEXB5pGfwV3ZZiMx7LmL78TWp1N2f0TE5MZsF22wV8afmUZs2
         DBqDeKqVhZotJn6hrw7pIrBnDClRi5Ual5D+/wWkQDksnYV3ghQVSBdbMNxlquSJrujJ
         0Oow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740440373; x=1741045173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I28BvW8sYtCIJpp5k7EPbcyeOkG6IabIbB4ctmQvitg=;
        b=HpiTNzAuXT2BmoeYCkMLcIj2OJGroNiRy7OiC/O8e2D7j3MhW18iSXmRWM12LxDzkY
         59An9/UGTljuKzx183iPgsRhP/3mWVOzGlumAVY+ITGeewe3dSNpHd8Xbcr7UCawgImD
         O26uM9zfmnR1617cgASnQ7Aqvplz76hriPmuwEYPba+uPTTs06ErfPHMetWV6WWDNKvR
         Ii/MrzJZv/3v603BTSgjYX8+0+ry50Jl9jGt9APq1o2I+YBTfHAbG11crIfyFeC2tvTf
         FKVbNMCySrfCsgH2y9ta7qkEerCykzahnWtq9kygpeXXAK2XVvryQIEZgh6r4xjGJ0oV
         bPGA==
X-Forwarded-Encrypted: i=1; AJvYcCUwn0pnh1znrI3duFpXGIrSSe7TE5tnpumEs4Vr6N9obBs9CgYk3egKqdcmWtZdx8KpZteYtnc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUPPBy4rng49v6BrRCfdxSa9b9MhD1yIwTYr5tUlmNlpIE/EVZ
	ef+5Tek4lRncowFI0qjmwt3QdN/+FxTGHXJvzkTKHCQ798jg1+NG
X-Gm-Gg: ASbGncuOygIJk7V8hgJcmrY0FPjJWIEk5REoQRDvvAalayR98j8xr62nAKXXhYv2KJ7
	dXGudw4u3MyfWISMx2NvKDSQgnC2G4ea5GFbHJx1LSqIN6yYrB6sWCNU6CPfTjPonso0L8sbahX
	UUnhdUd8bcriMovfzrjd4Sx12SjORv0jbCIe/EpNyb4DGkEetpJ8cOXjbrWQMHuDsjIulXYZ0yq
	Q2m6ha7eRheHPTyjnnIUkA2tE8OFAGcS5VEjOSCSAzw572ik+ifmQm9Zhlbvqcv3pASv6kvFe4e
	PQ==
X-Google-Smtp-Source: AGHT+IFwSiY82sk1UHPy1sh4TaxDRFtt/bKpmiKYsLl62LaJzeIFLc36bW8vjGEj+Z6l8tQnP1hrSg==
X-Received: by 2002:a05:620a:600b:b0:7c0:b368:5d78 with SMTP id af79cd13be357-7c0ceeea4e1mr2231799485a.9.1740440373095;
        Mon, 24 Feb 2025 15:39:33 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c23c299259sm35457385a.14.2025.02.24.15.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 15:39:32 -0800 (PST)
Date: Tue, 25 Feb 2025 07:39:13 +0800
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
Message-ID: <jq55rzcvcp6bxfk3klkomr3gtzqgkwqb2qpjnfndymomaac6ry@5jmzq6vlpu2u>
References: <fanm6m6fx6cqwalhdvrxmjzsluiyptbvrwbi5ufwbqmxsf62xl@lntprhkjv6tm>
 <20250224194725.GA473475@bhelgaas>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224194725.GA473475@bhelgaas>

On Mon, Feb 24, 2025 at 01:47:25PM -0600, Bjorn Helgaas wrote:
> On Sat, Feb 22, 2025 at 08:43:46AM +0800, Inochi Amaoto wrote:
> > On Fri, Feb 21, 2025 at 05:49:58PM -0600, Bjorn Helgaas wrote:
> > > On Fri, Feb 21, 2025 at 09:37:56AM +0800, Inochi Amaoto wrote:
> > > > Add support for DesignWare-based PCIe controller in SG2044 SoC.
> > > 
> > > > @@ -341,6 +341,16 @@ config PCIE_ROCKCHIP_DW_EP
> > > >  	  Enables support for the DesignWare PCIe controller in the
> > > >  	  Rockchip SoC (except RK3399) to work in endpoint mode.
> > > >  
> > > > +config PCIE_SOPHGO_DW
> > > > +	bool "SOPHGO DesignWare PCIe controller"
> > > 
> > > What's the canonical styling of "SOPHGO"?  I see "Sophgo" in the
> > > subject line and in Chen Wang's SG2042 series.  Pick the official
> > > styling and use it consistently.
> > 
> > This is my mistake. It should be "Sophgo", I will change it.
> > 
> > > Reorder this so the menuconfig menu items remain alphabetically
> > > sorted.
> > 
> > I think this order is applied to the entry title in menuconfig,
> > and is not the config key? If so, I will change it.
> 
> It's the title shown by menuconfig, i.e., "SOPHGO DesignWare PCIe
> controller" here.

Thanks, I will reorder it.

Regards,
Inochi
