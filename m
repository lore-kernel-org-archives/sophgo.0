Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791700;
	b=IeQFMtp48fENLAvsXWbQQpWxZOsoWlf+2SyS4uzLONHp7Yfy8xKY01PM2o3fHEQwNmHX
	 GrMPcXIbWKEdSjlVYjH+dkAGAnR5CM3UlM56lztcKbZ1bWFsjx3+TAwHF8tE6fa9AzSx4
	 Avr1qF7XmXYGiXLW8YT4AD0NhOsYI20mZAqXvR8BmqWhGJpd/oBs89LvJ1aCZWEY3FsNl
	 unmjlqAwaDT14BWRxBKrsOv2GK8YTebC/u2KDjUKS8AY9fh4CRpQ0G2JAOzVGMixbDGXz
	 CE9oi3vatn6CqkRUdVAkicEBJpJYrI07o3S0yrXH+72M0pq6lXgKNyT7AnBelBB+A8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kaEv7R/BjRnXVDpwqhtcR9qe+ZhZ8m8cezZ42dYSI4c=;
	b=GJzoSTZrTS01U6conBLND7r1azriXwKR/SX9YbEcdTvhO0v0Hq9hjzhoR2xH/n02TZcY
	 xLUVRH0J7Icw33Y5EzpxNYk8e+WNg6HCIHhtQCYK+YpZxIQ58M4D37jtt6hg2V0bT+zvx
	 FchHvC3gZBkt5xPqNL4WWi6rcyzzRJoXeMlR3YRP7GcK4Mrn0GFAILHI0g6G4rjR1PEr7
	 iIzTAQpGp2BE5FeWBNDAOlI/af6QAXyI3fSsu7JDw6gIinX+9TPj0uWLZIrjWsYcxadH0
	 W5Fi4Ovdyk1uUvo2Ra0poepYywwx0w1TREIzMR96uT6O8vq/mtOLrZTXjbr2Wn/QQyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OsPz419G;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BFA606A324
	for <sophgo@lists.linux.dev>; Fri, 27 Nov 2026 15:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4BFA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OsPz419G
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so71464415e9.1
        for <sophgo@lists.linux.dev>; Fri, 27 Nov 2026 07:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795791698; x=1796396498; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kaEv7R/BjRnXVDpwqhtcR9qe+ZhZ8m8cezZ42dYSI4c=;
        b=OsPz419GYYtPsN9QZw/ikOKzuIlnoeHl8eFygIDgo68prfcWzG+sZpe06OWoEi55aj
         are6JvEdUYgi3hTYXsbfZSuN9rIBUMMXHnxNjQYWd9LoCGDhSmhag/V/I8IZ9Ql1MH8P
         8xOC3vAPJvN44XHf3h+2IKdsDSNSOjPV8vzNJEcVldaIGPbQs7Yi4jav2LuAhWme3aMV
         pq589npEwn2ZelhVQx7NYcOhCcJ5YIdA7OoBLtJNf+YKKW/mY4cshyttfUeaKFZuglRy
         30ZGe/T5z7rgs6/xY8buU1Qj6saXer9cV4EPd6Okk8KFMaDcN1XQj2aYexKEDLOMlpni
         hXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795791698; x=1796396498;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaEv7R/BjRnXVDpwqhtcR9qe+ZhZ8m8cezZ42dYSI4c=;
        b=oEF0kg/o9MAUn+9SZH3WwliaZhNW66shpp3FKJWb08ThenYmux8kVAw4H86bZgGCQx
         1wCDlp/n1dVGJ/AKSr4vdHqKftDDpQGc7BgvxHMfFxl8S2RGXINvDCeP7qGuHd1QNUnX
         4PEqoTD+YWHCwCrfpItzt7OxXC5toxP5TGR8ltgIXr9VBGq762DOpFZTqLfRUwPfR28L
         AND67zg9sclvBE7s/ik/xyFSAaXt0AeCy7oBeJ4c8HuX6Fm9wMqVMkFLKC4IdwX5lyRx
         0Kd0i1MVSVFP353KWULmxy/DVUMvfplWUNmVUdYTK/LSozyZeQO9w9Xz9JRoLc3qYkfu
         JgCw==
X-Forwarded-Encrypted: i=1; AL+hErHBtcqqT68hZDCbsUlvA0sVuG1zV69J19lNJsD4klE7H/Ddfz0YGkiUztF7rY83YIQkzlgpmkw=@lists.linux.dev
X-Gm-Message-State: APuU4Z+S7Y/45kf4ZyWgQaLLg9UYartjEi5CiorM55Pua1ipybebxLV9
	RLU/LJ1hhRdUSTiDijEeLwl/hAT8sP9gFaZSk9XF7pluM0fRHuAqsBahDpbYUD97o24=
