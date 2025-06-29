Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA2620102C
	for <sophgo@lists.linux.dev>; Sun, 29 Jun 2025 08:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751185432; cv=none; b=kUmdrqe9hoWrt5QXO7GA0/8gWJ12eKPGqiUWhoVJmLP+2zjhCJEAjIAYTRXxNe+eAKeGiibR6a8GHvK/BXS5CQknO7MPQvaTrFiRhkJeewuEkXbp5Eo4/+dDSQFBTey/CvK434R/NjQ4LNB9JzH/Flv1LyMl2GhSeBOv7SbDHHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751185432; c=relaxed/simple;
	bh=vKeGv92LbibVttyHcTTbUTC0hNnYenpRL/AwLj3xchI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SX0MQVLbQ9SYmcmuwJPFW4P24EXRd0XwTmmkMAVLVvdFDSTWJxH8NzWQiINBF2yVdcBJfqAWe1I2/DWWnDXWiu4rLFlmv1b8baxotJs1hWzz5lANppnCzbVDwPLYE58rHLESoieseyNt2LCFJoh5ufscDksn4aSpv2UAIREzWY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igFl+KDS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igFl+KDS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-315b0050bb5so1767139a91.0
        for <sophgo@lists.linux.dev>; Sun, 29 Jun 2025 01:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751185430; x=1751790230; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbDY7+jLzrL1PT5ycGxldl2xKFdQgH0cPkLNWX9XASE=;
        b=igFl+KDSbN8eo6zCDh0W8P6x11fPwwB2Y6/o7+BsHv7pBsBQdyKEShU1wPsZEH8tXF
         7eq3iooFb0u71ZD626DgsWTyYPghF1lhyv/2JaXg/jdxnXmD7TD7GI3zpuZPMDGYGf98
         BpHo+IQ5Hsiz+WoZOAKVUiamjqz5cMInWHy9RkDyvkG+1KPWhAUjyM77gYqi8N3TaRus
         AGwZQE49aHtJlgP0apVLmyo2ZZFyf/p3DKU+bFwemOM8wufW/HcEIN4DxF4nMlceWXzt
         lHA/ZZl+7qY73dEaSeVIYF1TBOSixbWEYN8VXuLEBu6FyFVT0YNSz4BlAiiUlQpCJOaA
         vqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751185430; x=1751790230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbDY7+jLzrL1PT5ycGxldl2xKFdQgH0cPkLNWX9XASE=;
        b=pVS0CHYzCb9x4O3mpRSYnvNwWJdLITOzPBumLlKKLEEGcyt/4bazxFiBd0CIls7FqZ
         kEErQaQUdieso9a8fwU/J+amJB/H/KCfmh7yxPhzESiZBz5NUgYc5LxNhyjhwwLp62uk
         +SGw+j2yr/pn24bBfs/jNQwbmLkqkOlGJiP5kCN+Ln3kmkv9f3eePwl8zV4419/Mouab
         aBMJd2QKY//Yjcgql4SAncsMfS1rIe/fTt6pbOpWXTSAHUgNamGGZB5X1+QlEQPj2+rp
         1ANe1I7ojnfJIQOI0fbnK/qbu6UyUNrNSLNBddLUa1JHenyxRhd8ddnh6phrPU5os/Me
         WHUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzTP/Lang5s7KWRIRg76iJKitcLng2oFNlOeTQRLTHSZKxX6RSNhU2Lpk+T586wPOeUQXtcXw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRmgjFnCGTnaSzey/qt72ZxVjRDXcbLlxon3diBeRRDOIuGI5J
	jwuVqQeCYHw/javSwn3r6yJSMh47gPg0LpddMK/SDR1KVPfs+5tf4uJv
X-Gm-Gg: ASbGncslcTDAG/jqVnorXB98ecdJ9IiM9KxM0EXXVEkmphpZaFgRh/AmTTq0Le9yjnC
	5Q4D2YaZj6pFKQlbYJ7ZPlSwWi0dtf5Q2hk76cchv/iEKFePenTLGfYGjkIeYPoE162XTGjjUCA
	BTPiFbjw1lZ+0moJc95KIK0uDBQJs8vmQadqPY0KQC+GtfJK3UVLw4VjH/ENvvyrH7QLmNqnPiX
	QhWYPdzdrDcjYthTeiHJVi6lTb9/I//A841p6MbdFQQS4GYV1VKLBd71Yfc2KSdlWUIllORQ7o5
	ztukWnTDf7XLbMd0lp+bOBeJYacvw4zn9XEtY7zIlba51mM06Dv6tQ==
