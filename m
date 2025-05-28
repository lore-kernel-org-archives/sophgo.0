Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D94171C9
	for <sophgo@lists.linux.dev>; Wed, 28 May 2025 10:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748427113; cv=none; b=ax7A7kyisU1MoXVqjyhXPtv6y4jIiinIvFDx9mwKYz5IE5/JXG51/i3FjljmvvqeKsxTR2vpWhPcOwVyZSTmpoHK+/h2NBWWoDm8yLvNtO67D/kjJeOvBaRoCTa1It+HB1oc6Wg40MDinLjCnH266qovLHRLWGoUQMGR/a72dLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748427113; c=relaxed/simple;
	bh=jQm/Idqdz/CKRY7nuelIqDNot1qzY4oj6ANAyNVprKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W1tyYbbEoktQIuPoisPUzkSd7vAmkPQ1gCVozOlznotlG15X1EPlQOpLBrC5G06822iHlm9oRP7oJyH3u5Vk3bKfluC2ngVoIrucYdBM/KqfR3fbXGFY1gl0HRLQEbf+rQanvRZ2Hecheiu0euVGM7WwfT5MUHa7HfxIfmV+wIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzDxcWr6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzDxcWr6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22e16234307so6666475ad.0
        for <sophgo@lists.linux.dev>; Wed, 28 May 2025 03:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748427111; x=1749031911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u1/Vt2mp73cleoni8AtXiYI0r+BUVH7GhRhyE5d0M3E=;
        b=dzDxcWr684/UW7FS4wy5Pz4qjdpS3Cr/hD9UR95cZ/EA3LbdyXAvib6OQ5LIk12PKM
         psZa9d+YehxJiERKbnA4AQJ2awputbyXRGq+lDYM31RouZcZvJWEyPRGOsZPK/sfWmx1
         K324TMkYNzpGKuhYYO4JLHHdBbfzSFCyV63qyi+dRnqQaprh5tXhohMkYJRJU/qVAB/r
         V+ckPrJCI1kCGFo0VOz39sIRihKgQXIk1QtrQpBEa7iNF+N1z5qHmeDFoUkPvWVMNOvM
         HBBCw8UChD2TLJGMZBWLVCgD9fszsPeq/7eIoQiU2ItZIQbfTfZmVHwFX+UaEUMcxg2N
         nh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748427111; x=1749031911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1/Vt2mp73cleoni8AtXiYI0r+BUVH7GhRhyE5d0M3E=;
        b=jiBgs3TnzTdfZvKQT10+LBl63BSQASVZB1A2F0X4Wc0LdlN2bJvMg55IAA49Q+bdXo
         cU1ReLr5UxaWzV8mYK4VzqpPtcxtcSsuKNLqzR3RTPtPF1e9rhR2VqWDMFg0iSjP53Jg
         LyCrKGQIY3d/GAz8hEoi/pLknlMPJxEDXcExoMbRWxK8ozT3y7SPEUZXTlUxgEqMGVRo
         ytEa4tBEhwhtPCL6IH9JOFxniHOa8gJ90Sd15cdPBOnfkafbhFm1tnfH/heX7gieDheU
         quUnOtlE7hzJpYZfcMaw8BS2VwOns1K0XeQ370/li+FsXQ2x8sUQNMwFQKEy3jminjQK
         XwVg==
X-Forwarded-Encrypted: i=1; AJvYcCWSyMek0RamGYLbeVHBCdz9BxT5sfALGv2pZgyjDesygPK3m4hPmQOhxbXAAD7Q2u85KhoxP/k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUMYgHr2vL9Swy5nV01Qxdkgw4SgSRD4VwsiPlE0tpSRi+gEwi
	121F01bIaYU8zw8BewOreHNRdqzIw8P2tHCfcKcbaIL16c7y+XYUwuNH
X-Gm-Gg: ASbGncsm5EmdbGWJTIKmVlnsUa0CxRNpmfI78ouwz272faE4LHHPNNjGPKu02Pzl2pR
	LTbz22IBnN6d+c+/QwoDTjfw8AX6Ert6hpVikl7gowafFNrOZlezwVBDq09ahAGCgbXBJU1Ai0s
	TA47Z0ZZ9hkQ3drA4CPZygjXFh8KN042feCaw1e4ZATriaK5B3RGu804B7gT1U9y828taXVYmuX
	lygdOYc22bwreEpdp4DCAyreSdrxgxBxaiUM5AFxcMdUOE60Yr5pQBGfpNINsR4UVS1Q3PrgHCn
	fFpGnconG4jlWZXjWlJFHv47Mpqe0aNtcZSqxT3HmMuKnGQ36iEX1yH8
X-Google-Smtp-Source: AGHT+IFZgXlqFr/nZJIbvYhr8VBnFB2u+fgWRkPoYOa2czSx/AkDylcuc63qHSavCUSvhb5c85NwtQ==
X-Received: by 2002:a17:902:f693:b0:234:325:500b with SMTP id d9443c01a7336-234b74f4119mr68932215ad.22.1748427111266;
        Wed, 28 May 2025 03:11:51 -0700 (PDT)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f118sm8453595ad.138.2025.05.28.03.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:11:50 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/3] riscv: pwm: sophgo: add pwm support for SG2044
Date: Wed, 28 May 2025 18:11:35 +0800
Message-ID: <20250528101139.28702-1-looong.bin@gmail.com>
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

---

Changes in v5:

  - Rename function and variables for clarity.
  - Modify code style.

Changes in v4:
  You can simply review or test the patches at the link [4].

  - add tags for mail.

Changes in v3:
  You can simply review or test the patches at the link [3].

  - Rename macro definitions to unify naming.
  - Modify code style.

Changes in v2:
  You can simply review or test the patches at the link [2].

  - Modify variable naming and code logic.
  - update "MODULE_AUTHOR".

Changes in v1:
  You can simply review or test the patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/20250407072056.8629-1-looong.bin@gmail.com/ [1]
Link: https://lore.kernel.org/linux-riscv/20250418022948.22853-1-looong.bin@gmail.com/ [2]
Link: https://lore.kernel.org/linux-riscv/20250424012335.6246-1-looong.bin@gmail.com/ [3]
Link: https://lore.kernel.org/linux-riscv/20250428013501.6354-1-looong.bin@gmail.com/ [4]
---

Longbin Li (3):
  pwm: sophgo: reorganize the code structure
  pwm: sophgo: add driver for SG2044
  dt-bindings: pwm: sophgo: add pwm controller for SG2044

 .../bindings/pwm/sophgo,sg2042-pwm.yaml       |   4 +-
 drivers/pwm/pwm-sophgo-sg2042.c               | 141 +++++++++++++++---
 2 files changed, 127 insertions(+), 18 deletions(-)

--
2.49.0
