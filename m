Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A8322D7B7
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 07:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010518; cv=none; b=bdHDBZeRKECqP5MGGLMABP7jKKyLouG0Ox9cWAmyYfivJzcfuq0Sc4UP4R5mTYbX3lXzuYId89EVCC3IoHEVwrd/rlAKval5hNtDmWHrNQM2iB7YT3FnyjOaN8OK+aciqKou4A9Gfcga5PRVgAbvWUpiw4I6lx+8REAWaRT2Qas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010518; c=relaxed/simple;
	bh=lq/B1uM+ZdZwRZ6B00/5OflkTp2/rdXR/2K2PuehMkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jReAFc7gsYZ/bqiAQ5ZAHLcfRxqFe10BY+tVy8PjaKhd2tY7DzenImXZagWMjnX84ex/v9FaPT1px3GvjdiGnb5FjuTGbVamhqJlwG+4G+hlbAZ1NVJSF+Wwzxrhbmc+ioG+6Ic0+AT6n5w1R7gMkiJMKFdNF8Kp++JlnGboKoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ba/iDqQJ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ba/iDqQJ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso3688497b3a.2
        for <sophgo@lists.linux.dev>; Mon, 07 Apr 2025 00:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744010516; x=1744615316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/dP9TEDefRiCfKDK6dCXsCuGcFPJWg2jzI0nw7IpyNo=;
        b=ba/iDqQJW3ENkuoahItS26Eh4x8FrTVMrqY/oPe7YXjpoxNEH61wEAJBaPQEL2/eZF
         7MrEMCVS2DY+ig5vm6bUvpNbOmWP0vUYAK76Gwx9iTpeHiWISAZR3cDcJHAOBLbqMXAw
         v+YUGnk0xtR8QCSZlj4WqzAH3tYLvOYtSKBlfu8pmrJ0KOoHnM8PuWrjJXw3V8Fo0B6z
         6TtcYc0uJnw4nf1izHSmrqR8IhmD+cvmtAtqj5lfC6S3Yc8zRHXdVbpXy7V3kJuV8y4x
         mNNOTrfBafzX1DQMHQSI3/vHQ/fsGCU71IA7b3WcphZgT9EIVLuI/r0CTATuo5gP54VU
         pGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010516; x=1744615316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dP9TEDefRiCfKDK6dCXsCuGcFPJWg2jzI0nw7IpyNo=;
        b=bf3PGc9mKo5emAngydPj/MF6S8PFa642zG67NTOhU1JICR6xe6mp/PYCb1K0a6G43Q
         1qBlra4v+ybcCpzjFlCXbW8p4KfwVGbxkrmuNWq0NCgPEGZ7/iQ1FYg06XsK58ZUyiBA
         6yP+11bKkgrXqAg9AjlMx23gVbPgoM4tYzF2cKZnTYzIZ0/v9UgW/oUyW3072YHpgVm7
         7Ivp9SFqr7cgTEwFmt7Q9aoYG9yrGVQrJ/A8dr+uUpsEHvuVSAzTw+8JXqZCl5cUbKWY
         BHKGgVatj0jYC9quavyP4VBdy2FIhZOCW98+QfKFuHCq3eW1tQXV5LxHNcXscRH01cg8
         VgXw==
X-Forwarded-Encrypted: i=1; AJvYcCXJdCx7twYw6uFzk1E9hps84XEzCZc6D7aijqS7zNnWDeEK5bfwApBm6aJaRjDVPQYdbXpXRH8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGAKwjq90Qmh+TDrrC+Kv9a/pMvD1kMqw0q3TjMFb7IaWKN45z
	VA2ad49IGtprIoi6ZiPTTec53Z7x6gobliCxCwlL+4++muwJckjn
X-Gm-Gg: ASbGncvQCn768ypWKCefXRQQmDRKgcMBd0TYZ8dYIB+R5ErdWCi6bFOXOFkQ7JhOvAX
	p19PSzmtjA5ZRars+amrg6mPwk2QGYC8Uxp+pV/gUnheILO7Inyah9Ld07ogq2ZNzWbV3rq1udR
	qdYtGArxqlpQDD6KhiuWwe8Ta/JhKja1Tr06Q/q19dPcEuaHCuZeXf1qjHvH2NVSpWYTGkVEsVc
	MPGcnZLe56yRu5R2hkDB1bW/7xeEcA/OFN1GniDJXZw04gv/F/RveVXUsfpg2/e7RwUaS9vmETh
	wsA/nk9Rbv6X0PUT6TD5FP5+y/Y26g==
X-Google-Smtp-Source: AGHT+IFQxRWIvC5wkqCh6heDsDs6qCBCvJgy83QuVa7jiqs/EDCg6zs/0W+VCWvbxeuO/25zv5oksg==
X-Received: by 2002:a05:6a00:2381:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-739e48cf381mr17596430b3a.3.1744010516171;
        Mon, 07 Apr 2025 00:21:56 -0700 (PDT)
Received: from cu.. ([199.182.234.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee60dsm7787598b3a.40.2025.04.07.00.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:21:55 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] riscv: pwm: sophgo: add pwm support for SG2044
Date: Mon,  7 Apr 2025 15:20:37 +0800
Message-ID: <20250407072056.8629-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds PWM controller support for four independent
PWM channel outputs.

ghost (2):
  dt-bindings: pwm: sophgo: add pwm controller for SG2044
  pwm: sophgo: add driver for SG2044

 .../bindings/pwm/sophgo,sg2042-pwm.yaml       |   4 +-
 drivers/pwm/pwm-sophgo-sg2042.c               | 162 +++++++++++++++---
 2 files changed, 141 insertions(+), 25 deletions(-)

--
2.48.1
