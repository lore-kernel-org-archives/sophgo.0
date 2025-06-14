Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0EF25634
	for <sophgo@lists.linux.dev>; Sat, 14 Jun 2025 22:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749940456; cv=none; b=fKJ86c47cV7/nALcaNac1i1HaDCHHc0PmFWU76RoaCfmKn/QWeq21KdeTuBt1dn4wBKgzZTRgXTiv5IMcT2cIe19Ack7nhh3uKF/h4TLpkC857QjawezPdRHa9cNgI0qMIUhGDiHKwRq63KXfTi00MD94okaUfcUGHrBZBiLq30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749940456; c=relaxed/simple;
	bh=Ik3lpHePvjWRJWYumMp523LMBYYbHBwcF6Zgt2MNpb4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FS3Sz+r8E84kRjgCl+q+e4k5Ton4Ltp11BZna1eKgBYugVtMyN02Onr6qtVvW4E73luAMF/3pJM1V7WW6rDCg/63ANrFVhS3cTMH/RdN81kOajYUdiNo03Xribj79p/NWpPbskRZw6/M9EQ4B3D1Uj+dbtno5sbcYTnuOGr4aQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q431z+mt; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q431z+mt"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d7b50815so26400055e9.2
        for <sophgo@lists.linux.dev>; Sat, 14 Jun 2025 15:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749940453; x=1750545253; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eElX0K0mVGFpZdZanLnRJGH007mVfDUZMyXart8hp4s=;
        b=Q431z+mtXd9Q1d9eZclIfzpkFsnSxdl8Wd6ZKggjXr+RUsyoHrvKCiE+bZDvKgA3LY
         YRwOoTKONzeBrgKi3g+i8f6Fzk2OxVVFlEXoEbTJLFJ2tajE1h4MiRpg+GnQne/d503S
         qJvKlzBh+0dZDOh45o9vx8UL9SvQlhaaQer3IjT0EJnAEsgNHvs3HsjnHfPC4lZw+Fh9
         LxQn5Y68KQ/26JVxAK2jJkIief+rUZ7cDUY/p7RIIWe5plaP8+65Kh+zENlbxrEgXgGg
         +SXe16jo4yne/P2Bbk5A8EGCzW4xa/1eUrox0EJaaoudWOxnqaZbPqhCA6CM9fj6c5Pi
         13jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749940453; x=1750545253;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eElX0K0mVGFpZdZanLnRJGH007mVfDUZMyXart8hp4s=;
        b=M0BP2XZtFTOlOldjHKSjdchYBs8eeq33x3DlIoyX7RLMwJ4FiJcYHxcjp3xYbYqz/+
         BU57aaVBKyE7ARGvJ3jyKicCrLDB6QQhsJX/GbgSDzeE7JrPpGnA0DZg+ErFcJ/4JWJ7
         y84uo4Y8pN4TSIEw+2SJ4Lvq2owPB+ZUBNzdnFXLbKJSrQVk1TKz25UeJ01yMRw57agu
         eWG+hdcjiSVP2U/jZQdz2sRxH/h5bALj8YJX+uWgddmwUimqnsyD99xiKml38K32vSyG
         BsiMho1Pts6Xwx3u1TiqGYcztEKalwPVl1W5BW6MB9jJlicZH9IgzmcPmalAEXenPij7
         cwbg==
X-Forwarded-Encrypted: i=1; AJvYcCXpb89b33bL0WAoPZ8US7UB1v3z6w4RBHN8o5FaqzULe0rmt9jTXTDfkrwIh4jEz4Ue40phMKw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmpgRXGqDGodeiy8yE/rQdy+8P5UtICfFKIuXuapnpjW0hWTfW
	+AF4k2n0hRI6UHrAiVUkz3pBY7CibWWMyiur8vGLLxn082bO4P4hlR4g
