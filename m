Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6099B182D2
	for <sophgo@lists.linux.dev>; Thu, 12 Jun 2025 00:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749688466; cv=none; b=jKGppJRTrT8ohMMG5gaNAqxW8ib4EFj4+9itgm5TYFAOWwxAJBnSIcJ0NXtRsWwr3aNnwARHEDkwm2TkxcQeyExgj3Saoe/LRl2HdKG4jAJF68IiPI5us82mbO+2bxsQR3qTiZyi7aorRT53Dil3PhQjaXtCZzBIfkA2EJx3tjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749688466; c=relaxed/simple;
	bh=fyg0oH5gh4es/IuhtNEOsuu0+l7oIjlulkU49FIeU38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAxalJja3zqTVYc8ivpF2e+bkubmAGR45EXmrBypy9QrW3XdNceWFMJVxQwGiSqzHXF+vNLd6Ou1yvp6AJiOpFpvJRC5Ii3ot6DeDysBerfRiMcyap8qj4yA6Wu7PvkRH25eh+IvOZ/0zM8MiQQNSAqjS4mlfiUxuBn51Jf7XQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEksMbjG; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEksMbjG"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d09ab17244so42120385a.0
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 17:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688464; x=1750293264; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N4cnX0EhvoTvV363ROgxXVvXp5RchZqTY+BHR1peIlQ=;
        b=IEksMbjGwVJiutl/spxDdsmbI4SaLOFgXDJ4bNshHJ7VHbKsBvOOJN848ZPU9I7TZL
         Enlgln0XDACesLfgPSUH7hVI3Ab2VIPHoszqKPM4+uBPTxA/WANfxsUrUf5CNXbLsC07
         zrMPthH22T8at0psA20TqbDvxkrKL3ykw6vo4DPxQLwVHPwKKdVbzUAQwoRyiio45OlU
         D7mtk18OCb0bEK5ARCZ73fIsEEgjhHqMUCcwECWdESN5LxYigd5zFGunhzP987/T80aq
         /EHbh36y2d7D+O1dphsBT1tEov8GVyaPXuht9WfgkJ+uvqXoW0ettLmyVmY0vT3UbiVs
         IF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688464; x=1750293264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4cnX0EhvoTvV363ROgxXVvXp5RchZqTY+BHR1peIlQ=;
        b=Bj3WHhcY77GezYAeySrAzFNNZQtpQUjo2b0HJP/ndjifeIgnUJmtviMipOLUwNWW1L
         ddVmF2a99pa1Y932fx5MwMGe+vDOF8W+RFE8aTxq1tNLJpXhhj3u/BVlklX3iUTqwugW
         W5WsdoXmH1WzszezHJt5teQhprJoODbYad4cZA/rGwCpcjUh7x2AG9Iwi7LPivOq8XwB
         5MK20lwOOHa7k+69iYX5J1x1MNWM8+TYK5SJZY/epi4Pim7tNYOYyag9uEVQb7XzMuQO
         HSepVnAxepmyMlygwEMiGegHyQoXvZQMBUP+N0MEyk25F6V63YeDthOiPF0klz9G8oML
         JWzg==
X-Forwarded-Encrypted: i=1; AJvYcCX3CziW939plOGqdPjfIYMc2BZ/BTgMbcvQ+n+4Ah1uh/wZjNu+x6P6ONgaQQA2+r0+moOKsx8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz27mctlBBvHUGv0nQFxaM70vjit2OwDFEjIkWsSp1YZRC7AqYv
	DMPeSAlLz/Ik2B+mknA2Uk213p9jjGLB9gWxmer1JdCLkbnvNPb2JeY2
X-Gm-Gg: ASbGncsyrMWIlRZR7R8VnCMyblZZD+MNCmcIdktgJ3JhXM+WlzHPgRKBLNxLkw7t5GS
	y0YcwvQE2HOhfHaV3XL5s3MHcFwCQ1dXwo2bwAybDhuZKbeo9V0YnnNkYXo2UxJCwhN4grU3T2/
	5PkQLEEgHs5bzmzv1QJ8irS4ZD9Cb+SCoaGab8TNO2JadoLGRBnqIQqDvO+sP/HbWvhTYQRgWmg
	eijBXjdR/HuLpW0JXhNJKAcf26xvmkgrOJ8wfKZeiP3Zzg4EEkn6K4Jxz3PvpYw3N5mIQhmYf0O
	aKCHfy2wVSmVXSkmC3BfcgYKgG82hzxgfvtfMg==
