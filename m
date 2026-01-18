Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C57B2F4A15
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 12:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768739265; cv=none; b=MAQJptKJ6pBAokYo75AM9OiYY6z9uzDkCOY3Fe1vim4WXRW+IVSS+QiCtYH1unNY5TXd4BVMluS2RmmftE+qta2sBigVCrHujQR3ePLZ0QkkktFg+JdR8ZqoDQ1vIOF1GWmjJeWVcDVTMOtDlzYsHvM/WB91mIy1q+3fOltorVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768739265; c=relaxed/simple;
	bh=t9SwgwzAvB+Xaplm+rrS1u4zYy/Ei5IFgZD1D3gvqAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+UDPHqXtYPTGNkt9q2+iH1wZyl/nB9GfKF3GhC8rsc1lgpO4A8dk8t9wJx2bA8QtSkGpzb0ImPZBEi7hozphKBz7la7Wd1w2nMHmAaCZ38L7/PxnYi+DjXkcBPEP81dH6bxU+9gurXmeqjqwPkpcrPwXLs/iusxS2lMY1KPx7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/7Wl41l; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/7Wl41l"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so23143805e9.1
        for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 04:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768739263; x=1769344063; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9h5PT98oehXGGTuTpwmqI77fU/XEwWQyJVUHxiP7aU=;
        b=g/7Wl41lWrCw2+3qkAfxApZiV8rU2BzLy/fwh8uz7QEwp4PzpBdn9XF463nfMnTZ6X
         ZDlxAqbuNE8drHQlIdjPsOPKRypZDPCEkXcsuMvG2pO29rMeDaVtq9vw/GHxC8KbE9fX
         860/rPn9u9JHWNXl4y3TzS22HOcUqDGGdd8NF/S0A+mRrYudrr0i2H+BW0MGijvCZi3K
         PZPeMHCBY4LqrCTBx40fSPJ5A8swUshneTwlIZJKMDB8bYzGUcImAN2CZPujTtj8hsAv
         Z5XXrGeusHdHa9AIX2VY4oMfW2UMxEE4BIhGQcO9oplrAdhdHDnkM/7acutCZ0Kw0Nsl
         4UEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768739263; x=1769344063;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9h5PT98oehXGGTuTpwmqI77fU/XEwWQyJVUHxiP7aU=;
        b=A2EgW20n7nOlkUH7E1V+vPG38TL/2notvQ0dXdoDF2FxPIZG3JDOCJ357s7IXuApGu
         d5FjTqXzQALfZ81Z32flzzqMNeHQsbNjF2NalJi91RTeEBNKNOCMKuagu+nqxZmFxEIF
         acjEH32pv4U/3mEd7QgWop0uOcJ+ijUe4e5KRBevlEeOER7wmYEVoN2uILj2l606hSnV
         JetMnthGVnwetenmqZ1WUwGJdmvUudYyfJmGQW2C7p7TAnTRzFzV8JQkgCUzwmJEm0AX
         QJgzC2SYiGNHK59d7eQ2My8WXWqiqDDnGZ7u5fv8CCb7uqff3GtKlxL4GBqr9Ni5lsAj
         kRHg==
X-Forwarded-Encrypted: i=1; AJvYcCWDMQAI1Oh2ELsjiV015QssDGhy4tLc1s+9xvIjhXzmADm66VnCjE20KcaWduqzEfcZ719naZs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvfB4T0AEgmUNi8C70cZ/MFUIKVXkSZNKN5u2/QvJs9btTOZGr
	i+jEE2QCSKs7J/WMgQEvtEFxo09KkSwOw9PppLiO5VdXSMyKN29V4sTL
X-Gm-Gg: AY/fxX6u6NYqvfpJ03fshiqCkvkhJALP+nv2q4WNKKMCuvzIinzKbr6N5bhaBeh3DRA
	LkxYLdkTOoP+wm98/DoQtMjg8b3gYFopFpiIW6jIRLn04rO3bYYN+KEr+KNfFGH9q2MCNNRpYmv
	NBU/NhqgJHi+yCo6xE9WoqorWM9v5uzS0VzN3OV9fTMu5HibOqdA83Rrur5PzLWUaQ38BXZItZy
	8xBc4/gGjoFR53MBmPSgeA4pajNVf53oqa2QJSBEQtl5Amfex8M7i7HvMlTeDu1KmYx27yREbit
	LNCOOZKge2Cu7MlfvE6z+ZJHhACLgTGsAF3mWBeiY7cJ8/aqc8Y0zIhqGmc4qj6mPUU6I9pkJ8Z
	emre4jc4NufjcBQ6F8puKhtEH0dwwKSx9EUm9hLDJJ3Pfs1jElrbLthhpMQjW1UQFn79up+QIT0
	o0owpLs6XSWhWivTgcNLRq4WilSUgK8/wes/QaKjk0vFo=
X-Received: by 2002:a05:600c:820d:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-4802a29f85bmr44396165e9.4.1768739262625;
        Sun, 18 Jan 2026 04:27:42 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c0475sm169474355e9.10.2026.01.18.04.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:27:42 -0800 (PST)
