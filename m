Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C40A21019C
	for <sophgo@lists.linux.dev>; Sun, 29 Jun 2025 08:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751185438; cv=none; b=fAarj3T3QqOp88J+N09DkyIUdcmAyipoz7/VXoz3WdifAsXXwf8jITi3AVEKpi1m3CNizV7rbsg8Nz8TflJO1jJZfYT/7JkICT4YxIpLxlsJn/IlNcdMqimNEKKWZIL8dnEQBV9G4Wz1BV2MDo1OOCgYnG8Rx5zH8yA99o2crKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751185438; c=relaxed/simple;
	bh=9hfluPES3NJNacigLt9GPHetnqMVb+nAsHw5PVH/j0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E9zzTPmsGGMwivKGPJLurEzhgMPmZOuR9Nk2OlnRSYzeorS8JRrRFo2Y3w6FuHIRwSd2ffOljC+qMDbQGkVP5TZUxalvpuOwGZF1fTST5Ot1jBc5mitwJNl0/27ihycFfe9j/gmBjLBM8k175n87aVZicMjg/hK7VeIm+zW5i+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X080rsEZ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X080rsEZ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3190fbe8536so171098a91.3
        for <sophgo@lists.linux.dev>; Sun, 29 Jun 2025 01:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751185436; x=1751790236; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mt+ql+PrjmzYyafappxb+kroF0DLVLujfMoQHbjak4k=;
        b=X080rsEZG207LbhAeG/IZvOy9CmXIV6MdLMAVfYHjhhAC460wP74uF0+7CQNWNeeac
         iOVHuUnGynVhFP1T2JYYZhwqXYe4nX4N0Upk7QSq7zrT30Pr5s51OAPv8ga0geWMmnwY
         NNVYFCE9LtCpUM/M5xndjKisNOA499Ml4kgpcUli3Yd+VM5Nqj0yMI5RZIWc6V+uKmR1
         YqgmqYimZ/PJD7oeJysj70uAhVzxwAy9/6JucOA9x5+Xv10HnC0U5Ww5zWE7YRyLe+0v
         akDnko+iQEMGdlf8K+ptlhx/D4orCbZsGwSiNQt9xbe4Yhg/SX6fve5SCoiHomhC72yI
         3RCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751185436; x=1751790236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mt+ql+PrjmzYyafappxb+kroF0DLVLujfMoQHbjak4k=;
        b=wQKHfyxiz2edCHfxy7p8w3uEJMQOgzkDe4JURviQFlZOmonxrJBNrNjEQidmbqO/pg
         Jj06uWAmH4TWgY9+HXRc6JRU+J2sediDQcuJbKZSuhNY5ILCLM5Dp6UdfYuwMVTxRblf
         9fFlAE1ZommL62+emOZfRkSBeSsKaWfu6CGeY6bWCYNVyCjED+m6bzY3xixYl7g6ZMNn
         wf1v6BN2fiJ5FdmVBpBFd5BdMThcfwiqrZAdpcHtUqda9AJZNd13T8pScR9hOISxati0
         flng/66ZE/Y5QjDxbVVk4cvTgcWHjAbnDl4VuuhsGxHxnkuTaMeZphMeofBLomXRhVzm
         pVsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6fuwopfQtPFncmeh2ycq1mx8m10UFRaE3EUXh/xGholNyTxlnXhkSvaUDPdTijLUm3tuBzvw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxmll7bALc/rHSw0VuNbFZK/tajooeW8ZmLOk98Q6y4hhEjPLHw
	1aawzKa17GLGA9Z5ZPCudOdqVTrUyzsHCHmIDgPqwYwFLi+qtBhkXHx7
X-Gm-Gg: ASbGncvTS1fmwbUKw7EO9PKW7SMG+5E/54x+K5S/JV0euyjjeJHVXg42aHV6MhOYEdk
	MTRhm6qLFUEoa7x0cieQ4kQyJyZNYP4cucqL4edkGMKaEe4OOnoQSfqG3X1igcrRsrzTYQxlUsr
	9gGvraH/0/R4XSQONJNagk1Shgw1gUdIGzZ3PZKEqiNAPxp14kKjOz6K0vDbpv3zekJqw4fF8uR
	lNog1mmexNqk6jIh0st8WeOYDI7GMYCU/P5Q/Gd1Xs6UIPP482cp0bxZTLndmfo004EB2x5AcW8
	i/X9h639PiXivt9cn9sMkOq2gn8sRj7GCE39ms2XgX/Fn+bsqZonjQ==
X-Google-Smtp-Source: AGHT+IGHSGmVXaH1qzRx8krEwxIKwAdC/CaF24fxPdx796M/L8k62EbYQxOG2adPibF6rWxhZKMrig==
X-Received: by 2002:a17:90b:2f88:b0:311:ba32:164f with SMTP id 98e67ed59e1d1-318c9223bc9mr14517657a91.8.1751185435487;
        Sun, 29 Jun 2025 01:23:55 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::168a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f542661asm10495839a91.26.2025.06.29.01.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 01:23:55 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 29 Jun 2025 16:23:12 +0800
Subject: [PATCH v3 3/4] spi: spi-sg2044-nor: Fix reading bytes issue on
 SG2042
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250629-sfg-spifmc-v3-3-28db1f27e999@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751185413; l=1655;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=9hfluPES3NJNacigLt9GPHetnqMVb+nAsHw5PVH/j0c=;
 b=R3LSjxSyIuRG9w/LW3zvpCkqpEFDEkeviRHy6Y1wZb2EF5IOFZcZRrcTpA9XenOZVYr94SeIF
 alftbtOoyPEBBnhJa3VJMdnFzrtAvre4ooQIwpIt9DDaVZahZFOQDcW
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

SG2042 spi flash controller specification[1] states that:
> For Receive, an interrupt and DMA request are generated
> when the number of valid bytes in the FIFO is greater than
> or equal to the number of bytes defined by FFTrgLvl.

Auto-detecting flash with SFDP only requires reading 4 bytes
in spi_nor_check_sfdp_signature().
Because of that, no interrupt is triggered and a timeout happens instead.
Since we want to reuse this driver for SG2042, setting FFTrgLvl to a value
which is less than or equal to 4 should solve the issue.

Link: https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/SPI-flash.rst [1]
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 drivers/spi/spi-sg2044-nor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-sg2044-nor.c b/drivers/spi/spi-sg2044-nor.c
index 09a5712822e32c9da818684e7010b70aa94ae347..c1fe43e09c549328c0d046fc95bed130083dbbcb 100644
--- a/drivers/spi/spi-sg2044-nor.c
+++ b/drivers/spi/spi-sg2044-nor.c
@@ -485,8 +485,14 @@ static const struct sg2044_spifmc_chip_info sg2044_chip_info = {
 	.rd_fifo_int_trigger_level = SPIFMC_TRAN_CSR_FIFO_TRG_LVL_8_BYTE,
 };
 
+static const struct sg2044_spifmc_chip_info sg2042_chip_info = {
+	.has_opt_reg = false,
+	.rd_fifo_int_trigger_level = SPIFMC_TRAN_CSR_FIFO_TRG_LVL_1_BYTE,
+};
+
 static const struct of_device_id sg2044_spifmc_match[] = {
 	{ .compatible = "sophgo,sg2044-spifmc-nor", .data = &sg2044_chip_info },
+	{ .compatible = "sophgo,sg2042-spifmc-nor", .data = &sg2042_chip_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sg2044_spifmc_match);

-- 
2.49.0

