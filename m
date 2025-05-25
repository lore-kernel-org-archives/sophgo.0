Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF45C1F2BBB
	for <sophgo@lists.linux.dev>; Sun, 25 May 2025 14:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748185175; cv=none; b=Ug0dHdpLFKDzFhxmEuaf0TtktKAzPGZBBT0UPaBBewoiXCo5FKNmdkwF7O0LeO0QutcgfpPsQH+I8rlVZd+Dd86sb1Y8VEglbR6dIQU2g7yfL2HlMHHySxqYFIbdZbU6++Vh5WwrDwqnLmu5BKxItdk25X6friz6+pTcPhEQMtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748185175; c=relaxed/simple;
	bh=5Rf+XH7wYeHA/1Ip4R0wdkjAiYWlYPDMcrHiaZwX1Ls=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DkAaspbeTl9ao1VlT21gdLgbUG3RTtmE46gESHH6wJUgh9T/qJui/wT6e6rF2GHof3vIla+vF00jMW7PKemZmzgwPqmJjuQ6uH7zLeRFk4sfaQCeVD7yjtIwMFLaWG+R8qJ+5BNin5vRMPg8WaCLHeKnVaDsxC/T22QvCOtwUAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wpg121Yc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wpg121Yc"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23461842024so1084305ad.0
        for <sophgo@lists.linux.dev>; Sun, 25 May 2025 07:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748185173; x=1748789973; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FJSZqhft8oN88RWw/icnXyxnygR+ybrApsl+WofewtM=;
        b=Wpg121YcxkMKC4jFW+QyK3whVseqPuNDQxZ5NEsYGi7BXSH6BRt8X+W1zhSGKrbsYH
         PFK1n890BBjj6noaFLKSRzjDyLc8SAvqZFHK8lehrHtm0bmTk/+5+tbPS6ZPYmcI8qO0
         g7BUORUfowVKPdO0NWQHoXspW8DLGgdr5kOzQlOKEDHJZwG6PuXCGDknjASfIAgJNxsB
         p8WPYBj0FpmwpUT/vblHUZ4UsrdZGmOq0vxesu1A4J+O7ihHLJgY4TzF0wQDYVd6dD31
         QoywKAsz+viiPOaK4nfbgowT67U858YwgrRVcjwZ+Yoql9WINbGvu8fMvJ0H6tNkX7jZ
         10+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748185173; x=1748789973;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJSZqhft8oN88RWw/icnXyxnygR+ybrApsl+WofewtM=;
        b=kP4eYfUXfbkTOTYwQ0G0J584eyA2Zt8eQdfrvFdj/ndg5WXGkpxdoc7m1PQOTMZ7I2
         Iuzl2MIzT9gQ3iPuisgAVgEtoM9OnLll9E7Va4hO4Luni1h3r6w5xN+ketwogaN9LMdC
         ctKWL305dJMhy67vvhGwU0gNCIsAsNa/Bb+B8xT4aUgmxqkDk8ZLLLhYkToX0FXH2JW9
         8KgEOES96m/5oRMZbHCLEqO28Dmk3SDtsdS39eRcfyU2ZWcraPqATp0+0TvZjTqy739O
         s582xGu97o7PZT1z7J224lVq7C1dybf4EfAz5HRKCxkikmKkYzM5ezN/0Rwgi6kdpScM
         FkCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3Pa11CUioRkPe6jIScxMXNPEsbcKLjQfW0VmMM4E1bo8VFKNz6jBh9sfE3kG74JrJMxJgt84=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUv7DYlh1Ypn8x0cAkKzKPe1qKf/XjaGJMrx9ZOqzmYOUreWjD
	Bi/6T/vUmzBXvTv7K6B5VJ86ibklmK0yjzGJxGPtii/2xq04HgqXdKPD
X-Gm-Gg: ASbGncuig8KPj9gbk0/Oa1IeSATNJ0Gi1ZAJpYbM6GMYv1EdmB4FW2r84ani6rLky+a
	hCSTGSZqwtjlNljKMZdnPAUHLy0KA3a5qnkKL5qoklii6pw/rTIaaMGWEV5ajEiZog//kPIaDdQ
	x8FgZYM+zUc81IBY9L/I9nE3R7TkqLgx7QAezWJ4gnbxowWVkV5z6dhiTvxQ8whr9dFXDCTfKJQ
	Wo88UpcV5xai6UaPApTJVJkNAxgSSDG5xmR1a6WA+R1DGFqieM5uMv8ACBkNPWESAdRDtaX41Wq
	NNSmblcu5z5u1kpJY0OgEG8E0JZ0SiJfj0/GCVyFlmBfufX2d8+GJA==
X-Google-Smtp-Source: AGHT+IGMA891Z9QcMnUNy37nLhB0qBQRarrDsxvWe011CA95ftR2WVjmKQaGn9yEpFYZJ8bwv7RwvQ==
X-Received: by 2002:a17:903:32c3:b0:220:c34c:5760 with SMTP id d9443c01a7336-23414fd3f1fmr80933825ad.51.1748185172627;
        Sun, 25 May 2025 07:59:32 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2343f8e2fbesm12204845ad.250.2025.05.25.07.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 07:59:32 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH v2 0/3] spi: sophgo: Add SPI NOR controller for SG2042
Date: Sun, 25 May 2025 22:58:40 +0800
Message-Id: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACAwM2gC/23MywrDIBCF4VcJs+4UNZdiV3mPkoWY0QzUJGiRl
 uC712bd5X/gfAckikwJ7s0BkTIn3tYa6tKAXczqCXmuDUqoXvSqxeQ8pp1dsHgzWgqlBemhg3r
 YIzl+n9hjqr1wem3xc9pZ/ta/TJYosLNODta1blZm9MHw82q3AFMp5Qsn912RpAAAAA==
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
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748185167; l=1277;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=5Rf+XH7wYeHA/1Ip4R0wdkjAiYWlYPDMcrHiaZwX1Ls=;
 b=w3J+SqKPY7joyY5psDMZB+uFx1T6KaYC9OLGQsA2Thu53R2RBdIYrBT7sOAQn4ef7ZzEtCD6V
 eLvSJDWaMGPAXW6EgcdiNWwkHqxEtfQ79HoahVSQP1t4TRogUPsN1fz
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add support SPI NOR flash memory controller for SG2042, using upstreamed
SG2044 SPI NOR driver.

Tested on SG2042 Pioneer Box, read, write operations.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
Changes in v2:
- patch1: Accept devicetree nodes whose compatible contains only
  "sophgo,sg2044-spifmc-nor" to avoid breaking existing devicetrees.
- patch1: Improve the commit subject message.
- patch2: Dump the SFDP information to commit message.
- Link to v1: https://lore.kernel.org/r/20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com

---
Zixian Zeng (3):
      spi: dt-bindings: spi-sg2044-nor: Add SOPHGO SG2042
      mtd: spi-nor: Add GD25LB512ME GigaDevice flash_info
      riscv: dts: sophgo: Add SPI NOR node for SG2042

 .../devicetree/bindings/spi/spi-sg2044-nor.yaml    |  7 ++++++-
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 18 ++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++++++
 drivers/mtd/spi-nor/gigadevice.c                   | 17 +++++++++++++++
 4 files changed, 65 insertions(+), 1 deletion(-)
---
base-commit: bd8ad2bcb8ff8e7af8d35273a8194104ca9ba5c0
change-id: 20250523-sfg-spifmc-7a910290e964

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>

