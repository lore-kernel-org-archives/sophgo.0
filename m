Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C31F2DFF04
	for <sophgo@lists.linux.dev>; Tue, 21 Apr 2026 16:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788054; cv=pass; b=AhV6KGx8r7R4w/2o3zDFNYcr/4GO6knhjJTFv3K4d+ZEM5xtPCqCaQ8UGnZsLV1jOceehz6zdjRCFIsgmRHq3xyfLEQJN54wjAXg+euTXIy+jFz7batYm9Uvm9yQwYaWOy2uTMpMo/xkw7sshHCUupRlyVTSkuV4mMvyUijFmLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788054; c=relaxed/simple;
	bh=7gVeWo4+oY4Q0kqA2hOQ1OQ3rgGg0MyfM78M7xgQgbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJ2+faLqt+etvFcA6UBfxl4IsguKF+Jwz94+uRUj3iD+AvadrVAReMftNH2vypSJNuPj8CL9JcZ638tklxx7kA6A/E2AgWPnfMeIoY5sCdmF5ZA0/LLJDR+tixhpFJPwyYeY2hljfBhrkUjC4wulBk/c0AakirQvQrPkbwiQLZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cs+WTt0a; arc=pass smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cs+WTt0a"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-479d593a0c3so1595178b6e.0
        for <sophgo@lists.linux.dev>; Tue, 21 Apr 2026 09:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776788051; cv=none;
        d=google.com; s=arc-20240605;
        b=OwYmGHf+MvhAVCTcbp70LBDwSyTOCWMgoDjWsliLpVgdAQTGEal/vTb7b/YsFHmGcn
         IDwmEn4W9LW5FY+WMgW7375UCGsKqmDu8OI44voKezVyM59PxhQW1ZVo/FbML/snjJMv
         9PqhTd5y7FgtsdoCNB2fkqhKVAasEMPGzFs0iDOk4PU7ckUUZIBAhytWsiIXa19miFUF
         GPJ7xCkRkAOE26Ii/AtyGYGa/ceAr2l36rCEq2VKz6wtaJDLTiv2fyv/vcm2fUM1U7Ro
         wjWs89IDRMYRn/kxY3CjsgVK5Fbt/agLeUcgLTlc5ltT1fCuWTFX7FWT48xDKevpiY1r
         C4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PoH5cen/vhOZ0DzwkKLECtpXsvLoy+/ZJjPSwZrY7fU=;
        fh=n7Unjd7qXartYf3xC8yPDwWHq3ougNH1GSY4LYpwRMc=;
        b=fhJjp6nJyKl+xjyFX3sZ7QrS3M1RzyQA9BpvdBRS3gzbWG4T7FKvZoiHnR8vZOBs6q
         WSggSlHM4FM0ffkIPvi4fCx6CgInhaUlmmrMJDTFjDYQfFWfPxi3XFf5VPJMpwVlRBdM
         1pED1DNUrlBzaqkJkj+ztawLSZkjpvpphCYOdCDTlnCW+2BinQMm+OBSohNmidIhyLHu
         /dlVZ5s99omtbyoh805a/BA3onqyIOCHqEMrGtHPbEyFMAx2HrEmhYLV8St8fFI+iJlo
         p1YecxGs2sD12jrfZG05IX16q98EpRa4Ha2sMBdCruZdKpK7cg9VGNBCGkDZfoAjlLq8
         sCGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776788051; x=1777392851; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoH5cen/vhOZ0DzwkKLECtpXsvLoy+/ZJjPSwZrY7fU=;
        b=Cs+WTt0agQOxvgX7LHmvZSij0UeNGHqKeFO3Xd8vBwaKR23zXEp4plDr0Q3rF8afKH
         e63LGU8+Ops8gyctyrtjwrSoqpvVO4HLIJ/c9tHosr1aET+5qYb/G6Vw7jR93AnJrGdr
         tCyy/c6xx7+/jycNCeJze7VaIIjw/17gpGlY7hL5lQINFt4yOl0yaX/TnnTGImLj1iFi
         FttnRuALAvLfpRtzYVK3sus9p5/Ax1yTQ4/s+q9XN6eeI7upR71i3oEl3fCPQkdoJc7x
         OKPr7sIYh8x0NxycGPqd1AmEi7A/QYpyeYejw4yYHAbFbyioDkAfsb/wgzJMMhbrKONs
         0L4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776788051; x=1777392851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PoH5cen/vhOZ0DzwkKLECtpXsvLoy+/ZJjPSwZrY7fU=;
        b=Nx8sjdTtz7iWIj0+Hg+uhnCXCjkXpDgy5bRMhHUKJXQZN7vaeCnwHbhRMdGB0p9pFF
         WhwDG3tlFHiDlyCeN4oYPU8YaUnxXStCZ9Vm8wEjChJ1H74gx0hD13RwAXe26WaoCHzE
         f/BFb6xPgAIZRYSawLRNxuvopMocfx7eCWyIuEjonQyklTuB+a36V/guXSH2b6mhfvU2
         2ScqQj+OyWbbGD09KcguaiErzz/lfIwcY/cZXK8Vz6gW+fErSzfx8jS5UDeq6wgrBKKk
         R7Ql3bO9vLOQ8OSLUgvWrznwYZZ3u9etD0bFQ7SvmeeFz57F2JQXv7c1+dRfG6dPCa00
         P9Dw==
