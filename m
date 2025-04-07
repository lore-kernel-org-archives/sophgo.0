Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D55C218AC4
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744020184; cv=none; b=sl7o+f3wMhTDtzsuoRCbNyn14im/ly/6Ms2Dc8Wobu4LFLJlnDIZod7vllyanDTaZdWo9fmkJp5CagG0KrXVfF3cPCYAwxf6/LPbet4aYZ4U+aweOpzcl/ZpvUoboSsNjf/aAdD700I52HVzMJSLVzI2oWujpu3C0HGz+YruRIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744020184; c=relaxed/simple;
	bh=w78LXxApCj4OTSgjgaM64oKrRjxrGY8VBQ8Wzi/jdr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbSVzExHjat/XuXSvxqxqN/V6QqT6YeaZkMp/15OSF99m2AdyNmmSeKKQfHHjveHwpfZQd4MBT/oXtY+/m4RGlDPcdpuGxL9+nQrtp2GA+8Zm8r+Aq69AieDqCVyqBkQsgQkDlN1H8E3ZtmHTkN5XT5qnC72wCZJZFaqekBhBGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idZvDcgX; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idZvDcgX"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736c3e7b390so3547109b3a.2
        for <sophgo@lists.linux.dev>; Mon, 07 Apr 2025 03:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744020181; x=1744624981; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RACmTc9Rgs7JJUW7G658o4PTbUfl18GoBK9O7BQsyEY=;
        b=idZvDcgXLv/eXFqtuNikta+YCVlGM7GtmC8wpwYdASVHs4Bdqn+Vcicg3pQr6/y5/9
         CqSqa8pksuC7HxiqB0wp2HLLdEkD0NY1qyvPF0D5/JKM2bAAHgmUwrdS+J5fFRDi2nYf
         HIe76sf4bWPzhLiF2VEW+s+f5xVqsQ5E35QBrv20iSfVfn3759mkG9v8bVdI3VDS5UEG
         CVAslD21PJ3eczsWVEgO1u9c4vx520WAbWzzpKquscYDkJsUH/AO76wCKf7cSt7Bhv7d
         Rz8HnXu9XDvBIRbCZilC2IYEuzW5HhvsAZf5S+VpAbmSyjOMfZOoj3bD3rvNZviv9dqK
         ZphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744020181; x=1744624981;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RACmTc9Rgs7JJUW7G658o4PTbUfl18GoBK9O7BQsyEY=;
        b=wY5SUK1f003ARqaPufulfHMzg/zuMejKbq5aIAGJv9HbqstlFhb9VmWyR5m91hrkTz
         3nI1n635Yfkt4qgvTK2Xc68KlaOtz+1cDl84oGh8XoVSubBqMvizDQpsy2wRzFatNtUy
         K0ln5caPI/GiYevhltPRUtRRc1a7NuvGsN4X9Zr3rmQ/gd5RswCfOOcZPCJ8XY2T1zHR
         kjIjbWOKBKKXvKXaPlXIt7CfDPPgRoFcyoEUf0grr3ZofiAVx3dDet11p8e3jkr5oegS
         IFcLyjUqgQfBbaHUfix+f8UwlU3PSDoJFBXQX+GrUDQPa2iJT5YJSl53ysO2CJs7Opj9
         Z//Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMphmFOZ5MfRBLodHVM4ARfFnat+99Rx6owLIGamAkrhUkfOPnX2EL3RcjBC2hUqSfDUDH7ko=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJlzDn0MkB8N4pd/BvfirQeEtbhz0Mdcs5A1A5sVsPGRMvVrZV
	FVIgy+43roICRRFQ7ruSAfbte4Hl8rtlc1B98kS+phczKWqY/pS+
