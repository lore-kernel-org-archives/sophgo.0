Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13DD39EF23
	for <sophgo@lists.linux.dev>; Fri, 10 Jul 2026 08:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670873; cv=pass; b=nXIgzHGb0gqcsEBOP1P7rWZQEmTc5tCOivS1tWr8S6qdRLJeMclfSA3sMrq+BVU4ICshmH6gFdIQh5T9Rq6A4+CZ7uQBvKxE6X5cXFUtH/MSJjI+0ATNgSgCtKpTg50K4IkhaNAEELGZdsdk8BoizlWXDTNe+VHUO3KZyqKjM04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670873; c=relaxed/simple;
	bh=wTtqfla7t4frqqNGoHQFYc3eEfTem+rU1Jgc0zBxbkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHSkd4OR46Er27JSbpf9dKatHCvQOZhRqhKqMpVMPmjcqZs9HlKFeAyzalIkCRqjc6e6Y2eS6nYCTBRWOla02PgIE8m5b+YXPSJPhzlwKAhI/fVMtNrIklvoDEcfDsDApAicJrspO1ivxf4YGuzdXqzKKbW04gAwWja9rf9w4N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJAtCgkp; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJAtCgkp"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b014810feeso62602e87.1
        for <sophgo@lists.linux.dev>; Fri, 10 Jul 2026 01:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783670870; cv=none;
        d=google.com; s=arc-20260327;
        b=oiShmST8wQf6C7GGOS7UIZbCenLbWGfNVVEzL9A+pgRjF3TLm/EDomj1X1dsRPSbvg
         b+DPqu4R/84fIw84ftWzcQyNY5+VIqZaJ/WryhvtmJJrvZoozHLTxn0BE311/cFXfFZ9
         fMQrIeyQ5dPJCL3oEHgnZ/A/rjPVfPtXO3KH5O2SrEJJTMv4VzPH7IXNdhFZnk8MYA8Y
         QP14GwRcX75F/pgH9rc0Y1HQPFMst4YiBrO8BOhelzmHqaN8WXo0X0jgtg07SxryWp7t
         cpVujZWAnxffCRbLKu6e/WjNjI9x5U0CiRmX/WDGTSX6PHeYGezyF78Mp/+LNWKLAwSB
         nyhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TgIAhkPb6XKhj25HpT0x9mH8xBPfiqrepZEoNGtW/O8=;
        fh=5RfmgmnqH4N/9CFvw2kEHZRZmBJ1PPYo7Ib29CjVtTQ=;
        b=oGOXMc81LznlhRDeBYrx/BuiItEQJRlTJbUtMvUGR5sZiV4NHIE2EK3T0qs7RQuPt9
         AJ3O35wWouPRAihY59o/rntr+p0/e5RXKUQ5X0VDWftpWHaWpWpCeRy6SfPqHiyZzV4A
         gvDKpQtELSujR33Jr9uIZ1IHfEJrUiHK99whPy3Nksw0Yte1JA6m5IlwchasoWk8Zexj
         wi9eSr/6DlMbLET3x2AVvyNSVXyEu9/wnlRMVuCwLzNqdPxFPgVrXC+kx1m1s5ZKEV2C
         m19kg6D0WT/bk7dC8C9EEClIj2/9Y/NtOrxMyOzGNX91LGo+LJEzi+e7F/2n0LGc3M39
         /EiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783670870; x=1784275670; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TgIAhkPb6XKhj25HpT0x9mH8xBPfiqrepZEoNGtW/O8=;
        b=dJAtCgkpjiBRJ/jl2crQwFaTmxnecpQGfQVVfn6IM43J2oAAGcEWZtU6tqOIJ+sXhN
         wXJGRSWtV3E6th5XUZaDlQ/RQ5hM2XCrEDimLduWbJHK4QzizX6zNM666HrAOhnq2igt
         f1I/dR24i7ZJIp9PEMYmgT+aeIZKIIxS0DtSF//dF8+X3rLHYh+qHjpnUSOBtmOYRYAR
         taLbLol3OvtAUzVOZxdbjbn816FibG4k2JFdP4CEgAzGvVx0OH7Czt6n6Fx6L1aNaPeu
         z1bcei9A2uIpjwRmxG12vjGv+KbFrLe+9hzfbMlgXYsT+MINTIZl6sMjjl0obm65aQyw
         VVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670870; x=1784275670;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgIAhkPb6XKhj25HpT0x9mH8xBPfiqrepZEoNGtW/O8=;
        b=I/b53ScH0qtoGeo93VlCeoZzvumFXluV8wFZO2+X2nJndnHOiDm5KHp9Lr3r+ZkvrN
         6S0dHXXFWV37E/2b52OjPA5oicnk4BJuD4HQzwL2KubUrbdxy0oEB3rnpmRpBq/BaN1N
         txxIlikIfSf86tZFqHLnBoQKXWdgvOvbQvZHPUTHZh/RA6s6vOMMzzXNHIYUYxztT8XO
         FUPBczEmH++/J1JTSH8IFyyhrBKEoVFQrGKm0NXh0VMva5IfriPq/7FvXan3GcmbElOs
         uYsPjmNg+Xkg7Tl9XBuVPUeDhRRbGN4UZK2kHS9Zt4sD363bLOUxrOYjdVV8uKq7vECm
         bGFA==
