Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920262;
	b=vjc31aXjSKAnF7GPSsF7CbNxLvLOPhKIVv98r2+EXWxyOS8Rz9f05rwBMpWJJoo3p1GU
	 CYrV9rUxE3/maLpToJiKDFfev99gru1Vj/QiY9hgigXgVvgl1k4S5OFnXWA2t3vtimVQF
	 suzQlsu4RtD3Y2spSaU1kbl0ZEx/vtiuREnR/+zKYBldGci3LcKfgDFYXuM69FGZbMBkJ
	 qiUF6HzZdszYqS9DUwJFX/0TIwrQxhZA4Qw4kGOofb18sMiELAZDjIdHtoW1APIfMtODc
	 m24+XNcGnpKys0b4r4on27mer7VoQIaJH+WvTlgCggRsqYsmn0VV+CynRYrHDlr0gCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=pq4AjLVwM19r78cOmsBTZmnW52I4hS/grHAe4MpsVsY=;
	b=Za7er3R1xs9o/DZtchTBNsLRBAqheuc8JEsWj3wsW9GnihUrfCuhY3Ud7Iz6H0F55x5X
	 hPjZ82+oZLh7kxwNKYM9CWCZhE65JnRZSbu9AcjKy90c+V9S9Bjx6Jh4VaoPHOT0/DnAv
	 8tW68ykss+y06t9xdueUZnh9SvbuTcE9tQtZG72lJ9nc8V4ChF6wRsJvEU1Vo37SxdEf7
	 /0doM/KgdTSJbXMM3koqA8eBBXsOjbEhX1Fp+vRWpi2JgOt7pC6xTQXRbAZLm6nsHIX1r
	 o1rBmkTWc2tWiphuIVKwYwq/7Vvv+m3Ra2hkb8rcDLDRxXyPnVENwBtKiiQTaVT2VXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kP5zSY+8;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C9F606A331
	for <sophgo@lists.linux.dev>; Tue, 17 Nov 2026 12:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C9F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kP5zSY+8
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so12535029eec.0
        for <sophgo@lists.linux.dev>; Tue, 17 Nov 2026 04:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794920260; x=1795525060; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pq4AjLVwM19r78cOmsBTZmnW52I4hS/grHAe4MpsVsY=;
        b=kP5zSY+8gWoNRCR6FAtveHWtar/k6jLGfKVLIa/dzm/kxHrinPViaoTvy39tiEgkug
         xWyRwT9Ff1qbH88rgNBo5yDUVzCEe5cEDek4WEPQMQQlBL/N+E2vPt1hc+tSpJXnqXlz
         WeJSRCcSv1mb4/Ms416vxAobKBK+eYAxdpBC8/yEAaAcV3Fyo+8T0zpo6s8hyELKxV8H
         dV2BM6Iox7ZuuZtWbLSWp8uERwkrAq9M0a1lZw/HZCnJBa+Pg0TkgSXE1cOKlBQXA/co
         Mc9ZYStbAAa3d2XH/QsS97V8Tifuu5GJe9uakPYSH94JZCP0uQrA7yl65IQ/s98oMCN4
         /K7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920260; x=1795525060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pq4AjLVwM19r78cOmsBTZmnW52I4hS/grHAe4MpsVsY=;
        b=GqkGxMnc6FcQiZ9JeItspIeWNrKDehy5Wi4A4EnwSjah3IZjylhlHUZDHmB6AyBgCp
         Sz5Qb28iB7kW6Rb/h23/i0LNY3TxQn0xjczDgWz8reZOEdLkHm/MfrkK8vXaHqyDhIo6
         Te2nOH1hgTdDKs9DcKdO6BL1MjthBs93bAgqSgK0FNgw9mWoJGHDW3ipVZbWexWDgLuk
         S5ViUbuBg84NrT1Vo+tdUMTIB7RYEHkv1Ei1IRRRUz0yr5OdKHqfAdbHBF3wIhtrvOV8
         pGENsJlqKK2ZCEdrQXyK5ezHdgWIyoX8Ye8zMcN8DIAM2AbuvatOYFLmdGvTQ+YbQTHc
         8BPA==
