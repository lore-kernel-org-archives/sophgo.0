Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E493C231C91
	for <sophgo@lists.linux.dev>; Fri, 28 Aug 2026 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923756; cv=pass; b=ARJw3y5MqHxH7xMQa20D/izqj68SLSOQtqPiI9FOo67+q4GDGo1N16Dif16qJF4M/ey35Wx2R3SBbCXZEjI67zPfmsRaRZRiha4wRx/gvNucoW/ZFRIUr+IaTquoGxmSTcV5FAGH7M6IX45tbluhKQ/spiJIitumA8iUtq0lejc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923756; c=relaxed/simple;
	bh=mCI7iklNQ0TyrRJOgh0VD2sQcekczqwciDl8A/HfUlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3A607dRWk885RIHi1TmkTacBKhW43M6Ihv4xEm24ZHtT/2k/lyeiDDs+57ezrWXTRX7L3nTorgU0SRcPyoxoBzDtY46Td5qAq/TwigwANcdn10fs6agSqOTIYrjJnA/t23hoSx+KDsKke3gPK4Vgw8fLbGyAH1yVMwAUhpv2Fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VgGOANRS; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VgGOANRS"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aebd7da975so124299e87.2
        for <sophgo@lists.linux.dev>; Fri, 28 Aug 2026 06:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787923753; cv=none;
        d=google.com; s=arc-20260327;
        b=duuh+DFkAFnv8tA1WChwaG7b7XR7KPL+0fXMQodrbqkA7XuL/tjWUiYrlP+a4+xY8E
         E4keI2rH5qsqd2YtZBT7Lpq6OTbWryb2JCli2LHirOpFRen/zVlaBBsdaB2Wp1tQsEN7
         aRDMX41sCgj9TkLdwCoIeg04Zd0GcSRvCnL1xTmgu6TVFg61B2yS+5K8/ua+x5DFVZWR
         sK8wQr5Egx6p1r3fHDxCOEzzLjp+N+24gtflybIAwyNAcR9AxiqfshZtaVxTcMhNLi7i
         Cjiv/I3mEgOIVfvafYADOzr/7qMchct96peXCw1asNRjOvrRJOx/2IjkknNzmNRx1lIm
         gI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oJ8E3vVRgDRYUctGG9mDCTffEyrWTB3jUW17WO1h8J8=;
        fh=jnTXlzybek0v8AMWyB72lR/JsBAbX1FiMCYG3E5LCaI=;
        b=sEJNyORdd2aCweWY2XVpXdX+d03ROzaB29sSYMZEXOjRhe/BmQd5ziJnzQrCyEG7Pw
         iqlsD6xElCjPgmHgV7Tz2qJDc2YJxTw/ihi7a/DYGTawXtqvt8O0oKd4xKW2ko/5kVzp
         UGcedSe9RI/aaBXRjbIz3Uj3DM6y6X0/RT5izcUr2qjBiOCySu1cEmON+hkriFhbE1KU
         JOsQQhF7XbiqvYd7zymAfiASMJCPeWb2LPbG/2OJnA5bI6Jwq1Uqvu4cvimk6FvQh7+N
         dplDPiTmRNg/DlSEqQUbWO1XlmbSX9WHJbg/toSDlNWKpo0xomKOXoaPnrriS21lPqAs
         qZDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787923753; x=1788528553; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oJ8E3vVRgDRYUctGG9mDCTffEyrWTB3jUW17WO1h8J8=;
        b=VgGOANRSdKO83l8tE94QtIbZljdVo/Hy88pNrcdi7bB/zHKxLvFbv56rkYq9NvVzEU
         vuQbVLcI4Iy+3EidaD0pJbCAqa30vxW9Ft4dNgPFgtnqb7TXtq/4EQxKp2ByvJo/JyUr
         A3zMR9GS5Jx8TAaz0u8jWng3dWOaxIS/VwVomkwv5tKFzsfqjFbB6WHuMw6QqfmkGXQl
         fR07x37QYRr4SHdEXtMAdZVRXlGtODaKaISFjtkzxxQsCqtcxToMEKLcS8/XNYFj6GqW
         MvZSqeYkY1xYD2JYB9yy5x1/6xWpg2vK0DjuCFjw4K+SvN8GqQnquEv1ylPdo2/6SKWl
         QKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923753; x=1788528553;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJ8E3vVRgDRYUctGG9mDCTffEyrWTB3jUW17WO1h8J8=;
        b=Tv3O/cvcHq51DWvlj4u3kWeVI0ul51ya6eGfNq6LpVKYyt3CQq1iLs3zzVUBzX0McS
         dSIUROAj/4vTr1jGhJP19BUnefd8sO/7beQ3BBnh1nx56qwtqhgYnk5/7/bm2EZLI/Po
         VRnbiroOmtGwzhW7bRH5hgLkIRchw0HjrZjQR7cEGfR7O5genvbJ5TF8njNV1Kw8SO0f
         PauBHqoaRnrK3t1gWNK3uGZgeIEbdAtHx1KBKhL1fI2sShuNsdvyeU+IxnslPn9Pazwy
         q4Cy8cqmo19Z3pLKFh17MNt6GigVyKE8ydlyDZBul2RfZrH7IOiRDMeNMDo3PfIFQ70f
         nm3A==
