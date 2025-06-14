Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB3013AD1C
	for <sophgo@lists.linux.dev>; Sat, 14 Jun 2025 21:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749937943; cv=none; b=WtrqKsME2MjfFUNraQvn8/CWlQ3kmxica1QOt1Dlij2qTttc2rz/btPgW5YDhJ5zx7JdLzVu0YL6f5uPyPT1E7xbe4VDhMRoQAQ3oMlGfI47cVVQGAsEQyI7wOF+N+o7WhkVzK2eZgNfRgfsPq1sJIZe/+6FCIw+LOF850nJdi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749937943; c=relaxed/simple;
	bh=1zgSDBZr5Fkmb/y7roQGPX54QUJVPxcs9B/Z9Z2RXOA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bvNgF8jq/ITcZ8kYN0yymf9KUvPBV8eGbTytIOy6ZAYFXpPJj3F1RY8X/szzDCHbhYbC4+SsJYKWWpHgjvDtoe71HldPV6n7xImRLk6+E3oWGhsI0os9iZcUQJG29qyGEERT1li0iwFz56l++LhEv2ogq+2z0mrKCoguv8DnEEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U559GW/l; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U559GW/l"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45310223677so27138205e9.0
        for <sophgo@lists.linux.dev>; Sat, 14 Jun 2025 14:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749937940; x=1750542740; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bg1odM9KUcbjVWw6SM2h9C8Ehh1I33FXJkfY9DO2daw=;
        b=U559GW/lKHH4jJn0H5Wz2uJyMkDWEK7IuzCNXBtOiKOWRE9m62s/0OUk+k6GkFan10
         4zJj9fhZeEOzy1N/SSKlAJy8n+4ifiJRzP9RtPtvk+0XpND+2PNKMonMOZqr/20Hy1YC
         O+SPqOxjsr5pJgjh/LGzztlTwwUhnh3kqntMKEjiQibBfc73BV/p9yuBz3y9/T7ocapZ
         An9Xth1oLbG1KCEQ7Z9J0rlncn2E9eKMhPkiAkuFXt34CMLJqqeKWu/UmfKaZxjo1BYo
         OavgZyHGtNrltqi5TdoD3/x+5hGsoWCMf9SSEgHWvYOBJTmwgAYlXeB6SCM4nVinES1E
         eqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749937940; x=1750542740;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bg1odM9KUcbjVWw6SM2h9C8Ehh1I33FXJkfY9DO2daw=;
        b=CtgW94iUn0qigw4RX36WFWdIUFtNXBGfZ1GzUwEtKwCl5ywLaw/YNqpbPt+VwDbXm7
         TGeFvUO1LzY0B6RfU4vfbI8rnkj5ySh/K8iCgo335f2e+5JaYTxBjf6OXiTfRXXgkGzl
         hWQWFPKGolzjRNsdfDMZS0BWJG5v2cf5s7pUjYRJKG88WeKpswVUZGZ3MN5DWFkXZlwy
         YqRgfNyKfwZ6AJhrtGHHO57GWrvsPzgx2vBsbalcE1ubQf1dtwWJ1dbCuQr6aT1kDEfH
         BZxAJ9971YRdY9VLMdUW12o/Nk2koEqZP/t1Xan5S6BSeBqwL2nAz1Z+75nuSJ5WDliI
         Nw3A==
X-Forwarded-Encrypted: i=1; AJvYcCV9+eCdD2kfeR+UqGygsEIKgD2DCfejy7DYWQmOMymJX9gwOkxWoPlwtweEP9+RZI450sz7/JA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjFvIz5I7UVBvhX+wbNO0L/j1U+D2Sdy8wP/pc+ohYwpb0s+7e
	ZmCdL2fr52e2G52BrmtxOv1paMhFqSiRneZLOnmSGhcH6YoTkPpdzFPi
