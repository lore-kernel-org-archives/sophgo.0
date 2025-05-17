Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A833204097
	for <sophgo@lists.linux.dev>; Sat, 17 May 2025 18:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747505177; cv=none; b=AB4urH6G+Qj4uRGGdF8EzGe+0XJAw8nYUZpoITITbO3PMzoD7qnV5ZIfm0xwd9DV8nto3NemGd1tO8ZSZ/BD+/8fEFlfTaU/QNGGwnSCFwp4R64QHOI9Z9Cnt2lBdBrsqBN3g/XJz23Z37whkS5G3E+U5x+13cUKjHiBdnLBJpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747505177; c=relaxed/simple;
	bh=9+h1ovfHuN/3wPA02D/nmMQE3r1DllHMRk/oSCTS1Ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovU1MqCqWpp4mgVsAuWofEnRvls29WdENYyL8kjUSHyw+/uKzFy979Y7Kv6CxgzPUiR62eY7aikd2bwWxYei4gbGCVu/H64SN4jVs/yNx6giENQEl3n41dUHAhzMiXkt1aOhW5ZUOS8GzOiXm5NobC9VYfnla4x2wMNf5DMwc/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHdRjNzl; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHdRjNzl"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4e1432aaa68so1284401137.1
        for <sophgo@lists.linux.dev>; Sat, 17 May 2025 11:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747505174; x=1748109974; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1schRBN0woVB0x+Am0mrrm4rSAKoNb5LVQXWFxsgYM=;
        b=JHdRjNzlFWv/36OVWGlmJMcDVxjHhisFBoVYuA8cOPqaFjSjsoEpJs68oyhH9cDpG1
         bQgKonoy5w13uKibowWmBBY7yfAyV3TWhM+a1zCKboKnEYpt/eyTW8SAokfvgdnRpY9a
         H26yg0F0hFow2e3OrDEa0kEjDJqJQSwSlXp6S0HTewTLU9efpLct6eIEoCPsNPgE9FeJ
         ev1CD+fTmFl910C+chE+ilpkMM5xZlr5NQ2W7p3Qu1hRgIMNET75G0Tnju608PYXy/ua
         nHoZFAwjGU4gTCdIvAbdidrJi4PE+aGQ66YXuWDAxOq3ADaOjfCrLEoZdq5MtVe5COYN
         zuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747505174; x=1748109974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1schRBN0woVB0x+Am0mrrm4rSAKoNb5LVQXWFxsgYM=;
        b=CjE4+kJ4ew8WWDoeZ4wgzBa+1J3piDjWofd7m7npTNnuN4e0+SpqBSXIu++EP27r4y
         iSBXERjYPNQW2LMlOPPJL2F86kbsIM+OhAl6qLPzaLxWWlEevwWn1p7NlL19ImX5DDs+
         axBXmPC9iWbKh1fqyJgfpzsJ7nuAv/HX884M7TsuCpNebS0SwrB9oJ/2hGnovFvLIbrz
         ydy9jS6uIwo+f07zV7yYq1cscehIhzE8/4TnEzQEPH8oGxhwtmrHu2wxrfvi5ONQ6mhQ
         OcW/fopm2w03vwW2yrZddXbPRk/0U6onVi3Kcek/UwFD0j7Uc+y0kZ3T2TeWD/x6JubO
         jGnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP0l6o4wXRPaYGmfVMK7tOt7vllTjHNVenIXri5AX0RQIS7ue1XNXLMltil1Os+6VuTNvzTd8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0Sy5J08D0yDC6KHzjA3MEyevxVHeGFWzlKwrxXl1/tZg/12q5
	QlWolcpXOA/gew2vefAtXaOGp9E/ZLHP2D/0V5zZ14CYvgZVyTKdBoqanemkEbSLNN44NduWCM6
	kZ0YDqWmaqF1/ZVldk9XpvOY9FKOeesix7AxFupFlKIaf
X-Gm-Gg: ASbGncugwpAOwJvmYdj5QQDxyZc3NGxsDZEf3KOmP5c7WiuQkfcuo6BxWa/ZfMggNXR
	82UeFEkH2K6Db34QzqyKrocwv1xDznFT2T2ebu/jek6gJW0OZZKF08mUwrvTExZF20NqcvuyDH0
	+lVksr95aSrA2/wRiDs1w9KOQukNXbOVuigBkuXV9Mo58c
