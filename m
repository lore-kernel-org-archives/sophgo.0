Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9243A78F4E
	for <sophgo@lists.linux.dev>; Fri, 14 Mar 2025 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741944684; cv=none; b=QzS2coHB8x3AHgrRSeogRiDgZQL4+YlcCH+2pi/h1rA7SlTlDY84fW0agGN0Zle2obSkabna1HskoZsOYVo9mS9IN2WqdzBpHZn9CI+qXUqR7y42aKu4vCKtHg6APjE6bGJ9bzFgp7EVqojE3jrAw2coEYBKvuvajLAtJLqVpHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741944684; c=relaxed/simple;
	bh=EFG/RUQsEPWHQayDu6FgBejS5LjvkZoTkpo4V8Q+rn4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aewe+GiFk8jtq6Fe4msEbpNOq/GXt1K9I9qI2P6zh7wMZWYdDuKCMd1mQn6pjjjTeOijorh+2aocmOcML/mGLHCzWjynpY/RhWB/gtvSsbyOAg1+lEr7C217zhFzN3vq24aMMNVWX13rymFPqKZErUk62uCH2ocW4hXsK8WpsvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYeWgRic; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYeWgRic"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso12373235e9.3
        for <sophgo@lists.linux.dev>; Fri, 14 Mar 2025 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741944681; x=1742549481; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DgZq1Cihy2mEZuEesHcsZ2TIpT7DRI6TgV6LGAhY23M=;
        b=fYeWgRic+EASMrrcQuJ4mNjTxlfmX5bt9UapC2Xf5ULwo6ZgwLon7QJDHzjWXEvOOW
         kffRjiB14MSyCgJf1dFJ7cPEGu/m4zZvQg8Lg1nS6zBWMXx7BOYFlZvJWjjqjVHzn71I
         DjaFGOv2NU2iq/ilr2w0JwpFBuzHzPQnffN7rPP4TTbLpc0H2ZpNn1Q9f4Uq6dfkuGEY
         jO/wbB3UG9vqBCfZAocuCNBMwWa0j6y2OPuRi9N6u6884j+NPHqaGKpLXOGMqOIrSl7N
         +B1+HHgC19cVPRanrlBM+5+xF6pssdlXIhkkzWukYh4Nbvs3T96okUyLA8lRfxHj9KgW
         csNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741944681; x=1742549481;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DgZq1Cihy2mEZuEesHcsZ2TIpT7DRI6TgV6LGAhY23M=;
        b=sLU6faRgjmOFOIf9+a5JsR5LCSX38UqP+nJqGJwoHpfJ4MnaPj3YULeIisF0vBOf6+
         IX4EMyttb14E06jeuSjoBbNa1vrPR37MHaNnHoQtTOk50BPcdZUiHFQNJtnpW4Kmpynl
         pHmpCi+f+SInZm9n2umrEjUWP9HAJ8r6Z91w9k4y9U8nUyn8pxoVZNzc+DySKjaL5cGg
         0rU+DDOspYR3eD8tS0083X/EtT14EAj1D9Ay4T6qslpL363S9+utQRdxA/LYFExXVY1b
         wckQGFyIsL3qtgIC5YbbJ6fxsYc8AQsh+f+Q9pdV1ig73lnwxhkX9/vlrvcI2fnhCei6
         HPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG13cvYEmSzoqpOBHkLqWOimZ3yF0WpAB6+acCwdShQA8QNXigMsFXRIk/6D4f1Bnn8LDJR7c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRdRWgxDX/jdWdAAHyGN3LNCl6v2TpqDHMmDTwxxCvulq8veRr
	i4wfLw/pq15dG9+moXLwsnRg91Du/8jo1+E1obuNOp8RLOsE+iqk
X-Gm-Gg: ASbGncvp4uVtlMirXzpu7i1qa2q1ngCgMcQc6PHl9dSFf8J4THsDBOArefvFV7qkMKw
	OMMU0/jQKQpKS8cld31ehvPCA2bkB8EChTtsHcpUndgGAgC+PLbXMTAgWXtrnNANIdAq+PFEymz
	zcLprFdN+39VivJVOotS3nAtL7d3HxTuNNOkuEBieYWu0wm8+ApxyDq9UgSTP15LGJtiXve/V7K
	S5Jg5rS8MQ9QbOVfjjmz+3M9XU0mSO0ouUS40nt/zrg/bZDvcFyASV/CZHT26Ft77KTs6Wq93RK
	+rADn9U8Z6OE0x85AWEYFp0RAEeKZkej7+c3ALLfL73kQezCSaQZHHwUT4oYug==
X-Google-Smtp-Source: AGHT+IG0nQfUihbWpCEv6X5UBbk7/FaQ6P3azQnp23XNoCBldqucN5qWH0TKNQJOpSr3KZzsS8ZAgQ==
X-Received: by 2002:a05:600c:1c17:b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-43d1ecd2d21mr20134765e9.27.1741944680525;
        Fri, 14 Mar 2025 02:31:20 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffbcef5sm11197635e9.9.2025.03.14.02.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:31:20 -0700 (PDT)
Message-ID: <2d1995d39ac050eeb7cec4183ebdb307e520a7c7.camel@gmail.com>
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Date: Fri, 14 Mar 2025 10:31:09 +0100
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

...

> > +++ b/drivers/soc/sophgo/cv1800-rtcsys.c
> > @@ -0,0 +1,63 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Driver for Sophgo CV1800 series SoC RTC subsystem
> > + *
> > + * The RTC module comprises a 32kHz oscillator, Power-on-Reset (PoR) s=
ub-module,
> > + * HW state machine to control chip power-on, power-off and reset. Fur=
thermore,
> > + * the 8051 subsystem is located within RTCSYS including associated SR=
AM block.
> > + *
> > + * Copyright (C) 2025 Alexander Sverdlin <alexander.sverdlin@gmail.com=
>
> > + *
> > + */
> > +
> > +#include <linux/mfd/core.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/property.h>
> > +
> > +static struct resource cv1800_rtcsys_irq_resources[] =3D {
> > +	DEFINE_RES_IRQ_NAMED(0, "alarm"),
> > +};
> > +
> > +static const struct mfd_cell cv1800_rtcsys_subdev[] =3D {
> > +	{
>=20
> > +		.name =3D "cv1800-rtc",
>=20
> Make this a specifc one, like "sophgo,cv1800b-rtc"

Could it be that you mixed up device instance name and "compatible"?

Please refer to all other MFD cells with `grep -C3 -R -F "struct mfd_cell"`
either in drivers/soc or in drivers/mfd, there are no vendor prefixes in th=
e
names.

--=20
Alexander Sverdlin.

