Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8429B35944
	for <sophgo@lists.linux.dev>; Tue,  4 Mar 2025 06:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741070178; cv=none; b=Bn918TKCE5vAOaSA9UCNbmIAs/YRlblx/6P3WbLf3H0NtS88QKnG0lElaruJec57MVeTcFZAeWPobdfW4M6NcMeL+cj0QyCwvQPNP+mG48wGVMEawDLdlSZDdesbHfWqo8PAOUikWtelmep1E4v5lQYWUnRQN3EjKxQP/+OpYnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741070178; c=relaxed/simple;
	bh=qo90MPty2vy5TkjHxjbbN8VqbnrgXqZe9HCQ6R+CBy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fp3B3ANtcL3Wyyi8FLZ50I8bF+SE/Hr0XnXCr7S9H3R5sRbHsyjzQjd2i49RtLfSUcg6VAyjyiEeYW4z9UO4PPtk4HwkJWB4J6veR0E42JwOPE+I4ToGd5A5uMTJQVOxWDEsc8ZCz+e4JKWEyaRO0RAdihqMsbM0Z+2obHg4OL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hG7TNIvQ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hG7TNIvQ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abffb7b9619so276378066b.0
        for <sophgo@lists.linux.dev>; Mon, 03 Mar 2025 22:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741070175; x=1741674975; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QIIT7csmVM8dlZqywgBobuFZmmi6UocIrnDWBO9ciw=;
        b=hG7TNIvQrS3r/kZLFWTqXSUzVvXLMlRiGjOFTqxR9BD4473r1+Ud56KY42/UL0CjKw
         qIDFDn5Dnl60NtmMd87degqbI2DsKG6brVln2Pm4UVikYaSZ1UEdOkGdcfDn0lzmtgBS
         DFKLHbcbZ++2ZhnX5lCbMaNnm/ih3ycdBe8Pl4hJ1ZA2Azy/9zpZgymVsQgYF6b3ZYxM
         hvvLe2QjLe5+ChdSrhc5arCjiXlVqrSPT9pr3d8lG9ARL4Yfb63IC1BTjW/gYuGOXtVb
         xzAqXNOTcaqUccjIVTPOYBTwetjP5W+II1GgLDxTTTHil5MCY8utGmW8z1Rv2mgLA1uF
         SF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741070175; x=1741674975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3QIIT7csmVM8dlZqywgBobuFZmmi6UocIrnDWBO9ciw=;
        b=JnGSmr6H39GAVXCxgVegioGUYk7VjHPd4cesSeUFFWjeYmQ/psjBI7o13gmFg0TBJM
         tytw86yIRQMn6BZ9q6lS8yJPPnbTgW1DOI3K5xUdmXzk7XICU6B/W8o5u3flMfjn/V7M
         9zHW2AmqMLoTxl8A0nCvBOdolqAxCg9BWX1HPepOIbw+v8zfjPY8dNz2SuoIwLaiSNnU
         M4FjV01Tj+lkFYDr9KcpGhi0oMLiTfxKITCs+SkCTXN3Hlm9KMBGYUGDgzssCsKdze+N
         Fu3YZw7HchbnEv2uzl/QIuAyyQZ82mTJx1Dm6NAgZ6FUpaODQfnpjDU4KoGlb5/FPAaa
         VFkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeS6JZtODns/DokaDtv3ibMa4Rnx16L7PyCmYmAchR4URcHCa91GLdQBTYxY5qPC/bIpWRsZc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIEHT/BikyCpH9wn1qx1Rn3X5hcEsVeenWSH1pjtEp7RZ2rg7b
	hrIQvEtwGV4gyj1hXm6+mwR6z8mx6z2YC9HhOc+uKULDfnS9E42kYzM7n3/I9RbGnU2KUBCyuZ6
	VJ1D7dN/jlRUuKf94iQs5nFZN83JK+2OGIeeYOQ==
X-Gm-Gg: ASbGnct+XOKsX9tRvG+r6A0qVHCbBkGcOllaHlw0A8LzpQx0oErGlR0k3Y1oz3rKAM0
	VpadmsZJpzOExioCq6iKTttojSNJmC0F/fnu7sHLIrAgnKlZ+ijbmrJpmosSR7bDihXBvU7J/8G
	D/G2nXxDzrVAhJG7l3XWYPSzob3wRdSjCXrRTAqB8C9YJl0tf5fVs9knU=
X-Google-Smtp-Source: AGHT+IHZm0fkINHMh/RJm6iSWcBaUzASH1B4ShN21HBXQ4x/u3WqSAUs5vR9z8gHam8OvAnYpRbhVOA/A6CSdmFfsw8=
X-Received: by 2002:a17:907:3d89:b0:ac1:e5b1:86fb with SMTP id
 a640c23a62f3a-ac1e5b191c5mr390382766b.10.1741070174300; Mon, 03 Mar 2025
 22:36:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com> <fllmh65x7ke4sfolxbdod73fx3fm45w7gy7x4pgamxnbhztjvk@wqd56dzxaa37>