X-Forwarded-Encrypted: i=1; AHgh+Ro78FpzXhR6Rf4YeEnvQCXDMJ+h3gsUXbcKL7vmSR0u82q7VvnsRWM2JpyG4/FuxxaY/hE/H3k=@lists.linux.dev
X-Gm-Message-State: AFuF++kO5NcJshJlkoj2uXLBYAPzo18qp3nFxtJGbREABih0z2Z2KOJh
	OSu9rvjS6knSBuy0h7vHqzVXsS/dsl2ECSTrziKtOmF2rf0jdX+bt8x4wnm4Gr8Wqai2iPbUKhB
	G5bJpacp/esZVUYD9AOCAhW5Jzypqi8c=
X-Gm-Gg: AR+sD11jtErAr9BO3KdEX6TtSlYUyhQThH4R1OejrbIr0MZ0O4gcnyKO4/Fnb+AGveH
	UZ7McdqfTy2oVx/m+eXQ2ta6VOUKpBnbp9hh7Todj1MfodAgEseD3eSKXv6iBG6+pavmOmm0wPS
	na9SObZ3uza3C6RlDW5tO7fawvTm94+2efTjVmUnVHK9iHyNsIFyGOsBXu4lKE7gtpe8USfUUY6
	DfQNZXby+8NayfGY6T9fQjdsHjQkVuCP+NCkb1uNsUb/FslJ+ivqahU/StFGxfGhkf7pqskqvyA
	HHDwIRMvVHm2RNjm5biNW/ryMbezP93tj5q+pwqjbZt3RpIcsgbXj9TVM8esp5EP8Oq8NeBNXhP
	QJacSQ+H6qGWUXWtr1paByg11jpk=
X-Received: by 2002:a05:6512:2350:b0:5b5:e0e9:78c7 with SMTP id
 2adb3069b0e04-5b5e6b2d23amr860942e87.3.1787923752502; Fri, 28 Aug 2026
 06:29:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803163323.74414-1-chenyou910331@gmail.com> <aokFbP7wArV58T9E@inochi.infowork>
In-Reply-To: <aokFbP7wArV58T9E@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 28 Aug 2026 21:29:00 +0800
X-Gm-Features: AcwNN1Vyq3bOlIovVS7iwVPmCuDz9-szJAlLvnMYLT0vFzTw2H-zmqYHijMwS14
Message-ID: <CAKspUhJ-xxkptgSJMQUCNv4ADBJrSLOW4CzpKm8OoVy1ukT9qw@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Enable ethernet for Milk-V Duo 256M
To: Inochi Amaoto <inochiama@gmail.com>
Cc: chen.wang@linux.dev, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 22, 2026 at 10:15:XX +0800, Inochi Amaoto wrote:
> This is not acceptable, I agree with something like DT overlay for
> support external IO board to enable this. But you should not enable
> this by default. As other may want to use this as GPIO.

You are right, and I should have caught this myself -- the signals only
go to the RJ45 on the optional IO board, so enabling them in the board
DTS takes the pins away from anyone who wants them as GPIO. Thanks for
stopping it.

I will rework this as a DT overlay for v2: the board DTS keeps the GMAC
and MDIO mux disabled, and a separate .dtso enables them for the USB &
Ethernet IO board [1].

One thing before I send it: I do not have the IO board yet, which is why
v1 said link-up was unverified. I have ordered one, so v2 will come with
an actual link-up and iperf3 result rather than just "the PHY is
detected". I would rather send it tested than send it soon.

[1] https://milkv.io/docs/duo/io-board/usb-ethernet-iob

Chen-Yu

Inochi Amaoto <inochiama@gmail.com> =E6=96=BC 2026=E5=B9=B48=E6=9C=8822=E6=
=97=A5=E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8810:13=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Aug 04, 2026 at 12:33:18AM +0800, Chen-Yu Yeh wrote:
> > The SG2002 has an internal ethernet PHY, but on the Milk-V Duo 256M the
> > ethernet signals are only routed to the RJ45 connector of the optional
> > IO board.
> >
> > Enable the GMAC and the MDIO multiplexer so that the interface is usabl=
e
> > when such a board is attached.
> >
> > Tested on actual Milk-V Duo 256M hardware: the GMAC probes, the MDIO
> > multiplexer selects the internal bus and the internal EPHY is detected
> > at address 1:
> >
> >   eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]
> >
>
> > Link-up was not verified for lack of the IO board.
> >
>
> This is not acceptable, I agree with something like DT overlay for
> support external IO board to enable this. But you should not enable
> this by default. As other may want to use this as GPIO.
>
> Regards,
> Inochi
>
> > Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch=
/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > index a2797c0bd767..1462a96a1c12 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > @@ -49,6 +49,14 @@ coprocessor_rtos: region@8fe00000 {
> >       };
> >  };
> >
> > +&gmac0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&mdio {
> > +     status =3D "okay";
> > +};
> > +
> >  &osc {
> >       clock-frequency =3D <25000000>;
> >  };
> >
> > base-commit: 11881041b745b444e4f6c87a2748f1951cf02742
> > --
> > 2.43.0
> >
