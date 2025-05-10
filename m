Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9C820B804
	for <sophgo@lists.linux.dev>; Sat, 10 May 2025 22:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746916480; cv=none; b=epXlmTSwfbmnqJI4aNj7guZaFlZa7IckDkfauC7POiRB/1qU0QacxSI35snpau6JBfplR563rrrcw9ZvHscbRHXLItKgpg0guf7zDE6y9Je2iPSci1liY6fER0/TADtzKSkVd8Dl1niFzte9R91dVIMBiAkYB8wh0qD7o+0bcvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746916480; c=relaxed/simple;
	bh=VA+r8TlMvQ+zsu8dUJc/GlSJtmFEKUVcH9YdAOj/AH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyBbgeQvr82o6U57RArw//SGkd8VPZ0m0GIgksoOy1EbEMPnQo1Q7ftGKJjwlhUZb4QKFxyXWelSBc9gJJlQ6lf4fvKQAAoQRJf8Cqqk0L5HQMWgOf+VQ+PBil/dHNSM9mkGm7xiVykci5hIgGbpXXVWHtgkYD2EXGR18LE7zbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOrz9F/D; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOrz9F/D"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c542ffec37so385898085a.2
        for <sophgo@lists.linux.dev>; Sat, 10 May 2025 15:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746916478; x=1747521278; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X9RqchaeKuSR9tb3CHmzTo6Ss78YKwXAQrXHYWmrF9A=;
        b=ZOrz9F/Djwtj26v0a/07a7Gpt6EJE/Dso91Q+qBulJDz4pR2L0EKDUoDQW8Q34awQI
         eJGPDKjwmpZoME48fTJooj1CkaSPXIRAq6zFEIWSIQLZ5BpA6N2H/TsQQ9Qsg41SJoPg
         LTlIKKUftxGxuY0i7fVGhSvGumtnUDsIPW7xoXShJQDZS9gSbN9tjsiBL3YNxP1YWNxV
         Sg5JULKERi4lLqtC4DHM+mL21zYHhQOYit94AOWBAVwQ8vCieXvp9s7/zMIrxWqwIMEx
         NvmfH6ffJZNmPsfE2MlNbjjISAj3Z1/KOpbSVaiYnhAdJMqQTzujtHd0/vYbhSg50KMR
         Z4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746916478; x=1747521278;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X9RqchaeKuSR9tb3CHmzTo6Ss78YKwXAQrXHYWmrF9A=;
        b=HvIHgNaAUxSdnXr/g6KZtLbmSs66ohT8bW7xSyYKy5JpU6Svaf8jE8s/aU9KkeMFyj
         X+NsrHALCT7dZp3dNiP3pKPAz7FyhwKGIxl9aOuNMUR+b6PK8ySw3D3Rsg9ocnytEe/X
         9qKQ/ETnprweMyDbpiLUjl+GoeXa0Z2NKHahJIfEL/dzchZ0ilcLnQx3fxgpK4IiCSFr
         VsxfJUCxjrT4C4ld9ZPFVCwe3ICXNMfjAn5f53YVVFe5G6KSfjfD4lHeiXliXnUr7RRg
         aCAxPkhVYWJnGDLO6+UD+Xxx0MxHSmzxhMZDX1giegzBlXb4Ij4JTpRZ5JLGfo5ThHCk
         5inQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIUrapOI+Au0tBGYX5wZzMjAvOgdkEqPaH83ZIhMXOtUkEgOjg1FNJXBdjF44I9WY1vN9QWK0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYoJ0NXCCGv0/gBGhGReNVlDjl794WEHVDr5Ca1LX9UTMlkNc7
	WOja3jo/OqpyTF+5HSqmpRqyx0IbFXbQ6BZIRkKaWYrjp+vNYSjU
X-Gm-Gg: ASbGncuGuYNwo7agcwD/lFb1Z4SS7J2ADZJzTg8dJCGdbxeaMU6JmN9wXoxeVZXLwEd
	wwQiWh4AD5gdLEYCAnwl1BbwITPjwwnxScWonaltUbuCfaHPD2jZoiUIoWDQ6waDpbDrOIryRtv
	ooT8laL907auy/eVVaYr6JcZDeLsYEuzOkMmZ7DRoSVu+j79cMNLCrBTvAw1n9R3HeM39hiwhrK
	YE0q36166vU40ZUrdghCszaUQ+s3Zgj9s2KGOLO579J7GGg3AUsUDoV8WnMyjNCCSKsXaB38VHf
	b+CrhIiR+W9RHOWm4g/WQgGurZE=