X-Gm-Gg: ASbGnctRb8ojaJ30hNBkQMZYQPhHIUcQ9YnYVjqgzHTm+m4VcRl70OtZKRHu3FMtSIR
	jL7lj9crtQj2kZHhRYqxYr+gub3p/yo2n/iq1NDowDWo220NgNumO6z0jPS9b9D8l3QEGaq69Nv
	msj0dmTt1jLxSKuIqNiq3u0QrRp3Pd+PPMDiHXP/6+4A31g2mTKxKk+cX2M0cvJMuAa0Z2gnQQf
	YVhCj5hnMwoxLW901PRbzxDimsHLR5Hh5LjKKF9z5j5TXVk9mO0eeA5a5a/7YmTRXPxvgtpukzH
	1djZA8vEb0q97tcS/AJtFiNzoiN24b23PCMgYcWUXYq38A==
X-Google-Smtp-Source: AGHT+IGoAl7RP6vz9q7ZNLerCe+QiTDOPUWcDP8mG3WjvZ3rSUZqx0QcgAvTWNBxY4h5EHMN4sK3VA==
X-Received: by 2002:a05:6a00:179e:b0:735:d89c:4b9f with SMTP id d2e1a72fcca58-739e6e6fb3cmr13738787b3a.0.1744020181171;
        Mon, 07 Apr 2025 03:03:01 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-739da0b45b4sm8086532b3a.151.2025.04.07.03.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 03:03:00 -0700 (PDT)
Date: Mon, 7 Apr 2025 18:02:57 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] pwm: sophgo: add driver for SG2044
Message-ID: <jd46vvxgrmpk7dhaogio6wsut4l7keshhujw6k3kw2enodgwiw@wtaxbwgaykrr>
References: <20250407072056.8629-1-looong.bin@gmail.com>
 <20250407072056.8629-3-looong.bin@gmail.com>
 <jnvlo3su4xzsvzte2s3noosycxae5uxhi3vusefpgq462ymqst@jgta6xxmcbtd>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jnvlo3su4xzsvzte2s3noosycxae5uxhi3vusefpgq462ymqst@jgta6xxmcbtd>

On Mon, Apr 07, 2025 at 11:38:27AM +0200, Uwe Kleine-König wrote:
> On Mon, Apr 07, 2025 at 03:20:39PM +0800, Longbin Li wrote:
> > From: ghost <2990955050@qq.com>
> 
> Huh, is that a real name?
>

My fault,i will change it.
 
> > Add PWM controller for SG2044.
> > 
> > Signed-off-by: Longbin Li <looong.bin@gmail.com>
> > ---
> >  drivers/pwm/pwm-sophgo-sg2042.c | 162 +++++++++++++++++++++++++++-----
> >  1 file changed, 138 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
> > index ff4639d849ce..c62e8c758d87 100644
> > --- a/drivers/pwm/pwm-sophgo-sg2042.c
> > +++ b/drivers/pwm/pwm-sophgo-sg2042.c
> 
> The Limitations paragraph needs updating. E.g. SG2044 seems to support
> polarity while SG2042 doesn't.
> 

Thanks,i will add that.

> > @@ -26,20 +26,22 @@
> >  #include <linux/pwm.h>
> >  #include <linux/reset.h>
> > 
> > -/*
> > - * Offset RegisterName
> > - * 0x0000 HLPERIOD0
> > - * 0x0004 PERIOD0
> > - * 0x0008 HLPERIOD1
> > - * 0x000C PERIOD1
> > - * 0x0010 HLPERIOD2
> > - * 0x0014 PERIOD2
> > - * 0x0018 HLPERIOD3
> > - * 0x001C PERIOD3
> > - * Four groups and every group is composed of HLPERIOD & PERIOD
> > - */
> > -#define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
> > -#define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)
> > +#define REG_HLPERIOD		0x0
> > +#define REG_PERIOD		0x4
> > +#define REG_GROUP		0x8
> 
> REG_GROUP belongs to a different category than REG_PERIOD. So please use
> a different schema to name it (or drop it, see below).
> 

I will improve it.

> > +#define REG_POLARITY		0x40
> > +
> > +#define REG_PWMSTART		0x44
> > +#define REG_PWMUPDATE		0x4C
> > +#define REG_SHIFTCOUNT		0x80
> > +#define REG_SHIFTSTART		0x90
> 
> REG_SHIFTCOUNT and REG_SHIFTSTART are unused.
> 