X-Forwarded-Encrypted: i=1; AFNElJ/08T51kcrhQSEJeHweX54PS+7q2E7rwPC61lzT5yIycV3Xf4zgiIvhzPdoTtQSaDBFQKWusV4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9N9ZoVEJwtTWf1+oD1dN7UbQn2kiZiRhWkc3bUOeZMBpJxhpO
	2RaTqcP44FFUpq1yOe+0w3b0KV9SxD11rq4aTShkjj3NRsDuHV25irCZRfCOFWdd71gD3G354eL
	6orSBrR0Y6MSQKY6FIo3CLGyT50anj7Q=
X-Gm-Gg: AeBDies0FRrn4EbW/4+sFgWiv/zVZm0c9QIVcofZqKFcht9iieep9hPVZ5JTH9i/3Gd
	tW6QvXMSMoGr3n/vmw+RorZ9GqtKHic40dihj0uFJ3kWTGtULfDEQeJBc2fr0zyhQ45q/Bsgmk2
	q3vrTK2khgJ8PyXfNt+iQmTYAp5L/brnZJt8cUEsJAZUkU6PSKvw3mxCdgwmuoMcW+cxfXe/sJ7
	YNS+wrhrgH+Kti6+Bs3i1qFX/IhrKnWLzNtnY3a+eh3b4aG9vf5ZDZhAFzalCo7vGRUMtI+PU35
	YTcNGRbX4bRlUJlE6PkXwBA5KqqV9SH5BTtszPJ1/NS3kQ8+UoSmjVWnlSC0vklmuM4FNaSHKhU
	OiTa/2Bo0jvNtB+sr1B86SzNba1Jyxhkeej1mhgg6
X-Received: by 2002:a05:6808:e68b:b0:479:e826:ccdd with SMTP id
 5614622812f47-479e826d1c3mr2175511b6e.5.1776788051231; Tue, 21 Apr 2026
 09:14:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260403111516.379795-1-josh.milas@gmail.com> <20260403111516.379795-6-josh.milas@gmail.com>
In-Reply-To: <20260403111516.379795-6-josh.milas@gmail.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 22 Apr 2026 00:13:57 +0800
X-Gm-Features: AQROBzBBI72CSkLDmiqtls647M6PwNy4PB7CMyuLTU7f5ccTrkmAadBqQHw2l3A
Message-ID: <CALbr=LYJKJREwh8KMqsgcXwd+jx0W7gFFFuBk-izNdgzkQU6Pg@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] riscv64: dts: sophgo: add initial Milk-V Duo S
 board support
To: Joshua Milas <josh.milas@gmail.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pjw@kernel.org, samuel.holland@sifive.com, unicorn_wang@outlook.com, 
	inochiama@gmail.com, daniel.lezcano@linaro.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com, 
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org, 
	chao.wei@sophgo.com, anup@brainfault.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, michael.opdenacker@rootcommit.com, 
	Wang Jiayue <akaieurus@gmail.com>, Yao Zi <me@ziyao.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 7:16=E2=80=AFPM Joshua Milas <josh.milas@gmail.com> =
wrote:
>
> This adds initial riscv support for the Milk-V Duo S board
> [1] making it possible to boot Linux to the command line.
>
> Link: https://milkv.io/duo-s [1]
>
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>

Great work, thanks Joshua! I really like this board.

I encountered the same issue Michael Opdenacker saw in v4, but
enabling the MDIO-related configs resolved it.

I'll keep using and testing this series and provide further feedback
if anything comes up. Next, I plan to test the arm64 side and will
also try developing an efuse driver.

Tested-by: Gui-Dong Han <hanguidong02@gmail.com>
Reviewed-by: Gui-Dong Han <hanguidong02@gmail.com>

> ---
>  arch/riscv/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
>  2 files changed, 86 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
>
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/so=
phgo/Makefile
> index 6f65526d4193b..58cc6b70d8de4 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D cv1800b-milkv-duo.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D cv1812h-huashan-pi.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2000-milkv-duo-s.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2002-licheerv-nano-b.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-milkv-pioneer.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-evb-v1.dtb
> diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/ris=
cv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> new file mode 100644
> index 0000000000000..8632470f43ab0
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +
> +#include "sg2000.dtsi"
> +
> +/ {
> +       model =3D "Milk-V Duo S";
> +       compatible =3D "milkv,duo-s", "sophgo,sg2000";
> +
> +       aliases {
> +               i2c4 =3D &i2c4;
> +               mmc0 =3D &sdhci0;
> +               serial0 =3D &uart0;
> +               spi3 =3D &spi3;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0:115200n8";
> +       };
> +};
> +
> +&osc {
> +       clock-frequency =3D <25000000>;
> +};
> +
> +&dmac {
> +       status =3D "okay";
> +};
> +
> +&emmc {
> +       bus-width =3D <4>;
> +       no-1-8-v;
> +       cap-mmc-hw-reset;
> +       no-sd;
> +       no-sdio;
> +       non-removable;
> +       status =3D "okay";
> +};
> +
> +&gmac0 {
> +       status =3D "okay";
> +};
> +
> +&i2c4 {
> +       status =3D "okay";
> +};
> +
> +&mdio {
> +       status =3D "okay";
> +};
> +
> +&saradc {
> +       status =3D "okay";
> +};
> +
> +&sdhci0 {
> +       bus-width =3D <4>;
> +       no-1-8-v;
> +       disable-wp;
> +       status =3D "okay";
> +};
> +
> +&sdhci1 {
> +       bus-width =3D <4>;
> +       cap-sdio-irq;
> +       no-mmc;
> +       no-sd;
> +       non-removable;
> +       status =3D "okay";
> +};
> +
> +&spi3 {
> +       status =3D "okay";
> +};
> +
> +&uart0 {
> +       status =3D "okay";
> +};
> +
> +&usb {
> +       dr_mode =3D "host";
> +       status =3D "okay";
> +};
> +
> --
> 2.53.0
>