In-Reply-To: <fllmh65x7ke4sfolxbdod73fx3fm45w7gy7x4pgamxnbhztjvk@wqd56dzxaa37>
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Tue, 4 Mar 2025 14:36:03 +0800
X-Gm-Features: AQ5f1JpUBt6QMLvOzLEGb8fYUdsyP3P3_7A1zhBvghXd3CBU5ioBvlsqG2gFerg
Message-ID: <CAKyUbwXqg13Ho7QHw8vV2W6OcObphwhQ8HUrZMDNBxrVxLmdug@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: sophgo: dts: Add spi controller for SG2042
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 25/03/02 10:18AM, Inochi Amaoto wrote:
> On Fri, Feb 28, 2025 at 08:40:23PM +0800, Zixian Zeng wrote:
> > Add spi controllers for SG2042.
> >
> > SG2042 uses the upstreamed Synopsys DW SPI IP.
> >
> > Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> > ---
> > For this spi controller patch, only bindings are included.
> > This is tested on milkv-pioneer board. Using driver/spi/spidev.c
> > for creating /dev/spidevX.Y and tools/spi/spidev_test for testing
> > functionality.
>
> I wonder whether this patch is tested (or at least can be
> tested), as I am not sure there are pins for spi or any
> onboard device on existing SG2042 board.
>
Yes, this is tested on milkv-pioneer board.
Since this patch is just for supporting SPI controller in BUS level
which not relates to the real hardware such as screen, I used
driver/spi/spidev.c for creating virtual device /dev/spidevX.Y by
adding nodes in DTS file as following:
spidev@0 {
        compatible =3D "snps,dw-apb-ssi";
        reg =3D <0>;
        status =3D "okay";
};

spidev@1 {
        compatible =3D "snps,dw-apb-ssi";
        reg =3D <1>;
        status =3D "okay";
};
And using tools/spi/spidev_{test,fdx} provided by kernel tree for
testing bus functionality.
> > ---
> > Changes in v2:
> > - rebase v1 to sophgo/master(github.com/sophgo/linux.git).
> > - order properties in device node.
> > - remove unevaluated properties `clock-frequency`.
> > - set default status to disable.
> > - Link to v1: https://lore.kernel.org/r/20250228-sfg-spi-v1-1-b989aed94=
911@gmail.com
> > ---
> >  .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |  8 +++++++
> >  arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 28 ++++++++++++++=
++++++++
> >  2 files changed, 36 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch=
/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> > index be596d01ff8d33bcdbe431d9731a55ee190ad5b3..c43a807af2f827b5267afe5=
e4fdf6e9e857dfa20 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> > @@ -72,6 +72,14 @@ &uart0 {
> >     status =3D "okay";
> >  };
> >
> > +&spi0 {
> > +   status =3D "okay";
> > +};
> > +
> > +&spi1 {
> > +   status =3D "okay";
> > +};
> > +
> >  / {
> >     thermal-zones {
> >             soc-thermal {
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/d=
ts/sophgo/sg2042.dtsi
> > index e62ac51ac55abd922b5ef796ba8c2196383850c4..500645147b1f8ed0a08ad3c=
afb38ea79cf57d737 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > @@ -545,5 +545,33 @@ sd: mmc@704002b000 {
> >                                   "timer";
> >                     status =3D "disabled";
> >             };
> > +
> > +           spi0: spi@7040004000 {
> > +                   compatible =3D "snps,dw-apb-ssi";
> > +                   reg =3D <0x70 0x40004000 0x00 0x1000>;
>
> > +                   clocks =3D <&clkgen GATE_CLK_APB_SPI>,
> > +                                   <&clkgen GATE_CLK_SYSDMA_AXI>;
>
> Is the sysdma axi clock for the this device. IIRC is APB interface.
>
Thanks, I will remove the GATE_CLK_SYSDMA_AXI in next revision.
> Also, Are these clock aligned? If not, use space to align the two
> clocks. You also need to add the clock-names here.
In the case of the only clock, I think it=E2=80=99s probably no need to add
the clock-names property here.
>
> > +                   interrupt-parent =3D <&intc>;
> > +                   interrupts =3D <110 IRQ_TYPE_LEVEL_HIGH>;
>
> > +                   #address-cells =3D <0x01>;
> > +                   #size-cells =3D <0x00>;
> > +                   num-cs =3D <0x02>;
>
> Just use decimal number, no hex there.
>
Thanks, I will fix it in next revision.
> > +                   resets =3D <&rstgen RST_SPI0>;
> > +                   status =3D "disabled";
> > +           };
> > +
> > +           spi1: spi@7040005000 {
> > +                   compatible =3D "snps,dw-apb-ssi";
> > +                   reg =3D <0x70 0x40005000 0x00 0x1000>;
>
> > +                   clocks =3D <&clkgen GATE_CLK_APB_SPI>,
> > +                                   <&clkgen GATE_CLK_SYSDMA_AXI>;
>
> The same as above.
>
Thanks.
> > +                   interrupt-parent =3D <&intc>;
> > +                   interrupts =3D <111 IRQ_TYPE_LEVEL_HIGH>;
>
> > +                   #address-cells =3D <0x01>;
> > +                   #size-cells =3D <0x00>;
> > +                   num-cs =3D <0x02>;
>
> The same as above.
>
Thanks.
> > +                   resets =3D <&rstgen RST_SPI1>;
> > +                   status =3D "disabled";
> > +           };
> >     };
> >  };
> >
> > ---
> > base-commit: aa5ee7180ec41bb77c3e327e95d119f2294babea
> > change-id: 20250228-sfg-spi-e3f2aeca09ab
> >
> > Best regards,
> > --
> > Zixian Zeng <sycamoremoon376@gmail.com>
> >
Best regards,

Zixian Zeng <sycamoremoon376@gmail.com>
