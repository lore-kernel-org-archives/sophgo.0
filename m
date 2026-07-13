Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370BC28B4FA
	for <sophgo@lists.linux.dev>; Mon, 13 Jul 2026 01:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783907796; cv=pass; b=LKG+/l+5WxQM20cEpP8OnkcarslPWrjPiNYS2K4YSjRqdxJOOuYE0liIFKnFSIGp5tbxJIOKoYj3vvxGO6lfM+SZUyzkh0nR2DuOUHxorR1/O0VZqrSg6F/m720fdALPRTagEyWPJ6AIYAb7wnw5exZx5WI1AgVifBhrS5vi6NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783907796; c=relaxed/simple;
	bh=gJ4WNWsxraY4gds4mU7edhwvBZ5gKQnfXCYxM9uPV/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rTPhTMtcDYydHnj+v/vkvPT4XLX30tLv7ztb5ZPOoquMCPUFdwc7j4/iXupWWOJs5SsaUoG8jsxS67S3WjZaJXP5RN+6qMPiivDob84Pr+rLfOsgw7AYRsoxAs8GGmzh0PpXH6riNXEQzU7Z2OhZBUZxPe0ZmxtdXCAofDnOMJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ggz9/Tc+; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ggz9/Tc+"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb906d6c6so413097e87.2
        for <sophgo@lists.linux.dev>; Sun, 12 Jul 2026 18:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783907793; cv=none;
        d=google.com; s=arc-20260327;
        b=RfkI856pfjU+0UMEE0+BaLDhuzmjJwvdlj4wyddYXEH1h+6nsnHHB2VP5lY0R/ljjP
         bJu33AvKnAUj7qaPqqc/R13U1+hrExV5Nnx/tYrEQDKFaqmEYMo5oDE9IQW3r/0nuTKN
         3fIyvX+qnScj5E+X0tv7+lphIy7RKbsDulADZ/wXPpPxi0vZxIPzqvrsBgbzUz+7//WR
         hKZGrFMsAe+GSaUnQP0Ilb6GnNxqPxc17fmZgrzcJ7E3UMMsZbPUAicmtKDi6LScCV4n
         e+YQzS1ZOXGeqwMAWAhGSc+5cWIdaNurqrGP/kyDTJLghyvkpy595awJrU8fQd5ya6+R
         nXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TUItlZ1U8huwaHjPN09ycPTspoOfanWPZUQOpXtc2EQ=;
        fh=IAJyqOJDI/BGnN3SnYWoAoQukIbX9iGqjx/pHc6qprc=;
        b=DKojX1O4bOrgNlZS5oi7oTchVejvR0h5MRqgSmjPImcvaVRoB6S0g7s9TIvlmNqbAr
         GCsBQpLQ5gnSG7Efl4ZQ2vIF2IMCvkiiSURZqQpHd4TYUpeOvafd5gE5CQzP9bj4Wobu
         52F9vlKEuzKBPMthRa/Bc1HBFAgM7LjNhEnJ1HIyQ3nuqY2+6PuseajOgbzmXwCb6Kvb
         YQgVEQEcHZ6X72PzrGA0FgkXmhHjRmHxsTQ/p5sLoxUYHBHnoHVathZq1yG0nnKriSlS
         RzWH3Y+ty3XA1fpAEZejEXbisNgKSTtDNbOSgMw45fXdeoXs7jvyGs4Ebc+X5mUyuiV3
         AoCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783907793; x=1784512593; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TUItlZ1U8huwaHjPN09ycPTspoOfanWPZUQOpXtc2EQ=;
        b=Ggz9/Tc+gkEmUIaBkbiR1WZVXVhXw48HNvfwLqyMX1kStX7QMzsutlmnBHA0VLVVrr
         7rSgWj3rQGam1tG0LnJUZcDHNTjMfrdFjN9puNu8VmaV8ksXpLNdm8aAKQOFvO7/x6XF
         rcD3Jo9q8/lrL0afNue438NNCd1/NwvtKph5OC2FU221YwN6QFfJmsekY37QlgMjyGyu
         jfbHZZKe/5IvYMGC+bIg0zzBCuatCgklUs3kc5Gek00v9JHVkfjZOor7tEnmuBTI439d
         9Y9T/99mCnEkO1mGSHpbEdts5vSAHI+XJ5kyAVfR9Jzq29hQNh3SBGX1d49yuff+l9td
         nUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783907793; x=1784512593;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUItlZ1U8huwaHjPN09ycPTspoOfanWPZUQOpXtc2EQ=;
        b=f1zxLu3/ia6o2/7cFcLd4dLagXizKT23HOSW6LEtPa/Dx0yUSjXseNgRmdCz4GcGn3
         9SrTqSFzDRCBwmTZVtLGv72owlI/bKc8GIvV4vWceR4bcFWbYVVWgfBkLRK1IXK2ycM6
         EvCEn+PdOx0qMIHBb12LhWnl/9FMq0GIKgekU4nn4LagPdJoTN6GKQJ+N1cBFs5zpGqQ
         3MCZrM7QKpmrEtlGLNyC0oWCHlrGCRWRMaw7s5cJYAHyYYqNTQ3vLh5bWW8EKCJ3Fwqp
         kHnRVQMFaG5/nj9cmF/LARtRnNgnc/05SkJpg4p1uL+pJy0H7f8sQ3lwpQGNKORLZ+en
         qFyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9vxalMmUCgj3p6X97jbTcZkEM2OL+h6r5Qs7wp3kiZF9uTuyoMJw/lUnUEH+m31d7DeBPg8U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtXfrB47kkEUu3dun3Pdgryg3CfHaGUMjNgb1eJAcVVXV/RCyl
	O+mB0yEitdvm+yWpBOcba+9gUqs6VARb2cZRc8SOgdfM28DKySm7DK3/GWX+gQubiVMctrag8Nu
	YJu77F/rrXuuXo2bYSjGZF39L2gUUQPM=
