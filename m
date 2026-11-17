Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920257;
	b=ybjsbYh16D4oBBv3HK2OF7UmxbkfAJUMrXgB37kzuaJ0Qs3Ik+xqqMtL3uhXjOw/6aOQ
	 4Xk0jHoZYjCHy1nsOONo3sRfArVpXLlh/taYKFU2tLi3AGPDJ15u5PYx4i9yb0SL/G+kD
	 573Ks570c3gbKUPf0q1CmRLg7oWTPX7Oceg78EkF8dbsZfUmR9+1pd16eG6JFwNPAbo6Q
	 1DwAnIWhhY1k947Vt8wP2d6QC/1DLjNv77mrma+NdaUZZsqcln/fmGRMOzFcYwYwH9swv
	 DdJjHbEo1NrgyK9IKF8g055ez4/qY7aJ56f9h36sfzVqfeJvg4DkJyB/WgNWX3DxILQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=cwQPpTaL2c/wj1OEDa9qNdi880oheLkZqVlpuujln18=;
	b=AEzpXs+meCcSLcvPS1iQvNVQlQsPqfANv7LVeATItAL5Nm8Aj9JGpQKV0VZcrUgmEmLK
	 r9Q5VIfeTj9FUb05yRUbdeMIvsjSEEMQ/c1jJrMTR3WTfY77mvxh2r2v4po7WLmlAx9pf
	 NS9UMlghpucNwPGWYwOuipiP7R3qYYB3aB1qhkdqbOf9zSot2YlUPuSKjGhXhp5RruleP
	 M3+6nIbWCn1PUi67n2VOu/Z1Fz/h37vpleiSHGpNz9maoz6wNy2UOdNq/DpcszQaITpjQ
	 YvUgghJkWH3J8C/mtxgR7nHlJJJtwpBtSDXaIRull0N+mLbpfOvUplxfUFRxDUgulUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oU4eUmxR;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C74606A330
	for <sophgo@lists.linux.dev>; Tue, 17 Nov 2026 12:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66C74606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oU4eUmxR
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-380b40319bdso2137923eec.1
        for <sophgo@lists.linux.dev>; Tue, 17 Nov 2026 04:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794920255; x=1795525055; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cwQPpTaL2c/wj1OEDa9qNdi880oheLkZqVlpuujln18=;
        b=oU4eUmxR8bRZK9JFXiHEUgTAIX1rn/LOYPZhjEu+pUAs5nC+tXBlKLT1s3QQKPS8QM
         73wiOK29gMcOXPtCrhb5pU7kDS42mb/YNRvy581unL29QVF8AgO9wSQdmsIo0a++XfBJ
         +8XXIVeNKfNkjskDfbhfBb6h+CUszTFwAV9IA/W73xO1lKlPF73cB2NCJyQhu0/K1NYm
         go9Ijtko2EEqkXNO8zoVTloSAKzbOAFp5t9kig+fzJ1ZxJ2WwyITls6wpRM3WQYWY52R
         XK56n7lksAVOKXmipJmX0f5/xag3Jm3DewA3hkqa24/VbG/uJ4S31tLmJWaEdksLwsh/
         7IDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920255; x=1795525055;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cwQPpTaL2c/wj1OEDa9qNdi880oheLkZqVlpuujln18=;
        b=eS5ucVBuj8OZ16n/FgXCYjknqM0UVv/Zvzefm2KV6/NNU/ff5/gLnjBPnPauzQ0cY5
         3MinG/RU6QCgfQeaMj16DAXizpkPFenZ8K7I3eIErYvCKv5RFGIL/F5ylL2dcSlvgnA1
         wO+rGNqk4gE8dPKPdH76r947eVGsPx4eVQzFzqXzukuC04K3GneTSDlYjmph69jzqZjh
         VUiC0YDPYLOFsGyOLQSw5O7lDdV2a0i7gS0iRzEqsZclo3zFMrBsaNm+NyZSLvcTrVKL
         OAHj1oJGjDiroEq0EJGG9s6bBSqpVsZcEDqHDTquVb9yrBvRP3XOGwcSpGI3BQ2bjIhA
         zZZw==
X-Forwarded-Encrypted: i=1; AL+hErEwXyZ3ydH5CJTPFWVdneCsZz0wc0UBEPhbO1SSk9RI3ARlwNQ5WaSfY6RJfGaDukSppjHxX4E=@lists.linux.dev
X-Gm-Message-State: APuU4Z8DIvcUvZHQj4aCIKs4sINvCLgrDag8vu86eZDQjbAbqhpkjZQt
	m9Tn/kSzgTSiy4Bxb4LMiUrILTSOWxXSz5ds+zeebNbi1vwqnglIq38Czczf+I88tZ0=
