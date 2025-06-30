Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79551F463E
	for <sophgo@lists.linux.dev>; Mon, 30 Jun 2025 21:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751317718; cv=none; b=sDG9EUhYiY3aweKZVF5zLsbRQ8JCGwNprktzUucwvsPxNbzbwZHkaykXrJ/70ZqJ5dU2E92UIJN+4s0OwkjoOtZPdzw76MTMYY/WwI+GMZu7lgN3mpeVmEfuOPhZhux+dVXw1CGnT+t+fcI+luizk6FJJBBCJjdVHFxyP3cAlaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751317718; c=relaxed/simple;
	bh=OUl/v3cYQErZetR+gHR3HfERW6jdMX2f9V629iiowzk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O/fvJccIuRGbNE4bfetHbK4PgHVFBHTEZn88TYh1d+qetBzgnyYX2EX/O4XZ3yW6wELNq2u/77f/QaqIREwfWkQAG4m08Ze+c0J0Gs5Sn9kxJauzGwIzUFtLZNtKR8w80aF+r8O21Cv3hbbXd7UJjmHMifCMeDGjqGMgOq/5yDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enRyLyYp; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enRyLyYp"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so9410670a12.2
        for <sophgo@lists.linux.dev>; Mon, 30 Jun 2025 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751317715; x=1751922515; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DfEAu4Z4aidz8WUdebCSoWtL+Ka/H89FRK6NQIVtr3U=;
        b=enRyLyYpwR+6nQxa7ZKISqIJitt1MPOxAPJqqgpIbmwuuvgCU17nbk4y9Oml/ALQnD
         dR3wD7Y+otLCsIQZQ6SiAfJv3lcHpHSeu6QAUfGToBjT5I0Pr5pVRt6He/OUDtU9ITiz
         o/gn/FJMMA5jYZBx7eZSuMAX5VYz9rgoiu92mCJ4VgLEFFiKypLbEks2pb+M+LmrhuDn
         SWN2V96NG6q33u0dmY+QnzG1gdR1ubJ9lzKGnY4Os+ZvMjgLbewUhfj1KZv0B64nnTTR
         W9iuGHKJ4Gzi2KiMzsMeBvpWYXS5wxo9Armzhp6q/u7WiJIugwBCeAXEyxMEkiy3+4qj
         cD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751317715; x=1751922515;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DfEAu4Z4aidz8WUdebCSoWtL+Ka/H89FRK6NQIVtr3U=;
        b=JkjKHf4U6FHxhyTCPu4kditgxPviGYRjLC+EgtAyx2/L+tGSNwHlTBvTnqcoiVZ+1Y
         AQ2FSaxTQMvNoCc5z+ldLrxGj1H6f5dfH9IDuIIKF7Kfe2ESJk7jvxeuZKlb2MJ/rOpu
         3uF0QwFURDVcGT77H6TwVAD8S0GDbFjjcFFbWrfiEGNKsdux1zP44IuImaYM5zG+mGgN
         HiSJF4FvBVQBzLCPqXht/AX9JlnE6KCZK2kHQ+BL9sYWaEDtuv/aMlTfIgGkE7dSxRIf
         DfDZvhvv1kbMGQEjcpoNK1pBSzb7Fdkkz6akMRyAWx1AjVV3eR16Js2AI0TgzBkr5Ecr
         8Suw==
X-Forwarded-Encrypted: i=1; AJvYcCV5ZEW+oQmgVX53Zu3wvkoNdK7qzY5Ain25KZkxNsYhZ+clJW7R+5VjUERAnk2g38fxG1X96/0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ/A99iSRZ6OOQ2CL/kG0P8aNAMAeIKVr8k6uLocUU9RYydpSY
	rcRbrXz6N1qbGhTWLYFEcv4PwimmXSznH1vhB37Dcek0gKjSz0A08zf/
X-Gm-Gg: ASbGncsFEkX2fd3wqYQzbSg8EwjpaQYYuxDUsSAZbmxCIAwRyvitpJribxT/yCWrIIN
	4Lz/ml5c1MPY+/k+uW4rnZYiCEh3nsYJuwtOAu93kvXjawnl13pIFqzyFP2DFUuVIMjUYCktZ1z
	C1EdMe7TgN1AhwOcvAwWhaHgDlYdpWhjSJDcesv7nM8VeahpxYQdg2jktS7QQUo9BXXSf8EyIB3
	3TpgiUe05zyXtrP1qfd6E0GFNNqbfRuEF1OXzCQ7Tq0/yDXJgbQ/tqu8cCYBW5T7z+mGfkArGPs
	53YfsCuZYeI7WiFFZL3hlyawDnEEpKb5HWXReAz7x2tgoB0BuD43hpX1ld+ZbLtwJ2kRm6tKqoK
	DoGvwUw==
X-Google-Smtp-Source: AGHT+IFiNDi56K5x37KH9GR/A8jMN8Z9TvqTUcjmru8/4qInJ8CfMFwW3ZXy8hbURvxLCUDm+/aZcw==
X-Received: by 2002:a05:6402:3586:b0:608:66a3:fec with SMTP id 4fb4d7f45d1cf-60c88b3453bmr13656712a12.2.1751317714969;
        Mon, 30 Jun 2025 14:08:34 -0700 (PDT)
Received: from giga-mm-8.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831ccc90sm6200391a12.56.2025.06.30.14.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:08:34 -0700 (PDT)
Message-ID: <b8e37f3b89209f6674b0419ec28e0302de6b3c4e.camel@gmail.com>
Subject: Re: [PATCH net-next 2/2] net: mdio-mux: Add MDIO mux driver for
 Sophgo CV1800 SoCs
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Yixun Lan	 <dlan@gentoo.org>, Longbin Li
 <looong.bin@gmail.com>
