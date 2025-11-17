Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838BB320A38
	for <sophgo@lists.linux.dev>; Mon, 17 Nov 2025 09:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370375; cv=none; b=uvKuNxH6y6INiBYtPyvOdDnQqswpprEbRk5l5NR2DBmZukq7WaqbbNGYhNbNCGPUaUmfT60gRmHH3nhnEJgDwpT8WLVSpHxHmLSkNhnexwFR9eNXMc3WlyGOzNovD6YsSiyQiDZGs6b/la3hidsjEFDy9yadPFFSA3zhxMOKPF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370375; c=relaxed/simple;
	bh=hcAuad7b1ccILM/PHJHj5cUkxmyMOCNodizLhyRt8bo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ePAu8Rhuq1eZAWDYcZSvsWz0NeFr+45uaJ91fzjOAvv3rwXf45n5AxW1J8L3pPgJpBW1P1wOXLmmF8LxMRWFWkcmZn65hsjWL5RdcEDCYwRcxh+ihb9GDbVNtirgVKRkk9mhiXdtF1YAaBfXozCdTUzKJm49dAdFeUR1hcWJ8L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPnG6W2T; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPnG6W2T"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-bc29d64b39dso2401847a12.3
        for <sophgo@lists.linux.dev>; Mon, 17 Nov 2025 01:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763370373; x=1763975173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OMO5ie94w8lcBT6lm38XSRIvwKFLL7hEmJp5CRt+oh8=;
        b=NPnG6W2TM/3pu5qL5Klzat3vNkp2UbF07urAuFw8FNLhl0D96LeaYIlYPCW+nrwMV5
         0C/vVbmnwrMJsi5zlM2gu4o4OWrMAlbijz9U0N5WxsDnS4BUxU/lfZSAmOwJafT9Gl99
         cZVUKExpFmM9OuNStg+yxT5iNMrszLO1YrW24X0oBJqfQn3p1B/ykS87C/8UxvRSWVd9
         Z7TSDxQg82piCXzo1kfw+Nz+bkmeiDY2SjSW7H9fa+BSvr1Fmeag+gn2Y5rR16RaYTTT
         n0ALeX2R79twd06nLjVqnHsvH+qBMHyFGcrLLXu776hnyr56TaoVy//OGTW3DwrVnsvC
         H+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370373; x=1763975173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMO5ie94w8lcBT6lm38XSRIvwKFLL7hEmJp5CRt+oh8=;
        b=eMdx5j91FuYd7sTZt6LnrEOe4xaz/XuMEE5O1i8lktZfSq76rB1TJ5LE1TaxAlkdRN
         lseWAFc+zSjR228/krAA3ps8R1QV7cClIH5ExQQfLLAuG4QiuQ5S7SY5osL+HmGgBA5y
         bOusMB/7yraDfxTxfozr5lUj+RyKZCCroX4EwtwNszPNA93ssfpJZyaBGxKOGHKObfs8
         d/V65pN+fMPIdzXRfJuIrMMjxaCldAA46aprSjCKuAleOdZ+HMmLLakg+jX9iByNBHKI
         zUiuV64clshhUx1Q2VZ7kPPYIqSmzpS0MhqrCDdnJkJQ71TRbcoJCp6lO6D5pNcbj9g8
         bXyg==
X-Forwarded-Encrypted: i=1; AJvYcCVkCYcDQst2RxXAhZ8fMgvYrCg+AUBFLgS+k5rNaeXwA2tRkZBKpCFroe7LqUL+vvXu7bZDaD8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4zx64pKa9iqfcDTl/krVkDWpsfLeHLoUL3ZYzuSGPOo5r+Ptv
	/pUfzx8TLw/h1uZg+cB8EDA/0Hu3CMX63rZLHTROgjteW2unbIVJ3gMx