X-Google-Smtp-Source: AGHT+IFNxZ+WwsD8gTpXkGg65SNCLgE5qlBO7RTMUPiiYfAL7UnFJgwMfjv6YT79wlFJycMs0w8xeg==
X-Received: by 2002:a05:620a:d8d:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7cd01168e05mr1231923285a.58.1746916477861;
        Sat, 10 May 2025 15:34:37 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00ff11d6sm318727185a.115.2025.05.10.15.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 15:34:37 -0700 (PDT)
Date: Sun, 11 May 2025 06:34:09 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
Message-ID: <u6ofni4aabs4jy4unh5nudgm6qieg5hsk3xt4725yiuumlspen@ypery534oe4q>
References: <20250507195626.502240-1-alexander.sverdlin@gmail.com>
 <dm4l3wfcuygmuylz6uqn2g7wztg4tyrjbm24hqcpffjnpkwany@ib2nvjibq2wl>
 <4d15d7b363869080da825ddc700e553a68928c85.camel@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d15d7b363869080da825ddc700e553a68928c85.camel@gmail.com>

On Sat, May 10, 2025 at 04:30:07PM +0200, Alexander Sverdlin wrote:
> Hi Inochi!
> 
> On Fri, 2025-05-09 at 06:21 +0800, Inochi Amaoto wrote:
> > On Wed, May 07, 2025 at 09:56:20PM +0200, Alexander Sverdlin wrote:
> > > From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> > > 
> > > Implement the RTC driver for CV1800, which able to provide time alarm.
> > > 
> > > Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> 
> ...
> 
> > > +static int cv1800_rtc_probe(struct platform_device *pdev)
> > > +{
> > > +	struct cv1800_rtc_priv *rtc;
> > > +	int ret;
> > > +
> > > +	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> > > +	if (!rtc)
> > > +		return -ENOMEM;
> > > +
> > > +	rtc->rtc_map = device_node_to_regmap(pdev->dev.parent->of_node);
> > > +	if (IS_ERR(rtc->rtc_map))
> > > +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->rtc_map),
> > > +				     "cannot get parent regmap\n");
> > > +
> > > +	rtc->irq = platform_get_irq(pdev, 0);
> > > +	if (rtc->irq < 0)
> > > +		return rtc->irq;
> > > +
> > > +	rtc->clk = devm_clk_get_enabled(pdev->dev.parent, "rtc");
> > > +	if (IS_ERR(rtc->clk))
> > > +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk),
> > > +				     "rtc clk not found\n");
> > > +
> > > +	platform_set_drvdata(pdev, rtc);
> > > +
> > > +	device_init_wakeup(&pdev->dev, 1);
> > > +
> > > +	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
> > > +	if (IS_ERR(rtc->rtc_dev))
> > > +		return PTR_ERR(rtc->rtc_dev);
> > > +
> > > +	rtc->rtc_dev->ops = &cv1800_rtc_ops;
> > > +	rtc->rtc_dev->range_max = U32_MAX;
> > > +
> > > +	ret = devm_request_irq(&pdev->dev, rtc->irq, cv1800_rtc_irq_handler,
> > > +			       IRQF_TRIGGER_HIGH, "rtc alarm", rtc);
> > > +	if (ret)
> > > +		return dev_err_probe(&pdev->dev, ret,
> > > +				     "cannot register interrupt handler\n");
> > > +
> > > +	return devm_rtc_register_device(rtc->rtc_dev);
> > > +}
> > > +
> > 
> > I wonder whether the rtc driver may need reset (maybe optional) for this?
> > If so, please add it.
> 
> I'm not sure which reset you are referring to... RTC module can carry out
> system-wide resets, but cannot be reset itself (as I understand).
> 

This is fine for me.

> Initially I was thinking about providing a reboot driver for Linux utilizing
> the RTC module but it turns out PSCI interface is not optional on ARM64, which
> means PSCI reset interface has to be provided by the firmware (I'm thinking
> about U-Boot) and Linux will rely on PSCI reboot.
> 

I am not familiar with PSCI, but there is a fact that preserve uboot may
be costly as the ram is limited. I think it may be fine to have a reboot
driver to provide power function at the same time. But if you find there
is a way to implement PSCI reboot, just do the thing you prefer.

Regards,
Inochi
