Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85273557E5
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 22:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768431314; cv=none; b=HLaODZP1+06D7WVZUC3/oC+uOaQN1X6e8yiUS2lgakRb3KpJSPGNJymgqAGNxJMz+5mjPeE5GFwhz4VTGcCQI+928yqfoWinK7vvH8xkEt25KxR2tTFrM/u86VhA1rrrwwnh56qxftQ37k3TC6+VmGyKvZ5az/Y37hkxRNjje6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768431314; c=relaxed/simple;
	bh=V1py82AjhxEE3vmI27KtbVxIIIMpzO9ROtiUPz6KBIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O20gGkryOpreyBn0awgZuNeEdNDoePLauTBUXO6niZR8IV7QpUfHFjdQsf5Xp3RQQEBBTIs7KdOv+SUaoeG8VuVKPSjIStrNm3cfyPCf7rexmh51/CpOIcHkRFBzny83H9shpEBLoU1biHFrTWoMNZD/VF4C3gUxs9LYyz3GMBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=sEysIDnI; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="sEysIDnI"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64472ea7d18so175053d50.2
        for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 14:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768431308; x=1769036108; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3aA2X7iGQsnnel6fRLVe4SLr2+v2d/5zouhV3Vlqcs=;
        b=sEysIDnIsz6WpOUmSicSxKOrFQft13p1iLkYprPtJcmkkau46CxfQMK4rCUqD5b3xO
         vkSNZqLl7HRJHbhTrgG472PXOv0TBCzN0/mZ0BKD2u5++NxJT5sB02qhR8H0/3dgin1x
         ZfG6xw54ekSqta56b4RKZQHZMKiIVLP04jCfpks8HVmkqV0qteMJ3VNDbV286eqGX2AP
         LuFGIWmmINY0lwA4rOIYgDaK+hODO23mz9HyBEp0PkoBxpYKf1+Oahabl0MRCK6QKxqQ
         eOudmlKBAiNy57eGQhCbTAT280WQ3yXfTGR1A5VnOUBk8sXaQsWRtfAfZm4kTl/lD+il
         L+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768431308; x=1769036108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R3aA2X7iGQsnnel6fRLVe4SLr2+v2d/5zouhV3Vlqcs=;
        b=NQ2xvP56viNK09IhkwPJyNhuzOcOnvrpVIWOJhKjcqBp4cXnEXz5smCN60CNVLfo+L
         AYyvjSJt3MiG+CS+uDx3xzpdPkz4OuxeN5ZvN5HFdU3JHpdR/QcEsWcfnEjAf1o0YJHA
         swbr4fq79HJnBMfk+P/Pi9wgxjq5Dm3FR7BljdGlHJX55QlxQ2HHRSsqU6jse080m3nQ
         ay7qwWpsowgHIGtT8kUXq1OJ14U+4sDzhALWkuGbMBMexFoYEzA/B7Mbw+4CYSip5WIn
         YpRMl2oqqfSagiwLtT30tA9P+2k0EmM/YROtQtkI3bGKHXTXVbRvpdeWqODdYHLliefv
         0oqA==
X-Forwarded-Encrypted: i=1; AJvYcCVV5NVNUY+FqUJndIjKRgsWr0bIMODzQGm0oQLrXwJPazEdwjxU+UShS/x1f5wPH20vPDg1q4Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5ta5/ixGTLzKQKKKRkcB8kPlfKbJ24x8TakLR/pt5bk4iP7z0
	m8VlGlrsTGs/YrXtV5gMuHdfbxci4EObYdnb1gKKfdP55ZTKVIB6Z07+fKWrpL5plMG/dR3vS0Y
	9lDfEeIL/MVdCT71IBqaYU7IL5nVLgpWYWpRjuldoRg==
X-Gm-Gg: AY/fxX5/grWK9JOlKMBE/xLploJ2csRCAfBa5zxL1zXMEMsa20948fRimOBJ4GK/icb
	UVpGGhd/yZgzU48dcSk+k5FTxGst0BrY/Pj2hC9eEKyUaVvpvfF3U+DCt1P4CUtewOXqdXA59lG
	9HGaAA93ZKiSSTYewa/wiuvYkSQ9k4Ybkz4PBmUY2pWMXc5b+2Wf8IQ5bATOhkskczpVHupV7RC
	xZYSXGt9hFDdbXH7WBGKYRIW9HkHWbLdTYrKVkQL0smA3DXl9YkPy/XJ7z9jNmQrBt/KpAnbNOp
	Tw2RGNVClI3Vh+dhrLsrHFxBWXWnZluB4LLdbA==
X-Received: by 2002:a05:690e:b8d:b0:644:77bb:5705 with SMTP id
 956f58d0204a3-64903b55ebbmr2982962d50.77.1768431307959; Wed, 14 Jan 2026
 14:55:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
 <20260113-adding-b-dtsi-v1-2-22d6e55d19df@riscstar.com> <20260113075339-GYA25466@gentoo.org>
 <CAH1PCMarzrZJ072iyAQthB-i-LHFCSJ+tZLx6HcWiVcUrQeafw@mail.gmail.com> <20260114-evergreen-gluten-b1c8558e7684@spud>
In-Reply-To: <20260114-evergreen-gluten-b1c8558e7684@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 06:54:57 +0800
X-Gm-Features: AZwV_Qhkxzj_Y9cwaD4tSP0GMlfoxTMZyhjGCrw4ED-TcUztP4RUDmlAh8THzag
Message-ID: <CAH1PCMZAEwO4Vg=TdZ9SR1uwm3OOw_y79iCRC+E+SZiVRNtp+w@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: Add "b" ISA extension to existing devicetrees
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 4:42=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Jan 14, 2026 at 10:33:34AM +0800, Guodong Xu wrote:
> > Hi, Conor, Yixun
> >
> > On Tue, Jan 13, 2026 at 3:53=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wro=
te:
> > >
> > > Hi Guodong,
> > >
> > >
> > > On 15:45 Tue 13 Jan     , Guodong Xu wrote:
> > > > "b" is ratified (Apr/2024) much later than its components zba/zbb/z=
bs
> > > > (Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
> > > > checking rule is now enforced, which requires that when zba, zbb, a=
nd zbs
> > > > are all specified, "b" must be added as well. Failing to do this wi=
ll
> > > > cause dtbs_check schema check warnings.
> > > >
> > > > According to uabi.rst, as a single-letter extension, "b" should be =
added
> > > > after "c" in canonical order.
> > > >
> > > > Update existing devicetree files to conform to this rule. Line bala=
ncing
> > > > is performed where needed to improve readability.
> > > >
> > > > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > > > ---
> > > >  arch/riscv/boot/dts/anlogic/dr1v90.dtsi     |   5 +-
> > > >  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++--=
------------
> > > >  arch/riscv/boot/dts/spacemit/k1.dtsi        |  32 ++--
> > > >  3 files changed, 147 insertions(+), 146 deletions(-)
> > > please have separated patch for different SoCs, so they can go via
> >
> > Understand your concern.
> >
> > > their own SoC tree.. thanks
> >
> > Conor, is it possible to take this as one patch instead?
> >
> > It fixes the same dtbs_check warnings from riscv/extensions.yaml across=
 three
> > SoCs. Keeping them together maintains readability and clear tracking, I=
MHO.
> >
> > Happy to split if needed, but wanted to check first.
>
> I'd rather you split it, sorry.

Sure, will do.
Thank you both.

BR
Guodong Xu
