Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71663D2FB
	for <sophgo@lists.linux.dev>; Sun, 15 Jun 2025 01:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749952482; cv=none; b=H5MRvr10tsYM+pCy/0I5bUXs1hYdre4LmboOIk9p25aqFaTRjfeUYyLpfCs5US11P/BLKceDDSwhgPAHTtF9eSgCyI92gEhLFNlIVn9JDXHgLDpCip9yNfV+M8E9Lzn4kiS5da3TJEDN8/WSb8AHLKDGhBXu9vXnLsNMrHZ5ZBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749952482; c=relaxed/simple;
	bh=6C2RDlJPH4hHsu7KG3FoXJp08o/U2CrlZ7oO+N9gI/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrrdhYYRSl1c4TBIUpzjt5ST2oeZvFUdadvN59uP5Uz3WJ/TjSyBF5id0QucbfuzcdtjShjmWKMpKWnNBaZq+WUg9/JMDSLgUa2/gWP9uhPsY2P4dX5y/sKf/5Nz3qKJm3Ck3MjL+3lKWTY4wH2v2I9QcDAYuZNJm9qDvrSRdCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaGMrkBy; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaGMrkBy"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-73c17c770a7so4000712b3a.2
        for <sophgo@lists.linux.dev>; Sat, 14 Jun 2025 18:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749952481; x=1750557281; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m6qcLpg2zNBg5kLLZmOuaMXSNL8jEGcJ0sEklYczzuM=;
        b=gaGMrkBy7jPFiw4pSHF0cqs9mNGdWuqFyIOkMw5jFFZ0xTFsLpbUFUWMNEXA3Okv8m
         RdR3F+q/4ABS8iaM3TrRkPdsyYIRWzkrtA+UY67MXPHRIptXVEezEv6qSuLqn9dIqN0w
         hVKxwE6H6wSF6rP6H5P53FoXzStMsNceymO8IZOvu6mOjLsWmPw/PgYvj2WSYIWVacj1
         4m+rVFBV+WHcjShYf0zvNq5b046HBvtlD2kMLpxLjfUGWxr7e1eBAbB5N/7kDqbzdjd9
         NDMWA9S07ALiucwGS6lVLwL4TgxoYZOXUhyQhXXVZiq9goOtXQJcvpfUPXwNPYqrHcvp
         sSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749952481; x=1750557281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6qcLpg2zNBg5kLLZmOuaMXSNL8jEGcJ0sEklYczzuM=;
        b=VKeDpWNaY8nESYBhxgzuf9EYTYXYK3ZwDFXWk4oJ46q6ZL+fdLAAOtuV4cT7qnWV0p
         /80/H2j5g4nUG9uZR4Cxxju42k3ztHkQhvFi1eJa8H5PBQuplXbCX3JP97Pwafq25KsK
         7pp38bzpfgGrSlohcVNae9ZTGFRfk2P6/emib8GxgmvlAgAEhsqpyup04Y0oSlO74N87
         6dvRddBhByGQTUh5aV88S/BIF9a3r3gP8FTzOcHGQ/2pF8dQcx3oJxH7jGTWyoXm4COI
         5qgQVqQ5Q54uEfxbN6xe4JSM/8dTdIGqdUv3PQ3GEdxgLrKbIKt2VV/wkEHnAubWHTjs
         TVYw==
X-Forwarded-Encrypted: i=1; AJvYcCWeTsIHgBVBeyGTOW4LPFf/iee79tMn/9t6qb/bShmnsLdzSOc4B62UzK56FPbNAYEJqQ5Um+8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJgbiWZZCoed0z0Olh4wU4+31Zol1rTitZD9geDcTjgL38yFHp
	DHudCP8ot6macVCLmHaSppeL9L2EeS/sP+9ZuihS9bwhXsR1nR6fcWbd
