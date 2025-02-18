Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C631C07E6
	for <sophgo@lists.linux.dev>; Tue, 18 Feb 2025 21:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739914898; cv=none; b=jc3I0MQ5MyY5FE1QiIOWhq+pxJ38FaKv9HlrNAZhI0kUDSzIp22i4fwQenJPFBy9eKE/0oKIbgEV31poB7iR7OuYhElxdBqhbUAXcHelwQ3oSgp38ZGr8WE8pCnNtIx8Dy6zxJaXSm+jhXpSx3968lkH5N5P/0idoVMU2LIgII8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739914898; c=relaxed/simple;
	bh=wEKLWIM7WhuzvDs0OmJhZCOq4YjUIQwdW+XwRzz9zq0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jKsJOUPEJK/okUzjM/JfQuS9bhB5Z8mVSY2jJi6mgiG2onC/wCmlBb6dmaUM4s9dnsmba4sFw5u2lG2nbUojWEHUqbbUIzSviPiFn04WaX+Tt29rGikhT5ckKg2vZHMb7xm5G5LFRNpo1YfoC7BNaTPjFdESOv2njETgE0/2Qiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Io/LhI5Z; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Io/LhI5Z"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abb8045c3f3so417772466b.2
        for <sophgo@lists.linux.dev>; Tue, 18 Feb 2025 13:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739914895; x=1740519695; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wEKLWIM7WhuzvDs0OmJhZCOq4YjUIQwdW+XwRzz9zq0=;
        b=Io/LhI5ZlZoISrqygd5tfBwy4TrYPlHUpddbIuQyQFX4Bh8ZsT1vcAoclA8A90aiCp
         Sp+UY5fafv6uHhCoJPOIrA/88cheyx/3D6qVB7wj96SKJ4hFpR/B5GigpdZAFJigSTL6
         s9KVHgxS/idrzgMJtP8+fFkzNaHA35WST5HXro4nf2os4jB5xpLtpKbfvbPuS+w01v3K
         yXkaA2GJi4AincukXRgPvj+nqWYlUK2qzq8slhZ2TZih3s2OBJbBy8UVEH5XSeC29TFe
         xEhQKGqMDSYtdAHggMwyoiPnLSEekx6KnFeTsscrkTV/IWDgUkMpmgbZ77G1oDtm1vON
         M45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739914895; x=1740519695;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wEKLWIM7WhuzvDs0OmJhZCOq4YjUIQwdW+XwRzz9zq0=;
        b=IksFf0sJP8EFWq0TP+jr2W6WfC37HapMzoXh7lHLI3tmykVg8rLP7uZ0zj9Fa7Z82/
         Z34dADhBfZo95E4/US5UOgFSgyeBCpkg0qnuHH+6pXkP7q/zvH++4SGdgcPhsRtUYPMD
         6XBZHT/WJGg9i/CbysKf/6fnegHr655IPxCeydYD/VLQUXMCWdo2kOXeyIRn5NBNahvF
         6fV7betQkOMUs9Vwm+7m4YlLTu/Sjju3ExIEIxVkWAAOpyyMv0p2j9fvliwaudD5B1s8
         fGru1/6ScUN50K/vv0pA+EdTwjNnqBOx1tWDFqqjU0ekOi0gQ1/E3C9u1JfVoi/7FS+r
         8tmA==
X-Forwarded-Encrypted: i=1; AJvYcCXalTnLV0b2F9l9cQLV9y3L+KxCs+59MW+51flq7N53p6FWneygzQvbNwzaWDDN1Myj8SCa1Pg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx98+HsoCS6DoAKyRBwvsRfzoG3Q+VFXfWqw9qyEvdhtCSHqK7O
	AkdGYuPJDMUt6qRo6K8peAFRt/Tw2BC+MnXJXTO8qSXOEOKBoVVj
