Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA932F6179
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 02:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768358028; cv=none; b=Wu+6x+qt9qNgvETkjbl4rmm4QS/HckmYGTGjE5nB4qYSCJ2+DULnbUH/yaqrfwxWj5Kv82VU1BB2Z6i38ONGmRqUU77eNa21Fkz6R0LnOI4oY3ASU4d82YQXog8js8mz8AI8yBaDeaqW6zUJceeUCCexkhCvevhEjg6tJe4ujnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768358028; c=relaxed/simple;
	bh=3Y2xwxnB2VY5O7Wn7NdqLZLtOkwceaDGP163hwmg6x8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IyE+zpRGNn7MQS3b8KgYuA6wwlw9Q4QojN1AtCMA42Qw5CqNLqRqjX8cl/JH5Xw85mZ1uRuNzDOiQaBwwxpz8LvuwC/Aj51F6cpgpjxE+r0TBdiLAYO4k303V3ZlCxrKq0+d1VESOqb7AMkNgOlQ6MHJXjdM94DQkiPMQacARZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=F6LYpCb/; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="F6LYpCb/"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7927b1620ddso7635987b3.0
        for <sophgo@lists.linux.dev>; Tue, 13 Jan 2026 18:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768358025; x=1768962825; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJBLmrBE8O9239tGEOrHnRxNLRDKlAcLOjCyimagURs=;
        b=F6LYpCb/7Cui0ct3qhFYUWyzAHPYJaxn61C79Cr6/vTRXex43Y6YBiHr+gQ5JOh2U1
         dA6Wtk5L6VlNTVQP7NAOcSfGo9+bYyTVedOgHc5FQXJwjgl0q9T2JvYhPEslgvpUiKup
         yl5mWRQANyDqVoLUGgYOmnxvAldL+PAUqUsLEZENFVinlXJXs+48bjhSm5huS8+OhHW+
         OXD83gcKx+hgRMmCqwy168dZn27GHfZddnTZjtVK/4g+hdNw/caPyBpncvowq7lZLVk2
         mveutT8Ycy34d0KwQhZPOhDgZiApveXo1PeRPqWW9+EgCmvGuIrAKOO0oAqv1MKmS6Ng
         zViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768358025; x=1768962825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QJBLmrBE8O9239tGEOrHnRxNLRDKlAcLOjCyimagURs=;
        b=fxhwIxc//9UFB6u6k5s04Dk15TL08C4+iap7vqmYJxHYGhTmr/fYjJ2+kFxfjvSWhs
         NHK6kEhqF4VO1NvQ3RwaFKxWdEJfLASB4WcAfzHPd6kJAFNJTNwd9qZ+WCF/09pR+GWN
         eGSofqfyCJVkUGDkbd+LKkWirfobhm77s01KgdmjqO7XDwoYoZoxo+idJrEm1fZmCdHZ
         28AuJwE06zf1AXaLHdLVVCbtO2wAH7aAVJoOtFFl9JPyz9op65T0LHJbBc7equUcuVCw
         tn9MLOrqUdM6ZMYoP9Z52La+uluK+0T6cBgZrp5CjVa3NIW/sakS9zu376deisWLoRpG
         avgw==
X-Forwarded-Encrypted: i=1; AJvYcCVdELbY+VHVVQv3tdj/I5GrYotxYAdMb/lLOAAA2ojH1xmW64x8CjJ87Q18XuxGhRdt5Y07+vg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOt9G8K6LGnNeCrI1xHRkjoWDr3jAGi9J2U5bIcXLcoG/pVX7a
	S0kejfz5G+YopYAhVvvZqpyFjW6CSV9lvNSSf3R71LVL0WL15Pxj3N7w3nKQLfmsFbF3Lz6rN8V
	0xlXFeiqBn78SXDy7r4AJGG+Atg79hyo31J6EM+6nhQ==
X-Gm-Gg: AY/fxX5JMI2XulnRJg8JSQuOvro2d8ST4W4PftDLw5Mq1c4jGYr5Ky7zGuqp6ZqFXgJ
	ZvW4zvWbYRa6tBpTvGhcMeDZF+U0bplX5BEH7INW1NS0u1oeSiuA9vXtpwKwEuQnlpBrrwXcBgw
	VKEkd9+EqDOCgEr39czEMVoFaKMY8eny/HRM+yzlT8KTq3DDP+JX57VV5rCuOlNW1rc9eP6nWOi
	841+fVlrxB+ObvKRFT3xe/wP8F1h6f4wgFM1qlwufemO3/dsoqGfgfYtNIaH5i0+jJc0hjm0Jhu
	szYx+CGzhKZh23NyD0MH4Hdqul/x2jJqCT2Zaw==
X-Received: by 2002:a05:690e:d45:b0:63e:1563:4801 with SMTP id
 956f58d0204a3-649023ff038mr916948d50.22.1768358025225; Tue, 13 Jan 2026
 18:33:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
 <20260113-adding-b-dtsi-v1-2-22d6e55d19df@riscstar.com> <20260113075339-GYA25466@gentoo.org>
In-Reply-To: <20260113075339-GYA25466@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 14 Jan 2026 10:33:34 +0800
X-Gm-Features: AZwV_QiwlJO3ZADv09NVm7VZL0Pi5fI-J1pRA-OmeKisX5gdDwuQlnWQ0Nwjwhc
Message-ID: <CAH1PCMarzrZJ072iyAQthB-i-LHFCSJ+tZLx6HcWiVcUrQeafw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: Add "b" ISA extension to existing devicetrees
To: Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Conor, Yixun

On Tue, Jan 13, 2026 at 3:53=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>
>
> On 15:45 Tue 13 Jan     , Guodong Xu wrote:
> > "b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
> > (Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
> > checking rule is now enforced, which requires that when zba, zbb, and z=
bs
> > are all specified, "b" must be added as well. Failing to do this will
> > cause dtbs_check schema check warnings.
> >
> > According to uabi.rst, as a single-letter extension, "b" should be adde=
d
> > after "c" in canonical order.
> >
> > Update existing devicetree files to conform to this rule. Line balancin=
g
> > is performed where needed to improve readability.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  arch/riscv/boot/dts/anlogic/dr1v90.dtsi     |   5 +-
> >  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++------=
--------
> >  arch/riscv/boot/dts/spacemit/k1.dtsi        |  32 ++--
> >  3 files changed, 147 insertions(+), 146 deletions(-)
> please have separated patch for different SoCs, so they can go via

Understand your concern.

> their own SoC tree.. thanks

Conor, is it possible to take this as one patch instead?

It fixes the same dtbs_check warnings from riscv/extensions.yaml across thr=
ee
SoCs. Keeping them together maintains readability and clear tracking, IMHO.

Happy to split if needed, but wanted to check first.

Thanks,
Guodong

>
> --
> Yixun Lan (dlan)