X-Forwarded-Encrypted: i=1; AL+hErHtryy8UQIWsGtUqWBI9JDGYTo92YH6c+szSbOJY2BlYQEtcAA6cMzjtW3iWUnAhuZj7bhSgy8=@lists.linux.dev
X-Gm-Message-State: APuU4Z9GZAykaNSGjzKX2bSPEkKYY+rdejv+mr46ptjq/5iixd/a5d5P
	nefNi/KlfL5DfCjlimWgLo5JavkaFcl1+VL7BG/Dg03y/hThpAwuoeKLewsrx+zXi2c=
X-Gm-Gg: AZFdTZc1H6Fy6Haq54b7dd/Q23Fq3ot8TrWRGMLH0P//kKhihdpz2o2sZqOSDfXY5lg
	Bp7jxmz1ftWSWP0hYsOs+H4uU1TAf/suNnDcKDrCShtsm83vMBnpLorFvC54Mw/N5/zfD0jveXh
	AdDUBYRl6bhG1WPLnefiHijOgV2ExUtYvAFa/jH7Bxm2Fu8o6XXxPAITtyzyLMzuTWbCZwZZpKh
	cSGfJ5sIB2+R0FtHHozMCaZAU/gwVABW2KxK5IrYwpIQfQ6e/DTmWaCP1QeFkNDC54UYr2QG1Jw
	Ans50vLMSwhPwyPxxgV/4zkhk3q8M6dgo5P5QlYoimgLN/lxxx/+7q/xA5HjvHRHp7zf4vu11e0
	sI4SmvURArqevQhR5B8TKxS5NW6jH0wKhIKXNIqU/a63cJOmzOGDRQNIQCWvcZOaXzrhSmUhvAh
	ufVjBlwG2Se9VZr/0vyg1mkQTbvEr6H5WR6cpU804sHRyNH/mDip0gT6wC1RrRRdygM4sHtGqSE
	ToBZb5tTiL7RnZsumMQakrzCYJB/t6l5rY8AKwDuB6UXTeLPI9y2B3ObHe0kaRpBQhTovDwULJh
	fHgUjHWExzaCk1Mh3rHaCBycjYmPTTNEJ3gCZd9n6WUF+T6KHAYf++mZyuSgRju3/KXq
X-Received: by 2002:a05:693c:60ce:b0:36e:8410:ecf6 with SMTP id 5a478bee46e88-37966387d74mr15512381eec.13.1794920259546;
        Tue, 17 Nov 2026 04:57:39 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::a1aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm44767034eec.11.2026.11.17.04.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:57:39 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Tue, 17 Nov 2026 09:57:13 -0300
Subject: [PATCH 1/3] dt-bindings: pwm: sophgo: add PWM controller for
 CV1800B
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
Message-Id: <20261117-milkv-duo-pwm-v1-1-3f1786ea57b7@baylibre.com>
References: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
In-Reply-To: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
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

The Sophgo CV1800B SoC has four PWM controller instances that are
derived from the controllers found on the SG2042 and SG2044 SoCs.

Add the "sophgo,cv1800b-pwm" compatible string and update the binding
title to cover all supported SoCs.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
index e0e91aa237ec..11544b47c1b3 100644
--- a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pwm/sophgo,sg2042-pwm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sophgo SG2042 PWM controller
+title: Sophgo SG2042/SG2044/CV1800B PWM controller
 
 maintainers:
   - Chen Wang <unicorn_wang@outlook.com>
@@ -18,6 +18,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - sophgo,cv1800b-pwm
       - sophgo,sg2042-pwm
       - sophgo,sg2044-pwm
 

-- 
2.53.0

