Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2FF25FA05
	for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526693; cv=none; b=WAy+N9PYEhd/NnOK/AevwzXeDxlKAj7F8qWdElIn5a4q8Y8PPhbhUNXijRGGW05GGIjqZaz0NpFGgJfxfr+hrCepLkL6qjj8wMRQwgjH1UslFZqBTZqpaPJ5+odmPQi85HzWfUJmkUP2WMwbJDjrxU397T2Ki9baNYJujZN3Dl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526693; c=relaxed/simple;
	bh=Blyg8N4zeGue27HmsSmO/bdRk6JHhRMc1NUiP/XT1BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPfphMyiXJpHKtBHdbeo93fo1KCf5Meddv22ziHAw699TzF9DTdsltHWc1vZUZ+cX6Gh2/ezX3+cOTVuDuAHpSYYZrDrrLoHWpCyQNFUaKeXHrP0bDX24mG8jFDEP7aSAq97Nz43hrywtvWCf4Lk5wi82J/MN5EiqyOyVtux4ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBbNpJlK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBbNpJlK"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so56578785e9.3
        for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 07:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769526690; x=1770131490; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZiYOJIssOgLGJ3sqVKfxdywenJ86qmXkRu/RSeqz5RI=;
        b=SBbNpJlK7Vm40v1sNu4LJXVq1nluWBk/Nz9IDrzHpph8uz14H0qm1unaGaf1Z+yuUN
         UVtYQGPd80WZg7rBQQsN9rxQH2KELMyg8KXqCpztFNiP3TNgWwxnH8BPZLeWsa7NTDmj
         ngI70MqIDEzm6MdpmULrpGBmWGYbfaRg1D9yGvqWGKziiufFSQ2E7j1oYdGNluEKO8h6
         +hVlJxFZ9zKcndI7oVjT1yxzYEidBpYvSRlZNHsV6TfNxUmXeZZxy7scCSkysUxRv4jC
         rokbfDpn4A/lDstoGD3iiOoy9giUW/89yw4Zrghyh3zRVEtF7j3a2nalZ96qT+5iee74
         mb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526690; x=1770131490;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiYOJIssOgLGJ3sqVKfxdywenJ86qmXkRu/RSeqz5RI=;
        b=lIuTJYEFbHznXQDN25tbrv3mPskiqLZfCl+BkW4NQmSdtUcXH+4CP6Scz7Ta35+B+b
         Qb2DFVi00pOHInpKBIBy1VhwYRQcffFEi6k3SQuetru+bQ7eDCJ22eDa4FtGw7D+sR5l
         Pjeq9QGU80nt7JW/d6yS61Q4RBUmJ+UEBB5wvQuTNjpI8HtuxLtjOqNTWGf+WeH6qGEp
         vqDD3FUH2RwfO3OUA0JSpjDQeZ4Cd32nU0nF9iSVHue0eqgdFMJLIbEV93ki0NjRC2gG
         XLeMyI1MdQFfgsSfv6eJCSXUnoJrvUEX2uKRzzyszPB2Qk7PU34syZH4NCv5hDDzShdN
         M8Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWLXav9cmQk4EH+DF8lmW3ZiZZf9lO2zH6jB/wjFsXNhth0wFCCh0yfyXNXm7gnhkNo/xsUZCY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxG18SOOwwgK3y7pnJRoffSX0aW/G9UqZ1oDwB4PQfq+UkiOrFx
	7dp0uef3YOKkLJCMQb5rYACs39SHPUC2mmkAcY7iaD90NO72eGqNOhaZ
X-Gm-Gg: AZuq6aKIuf48VPRm7vfOvKhnRU+0m7GMMTfXgkVxYxXAPw6baDZVY720Lo4EBKxvZH+
	aZi70/QBnKMA+pvkUCHYtgIgQTOiB/Clks/KVm8DrqjJ/zJQ4E7geh1zq4KKuftAUtke6wgr0V5
	yx0BgGzDrRMhdRIveQ0jGDsxdBFTSfGBSpu8Z72KDycAWffBROghv9tn0Cboc61dzXGAjZ7zoss
	9W3+8nM8AbyTEWXoLok68Yz6kInX1E+7KXZjY4NAb/Eli9wBbBC0jUzpavErai8Bl2eCB4hac8i
	UUXtxY9dCBMaFlGTuDO4zDvSe7+kqK0W7048juVAsXlNPd29G8M9amicCvX17P4tSYW2He7YScJ
	3TZsNerlL6QMuSGVCGRRhbULcnelqj9vpfiUcS9Z/q6X9R6pYgIYYz8Vnx4WV9mFPWd752Dw7Nl
	xg/w2hMZTeduzXFTbeFwWJfqBFghwBcnTApolDI6PRNxNz3EQ1C4lghgk=
X-Received: by 2002:a05:600c:8211:b0:480:4c45:aff5 with SMTP id 5b1f17b1804b1-48069c755e6mr25187715e9.34.1769526689995;
        Tue, 27 Jan 2026 07:11:29 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be7623sm63589915e9.2.2026.01.27.07.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:11:29 -0800 (PST)
Date: Tue, 27 Jan 2026 19:11:24 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC codec
 driver
Message-ID: <aXjRx12yPA7QflaF@anton.local>
Mail-Followup-To: Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-5-6ef787dc6426@gmail.com>
 <88ef974b-9fa8-490e-ba19-1fb31ca94342@sirena.org.uk>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88ef974b-9fa8-490e-ba19-1fb31ca94342@sirena.org.uk>

On Tue, Jan 27, 2026 at 12:49:52PM +0400, Mark Brown wrote:
> On Tue, Jan 20, 2026 at 11:06:07PM +0400, Anton D. Stavinskii wrote:
> 
> >  	help
> >  	  This driver provides an ASoC codec DAI for capture and basic
> >  	  control of the RXADC registers.
> > -
> >  	  Say Y or M to build support for the Sophgo CV1800B
> >  	  internal analog ADC codec block (RXADC).
> >  	  The module will be called cv1800b-sound-adc
> 
> Extra change here.
Will fix, thanks. 
> 
> > +static int cv1800b_dac_hw_params(struct snd_pcm_substream *substream,
> > +				 struct snd_pcm_hw_params *params,
> > +				 struct snd_soc_dai *dai)
> > +{
> > +	struct cv1800b_priv *priv = snd_soc_dai_get_drvdata(dai);
> > +	int ret;
> > +	unsigned int rate = params_rate(params);
> 
> > +	cv1800b_dac_mute(priv, false);
> > +	/* minimal decimation for 48kHz is 64*/
> 
> Nothing ever mutes the DAC so this is a bit redundant.  The mute should
> probably be a mute_stream() operation.

I'm not sure here. DAC mute feature was not implemented because I don't know how
exactly do that. The public documentation is very weak for my taste. 
This call added here to be sure that override flag is
not set (override feature replaces the output by setting it to constant 
value and ignoring the input, so it is some kind of mute from my understanding. 
So ensuring this off is needed be sure that DAC will output our I2S data). 
What do you think will be better to do here? 
I'm sure that is needed, but may be better to move 
it to some early stages, like probe function. 