X-Gm-Gg: ASbGncs1dE51oLAmbNIlV9UcDTqCGyf56XKQkZ8y3TFq/f4w5Q6YGyKM5vDvsIMnPAc
	xt9Ikmc8RTZk0v6bM4AaJIfvphid+3NZLLD6Nv1Cnz+10D+h8xbwhTKbChNwCgfrs3F1+vMHdOR
	82QuJu3zN0gYA3MZ/NvHUO9IXpi0quB6cojW6cHwQ7BERSwlC2+48vbh7l0jPCaMmTVI3m20EjM
	J+IFdf9SEodc/MHIybI5B2E5yvXThNcunezR+mntIZaQ7992L1zpkJnFoAcZlhKjTWB62zB08H0
	v+VHNyCfSKUM5mApkTybVh+FlhoeOQilGl+rES3t+R390awIJO0yJggzi/9DBA==
X-Google-Smtp-Source: AGHT+IEfbkfcZRq4LtMkAB1ieDknj+ZtHn8ASi39Vjkgb0xAmI76H9GASGCBjwsfab0bMI2SVyGiQw==
X-Received: by 2002:a05:6a21:328c:b0:1fa:9819:c0a5 with SMTP id adf61e73a8af0-21fbd55aeefmr6746644637.11.1749952480676;
        Sat, 14 Jun 2025 18:54:40 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe15bb83asm3467761a12.0.2025.06.14.18.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 18:54:40 -0700 (PDT)
Date: Sun, 15 Jun 2025 09:53:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Ze Huang <huangze@whut.edu.cn>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next RFC 0/3] riscv: dts: sophgo: Add ethernet
 support for cv18xx
Message-ID: <risysfu5twua4won3jajotsg36ua6gpevoqnsawny3m2n5bj3g@srls6h24kmw5>
References: <20250611080709.1182183-1-inochiama@gmail.com>
 <7a4ceb2e0b75848c9400dc5a56007e6c46306cdc.camel@gmail.com>
 <e84c95fa52ead5d6099950400aac9fd38ee1574e.camel@gmail.com>
 <05194937-8db3-4d90-9d03-9836c734fce1@lunn.ch>
 <55df35f66eeb8580b21337e4b2738801117c125a.camel@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55df35f66eeb8580b21337e4b2738801117c125a.camel@gmail.com>

On Sun, Jun 15, 2025 at 12:34:24AM +0200, Alexander Sverdlin wrote:
> Sorry for confusion Andrew,
> 
> On Sun, 2025-06-15 at 00:20 +0200, Andrew Lunn wrote:
> > > Also ethtool seems to be incompatible with mdio muxes :(
> > 
> > Please could you expand on that, because i don't know of a problem
> > with mdio muxes and ethtool.
> 
> everything seems to be fine with ethtool and mdio mux!
> (I accidentally mixed up host and target consoles)
> 
> # ethtool eth0
> Settings for eth0:
>         Supported ports: [ TP MII ]
>         Supported link modes:   10baseT/Half 10baseT/Full 
>                                 100baseT/Half 100baseT/Full 
>         Supported pause frame use: Symmetric Receive-only
>         Supports auto-negotiation: Yes
>         Supported FEC modes: Not reported
>         Advertised link modes:  10baseT/Half 10baseT/Full 
>                                 100baseT/Half 100baseT/Full 
>         Advertised pause frame use: Symmetric Receive-only
>         Advertised auto-negotiation: Yes
>         Advertised FEC modes: Not reported
>         Link partner advertised link modes:  10baseT/Half 10baseT/Full 
>                                              100baseT/Half 100baseT/Full 
>         Link partner advertised pause frame use: Symmetric Receive-only
>         Link partner advertised auto-negotiation: Yes
>         Link partner advertised FEC modes: Not reported
>         Speed: 100Mb/s
>         Duplex: Full
>         Port: MII
>         PHYAD: 0
>         Transceiver: external
>         Auto-negotiation: on
>         Supports Wake-on: d
>         Wake-on: d
>         Current message level: 0x0000003f (63)
>                                drv probe link timer ifdown ifup
>         Link detected: yes
> 
> But we do have some troubles with the internal PHY with Inochi's patches
> on SG2000, the above "Link detected: yes" is actually without cable
> inserted.
> 

Interesting, I have tested this on my Huashan Pi. The link detected
switch to "no" after I pull out the cable. I wonder the test step
on your board.

Regards,
Inochi
