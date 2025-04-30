Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619451411DE
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 15:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026359; cv=none; b=Y5qlqnxpUUdsQVWMQDhBAdEhlkkB7LpeirXa1VCztH+QhwR6UtLNRnWojXqVdQxDAJZswGr3oOrfhAIxysAdH0SLGYuTVK94dR2CzfCBXbERCOadhF8AcJYMLGP69n+BAj4HLE65u8M2i0USMtCl5JMswQoowjydV5EVo+5lxG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026359; c=relaxed/simple;
	bh=S5c1usZQ21dQ4MFmT+Y0rgDHI5e8haxjXHW3GmOhQVg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LAobTu0t4IZZFhPNzr42UQeFrKbQQ+bMxX8s4p6wHLas/ugTRiwV8VQw79BNBavpQB0ma3gc+SQyA92w2FgfGAp53QuWCIveraaGdL10qcgJRsGK984XmkOfY7gPQKadXsKlW3Kq4D+sJWWkSQVqyjcoj3/yXWcJH7iCVX1JlGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b91xhiOu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b91xhiOu"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43690d4605dso57332715e9.0
        for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 08:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746026356; x=1746631156; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S5c1usZQ21dQ4MFmT+Y0rgDHI5e8haxjXHW3GmOhQVg=;
        b=b91xhiOu5ikiSuKrNyKj3/Te4tDrXF0MYYff5EPsNhL3aZNz4x6AnZ0ZCyhG7s+cHK
         Iixhd2SReI34kW6d5gubHrOaD8Eo+Vk3sK6+RSBTM4ADJXHdrVbv6akgNhfu6jr9vmtQ
         VKkvx0c9T/PbtVc9f0MdTDgpAlF3Y7kdamzkwxG8INi3Ev5nbIxwSElf4SNuCO3Va1og
         ziQG/ICcfIbLa8yFJU+KF5WsKJMpvVMrGijSu+8ye/s6mmgKLltAZJIdq14aNDYuoHYQ
         qseHik2GONnYoe+kfd92H2JMxF9EMssw/6EYIoMBTMs3OeGDkJ4i4ite0Gf5ipSio/+j
         SZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026356; x=1746631156;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S5c1usZQ21dQ4MFmT+Y0rgDHI5e8haxjXHW3GmOhQVg=;
        b=M5rTcMUhlyfd2vv9yl4zFTXCdvvu2Ep5tHhIIP1F3ZhRaIVsRwAokdp5d8H5j1/hq1
         iP5pDMHfppzRIRk5A38DpOR4nC3YzDQMZk4pienxgjddYZfioQ0K9WHaPRBVQniDN+ts
         ocSZcSpdbb+0KnKUP0jLh8vBvGU+z/hts9GsnhbXSf8sU8COQTxXZHvRnG2dDdNotN7l
         NyCohYcEeIAYNa+DzjExVJxjXxpUZm/aNXTpY/5B7bhm3YBgF/031RzdOz3pasKhTAnW
         wYbA/QNamRzqio0tuOsGaY9/m995zkR9otDBPekGBPf+wW/eVjZWHt9xhSrWe5FTeAuG
         pfLg==
X-Forwarded-Encrypted: i=1; AJvYcCW03jeNCXkavXcst6Esc3FW7/WadSiC/UX2ExGj44smxuSjJq4TpT12a+1ML6Q/tV5pIAWvmuw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTxxM/0CFGaFl8SJfgD4Ny/sozFEsN/aUSSvDE3w283UpQSWAR
	MmVgEUbK9qkd6knt2FscSBnGYBFK67fUnYjE0zJfzZXMovVYesr3
X-Gm-Gg: ASbGncveJKeTOoKxJRblwCD08f1wXOBmGCsy7NOx2l54iywPAW8LYwZW4JbEBIxcnP/
	jkumDiNPiLI4Bv/g89CD9wiBRrudWHyZJJrPRJCGAmE8CtZ74Ljhq1whb6yNOJy42oJfcCwNoXK
	ZWrIjhC/2VuuaPE6iiiMuyr9CtGNhPBVSMMy7Re57b+txz8M0biwFaCFA5P8Ieh6KLQX07V6o4s
	VaHN01PIyafmP0dKQ/QEUMtFU1srxZzzkGUCjWxoP+Ep3Y0X1fG1jHy+TXPALdsppPyZO0wPi08
	8uL0lwL7rW5A/sXYXpsO99NQHeEPh6YoJpiErgUuMouEJyi8zGn/Bb6nuLtOkSqLg7eVL9U=
X-Google-Smtp-Source: AGHT+IFmefUVJ6/gagwWms/2NhJFqSEeEmwPNox/ehYzux4BtgClLHXr43p5sjL1gtcn7wjV25ZOiw==
X-Received: by 2002:a5d:588f:0:b0:3a0:8070:8af8 with SMTP id ffacd0b85a97d-3a08ff3755dmr2980301f8f.18.1746026355424;
        Wed, 30 Apr 2025 08:19:15 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca42cdsm17020431f8f.22.2025.04.30.08.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 08:19:15 -0700 (PDT)
Message-ID: <94f4bbd9dbf4da9c056f90dff3028e45a659c8ac.camel@gmail.com>
Subject: Re: [PATCH 1/4] riscv: dts: sophgo: Move all soc specific device
 into soc dtsi file
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley	 <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Chen Wang	 <unicorn_wang@outlook.com>, Thomas
 Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, Yixun Lan
 <dlan@gentoo.org>,  Longbin Li <looong.bin@gmail.com>
Date: Wed, 30 Apr 2025 17:19:16 +0200
In-Reply-To: <20250430012654.235830-2-inochiama@gmail.com>
References: <20250430012654.235830-1-inochiama@gmail.com>
	 <20250430012654.235830-2-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Inochi!

On Wed, 2025-04-30 at 09:26 +0800, Inochi Amaoto wrote:
> Although the cv1800b/cv1812h/sg2000/sg2002 share most peripherals,
> some basic peripherals, like clock, pinctrl, clint and plint, are
> not shared. These are caused by not only historical reason (plic,
> clint), but also the fact the device is not the same (clock, pinctrl).
>=20
> It is good to override device compatible when the soc number is small,
> but now it is a burden for maintenance, and it is kind of annoyed to
> explain why using override. So it is time to move this out of the
> common peripheral header.
>=20
> Move all soc related peripherla device from common peripheral header
> to the soc specific header to get rid of most compatible override.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 38 +++++++++++++++++-----=
---
> =C2=A0arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 38 +++++++++++++++++-----=
---
> =C2=A0arch/riscv/boot/dts/sophgo/cv18xx.dtsi=C2=A0 | 22 --------------
> =C2=A0arch/riscv/boot/dts/sophgo/sg2002.dtsi=C2=A0 | 38 +++++++++++++++++=
--------
> =C2=A04 files changed, 78 insertions(+), 58 deletions(-)

--=20
Alexander Sverdlin.
