Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AF318B494
	for <sophgo@lists.linux.dev>; Sat, 15 Mar 2025 11:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742039004; cv=none; b=BRlNHJkYhazRy85csliXCmdpADiau15VKkl1FMNBC0nqjl7h271asHOagzpHI6tBCeMXGO7GjqhTldb7VaqZl6oOuSymKCNDXxrYWyWZ3+brzQ3drWzVO5KHnMf1savDr3lIFZCqL+QAQwS+L/efX6jpFWEzctrUDliKoitvjf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742039004; c=relaxed/simple;
	bh=u+8nz41tlYU+O8V2Nth96DP8B0RudPJweXoeqM7XfQg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tzQ8G7mLHcrqKZYhdOU4jlX8dmnNKG7YkF92e0utuEyM5HtvPB/O2PmgVdfvV9gLQFdMAFbgnM/CaKiAuxyzgNKP2VO+Yozsf1183K3eRgLslExP+flSg0z4jr1WFGBOfj7QabAV5ECMcfAdfYDPCD4279X3kTeiMzysM6vEKUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1MCPa6L; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1MCPa6L"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso604700266b.1
        for <sophgo@lists.linux.dev>; Sat, 15 Mar 2025 04:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742039001; x=1742643801; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KeZdUQ87/QjVva6B+nN47G0ElGSAcZt31jSmqIfddsY=;
        b=N1MCPa6LlN8QUL4rHesmYob3AoQ8edQWvu7SzBwGSmyShcYFWD1ZKHlw8mUFz18WV7
         R+kVQQPtaA6vOOThmWg31IexpwUjBEXv6nI49hrx3y2Xx8DyUrrRf2He3gKlJKF1qn+9
         lugXNYt9i1l5QcwlAAF0xoEDvoZN9/UpMexjFH/e1BwydP5IfeqoXZV3oWsORUNCFSeg
         z/fwO7JkvF7SiVLiwSUsiD2IUcG6MuymyuCxvqq8ktFoNB8LTmClMsmqHqZQ6DVt6+zN
         1SYIxkylNC7hN2Te+9OTDkjy2KeqYpkYqKhXsPCO2/xKJ8Lir926esPThcYKMupj9tWc
         2Zdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742039001; x=1742643801;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KeZdUQ87/QjVva6B+nN47G0ElGSAcZt31jSmqIfddsY=;
        b=BDpITBanhWXaIzTQ1XD+1Q7Aj803cMjrnO5mk728aLrkeEeR0GpCqunwMWNjzF8RiM
         r2NdzDJkx1Cy7ujgVqmEoOkvhDBCu32tNRwK7SEzJPXjrcIx7yzztmX3AjowF9pvbS6O
         4gQ/7XlG7CmHNENUNfBwS8kE/CePYYB57SJeECjRPdKRUkj6xqixPQGpLTPWJxfP7rGc
         VFVdTB/Rd+2ONAtJiuqrpR9F+AFEmEcHa0HsctEiJSx01V1GID2l1Oq0LObkwwI2+7I/
         EAWpXMftCL0B3+azishHirq4F6v/Ve8Y9PWLy4J+cVk62rfEgCiSox/ue+JZe/h/VtqH
         bSsg==
X-Forwarded-Encrypted: i=1; AJvYcCXIOz/YVSY/yr75yX1asGNPMJ1DvZ+VwPf7yGTCkeJ7kNnUEYiCzzGp7R5EygP5wCClLkZbRVg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOxe0VacnLwMkzKn4mPBmSBEYDP7kanSyCt7qJyj3jw7yrzGeX
	hXmM+bOHI+fV168Khz9HwfcUpWxhGteYchQGFn1Sw2JCAOQnIwjJ
X-Gm-Gg: ASbGncvzVWXc44ZxQOemnFrzoxoGp8AExvowndwx7SPJpSGDc3KRPwwTYSO9crOsOLQ
	afcntLbQ75bTw7ZxSBO6GkelAb9S1gfSaw5iSZrjMnGLnaGd2eBOZMLaOSaye33FR19llywuUBz
	+LUW4fQftZaaL/R5t/Hy6PmGfOjHNprWc3LBsWDczBryT6cmXa1vdbdQj1AZbrBFr1wAxWGgbLQ
	T6+DKDY0rpHSi59yZcXODpdSAHxy51SSFa4DcxUK1OcrJUG4J8+DtO8lgH1MsrwKfGjKILoyTLX
	Vvc7TchwlX5M68/m4jBKa7RMOTqsTSEYkOCzN+Izyj57lTBKW3KM+34+c0eGgg==
X-Google-Smtp-Source: AGHT+IFaeyv1G/kQsgkk3HcuD0eS+l5qBHWMhAKtgepFyHyO7M9qoxSUruk53n7H1dNPe4H7TK3gQg==
X-Received: by 2002:a17:907:2cc5:b0:abe:fd0c:68a8 with SMTP id a640c23a62f3a-ac3303e6721mr580478866b.52.1742039000613;
        Sat, 15 Mar 2025 04:43:20 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149ce26fsm358549366b.89.2025.03.15.04.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 04:43:20 -0700 (PDT)
Message-ID: <a824d6b57ce5a9180a45c3ff65b4b9051ecdc1cf.camel@gmail.com>
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: Chen Wang <unicorn_wang@outlook.com>, Jingbao Qiu
	 <qiujingbao.dlmu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
	linux-kernel@vger.kernel.org
Date: Sat, 15 Mar 2025 12:43:19 +0100
In-Reply-To: <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
	 <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
	 <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Inochi!

On Fri, 2025-03-14 at 08:51 +0800, Inochi Amaoto wrote:
> On Sun, Mar 09, 2025 at 09:26:24PM +0100, Alexander Sverdlin wrote:
> > Add driver for Sophgo CV1800 series SoC RTC subsystem. The RTC module
> > comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state
> > machine to control chip power-on, power-off and reset. Furthermore, the
> > 8051 subsystem is located within RTCSYS including associated SRAM block=
.
> >=20
> > This patch only populates RTC sub-device.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

...

> >=20
> > =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0 drivers/soc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0 drivers/soc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0 drivers/soc/sophgo/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 24 ++++++++++++
> > =C2=A0 drivers/soc/sophgo/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 3 ++
> > =C2=A0 drivers/soc/sophgo/cv1800-rtcsys.c | 63 ++++++++++++++++++++++++=
++++++
> > =C2=A0 6 files changed, 93 insertions(+)
> > =C2=A0 create mode 100644 drivers/soc/sophgo/Kconfig
> > =C2=A0 create mode 100644 drivers/soc/sophgo/Makefile
> > =C2=A0 create mode 100644 drivers/soc/sophgo/cv1800-rtcsys.c
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3eee238c2ea2..ac15e448fffb 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -22354,6 +22354,7 @@ L:	sophgo@lists.linux.dev
> > =C2=A0 W:	https://github.com/sophgo/linux/wiki
> > =C2=A0 T:	git https://github.com/sophgo/linux.git
> > =C2=A0 S:	Maintained
>=20
> > +F:	drivers/soc/sophgo/cv1800-rtcsys.c
>=20
> Please change to the drivers/soc/sophgo/.
> We should maintain all files under this.
>=20
> > =C2=A0 N:	sophgo

I suppose my F: entry is actually superfluous because of the above
N: entry and can be removed altogether?

--=20
Alexander Sverdlin.

