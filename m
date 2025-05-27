Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6A6AD2D
	for <sophgo@lists.linux.dev>; Tue, 27 May 2025 01:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748309972; cv=none; b=lKv2KqV/WJShzI1q8O+YE2Rt7cW38f2ny2IGmthf+ozIyyeoYRdq2TGdrL3aOy7amt1h45W4qcBqReWOijISrHe20wN3iFvJn6IxI+dmEFLUm2qc4CrZcZ2VGc+tNXv5rEl2H44A3Qj1EoXQUywBk4WAjuPLXBPBaWrPgH2C8us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748309972; c=relaxed/simple;
	bh=dHorA1JsrJHj2mnKGRfK+Mfyj4dNsLG9DWmxMquEkxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPG4TzGwltg3Wm1bteP5iU++G5ZIkXPP2EKsaCabN+ZpXb7MOe7NXSi98RpnI5imCbAXpT4vGb9xsnG4pCRVfQXIk8DKv96v87UH6d1yixHslwQ1Z7ywat+ZiAhnJmsEHnZd68FNh7UWdYVkub4j2TEGcOj00j/np1LSTEu27Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NarxhY1V; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NarxhY1V"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3114560d74aso1723289a91.0
        for <sophgo@lists.linux.dev>; Mon, 26 May 2025 18:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748309970; x=1748914770; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VDNozsrR2jSMsPeRLEsbQiSRT/gvBoqtxW9ncqMDN1c=;
        b=NarxhY1V9jKq8lFKXR8mklnpCyQb3hPHk5JGE77AYb0vElrpHC4Q0zG74qXtl4mhT4
         gjsBgZDlc9d+ceJTU328d1IIzifgwxIohS73PSCQ7RSHPkyemfXK7WrdSktPa/h2A+We
         xDDhh73ZN26Bvz2XmDipvYxKgaOW8heMbUcq6RMBB21HjLj+kdOPU3IAp82Zjiu6EiIr
         1FuJI7eLW5D3FRqcwgpUzDgxiYUQGKBTOWUF2Tvtu8TukgcR4WVKol/GnAldBaRxkS06
         pYqwB2qLtM5WefUj7RpYFD7Z4aXvGcdNTcNfBtvLRmo45oGvJiOqiLx7hZs75InaH7+K
         PJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748309970; x=1748914770;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDNozsrR2jSMsPeRLEsbQiSRT/gvBoqtxW9ncqMDN1c=;
        b=i3iXkyw3cf7jZDYyMBr7We9Qz0SzL5/b7QQvidmV8E9hj1E/MQ3V4kKY0ZV+w/HYHO
         wjHIleEc3Kgw4G11OT4FHI0jl+QacqpIwdLVosu/XNbMtSoPTtNEDfzH6Gs4pSauYzw/
         hkwM9rzX6xVSh+2s2VibbLgbyPkDeOagW5D4HWR7xP58GHKNxkw77ICNKYycYBpDCcfV
         QcV5TCkbCsEDnvNcZ2EUDjkn1IMAiEmdTnb1OX5liCkvnm9282vVyjC1hiseC7YD5fzK
         AWBztGrJsy1UAQRvmmx5w7EOKjkEhoMMhcQntNG6Zx6HQwRkiZU7Npc/jtq/cO3uZ7hv
         ZcOA==
X-Forwarded-Encrypted: i=1; AJvYcCU6WNzMVf0XLzD8Oisg0a/XuhZgE3p/prXNXacdPmtjKREyjMiSpUj6jxS0kADjWz7eJFtm0QQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKjNL20G69QzO6n9VA7bqKUxKItv3d8nfQp41e3YGREmMpZb9T
	tcC5WhvTDKS1zxXHEF1bQyB+pqU6/kODJYMtICWY+iCWg0fsLutVBIEz
X-Gm-Gg: ASbGncvtwuGnTbfFJxYdpRdQgw7awsuQpeEJ5+/hnq4xxkOqaVZQqwr0EaVvy9ulAFa
	TG5iG349qTkTrhQQB9GKAmjV6oJ9fiduiBlZCMig+k7ctrl3SJclhPgjG4ZnZZuzwZRwNrAMzZP
	C5RwqsXpaXOx8oA2nHX+S0qeIrlcL+ufCGjmwYN5mhR0vSk7G96MqXGKGlZ/15qQKdsmdlk1CTq
	vy6aat4uvIc5g2ZcNvQSACTEFJvv4+OjK9iQQ6pHaDXuakp745Ni1wvv36NumMlL5cly/mdVe1d
	ivEsFqIS8+HvRMAPEfhSqocfyJQ/GipZ2FTnOqcueqQxdQ/+C6Xl
