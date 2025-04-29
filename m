Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944D9254864;
	Tue, 29 Apr 2025 19:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953862; cv=none; b=h73Hah5y6y9EUQkLrEfL2tOuu68fROwBdzcAbOmdiCbOCR7fHQhh42DzxwQE282nluDKXGMSUzsLEqKx42/KEYfeLcq6JfvvqoC1sx4TdaFihfAl6x0W/B4Ek3TrWhZ/YeT/l0S8ygToIpRGoIboX7P0gXEltESR/hOQ6C6eR7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953862; c=relaxed/simple;
	bh=OD4Lo67S9frh/bFzs0ODT/uCFExNx9+MNFdXvKnz0+s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SyBip7fsxPcMyGNOuWAu0e+uyzUzghj7x0rPMoGn/OjXCt+GnJ7n5auzdJhBgCGDVkHSHVGVtinaGcjXccALb+KMUmSMjRAMakBR47YihG2nsWraW6gYO6GHj/bZWEeld4yALH3QAD1Vcv7+AxvamvYfeJi6Z73kfBm5cedhvK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOgL58fh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOgL58fh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso29885605e9.3;
        Tue, 29 Apr 2025 12:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745953859; x=1746558659; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OD4Lo67S9frh/bFzs0ODT/uCFExNx9+MNFdXvKnz0+s=;
        b=hOgL58fh6NJiVaZNoIsPg8qEch4QYDW3XKJAOsaYGjYX3Eo9cNeMFhDS9jV50sdrLh
         nQ9/WggTcyfZjLEUmV6xsc4eGAi5BeDIpBM0bfnbvkQYApfzmRi6tz9eDrLTIdoZpBz6
         N1cumUUMTD2fB9DwLHlEVg2I5+Jv7hohuUVS+5dLgjohG3lHHtLR5xt+jqhzZmhd9oJy
         teYPIvQZwbk65gj6JDA0i46lh90hZt/kKPc+0emZNfMXsNKVvioifmC/vBNPlS8MNR8C
         nGJ+KfD0V0XmPyChlN/+QezMxnKOOZprhCdd3FLprdwTaOkhyVm8FdA5VxPhHX6FswMD
         t6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953859; x=1746558659;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OD4Lo67S9frh/bFzs0ODT/uCFExNx9+MNFdXvKnz0+s=;
        b=Tc9qyl1N4WbiWpY8ceFy6JQ+rB7nyyAQmfRg+X5ID12PaBYyODxezfFsTRtvj22VNR
         0QPw90SDAujUmJk3Uket+Rywn8fs289lzeGWpcMjjYxYnyWRP4+vvowS1xlonCiAhxNm
         39hHJoed1CUPc8B2GGoBD8gWSzoft/srfBYpnMcdkVoNOtXfYM5rjnXSp5bTEwvodiiZ
         fgEOkuLwhFG7ts0o0INaAD/qCpDz3a1f+7rHH3SskN3TqCpi8+UMMQ8a2ONfP2b+Uwdm
         8iixpZPI8zucRLzaLkYum3phXMhg1BAFB76Bep3gm4uTfqTwXaHPN52/P7qZbI1sWMiR
         Q0jQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7I/5vob5xeNeq7T9H/LExWJnByDUx9eWdciSbIpKKdVe52gLDojgluh71sslRlpuCMIk=@lists.linux.dev, AJvYcCW9AoxcrrEejRd/Ew/77g1jH57qSPKRg+Dl6AXVgqMzjAb+2XtW1GXJsV7NlTVpmazVQo+Is7ye@lists.linux.dev
X-Gm-Message-State: AOJu0YwVphlh+P5Gan2p8B1de3gkNOEebbf4JJooMDBZ1vOKD78upuiI
	yKj67j544DwNgsZlfkgDF68X2uHsi9SNBP9SdU+nab4n2fjp4HG3