X-Gm-Gg: ASbGncvwj9uzQ4UgVx5PbBxZ56lAuwrNKs+QuamgTfKK9bIxrDukdcqdcZD7+QjoeXZ
	kc5VIj7L+xByCb/LiV6Qfjtv/V6sW0sZ13e5PQ2hgyN08r2QEX+GDqrTQlabsi7Lw9qpm8ruEs9
	VdZ+EEX2YwXQtKDzAkDhFSbrOMe+WX//LbA6RatelCanOqIFZdj6xmu6eVAovMOyGtgHfxb5bTV
	pudCkNFaJoyPdzCwE8r48oTSlcsIIDLQO2/10R9lH1/v6uIPy/5uhkuSf9ql09cWn+7K4UoG0jW
	xcCTz3lHrtXeySUkE4sm7UiEOXBEGuhu
X-Google-Smtp-Source: AGHT+IHHb8GeU/8JhO+vNaBQwr2sw1st/JNpCes5WtD0KiFGhQvkwv+8yF1w78raF7zZTDGCQAOj3Q==
X-Received: by 2002:a17:906:f591:b0:ab7:d77b:43b2 with SMTP id a640c23a62f3a-abbccebaca6mr136457466b.33.1739914894615;
        Tue, 18 Feb 2025 13:41:34 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9751553fsm493858866b.86.2025.02.18.13.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:41:34 -0800 (PST)
Message-ID: <03302dcb85408facaee075dfdc6cd72a4fddcc59.camel@gmail.com>
Subject: Re: [PATCH RFC] dt-bindings: rtc: sophgo: add RTC support for
 Sophgo CV1800 series SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen
 Wang	 <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Tue, 18 Feb 2025 22:41:31 +0100
In-Reply-To: <20250218210630.GA872024-robh@kernel.org>
References: <20250216180924.2506416-1-alexander.sverdlin@gmail.com>
	 <20250218210630.GA872024-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Thank you for your feedback Rob!

On Tue, 2025-02-18 at 15:06 -0600, Rob Herring wrote:
> > QUESTION:
> >=20
> > I'm unsure about reg properties in the subnodes (child devices) of
> > RTCSYS:
> > - they will not be used anyway by the drivers because they genuinely
> > overlap (the whole point of going MFD) -- therefore the drivers will do
> > syscon_node_to_regmap(pdev->dev.parent->of_node)
> > - as I understood from the history of MFD dt bindings' submissions, reg=
s
> > are encouraged, if can be specified
> > - overlapping regs cause dt_binding_check warnings:
> > Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtcsys.example.dts=
:34.19-39.15: Warning (unique_unit_address_if_enabled): /example-0/rtcsys@5=
025000/mcu@0: duplicate unit-address (also used in
> > node /example-0/rtcsys@5025000/pmu@0)
> > Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtcsys.example.dts=
:34.19-39.15: Warning (unique_unit_address_if_enabled): /example-0/rtcsys@5=
025000/mcu@0: duplicate unit-address (also used in
> > node /example-0/rtcsys@5025000/rtc@0)
> >=20
> > Shall I remove the MMIO resources from the actual devices or rather ign=
ore the warnings?
>=20
> Ignore the warnings is not an option.
>=20
> Removing makes since if the registers and bitfields are completely mixed=
=20
> up. If they are, then I find it hard to believe the child nodes are=20
> separate blocks. And if they aren't, then it should all be just 1 node.=
=20

The HW vendor calls it "RTC". But this "RTC" is also responsible for the
whole power sequencing and [chip-wide] power management. And afterwards
they've put SRAM controller registers and remoteproc (independent 8051 core=
)
controller into the same address space (interleaved). I have hard times
to apply any strict logic here.

> You don't have to have child nodes to have separate drivers.

But if I don't utilize "simple-mfd" and children nodes, then I'd need
some MFD core driver registering the "cells" even though, there will be
no other functions in it?

On the other hand, maybe this is the way forward if we are unsure as
of now, which cells do we want to implement at all as a separate driver
and which ones are we going to combine in a single driver?..

