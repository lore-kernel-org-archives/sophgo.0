Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9AB27A918
	for <sophgo@lists.linux.dev>; Sun, 15 Jun 2025 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750001933; cv=none; b=VFEfBchTavkyoQKe8lA73U3UI1AS3jFJU66KwtbrXwDUVs4Cd0xxfDqIl9yADH1F2sNjHJEA+nqne5JytQHk0pzHO2nERSmq+gkYqvi4N0Dz6Bqr/UhsFf1k+kDYu6QXs3B4adpurvWJgIzLJUoCXIQmNmDc0Q6KsRwNFt5Hm7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750001933; c=relaxed/simple;
	bh=skC6593jz8Qp2NsHpKrIAnI67OLxHbPapnUj8QQBRmI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IXmRdNWfD+1mB/N2kMMkPiXxXOeNp5T32Vm4Ajb7kk0nzP4ZyigXktTPJgHvBjF1UuWqfB/R3lDYS116SvAeRWFkdDVLL4BYcih4ZcBRplSENHirsmXZzbgvSjeo+MDOI81NJFDM9pmAcPNNzztoNqpY8jKGmr1kSDNZlDmp/hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBMIurYD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBMIurYD"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4530921461aso30371825e9.0
        for <sophgo@lists.linux.dev>; Sun, 15 Jun 2025 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750001930; x=1750606730; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FMkRqL2nxrCdwWJa8/yANGr1OdyPoFDin5WjJhsL30k=;
        b=NBMIurYDaGHaSA7+JGIU6pKLyjHXzq/NdvsDeVhoZrmK+Mj5PNRVjSAXyh9/zDkcw1
         4q+s7Og0587c/68b7c4y3igVQPGO29I+KfJbw0JvbXrD0S77o14rdYaOIc+vswsvZaPz
         MkA4EryIDMapy0B+eVPzoKt1dpPIwpAxjSZCTue3IL8Fe2Riqo7EfZPt797iQtIXQ5sQ
         /mZhZptVa90v9Gj3Hdb5eGDOBd3N2S6bjEcE/9f8BesLc8mHuHsJHYwCkQ9MiSUTMJ1Z
         aWNyuydpU5q/Eq+k351KJm8fugGGNL+L0JCYKK+qWEjzFiIij+HxYfPnG75dwV2pXljf
         xYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750001930; x=1750606730;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMkRqL2nxrCdwWJa8/yANGr1OdyPoFDin5WjJhsL30k=;
        b=gXm0xhRE7+4Twi3MB/20lVkxVSqSvNUxv8kovjhZVvd+rzIUg9oMA/xQv/4CnET/Sj
         aBI80pKjk9n1nwtpsVbP+J5jcIyFGprCK76yI/sode0PVHy+214I5H/6K4WxyOAt2hmQ
         QhyUvKd8lGxpRGk3EFun/mITgvEUq44CCf6/pKUto3y2vr2C4yGkibjkO6KDGR1pOSu6
         99rE9l2GMa/+Fig9pPOiDHgiQ4t1N6yOYELSrTYVDTqmMueWV6yzjn2WPawlYjYPAtbK
         jw+CRJL+z0Ek8ubYwwQSccjLUrSzz6KJ2ERqXR8vCsePv1nsiRrTSYAiZ3AZSfSXkYI5
         v+cw==
X-Forwarded-Encrypted: i=1; AJvYcCV5WnuAHIGm4ZsswqMI/ChIcaCGyIGvNG0Lc0y8U/5Tj+3uoRzC3jn9HQ6y6TmM3LzYEYh74LY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9/42LYedvIo6wx/xWsEGi0eR1DztvARR8DP9xKIkt5iveufPz
	uhZVVT7fCJTy4mLB/3C7xW7LAgamEDwD6Hd0ZtjS9Hz6m4jTvn3aumUX
X-Gm-Gg: ASbGncuZk2IliNHH3PEfCn8PpgesKFR6mfZlJrKj6KB1UvqRblUXwX4if6tAdD//aon
	LpKTrqjsdvw7iCqN8U9vMpW7LP4cFqdrV3j5d67/1qr0jgkuzqNRhaxPKahJHEgvSsgCAqeHfJX
	aVn33cT3buhHIT+Nn9mYJz8LUnEN4yakuvrzYv+kmdHQPpS/LE6XTvo9jGYgsjR33P9yMWsS9Wi
	jhskHpoGn2TDNJ1BSqDV7okacMnDn0alBlecHs7JTbpJn3oBDG6L7XrMFBM+3IFUuTH/ad+U1xc
	tYoVXtVhHuzvS/jPj59mqADRFyYXgca3OJGAlU8RUydfi6tQjx3zd63BMjLwiHyd1HCHrOK7wp5
	+xyqJbA==
X-Google-Smtp-Source: AGHT+IHq8I3l0fYXwdm0ToztfHAms4IMFhN9WcmIcQ8Gnw+CeqvwulyWE63yVmbbovDyVZ8tPZqcTA==
X-Received: by 2002:a05:600c:5248:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-4533ca4fa68mr56483445e9.9.1750001929862;
        Sun, 15 Jun 2025 08:38:49 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b74313sm8116792f8f.96.2025.06.15.08.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 08:38:49 -0700 (PDT)
Message-ID: <16c8dc85cbbfb4d4e1528261f464eee64ed6362d.camel@gmail.com>
Subject: Re: [PATCH RFC 2/3] riscv: dts: sophgo: Add syscon node for cv18xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang	 <unicorn_wang@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Yu Yuan
 <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>, Ze Huang
 <huangze@whut.edu.cn>,  Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Longbin Li
	 <looong.bin@gmail.com>
Date: Sun, 15 Jun 2025 17:39:01 +0200
In-Reply-To: <20250611082452.1218817-3-inochiama@gmail.com>
References: <20250611082452.1218817-1-inochiama@gmail.com>
	 <20250611082452.1218817-3-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Thanks for the patch, Inochi!

On Wed, 2025-06-11 at 16:24 +0800, Inochi Amaoto wrote:
> Add top syscon node and all subdevice nodes for cv18xx series SoC.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Successfully tested in host mode on Milk-V Duo Module 01 EVB:

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv180x.dtsi | 26 +++++++++++++++++++++++=
+++
> =C2=A01 file changed, 26 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts=
/sophgo/cv180x.dtsi
> index 929864ba1b26..65eceaa5d2f8 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -25,6 +25,32 @@ soc {
> =C2=A0		#size-cells =3D <1>;
> =C2=A0		ranges;
> =C2=A0
> +		syscon: syscon@3000000 {
> +			compatible =3D "sophgo,cv1800b-top-syscon",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "syscon", "simple-mfd";
> +			reg =3D <0x03000000 0x1000>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			usbphy: phy@48 {
> +				compatible =3D "sophgo,cv1800b-usb2-phy";
> +				reg =3D <0x48 0x4>;
> +				#phy-cells =3D <0>;
> +				clocks =3D <&clk CLK_USB_125M>,
> +					 <&clk CLK_USB_33K>,
> +					 <&clk CLK_USB_12M>;
> +				clock-names =3D "app", "stb", "lpm";
> +				resets =3D <&rst RST_COMBO_PHY0>;
> +			};
> +
> +			dmamux: dma-router@154 {
> +				compatible =3D "sophgo,cv1800b-dmamux";
> +				reg =3D <0x154 0x8>, <0x298 0x4>;
> +				#dma-cells =3D <2>;
> +				dma-masters =3D <&dmac>;
> +			};
> +		};

--=20
Alexander Sverdlin.
