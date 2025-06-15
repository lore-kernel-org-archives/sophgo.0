Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534A327A124
	for <sophgo@lists.linux.dev>; Sun, 15 Jun 2025 15:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750001924; cv=none; b=eGc0pZjsV+VTrMRC07txtP/cSiiKnhRZ+SqmGXrEc+a6izYIuNXbVrsgV2FfS5wXAAyzLg7wse+kOk59z/TXpsqyx2c5fl3RBtgEt45m/CWe9pZc4tP3RC5r50Jazrd4/V8eJQI7KfzMP+dFp8h+uyseDRK5IIqS/3zKXjlF0fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750001924; c=relaxed/simple;
	bh=Pfeuuw3IsnDBW2D5UO9BFg1ySfLGBBquA323G6W4mEI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lpWx9qnVXU1/5OFTizl7PeyFga85IQKJKYlJhQeAKZZQDEGHbD0iT7DvPy24VGO8aDo0cyeY4G9k2Mt0XAhuRuXvBYK17akJ0nN1xkNs9OjrJUkCnxDJVlEqTC5r/mSpxBGjeohWffuvP6phriEUhRhVZjRs2UYRp4O7GInEY5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLu8g+cJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLu8g+cJ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so44496245e9.1
        for <sophgo@lists.linux.dev>; Sun, 15 Jun 2025 08:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750001920; x=1750606720; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4w6ojSVvxCZBkFChAR2nLk88h1Twoyfnt00LPkC7ZcE=;
        b=SLu8g+cJkkbJawPkQIsBreJG0j4sOBfIOvZH+DgUgYlBeL4+MtvBAhn54sAtS8asLX
         uSJ9bi7B275g7/k8OpwY891B0vK3wiIYRAjRss8yw/7EeZrv0b9ydTC2jeIoxLb3iEqZ
         hOEtA/A6ZEIPoewKNepGQRcN4kq3nS5ZVc7Mo0lpJvjAV9iKnwObcVhOCGQ1awWUqtqA
         GfD4enBPKkPnRIgHzOwwwm6Z/2NeQDLAjlczt6zYG9LNWsQ6ReO8ojtUXPzFRulWM7f6
         85MptNsj/GgSfX8ndgj4L3ccT0ZyvQtyS51HZGa1tq2KJkyOTN2ODMQSz9+H+7Ez1Lby
         YGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750001920; x=1750606720;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4w6ojSVvxCZBkFChAR2nLk88h1Twoyfnt00LPkC7ZcE=;
        b=g9Je5uduZqi/XvL7wCy1ze2XVbMt+0YrZkwg5GXeQen0WqBqF7alx/JPf2ChdST8Uv
         j5KiOi7mLeMSm4idRyg+HlxV3cb+uN8qfuXDPqCw0l2XCMHo2hAl7wSKNATdJjoNFlqP
         idCgYnRUURJHMnYuuhtF6a1xAUvBA+b87mFRm+R5psTkW6HPq8up2RluQL+HtrmARMFs
         4iiK4Kq2149nkeDkIu7eR76XtfRvi/7mvsfW5BgExm26rvAha+/PSt4FrvVogsvW0YWH
         MeLFvzwPeRjFpq2oE6H7/VhFeg6oUD9ztwBvDP30bZXfGcIADNBShsYkYb4EdVbvOy4G
         5Vgw==
X-Forwarded-Encrypted: i=1; AJvYcCUnUd03LCfoRBmJg1B+yCrwhjsrkn5CtTin/bE1D+NyNc7hSFiHPTIrvoZVnDTR6/bO4/U7nSM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1wo4ImXHEXk2wZTQpoVN6xX6MYCStFo6rpl9nCvzDTaiYvTXX
	V9E4wxyXrdUQs8oFBA183Me+Zh5lnAWLgdD9PHUj28yznqW3WixNT/FU
X-Gm-Gg: ASbGnct4Kw1UReoermB9oWmEwQj6s4emRmp6jJYyc8UjZZeDWT4pqVa6KjbXZ7xXqfG
	3kqhy2saHkukrFAjuvJuvWPGhNtRHX/qI5F/JfUR10k6/pIt+sEa0LRDSIOGT57wozLQ1Bsrykh
	/ddrOXlmP/bAuS6hWtaOWfnAji4/oSlUcqVAehEQzl5N63I4trUJjRx/F67hXzUYp3ZMKSyWRsj
	RfXjlEEyXI0nRwYuJzUSmtY5rTehk368XjIZZ7u8ff9x1tYla+jjvpKlcNQ3gru7AHGnZTtV9wr
	WMCaNYO9S8JPd+cMRxg+TaJn3G8Xe9suGyBPAVfNat/fmYh86TRNQUwOUgWOCaU5U842QRvtpIE
	FM7HNvw==
X-Google-Smtp-Source: AGHT+IGoVcAhO+1NBubftFooLD3lc7sYs3mbVA5mxnraWLvf7WIREXdSgu30kDJRwmw5ULOGEm+IRA==
X-Received: by 2002:a05:600c:3584:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-4533cac908fmr58103055e9.30.1750001920409;
        Sun, 15 Jun 2025 08:38:40 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c4b1sm114934925e9.2.2025.06.15.08.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 08:38:39 -0700 (PDT)
Message-ID: <5478c3df766079f4139ba1dfffa2f938ab4a9259.camel@gmail.com>
Subject: Re: [PATCH RFC 3/3] riscv: dts: sophgo: Add USB support for cv18xx
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
Date: Sun, 15 Jun 2025 17:38:52 +0200
In-Reply-To: <20250611082452.1218817-4-inochiama@gmail.com>
References: <20250611082452.1218817-1-inochiama@gmail.com>
	 <20250611082452.1218817-4-inochiama@gmail.com>
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
> Add USB controller node for cv18xx and enable it for Huashan Pi.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Successfully tested in host mode on Milk-V Duo Module 01 EVB:

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv180x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++++++++++++++
> =C2=A0arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts |=C2=A0 4 ++++
> =C2=A02 files changed, 18 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts=
/sophgo/cv180x.dtsi
> index 65eceaa5d2f8..3ea3a1af103f 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -428,5 +428,19 @@ dmac: dma-controller@4330000 {
> =C2=A0			snps,data-width =3D <2>;
> =C2=A0			status =3D "disabled";
> =C2=A0		};
> +
> +		usb: usb@4340000 {
> +			compatible =3D "sophgo,cv1800-usb";
> +			reg =3D <0x04340000 0x10000>;
> +			clocks =3D <&clk CLK_AXI4_USB>, <&clk CLK_APB_USB>;
> +			clock-names =3D "otg", "utmi";
> +			g-np-tx-fifo-size =3D <32>;
> +			g-rx-fifo-size =3D <536>;
> +			g-tx-fifo-size =3D <768 512 512 384 128 128>;
> +			interrupts =3D <SOC_PERIPHERAL_IRQ(14) IRQ_TYPE_LEVEL_HIGH>;
> +			phys =3D <&usbphy>;
> +			phy-names =3D "usb2-phy";
> +			status =3D "disabled";
> +		};

--=20
Alexander Sverdlin.
