Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D26267AEC
	for <sophgo@lists.linux.dev>; Thu, 13 Mar 2025 13:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741871520; cv=none; b=SmMzr5QhFKvue5JM/QZ+HBTRFaJ4Gf5PeBLHOxNMYnhwR7JZjaJXNpoAr0Aw0qjtRPX9csf0efQVaKm/0Q6tNp2TJZgW9p2D7KhH/pIm6Dk0puD1DnSpptXLYFsNeYF+Azdd7CyBtWmoOkZcPN5m02DchXdTKWo5m+BtSeSnZCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741871520; c=relaxed/simple;
	bh=ymhFzABxxhmuPpjW8bVGj4OoIaYa+Zw8k01HF8R1co4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ub31gBA7G2eT5no1L2Z2cL15paR0l8it46WdZsDyHaUYfMbhDVsmJbvreW2AdUFEDLSGd+rISc6XgRchmZ3z0nxBUFzDM/uGrEscHLGAn8HmOROAIZmMCOQk30E8kjSmEI46fN4eKq0TBRPeTDdwxOYQZL8t/veKCbRgSn+P9LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsWYPhIQ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsWYPhIQ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-223a7065ff8so24396785ad.0
        for <sophgo@lists.linux.dev>; Thu, 13 Mar 2025 06:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741871518; x=1742476318; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=whAbkbFeemn/zGkgo0Y/FdRAbnzleJIZKjpHt+Srrxs=;
        b=dsWYPhIQ2jzd2Bg4f629P1CB8JfpjBslBQ/DqhkvPT8HLPDu6r71triHS5aKFI9eOU
         mSVvjpYeVEn1yTAcscQff31WFIRApIDWkshsHMXVSU5Ckb/iklDalzmIhpv7D75vqWwE
         z+/P7fWZP5NJHEDsBzqLib4uaDn1SiZKe+XNomwBpwUJg+90e8ktsqjRt2bFENBFgYaN
         ML5Tv6g91w9mSAL4KjeL00Z4SNOPasofUbyV4zBzig43n+ml5SXgaoJwnivFSfo7Mc+o
         UOTlHzlSXqtZhJ4FGDhKq9BPunID8RM50ulszA2sV4vXL6BIFosn/BOjj2boknffiXuY
         COeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871518; x=1742476318;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=whAbkbFeemn/zGkgo0Y/FdRAbnzleJIZKjpHt+Srrxs=;
        b=aU6P+WTuXZxjebOWNsHNQcmhiiVUpeqZjf+zAlHYzTIxuOlnDMPT7fAg/TkPn64AGA
         Ileilz0eOySzjkPVYnFJFyvd2ltWcEIViXUsC7BS2l8tA60AVtlvynd91pH3nZoZRqjJ
         2HikN+O9pxX5bfFlSW19yehi19HJ9El7rokeK/dp+66cTxpmX7mSBPaX87aoDjLpV3Cy
         ppb0zFa/G8raDH0y8VlYWHi0txgq0shhMD8cyWAGax+EDC6mza+kyvo1/xucTD7R9RtS
         8sxhWD3LdfXo9IJXoGRL0RBa6Neaec6BuA9JdDyQjdRZXRZDvyZyM46VwkdHQjMTahRj
         crJw==
X-Forwarded-Encrypted: i=1; AJvYcCW9ggtOsIQI2s6udtk9X/HmE0nqZkKT142I6ptUz5JADyyrCKNWRSSToq7HRimWooxhpg2AG88=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvTXisQRkEErlubC7YR/kDqZN1rIUzcOF77kvr5UixNGRo75oi
	REntz4wcePr2j2C/YBP13i5opBSXLrRONBvpwu6UHvfZgd4a6QQx
X-Gm-Gg: ASbGncugeR0Rs4koW4/HuaDaonqKa50Lt4pA9xoV5cPGHNt2rssFDkPgxbSDTsLgj5f
	YfpUqzTy1+YHzz0ZlUkWEaSZrSOd3l0uQ5YrXbG9YUE2GfxT0iTSMSK9JmA33ZZ5NYKV0kaC10A
	QxVslYCu9NlpcGfZyuijtbaMqLqm09oaklmzuptE/tt/zE0zPXHdHekQ4BzuJKbX2xuXF7p1TkL
	8nBeJKBiT6VzXYAM8KctQcETG+llevOkmzp8QzvS3JUlz/WLiJt/AKb7GnmUiIgIUjXWK6piYm/
	//PK65S1Peqxd64Oqp4F15V2XlUKuDoXdbw=
X-Google-Smtp-Source: AGHT+IGYDZAgi/KLUPOznQ5xgfjN0dWdgaVF7llKO+O2iscvEuZFt77ZOFuioppulgZ1uLXSYl+/UQ==
X-Received: by 2002:a17:903:230d:b0:223:f9a4:3fb6 with SMTP id d9443c01a7336-2242887b4abmr382460685ad.11.1741871517948;
        Thu, 13 Mar 2025 06:11:57 -0700 (PDT)
Received: from [198.18.0.9] ([2a0f:7803:fac5:a7b6::1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d52sm12539615ad.116.2025.03.13.06.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:11:57 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH v3 0/2] (no cover subject)
Date: Thu, 13 Mar 2025 21:11:48 +0800
Message-Id: <20250313-sfg-spi-v3-0-e686427314b2@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJTZ0mcC/3WMywrCMBBFf6XM2kgysZC48j+Ki6SdtAP2QSJBK
 f13064EcXku95wVEkWmBNdqhUiZE89TAX2qoB3c1JPgrjCgxFoiGpFCL9LCgnRAR62T1nko7yV
 S4NdRau6FB07POb6PcFb7+tvISijhrbGOOnuxSt360fHj3M4j7I2MfzwsnvE+oPam7iR9e9u2f
 QCfbwvy1gAAAA==
X-Change-ID: 20250228-sfg-spi-e3f2aeca09ab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, chao.wei@sophgo.com, 
 xiaoguang.xing@sophgo.com, dlan@gentoo.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741871512; l=1276;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=ymhFzABxxhmuPpjW8bVGj4OoIaYa+Zw8k01HF8R1co4=;
 b=ceQjO7hj4JE91EZ1K+OmC7H/r1+Yyt7wnSBhFNdaAQyaqmBpaeoOe3uYiEL1M4O+ok1M+xlVp
 c0kytGfEnFvDm4NumSnrSAsMqwu9q4iIQxryJ1f2zrVPUKtWQcjC/En
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

This is tested on milkv-pioneer board. Using driver/spi/spidev.c
for creating /dev/spidevX.Y and tools/spi/spidev_test for testing
functionality.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
Changes in v3:
- disable the spi status on sg2042-milkv-pioneer board
- create dt-binding of compatible property
- replace the general compatible property with SoC-specific in dts
- Link to v2: https://lore.kernel.org/r/20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com

Changes in v2:
- rebase v1 to sophgo/master(github.com/sophgo/linux.git).
- order properties in device node.
- remove unevaluated properties `clock-frequency`.
- set default status to disable.
- Link to v1: https://lore.kernel.org/r/20250228-sfg-spi-v1-1-b989aed94911@gmail.com

---
Zixian Zeng (2):
      spi: dt-bindings: snps,dw-apb-ssi: Add compatible for SOPHGO SG2042 SoC
      riscv: sophgo: dts: Add spi controller for SG2042

 .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml   |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 26 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
---
base-commit: aa5ee7180ec41bb77c3e327e95d119f2294babea
change-id: 20250228-sfg-spi-e3f2aeca09ab

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>