X-Gm-Gg: ASbGncvTKs3ofOiX2f0+tHu15+SuNwNcjvqicLnnomse/duEe6YeBqc0+SmEAs/LiEI
	aQ1wzUnSA4SEQ1UwlQRsqjgCTtsA2+g3pTqizxKzhc51A90V4zqzvxrXQp2psqAkagOp6UnTeh4
	udfO34e436VDMmtjIzUpY5uINTqpCO5aYB4gDunHKcrYcP8uJ+cwkZjZTh8bH1jiQLyiDFj/2xa
	a6ZyZzvqPz+9dHVzknyJjw8syeXQII8eCbVoml/OLcnYgrIzFQe81rOxFKgLpeSbIvNDJwVbkkE
	kT7rcLBxzKncymqhDQSa2Z0e5vQEt0ZGgP51U+lHGjyhGHZblIRfOb+RMSPbEc4kj+knqg9Yyp/
	iyhYoXQ==
X-Google-Smtp-Source: AGHT+IHUSSE4wReaeDL8ecMX9RxikoVG4MsNqeGENvR2wr/CiqJiGVOf4JzoiiQACFFziT0S6EILMw==
X-Received: by 2002:a05:6000:4308:b0:3a5:2cb5:642f with SMTP id ffacd0b85a97d-3a572e7a032mr4130209f8f.34.1749940452671;
        Sat, 14 Jun 2025 15:34:12 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532ddd29ffsm92955675e9.0.2025.06.14.15.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 15:34:12 -0700 (PDT)
Message-ID: <55df35f66eeb8580b21337e4b2738801117c125a.camel@gmail.com>
Subject: Re: [PATCH net-next RFC 0/3] riscv: dts: sophgo: Add ethernet
 support for cv18xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen
 Wang	 <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,  Richard Cochran
 <richardcochran@gmail.com>, Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille	
 <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Longbin Li	
 <looong.bin@gmail.com>
Date: Sun, 15 Jun 2025 00:34:24 +0200
In-Reply-To: <05194937-8db3-4d90-9d03-9836c734fce1@lunn.ch>
References: <20250611080709.1182183-1-inochiama@gmail.com>
	 <7a4ceb2e0b75848c9400dc5a56007e6c46306cdc.camel@gmail.com>
	 <e84c95fa52ead5d6099950400aac9fd38ee1574e.camel@gmail.com>
	 <05194937-8db3-4d90-9d03-9836c734fce1@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Sorry for confusion Andrew,

On Sun, 2025-06-15 at 00:20 +0200, Andrew Lunn wrote:
> > Also ethtool seems to be incompatible with mdio muxes :(
>=20
> Please could you expand on that, because i don't know of a problem
> with mdio muxes and ethtool.

everything seems to be fine with ethtool and mdio mux!
(I accidentally mixed up host and target consoles)

# ethtool eth0
Settings for eth0:
        Supported ports: [ TP MII ]
        Supported link modes:   10baseT/Half 10baseT/Full=20
                                100baseT/Half 100baseT/Full=20
        Supported pause frame use: Symmetric Receive-only
        Supports auto-negotiation: Yes
        Supported FEC modes: Not reported
        Advertised link modes:  10baseT/Half 10baseT/Full=20
                                100baseT/Half 100baseT/Full=20
        Advertised pause frame use: Symmetric Receive-only
        Advertised auto-negotiation: Yes
        Advertised FEC modes: Not reported
        Link partner advertised link modes:  10baseT/Half 10baseT/Full=20
                                             100baseT/Half 100baseT/Full=
=20
        Link partner advertised pause frame use: Symmetric Receive-only
        Link partner advertised auto-negotiation: Yes
        Link partner advertised FEC modes: Not reported
        Speed: 100Mb/s
        Duplex: Full
        Port: MII
        PHYAD: 0
        Transceiver: external
        Auto-negotiation: on
        Supports Wake-on: d
        Wake-on: d
        Current message level: 0x0000003f (63)
                               drv probe link timer ifdown ifup
        Link detected: yes

But we do have some troubles with the internal PHY with Inochi's patches
on SG2000, the above "Link detected: yes" is actually without cable
inserted.

--=20
Alexander Sverdlin.
