Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5942A36215B
	for <sophgo@lists.linux.dev>; Tue, 21 Apr 2026 16:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787891; cv=pass; b=oiTTnOJYDclc/saqo/qziZ0e/3DjdeXyyxQoHB5MOKVsndVlv4AYjII5BMcgQsc2mOBa5r5LJWNfmIALBQ0rfBtLY69NGmRCmOmWAIBZSXjWT5i2DsiTaAxcq56bbGFO5fCYlb5qdoS6L3gUxHenOB1ZEIN8jilrpH5AsL4YiSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787891; c=relaxed/simple;
	bh=23fmHe/a2B9RZiflbb2UW/w++uvf3lhAjUE/+MLJ2OY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSjx90srPP4jdv42Yy7ODAIb0Yg2SynoOHYj10K63e/uniYhJPVbkwQ/wPF3mfR23/oHa0PskGFcHT5J0jc7/KJjJ/K8irPuqiNKOHS+b0fK8e5dJP3ZtEZ5VwEVP8OkiD+Aany4zoUZZS7nR/dnlZIeL3g0pWM3w9FP21vJr0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZ2LGv25; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZ2LGv25"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-466ec4c6846so1387914b6e.3
        for <sophgo@lists.linux.dev>; Tue, 21 Apr 2026 09:11:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776787889; cv=none;
        d=google.com; s=arc-20240605;
        b=Mhs3EdVDAO1JNmCCrR69/QxjV/akLLDiIWE50xxBrB8CAt2QbqYMQbk9PZ3Uy95Ifb
         TtXnfpQzE7TnaRQXh4ypuo1D9PQeBpfHRCHHptaeNrnLJ1CYdpQrLDqcrXbT7HAvyFKl
         vI8Z8oqe4wxl4hoN9OcFTBRXbluVo6ri0enS1Vk/jFE9eoUGt66pl1Rtfe9cw5KwPzuw
         Sq077y5AJTI8lczWBWX6304gAzjr6A01r6PP7mG3pfddOnft/OJ0k/JWkmX1BbqzYGlg
         WRD4T6MRoaYbSrpucZTlKuqykOy2hSKRWHZbqtOuUEoElsj7+41C+Zr5KCnyaZzZ8gtA
         w72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jInUirkrCYPP8V5B2fobD/SlWrNOrVioJ83jqBg/g2U=;
        fh=4R2yOSO2L6NEC6YLBqZCHrU9LyO+lLOKkmdp0afHYhw=;
        b=NXRokDvTIxsMdAUx6iUfoDVKHBJ9RgM1UHV6NQSFuSZYBF/7b4hQuJNaMiQsP0Ql3G
         oK1DyZZKn7zCu1aw6Jl4CMFeWem16UeDxu/emXHTeQGHTtmNklhDXqCdx/Svgd0yeZkM
         t6HE1XcMPDlgnITthP3NR12ouW0df4Cp5tsW6yYtASkIUFIx764DEM9AQ8NeNrLiSXKp
         q3nawPr45x+EEzwAnIoYX4r7Z49nxWxBpRapw3dcuaa08taO2QaZsSMXNLFAQPxm5H67
         uVXpKoi8hYkvmhKGNd+LIVTDKk/CYk1ncFqhKlZ7nx2+aD9Htaq20SH6P2E2lHuyVtKy
         Bvzw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776787889; x=1777392689; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jInUirkrCYPP8V5B2fobD/SlWrNOrVioJ83jqBg/g2U=;
        b=bZ2LGv252gpV8bA/gWO7OxeV0gwgG67tjRMnXgpoW8jCCpmtag0lhOy4sNNhSjZZsd
         ddKMNh/TmXS5rxqTNKeQJvjIw7u1iZJlefR2VvcFFwQvLTtgJYKo0T7fdKrg3e2j7/3C
         1Cjo5ZcsjS08rkDggY4EYvcbAMkmHXmAOHNvK2in91XVgG/MCT4I+VGroRuPCAxBrleh
         m7UxGDJ2DyGQ2lbOD1Kk/Ff6m4vmvDM+xxdEQXifngLNEcwrFK9HoW1sQiXbuH0LAqj8
         TaLU18O7WtdAilux98Aqimq9gaV0GyRyZ49fNzuk4wc/FrVmExn+MQCmoHCKVidfXg2q
         HN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787889; x=1777392689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jInUirkrCYPP8V5B2fobD/SlWrNOrVioJ83jqBg/g2U=;
        b=X0EFapntiQ4/2xcNj2YiqzURtNAwwq5RWpRgLETA5DYU0G6Tt8qLNhPYn3QxnarfR7
         m2B01JJkVJPBT4XsH5dHQxg+ppqcfkeiYc2JKF5ugJFbngs1MJgCEqnsadXWr8Bs06T3
         AFpN0EotHh470SXQMIDXNBQJsM6Leolq+nfc8oBocUTPjozi3LQvYIoTUzp4ES7UWs+C
         5pt8+9CMP1XFXappvg8C4LEGo+H7b7NjGxB87Qg/sGaff3zfAp1iRRaDJTUhHensTIgY
         BY/axSiHpCktsK/+lFLDittbpfU/GlAQcD0yezsFn9nH54TnZIWuoW7JFgxSaz7Vpeui
         ghtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6QWSFc7xu+cw+tBB1dUPsXAPUPWSJmySdRHYeL3Wbh+P3NUqVWYR18Rc0Jec4Eg6ewadC7cw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc5iFSUKrbmA+cIcmMaPEnbZy8WPqLmdHbKqpEMQjLTFe9xLva
	b3BbVuG+MGLPtyXtmikBwJTlUv+690dNAQLpfYl+sg2lBpAFlgkb0Afa52ACp7hSwQmuFlsuSth
	1zn0xK3lyEF57jug6NH6HtYbtIrBTOvI=
