Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FDB225A3C
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 22:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053007; cv=none; b=DisLXMgkQBpnAhhN8TOegS9jrsz1YkJfQK2itzGeetq5V7gJi2aod4KbTPIGzli13WWoAXtzpI+ZALn9GHwWpkCG+KRCjAASXwQZrIu7atwXDHVZcqscv3k8fJ3MVlLuaZHIztU/bcBktqGeZxnNSg9cxFPrBS6zFbZ+ceH1Tsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053007; c=relaxed/simple;
	bh=dISd+N+HMd+yQEGsvUtemqXoW3Igt343eoWGtsWnDlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGtJAfxJKWsGg2jIpsrb7tuVfaSw8RT2ZHq+VTAx5+mIlFs5ZIXFD5a9/WHdHAp1tFyADp/GD9XFK33IgkSr+A6LQEhULXOZZ4BubgLq2nojl5g2YuFz0XFVeEDdaY5VHVkb/Sj7eDIMB7tjpxoZkpdc8httnn/gdHO9TCJ0clA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIM2HI++; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIM2HI++"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8ec399427so4374786d6.2
        for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 15:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746053005; x=1746657805; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fanbo0paPBUBXhFMWx1nyQAi5WFjbZwo9JNNJ+WKtHw=;
        b=AIM2HI++S/jqSEtB6U0gS2UhdDTTefMTlv3w1VQxIt0JbCnL3plNathFes/RKCUT8O
         MkHsXw6WBpvvCHtm2GeEv+gcykM0VrSYAh5B0d5bZYu9d+w1J81fYpdXiQygo4fWDMCb
         Pnxy/i1Y8Ts+HSatw6uqU0fA2muy56CjCp1Cmsz7JaXqcUm8GoJc1R5/Yh4LPjncl+Qk
         bXfpt97UHqNEgtlJyM3JjZmwW/3NAfN1f6mEdLNZ9tdD0nc/RZ3YZP7uqr7Qj58ODcmX
         JvnjHQApUsvRgZgGRu8z6nbNco271QhQJ0CUMAr65iWfnA0eoclhPeUNtHUWDcjZa8Um
         BA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746053005; x=1746657805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fanbo0paPBUBXhFMWx1nyQAi5WFjbZwo9JNNJ+WKtHw=;
        b=nu2VQF1x69hVCSqGdB3w4g6Tqgwn68j61HxQ8Sp2+bj6JybH1flUUrrDYm7IKT/IOh
         /jGPWf6mecDml2dSjPyu4+sbsc1dIUjXpsz3WFMVATP7e2ukCpn3o+oCbGNbHbyJLFdR
         aWzaJJxpR7BGZKIPU/SOlOPC7szcZ7ANAAUF0mabvRnboy4crU6O/0zU+c8TjKA5G+QR
         XD2bE2Cso6AfWZ+fJ7XoE53ApULhw/7wLvbDughz6L5NqOHdWYqgubVcJwAgfa5mysOg
         3PgNYS1b1q/vOwctyma7ZTDaIsIXd60VgSkqIjptlHGZEWayPMyEYLESLe1fATCUNTkM
         fp9w==
X-Forwarded-Encrypted: i=1; AJvYcCVIwswtkjy6ZEqD+szqTTaOLwRe8Ah/8uHi99z7DLgH45+z8wnXrmMZ88Zk4tOch2VWRV3HOQY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ08alRYwrqKBZzQEYzQK4bTvOGvECM8gZahHHDC70f3aM5FTT
	/ilZqFa0QeRCuhmIG96Vi6F5dtvIGNwrm9qnRU+LavqvFz6tFSov
X-Gm-Gg: ASbGnct2+TSL3YT8pBMhpQj7M72+eIAxm6RZGe+6Ko+M/sX5dIgef8w4spDCLKLq62Z
	EQgkccY1KY0FH5ar+ROnUAa28psbphh8XaF+IMBQRAw3nDtii4QSd2KGJJ4mg+o37cd697M3Ixg
	OvTidSGi5yBtxbIn83OWpT4WUrmbrSyawU+sDBHT5ZQGga+OntOCBMBmuyprukqVa/8ILgPenxX
	xL8Tga98ckfkvaEPAzkfjZYXh3Of8I5XoMufeOkuaCBHDxsWxgl/rERkkynllD3mVh/NMceD1n+
	Dl2R0BxHJkh4fGj1
X-Google-Smtp-Source: AGHT+IFO1aCRIZ/0N8Q8OG8yNS/rlnBCUVOfqQhrwjWHjsgTBzgmkOJlnBxrxLot12lUcMwexg9s9Q==
X-Received: by 2002:a05:6214:5004:b0:6e6:6713:3ea8 with SMTP id 6a1803df08f44-6f509118d8dmr20881566d6.23.1746053004612;
        Wed, 30 Apr 2025 15:43:24 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe6abef4sm13590726d6.18.2025.04.30.15.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:43:24 -0700 (PDT)
Date: Thu, 1 May 2025 06:43:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] clk: sophgo: Add support for newly added precise
 compatible
Message-ID: <otuaro3xh2ut3kurcomrq5j3guyyj7uhhwgngqdqqrrcpvlk6t@4wqbxy3m3tq7>
References: <20250430020932.307198-1-inochiama@gmail.com>
 <20250430020932.307198-3-inochiama@gmail.com>
 <20250430-radiance-rebuilt-2caa906d5e6f@spud>
 <20250430-snort-raider-dbf10d14993f@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-snort-raider-dbf10d14993f@spud>

On Wed, Apr 30, 2025 at 04:37:01PM +0100, Conor Dooley wrote:
> On Wed, Apr 30, 2025 at 04:33:39PM +0100, Conor Dooley wrote:
> > On Wed, Apr 30, 2025 at 10:09:30AM +0800, Inochi Amaoto wrote:
> > > Add of device id definition for newly added precise compatible.
> > > 
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  drivers/clk/sophgo/clk-cv1800.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
> > > index e0c4dc347579..e10221df6385 100644
> > > --- a/drivers/clk/sophgo/clk-cv1800.c
> > > +++ b/drivers/clk/sophgo/clk-cv1800.c
> > > @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device *pdev)
> > >  
> > >  static const struct of_device_id cv1800_clk_ids[] = {
> > >  	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
> > > +	{ .compatible = "sophgo,cv1800b-clk", .data = &cv1800_desc },
> > 
> > Given the same data is used here, should there not be fallbacks in the
> > dt for some of these? For example, 1812 to 1800? Or is that not okay,
> > because 1800 is not a real device id?
> > 
> > >  	{ .compatible = "sophgo,cv1810-clk", .data = &cv1810_desc },
> > > +	{ .compatible = "sophgo,cv1812h-clk", .data = &cv1800_desc },
> > >  	{ .compatible = "sophgo,sg2000-clk", .data = &sg2000_desc },
> > > +	{ .compatible = "sophgo,sg2002-clk", .data = &sg2000_desc },
> 
> Actually, this one is a better example. sg2000 is not marked deprecated.
> sg2002 uses the same match data. Why is no fallback to sg2000 used for
> the sg2002 case?

Yeah, It is a good idea. I will take it, thanks,

Regards,
Inochi
