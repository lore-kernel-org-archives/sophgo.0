Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8735E10E9
	for <sophgo@lists.linux.dev>; Sun, 20 Jul 2025 08:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753000370; cv=none; b=j0RT3OzZVuY3JqA/K07zOjO/sN77NGa/O7tytMLzYD1S9PtDj8hPOgP86m490G/GobJMOxbpJnS3P8HkSqvMO1BftY+IJtRgH3lbN7tcBSxlC2PuEHJt/T80miacMTI6LAVqKFgJc3ZeXnR5S38ajORPBSP3u4fhZww0esnlzzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753000370; c=relaxed/simple;
	bh=txKyTWgMnO1Ncvzz/n1aTwE0i4eSFrFSmoLYu+02pqw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aaZWbX7UCfCiCojndJodqBU149nvucfzArb754EpYU+9Lpjq+8l0q+12B3CMR2aW6zniNk0TQDwmeH4Xc9bwR1XHkouHMVuYmLSF+I6dOvrZXFYhn45yjvjaH6Ngf3kzbIqvFc8GMdWI6QrCtjspz7RdsyMsDduLJY3lP5CLRSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLdV+0zB; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLdV+0zB"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so2941027a91.0
        for <sophgo@lists.linux.dev>; Sun, 20 Jul 2025 01:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753000368; x=1753605168; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FiNF4SEuIin2EgUqWK8JFEp6BYToNAS7zW+nZhJnUmo=;
        b=BLdV+0zB5rKJO+WIDhYHsSwF/WnqI90rAze6bEO/xcMKQh8emNmJiHD8C/GhXZ4i2Q
         YK4jSfmFqCsoejmmZNHzAh8fnlUlWHhQ5uiAJ5wn6we+uJxBhJtaVjl9/jzAIzkQGpte
         q2t/CMTXlixFVKW72WH+Hxaj26zDq29ubGIDQa8EcENo5V4bLED2DBlpbidgKtZEqAtJ
         ILyHLzTs0bx10RQUnc5OiEsr9zjNZFflm6bqZhReh95Q4h+LzGlXg/cSchNCorynG2a0
         mDbaWJRkHN/cWbQQNydhqsoJ4qb1npcp3UNWp0L0il3oLhnKntVrbyIjnUg7pd0CQQ7K
         Jwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753000368; x=1753605168;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiNF4SEuIin2EgUqWK8JFEp6BYToNAS7zW+nZhJnUmo=;
        b=eAA/KMvdqKz9TjCYK4mtdkiLXfS8Ce7C+oOObxYUGWTzSDq/AtOS2zmihYrlw3v9BH
         OxCKg2BRuY48zGkuvfojOQbNixaKXm85JjbwETJ4O3XdEcUn6QTeT9tyjKtC1AmZSXvk
         ZJ8YTwNcZ1pzNXV+0saiJ4MkwxFgzrQA9L/ytPUa909A4Xe0lYdDdIkckEBd3ecLBf8L
         uMd0vjRIuEgKZtGnoKwq8u7+UnDLqeHENqKtMC7NaxAxPonNunFvUzgVw6SDm8HV7BRo
         KjtxXGbhCCICEfP207l9N9YOXenf0x+JxFRCWn28lID3PRlZMzGzTWkHQoUgP06L1Fnf
         6UEA==
X-Forwarded-Encrypted: i=1; AJvYcCXBOjXdcrDQaqs3ATkgHDiwhvimjSJvXFeEBcJiPa8ArrdFquIhS8K6KcuJPYeoXJf2WQuPXgs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEkc0R2osf2eSBnaY8WDla7wvaw3dp/FrCUySiuMtKwKy2G4Xt
	P4PLRNs0ZlKRDcNUF/PT6B424WcPlWOMrd974dK2chd+lvP1OI4zfQPW
X-Gm-Gg: ASbGnctUuyDZmLXMgcpl/0aIvYrwWiRRsadj/wOXj+EeGY8AJQwGtVgNaqJi6zuxpj9
	1vaN3zWZmoD7XjvjxkpQKya0ZhvWidsO4kKF2W5hZhJjXJcek8cqpt7b791XRxdp8vPxjGjnJFJ
	gg6vsVEWRJp5ApXfh6bgQcDAip/q1o0dy+SN5c8oGVTKCumQ6GHOVoIHJ5bbKww0XbQXDsnf4r2
	dBUHkNiQkmri4n1a7WFHpegRWq41rauT6LDCVKXmImtD9QVidGJ/DELsY9i7eKLdfNB6j2oDNmH
	WuKzQb7t0x3LYVmvLz4OF01JUP8bfazSTKy4JTyLS5L7YPsUl9CLZMCS/ueDbhf7bAcv6gOev4U
	U/7U48UJaHr4X7w==
