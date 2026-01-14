Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D65138A2B4
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 23:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768432770; cv=none; b=NxczEzF7coQfFT2pl2vb+sSKEWDmR9e3Ns9gBExyk95vJMTPu12snEs/+J5p5+3pxSvOEnLysQ5NixzfhyptuQQWxw8ZsTtqIYtmpFk9WlTRPxh/sVF6Ygg4Ih4uvnUOCmJVm1mt+aPCldkT9SdTYVnG+r8M8z2BSUStWsB4zL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768432770; c=relaxed/simple;
	bh=g9R/DgoDWl6EF5D3q8DzkV6XBEbhurMxaGpLqhJaO2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HOJGJF+uAlwViodK5Q4UGuhhvhSMaXuIdKb5GYJO3CBwh0OcV4tkYCFxAvT3xM5VJ9qBYI04MW/0xF8lwOvCaNV2LPiHPsQ521o9+rKGhiiwrNmXq17FeQZdwGLuHUEt3h3y9xDDjsDvEl98jvaaSPD50cLQckMcl4kDH3PKwCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rrclge9o; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rrclge9o"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29f30233d8aso2489865ad.0
        for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768432763; x=1769037563; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaSWKwxLaghni7N9hjcOEG+LzgsthN0XWKW1He+SYHg=;
        b=rrclge9onnzxKF0Jum1/o5BGxdCPhIgEGNRcIrbAy8PwE1N4rwCkIobOhRAgFyaJdy
         gl38S40TP4XGEZSycyQDcZpAJk7Gfr6lOV2j3N7HowjyS8lNUC8dBkH+FPZGBgD5ATeu
         MSDjP7AN/v9919oKmA3fCwGj0YpNDuyhwYreDyl1uUScV2wj9MEKaqEHB2s4mvHS2Umq
         kklPeoos4AD2lO+OkBOwQESVGSbZl+NbybWtoK45MdfMCWwtAy+AQ5K6UV2fS94xnBqV
         +bUh7gxQI+E+1/AOhP3Tjkfz6FMIP36wy/BWqqWkwCsWaU7GqX4+a0L97AHEEI1PyRL2
         gxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768432763; x=1769037563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kaSWKwxLaghni7N9hjcOEG+LzgsthN0XWKW1He+SYHg=;
        b=dgXisOEEca3BLMqPH4dvGqNytX+rr/lMhZuXHbnMATZG2T2HI7h2iCUDwoa0AAZTqQ
         KB/r0Fw42AoaLaweSxnbqwmZ/XUh3NeGYFOICj3qGP/avn4t/dO1Bj11Q/VLvFdcdB/R
         1OuuKsRrV8HVszTgSYEnCRJuvvc8fMFEE0oyCkz4rVmReyJFU0voRaQOTLWCMw5kc9E0
         d66yoRqQ5jMsAZ3izGX1l3/KDaQXVpWDgH8FnJMaa/ZX6dolpsuZahZgupYBkbWinHqi
         ikljJwq9PsTNgnbjyIyqSLYjtsNuDCR6wn7xc8X5UwiXt0yTro9ywe8u+LRFwpvHb2Xu
         L+wg==
X-Forwarded-Encrypted: i=1; AJvYcCXFlF4qXMlSwO9YaVtMkN5/zDBHnaCbfFaVkkQrrmDIxr7eeumEWpjlRuzsJshVsVjwvXUxrVI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXIVVeQWP4rFoFneZTen/gV2f6VR5k9drF8KM3kd2/I9sy7FBr
	0PYGKY/S+i9ZUTJHI0BKZ8YMU4+OeJkAU2+NXnQmSAuTO8Vxxxonp4OAv3PEyCzR3pM4LbIR0E2
	490vhrrA=
X-Gm-Gg: AY/fxX5HWi0njr6HNMCTi8uHvmzCfbbeSZMG0LkvqKgAf8L0DVjcz0Hd7lHfIIosE5Q
	ncobNBnKrkmrVY2c3Yn9g79BX81UwOpFDh3g9/5pRwFtw5TQp33BO3C0oSjkmIGsnz/UqID7Q5X
	657+VjFDRTnzWrzNoYO04e8B2h+5LELbdEeci9P4tqaWzCxFZQaF3HWuLfy0vuLvpzg2CsBSkee
	a5WLo9/eAsJw4kKBf9caxFkmdFPpwg4yrOelmS6ivIVAmh7Qg/hYTUFX9qoLwWKQwGi6z8UGFfg
	vLgfyIDW2INd3wmQ3HQ7cCn5sRW0fXdTmBnBZhmZaXqrPT8797TmB01eKXXmJ+D6ZsJ1lAe5q8f
	qkrVbeaeYDjGhkL0apEMYHVQJPwGDwya6c9nye4lonSpZgaXDAUjF5xJUgKmI5bvXym5d9j9l4L
	0teF/z4+jevupORmk2sMUazhoiGY3Alp1Rn053VZHyxZvrbaVKMhIqDw==
X-Received: by 2002:a17:902:fc8e:b0:297:f09a:51cd with SMTP id d9443c01a7336-2a599daf6afmr44260145ad.14.1768432762876;
        Wed, 14 Jan 2026 15:19:22 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d6csm238591755ad.64.2026.01.14.15.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 15:19:22 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 07:18:58 +0800
Subject: [PATCH v2 2/4] riscv: dts: anlogic: dr1v90: Add "b" ISA extension
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-adding-b-dtsi-v2-2-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3

"b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
(Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
checking rule is now enforced, which requires that when zba, zbb, and zbs
are all specified, "b" must be added as well. Failing to do this will
cause dtbs_check schema check warnings.

According to uabi.rst, as a single-letter extension, "b" should be added
after "c" in canonical order.

Update dr1v90.dtsi to conform to this rule. Line balancing is performed
to improve readability.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: New patch, a split from the Patch 2 in v1. This patch is for
    Anlogic dr1v90.
---
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
index a5d0765ade32..9fe183f5f5c8 100644
--- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
+++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
@@ -27,8 +27,9 @@ cpu@0 {
 			mmu-type = "riscv,sv39";
 			reg = <0>;
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zbc",
-					       "zbkc", "zbs", "zicntr", "zicsr", "zifencei",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b",
+					       "zba", "zbb", "zbc", "zbkc", "zbs",
+					       "zicntr", "zicsr", "zifencei",
 					       "zihintpause", "zihpm";
 
 			cpu0_intc: interrupt-controller {

-- 
2.43.0

