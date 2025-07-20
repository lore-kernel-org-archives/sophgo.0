Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620C61D79A5
	for <sophgo@lists.linux.dev>; Sun, 20 Jul 2025 08:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753000387; cv=none; b=CeePFgfr+Ei5ZAXZjzhnb5YPBD4Xq2h1vrkbgPqi9sCvI6GPKABc6JbRYKLwxusSs+sjvX+2BtsbaYOgr99DOX+Hh/wysyGkeK/pPLewFUp7q4aOgDOdHhZQKfQIPanQ7eJNZ9JW09Q1TYRU4BlCq4Af39Lsbem2ycORTRu/dAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753000387; c=relaxed/simple;
	bh=g46DzEpcJPn1i0I3gZxZ5oIULesc7GWeVCVQQpgoe9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QdrN6jZPP7P6pPG4H41PD4gYla3W/ThSLqPjHULSOQ3brVGpchhmJTc/FY5EAyuTgm/4UnzAtSonXJx1XNrw+Y/f/MubXu01uS6XN4iY2tizDrrf+yEu380AJO6T+QOgCzMlAJwsqrFuTdzEI+GMXVgKok34EbMM9Q7IiONY+S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zhuhp6qh; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zhuhp6qh"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-311e2cc157bso2873552a91.2
        for <sophgo@lists.linux.dev>; Sun, 20 Jul 2025 01:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753000385; x=1753605185; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5wbWJbaeWY+aCgMCUPKFnVolPrX/Znw1ZkbaA0O6dg=;
        b=Zhuhp6qhE+OEj6RZzbyALG8ztbQQmRUVgA1yEoQTyu48R6VPgov19eAMGrykh8Amgt
         LrvT0N73Uq/RKsPRTA7lBtu0okylRZRj+wefh29wrzhb8paRbr0O7ZgsEfud8f2doy1q
         CzEk7kC4rnoT/DlphFEe3lamRMfMuGzH5BLFSibzf0szQGu5khQl5avDRrEJC6bAGqfE
         GpzFAC7F7IS99qUDW/EZBs21UHrQ0qRXOxNPCL9UHAhQhhSK4nWZkz08zQ6k1YXqEQ/3
         KUkIZdwoVwnGS1vDpNCJLJW2nJCUc0EokiBucF2oOcokbb2PGy2Iec23jN+d7XCNPLCH
         +FQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753000385; x=1753605185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5wbWJbaeWY+aCgMCUPKFnVolPrX/Znw1ZkbaA0O6dg=;
        b=p5+eU2oHAhB3T+g6jZXSgfX5X0kNCAtMhVCyb1qIYsrolUJZEyKT4snKVI2h3aBcLQ
         9wPGhPuinADrAtCW5dSSD/ILlO+Jt2isvnW3W7HbRr9VGHkYWz6t2ecEZ9D6K463gSeY
         2qB3xiKCu9P71HP+Mii0aHyUc2zmlNrqo3c7POEJXa1/nBnJzZGIT36ofr0TAMdxywSy
         cxhsgFWL/EA3eeAXyJ4tvUaeKpGPJ3ZcBzS2Jr69DVZa/8xllD7KoDxILPXeMmJpt+wS
         W10Mmyp6qQKnYgogxBAecSgl/sneR6vOUEL70luPW+tl75wuBN7DvBMnKiqnldskDlWP
         w1sA==
X-Forwarded-Encrypted: i=1; AJvYcCXNzi3XW0E0IZdHWNa8S+/qLhy8NkMais2EYIqUNmTUVea7ejURXKlswqq+E3XnWctBMN2B2Ss=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOiC4GMsww4Nzeca3Rc2l1MNC1SblZYiIjUMXgUGwctZ57SfWw
	kI9YNCO32KJZROYxqOLarD0gJHfBLJ2gUTiM1uTUXI/6PoEufji5oZKK
X-Gm-Gg: ASbGncvixnZC4i1rAj3LSuNE0DvScRRtOZKcIPIeb3mCwYcHnFVyeJOFIuB0N81jrXE
	l0/KUgu0hFrcntj48HSKj1WDUNU7pNIn1SIbVv8oawfmy9JqMWhtNiSjBTPMQYohDHVb2BUm0ZL
	xbns2nwRfWf7ygI+ZSooRSohhhaVk3ZZXGahxvFPB5CuqPcUFhgKaV66AlncVdqj/ZZq10qaI4B
	2epCXlKhZE3YMWFIigSlU7P1iIjY0CWcuGAZ/YLXvccPusQCHOMCH3/s9myNnOIHweFdY7a2UBz
	nXkVeT7+mxWQ3IU0g34NrfgrvWG/xdkmA3HyCXGXKh/SvT4e2YkFAZAmWXlWtrJMf+6HuCZ54Qk
	aKnT4rhYIObjF0w==
X-Google-Smtp-Source: AGHT+IEIyn/EvzX9sOaySrc2fPhMzwDi1IA4hwef15+G6nshGtYUjbbJ9FoduKOhpG+jz6ytWli4wQ==
X-Received: by 2002:a17:90b:5483:b0:311:c970:c9bc with SMTP id 98e67ed59e1d1-31c9e79000emr23616583a91.30.1753000385221;
        Sun, 20 Jul 2025 01:33:05 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1002::1d55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3f46b97sm4079721a91.41.2025.07.20.01.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 01:33:04 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 20 Jul 2025 16:31:44 +0800
Subject: [PATCH v4 2/4] spi: spi-sg2044-nor: Add configurable chip_info
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-sfg-spifmc-v4-2-033188ad801e@gmail.com>
References: <20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com>
In-Reply-To: <20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753000358; l=3096;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=g46DzEpcJPn1i0I3gZxZ5oIULesc7GWeVCVQQpgoe9c=;
 b=YukjZRjuG7zBKFA+bLUHLliBzwC6HfzWrgebpe6NZrnhXBeKuzke63c7trXlc8ATk42WV+NB4
 W3cceLQ0bkGCGS/lgwlQfEoVojsHeaYJy9zSK89/okcCCNQrWR90uBB
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

SG2044 and SG2042 have similar SPI-NOR flash controller design,
but have incompatibility which causes existing driver
not working on SG2042:
1. SPI-NOR flash controller on SG2042 have no OPT register.
2. FIFO trigger level on SG2042 should be strictly less than 8.

So introduce a new configurable chip_info structure to hold the
different configuration.

Link: https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/SPI-flash.rst
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 drivers/spi/spi-sg2044-nor.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-sg2044-nor.c b/drivers/spi/spi-sg2044-nor.c
index a59aa3fc55d277653d01df9c83b3f0aa08edab46..0ef569eb28b7609df1f23d89a6b3e7afc2569c80 100644
--- a/drivers/spi/spi-sg2044-nor.c
+++ b/drivers/spi/spi-sg2044-nor.c
@@ -84,12 +84,18 @@
 
 #define SPIFMC_MAX_READ_SIZE			0x10000
 
+struct sg204x_spifmc_chip_info {
+	bool has_opt_reg;
+	u32 rd_fifo_int_trigger_level;
+};
+
 struct sg2044_spifmc {
 	struct spi_controller *ctrl;
 	void __iomem *io_base;
 	struct device *dev;
 	struct mutex lock;
 	struct clk *clk;
+	const struct sg204x_spifmc_chip_info *chip_info;
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
 
+static const struct sg204x_spifmc_chip_info sg2044_chip_info = {
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

