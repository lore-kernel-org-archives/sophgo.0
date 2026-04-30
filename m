Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7045239280C
	for <sophgo@lists.linux.dev>; Thu, 30 Apr 2026 22:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777586669; cv=none; b=Cc1lfKxS0G5DBT/gbiJhJcfgDPqTXHG86GNNSg8jxVLEtYNa/UaqumX6qD0ZWAWNJbOWPA/uqRyKZafxOyTm8RzTAqJIvew8tlVGjmE76aF26vF2uKBOdZZhuLAfngNgdW7nq5CnqCCd5CIRF9aRJz+a2cDHzmifiZvaA6ZI2yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777586669; c=relaxed/simple;
	bh=FzT8M5UU1weUXaINx90b7t49VGOaivvhZQQlTWbJv7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EGwnA4jXHzjZIs52f4F5Ee1MIccO/6NcJlQuwl9XzVkISUqvX9VuC4uAwBnc0UUdXf3IteKQWyiMBkzabgKMxV26TM6W45h1+p/3Vt0Pg7yrhBhUArAml7sfrHLjmydDqleWrW6nRZUXqwZ1TgwUJCqY/R32McK9uIVp5plluZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kY3Qw05y; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kY3Qw05y"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-362e30526f8so629654a91.3
        for <sophgo@lists.linux.dev>; Thu, 30 Apr 2026 15:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777586668; x=1778191468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2aWrznEs6/axBvcga/bF04l+nJ16I8rpklN4FoR4hQI=;
        b=kY3Qw05yi6/+H5OJyNcMm+mnrMLcoxJjg5Em1V2CYb9lylj8M9tgEWCHYyTLZlHl15
         rH9UtRbsBlZ81Svr7Zf8aN0TslXkquYxCSizykyru3j07WVEhyyngbEFQ1ymJeIxVxcd
         2jC9DxU8gdJ9l3yftkFzwwG9pZ/Y66h7RqIWAA4q/XVDNEb07u/GimtCdrPIZbpdhzNa
         nnRhHeoJA4DgqpP+LgCG02D0NEgFmaj5en8jQElMauAp8RLhZIX/qx9iQNlAbmKx3l8G
         ERyfXgY4t7ItQ57nMxqvB+fR/y8tpXPF2Sn/R6uDzAAg4DtVsWPEAS0/o5GfZVPRt/fD
         EJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777586668; x=1778191468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aWrznEs6/axBvcga/bF04l+nJ16I8rpklN4FoR4hQI=;
        b=A9hex9/UkcV47JR2nfGrzssPoBruh+G/DEasYChg1cH13OhH0qekacCoPIVJ6iSLXL
         pHMEOOmUGBKO6SOkKeSPCh36kbOViFLo5LekmsqFdbz2LY9BSY49YYVK98tp2ESRoAcM
         Pr1XuKgw8VIfn6k8Fy3ofFyaKJhjn1wfbyF/El9FB+EStlIw3ylVjGciHPqeQK+hfDEE
         qU2Krh8PLPDo83aKODpncRzSLsfIy385CcF1MMBGDPFxGydSoPGiaonGdscfR8lN+C86
         eYo2ajnQv48A5S8BNIcY+2yWyE7g5IvcCscB/vMb0Cxn4pmlMyWfhlH+so1VdVarSkxN
         69Eg==
X-Forwarded-Encrypted: i=1; AFNElJ+URZQC5jU9kNi9szMtLDVH7xDBPSqwKU707x0m+5U0mKqJYIw1H0d6ASfsAo6BQxwKvq6kP0E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBRgu8L3nPCW9xl1+TZwbFO0SPBVkSljqVjbPkPvgNgv+SY5lR
	5pYEReYvBKqnlrDxm8zLnHNfjAalSIeKKrc9CIAqNMmeSM1A5d0T0gAA
X-Gm-Gg: AeBDievEsEUekEQop0/xA5jxNKpvzbadKMBc7bOu7X4WtGCn5paV8r+Jw+sif0Ve6bb
	jaiwLpdG16TK4+PO9pYcQmpv9MuSEDj2TOLRgAJeXkO/grP+0GfN6J2ihsIEGZi/K7XYUct/yH8
	5rd9Fy2wBFkQuQZPUvHvLZjUe6Ow6swtb0cKOLIxkw2QcUPwv0oYpjvl8lqr5uzsOoMPkpiPZ29
	XtF4RviuTpxXGoMxl+svYoX/T0jkf1Rt+rbM/G8Yl6jdJHNItp8e/HT6XZ7MDqVcl184c5gJ+Fa
	/xq1A656RQtl/zXLhrPsBHY3zu9fOW9Su59sIdZxnxlTU2vRY/iStCnQ97sxXdH19iycCSvWx9g
	Tg7Wepzi28murzIH2vYXgM6Y7JyZfSXXPJgEUqgIdjCfSGCHdA8rnsXXbihNwjD1eGDFYxdIHL+
	JAAKD6OeNejRd3cmtUPKIfPErUgdfFdyUDI0U28Srd1PNOn6k4qiSuv8XE8ZtNLeWqlASPQxSlq
	qNT3mbIlJqjWjyWchRKIpfLL9TiczrrpjxGPS2gr0SqXTcF3nPeWqgM
X-Received: by 2002:a17:90b:2e42:b0:35f:b9ea:8fa5 with SMTP id 98e67ed59e1d1-364c30e2dc9mr4448720a91.20.1777586667823;
        Thu, 30 Apr 2026 15:04:27 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364dd3e9a3dsm1431791a91.16.2026.04.30.15.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 15:04:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] pinctrl: sophgo: allocate power_cfg with priv
Date: Thu, 30 Apr 2026 15:04:09 -0700
Message-ID: <20260430220409.74885-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to combine allocations and simplify code
slightly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
index c3a2dcf71f2a..154ba9a4f08c 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
@@ -27,8 +27,8 @@
 #include "pinctrl-cv18xx.h"
 
 struct cv1800_priv {
-	u32					*power_cfg;
 	void __iomem				*regs[2];
+	u32					power_cfg[];
 };
 
 static unsigned int cv1800_dt_get_pin_mux(u32 value)
@@ -417,15 +417,11 @@ static int cv1800_pinctrl_init(struct platform_device *pdev,
 	const struct sophgo_pinctrl_data *pctrl_data = pctrl->data;
 	struct cv1800_priv *priv;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct cv1800_priv), GFP_KERNEL);
+	priv = devm_kzalloc(&pdev->dev, struct_size(priv, power_cfg, pctrl_data->npds),
+			GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	priv->power_cfg = devm_kcalloc(&pdev->dev, pctrl_data->npds,
-				       sizeof(u32), GFP_KERNEL);
-	if (!priv->power_cfg)
-		return -ENOMEM;
-
 	priv->regs[0] = devm_platform_ioremap_resource_byname(pdev, "sys");
 	if (IS_ERR(priv->regs[0]))
 		return PTR_ERR(priv->regs[0]);
-- 
2.54.0

