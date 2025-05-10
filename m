Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0A51EEF9
	for <sophgo@lists.linux.dev>; Sat, 10 May 2025 14:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746887411; cv=none; b=EVCzFYyvamhEFez1GOX0TeP37/Yvs8YMtOdGA6CDpIpzaM1HhJjgJfvhDLfJzNyAaiebokZK/MTlxU+EZDjUNngiEFr+qjCnYYVYn7dcmIYGwzHrmKwte/XAVR3DhsC3c3dcMTLDyU3E1GsrRGaMBnAlKtaMSaCAh9CqAid161Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746887411; c=relaxed/simple;
	bh=7gKR5UtMn13+zLt0ra7xMJLnlypCI+Xwy7ts2OMRJ1s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gMiLhMHQKk2U8qunkpMXLLrRsKmeLWy7L8aPDyFCJLLLhjtzT1Va5r9wWb7TPUHlqCeV3R8SmnAekVLFFepDnkpIlCUcEt7orNCwOp8ue4Oh788oMETCFALdZ8xbHkUL7xmPLRXSRD9D0HDt1oaMNoMV1s8RFGUhEBLJpmi77Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvRrJb46; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvRrJb46"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5fcf1dc8737so838313a12.1
        for <sophgo@lists.linux.dev>; Sat, 10 May 2025 07:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746887408; x=1747492208; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Vcc1sPNAwq2Avldce0tfnp1yheLwV7MWegDuz28tG8=;
        b=XvRrJb46f8He+csoxsIav9xBUPQYwhjzRu2/177vhH7zmFwgQ1pX4XEJe6a39UA/DM
         GyohVuyBsQFf6y4aqepM9cwfg06jpss7XBgT1xQESNV2hepB3xawPssdrwxwDdM2QaCb
         OQKIL6xsscmafpBrDDnbH6sa/0i0Xd1Yg++AEVWxdq78F4YkHxh4KrRWayzlKE/MfW1t
         6fTYW87fML6LXONoYCoTnTAfLFxjZ/k/uI5lgu45znCadZHMvHsZTh91Aj0IAb9MFa64
         7zOVH1DyKUDzkksxvJmX2uZLdfuHiINdt151Hb6LXblXRoT6R3dsgbxPJn7mSj92JqNQ
         6A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746887408; x=1747492208;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Vcc1sPNAwq2Avldce0tfnp1yheLwV7MWegDuz28tG8=;
        b=jQDu6lhJEndcuQIcgxu4eITIXAKnekW8itADzxKCL8mzB0LksQmpG+odhMiFUHGijq
         rFEN6r9gQTaBsYj39AOk+6Avkqd/IeTxiepAyDyjp2BA5EArvTgq63AA6z9ccdhlrtB9
         19WdWJxKWulUnK6l631jNvGl51+xFnbYAZSTZ5TJG/DBW2mima30AgCA01TllO7XxOSg
         gro9HOpl0SOy0sy/P14Pliovf5NrAs/LGC+8jczdChj3lmJwkjZCUHxcwmeSq6HTnQpe
         QbD7EAoUHQfGjkcsJYVP5ly0YFYu3K/+/LFu/HdQwTMVY5uEfs8ACRmopMsUI+r02Aqr
         eXsA==
X-Forwarded-Encrypted: i=1; AJvYcCV+SvmjLsfFgE8f0fYGYLM9/pq8qx/vtxoh3K5Cf4bd5I0Q2s42UcxNCtpHs9XbaWKTankPc9s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl32SBR6Eh8wOtimM4gD+nsIWvG0V0+5mXxmIhq5pSZNsndfju
	ir94R3oJwQF8JLDmgkxCVcH+hqvLwJCZ1Ky5cd9kXpefyrFgqdV4
X-Gm-Gg: ASbGncvAMh9jT2vTpNFlZdONFwuviDnuWIod1YWkYNsT3tAektJKS9HO1aETnbDMcLb
	MeTjn6sym0YeVM0NaO06GKUHGc+NA0yWDs4J4pbWxtn9f63MZsD2aswEsEAk6+QMq/qyapJC5bO
	CyMrhmA91EGSs7SFu4tieBoWBu6P0URrUwBXiqkdu08j9LHcXgs05BNK0kMhS7nsR9oGaqECY6U
	kvx5f1+wIoFvz21/n/hQGLvDLLmM4sdZD73DcUCmycB1++9oeYG4cP3KIU7bWKMaozlgRkCjf9H
	RDXveHfwv2QvgnvG/nLpnfeXu/PJbXIRpitDU65jGwsxqnzT5OMLCuzVJW5vaUDGtbbWQ48=