X-Gm-Gg: AeBDiet47v2r95gQkkZsKCm44GaqawDRLfU9gsRyfYM0RGMwIa/PFWAuNPIvMPbs2Wt
	q5wUpsQ5F9+WPuBc+J/6G2zqPzSgRqjZ+EmbdNkp66k0q95RQorUHToUe8nv5sAVhmz5GVpihwd
	FmXa316xN7dMdU+We+lZEyfvnc4zZ7mNhk8Su7PUqHU/87ms9RG3tBykV1A+qpg32jy7kYAcnOZ
	vP8TvtwgK91vTdZ+fSpUukfQFRXxVz3LOLr1yYcxRCrz6hZyNsfdh1AYhtmOHUf93s0/GZsRnC2
	VvFnw58ePXG0r35RJbSfGKTML0gwYz1mSyV0VPsKWw+pyc/47vrhRQk04e7qOw5/rUIyiwUlXqY
	dr93QfuTghEYkA18S4TEXiTniZ4Vskoot7KQx2Jzz
X-Received: by 2002:a05:6808:198c:b0:45f:481c:e258 with SMTP id
 5614622812f47-4799c97f030mr7889576b6e.16.1776787889137; Tue, 21 Apr 2026
 09:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260403111516.379795-1-josh.milas@gmail.com> <20260403111516.379795-5-josh.milas@gmail.com>
In-Reply-To: <20260403111516.379795-5-josh.milas@gmail.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 22 Apr 2026 00:11:17 +0800
X-Gm-Features: AQROBzBlh98NyBlEmbYmzw7vICUUUiwt5WFp1mPUvyil0G8EdaRkcbgAdW60Bs0
Message-ID: <CALbr=Lau_7eRDP5HCh5dQ5aXumvGKkNS4fX68d2CJp9ZjNxzDA@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] riscv64: dts: sophgo: add SG2000 dtsi
To: Joshua Milas <josh.milas@gmail.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pjw@kernel.org, samuel.holland@sifive.com, unicorn_wang@outlook.com, 
	inochiama@gmail.com, daniel.lezcano@linaro.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com, 
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org, 
	chao.wei@sophgo.com, anup@brainfault.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, michael.opdenacker@rootcommit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 7:16=E2=80=AFPM Joshua Milas <josh.milas@gmail.com> =
wrote:
>
> Adds sg2000.dtsi on the RISCV side.
>
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>

Tested-by: Gui-Dong Han <hanguidong02@gmail.com>
Reviewed-by: Gui-Dong Han <hanguidong02@gmail.com>

> ---
>  arch/riscv/boot/dts/sophgo/sg2000.dtsi | 53 ++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2000.dtsi b/arch/riscv/boot/dts=
/sophgo/sg2000.dtsi
> new file mode 100644
> index 0000000000000..412adacc00576
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +#define SOC_PERIPHERAL_IRQ(nr) ((nr) + 16)
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
> +#include "cv180x-cpus.dtsi"
> +#include "cv180x.dtsi"
> +#include "cv181x.dtsi"
> +
> +/ {
> +       compatible =3D "sophgo,sg2000";
> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x80000000 0x10000000>;
> +       };
> +
> +       soc {
> +               interrupt-parent =3D <&plic>;
> +               dma-noncoherent;
> +
> +               pinctrl: pinctrl@3001000 {
> +                       compatible =3D "sophgo,sg2000-pinctrl";
> +                       reg =3D <0x03001000 0x1000>,
> +                             <0x05027000 0x1000>;
> +                       reg-names =3D "sys", "rtc";
> +               };
> +
> +               clk: clock-controller@3002000 {
> +                       compatible =3D "sophgo,sg2000-clk";
> +                       reg =3D <0x03002000 0x1000>;
> +                       clocks =3D <&osc>;
> +                       #clock-cells =3D <1>;
> +               };
> +
> +               plic: interrupt-controller@70000000 {
> +                       compatible =3D "sophgo,sg2000-plic", "thead,c900-=
plic";
> +                       reg =3D <0x70000000 0x4000000>;
> +                       interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_i=
ntc 9>;
> +                       interrupt-controller;
> +                       #address-cells =3D <0>;
> +                       #interrupt-cells =3D <2>;
> +                       riscv,ndev =3D <101>;
> +               };
> +
> +               clint: timer@74000000 {
> +                       compatible =3D "sophgo,sg2000-clint", "thead,c900=
-clint";
> +                       reg =3D <0x74000000 0x10000>;
> +                       interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_in=
tc 7>;
> +               };
> +       };
> +};
> --
> 2.53.0
>
