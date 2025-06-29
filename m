Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA28A93D
	for <sophgo@lists.linux.dev>; Sun, 29 Jun 2025 08:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751185421; cv=none; b=p9ZG24o8mol33+1C1qsR02IBWKWVqe9QAq8lkQuqxwUwpV2P7keHp557t/IhvXc1Kld/23fHnwlUE5lDHitA8Eco03E6KV2+c/V1fRFjgnlsaLd87Gz/hR5/5UWlYdac7/oeCBrXdW8h7noqSQTkEsRZIOqX9drB0zw+NZjqbf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751185421; c=relaxed/simple;
	bh=LKtaI0pAOsDCmEDvjcAJQIr31hlkW2ymLC+5XkspvJk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EoYWl7pQGcZpO424Cg+Si6ws96VFozYsxkXAUOggCqSzmnSLxYViqyT2lKaxRCDySvNYM7xettYT6XTXE7nmDTEOpGB+kLpawHhl2aQKl8bJQtKLjzUubikIoBWr+C8HmatVD+64a2iVdpXo8Pn1/bFs7g+OMQT7co4kDhrOE8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJpy/Bwh; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJpy/Bwh"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-313a001d781so578105a91.3
        for <sophgo@lists.linux.dev>; Sun, 29 Jun 2025 01:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751185419; x=1751790219; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iT8CFBVHA2PHKdhe+MXDUNE+DyeuqyUpTK4o2FEoGw4=;
        b=bJpy/BwhkNgzw37YzNVrN/c/9sDOx0GupDBchoz2WiPg02J551dF1eSg6nExrGnjSE
         GDypuDM7E9Z82ozNf82HP4X+CBxACnRyDQZ4cxCa8LpcGIoUx6vL3VDdfmU5htIAfHL3
         TLGT7ERYtkYEQ9sc8Zo8GjXofORnOgWdlEjvki43Qm58dh/Bt9CtRnUUpj2Cbw31H7q+
         Pbxed9EAw4cieNq1rbAZ711U3Hh3GH+wKTtBEvW7TH0+j47dFPn8ZtSwQped45KrqFcm
         h9bzORIEeneroJNVNs/2W+YTAWvd/Cy7SQUJ2FHFPSNwj1g1Y9+nBwRo2jFGnADKPNd0
         4pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751185419; x=1751790219;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iT8CFBVHA2PHKdhe+MXDUNE+DyeuqyUpTK4o2FEoGw4=;
        b=EkoW50qqtWrYihK99Z4cSBaDMtIL8XjRo5E7+001rU6WuLOW1iZUqso73rMj5aRxD9
         42vUEf+s/tjaL/m3/PfGDKlOi7TfdNmS7eWvfNqcz7aEUxnA6QM7H+CTOtC2/k5hecSV
         NLfvNpsam5n/KKyRVbDp1b64e9b1xsPn896uRMIc9HoKdWW/f7Wx1ml3xZYBZbiGtbDK
         cejfq/dd/vixDbsuprRv6llwph8upCxhFGG8i4Ur7KCMcNfQDw99mY1FpsU251EMsY/9
         L8z9vZdj6GIUUZYQsl2SCyXnwVCCEF7j/Vowx7metV0FXNQYJTtHx+LriVOua/XDiugv
         2vyw==
X-Forwarded-Encrypted: i=1; AJvYcCV8OYfaJiFxOjGIhhlMeWlAHbOYdGHVOD9xI926bsIdcEZf0k/WyDvru304gWrenuFPbr2287g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqeOpkQ5pkfWTOJaIm2/8+rx2W/svEYrzBXgfEp9UbK5x7WBcr
	YsRsYbwkWu5IrKymITehKu0ETpmXGbwu9VTswEpCDt4a5Ci4PCCqUeqc
X-Gm-Gg: ASbGncvnmtuNvaw7ffQMUTiGPtG+LmKTA2njwrGebdwt3o9TnGNfKdM4sZabvILei66
	qKSCEgGQkFOnLK6zLza3NmKzkdoBbvGIphBWBrzA6IZnC4ojsVFAbDxs9/MnX/W47V44PK1WKAB
	XoAWF3Ztxnvolmdc/GOuh1eZCDkt7o02T2p5LhRv7SUEWknemRl+/tNBX3m7uM2Ax3byKnR5xBH
	jl12ha9sTo/qi9pCNTtCLu/bfOcQWFhtqduyTYm4FnMABM/UCcRbY83kgJHWLHes0GjrxtPNvQl
	yVgmPaTqeHFP1VzW3HxYSxBxGuf1dDNnEIwf1wcJK/ZLLOrABadiEw==
X-Google-Smtp-Source: AGHT+IGkogtkfd4RaBa+53mBJuGMKYemWXLFm3Z+9Nh+DPGDIY7c7kUnrfh43VEBbsF0oQoW8UIuQQ==
X-Received: by 2002:a17:90b:2e04:b0:311:abba:53c9 with SMTP id 98e67ed59e1d1-318c911cbddmr13750481a91.7.1751185418667;
        Sun, 29 Jun 2025 01:23:38 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::168a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f542661asm10495839a91.26.2025.06.29.01.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 01:23:38 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH v3 0/4] spi: sophgo: Add SPI NOR controller for SG2042
Date: Sun, 29 Jun 2025 16:23:09 +0800
Message-Id: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO33YGgC/23MQQqDMBCF4avIrJuSTIxiV71H6SLGjA7UKkkJL
 eLdG11Z6PI9+P4Fog/sI1yKBYJPHHl65qFPBbjBPnsvuMsbUKKRBrWI1Is4M41O1LZREhvpm6q
 EDObgid977HbPe+D4msJnbye1vX8zSQkpSkeqcqSpQ3vtR8uPs5tG2DIJj9T8UMzU6lpjW5Gxb
 Xmk67p+ARyza/HfAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751185413; l=1859;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=LKtaI0pAOsDCmEDvjcAJQIr31hlkW2ymLC+5XkspvJk=;
 b=YLmRX9bJFi28MdqzwGvr0+LQxNtd9EVILDTfJCzRxnX7jC+jYtagrVP82dyF/rrrwfKmhn4WW
 zofIBYJV37jB52dYeAh9hPAMXx8r9Hhfl+kW72Hms+Der4N9sGbaCD1
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add support SPI NOR flash memory controller for SG2042, using upstreamed
SG2044 SPI NOR driver.

Tested on SG2042 Pioneer Box, read, write operations.
Thanks Chen Wang who provided machine and guidance.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
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
      spi: spi-sg2044-nor: Add configurable chip info
      spi: spi-sg2044-nor: Fix reading bytes issue on SG2042
      riscv: dts: sophgo: Add SPI NOR node for SG2042

 .../devicetree/bindings/spi/spi-sg2044-nor.yaml    |  5 +---
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 24 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++
 drivers/spi/spi-sg2044-nor.c                       | 29 +++++++++++++++++++---
 4 files changed, 75 insertions(+), 7 deletions(-)
---
base-commit: 880f18ee6772d4add69519cb7de2fcf9f4769cd6
change-id: 20250523-sfg-spifmc-7a910290e964

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>

