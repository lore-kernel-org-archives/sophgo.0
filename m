Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B049C238C0B
	for <sophgo@lists.linux.dev>; Thu, 23 Oct 2025 21:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761254381; cv=none; b=adH2+ELqIYwpnIbmXwGOdqeETBsKDe9UAQmzNVYVbqwjcT+aqfUfNlbs7a7K9TvIQYiSCRkiffHzs9ItHjbK9ByVAQMU/+ngDlL+zduCl651g9D9r9drJQLSB/JgY4IgZ4Wda3hcjiw8QodWFLv3/LBZ8MQVSOMp4AoQ0Phpkc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761254381; c=relaxed/simple;
	bh=Ei9tWnP6+7R+pnEA92XXsitmlozCSw49trfMXT8LTVk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jRUtz6da4dJo3qbGRnpSHXfiPZNw6fyWwP2cJp8X5gOwP/o7vChiz6N11oYpjsbjPUtj3qC12rOzm4NgR+4rLB1UVC5UQvckC0ifgKOBdH2TFN9MSPCDeikPc3eXvkcYhhm6eql+LyY/bBOZv547OVXtDvzULPcEz4c57o3poqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCGhCR3G; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCGhCR3G"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b50645ecfbbso261619766b.1
        for <sophgo@lists.linux.dev>; Thu, 23 Oct 2025 14:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761254378; x=1761859178; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ei9tWnP6+7R+pnEA92XXsitmlozCSw49trfMXT8LTVk=;
        b=eCGhCR3GO//9VH2oujKmIbOzTtu/T5ux6qS3M7LO9L4MkgHhhIpm+VvEQWsbA6W1rI
         GntSfsjknrIHM2BuJX10rApMPnqAENMkNu2lIp2qWAdSAFVyVrpHRk6xWPgcC0M+GgLB
         SLNeh3LKNvC4QmaNuXq2AEEXyAEVtmlbF+m4gwTRGfEz4rWORtYactMd10HkNeKSE5jr
         8Wls+nCnPC2WWDp8Wp3Pz7j6J6KxALOO1w1aJQSRoZlktOtmBhiKwq5yZM7K3vfVLv98
         LSDM+J8K3kPKwxk91N9eNGUmzO0OAoyS3+kkPNSawlZChA0Fi1RTNm6YIdHSq7KqLkKH
         A+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761254378; x=1761859178;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ei9tWnP6+7R+pnEA92XXsitmlozCSw49trfMXT8LTVk=;
        b=tHjOgIWRUpBTTrQLNqSKPRwjsWXBFr/WXTuTwuPTCi5mJmBHOb+xfeJ19eFoKqvH66
         8zACnK8f4Fm+23Tkn3Ho7Wyn90Q/bC1pGqxYCZoSmR7YcSAE2uhOheJr5vsDXDliKmi7
         jh1HNydTCbMqkE0c5oOuqnKhEzTQxnBpvJYG3wsa8XQxRBa9y29zYXWZ58hMCH7Hu6ce
         YIx3wJxryDanLeVJvwV9G05FLEndqPUTMcipYlcFPtpx75xPbWJOZJX/J50wsLpE/ckc
         /40mEgrnn9DpUtq9t2dzXQojavA7gi+cV2Ku/M91hj58IpIWS1WO46qH9iNL0ZTudp6z
         4Kvw==
X-Forwarded-Encrypted: i=1; AJvYcCV55VlJrCSnRColM9by9K0rlBJcV2jmoacosFMKUlQZvfJgg2iT2p0QwSKjwyb2+9DNMSfnYy4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz67bN5cdozZsiokdxZ5R9YGSiLwlFqmA8nopfNKYRGVnP5vctJ
	gD1A585FAdxiHD402jaHAnL/bWq4W5gg5NyzmTLHFmJIhb21n6pZWymZBk9MrC0f
X-Gm-Gg: ASbGncssajw/9SsXbIXvjvJpAwExtfEo/ngg7fZjn+SD2zzuXfsWfSSdFyHBTgqNfq3
	YHFx5CYzDKriNONLEXlXtDEmDW8aKta2QCF4ARDAmwLj9GDJmoQ5Bjo0npHAwyiL71T1GLd23Zi
	AldzoCSeplPcQz0DLySk7lJ9y84K3rLmp97QsuQse33qGcCiOL8xRlTaYcvhH149rGPRPGJnvYA
	r+Vm1Gq21BgyjYvFVvwJqfK1+JYbNz1s/VCCo93S28greWuKdgOjKXdrbgXfma598EmLFbCGj5D
	2i1pYslMovhcW6XR4vkbHxoXOdAiklumv9cnj6vaMixBMMA5wP1MgAMUg6XAgQ3IDCXTcG8sqAG
	XDciTKhPY27c+AoS18U3H4NOUw3ntdgR93MoNYiLrZNAzoflkjb07Xh5FwcYaaIKnf/HKHXmHs9
	ukXt8JjarwNPmQG719RQFAj3lzmXY0ZF1+OyGU+LRUdACHOaM7qTZzibQf
X-Google-Smtp-Source: AGHT+IH0ilIhNZdTBWk7XhboQCM74tx7jK8m/eLziXPEBEYUaJoG0DUF30XGDfE2ZBdmNNzQKYsHEQ==
X-Received: by 2002:a17:907:9810:b0:b6d:6b56:bd7d with SMTP id a640c23a62f3a-b6d6b56c15cmr55871566b.16.1761254377896;
        Thu, 23 Oct 2025 14:19:37 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144f786sm308476866b.59.2025.10.23.14.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:19:37 -0700 (PDT)
Message-ID: <d0af71bf7db6743dfcd0c53c2eacd32c56fa5b6e.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: Add USB support for cv18xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Longbin Li <looong.bin@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang	 <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@gmail.com>, Paul Walmsley	 <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Thomas Bonnefille	 <thomas.bonnefille@bootlin.com>, Ze
 Huang <huangze@whut.edu.cn>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Thu, 23 Oct 2025 23:19:37 +0200
In-Reply-To: <20251020083838.67522-4-looong.bin@gmail.com>
References: <20251020083838.67522-1-looong.bin@gmail.com>
	 <20251020083838.67522-4-looong.bin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Longbin,

On Mon, 2025-10-20 at 16:38 +0800, Longbin Li wrote:
> Add USB controller node for cv18xx and enable it for Huashan Pi, milkv-du=
o.
>=20
> Co-authored-by: Inochi Amaoto <inochiama@gmail.com>
> Signed-off-by: Longbin Li <looong.bin@gmail.com>

Successfully tested in host mode on Milk-V Duo Module 01 EVB:

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
(please don't forget to take this tag into your v4 if it still will apply)

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts |=C2=A0 5 +++++
> =C2=A0arch/riscv/boot/dts/sophgo/cv180x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 ++++++++++++++++
> =C2=A0.../riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts |=C2=A0 5 +++++
> =C2=A0.../boot/dts/sophgo/sg2002-licheerv-nano-b.dts=C2=A0=C2=A0 |=C2=A0 =
5 +++++
> =C2=A04 files changed, 31 insertions(+)

--=20
Alexander Sverdlin.