I will drop it.

> > +#define REG_PWM_OE		0xD0
> 
> Actually I liked the old prefix better. E.g. "REG_POLARITY" looks more
> generic that it actually is.
> 

I will reconsider that.

> > +
> > +#define PWM_REG_NUM		0x80
> 
> This is unused?
> 

I will drop it,thanks!

> > +
> > +#define PWM_POLARITY_MASK(n) BIT(n)
> > +#define PWM_HLPERIOD(chan) ((chan) * REG_GROUP + REG_HLPERIOD)
> > +#define PWM_PERIOD(chan) ((chan) * REG_GROUP + REG_PERIOD)
> 
> ((chan) * 8 + 0) is IMHO better. I guess this is subjective because at
> least the *8 is repeated several times, but the advantage of not using a
> define for 8 (and 0 and 4) is that by looking at
> 
> 	#define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
> 
> you immediatly see the offsets of the HLPERIOD register, while for
> 
> 	#define PWM_HLPERIOD(chan) ((chan) * REG_GROUP + REG_HLPERIOD)
> 
> you have to lookup two additional symbols.
> 
> Also PWM is a prefix that is too generic.
> 

I will reconsider that.

> >  #define SG2042_PWM_CHANNELNUM	4
> > 
> > @@ -51,6 +53,12 @@
> >  struct sg2042_pwm_ddata {
> >  	void __iomem *base;
> >  	unsigned long clk_rate_hz;
> > +	struct mutex lock;
> 
> What does this lock protect? Note that there is a chip lock that is held
> when .apply() is called, to serialize apply calls for a single chip. I
> guess this can and should be dropped.
> 

I will retest it, and if possible i will drop it, thanks.

> > +};
> > +
> > +struct sg2042_chip_data {
> > +	const struct pwm_ops ops;
> > +	bool atomic;
> >  };
> > 
> >  /*
> > @@ -62,8 +70,8 @@ static void pwm_sg2042_config(struct sg2042_pwm_ddata *ddata, unsigned int chan,
> >  {
> >  	void __iomem *base = ddata->base;
> > 
> > -	writel(period_ticks, base + SG2042_PWM_PERIOD(chan));
> > -	writel(hlperiod_ticks, base + SG2042_PWM_HLPERIOD(chan));
> > +	writel(period_ticks, base + PWM_PERIOD(chan));
> > +	writel(hlperiod_ticks, base + PWM_HLPERIOD(chan));
> 
> The register renaming adds really quite some noise that is actually
> unrelated to this patch. If you really think the register defines need
> renaming, do that in a separate patch (and justify it well).
> 

Sorry, i will modify here.

> >  }
> > 
> >  static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> > @@ -104,8 +112,8 @@ static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> >  	u32 hlperiod_ticks;
> >  	u32 period_ticks;
> > 
> > -	period_ticks = readl(ddata->base + SG2042_PWM_PERIOD(chan));
> > -	hlperiod_ticks = readl(ddata->base + SG2042_PWM_HLPERIOD(chan));
> > +	period_ticks = readl(ddata->base + PWM_PERIOD(chan));
> > +	hlperiod_ticks = readl(ddata->base + PWM_HLPERIOD(chan));
> > 
> >  	if (!period_ticks) {
> >  		state->enabled = false;
> > @@ -123,13 +131,112 @@ static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> >  	return 0;
> >  }
> > 
> > -static const struct pwm_ops pwm_sg2042_ops = {
> > -	.apply = pwm_sg2042_apply,
> > -	.get_state = pwm_sg2042_get_state,
> > +static void pwm_sg2044_config(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm, bool enabled)
> > +{
> > +	u32 pwm_value;
> > +
> > +	pwm_value = readl(ddata->base + REG_PWMSTART);
> > +
> > +	if (enabled)
> > +		writel(pwm_value | BIT(pwm->hwpwm), ddata->base + REG_PWMSTART);
> > +	else
> > +		writel(pwm_value & ~BIT(pwm->hwpwm), ddata->base + REG_PWMSTART);
> > +}
> > +
> > +static void pwm_sg2044_set_outputenable(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
> > +					bool enabled)
> > +{
> > +	u32 pwm_value;
> > +
> > +	pwm_value = readl(ddata->base + REG_PWM_OE);
> > +
> > +	if (enabled)
> > +		writel(pwm_value | BIT(pwm->hwpwm), ddata->base + REG_PWM_OE);
> > +	else
> > +		writel(pwm_value & ~BIT(pwm->hwpwm), ddata->base + REG_PWM_OE);
> > +}
> > +
> > +static int pwm_sg2044_set_polarity(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
> > +				   const struct pwm_state *state)
> > +{
> > +	enum pwm_polarity polarity;
> > +	u32 pwm_value;
> > +
> > +	pwm_value = readl(ddata->base + REG_POLARITY);
> > +
> > +	polarity = state->polarity;
> > +
> > +	if (polarity == PWM_POLARITY_NORMAL)
> > +		pwm_value &= ~BIT(pwm->hwpwm);
> > +	else
> > +		pwm_value |= BIT(pwm->hwpwm);
> > +
> > +	writel(pwm_value, ddata->base + REG_POLARITY);
> 
> I like this idiom better than the one used in
> pwm_sg2044_set_outputenable() and pwm_sg2044_config(). However drop the
> local variable polarity.
> 

I will modify that, thanks.

> > +	return 0;
> > +}
> > +
> > +static int pwm_sg2044_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> > +			    const struct pwm_state *state)
> > +{
> > +	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
> > +	u32 hlperiod_ticks;
> > +	u32 period_ticks;
> > +
> > +	if (!state->enabled) {
> > +		pwm_sg2044_config(ddata, pwm, false);
> > +		return 0;
> > +	}
> > +
> > +	pwm_sg2044_set_polarity(ddata, pwm, state);
> > +
> > +	/*
> > +	 * Duration of High level (duty_cycle) = HLPERIOD x Period_of_input_clk
> > +	 * Duration of One Cycle (period) = PERIOD x Period_of_input_clk
> > +	 */
> > +	period_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->period,
> > +					       NSEC_PER_SEC), U32_MAX);
> > +	hlperiod_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->duty_cycle,
> > +						 NSEC_PER_SEC), U32_MAX);
> 
> This is the same calculation as for sg2042. I think I'd put that in a
> function that is used by both variants.
> 