X-Gm-Gg: ASbGncv7PUSgRRfGLi72pYys4teqE16OyonXH6JTfHqrOAcBhmj6BSBaCSbQhGmJPiu
	Gt852CcNR+kO3Hj8FZVbIlGEy4HjxXpp0Yn0mDky6AEfHdCryT+j+GuO27ltmjDH+7fBdcfDjyR
	JzWMWQRR94D7+ZULQHsLuAai4CUCoQfTmhPZkmXb4YeVRhYMG7GuALiHSA3w6npGrWqPkV/X+oU
	W8OUg9bZuZN35PwBBIA4T6JYtrC0qLLoN3uOQSnCXK0OOMXKpK6GNXwazHaWT8GzIwBQ6Rgl+90
	pOZQ0McRxMZQDCF8I16OK9cx3L0UbkU0UPj6D6+cfdD6ssvNW/QxthFnoA7x
X-Google-Smtp-Source: AGHT+IFDM8GNhhU5MZTnxhWi/Kr9STxCFjfV24N4ph+Q2bcawdkL0CkLdq/mOuAXOM7SHwbKD72ZOA==
X-Received: by 2002:a05:600c:3b88:b0:43c:f597:d584 with SMTP id 5b1f17b1804b1-441b1f60890mr3087145e9.29.1745953858483;
        Tue, 29 Apr 2025 12:10:58 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cc180bsm14985601f8f.53.2025.04.29.12.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 12:10:58 -0700 (PDT)
Message-ID: <70bc994b1e79c8d0d4c0010611c2e65042cff74f.camel@gmail.com>
Subject: Re: [PATCH v5 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, 
	soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Jisheng Zhang
 <jszhang@kernel.org>,  Haylen Chu <heylenay@outlook.com>, Chao Wei
 <chao.wei@sophgo.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 29 Apr 2025 21:10:57 +0200
In-Reply-To: <6wlgfvc3rkhv4s3ou67fjl6j4a26vocqck5727cg6muxlz2erj@kivndcjcqc7m>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
	 <20250316185640.3750873-2-alexander.sverdlin@gmail.com>
	 <6wlgfvc3rkhv4s3ou67fjl6j4a26vocqck5727cg6muxlz2erj@kivndcjcqc7m>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Inochi,

On Tue, 2025-04-29 at 06:35 +0800, Inochi Amaoto wrote:
> > Make the peripheral device tree re-usable on ARM64 platform by moving C=
PU
> > core and interrupt controllers' parts into new cv18xx-cpu.dtsi and
> > cv18xx-intc.dtsi.
> >=20
> > Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nuberin=
g
> > into "plic" interrupt-controller numbering.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> > Changelog:
> > v5:
> > v4:
> > - cleanups dropped
> > - cv18xx-cpu-intc.dtsi instead of cv18xx-cpu.dtsi+cv18xx-intc.dtsi
> > v3:
> > - &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint node=
s
> > were moved into cv18xx-intc.dtsi to reduce code duplication;
> > v2:
> > - instead of carving out peripherals' part, carve out ARCH-specifics (C=
PU
> > core, interrupt controllers) and spread them among 3 SoC .dtsi files wh=
ich
> > included cv18xx.dtsi;
> > - define a label for the "soc" node and use it in the newly introduced =
DTs;
> >=20
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv1800b.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 5 +
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv1812h.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 5 +
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv181x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0 .../boot/dts/sophgo/cv18xx-cpu-intc.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 54 +++++++++++
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 91 +++++--------------
> > =C2=A0 arch/riscv/boot/dts/sophgo/sg2002.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +
> > =C2=A0 6 files changed, 93 insertions(+), 69 deletions(-)
> > =C2=A0 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dt=
si
> >=20
>=20
> It is a hard time for now to do some change across the cv18xx=20
> series, and it has become a mess. Due to the fact, I think it
> is time to do some work like split some device (clk, pinctrl,
> plic, intc) from cv18xx.dtsi to avoid override, and make room
> for arm64 device.
>=20
> Since this change contains some change similar to this patch.=20
> Would you mind me to take content of this patch, and add you
> as the a co-author?

thanks for looking into this!
Either way is good for me!

--=20
Alexander Sverdlin.