X-Google-Smtp-Source: AGHT+IH66PFdaZi5J8HDbVArPmOY4TBk+24AltynhiohhEtefKF4b5APmjMEeCNcvpc2ZeWTrAZPNwbAZPkXZvyAPfQ=
X-Received: by 2002:a05:6102:3e95:b0:4df:8f03:13dd with SMTP id
 ada2fe7eead31-4dfa6ae735fmr7820730137.5.1747505173766; Sat, 17 May 2025
 11:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1747231254.git.rabenda.cn@gmail.com> <4f5eaf5285dbeb0de1c8aa4700ca0910273e7674.1747231254.git.rabenda.cn@gmail.com>
 <MA0P287MB2262AB8F3A790B876AA2E989FE92A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB2262AB8F3A790B876AA2E989FE92A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
From: Han Gao <rabenda.cn@gmail.com>
Date: Sun, 18 May 2025 02:06:02 +0800
X-Gm-Features: AX0GCFtHMGcnarhky-ATNItjF_XCNfJdq0UotRwJwXxNaOVTLJwz1YvpazgWyKs
Message-ID: <CAAT7Ki9X0KOuuZnVjT2=uexD67rfyL4Gq18ZDgr15CeaoNOmpA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X
 board device tree
To: Chen Wang <unicorn_wang@outlook.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Added ethernet support based on [4].

[4]: https://lore.kernel.org/all/20250506093256.1107770-5-inochiama@gmail.c=
om/

On Sat, May 17, 2025 at 11:22=E2=80=AFAM Chen Wang <unicorn_wang@outlook.co=
m> wrote:
>
> Hi, Han,
>
> On 2025/5/14 22:09, Han Gao wrote:
> > Sophgo SG2042_EVB_V1.X [1] is a prototype development board based on SG=
2042
> >
> > Currently supports serial port, sdcard/emmc, pwm, fan speed control.
> >
> > Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG20=
42-x8-EVB [1]
> >
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >   arch/riscv/boot/dts/sophgo/Makefile          |   1 +
> >   arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 247 ++++++++++++++++++=
+
> >   2 files changed, 248 insertions(+)
> >   create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/=
sophgo/Makefile
> > index 47d4243a8f35..2470e30ae901 100644
> > --- a/arch/riscv/boot/dts/sophgo/Makefile
> > +++ b/arch/riscv/boot/dts/sophgo/Makefile
> > @@ -3,3 +3,4 @@ dtb-$(CONFIG_ARCH_SOPHGO) +=3D cv1800b-milkv-duo.dtb
> >   dtb-$(CONFIG_ARCH_SOPHGO) +=3D cv1812h-huashan-pi.dtb
> >   dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2002-licheerv-nano-b.dtb
> >   dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-milkv-pioneer.dtb
> > +dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-evb-v1.dtb
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/=
boot/dts/sophgo/sg2042-evb-v1.dts
> > new file mode 100644
> > index 000000000000..4f39a2575b8e
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
>
> Please run "make CHECK_DTBS=3Dy W=3D1 your_dtb_file" before submitting
> patch. I have a quick check and get following warnings/errors:
>
> Error: ....../arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts:67.1-7 Label
> or path gmac0 not found
> Error: ....../arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts:86.14-15
> syntax error
> FATAL ERROR: Unable to parse input tree
>
> And the similar issues existing for sg2042-evb-v2.dts.
>
> [......]
>
> > +&gmac0 {
> > +     phy-handle =3D <&phy0>;
> > +     phy-mode =3D "rgmii-id";
> > +     status =3D "okay";
> > +
> > +     mdio {
> > +             phy0: phy@0 {
> > +                     compatible =3D "ethernet-phy-ieee802.3-c22";
> > +                     reg =3D <0>;
> > +                     reset-gpios =3D <&port0a 27 GPIO_ACTIVE_LOW>;
> > +                     reset-assert-us =3D <100000>;
> > +                     reset-deassert-us =3D <100000>;
> > +             };
> > +     };
> > +};
>
> This should be dropped, we can add this after ethernet support is
> upstreamed.
>
> The same for evb_v2.
>
> [......]
>
> Thanks.
>
> Chen
>
>
