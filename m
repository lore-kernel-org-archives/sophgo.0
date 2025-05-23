Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38C422A7F7
	for <sophgo@lists.linux.dev>; Fri, 23 May 2025 10:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997712; cv=none; b=DZqko9CBfQt4Q32k/OY1Hit6dyIbkGcdU45pwXQ9qAKkHeDtXuVkLYaHtT+V/m2rBm4/iNnRoHzmpjB7YE6BQe/w0Op3DNOTS3zMRbx/4kEB/oLZXLFxRBWY8eqtP/OFJus6VjZ1BYZ8ApHG7C2XO/fOOefiKfDNc0ZoyO4iW6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997712; c=relaxed/simple;
	bh=wrfl3Lk72HbCltyE08DEiiUBoQE22JPWb7p1k6l72Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ROesFm9aKAfr8b6yUeWUu7OOW4BM9nFcI15efLvxSj43b4vWpDr9aFSk6P7c9r4S5RKR4WOGXACB14SvOy3gKCXTlaVjC/HwE22rgLnSRhQxeDQno7uEpD35NpgCD/Kz269Fz0uDIhM2tYVaDaWcDiomhN2EDZH7x+UPFYJCF8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/39qf5/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/39qf5/"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7426c44e014so8638647b3a.3
        for <sophgo@lists.linux.dev>; Fri, 23 May 2025 03:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747997710; x=1748602510; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Af/z8wwyeFXwEhzwxCix9R1kShAhXfBPAEq0I6jGtUU=;
        b=I/39qf5/Cgyp8xhRHTDFR6HJsRyjy+GNYNMsWvAH6WTTriIO9zW33P+OdGTRTrupI9
         52ss8F8OkVLBlUd3mqtW8Iay6K4rdpD/hOJLRO/HvwLGVw0p3DNrnsy+X9O1WiN4BJIL
         faICKnCuV3+p6KC11Hf5N7bRdX3ao9HVgRIxVD3G+4kCONjPTSxHfNSWuYZjzoYNWcWs
         KEkk5gYCceuvC5gMQG6GEM2/eHhEA+aMfatnZVuGj9TklPNntbNI0RVSpg5Zt+yjPqlp
         t/ZAzDD5arfWYU0qMSG9++eJW7oyhISD8kQoqdFMobgyKcsgZHSLJMgyX3yOhKi0gyPI
         dQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997710; x=1748602510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Af/z8wwyeFXwEhzwxCix9R1kShAhXfBPAEq0I6jGtUU=;
        b=jNJz2Qvd3fApalg9hvKqIe3kh9pHyA/VU0KxADV4QAW8YOQ0/3IGf2xhRkoTVq0nY0
         6Drxu0cHkzGxccvq7gdAFX03AadOMGkHWrTbx1UdgjZIqFNcLX0jP4nCzEmpYGkqUv+3
         rlg6fJAGzoxFLYOi7pBKYDN4D4SSeWw1UaQ6LNoJAARzfEV3TwEpoxz/ahGWk+/ftyGf
         YlInV1/twOOaZQtqKXcdOoEpVaH1lIZ5svK6WctRIocj8MCYcVLzB3dhMEEwMBw16XbP
         VIef9yiqXh1Qw5Dyhy5e28e9pWjiw8QobNPmDB2n8Xvmx9R0zAPnrlEP8NPtrGUR6eOH
         sIgw==
X-Forwarded-Encrypted: i=1; AJvYcCUDqj6VFoG0mBb1Er08OQ3tDofAnPo8UAEEo0J5PvAIXaBebIQy3I6Jo70gLtHuap1XV49m/uY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyT0FqgUY5msTUIfq1bFiRQQOIkFUPgnzV4m+bb58i2yh1lRHu
	AUdfruXYSGHTlmrvckM48hMv5xUsfaQwPox0Mi/ZQywdr5GT4CoK1qE3gWd/e5kesC+lcw==
X-Gm-Gg: ASbGnctw/AuJUJ/n1IWn53Y0A6zEr9FwaabMPRihvdG76F+e8i7KaN4c0dQNgTWkKnC
	IvgEb5HmR6vUp+CIkHTPGE6rutJ4n60peKZVsCqWN3R2Mg5ckkFeVNe4tpWD+h9KEcdbSqwiFCF
	n/Z1cuSyfmzD/d6JZclgCKNBK/T6KpmxOCXtsV+Fi6vM3KdyPBCyDbEWO1EnRAYF2PRI/qbgNkm
	6ZRAQRHEfgeF5SERBhgVoG6L/uy5TxPwwVSUt5dU8Q9ieOnRd/rFH3S3OlggSrtSZxWms4TKE1k
	3Oi+xY53AM0D/N/5wr9esxO/FcgkzJLob0jDWaS9wfNrJ2R9PZapYw==
X-Google-Smtp-Source: AGHT+IGI5aXReklpV2gCBTwNnneLjIs6n0VThj40N2VQD3R5/p0nmLA2VAhcsgNJkaCXO4niO0rEVA==
X-Received: by 2002:a05:6a00:4606:b0:736:7270:4d18 with SMTP id d2e1a72fcca58-742a9803dc5mr35780529b3a.14.1747997709877;
        Fri, 23 May 2025 03:55:09 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9739cdesm12623687b3a.82.2025.05.23.03.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:55:09 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Fri, 23 May 2025 18:54:50 +0800
Subject: [PATCH 2/3] mtd: spi-nor: Add GD25LB512ME GigaDevice flash_info
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-sfg-spifmc-v1-2-4cf16cf3fd2a@gmail.com>
References: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
In-Reply-To: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
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
 dlan@gentoo.org, ziyao@disroot.org, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747997691; l=1434;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=wrfl3Lk72HbCltyE08DEiiUBoQE22JPWb7p1k6l72Jw=;
 b=hEwSLbpfM82rWJyMwosPQxvp3UoOlvxmIw3Db3NJlc83C7FuL8x91nrHYfnh2aHM1+AdkmrJL
 in29ql7OAPmCqgpQ3hK85RbC3cC8OF8MyPFP4WKiB+/WzK2VR/TadCn
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add GD25LB512ME SPI-NOR flash information

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 drivers/mtd/spi-nor/gigadevice.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index ef1edd0add70e6ca501620798a779d621d6bb00d..223b2f598ecd651ce8df6789dfbaf938c534f94f 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -33,6 +33,15 @@ static const struct spi_nor_fixups gd25q256_fixups = {
 	.post_bfpt = gd25q256_post_bfpt,
 };
 
+static void gd25lb512me_default_init(struct spi_nor *nor)
+{
+	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+}
+
+static const struct spi_nor_fixups gd25lb512me_fixups = {
+	.default_init = gd25lb512me_default_init,
+};
+
 static const struct flash_info gigadevice_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xc8, 0x40, 0x15),
@@ -82,6 +91,14 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x67, 0x1a),
+		.name = "gd25lb512me",
+		.size = SZ_64M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.fixups = &gd25lb512me_fixups,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
 	},
 };
 

-- 
2.49.0