X-Gm-Gg: AfdE7ckoZp6yGeXwHNkcKTDs5zhVsDZ7VZI8Xt6bb2hwp6Dvfg9hxCTicQzRrPvMTM+
	dOLg2pFwdT5zO6hgKisbZ8JyKsOcpOsDRSVitPL1cbw4VeXH/U72EDx0HAoLPRMngKZgEdj34md
	WuXMpH0so7lfOuRj1JD/DehLjUqgZ9Z/q6WwXnN1oSUEiCB0iTnP1UrZIJxKD1YR6VyJ6S8FC5q
	qfbYmTZJtmRktxET9LfGcdo5qaTT6P8KTvlru7jj661uhRucEFHkIEib0ePGYLZS0jXAlbsJq4F
	YICRbK2ml+FhulICIxy+0gY/48t/+Qu0pbgjg/1hKiJfx/5uMoqb1lA=
X-Received: by 2002:a05:6512:6690:20b0:5b0:312:21ca with SMTP id
 2adb3069b0e04-5b0235618d0mr532700e87.2.1783907793142; Sun, 12 Jul 2026
 18:56:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260710075917.159969-1-chenyou910331@gmail.com>
 <20260710075917.159969-3-chenyou910331@gmail.com> <alQ3mqUPItCP2CVT@inochi.infowork>
In-Reply-To: <alQ3mqUPItCP2CVT@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Mon, 13 Jul 2026 09:56:21 +0800
X-Gm-Features: AVVi8Cc9hd60uzXZYaT-84HPNgylmi-obZShd-I5Pge22kY3ToKnXYlACPAQfyQ
Message-ID: <CAKspUhLzgYPAxTTnUPsPyoa0Pp3519qFpXxmjXEwCAOHkihFEA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> You should follow the device address order. not by the device name.

Right, I placed it next to the other GPIO nodes by type. Will move it
to the correct position by unit address in v4.

Inochi Amaoto <inochiama@gmail.com> =E6=96=BC 2026=E5=B9=B47=E6=9C=8813=E6=
=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=888:57=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, Jul 10, 2026 at 03:59:16PM +0800, Chen-Yu Yeh wrote:
> > The CV180x/CV181x family has an additional DesignWare APB GPIO
> > controller (PWR_GPIO) located in the always-on power domain at
> > 0x5021000. Add the node so that boards can reference GPIOs in this
> > bank, such as status LEDs.
> >
> > Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> > ---
> > The base address and interrupt number match the vendor SDK device
> > tree (cv181x_base_riscv.dtsi: gpio@05021000, PLIC interrupt 70,
> > i.e. SOC_PERIPHERAL_IRQ(54)). Verified on Milk-V Duo 256M hardware
> > via the onboard status LED on porte 2.
> >
> >  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/d=
ts/sophgo/cv180x.dtsi
> > index 06b0ce5a2db7..25ad2bd265d7 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > @@ -160,6 +160,24 @@ portd: gpio-controller@0 {
> >                       };
> >               };
> >
> > +             gpio4: gpio@5021000 {
> > +                     compatible =3D "snps,dw-apb-gpio";
> > +                     reg =3D <0x5021000 0x1000>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     porte: gpio-controller@0 {
> > +                             compatible =3D "snps,dw-apb-gpio-port";
> > +                             gpio-controller;
> > +                             #gpio-cells =3D <2>;
> > +                             ngpios =3D <32>;
> > +                             reg =3D <0>;
> > +                             interrupt-controller;
> > +                             #interrupt-cells =3D <2>;
> > +                             interrupts =3D <SOC_PERIPHERAL_IRQ(54) IR=
Q_TYPE_LEVEL_HIGH>;
> > +                     };
> > +             };
> > +
>
> You should follow the device address order. not by the device name.
>
> >               saradc: adc@30f0000 {
> >                       compatible =3D "sophgo,cv1800b-saradc";
> >                       reg =3D <0x030f0000 0x1000>;
> > --
> > 2.43.0
> >