> > =C2=A0 .../bindings/mfd/sophgo,cv1800b-rtcsys.yaml=C2=A0=C2=A0 | 222 ++=
++++++++++++++++
> > =C2=A0 1 file changed, 222 insertions(+)
> > =C2=A0 create mode 100644 Documentation/devicetree/bindings/mfd/sophgo,=
cv1800b-rtcsys.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtcsy=
s.yaml b/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtcsys.yaml
> > new file mode 100644
> > index 000000000000..2dc7c2df15c1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtcsys.yaml
> > @@ -0,0 +1,222 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/sophgo,cv1800b-rtcsys.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Cvitek CV18xx/Sophgo SG200x Real Time Clock module
> > +
> > +maintainers:
> > +=C2=A0 - Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > +=C2=A0 - sophgo@lists.linux.dev
> > +
> > +description:
> > +=C2=A0 The RTC (Real Time Clock) is an independently powered module in=
 the chip. It
> > +=C2=A0 contains a 32KHz oscillator and a Power-On-Reset (POR) sub-modu=
le, which can
> > +=C2=A0 be used for time display and scheduled alarm produce. In additi=
on, the
> > +=C2=A0 hardware state machine provides triggering and timing control f=
or chip
> > +=C2=A0 power-on, power-off and reset.
> > +
> > +=C2=A0 Furthermore, the 8051 subsystem is located within RTCSYS and is=
 independently
> > +=C2=A0 powered. System software can use the 8051 to manage wake condit=
ions and wake
> > +=C2=A0 the system while the system is asleep, and communicate with ext=
ernal devices
> > +=C2=A0 through peripheral controllers.
> > +
> > +=C2=A0 Technical Reference Manual available at
> > +=C2=A0=C2=A0=C2=A0 https://github.com/sophgo/sophgo-doc/releases/downl=
oad/sg2000-trm-v1.01/sg2000_trm_en.pdf
> > +

[...]

>=20
> > +=C2=A0 "^sram@[0-9a-f]+$":
> > +=C2=A0=C2=A0=C2=A0 type: object
> > +=C2=A0=C2=A0=C2=A0 additionalProperties: false
> > +
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Provide 2KB of SRAM, which can host sof=
tware code or temporary data.
> > +
> > +=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 - sophgo,cv1800b-rtc-sram
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0=C2=A0=C2=A0 required:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - compatible
> > +
> > +required:
> > +=C2=A0 - compatible
> > +=C2=A0 - reg
> > +=C2=A0 - "#address-cells"
> > +=C2=A0 - "#size-cells"
> > +=C2=A0 - ranges
> > +
> > +additionalProperties:
> > +=C2=A0 type: object
> > +
> > +examples:
> > +=C2=A0 - |
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/clock/sophgo,cv1800.h>
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +=C2=A0=C2=A0=C2=A0 rtcsys@5025000 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "sophgo,cv18=
00b-rtcsys", "simple-mfd", "syscon";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x5025000 0x2000>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <1>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ranges =3D <0 0x5025000 0x2=
000>;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mcu@0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 com=
patible =3D "sophgo,cv1800b-rtc-dw8051";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg=
 =3D <0x0 0x1000>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clo=
cks =3D <&clk CLK_SRC_RTC_SYS_0>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sra=
m =3D <&rtc_sram>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmu@0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 com=
patible =3D "sophgo,cv1800b-rtc-pmu";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg=
 =3D <0x0 0x2000>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int=
errupts =3D <18 IRQ_TYPE_LEVEL_HIGH>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 <19 IRQ_TYPE_LEVEL_HIGH>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int=
errupt-names =3D "longpress", "vbat";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc@0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 com=
patible =3D "sophgo,cv1800b-rtc";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg=
 =3D <0 0x2000>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int=
errupts =3D <17 IRQ_TYPE_LEVEL_HIGH>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int=
errupt-names =3D "alarm";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clo=
cks =3D <&clk CLK_RTC_25M>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc_sram: sram@0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 com=
patible =3D "sophgo,cv1800b-rtc-sram";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg=
 =3D <0x0 0x1000>;
>=20
> How does the SRAM overlap registers?

Those are not SRAM cells mapped into this address space,
but rather several control registers controlling reset,
power and clock of the SRAM.

--=20
Alexander Sverdlin.

