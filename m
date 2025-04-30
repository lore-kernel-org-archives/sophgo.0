Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC079222568
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 22:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746052971; cv=none; b=B6mDZhyUVDG1uOzYnURclgGjfgAc/bhnErViLn74QMHD+wUTcS+KN7l0r8e09Q3kUf7OkuKCg6imMJxs3BSVmA+GXgGCZqwhM5mIRx0XtCpq7dVkNWkFBI2rAmfFkWVy2/gJVcWin94EH5ieOsqgu6+rDUAqAjVCE6ulw0+5jPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746052971; c=relaxed/simple;
	bh=vAx5tM3ytfD1+TRnvyxVfibxvfEd8AwTEm5o2BakR6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOWYSan+OykjC4ra64XjM8hZygRLht2Bu19t9/t9d5Arfx4mMSw4jAayzmT40UG5n0ShcMCjbEhdkkfy1VnuxQIL/nbKG6OFRvBbm7oOTjqe77jmG8nfg/pNRrnGT8w59xsM0SGrhJU8t9rruQAM8C/9EAXQcxv342sIBC1Vl8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lScAcmnj; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lScAcmnj"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c08fc20194so68862785a.2
        for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 15:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746052968; x=1746657768; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=48S3dXdKaci0sGPUxZJCzgj5cjkP8nksM+/jgY0gGYk=;
        b=lScAcmnj3IMwadUeh3lRQuhfn+izEhSAO+ERCFA5icbe0okcQbK6+LeFZCk1DOv0l6
         E+hsqH7el0RJUf48BjfTWWI57aObLWdKMkHel23gcZoyHUtOmLAyeVzmjG16+t3StI6Q
         DWeTGvNHQovOhuKdW6lVY0zE7htGAitMjNP+7uhFpjWP8m7ke+mkeePfX0QvUP2gVwCf
         T6keDzF0Sw5QI7iZ+3uAEn/mDEGwa5IDZF54uzkWVxcrvPR7CDnSJ3Di0XdpvxAYjQEO
         3aCNJ9RCdBecr4x2PgA3MTMrzYCTbhTGgJhUd3mGJkzpBDJwknY3agrYZOMG0CF2ZMl7
         nNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746052968; x=1746657768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48S3dXdKaci0sGPUxZJCzgj5cjkP8nksM+/jgY0gGYk=;
        b=kk2Kd7c2n0zgvHF9e3PoJm0cQJsriN1nyboWmo5g+ZrQp4BTUJxNlE+dWGPkfTngEP
         tmh+PfcDFiU4JLuwXRgbJhCdiREk7PR5qkhXQtgZZTagxsUkYcyLOls46nUtHRXXCTYT
         CscRZYl+/Sq8d2iFtsgbmHoF1XVPuujriktyuoEqx+z6Uhi1Apb/jY/dyohseFxPbv6S
         C+4PYrWmSWe6h+v3SdFS69bzbX1NK94ewfz6NlKV07nWnjrbsotn0DnQPDVp29rz1mJl
         fRihL9/dxQUGlhlPttF4j7WHgaC6RlY1ha5B0q06Ib56ZzoqaNc7gQZMABmQQONYEYIt
         eMYw==
X-Forwarded-Encrypted: i=1; AJvYcCUX536tzgnjILsBanhULEITDWavnU6MaHpbTbGGA/bG/xs25LfxO/JmgwMhwpSt0kb8MZtSreY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh7XiVBftjUNq2GElE7IJ5ldNkAcHsRMGStBkxPGqdmo5xPf6D
	gxpqNpG1jkOyUmy9jpLpYo+FpuVkCDKvti0jHnGn6WtcR3R43nm4
X-Gm-Gg: ASbGncvkiR3uC7SEb7QrBBiMoTzcrjViH93ZiWL6OWP3r0wiBIKP7rrLThnUR1MqIgw
	j+pTPqYxURLaz0z6qO4uMtO2wDDy5N3bQTwUmQ0pWB0eCqmW0wThpKOxI6HNjBaIaBvi4aHJ7LX
	GD6bN7a/tZvuakGQVmQrs6UtPkd8xn7NAlt4aZD+3Cna5y3GqGMu4HFIXQd8pmqukqJCG4/BpsK
	7tYN2i1zrh80z/YWUWB9hKMcy+6vtCIzdiTcSOVholnA9yFn/ujvOAT5Fm9MShHdMaPBESfKBjT
	ftpeAnWh3DIzfdbG
X-Google-Smtp-Source: AGHT+IGMVPqZmzGaSrVitA4ALOh6ohgVuCqPO0wiuXVjKCvGxXKUvoU7kotjtbcu86RB8d1T+y/K2A==
X-Received: by 2002:a05:620a:2493:b0:7c5:5e05:df33 with SMTP id af79cd13be357-7cacd79b179mr118413885a.51.1746052968633;
        Wed, 30 Apr 2025 15:42:48 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cacdef210dsm15380785a.102.2025.04.30.15.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:42:48 -0700 (PDT)
Date: Thu, 1 May 2025 06:42:31 +0800
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
Message-ID: <oe26ciwvazn3klvmmw6iyk7yypzrtjzdwui7dw2sf7wslz4wco@kq3hi3ynesfl>
References: <20250430020932.307198-1-inochiama@gmail.com>
 <20250430020932.307198-3-inochiama@gmail.com>
 <20250430-radiance-rebuilt-2caa906d5e6f@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-radiance-rebuilt-2caa906d5e6f@spud>

On Wed, Apr 30, 2025 at 04:33:39PM +0100, Conor Dooley wrote:
> On Wed, Apr 30, 2025 at 10:09:30AM +0800, Inochi Amaoto wrote:
> > Add of device id definition for newly added precise compatible.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/clk/sophgo/clk-cv1800.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
> > index e0c4dc347579..e10221df6385 100644
> > --- a/drivers/clk/sophgo/clk-cv1800.c
> > +++ b/drivers/clk/sophgo/clk-cv1800.c
> > @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device *pdev)
> >  
> >  static const struct of_device_id cv1800_clk_ids[] = {
> >  	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
> > +	{ .compatible = "sophgo,cv1800b-clk", .data = &cv1800_desc },
> 
> Given the same data is used here, should there not be fallbacks in the
> dt for some of these? For example, 1812 to 1800? 

In default, there maybe not fallback for the whole series, I think.
But it is possible to use cv1800b as 

> Or is that not okay, because 1800 is not a real device id?

Yes, cv1800-clk and cv1810-clk is a old wildcard compatible, not a
real one. As this is not prefered, I want to fix this to have a
meaningful compatible.

Regards,
Inochi
