Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4101178F59
	for <sophgo@lists.linux.dev>; Fri, 30 May 2025 09:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748598512; cv=none; b=FpTuGbK2hBL8W07qHsPEeAKdeZRgoln/q4MErrHicxWKUJ21DJX7a+34UsAnwzD8QLzhZTA3O2MK8UrGh/4xQezSli5/gvYMvH6+gSoS7WMHtSypi9AvmCyZL1MQS+dyEYoKwrvndeh4waVbEE1to1O6fuZzWSqw5THns0hdesI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748598512; c=relaxed/simple;
	bh=YudCrucAx1p31d0Wm18PRjT20S5RtbDxkt+4OGkxwE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U24RiEfMTdup9TyayD6SJfBiy57obuaerEwbAzmFExiLztbxqqxJD0AMIWljvJn2RfTJUOiHkvR4fR5O4TC65PT16FObPZY3Qb0Psnq0HeuLdrRz4QMyoVo0t4SROjmrNtpt1XIV7oXQnpKfQ1SXyyUOyRbwFtp6vVgZSsXqMZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aV4BwoOB; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aV4BwoOB"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2349282084bso23413895ad.1
        for <sophgo@lists.linux.dev>; Fri, 30 May 2025 02:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748598510; x=1749203310; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ookjxClzf4cQCEvAmXl0RF2BomztovFb9LfDcMb8UFA=;
        b=aV4BwoOBd1iF2WzLSxWHQ3UfYz/tNZXYWYO3sjOIY+bxornPP0iqNgdslG5JbJUm+P
         389FuprTMga7cX6kYUarBU/3HPA3rJ60FT/N48CiVjArGEX8MiceV4FIAnPv9f3kvugD
         m0CbUJfvUMG7mj5E48dBSDmNQM71GxQeFD/Dbv4aKUKLTUTrFJHY52WTj1DLu3XM5gKN
         tB5CHZavGozoq4UokxKbqSokh0W60Ym6UOxQldAAAJw4t8xPMV0uTUzUIZJoZLTmXF8M
         qRdZNxDhMy43YtRz9k8908Y3jlnf2ZUNy6UsEUdI6byTU6ESptqy0jDqcCQdQbCM8Tq0
         pH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748598510; x=1749203310;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ookjxClzf4cQCEvAmXl0RF2BomztovFb9LfDcMb8UFA=;
        b=AO5cmZ//b/w/qMfB42mfznik2fi05CkwGuzaRbjkpuxXXXqPq99uaSXFav0rmBuq+D
         0+ShIFLEXhinqFSw5PGkw1gVU8HwGYayinCLfDjMIUnViD18GMWVLpCutE446cNnnQQw
         GNqmPm6Fyd6A3E98jKZzxiBcjzWYQfa0RpWtVSh6BwbDKgyvd4i78PD4GqE0XXgImTCH
         By7D6R5QRPAFVplgQ7fwWA+0K+Vx9OYqxk5/xozTGsvxjTG1KsjTKSRvWLb9H0SgLIqh
         p57vqNfDQTKKMFsriKv5y0NlQUKLJSyEXImGFOHj5adovU1eK9jXd6ynsT+ec6Wzjo+x
         7wtA==
X-Forwarded-Encrypted: i=1; AJvYcCXcVD+3cPcOedwW0t31mRqIno4wEhHfJVTc8TMExosySSkjzvHm80o9YusG/CwIXDhKR1FMchs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz89e5diBTCp0vPD+ohCf29bl5nBZaE0qnhNPo4jdBodHmnhb7y
	uFsSErZdd8dNMko4ksO9andj4i1u3u7tKViOq/Y0hmhN1WU//X7CIPlZ