X-Google-Smtp-Source: AGHT+IELHhhDxgnpw3MWnX1SUdpFfj8qVHJzMWazZcVe7MfSiD187uIdapbtW0jVyzAPN3EEEu1YGA==
X-Received: by 2002:a17:90b:528a:b0:311:d3a5:572a with SMTP id 98e67ed59e1d1-318c9225e52mr13102958a91.8.1751185429842;
        Sun, 29 Jun 2025 01:23:49 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::168a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f542661asm10495839a91.26.2025.06.29.01.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 01:23:49 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 29 Jun 2025 16:23:11 +0800
Subject: [PATCH v3 2/4] spi: spi-sg2044-nor: Add configurable chip info
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250629-sfg-spifmc-v3-2-28db1f27e999@gmail.com>
References: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
In-Reply-To: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751185413; l=2775;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=vKeGv92LbibVttyHcTTbUTC0hNnYenpRL/AwLj3xchI=;
 b=1JEJ0sKTI6zYuq89x/DJJ95DWZmlHfX0cHx0z4Qe0aGYXpNYwXGQGNhVegUI0kLoyOVZ7AlyG
 v3WNK93YDK1B22T1yDK8uuuYFZIup4kI9OB8+ZxQ29TmQLBJHJ0lHxf
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Due to the differences in the SG2042 controller, a new configurable
chip_info structure is added to implement that.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 drivers/spi/spi-sg2044-nor.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-sg2044-nor.c b/drivers/spi/spi-sg2044-nor.c
index a59aa3fc55d277653d01df9c83b3f0aa08edab46..09a5712822e32c9da818684e7010b70aa94ae347 100644
--- a/drivers/spi/spi-sg2044-nor.c
+++ b/drivers/spi/spi-sg2044-nor.c
@@ -84,12 +84,18 @@
 
 #define SPIFMC_MAX_READ_SIZE			0x10000
 
+struct sg2044_spifmc_chip_info {
+	const u8 has_opt_reg;
+	const u32 rd_fifo_int_trigger_level;
+};
+
 struct sg2044_spifmc {
 	struct spi_controller *ctrl;
 	void __iomem *io_base;
 	struct device *dev;
 	struct mutex lock;
 	struct clk *clk;
+	const struct sg2044_spifmc_chip_info *chip_info;
 };
 
 static int sg2044_spifmc_wait_int(struct sg2044_spifmc *spifmc, u8 int_type)
@@ -139,7 +145,7 @@ static ssize_t sg2044_spifmc_read_64k(struct sg2044_spifmc *spifmc,
 
 	reg = sg2044_spifmc_init_reg(spifmc);
 	reg |= (op->addr.nbytes + op->dummy.nbytes) << SPIFMC_TRAN_CSR_ADDR_BYTES_SHIFT;
-	reg |= SPIFMC_TRAN_CSR_FIFO_TRG_LVL_8_BYTE;
+	reg |= spifmc->chip_info->rd_fifo_int_trigger_level;
 	reg |= SPIFMC_TRAN_CSR_WITH_CMD;
 	reg |= SPIFMC_TRAN_CSR_TRAN_MODE_RX;
 
@@ -335,7 +341,8 @@ static ssize_t sg2044_spifmc_trans_reg(struct sg2044_spifmc *spifmc,
 		reg |= SPIFMC_TRAN_CSR_TRAN_MODE_RX;
 		reg |= SPIFMC_TRAN_CSR_TRAN_MODE_TX;
 
-		writel(SPIFMC_OPT_DISABLE_FIFO_FLUSH, spifmc->io_base + SPIFMC_OPT);
+		if (spifmc->chip_info->has_opt_reg)
+			writel(SPIFMC_OPT_DISABLE_FIFO_FLUSH, spifmc->io_base + SPIFMC_OPT);
 	} else {
 		/*
 		 * If write values to the Status Register,
@@ -457,6 +464,11 @@ static int sg2044_spifmc_probe(struct platform_device *pdev)
 	ret = devm_mutex_init(dev, &spifmc->lock);
 	if (ret)
 		return ret;
+	spifmc->chip_info = device_get_match_data(&pdev->dev);
+	if (!spifmc->chip_info) {
+		dev_err(&pdev->dev, "Failed to get specific chip info\n");
+		return -EINVAL;
+	}
 
 	sg2044_spifmc_init(spifmc);
 	sg2044_spifmc_init_reg(spifmc);
@@ -468,8 +480,13 @@ static int sg2044_spifmc_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct sg2044_spifmc_chip_info sg2044_chip_info = {
+	.has_opt_reg = true,
+	.rd_fifo_int_trigger_level = SPIFMC_TRAN_CSR_FIFO_TRG_LVL_8_BYTE,
+};
+
 static const struct of_device_id sg2044_spifmc_match[] = {
-	{ .compatible = "sophgo,sg2044-spifmc-nor" },
+	{ .compatible = "sophgo,sg2044-spifmc-nor", .data = &sg2044_chip_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sg2044_spifmc_match);

-- 
2.49.0