X-Gm-Gg: ASbGncvzLzOEbexBqSVLbcYNTv7RW0YjL+c+IMALvx+1U4nHlGViw7Oxbh7T5QtlQRx
	0QCVUd+D8owHf2GnZLwTz0o5lXg8ajzvNpvXNUMEngk7faTP8zDPNDjNRh8Q0+ilO+ysjT9zk88
	8Zu94POCjNLfjX3RAvC7Lf9adkB6yaCWiSlB9CoJt7SEP8luCqgQrpVwqasdwdVpVwpkK43IFx0
	0ok6Zc8Ums0s3BWwe+8L6DKJXl4NKgtOE4h+pAPrKKWjjBUu8Enzc5qtv7M5YS4CDDRKaing4Pk
	O7CZF0W/tS2WhJIGTRafrAc43iZ42vX7TBK9/8qNJZg4gIMIO/y+X+kOokda47LXfPJEc//CwlE
	YE18xwiExIDlqdZkvdVCluDXrWzyuM/3Bjal6MTCS4uleRx6Vz+LdzVf+cya6nCmPWdx2GzOPHR
	BeVzuMu5E9eEafSOveLt1IKgGCybs=
X-Google-Smtp-Source: AGHT+IF/JU+kMFiIAfX2k1Dm6SWfMM6AyWK7LDvkc6/yQQso64rIW9bWr+iBK9Lwln4yavxaqi7imQ==
X-Received: by 2002:a05:7022:6621:b0:119:e56b:91e6 with SMTP id a92af1059eb24-11b411f0b58mr4788078c88.23.1763370372524;
        Mon, 17 Nov 2025 01:06:12 -0800 (PST)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b06088604sm47916498c88.7.2025.11.17.01.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:06:12 -0800 (PST)
From: Longbin Li <looong.bin@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: [PATCH] spi: sophgo: Fix incorrect use of bus width value macros
Date: Mon, 17 Nov 2025 17:05:39 +0800
Message-ID: <20251117090559.78288-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous code initialized the 'reg' value with specific bus-width
values (BUS_WIDTH_2_BIT and BUS_WIDTH_4_BIT), which introduces ambiguity.
Replace them with BUS_WIDTH_MASK to express the intention clearly.

Fixes: de16c322eefb ("spi: sophgo: add SG2044 SPI NOR controller driver")
Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 drivers/spi/spi-sg2044-nor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-sg2044-nor.c b/drivers/spi/spi-sg2044-nor.c
index af48b1fcda93..37f1cfe10be4 100644
--- a/drivers/spi/spi-sg2044-nor.c
+++ b/drivers/spi/spi-sg2044-nor.c
@@ -42,6 +42,7 @@
 #define SPIFMC_TRAN_CSR_TRAN_MODE_RX		BIT(0)
 #define SPIFMC_TRAN_CSR_TRAN_MODE_TX		BIT(1)
 #define SPIFMC_TRAN_CSR_FAST_MODE		BIT(3)
+#define SPIFMC_TRAN_CSR_BUS_WIDTH_MASK		GENMASK(5, 4)
 #define SPIFMC_TRAN_CSR_BUS_WIDTH_1_BIT		(0x00 << 4)
 #define SPIFMC_TRAN_CSR_BUS_WIDTH_2_BIT		(0x01 << 4)
 #define SPIFMC_TRAN_CSR_BUS_WIDTH_4_BIT		(0x02 << 4)
@@ -122,8 +123,7 @@ static u32 sg2044_spifmc_init_reg(struct sg2044_spifmc *spifmc)
 	reg = readl(spifmc->io_base + SPIFMC_TRAN_CSR);
 	reg &= ~(SPIFMC_TRAN_CSR_TRAN_MODE_MASK |
 		 SPIFMC_TRAN_CSR_FAST_MODE |
-		 SPIFMC_TRAN_CSR_BUS_WIDTH_2_BIT |
-		 SPIFMC_TRAN_CSR_BUS_WIDTH_4_BIT |
+		 SPIFMC_TRAN_CSR_BUS_WIDTH_MASK |
 		 SPIFMC_TRAN_CSR_DMA_EN |
 		 SPIFMC_TRAN_CSR_ADDR_BYTES_MASK |
 		 SPIFMC_TRAN_CSR_WITH_CMD |
--
2.51.2