X-Google-Smtp-Source: AGHT+IHTtS3U/FK4YQq9mimt8v9QXrQcvMdB5tLRdu86v1btaKo4EkPoSzg9Bfnd4d0BdhfJ1xtywA==
X-Received: by 2002:a17:907:8b90:b0:ad2:2fdd:fef2 with SMTP id a640c23a62f3a-ad22fde05c1mr302525266b.53.1746887407671;
        Sat, 10 May 2025 07:30:07 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d70dac9sm2909525a12.67.2025.05.10.07.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 07:30:07 -0700 (PDT)
Message-ID: <4d15d7b363869080da825ddc700e553a68928c85.camel@gmail.com>
Subject: Re: [PATCH v15] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, 
	linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Date: Sat, 10 May 2025 16:30:07 +0200
In-Reply-To: <dm4l3wfcuygmuylz6uqn2g7wztg4tyrjbm24hqcpffjnpkwany@ib2nvjibq2wl>
References: <20250507195626.502240-1-alexander.sverdlin@gmail.com>
	 <dm4l3wfcuygmuylz6uqn2g7wztg4tyrjbm24hqcpffjnpkwany@ib2nvjibq2wl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Inochi!

On Fri, 2025-05-09 at 06:21 +0800, Inochi Amaoto wrote:
> On Wed, May 07, 2025 at 09:56:20PM +0200, Alexander Sverdlin wrote:
> > From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> >=20
> > Implement the RTC driver for CV1800, which able to provide time alarm.
> >=20
> > Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

...

> > +static int cv1800_rtc_probe(struct platform_device *pdev)
> > +{
> > +	struct cv1800_rtc_priv *rtc;
> > +	int ret;
> > +
> > +	rtc =3D devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> > +	if (!rtc)
> > +		return -ENOMEM;
> > +
> > +	rtc->rtc_map =3D device_node_to_regmap(pdev->dev.parent->of_node);
> > +	if (IS_ERR(rtc->rtc_map))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->rtc_map),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "cannot get parent regmap\n");
> > +
> > +	rtc->irq =3D platform_get_irq(pdev, 0);
> > +	if (rtc->irq < 0)
> > +		return rtc->irq;
> > +
> > +	rtc->clk =3D devm_clk_get_enabled(pdev->dev.parent, "rtc");
> > +	if (IS_ERR(rtc->clk))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "rtc clk not found\n");
> > +
> > +	platform_set_drvdata(pdev, rtc);
> > +
> > +	device_init_wakeup(&pdev->dev, 1);
> > +
> > +	rtc->rtc_dev =3D devm_rtc_allocate_device(&pdev->dev);
> > +	if (IS_ERR(rtc->rtc_dev))
> > +		return PTR_ERR(rtc->rtc_dev);
> > +
> > +	rtc->rtc_dev->ops =3D &cv1800_rtc_ops;
> > +	rtc->rtc_dev->range_max =3D U32_MAX;
> > +
> > +	ret =3D devm_request_irq(&pdev->dev, rtc->irq, cv1800_rtc_irq_handler=
,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQF_TRIGGER_HIGH, "rtc alarm"=
, rtc);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "cannot register interrupt handler\n");
> > +
> > +	return devm_rtc_register_device(rtc->rtc_dev);
> > +}
> > +
>=20
> I wonder whether the rtc driver may need reset (maybe optional) for this?
> If so, please add it.

I'm not sure which reset you are referring to... RTC module can carry out
system-wide resets, but cannot be reset itself (as I understand).

Initially I was thinking about providing a reboot driver for Linux utilizin=
g
the RTC module but it turns out PSCI interface is not optional on ARM64, wh=
ich
means PSCI reset interface has to be provided by the firmware (I'm thinking
about U-Boot) and Linux will rely on PSCI reboot.

--=20
Alexander Sverdlin.