Date: Sun, 18 Jan 2026 16:27:37 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/7] ASoC: sophgo: add CV1800B I2S/TDM controller
 driver
Message-ID: <aWzP-rRNKPHlWaWO@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-2-d10055f68368@gmail.com>
 <20260118-pastoral-resourceful-mandrill-47bda6@quoll>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118-pastoral-resourceful-mandrill-47bda6@quoll>

> > +++ b/sound/soc/sophgo/Kconfig
> > @@ -0,0 +1,20 @@
> > +menu "Sophgo"
> 
> Missing SPDX. Did you run checkpatch?

Actually I did. I will add SPDX and recheck again. 
Also I will take a look why checkpatch missed this. 

> 
> > +	depends on COMPILE_TEST || ARCH_SOPHGO
> > +
> > +config SND_SOC_CV1800B_TDM
> > +	tristate "Sophgo CV1800B I2S/TDM support"
> > +	depends on SND_SOC && OF
> > +	select SND_SOC_GENERIC_DMAENGINE_PCM
> > +	help
> > +	  This option enables the I2S/TDM audio controller found in Sophgo
> > +	  CV1800B / SG2002 SoCs. The controller supports standard I2S
> > +	  audio modes for playback and capture.
> > +
> > +	  The driver integrates with the ASoC framework and uses the DMA
> > +	  engine for audio data transfer. It is intended to be configured
> > +	  via Device Tree along with simple-audio-card module.
> > +
> > +	  To compile the driver as a module, choose M here: the module will
> > +	  be called cv1800b_tdm.
> > +
> 
> ...
> 
> > +static const struct snd_soc_dai_ops cv1800b_i2s_dai_ops = {
> > +	.probe = cv1800b_i2s_dai_probe,
> > +	.startup = cv1800b_i2s_startup,
> > +	.hw_params = cv1800b_i2s_hw_params,
> > +	.trigger = cv1800b_i2s_trigger,
> > +	.set_fmt = cv1800b_i2s_dai_set_fmt,
> > +	.set_bclk_ratio = cv1800b_i2s_dai_set_bclk_ratio,
> > +	.set_sysclk = cv1800b_i2s_dai_set_sysclk,
> > +};
> > +
> > +static struct snd_soc_dai_driver cv1800b_i2s_dai_template = {
> 
> Missing const
> 
> > +	.name = "cv1800b-i2s",
> > +	.playback = {
> > +		.stream_name = "Playback",
> > +		.channels_min = 1,
> > +		.channels_max = 2,
> > +		.rates = SNDRV_PCM_RATE_8000_192000,
> > +		.formats = SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S16_LE,
> > +	},
> > +	.capture = {
> > +		.stream_name = "Capture",
> > +		.channels_min = 1,
> > +		.channels_max = 2,
> > +		.rates = SNDRV_PCM_RATE_8000_192000,
> > +		.formats = SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S16_LE,
> > +	},
> > +	.ops = &cv1800b_i2s_dai_ops,
> > +};
> 
> ....
> 
> > +static int cv1800b_i2s_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct cv1800b_i2s *i2s;
> > +	struct resource *res;
> > +	void __iomem *regs;
> > +	struct snd_soc_dai_driver *dai;
> > +	int ret;
> > +
> > +	i2s = devm_kzalloc(dev, sizeof(*i2s), GFP_KERNEL);
> > +	if (!i2s)
> > +		return -ENOMEM;
> > +
> > +	regs = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(regs))
> > +		return PTR_ERR(regs);
> > +	i2s->dev = &pdev->dev;
> > +	i2s->base = regs;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res)
> > +		return -ENODEV;
> > +	cv1800b_setup_dma_struct(i2s, res->start);
> > +
> > +	i2s->clk = devm_clk_get_enabled(dev, "i2s");
> > +	if (IS_ERR(i2s->clk))
> > +		return dev_err_probe(dev, PTR_ERR(i2s->clk),
> > +				     "failed to get+enable i2s\n");
> > +	i2s->sysclk = devm_clk_get_enabled(dev, "mclk");
> > +	if (IS_ERR(i2s->sysclk))
> > +		return dev_err_probe(dev, PTR_ERR(i2s->sysclk),
> > +				     "failed to get+enable mclk\n");
> > +
> > +	platform_set_drvdata(pdev, i2s);
> > +	cv1800b_i2s_setup_tdm(i2s);
> > +
> > +	dai = devm_kmemdup(dev, &cv1800b_i2s_dai_template, sizeof(*dai),
> > +			   GFP_KERNEL);
> > +	if (!dai)
> > +		return -ENOMEM;
> > +
> > +	ret = devm_snd_soc_register_component(dev, &cv1800b_i2s_component, dai,
> > +					      1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = devm_snd_dmaengine_pcm_register(dev, &cv1800b_i2s_pcm_config, 0);
> > +	if (ret) {
> > +		dev_err(dev, "dmaengine_pcm_register failed: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	dev_dbg(dev, "cv1800b I2S probed:\n");
> 
> Drop, drivers should be silent and probe success message does not
> warrant even debug. What are you debugging - that you wrote correct DTS?
> You can check in sysfs that device probed.

Will do, thanks. 

> 
> Best regards,
> Krzysztof
> 
