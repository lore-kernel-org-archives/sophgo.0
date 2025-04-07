Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7B318DB0C
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 03:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743998265; cv=none; b=rKZwL+tjwKDOmYgBuAYzNVb2zh2vz4piFOy2rAsmmlPhQICC4d1QVLX5O/WK7zLQ/gcm2inrlPMWGbicwJEsgxrsF2Cu/TdpKUphXWbyLDwQ2/9TbwIoIu53fwk3Leu2oyKtpSaf8wxUjN2VfhGhKmuYOCdm3WDBGm8urOMEbG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743998265; c=relaxed/simple;
	bh=Zl7zJlRHgV736TLgTKSkNSPMJeMp081ivuzgtiRLpB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1GneEsxBWHEsTrTx864ZG+MLGYuG32oXhRoGL46RPhEI01zfp7AsmDvNlJwPTbmhVSnm4ZUMPtaofTkl+zsqMHS59hkxTmIOEkBL60+SGzPri0iXSL3ObA3vjskfu+Nkfr1ag6ThBghQklnC45pIfs4NIBv8VsbkwjLoWDZ1Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIKN1lWx; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIKN1lWx"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c59e7039eeso580171685a.2
        for <sophgo@lists.linux.dev>; Sun, 06 Apr 2025 20:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743998262; x=1744603062; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R/CY5XdipwMeKeAFsG+OcOmPd/+b3qIxz+N90akQpaE=;
        b=kIKN1lWxNsqhnyRJ1I6lejx+90lk9tuVPzhMqqYi5YsGTm3FH/mmBmtLqxbnTk339s
         IRXQbMGnmrzvrMwWt7wf2EBTX27u3poZxIvAyqNvqSU8GX1K/1UeWVzjo2Qj7KmXXwKn
         6+DJ8skUFmwhZBFgshTeasBUVULwMJRg6shpG8kNfcmneSHI8T+DKutQqxZ/kMbDzkb0
         EqzjXyU+mAQCI5W+o0+61Avz7a64OTMIyQC3GXqYGO5F/1vFLyPoESDg+zCdcwNpTdWq
         fExGNDZXnX/uNvBvKKxDYlYiuUXiz8TekKWjifap8GXCxglpfZ3eVev6cxn5gpJL0RFW
         /rrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743998262; x=1744603062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/CY5XdipwMeKeAFsG+OcOmPd/+b3qIxz+N90akQpaE=;
        b=ry2NTAoyoAYO4416gfayO87/FGLnmeqv8Gq7eMA8TjDJ2N7f8vueNVGZe1MOgO5zG9
         xqgLjbVzaE8CA4hl1Q2FUJzOYwe62Y429NcKnWbBnRkx9CMS7Ymz2760uoOS2nfDtUiz
         7B5oITB4Rf7CpgliHqkL3FGJ7TNwrZ+98grwWSq5YVFPPvDx0dGXDG3YUlNBaexAFs89
         tWgU+NhI4bVizE/GXt33s2kyK9ih5ARCdaBVxwNBsBAl/dzELN01bEp9/1UuKT8307yp
         fcZak+eq7yx6vN7c8ubYqu0LNKwhuXWqcmrMqj8/Fb0AK8B8V4RhXq3qpI6bvXoC1ETW
         NCmA==
X-Forwarded-Encrypted: i=1; AJvYcCWnsj3YaGDttzw4GvJGeqbgpr81G/BruJ/wX0/5FONGdNBeG0tXtg/6XryXLbElmFnywHyq1F8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsnIO4o8F7bOtNtQuqghU4u80dqa4MyjZMSMUmWpzhiPLzTtWo
	4F6+WPuCvk7B7gOZa9MhzoCp8GP3naLV4xBFoC9CrHtqPuusQnHJ
X-Gm-Gg: ASbGncvJXl9kN3QnRs2btiuIr0ONCbZvYjO8rDRoZe8jqHZ1TzP2Q79jB/yfdWzYsQW
	l2hPPW55F7gKz5Ud/PbT/8s+A6gVyd66t3+m54pBOky6gtlJO+UJIn7Z7CtWqAXjv+wYqckYqDY
	ZjQUt4rHKCqfFf0Hp1i6D0IHIub0746aRWH/V2vZD3tKbBpoqn45hVyJTyVBA8Ngko6FcNmZfP+
	Yym0LDUZAMQcET1UpYQuUPzXGva+CCXX43gzKqN1YlE/YfG+wEE+aBSsv/D18j8gSedGcoDNtTd
	YveCVzPk3pFLbqDUDqFH
X-Google-Smtp-Source: AGHT+IG7S6m/etaeZaD9RBkFsyIrUD+K4SGfOdf76m1VNO2dvIgZVgFhj9vXuuhtf1aG6Yd6cTKDpw==
X-Received: by 2002:a05:620a:1a18:b0:7c5:674c:eecc with SMTP id af79cd13be357-7c774d718bfmr1429782085a.32.1743998262320;
        Sun, 06 Apr 2025 20:57:42 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76e75a605sm545114585a.29.2025.04.06.20.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 20:57:41 -0700 (PDT)
Date: Mon, 7 Apr 2025 11:57:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, ghost <2990955050@qq.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 9/9] riscv: dts: sophgo: Add initial device tree of
 Sophgo SRD3-10
Message-ID: <geunb7qwiniferytaufnekojx2eoq6g5scu6mddwf7gkspxucs@yynb6kfbspje>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-10-inochiama@gmail.com>
 <20250407020945-GYA13182@gentoo>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407020945-GYA13182@gentoo>

On Mon, Apr 07, 2025 at 02:09:45AM +0000, Yixun Lan wrote:
> 
> On 09:06 Mon 07 Apr     , Inochi Amaoto wrote:
> > Sophgo SG2044 SRD3-10 board bases on Sophgo SG2044 SoC.
> > This board includes 5 uart ports, 5 pcie x8 slots, 1 1G Ethernet port,
> > 1 microSD slot.
> > 
> > Add initial device tree of this board with uart support.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/Makefile           |    1 +
> >  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi   | 3002 +++++++++++++++++
> >  arch/riscv/boot/dts/sophgo/sg2044-reset.h     |  128 +
> >  .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   32 +
> >  arch/riscv/boot/dts/sophgo/sg2044.dtsi        |   86 +
> >  5 files changed, 3249 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-reset.h
> >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044.dtsi
> > 
> ..
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2044-reset.h b/arch/riscv/boot/dts/sophgo/sg2044-reset.h
> > new file mode 100644
> > index 000000000000..94ed1e3777c3
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/sg2044-reset.h
> > @@ -0,0 +1,128 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
> you might want to use your gmail suffix? IIRC your outlook account
> isn't preferable? besides, it's better cosistent with your signed-off
> 

Yeah, I forgot to change the copyright since this patch is wrote 
several months ago. I will update the copyright for this patch. 

Thanks for reminder.

Regards,
Inochi