X-Google-Smtp-Source: AGHT+IGZKIIWxW0MM8M+8exnM4woxigogql9EMO/mHA038LwIs21zmM+BeC1R09FPp/G2WH28WdCag==
X-Received: by 2002:a17:90b:288b:b0:30e:e9f1:8447 with SMTP id 98e67ed59e1d1-31cc03c01e6mr11886432a91.4.1753000367324;
        Sun, 20 Jul 2025 01:32:47 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1002::1d55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3f46b97sm4079721a91.41.2025.07.20.01.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 01:32:46 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH v4 0/4] spi: sophgo: Add SPI NOR controller for SG2042
Date: Sun, 20 Jul 2025 16:31:42 +0800
Message-Id: <20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG6pfGgC/23M0Q6CIBiG4VtxHEeDH9DoqPtoHSDyK1umg8Zqz
 nsPPUlbh9+3Pe9EogveRXIuJhJc8tEPjzzkoSC2M4/WUd/kTYCBYgoEjdjSOHrsLa2M5gw0c7q
 UJIMxOPSvNXa95d35+BzCe20nvrx/M4lTRqVFXloU2IC5tL3x96MderJkEmyp2lHI1IhKQF2iM
 rX8peJLS9A7KjKFU1NzhMpprbd0nucPmRjohRoBAAA=
X-Change-ID: 20250523-sfg-spifmc-7a910290e964
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753000358; l=2195;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=txKyTWgMnO1Ncvzz/n1aTwE0i4eSFrFSmoLYu+02pqw=;
 b=Bty5Us+RDErqs1hsitaE/Etf77DhqRuEEm5hj9oZFE4DY2gy+5UoSPR3DZCPnKeQv+NsoG1oH
 lSM0QtJLQBkD+90idbkhwV7YqJ/zbSn8bgnFKisClm5VChqzFIMH6T7
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add support SPI NOR flash memory controller for SG2042, using upstreamed
SG2044 SPI NOR driver.

Tested on SG2042 Pioneer Box, read, write operations.
Thanks Chen Wang who provided machine and guidance.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
Changes in v4:
- patch1: Explain why SG2042 is not compatible with SG2044 and add Fixes tag.
- patch2: Explain the hardware differences between SG2042 and SG2044.
- patch4: Remove the extra "sophgo,sg2044-spifmc-nor" compatible property.
- Link to v3: https://lore.kernel.org/r/20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com

Changes in v3:
- Drop the patch which adds additional flash_info into gigadevice.c
- patch1: Because of the incompatibility, separate the SG2042 from the previous fallback mechanism to independent one.
- patch2: Newly add configurable options to spi-sg2044-nor driver.
- patch3: Fix reading bytes issue that causes the spi_nor_check_sfdp_signature() failure on SG2042.
- Link to v2: https://lore.kernel.org/r/20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com

Changes in v2:
- patch1: Accept devicetree nodes whose compatible contains only
  "sophgo,sg2044-spifmc-nor" to avoid breaking existing devicetrees.
- patch1: Improve the commit subject message.
- patch2: Dump the SFDP information to commit message.
- Link to v1: https://lore.kernel.org/r/20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com

---
Zixian Zeng (4):
      spi: dt-bindings: spi-sg2044-nor: Change SOPHGO SG2042
      spi: spi-sg2044-nor: Add configurable chip_info
      spi: spi-sg2044-nor: Add SPI-NOR controller for SG2042
      riscv: dts: sophgo: Add SPI NOR node for SG2042

 .../devicetree/bindings/spi/spi-sg2044-nor.yaml    |  9 +++----
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 24 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++
 drivers/spi/spi-sg2044-nor.c                       | 29 +++++++++++++++++++---
 4 files changed, 77 insertions(+), 9 deletions(-)
---
base-commit: 8727665368cd4af112146b650ec0ebac038b5cf5
change-id: 20250523-sfg-spifmc-7a910290e964

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>

