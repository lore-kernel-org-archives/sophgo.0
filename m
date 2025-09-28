Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C382DC321
	for <sophgo@lists.linux.dev>; Sun, 28 Sep 2025 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759054829; cv=none; b=OFuOu+oc2taR4DfyTjwXeptWovCoRZIwk8T/UG4xCUIHUScea+2Eijqv7j1QHYlSCHJFbjjeUT0r1rpurX16iZm3Uz0YD2h4i7mWGvfbw70OmFWNjwnT2v6+j4UIaZ8aElgW5ITyhXJPx6nP7Pdvk2igyL1vHxG1TfFHJ0+NKys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759054829; c=relaxed/simple;
	bh=rHLeEviwPBO05xdeBXcA3VXh/8cqxkY984JQ3xEhV4g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZfqpvIeY1Kn5udqKnP7qA+al5zxMf4uusBpJ+Ysf587kNmNKYqOuNMPXL3H+ZRw2fUI9iK0etrJpVQYs5CPU+5FPEGBvqusT2rOb6+QGkWkOzTifcMqDU3crMlUIYV8RP5oNyldxAcPVIdFTIxBzrCVHG5xoP4FTXb/Tfez6TGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2mWGHU0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2mWGHU0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e34bd8eb2so38150255e9.3
        for <sophgo@lists.linux.dev>; Sun, 28 Sep 2025 03:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759054826; x=1759659626; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KvuyCjLzmlgh2D1gDc5Mt9Jji2tzu36eUVP7kFdrg7U=;
        b=D2mWGHU0Ol4RqbJPGC+W9Gn/EyXproveUcER7cxlt2R7JL/9OdsfU6yRO6tGxuAFtU
         f62WYBjmQdPApNWWNXgtL4J4iOqriwOAofwo7YNluV93jvXNCnl8rPlmzva7ecsl9QM5
         enqPWuI5wdVf9NY7Y0lPk9fyOi1zS2A1ZUSIlpx/6WzhPiF8P6DdZ7TLeRPmiSvFAzgl
         B/LkUNavSUTdlSBLMAOodJ2sN9zUp2kuVKXWGO5e+lFsWNF/wFWy3WAq2LFGqlPP81bs
         7+hYXZwCMWkiD8W9DaSkZlbWJR3Pf/SU1sHVWCIYGSmJi62/3tjpSYjA5VhyYf7kiBSm
         8BFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759054826; x=1759659626;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KvuyCjLzmlgh2D1gDc5Mt9Jji2tzu36eUVP7kFdrg7U=;
        b=kWGYrwDd+MECMdGLyRErc4SzY8fILUwmNzR5D7mcYNSg6S2HoQeWK96fEsZ3oAEhoA
         4+G1iodaIAfty0PFJN61IL2hk/q8kx77XJywzH4xgZ0wvOYMbc/aIpgVXCTh8webgQ3W
         JZnox0Lv0sDWMVhREArmmrzn/NtTfZUMcfkv1xdnB+TjcWWoSd/hfH/18f1vAutXF6wP
         TBFWHfunkSV1K7jhg+B3D0+Ao5kqPVJ+nWFsrpM7fsOShxAAEbCLl4wLw7GCvT5ypj6l
         037ZKI3ffVVIRoJrXBEZxLXfK4ojarej3tCndNv+8lFN8wHCWUglN0j13FGw0Wx3OfTw
         ITBg==
X-Forwarded-Encrypted: i=1; AJvYcCVsrOMF9WFKAn3NsRkg7zV80dqGXPHLZWG0xFCw1v26mq6aqVWNaP8uYnTKD7eYtJFvEvaOwg4=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywin9wERsjECf1CzSsSCVWdeJIFFp6khDU4HfCstORCUhd0rbzp
	AGv1C42Su2NEE+kQxB2XACNMvbGHjBvIMsANp7bGMHf7Vl/FBrFt10ua
X-Gm-Gg: ASbGncvsQW3D2Vd4PS6FhTbeBhzXUM9foREMafq7WfRaPETHmt3LQ2mlIIuzscuqWYd
	i7frVzwX7VlUjINf/Ma6cjqbwK3m3XOFqNnlNCdAmGl95uIgDzfmc+ds/Iy8LZhViBbyxqTadYs
	VnADLt/LgOURK94LncvD0gIxR96D2j/r4AbRi7g2fMQfNKx3d8NCUa37BrNwo57sUdz+UDVh3Tz
	geuUiKGK5tJ1Jhil4ee2hWYw2kObZmqGQ3axCH06seZXbtZY3fYDwU58IpJRarDUYUAl8Qzj4xv
	olpVlkrpmpNvmtzDGKsWzcL1hZzgHbcOc53Brthh3WDFmlpu9m6Q1/zWCcP59tH7aOBTBS6iwTN
	wmhZ4Xaq/oxT3/PpXTjAwVlpaGAwzYahVgbFcAJ6SqAWgn8pQODh/xg==
X-Google-Smtp-Source: AGHT+IEYpRY/9mb9v/NUccWSRi67DJstPC7bgKLXlYWlKIlnknDwRQR0aikJXFbP1REZF8H0V2lqmA==
X-Received: by 2002:a05:6000:2885:b0:407:4928:ac82 with SMTP id ffacd0b85a97d-40e4accc857mr12504181f8f.53.1759054826169;
        Sun, 28 Sep 2025 03:20:26 -0700 (PDT)
Received: from giga-mm-1.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb74e46bcsm13989641f8f.8.2025.09.28.03.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 03:20:25 -0700 (PDT)
Message-ID: <9614f7f37f0e76d0dba91b26d83f234e6847818f.camel@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: E Shattow <e@freeshell.de>, Joshua Milas <josh.milas@gmail.com>, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 unicorn_wang@outlook.com, 	inochiama@gmail.com, rabenda.cn@gmail.com,
 thomas.bonnefille@bootlin.com, 	chao.wei@sophgo.com
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev
Date: Sun, 28 Sep 2025 12:20:23 +0200
In-Reply-To: <0f581625-24d8-4b91-8935-685a837ea217@freeshell.de>
References: <20250927173619.89768-1-josh.milas@gmail.com>
	 <20250927173619.89768-3-josh.milas@gmail.com>
	 <0f581625-24d8-4b91-8935-685a837ea217@freeshell.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi!

On Sat, 2025-09-27 at 21:09 -0700, E Shattow wrote:
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> > @@ -0,0 +1,88 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
> > +#include "sg2000.dtsi"
> > +
> > +/ {
> > +	model =3D "Milk-V DuoS";
> > +	compatible =3D "milkv,duo-s", "sophgo,sg2000";

[]

> > +&uart0 {
> > +	pinctrl-0 =3D <&uart0_cfg>;
> > +	pinctrl-names =3D "default";
> > +	status =3D "okay";
> > +	/delete-property/ resets;
> > +};
> Needs parting of resets out from where it is now instead of
> delete-property here. I don't know if that can be the same series.

I wonder why is it necessary to remove "resets" at all, if it's
exactly the SG2000 SoC. What is the exact problem with them?

--=20
Alexander Sverdlin.