X-Google-Smtp-Source: AGHT+IGS6qXzX1rhsw1lo3B14jV1zL+YdAy/l3s2f7PapW2jiFo2sgI8OTVrHVYxwYZAApjNnHhfeg==
X-Received: by 2002:a05:620a:24cd:b0:7d3:96ba:78d9 with SMTP id af79cd13be357-7d3b2a6bfb4mr231743485a.29.1749688464229;
        Wed, 11 Jun 2025 17:34:24 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d3b5282c06sm35379685a.95.2025.06.11.17.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:34:23 -0700 (PDT)
Date: Thu, 12 Jun 2025 08:33:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 2/2] net: mdio-mux: Add MDIO mux driver for
 Sophgo CV1800 SoCs
Message-ID: <m3rqdpoztgbdocm2yx5ajcnfk7p7b2sifp6fibj3htsmw53mbl@icnaj6xndnjf>
References: <20250611080228.1166090-1-inochiama@gmail.com>
 <20250611080228.1166090-3-inochiama@gmail.com>
 <eb419ffa-055f-48db-8c6a-60bf240fbb9d@lunn.ch>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb419ffa-055f-48db-8c6a-60bf240fbb9d@lunn.ch>

On Wed, Jun 11, 2025 at 06:13:00PM +0200, Andrew Lunn wrote:
> On Wed, Jun 11, 2025 at 04:02:00PM +0800, Inochi Amaoto wrote:
> > Add device driver for the mux driver for Sophgo CV18XX/SG200X
> > series SoCs.
> > 
> > @@ -0,0 +1,119 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Sophgo CV1800 MDIO multiplexer driver
> > + *
> > + * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/delay.h>
> > +#include <linux/clk.h>
> > +#include <linux/io.h>
> > +#include <linux/mdio-mux.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define EPHY_PAGE_SELECT		0x07c
> > +#define EPHY_CTRL			0x800
> > +#define EPHY_REG_SELECT			0x804
> > +
> > +#define EPHY_PAGE_SELECT_SRC		GENMASK(12, 8)
> > +
> > +#define EPHY_CTRL_ANALOG_SHUTDOWN	BIT(0)
> > +#define EPHY_CTRL_USE_EXTPHY		BIT(7)
> > +#define EPHY_CTRL_PHYMODE		BIT(8)
> > +#define EPHY_CTRL_PHYMODE_SMI_RMII	1
> > +#define EPHY_CTRL_EXTPHY_ID		GENMASK(15, 11)
> 
> There are a lot of defines here which are not used, but as far as i
> see, there is one 8bit register, where bit 7 controls the mux.
> 

You are true. Only bit 7 control the mux.

> It looks like you can throw this driver away and just use
> mdio-mux-mmioreg.c. This is from the binding documentation with a few
> tweaks:
> 
>    mdio-mux@3009000 {
>         compatible = "mdio-mux-mmioreg", "mdio-mux";
>         mdio-parent-bus = <&xmdio0>;
>         #address-cells = <1>;
>         #size-cells = <0>;
>         reg = <0x3009000 1>;
>         mux-mask = <128>;
> 
>         mdio@0 {
>             reg = <0>;
>             #address-cells = <1>;
>             #size-cells = <0>;
> 
>             phy_xgmii_slot1: ethernet-phy@4 {
>                 compatible = "ethernet-phy-ieee802.3-c45";
>                 reg = <4>;
>             };
>         };
> 
>         mdio@128 {
>             reg = <128>;
>             #address-cells = <1>;
>             #size-cells = <0>;
> 
>             ethernet-phy@4 {
>                 compatible = "ethernet-phy-ieee802.3-c45";
>                 reg = <4>;
>             };
>         };
>     };
> 

It is good for me to use this. I will have a try. Thanks.

Regards,
Inochi