X-Gm-Gg: ASbGncuuhsTF6SgilQsuZ2Txvy+zWzEDKdcmmMSZ6fRR1NTijih41KLo+KwVDmnw39T
	bEzviBC94bOA/z6UHWYgHr8ULpIB8LI1d9nwDdAsBUa/BDKqOJr6YfhpqC/LSUnoaRSC8qYLZv6
	NJJq5d8YGL9QhnNfPasWvBoVPWJe4AlxkLLvt3K0dYFWvQDyPLAzP56i89+3sFmO/zi/2SL+Y6y
	/2qku0shT6pUrXuABHASvgCTlZHwMe0IBqY0KhsvtEhVHDWne1ZgT4CaeCD0fh0qSGajoqYJJ0x
	NDlvdiKTvV0qENTtPBs/4ERwT0KvNVoL2/D9+ZWL69rWEUNW7NJ6FkgOtc1N9g5qZMMMig7tCgO
	U5EYqsw==
X-Google-Smtp-Source: AGHT+IGahM28OixwThHb31jCwhtlrClMJngbczGluvHx5ulPSa+4X0NSYo1XxDZlq6XZ+IJhlazykw==
X-Received: by 2002:a05:600c:c117:b0:450:d4ad:b7de with SMTP id 5b1f17b1804b1-4533cc69257mr35521775e9.3.1749937940275;
        Sat, 14 Jun 2025 14:52:20 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13c19esm92865075e9.25.2025.06.14.14.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 14:52:19 -0700 (PDT)
Message-ID: <e84c95fa52ead5d6099950400aac9fd38ee1574e.camel@gmail.com>
Subject: Re: [PATCH net-next RFC 0/3] riscv: dts: sophgo: Add ethernet
 support for cv18xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen
 Wang	 <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,  Richard Cochran
 <richardcochran@gmail.com>, Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille	
 <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Longbin Li	 <looong.bin@gmail.com>
Date: Sat, 14 Jun 2025 23:52:30 +0200
In-Reply-To: <7a4ceb2e0b75848c9400dc5a56007e6c46306cdc.camel@gmail.com>
References: <20250611080709.1182183-1-inochiama@gmail.com>
	 <7a4ceb2e0b75848c9400dc5a56007e6c46306cdc.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2025-06-14 at 23:01 +0200, Alexander Sverdlin wrote:
> Thanks for the series Inochi!
>=20
> On Wed, 2025-06-11 at 16:07 +0800, Inochi Amaoto wrote:
> > Add device binding and dts for CV18XX series SoC, this dts change serie=
s
> > require both the mdio patch [1] and the reset patch [2].
> >=20
> > [1] https://lore.kernel.org/all/20250611080228.1166090-1-inochiama@gmai=
l.com
> > [2] https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmai=
l.com
> >=20
> > Inochi Amaoto (3):
> > =C2=A0 dt-bindings: net: Add support for Sophgo CV1800 dwmac
> > =C2=A0 riscv: dts: sophgo: Add ethernet device for cv18xx
> > =C2=A0 riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
>=20
> Taking into account, whatever MII variation is implemented in the SoC
> is always internal (and only MDIO part is multiplexed), can we add
> 	phy-mode =3D "internal";
> and
> 	phy-handle =3D <&internal_ephy>;
> right into cv180x.dtsi?
>=20
> Boards can then enable the corresponding nodes if they wire RJ45 connecto=
r,
> but I see no way how they could vary the MII connection.

I suppose the above proposal was wrong, though undocumented, there seems
to be an external RMII interface (at least on SG2000 SoC).

Unfortunately the internal PHY is also barely documented...
Also ethtool seems to be incompatible with mdio muxes :(

> > =C2=A0.../bindings/net/sophgo,cv1800b-dwmac.yaml=C2=A0=C2=A0=C2=A0 | 11=
3 ++++++++++++++++++
> > =C2=A0arch/riscv/boot/dts/sophgo/cv180x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 70 +++++++++++
> > =C2=A02 files changed, 183 insertions(+)
> > =C2=A0create mode 100644 Documentation/devicetree/bindings/net/sophgo,c=
v1800b-dwmac.yaml

--=20
Alexander Sverdlin.