X-Forwarded-Encrypted: i=1; AHgh+RpCFKeayuwHpOYpum6smrY3h1Kxd+no9rbfnYY0kVo3S1tfgvUs5fRzN7Dgm+7qKr7V3rICfH0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxA/MrzLVjrYKKvIUVJyudLYSYbh4kiviZ+y/nqBaMNcJLaNxPv
	yMmgCTwn5SRIZiD4ZdUpgRid/E2XF0M9JZ2A8nHqbzp7lmrtlHIDs1Bg7c2iHJiduis/3dGALv9
	ghFmmPyDWAIxDC8LsuTIk11c4cxQfH+g=
X-Gm-Gg: AfdE7ckf7V5jmusno7Iu231CfKTy8Lzgx6xvbI+vL0wQg9pIZ4pHRVVWPnO0pQQ6+1Y
	rSxC8oyYsFsml5p33mYKrJKcoYT6FvrqhH1wglTqu+m9Fiza5vkFtSsJ/Ez90pUQvFZTimv2Uo2
	fYeFaG/tfn5Dy1p3/P3A4Y0gS07zpLDK4MDgEyYUF4ExpKwdB+MXMaZC4t+A9uEC28wkhSNRxtF
	t6GnX5QL0Hu9lQknWDrW8fDrykRxBRo5raBjf8wSYdk0o6svDx9i8SxMF3gUepB75QmqCSf1qJd
	13eBLktXnG66NAuxHtPuBzVr9QjSZd8CMRcxsNy8noYQP0hs8TqWrrc=
X-Received: by 2002:a05:6512:12cd:b0:5ae:bce5:70f2 with SMTP id
 2adb3069b0e04-5b0115af09amr1512517e87.4.1783670869814; Fri, 10 Jul 2026
 01:07:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610121026.1517621-1-chenyou910331@gmail.com>
 <20260610121026.1517621-2-chenyou910331@gmail.com> <akXbk7l9bZ_W0GLR@inochi.infowork>
 <akY0kY8yWAU_J3Eu@inochi.infowork>
In-Reply-To: <akY0kY8yWAU_J3Eu@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 10 Jul 2026 16:07:38 +0800
X-Gm-Features: AVVi8Ce9_hFv5Od1y6yR0G_uNpXufYnnP2SE-D2gTTyzsrjnIVfqX1AeuRABS8I
Message-ID: <CAKspUhKriysiFhu-Jk-e1u6+GBJjMV1A5a7WgiLjf=aTgTyA_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: Add Milk-V Duo 256M board support
To: Inochi Amaoto <inochiama@gmail.com>
Cc: unicorn_wang@outlook.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Han Gao <rabenda.cn@gmail.com>, 
	Nutty Liu <liujingqi@lanxincomputing.com>, Longbin Li <looong.bin@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > IIRC the led is not controlled by the small core, so the node should