X-Gm-Gg: AZFdTZcd/hmOh92VBxU6bYNHkQ1ZKW9f+4PPCF3wNg7qXjenoHsElMrPl1nPLDjLjzU
	5cjKj4ER1K+HHCtxlve23s1Yzb81BuaRj0ouEgHm5if/cT932DTdcL8zeG1QxhK89TSaqVfk5D3
	96ho66KNuU7ikJ+i1QpaRjYuffNuLHcbzz49Xm+dHsFbm807PWrs40ZRHQOAGwzLdfeYNH/OBkM
	x/WTB1dNOHxzAhKBDhD7UPNY3nKkx36LxwWvNcfIiqJUj5scczK17mRiA5Y41X3g/Z+mZTRyyYO
	SWilQwZP9ZvM0xUoEkdjnkuto1AAAY5PUb7icsFRTjG506Rt9mQ7UhljhnYKpWTf27rg14Lcwsc
	3qlJd4YCZx9Owi8uDl2NjiTbQ3scRhBMmL0ta0sqmU7JTFb0DmsdPFfL8ngdwwh5GILVewzowLc
	3dWoAbSScVaQZcUVx3O33Ik2XTmf3K+kDFd4+EUL1UTCcmhcUr8SvA5mV47A65ycw9Dil7hhx3S
	YKyQoWuEhwjlyjUp6DzRlJNc7z/i4h6RcvMC/3wPIQ83FXXXTlMCENBIRvZYSpbzoehUXea4i1m
	n0I5LLDQF70wyoYF76wMpg2wh9xta6hScpx/MI0R3QiqO0s4BUZEtebGSaVrsJbJ0lUO
X-Received: by 2002:a05:693c:83cb:20b0:375:388:a6d5 with SMTP id 5a478bee46e88-379675fc8fbmr12249938eec.32.1794920255453;
        Tue, 17 Nov 2026 04:57:35 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::a1aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm44767034eec.11.2026.11.17.04.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:57:34 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Subject: [PATCH 0/3] Add PWM support for the Sophgo CV1800B
Date: Tue, 17 Nov 2026 09:57:12 -0300
Message-Id: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMT3dzMnOwy3ZTSfN2C8lxdE6O0pGQjiyQDM0tjJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaAKwV+flxAAAA
X-Change-ID: 20261104-milkv-duo-pwm-42fbc28b0693
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Chen Wang <unicorn_wang@outlook.com>, linux-pwm@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.0

This series adds support for the PWM controller of the Sophgo CV1800B,
the SoC used on the Milk-V Duo. The same block is also found on the
CV181x and SG200x, which share cv180x.dtsi.

The CV1800B has four PWM controller instances at 0x03060000, 0x03061000,
0x03062000 and 0x03063000, each with four channels, for 16 outputs in
total. The register layout is derived from the controller already
supported by drivers/pwm/pwm-sophgo-sg2042.c, so instead of adding a
separate driver the new SoC is handled by a new chip_data variant in that
driver, as suggested during the review of the previous submissions [1].

Compared to the SG2044, the CV1800B differs in these points:

 - PERIOD and HLPERIOD are 30 bits wide and PERIOD must be strictly
   greater than HLPERIOD. A 100% duty cycle is therefore not
   representable, and the period must be at least two input clock cycles.
 - POLARITY has the opposite meaning: with bit 0, HLPERIOD counts the low
   part of the period and the pin idles low; with bit 1, HLPERIOD counts
   the high part and the pin idles high.
 - A POLARITY change takes effect immediately, even while the channel is
   running, and does not need PWMUPDATE.
 - HLPERIOD/PERIOD written while the channel is running are only latched
   on a 0 -> 1 transition of PWMUPDATE. Toggling PWMSTART must not be used
   for that, as it restarts the counter.
 - When the counter is stopped the pin is parked at the level selected by
   POLARITY; emitting the inactive level would require changing POLARITY, so
   the driver switches the pin to input mode while the channel is disabled.

Patch 1 extends the DT binding, patch 2 adds the CV1800B variant to the
driver and updates the Kconfig help text, and patch 3 adds the
controller nodes to the shared cv180x.dtsi.

The hardware behaviour described above was verified on a Milk-V Duo with
a logic analyzer (GP4 routed to PWM, i.e. pwm1 channel 1), at 1 kHz/25%
and at 0.5 Hz: polarity mapping, PWMUPDATE latching with a running
channel, and the pin state of a disabled channel.

This follows the earlier CV1800B PWM submissions by Jingbao Qiu (v1-v7)
and Thomas Bonnefille (v8).

[1] https://lore.kernel.org/lkml/20250509-pwm_sophgo-v8-0-cfaebeb8ee17@bootlin.com/

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
Hiago De Franco (3):
      dt-bindings: pwm: sophgo: add PWM controller for CV1800B
      pwm: sophgo-sg2042: add support for CV1800B
      riscv: dts: sophgo: cv180x: add PWM controller nodes

 .../devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml |   3 +-
 arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  40 ++++
 drivers/pwm/Kconfig                                |   7 +-
 drivers/pwm/pwm-sophgo-sg2042.c                    | 201 ++++++++++++++++++++-
 4 files changed, 241 insertions(+), 10 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-milkv-duo-pwm-42fbc28b0693

Best regards,
--  
Hiago