X-Gm-Gg: AZFdTZcca2iesilyDglqeKSv9lUn8k1h+5Q+GKhRQE7GXaf39qzlN/foENmXuK2y47F
	FXTV2KBcaEHBlITo6CaIPXpeJDGRiUd57Ka6HS2n2wDGhcVOfPfvS1N+pMZ0r3ZzWGrPeccMUSm
	9tZoKVLFOzgZIHu0fcOSnuYJW+CJnpig3nM6cAeD92HaI/CHHOnwR4D1OE0UoiwH34oiZ3s0fR6
	Fdu4j8at9x4OfwnvYcBzFML/Mi0M60dOOBznGDrNXcGBYWcZoxyJ6KQjzWUBDitDd+aXLc726vA
	KigJIfUQxdLq/H/X/ctiCoUwfPlOrhtXLyixKt6e/Mie0J88MhlqmQZ/+DJG0NXjFxF64oxTC0u
	+nwnMosx5xj0SD8x5Z0+/D5v6vG/WluTlmAsA3PtmLYuVLkEJFd+cNKFpXZStOUgGXX58RJi9Xr
	Pvvrb3dgE1x84MSnbs3W9WoRFiG2rDQT9Y98CgYnsFPQnk22nCC1rfuAH3l1P9TROR558qr9kTH
	g1OvlRa4FdRUFbzo0ZSARqj+2PH27SFNYdp6bM9Gzu1mtbjX+teyrlY4zaB0B46T3akwQ78v8h7
	iZOuqFAFr//1ne7VprSb3mHWC+df1YVa3GoOYnyY6kuXo6lf
X-Received: by 2002:a05:600c:a086:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4bb88817ef1mr520259335e9.24.1795791696489;
        Fri, 27 Nov 2026 07:01:36 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm665457205e9.2.2026.11.27.07.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:01:35 -0800 (PST)
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] clk: sophgo: sg2042: Keep gates used by
 firmware enabled
From: Jerome Brunet <jbrunet@baylibre.com>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>, 
 Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
References: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
Date: Fri, 27 Nov 2026 16:01:32 +0100
Message-Id: <179579169278.2788166.8963233310700352675.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=zyZPxaWhtK89KOfIzTta5tnUxxcbXy33/Xi1h4W0PlQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcs/3yNEp8maMy1+r+Wm/Ebptp0Biw5cH025W9i/gED
 OfYsO/pKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwETc4xgZHr8rKXnybqH076p3
 yxfsn5W+Vc/ixMfzHLltP1bMNnr63J7hn1LOTN7jjgU/O6XVHl+sVq8PNEq9+8Pfmct9ZveT2ru
 dTAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> On Milk-V Pioneer, firmware uses I2C0 for the EFI RTC and the serial
> flash for its own image and EFI variables. Both sit behind clock gates
> shared with devices Linux drives, so runtime PM on the Linux side can
> turn them off under the firmware, and GetTime() returns EFI_NOT_READY.
> 
> Let firmware list such gates in protected-clocks on the clkgen node,
> and keep them enabled.
> 
> qcom, the only current user of protected-clocks, does not register such
> clocks at all. That would break the I2C controllers Linux uses, as the
> DesignWare driver needs the clock rate, so here they stay registered and
> are only kept on. I'm not sure this fits the intended use; suggestions
> welcome.
> 
> Tested on Milk-V Pioneer.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
> Changes in v2:
> - Drop the EFI MMIO patch, Ard is taking it through the EFI tree
> - Use protected-clocks instead of scanning reserved nodes under /soc
>   (Krzysztof)

Hey Krzysztof,

Using protected-clocks in the way proposed in this series would give it a different
behavior/meaning compared to what introduced it in Qcom:

- Qualcomm skips registering listed clocks. A consumer requesting a listed ID gets NULL.
- SG2042 still registers listed gates and marks them CLK_IS_CRITICAL.
  A consumer gets a valid clock handle, can read its rate, but releasing its enable
  reference won’t turn off the hardware gate.

Having different meaning for the same property is not ideal, is it ?
Eventually that might be something we could fold into the framework, but that can only
happen if the meaning is consistent.

IMO what they are trying to do here might be more appropriate, but Qcom was there first.
OTOH, actually registering the clock in Qcom would not be a breaking change DT wise, the driver
would start returning a handle where it would previously have returned NULL.

What is your view on this ?

-- 
Jerome