X-Gm-Gg: ASbGncu0OH04VdWaZ84jMJ7UmDh1BmThqAcuJvBLnZD5Jpgjz0gjTUHGbsLyC6HVq7W
	Gls8Ij2LiE3rvUzVWihvH51r/mAuvgAM4OKCsdj9KaH0+ImfWzIv781UiWSOj5P6CNiXTdPbCod
	mXXFhfYRs8bEVSGE1aW3XdXf8pAT0KcKw4qrfdkGXRbunEsNQYyMrL1nhhhgzNxusbTP5iXzz2R
	8EYHltVlgpynglqV/fyId8y0vT55Hyb1zKNKkIpOuyZ9tta9FQmS2hsjcOYRJaOoLt+zhy0NDXA
	6YcKBMGvcL2O4VIR/A61UVvFnMjZytdmr4C8eA+bK4PLbvDbCUEK
X-Google-Smtp-Source: AGHT+IF9sCFOftJujauKnIRomaigvG8t61Ftfb7NDiYEGkXgDAJ4CTIfsKr0q6wuZJOiHiCtJPc22g==
X-Received: by 2002:a17:902:c952:b0:235:779:edfe with SMTP id d9443c01a7336-23529a11512mr38942725ad.43.1748598510306;
        Fri, 30 May 2025 02:48:30 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23506bc8483sm24863795ad.1.2025.05.30.02.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 02:48:29 -0700 (PDT)
Date: Fri, 30 May 2025 17:48:27 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 3/3] pwm: sophgo: add driver for SG2044
Message-ID: <oo3pevzuyhrsf7t2ja7mxytaxhnthfar73iwvqxgawr5gjiudf@hbevzjog7akj>
References: <20250528101139.28702-1-looong.bin@gmail.com>
 <20250528101139.28702-4-looong.bin@gmail.com>
 <azf5lzfkegr6wt3mratxra2mlfah45dc3comtkjbrbdzf4x5xc@tlzxp7oqtcfl>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <azf5lzfkegr6wt3mratxra2mlfah45dc3comtkjbrbdzf4x5xc@tlzxp7oqtcfl>

On Fri, May 30, 2025 at 09:50:25AM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, May 28, 2025 at 06:11:38PM +0800, Longbin Li wrote:
> > Add PWM controller for SG2044 on base of SG2042.
> > 
> > Signed-off-by: Longbin Li <looong.bin@gmail.com>
> > Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> > Tested-by: Chen Wang <unicorn_wang@outlook.com>
> 
> Nitpick: Make your S-o-b line the last line. This way you document that
> it was you who added the tags for Chen Wang.
>

Thank for remind.
 
> > [...]
> > +static int pwm_sg2044_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> > +			    const struct pwm_state *state)
> > +{
> > +	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
> > +
> > +	pwm_sg2044_set_polarity(ddata, pwm, state);
> > +
> > +	pwm_sg2042_set_dutycycle(chip, pwm, state);
> > +
> > +	/*
> > +	 * re-enable PWMSTART to refresh the register period
> > +	 */
> > +	 pwm_sg2044_set_outputen(ddata, pwm, false);
> 
> I'm astonished that checkpatch doesn't spot the wrong indention here.
> 

I re-ran the checkpatch but no error. Maybe there is something wrong
in checkpatch.

> > +
> > +	if (!state->enabled)
> > +		return 0;
> > +
> > +	pwm_sg2044_set_outputdir(ddata, pwm, true);
> > +	pwm_sg2044_set_outputen(ddata, pwm, true);
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct sg2042_chip_data sg2042_chip_data = {
> >  	.ops = {
> >  		.apply = pwm_sg2042_apply,
> > @@ -142,11 +215,22 @@ static const struct sg2042_chip_data sg2042_chip_data = {
> >  	}
> >  };
> > 
> > +static const struct sg2042_chip_data sg2044_chip_data = {
> > +	.ops = {
> > +		.apply = pwm_sg2044_apply,
> > +		.get_state = pwm_sg2042_get_state,
> > +	}
> 
> Missing , after }.
> 
> If you're ok, I'll pick up this version and fixup the two code changes
> and the order of the tags in the commit log.
> 
> Best regards
> Uwe

Thanks, it's ok to go.

Best regards,
Longbin