Thanks, i will modify that.

> > +	dev_dbg(pwmchip_parent(chip), "chan[%u]: PERIOD=%u, HLPERIOD=%u\n",
> > +		pwm->hwpwm, period_ticks, hlperiod_ticks);
> 
> Now that there are more register values, please add them all to the
> debug output.
> 

I will, thanks.

> > +	pwm_sg2042_config(ddata, pwm->hwpwm, period_ticks, hlperiod_ticks);
> > +
> > +	guard(mutex)(&ddata->lock);
> > +
> > +	/*
> > +	 * re-enable PWMSTART to refresh the register period
> > +	 */
> > +	pwm_sg2044_config(ddata, pwm, false);
> 
> pwm_sg2044_config() is conceptually different to pwm_sg2042_config().
> This is irritating, so please find a better name.
> 

I will modify that, thanks.

> > +	pwm_sg2044_set_outputenable(ddata, pwm, true);
> > +	pwm_sg2044_config(ddata, pwm, true);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct sg2042_chip_data sg2042_chip_data = {
> > +	.ops = {
> > +		.apply = pwm_sg2042_apply,
> > +		.get_state = pwm_sg2042_get_state,
> > +	},
> > +	.atomic = true,
> > +};
> > +
> > +static const struct sg2042_chip_data sg2044_chip_data = {
> > +	.ops = {
> > +		.apply = pwm_sg2044_apply,
> > +		.get_state = pwm_sg2042_get_state,
> > +	},
> > +	.atomic = false,
> 
> If you drop the mutex don't forget to drop this one, too.
> 

I will, thanks for your reminder.

> >  };
> 
> Best regards
> Uwe

Best regards
Longbin Li
