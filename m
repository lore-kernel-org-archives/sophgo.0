Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9961B393C
	for <sophgo@lists.linux.dev>; Sat, 14 Jun 2025 21:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749935969; cv=none; b=iZdwTGI3zvlmII+aX8EQdhPOF6+2MENrZSvqLadKpIoWs+Vv2hO/jgFKBjJ96h4Ibzx3LusGcNF/m6c0L9Df4iOmcra64bD38DivngwGYUvtlEjxP+dOrQRf/oOVVzeQ8GeVl9Komt7BhAOpEy9XMSPXiUHMAgxsALN+nvFiQXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749935969; c=relaxed/simple;
	bh=ZG3m7rZlu9KiGWUjBU4xheaArIWltgYwYSheh/mlU2U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hL/JNfI75NnSySV++nB8q/HpVsSM7Bce2SPeM/vF8EpRG8voMBOzTWlo4lmcEui/Bz9CqFS0QH9GB+KNnutH4/VEMKHp7MMZNkLzeWEuNUXB0GWg8YxNrX9rjE9pGAexe8wNgUv5XmfTKRaTUvMtZmVPd5awVDo46x5TXHWjJck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsuDCen4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsuDCen4"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d6ade159so26254245e9.1
        for <sophgo@lists.linux.dev>; Sat, 14 Jun 2025 14:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749935965; x=1750540765; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=flIDkZqwc3KWW4PKLKGBRVZjvqroSy4sA7R2DG7HV7A=;
        b=PsuDCen4CeHGR+55rQyqpSYGVIfFu03nfh+73NnGmIeU+rFdjQueCqrO2dKLUZRuFA
         xEFdwPw3HNefTBXIHYLBu7Sr9UG7lpyeOS/7W7MNwPJVy3yTVHvGFSj3jlfSwdkBu8YK
         MiWafP5OklfIKGjD+6S9OYmxdG9Dfb0TflVrovTH/Or/Ge1CUJwiwOhecmQNHhe0GLck
         moz+4zlkwk30LaVIZKgQX2m87AG33rt0zoIVNH9Fpz1yE9jiq1PbsyR9hRk5T8PDHlAH
         P6ocLLnQ4RMSrtBCYMX3cPnOzd+y6DK4q/S3nOzUPUPG7ZhCgVQHEv3Wv+X5jOgMj2vA
         x3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749935965; x=1750540765;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=flIDkZqwc3KWW4PKLKGBRVZjvqroSy4sA7R2DG7HV7A=;
        b=M1fYCdPi+U342UTHinkvFlSK6vzsTfGXfd5mB70unFY/rOhwqI1kCvDa0B2VlGy8E6
         Q/mYKZ0DonKEaOUXNKUFWBmzCPId4S9IZJI2fzL+tTd1FiDU2Vx6DEAGiB97MzVj3DGO
         hlYkSDSHoytPYJYtt1ZsNVMXGczjQs9YK1Ps+5dOA2IdavAzGHQ2mHQqQc1xItaLbUVz
         uHnHta0RVkFob919MDTDdO1WnayunSyvQONS8KzeB3jzlhx7eIUVk1Qe/0IicW+Unub/
         lYxbl6+Glpk8EvtaUA139xTd/J2jH+upQEX0VJJeytdxUQ9cumyZffKTE8NXFqvADdGT
         4bgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3B4RhfPq5KstV5JK105pnVzD3X8Pck1lDoMmcDXj4HgFyq+JlKgV2rBaW+0ugrtL5OlEy068=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGOMj90CQ1b/HZjy9HkCxij21KHPyZSWpdNAB+90yeZcTkRrTa
	HI2lSSbsUC214vZB7LvkDMj5OkfTY8WXT51JQ6rvSLyE9H5U+xPq8cCG29N0PaZKdXI=
X-Gm-Gg: ASbGncuTiDokz0AIOPWd2+xcIiTHzTss+ded8LnIY5dpAa6bIhECacN4QG7cGXHYWo0
	Wj4fvsGl8palWGAVZ/GLdOUoZBBltKcuSzIbe0y2PPOKvcGuY21YkTVf8VsfJzgD8KBQLYEjKO0
	k03Ax7zLObmfxzNjMvOSw6MCDoOVDAyORgUSsAV17CltCAI976opwtTVhmQMuo6fPl87cGalIB2
	aDk9Tw3X+eWJ7IvMkdEotiQPYDEEe9JbXlL58axN45nAnOBNhRtWS+KB2221tsqxenV6cxoql7E
	gYRvHDGDakuin8aMfQgkJq5ACyWcziDvzbzexx6WCW4D+feCfxhKPg7T8cXjdrY4wAL1vkEvOfs
	u1Rn/RA==
X-Google-Smtp-Source: AGHT+IEtV2JLpbYXhmYcHj10cqAe3Asf5UE3CdzjaK74yJYBNUGOKwUpNJwYbVg31UYOBNO1MJCv6w==
X-Received: by 2002:a05:600c:3e17:b0:448:e8c0:c778 with SMTP id 5b1f17b1804b1-4533cb4948bmr34825035e9.22.1749935965328;
        Sat, 14 Jun 2025 14:19:25 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4e4f1sm5925838f8f.87.2025.06.14.14.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 14:19:25 -0700 (PDT)
Message-ID: <d3b20a9ce58fa296034fe3aa8b60ecde4c4192f4.camel@gmail.com>
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
Date: Sat, 14 Jun 2025 23:19:34 +0200
In-Reply-To: <20250611080709.1182183-1-inochiama@gmail.com>
References: <20250611080709.1182183-1-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Inochi!

On Wed, 2025-06-11 at 16:07 +0800, Inochi Amaoto wrote:
> Add device binding and dts for CV18XX series SoC, this dts change series
> require both the mdio patch [1] and the reset patch [2].
>=20
> [1] https://lore.kernel.org/all/20250611080228.1166090-1-inochiama@gmail.=
com
> [2] https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmail.=
com
>=20
> Inochi Amaoto (3):
> =C2=A0 dt-bindings: net: Add support for Sophgo CV1800 dwmac
> =C2=A0 riscv: dts: sophgo: Add ethernet device for cv18xx
> =C2=A0 riscv: dts: sophgo: Add mdio multiplexer device for cv18xx

Have you noticed any problems on the board you are testing on?
I've added the patchset + pre-requisited + the following into my board DT
for Milk-V Duo Module 01 EVB:

&mdio {
       status =3D "okay";
};

&gmac0 {
       phy-mode =3D "internal";
       phy-handle =3D <&internal_ephy>;
       status =3D "okay";
};

And the PHY is being detected and the Ethernet controller is being instanti=
ated,
but the PHY behaves really strange: LEDs blinking wildly, link status is bo=
gus
100FULL UP even without cable insterted and the real traffic starts to trav=
el
only roughly a minute after the cable has been plugged in.

I could look into it, if Sophgo has documented the internal PHY, just wante=
d to
sync with you for the case you've seen this already...

>=20
> =C2=A0.../bindings/net/sophgo,cv1800b-dwmac.yaml=C2=A0=C2=A0=C2=A0 | 113 =
++++++++++++++++++
> =C2=A0arch/riscv/boot/dts/sophgo/cv180x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 70 +++++++++++
> =C2=A02 files changed, 183 insertions(+)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1=
800b-dwmac.yaml

--=20
Alexander Sverdlin.
