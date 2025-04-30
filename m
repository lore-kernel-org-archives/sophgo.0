Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEAD1DE3D6
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 22:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746052720; cv=none; b=lM0PwPdcX5aPvZ3pTia5vT9qaMKfGXXP71SUbnZT2Xou+//D9cWUU3v4Q5kqtbWOzyJGTLirnKg1i2OKhmbwFiFLJuZzFGvnoE/q357D/ee2zK3Ckk0ycScLOsFrJigt1RWwpxuCo5ke63arF4c4YfztXxEztNSfxQqgVyELvTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746052720; c=relaxed/simple;
	bh=j0wnjooFp3JJtS2LTkueCo6fpgCMwlyPh6llYs4IbKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rABHaT7m0VTAeVOL2HCAtQlr6g+/d77/Wa+3rrjxJzYT/iXzQDwEwvDPrM7+/z9tMJVO0/7lszKsU3/pVbt2zYzmnZ180bTrjaq2RsF06TNJElIQ+p6ioh2jTSfSVtLAL86HmTUMbU9FZPNeuzTBY3BxEr60xtvF2Ki4i39VXzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WG1VTDmY; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WG1VTDmY"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c5e1b40f68so36479385a.1
        for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 15:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746052718; x=1746657518; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vQMd4+KE05AiC2tiYMqBEsrGqf6EspjdNnY21/A2l/0=;
        b=WG1VTDmYdfGufNZazt14f9p+Sz8UbTCmUqhZg1rKztokfAbkVed/QplTMquxdic3y7
         DAcLVFRY5jLdvSS8tRkaAiWJaeAEzLT4zTB47oXXzo5f1zYJtjZvBfxM70FCHPp0qE5A
         3bob6H7ZYzbmXhITr4pDwFm8KJfrBpYe4O+75l6ySh4gAgXl8cdrVRY0idlgJtp8aihy
         WWlhARDtPLRBHe3lSiXU3uOCb/tSU3Jc6bpEGiIwiUibQmHQklFBvikv3xAn1ckqzJcR
         fX+XImsS9jU/unBIil0H9Bm2p1ld6P2Gg1VJ3h/sTgANhc/AVyeYt4GNnZMNkolQSo1W
         PMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746052718; x=1746657518;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vQMd4+KE05AiC2tiYMqBEsrGqf6EspjdNnY21/A2l/0=;
        b=RMh9TCZhMpXDvYITHMZnX8rkWLBJJqQSgWgDsQrs0cluOWZzgtfrzGp7colaC8EWjz
         hD6lKs4XVVOLZvchcMTNkVoQbq1p3ZN/OsDdgTSJsfmIsL2gjmCF+3WuR7306YiMeNIr
         344zrjPyQncFN+HnvxRmf6P+rby9OgOewAm4hYCFz/hfJk1p0oeuv5yQlFqF+RSqSnIG
         4t6fehbrFdkeDCOcHrbWsX95Lql19qq2RkAQNy4kxK4XUlLj/J0kROq0ihKu42EmjHLy
         3lOYO9OVMQ0JMHAhAYoIzx5jk9EnBtUzoBNP/m+lUj/j8U3Do/1ERETXOl/fLUnwEXp5
         OEoA==
X-Forwarded-Encrypted: i=1; AJvYcCVCm1VuicbnpHKwK+1+d/jgAysQ2GdRqHCKzF1j5ZkTXGlZEUI+1HW64j6QMFKkiVsNd3ZeeVU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+Q5LIHiF9ew7bRMg/K7O4JgzGntpA6H4wCijXcIGotoH5C9mT
	XkIk3HCQV8biljok9Jo+5uIlr/o+GC+OypRljsns39drGls1y7wX
X-Gm-Gg: ASbGnctGdqYfeiZAZwiHdqlSue/mxkjEATDYa49Wwt5pL3t4D0P2EbbUNZq29mhL7cd
	2LVvyjzND+nHuyBqt9nVJtnYstr0NFVNXVtRKd0lrJQxbmHAOq36c9kRnhqxFxnbilv8GN1oafU
	0rl5FR00M/TQ4fFDBaELvzwJtmCmNrVqnPEjuopOyl0r1OthiUi7q6/CjY6RN0mssVr3ilN547s
	fo3En7+ZwTojla2nNiuWI5DLk+A/WGybdZ2AfeRZ5kgMOCUqDUvibE6nsoObrFMGVN5p5gT1Rqq
	L4ne4ELkhPM6g23d
X-Google-Smtp-Source: AGHT+IEPKtkVF8ujzFEgXSiPNo+Q85srLA3blCN17p2R6lHtYzaH97Dg/qRUupCq5aMr7gFzbI+8rg==
X-Received: by 2002:a05:620a:248c:b0:7c5:9c13:2858 with SMTP id af79cd13be357-7cacee78829mr17841585a.0.1746052717703;
        Wed, 30 Apr 2025 15:38:37 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cacdee0d90sm15158085a.87.2025.04.30.15.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:38:37 -0700 (PDT)
Date: Thu, 1 May 2025 06:38:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: sophgo: Add support for newly added precise
 compatible
Message-ID: <miemx3dszewxyu33ymwbrdmyjxa7emay4z3wst6fgbsk6kdpn5@aa434epgrszf>
References: <20250430020932.307198-1-inochiama@gmail.com>
 <20250430020932.307198-3-inochiama@gmail.com>
 <9ea234373b18a91c6a2f7a41c441002de1e92e98.camel@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ea234373b18a91c6a2f7a41c441002de1e92e98.camel@gmail.com>

On Wed, Apr 30, 2025 at 05:39:52PM +0200, Alexander Sverdlin wrote:
> Hi Inochi!
> 
> On Wed, 2025-04-30 at 10:09 +0800, Inochi Amaoto wrote:
> > Add of device id definition for newly added precise compatible.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/clk/sophgo/clk-cv1800.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
> > index e0c4dc347579..e10221df6385 100644
> > --- a/drivers/clk/sophgo/clk-cv1800.c
> > +++ b/drivers/clk/sophgo/clk-cv1800.c
> > @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device *pdev)
> >  
> >  static const struct of_device_id cv1800_clk_ids[] = {
> >  	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
> > +	{ .compatible = "sophgo,cv1800b-clk", .data = &cv1800_desc },
> >  	{ .compatible = "sophgo,cv1810-clk", .data = &cv1810_desc },
> > +	{ .compatible = "sophgo,cv1812h-clk", .data = &cv1800_desc },
>                                                            ^
> Should it have been "cv1810_desc" instead?
> 

Yeah, this is a mistake. I will fix it.

> >  	{ .compatible = "sophgo,sg2000-clk", .data = &sg2000_desc },
> > +	{ .compatible = "sophgo,sg2002-clk", .data = &sg2000_desc },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, cv1800_clk_ids);
> 
> -- 
> Alexander Sverdlin.