X-Google-Smtp-Source: AGHT+IGzgYNAetOKbrBA2x3zjBOyZOtZdfZqboKJVQp5aeYbfVjV0GoXSJ34C2w9Vc7NbtGJRSMbww==
X-Received: by 2002:a17:90b:19c6:b0:311:9c9a:58dd with SMTP id 98e67ed59e1d1-3119c9a5c6cmr2714876a91.13.1748309970134;
        Mon, 26 May 2025 18:39:30 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-30f365f3487sm12933296a91.42.2025.05.26.18.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 18:39:29 -0700 (PDT)
Date: Tue, 27 May 2025 09:39:27 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/3] pwm: sophgo: reorganize the code structure
Message-ID: <srj5sbjuxrbbdyl7rk553ya2jm7icujdxvn3ecrcdh5enu74ze@daedkuqpc2g5>
References: <20250428013501.6354-1-looong.bin@gmail.com>
 <20250428013501.6354-3-looong.bin@gmail.com>
 <l57yh42pb7cfbnk5z4zo473vb5pac6t4hnpg36m3iph3og4wom@kmd35myokcgp>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <l57yh42pb7cfbnk5z4zo473vb5pac6t4hnpg36m3iph3og4wom@kmd35myokcgp>

On Mon, May 26, 2025 at 04:59:34PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Apr 28, 2025 at 09:34:49AM +0800, Longbin Li wrote:
> > As the driver logic can be used in both SG2042 and SG2044, it
> > will be better to reorganize the code structure.
> > 
> > Signed-off-by: Longbin Li <looong.bin@gmail.com>
> > Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> > ---
> >  drivers/pwm/pwm-sophgo-sg2042.c | 62 +++++++++++++++++++--------------
> >  1 file changed, 35 insertions(+), 27 deletions(-)
> > 
> > diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
> > index ff4639d849ce..23a83843ba53 100644
> > --- a/drivers/pwm/pwm-sophgo-sg2042.c
> > +++ b/drivers/pwm/pwm-sophgo-sg2042.c
> > @@ -26,18 +26,6 @@
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
> 
> This seems to be still correct? Why remove it then?
> 

The following "#define" has already expressd it. For clarity,
i will add it back.

> >  #define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
> >  #define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)
> > 
> > @@ -53,6 +41,10 @@ struct sg2042_pwm_ddata {
> >  	unsigned long clk_rate_hz;
> >  };
> > 
> > +struct sg2042_chip_data {
> > +	const struct pwm_ops ops;
> > +};
> > +
> >  /*
> >   * period_ticks: PERIOD
> >   * hlperiod_ticks: HLPERIOD
> > @@ -66,21 +58,13 @@ static void pwm_sg2042_config(struct sg2042_pwm_ddata *ddata, unsigned int chan,
> >  	writel(hlperiod_ticks, base + SG2042_PWM_HLPERIOD(chan));
> >  }
> > 
> > -static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> > -			    const struct pwm_state *state)
> > +static void pwm_set_dutycycle(struct pwm_chip *chip, struct pwm_device *pwm,
> 
> This is not a global pwm API function, so please stick to the pwm_sg2042
> prefix.
> 

I will modify that, thanks.

> > +			      const struct pwm_state *state)
> >  {
> >  	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
> >  	u32 hlperiod_ticks;
> >  	u32 period_ticks;
> > 
> > -	if (state->polarity == PWM_POLARITY_INVERSED)
> > -		return -EINVAL;
> > -
> > -	if (!state->enabled) {
> > -		pwm_sg2042_config(ddata, pwm->hwpwm, 0, 0);
> > -		return 0;
> > -	}
> > -
> >  	/*
> >  	 * Duration of High level (duty_cycle) = HLPERIOD x Period_of_input_clk
> >  	 * Duration of One Cycle (period) = PERIOD x Period_of_input_clk
> > [...]
> > @@ -123,13 +123,16 @@ static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> >  	return 0;
> >  }
> > 
> > -static const struct pwm_ops pwm_sg2042_ops = {
> > -	.apply = pwm_sg2042_apply,
> > -	.get_state = pwm_sg2042_get_state,
> > +static const struct sg2042_chip_data sg2042_chip_data = {
> > +	.ops = {
> > +		.apply = pwm_sg2042_apply,
> > +		.get_state = pwm_sg2042_get_state,
> > +	}
> >  };
> > 
> >  static const struct of_device_id sg2042_pwm_ids[] = {
> > -	{ .compatible = "sophgo,sg2042-pwm" },
> > +	{ .compatible = "sophgo,sg2042-pwm",
> > +	  .data = &sg2042_chip_data },
> 
> I would have expected that checkpatch doesn't like that. At least I
> don't. Please make this
> 
> 	{
> 		.compatible = ...;
> 		.data = ...;
> 	},
> 

I will check that, thanks.

> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);