Date: Mon, 30 Jun 2025 23:08:37 +0200
In-Reply-To: <20250611080228.1166090-3-inochiama@gmail.com>
References: <20250611080228.1166090-1-inochiama@gmail.com>
	 <20250611080228.1166090-3-inochiama@gmail.com>
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

On Wed, 2025-06-11 at 16:02 +0800, Inochi Amaoto wrote:
> Add device driver for the mux driver for Sophgo CV18XX/SG200X
> series SoCs.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
> =C2=A0drivers/net/mdio/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +++
> =C2=A0drivers/net/mdio/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/net/mdio/mdio-mux-cv1800b.c | 119 +++++++++++++++++++++++++=
+++
> =C2=A03 files changed, 130 insertions(+)
> =C2=A0create mode 100644 drivers/net/mdio/mdio-mux-cv1800b.c
>=20
> diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
> index 7db40aaa079d..fe553016b77d 100644
> --- a/drivers/net/mdio/Kconfig
> +++ b/drivers/net/mdio/Kconfig
> @@ -278,5 +278,15 @@ config MDIO_BUS_MUX_MMIOREG
> =C2=A0
> =C2=A0	=C2=A0 Currently, only 8/16/32 bits registers are supported.
> =C2=A0
> +config MDIO_BUS_MUX_SOPHGO_CV1800B
> +	tristate "Sophgo CV1800 MDIO multiplexer driver"
> +	depends on ARCH_SOPHGO || COMPILE_TEST
> +	depends on OF_MDIO && HAS_IOMEM
> +	select MDIO_BUS_MUX
> +	default m if ARCH_SOPHGO
> +	help
> +	=C2=A0 This module provides a driver for the MDIO multiplexer/glue of
> +	=C2=A0 the Sophgo CV1800 series SoC. The multiplexer connects either
> +	=C2=A0 the external or the internal MDIO bus to the parent bus.
> =C2=A0
> =C2=A0endif
> diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
> index c23778e73890..a67be2abc343 100644
> --- a/drivers/net/mdio/Makefile
> +++ b/drivers/net/mdio/Makefile
> @@ -33,3 +33,4 @@ obj-$(CONFIG_MDIO_BUS_MUX_MESON_G12A)	+=3D mdio-mux-mes=
on-g12a.o
> =C2=A0obj-$(CONFIG_MDIO_BUS_MUX_MESON_GXL)	+=3D mdio-mux-meson-gxl.o
> =C2=A0obj-$(CONFIG_MDIO_BUS_MUX_MMIOREG)=C2=A0	+=3D mdio-mux-mmioreg.o
> =C2=A0obj-$(CONFIG_MDIO_BUS_MUX_MULTIPLEXER)=C2=A0	+=3D mdio-mux-multiple=
xer.o
> +obj-$(CONFIG_MDIO_BUS_MUX_SOPHGO_CV1800B) +=3D mdio-mux-cv1800b.o
> diff --git a/drivers/net/mdio/mdio-mux-cv1800b.c b/drivers/net/mdio/mdio-=
mux-cv1800b.c
> new file mode 100644
> index 000000000000..6c69e83c3dcd
> --- /dev/null
> +++ b/drivers/net/mdio/mdio-mux-cv1800b.c
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Sophgo CV1800 MDIO multiplexer driver
> + *
> + * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/mdio-mux.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#define EPHY_PAGE_SELECT		0x07c
> +#define EPHY_CTRL			0x800
> +#define EPHY_REG_SELECT			0x804
> +
> +#define EPHY_PAGE_SELECT_SRC		GENMASK(12, 8)
> +
> +#define EPHY_CTRL_ANALOG_SHUTDOWN	BIT(0)
> +#define EPHY_CTRL_USE_EXTPHY		BIT(7)
> +#define EPHY_CTRL_PHYMODE		BIT(8)
> +#define EPHY_CTRL_PHYMODE_SMI_RMII	1
> +#define EPHY_CTRL_EXTPHY_ID		GENMASK(15, 11)
> +
> +#define EPHY_REG_SELECT_MDIO		0
> +#define EPHY_REG_SELECT_APB		1
> +
> +#define CV1800B_MDIO_INTERNAL_ID	1
> +#define CV1800B_MDIO_EXTERNAL_ID	0
> +
> +struct cv1800b_mdio_mux {
> +	void __iomem *regs;
> +	void *mux_handle;
> +};
> +
> +static int cv1800b_enable_mdio(struct cv1800b_mdio_mux *mdmux, bool inte=
rnal_phy)
> +{
> +	u32 val;
> +
> +	val =3D readl(mdmux->regs + EPHY_CTRL);
> +
> +	if (internal_phy)
> +		val &=3D ~EPHY_CTRL_USE_EXTPHY;
> +	else
> +		val |=3D EPHY_CTRL_USE_EXTPHY;
> +
> +	writel(val, mdmux->regs + EPHY_CTRL);
> +
> +	writel(EPHY_REG_SELECT_MDIO, mdmux->regs + EPHY_REG_SELECT);
> +
> +	return 0;
> +}

Seems that it actually doesn't multiplex the buses? As seen on SG2000:

# mdio mdio_mux-0.0
 DEV      PHY-ID  LINK
0x00  0x00435649  up
0x01  0x00435649  up
0x02  0x00000000  down
...
# mdio mdio_mux-0.1
 DEV      PHY-ID  LINK
0x00  0x00435649  up
0x01  0x00435649  up
...

The single internal PHY appears on two addresses (0 and 1) and on both buse=
s.
Maybe it just switches the external MDIO master on/off?
Seems that we need the documentation for this thing ;-)

BTW, above LINK up is unfortunately without any cable attached...

--=20
Alexander Sverdlin.
