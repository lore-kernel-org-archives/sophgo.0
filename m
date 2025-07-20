Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE79B26290
	for <sophgo@lists.linux.dev>; Sun, 20 Jul 2025 08:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753000397; cv=none; b=Zw3xNP9hQloyVMzLjO6RRoyzy2ICH5ayIBLOkZXw8C4njgGxp0lboElgGBbsz9jA3502/Qjo7k99pbdQGlCiNCJaG+bKIdHN954Buu+mRcIJ0Z8iWr+ZrYm4/Wc9YraN/p2vZ+lNmO/kp6XWZb7GiY9jkvBnte5VNq+tvjFBUN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753000397; c=relaxed/simple;
	bh=invs7khMKVNjBA2XGVM7X5zuJ+fCJ3XQUvHieDAkEjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PUXLYTW1qa9PViRz6l0iY4RBOIRfEkpRVYnYhLeZbALVkc1UdMHfca/SvkXi/qF8zKloK8muXVgiF5Oa71sLrmxcAlpd/+ZUWbdADuAAdTDEdgDv0fSZAZo8l0VE3sVTzmXrTrMeiC+6frI4cRrL7LTaf+YdyK7rhgjlQVWj45M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgdRNQZu; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgdRNQZu"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b3be5c0eb99so2507957a12.1
        for <sophgo@lists.linux.dev>; Sun, 20 Jul 2025 01:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753000395; x=1753605195; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nq9V4nWfYcJsLfYnrUeKCl4BP7Q+oHE4ZTsPuy9Af74=;
        b=FgdRNQZuQUXu2sKPJQM7Fq+/k/XeqaRx8KfgknMl5TgylWAfXC/q3IQ6sz2iNede+q
         ycyb0ozQJsLZ9O3cOWu9/UQYXOi3u1+IUaewK4qJJXoXUfHAkpfKHEMS0V2Fsi0HpwAC
         NeckAgQ4sgTvvUalnE8+QVyLzwF/L0hiIouJ3WIEPG83yIuSl5HhcVJQOBG2UPn25HmJ
         L5fbFy1ymESTwqR4yP/75jxwOlXcS9H7gfIsEfE7hAsIlwbvXk8vqdQZLvgIMfXXDRP6
         wa/GcccMRULPTseN4vMuDrSY1Dn0txFf924+8CTVVc9xrKIXoWG/0uqcBPxhoweChR77
         kZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753000395; x=1753605195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nq9V4nWfYcJsLfYnrUeKCl4BP7Q+oHE4ZTsPuy9Af74=;
        b=th/raPMTHnWZlnjyvF06G7JPxeIj5FhiUYMi0vi4qFk3hHx73KUtuFrliPz5pb/Su9
         iWVA+s1J9cpp955AefF1qt9IWtIYyV12zpzoC+ZbWcLl+KZiRpAFcK6AGFL33NLcDovA
         00uMEdgeJNvXxH8cUUkbSag0fzdT877JOnZJJ9kDnghYyIKJ0Gj8iZtJp2FipRx8oWbB
         kdBrUv4nmhLPOckuwz0ZnBgfmwNELRbE8ePU+BDEKGY8W6ybvQhNuuu8SomUri/Aimne
         26HqWVSyRhVQHOgPaAT/X5jYu3I9BHO9/9BvmFyE/WR0n+dxetUoweGrIm6fO6zxSXN2
         tWFg==
X-Forwarded-Encrypted: i=1; AJvYcCWjft/z2frQjv2o6krNzdDz3sWfxcqfemLAz4CxohpoJhCk1oUYfLKcw8B4EcQw6ttIYpuS5UA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXgRkFDuxmwhxo6WEeFaY9cyDbu2/kvQ3EeOWX219b9iEE3ASV
	laX5+3Y2tC0lZGfUKUJkHu/kCxAw8IIWLc0XoMpE5Zjy4kZAqqg57djn
X-Gm-Gg: ASbGncusVPQXgC1BHh58TULp0+xRMici/LlHGrdlsjfP+LCKG3mes4trHDIip5tcO+U
	MxWvgkHqcMfik6uGQN+W3GhipA4cum7i3VWMRHxqGsMTmp7Qggw9W2OLRMVz/xAvM4cs0SO19a+
	5pd3lFj1cbx2QnaSRhm6r9YzVE8krsL8XWszJSOFyygE8PrZVXnB42PkEEUno2AnpuTWkwwfUVt
	LUcqyr7zNrVdGWf+eGl4+BM6xDTHxnLCPteagjO1UczBksL14y+DEoW3Bbh85R8uug9MpKGWeVW
	1Z+UP2RKfw80iSTlIS2kcMdme1GayR0WEeCprb4EEulR0tvh0gMORgUXQQMRq7o8cR0N5r0ZK0X
	kNPedF8RAtTF9hg==
X-Google-Smtp-Source: AGHT+IEpU7ppf8Ier2F7amqI42rtLsgYRSxajHznZeT7Ire18+UMD7933EljvqHA+AOKkjcPgT9mKg==
X-Received: by 2002:a17:902:cf0d:b0:235:7c6:eba2 with SMTP id d9443c01a7336-23e3b84e8fdmr114036045ad.37.1753000394653;
        Sun, 20 Jul 2025 01:33:14 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1002::1d55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3f46b97sm4079721a91.41.2025.07.20.01.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 01:33:14 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 20 Jul 2025 16:31:45 +0800
Subject: [PATCH v4 3/4] spi: spi-sg2044-nor: Add SPI-NOR controller for
 SG2042
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-sfg-spifmc-v4-3-033188ad801e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753000358; l=1077;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=invs7khMKVNjBA2XGVM7X5zuJ+fCJ3XQUvHieDAkEjI=;
 b=d+ztnvccC+X0a+IaXeQ4YkUZ41YMfOYok04lF94NFY4peKxfthcRHU5Vd3KA1PF3HomUiCxxz
 pvgOE7rHvSkDFItDqH9m2wD99AXpdFdKrdGzn2NdJDgsLUdHxDEmixP
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add support for SOPHGO SG2042 SPI-NOR flash controller.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 drivers/spi/spi-sg2044-nor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-sg2044-nor.c b/drivers/spi/spi-sg2044-nor.c
index 0ef569eb28b7609df1f23d89a6b3e7afc2569c80..af48b1fcda930f3cd0bdd57d80e076918d94010d 100644
--- a/drivers/spi/spi-sg2044-nor.c
+++ b/drivers/spi/spi-sg2044-nor.c
@@ -485,8 +485,14 @@ static const struct sg204x_spifmc_chip_info sg2044_chip_info = {
 	.rd_fifo_int_trigger_level = SPIFMC_TRAN_CSR_FIFO_TRG_LVL_8_BYTE,
 };
 
+static const struct sg204x_spifmc_chip_info sg2042_chip_info = {
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

