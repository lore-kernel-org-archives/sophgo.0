Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A191020C02E
	for <sophgo@lists.linux.dev>; Thu, 13 Feb 2025 11:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739446231; cv=none; b=tRRFdoQpXsm6sdVnIy/ynk7I+LP3hZ/Sl8dl3A4dngQ05riQozw+2lTvVnJjXv5AIJDIPvI7EsgpMr+SN+ZvdRpIZIZvpviW+/34aMyTgZpaeKY87OE7r7mPlVLIsB6IcUsB23eNqxnewXw3wsBnvUQdspktwBTYOX47P0QwPaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739446231; c=relaxed/simple;
	bh=1tL8tgoci3RMv08/Bt3HfoiI+a9Gh4up1triArlbQ4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KspTtBjZXLnEuCr5THU/bRXbCjizb1kFIKB1cgqxPhCq4FYAM/T6+8dtGId55HN+Pe5u2/b0zdg0X9qTjw6vVUtStadrWpKla7adyF1XZH2knWtyEhYPMx7HjRY3czuLq+ZhwXKD/HpLq4asOuJtOmZ589gkMqoMj3zvqLFoEqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrZfypJD; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrZfypJD"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c079f1d96fso83464185a.1
        for <sophgo@lists.linux.dev>; Thu, 13 Feb 2025 03:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739446228; x=1740051028; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5SU/TBSujegWTvHaxqKdEWl78O7aiUl1zKHXvdMyNQA=;
        b=QrZfypJDzstgyARs3RIxalZDJfUlhILBTj8rjM3BzeQEKi9jujxUpilrHCoSNFMgPy
         MP6bvxgoKQaxIdeKWX5ggtoai2qv3T7uicreLb9UdJjEpHQ0j298ygB6JgaBinWQINUK
         TrvYxsfHRJV34dm2pjZW+n5cQzC8FWV6Ro1gek6e7UwcZ7c9YD/cSQbhbMz+NOmaOIKS
         Bxq7rhcMxilmy88iZIMHX95dDlWqdIN7gMdna2ifOPBWo4vGZrykKMjlugDGf+QNkxzO
         4J+hYAAa468YWKJsExlesbILb35Ibei1E+y6CYhp3jxCiKPHBoUZaNycygN0XePtngcB
         GFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739446228; x=1740051028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SU/TBSujegWTvHaxqKdEWl78O7aiUl1zKHXvdMyNQA=;
        b=btdqzf1ZaYs6BeqxtOm/CuzQJHUEfuGtpTSl/O4VNPogH33S7J0f9XmnlrnnBBqjJL
         jv1ZGApLUtICsLvOxZdMfnFurabgreUOLqZgynw/cg4NRdP7v6FYuZ9tRW4Xr98Yzwgq
         38DyGFlyKT37ZBmRjs/wnJKt6zjd2Pz9RP+mI+rOcuVNhMJ8+5i95r0RLAEXWYw+YDiv
         TYAgpp8rHiU13J3GYtVlS7qptEtZCJQ+a50Vi+WsNGs2CveRRw80E0Hi66rCTT/WAVhV
         4L19hiv2z06QdE+1xwC1khYNDuMRxP8NxFSWREbWIUVGsgumeinegtWcFZj6jBsCMo5g
         PNFg==
X-Forwarded-Encrypted: i=1; AJvYcCXv0duoXdprf3VnQldMTbLHcYfNFp6jQ+Hg2OCTJaoIl4LY5ulLU7v2TM3gYioKwfnLw47sfxo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6SerNyPbbP2HK80r/K8/xLh1NotYmauxkS8a/GjQaUTWgBGGh
	iyeRRNwY9Tdm2MQLFvzeyDXTWOhzDPpKjbOmflYIESB/Pd4mDZlm
X-Gm-Gg: ASbGncsy8UZOfiQx1igk8MSztfuY4K8EXqAGjcIqxKWbDG1dimYJtaI4toiXEGsoWIH
	Y7wkxk9E1o44qgh31OIlxxmd8jAF23PN/FMKuvzBv+DJKazae8lU1EKJv0QfZURUgCxIJVtArZi
	OML/zRxKHdQJNW6UWoO80oG78DnZ8MhMkH6aMy0sGCX3B2ehdKZy119Q0ieYKii02TIMUd9rLno
	m9OkNVPWy3mGpdzuFNGffAFa5rotRzWm6n0C3u5kOJNJL7YDLqkdC3BfpE1hJhNTFs=
X-Google-Smtp-Source: AGHT+IFQo684UKQQw1zozEcjISvHMyMr/bRuDRMBvz25ZEQiXj7LUIrkvbXFjlOZRa8EGwkbsJlG7w==
X-Received: by 2002:a05:6214:2aa2:b0:6e0:ad33:36c with SMTP id 6a1803df08f44-6e46ed77a8fmr112510006d6.2.1739446228388;
        Thu, 13 Feb 2025 03:30:28 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65d7a3d2esm8068856d6.55.2025.02.13.03.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 03:30:27 -0800 (PST)
Date: Thu, 13 Feb 2025 19:30:19 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/4] reset: simple: add support generic reset-simple
 device
Message-ID: <lrbpay37sn6jfclfaozauqxp76wy6w4uft3a4arhpmluhi4kq4@6bev4gj56sdn>
References: <20250213020900.745551-1-inochiama@gmail.com>
 <20250213020900.745551-3-inochiama@gmail.com>
 <20250213-laughing-oarfish-of-opportunity-a575c5@krzk-bin>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-laughing-oarfish-of-opportunity-a575c5@krzk-bin>

On Thu, Feb 13, 2025 at 10:36:14AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Feb 13, 2025 at 10:08:55AM +0800, Inochi Amaoto wrote:
> > Add support for generic bit reset device.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/reset/reset-simple.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
> > index 276067839830..a24f8fcc6a06 100644
> > --- a/drivers/reset/reset-simple.c
> > +++ b/drivers/reset/reset-simple.c
> > @@ -148,6 +148,9 @@ static const struct of_device_id reset_simple_dt_ids[] = {
> >  		.data = &reset_simple_active_low },
> >  	{ .compatible = "brcm,bcm4908-misc-pcie-reset",
> >  		.data = &reset_simple_active_low },
> > +	{ .compatible = "reset-simple-high" },
> > +	{ .compatible = "reset-simple-low",
> > +		.data = &reset_simple_active_low },
> 
> So what is the point of the binding?
> 

I wanted to add these comptaibles as a base to avoid adding
too many compatible in driver.

Regards,
Inochi