> > be described in the dts.
> ...
> So why not adding the porte?

You are right, adding the porte is the proper fix. In v3 I added the
PWR_GPIO controller node to cv180x.dtsi as a separate patch, and
restored the gpio-leds node in the board dts. Verified on the actual
board that the heartbeat LED works with the new node.

> Why you change this? Please do not touch unrelated things.

Sorry, the removal of the trailing newline was accidental. I have
dropped this unrelated change in v3.

> I guess a right copyright is needed for your code.

Fixed in v3. Since the file is derived from cv1800b-milkv-duo.dts, I
kept the original copyright and added my own.

v3 has been sent:
https://lore.kernel.org/r/20260710075917.159969-1-chenyou910331@gmail.com

Thanks for the review,
Chen-Yu

Inochi Amaoto <inochiama@gmail.com> =E6=96=BC 2026=E5=B9=B47=E6=9C=882=E6=
=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Jul 02, 2026 at 11:38:09AM +0800, Inochi Amaoto wrote:
> > On Wed, Jun 10, 2026 at 08:10:10PM +0800, Chen-Yu Yeh wrote:
> > > The Milk-V Duo 256M is a small form factor development board based on
> > > the Sophgo SG2002 SoC.
> > >
> > > This patch adds basic device tree support for the board, including:
> > > - UART console
> > > - SD/MMC controller
> > > - USB host
> > > - Onboard blue status LED (connected to PWR_GPIO[2] / porte 2)
> > >
> >
> > > Tested on actual Milk-V Duo 256M hardware, verified boot to shell and
> > > heartbeat LED functionality.
> > >
> >
> > IIRC the led is not controlled by the small core, so the node should
> > be described in the dts.
> >
> > I see the Sashiko does provide some good question, please check.
> >
> > > Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> > > ---
> > > Changes since v1:
> > > - Removed the leds node because &porte is not yet supported in cv180x=
.dtsi,
> > >   which would cause a dtc compilation error.
> > > - Retained the &usb node because it is already defined in cv180x.dtsi=
.
> > > - Cleaned up the trailing blank line in the Makefile.
> > >
>
>
> So why not adding the porte?
>
> Regards,
> Inochi
>
> > >  arch/riscv/boot/dts/sophgo/Makefile           |   3 +-
> > >  .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 108 ++++++++++++++++=
++
> > >  2 files changed, 110 insertions(+), 1 deletion(-)
> > >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.d=
ts
> > >
> > > diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dt=
s/sophgo/Makefile
> > > index 6f65526d4193..f9415c30a2c5 100644
> > > --- a/arch/riscv/boot/dts/sophgo/Makefile
> > > +++ b/arch/riscv/boot/dts/sophgo/Makefile
> > > @@ -2,7 +2,8 @@
> > >  dtb-$(CONFIG_ARCH_SOPHGO) +=3D cv1800b-milkv-duo.dtb
> > >  dtb-$(CONFIG_ARCH_SOPHGO) +=3D cv1812h-huashan-pi.dtb
> > >  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2002-licheerv-nano-b.dtb
> > > +dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2002-milkv-duo256m.dtb
> > >  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-milkv-pioneer.dtb
> > >  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-evb-v1.dtb
> > >  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-evb-v2.dtb
> > > -dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2044-sophgo-srd3-10.dtb
> > > +dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2044-sophgo-srd3-10.dtb
> > > \ No newline at end of file
> >
> >
> > Why you change this? Please do not touch unrelated things.
> >
> > > diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/ar=
ch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > > new file mode 100644
> > > index 000000000000..4cf441ab3790
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > > @@ -0,0 +1,108 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +/*
> > > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> >
> > I guess a right copyright is needed for your code.
> >
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "sg2002.dtsi"
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +
> > > +/ {
> > > +   model =3D "Milk-V Duo 256M";
> > > +   compatible =3D "milkv,duo256m", "sophgo,sg2002";
> > > +
> > > +   aliases {
> > > +           serial0 =3D &uart0;
> > > +           serial1 =3D &uart1;
> > > +           serial2 =3D &uart2;
> > > +           serial3 =3D &uart3;
> > > +           serial4 =3D &uart4;
> > > +   };
> > > +
> > > +   chosen {
> > > +           stdout-path =3D "serial0:115200n8";
> > > +   };
> > > +
> > > +   reserved-memory {
> > > +           #address-cells =3D <1>;
> > > +           #size-cells =3D <1>;
> > > +           ranges;
> > > +
> > > +           coprocessor_rtos: region@83f40000 {
> > > +                   reg =3D <0x83f40000 0xc0000>;
> > > +                   no-map;
> > > +           };
> > > +   };
> > > +};
> > > +
> > > +&osc {
> > > +   clock-frequency =3D <25000000>;
> > > +};
> > > +
> > > +&pinctrl {
> > > +   uart0_cfg: uart0-cfg {
> > > +           uart0-pins {
> > > +                   pinmux =3D <PINMUX(PIN_UART0_TX, 0)>,
> > > +                            <PINMUX(PIN_UART0_RX, 0)>;
> > > +                   bias-pull-up;
> > > +                   drive-strength-microamp =3D <10800>;
> > > +                   power-source =3D <3300>;
> > > +           };
> > > +   };
> > > +
> > > +   sdhci0_cfg: sdhci0-cfg {
> > > +           sdhci0-clk-pins {
> > > +                   pinmux =3D <PINMUX(PIN_SD0_CLK, 0)>;
> > > +                   bias-pull-up;
> > > +                   drive-strength-microamp =3D <16100>;
> > > +                   power-source =3D <3300>;
> > > +           };
> > > +
> > > +           sdhci0-cmd-pins {
> > > +                   pinmux =3D <PINMUX(PIN_SD0_CMD, 0)>;
> > > +                   bias-pull-up;
> > > +                   drive-strength-microamp =3D <10800>;
> > > +                   power-source =3D <3300>;
> > > +           };
> > > +
> > > +           sdhci0-data-pins {
> > > +                   pinmux =3D <PINMUX(PIN_SD0_D0, 0)>,
> > > +                            <PINMUX(PIN_SD0_D1, 0)>,
> > > +                            <PINMUX(PIN_SD0_D2, 0)>,
> > > +                            <PINMUX(PIN_SD0_D3, 0)>;
> > > +                   bias-pull-up;
> > > +                   drive-strength-microamp =3D <10800>;
> > > +                   power-source =3D <3300>;
> > > +           };
> > > +
> > > +           sdhci0-cd-pins {
> > > +                   pinmux =3D <PINMUX(PIN_SD0_CD, 0)>;
> > > +                   bias-pull-up;
> > > +                   drive-strength-microamp =3D <10800>;
> > > +                   power-source =3D <3300>;
> > > +           };
> > > +   };
> > > +};
> > > +
> > > +&sdhci0 {
> > > +   pinctrl-0 =3D <&sdhci0_cfg>;
> > > +   pinctrl-names =3D "default";
> > > +   status =3D "okay";
> > > +   bus-width =3D <4>;
> > > +   no-1-8-v;
> > > +   no-mmc;
> > > +   no-sdio;
> > > +   disable-wp;
> > > +};
> > > +
> > > +&uart0 {
> > > +   pinctrl-0 =3D <&uart0_cfg>;
> > > +   pinctrl-names =3D "default";
> > > +   status =3D "okay";
> > > +};
> > > +
> > > +&usb {
> > > +   dr_mode =3D "host";
> > > +   status =3D "okay";
> > > +};
> > > --
> > > 2.43.0
> > >
