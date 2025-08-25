Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175F3286D50
	for <sophgo@lists.linux.dev>; Mon, 25 Aug 2025 06:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756104962; cv=none; b=SrkDwfiPDHbdXwXy1MdfWwV5aBorEsDbWYY6pqrgRWYymn34I7kGQHZ5vIlZpRftQx46WWeXI1nhJh8b0bOIDDFQRIEpAGewFB+48yyB4Kd39ws4uK88je8h3xCvZLgoNCkfCK1xkBltx2SGFHV72nxOxH6JqElhBlRFULs3Saw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756104962; c=relaxed/simple;
	bh=8NCFynKKUdVzjEnQnUgNKwonUbri0AXtCEZV3rB+fik=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TDru/DKF7clhks2DBQ63pZXCMrF6cjstOA8v0uIxOUtDMX/zQj+HOKeAbBpa2rKi7ZCpMboIjV0WRhGYbtd2FmoPFUlO1E8mznesrPGP2ezqzXTZDIw/MBKZsHWX4l1Q5DK61PK3OopuHT1VJKe8EvpuyHTH/4Fb8Nv6e+g3h4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FiZeh9R6; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FiZeh9R6"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-74381f06578so2025005a34.1
        for <sophgo@lists.linux.dev>; Sun, 24 Aug 2025 23:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104960; x=1756709760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ulckDe3eWSmf553AzjVX023UG188U0t36zbr4OOP20=;
        b=FiZeh9R6SpWqZ5N+CqpaAyYiMOEU7xoHhuJ2yAHzQJuqR6A50JL1Hqcrau4DGvZoLh
         uGqK/t5vxV8LHFr53TLfdYuBwDRPQI2Jgld3ioN2aIXddCxT2I1L0KtJ2XXKnPx1+zVX
         2fst8k5RQ5ATM/pwFjBMXFFl0jIg4clVefCNwTIilhjt8O6cE89G3tCJxX9gWe1Q974q
         BQX7fvUorChEkMR3oLPomoZ5HGIsVbvTp88c4ohPaR7fViu5f0Tr/Zwium7yEpNhdQmA
         Yh1C3bjcukCMpJ687UKcT+Jp0LXTK3etuVLd6/Slnbnm+2VjSMMHL4ZApPv50/M2SiHR
         YAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104960; x=1756709760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ulckDe3eWSmf553AzjVX023UG188U0t36zbr4OOP20=;
        b=lEQi2qZAw9OCmsktPHd+7qa5sLDf/P+eebyRgsAwDeEyfOV6dadaHSj3LGgNg1QDx4
         piurcoXHxSVIjbRKLSFSDuPkVGUsvRPYTlsARUusBJZaNR+YUGR20A5WuwtIlywi+qsZ
         DCF0inki7o6uKygF9x3twaFxKJLZOR+GYXSunyFw6FNXLepQ2grS9jMB344VGrjf0LMl
         e8VypGFa25n8aeyqZTA19W9wWEdTqgjMsHXpELWUoYOaAlFllPJxoJxLncRlxBYhAXIZ
         ptzWuON0pmGy7Y4Zq7gfhdw7TFIdGhpZ2/DgJAhmScqcK+kmbJk1BauPc+QlXkN6al+0
         zjFA==
X-Forwarded-Encrypted: i=1; AJvYcCVh3+hlg4bTiab8DQcUeYs8Ar4AwIppawOi5Ddn0OBthm06hffUPStVrEdxPnsPCOWYwo2kCh8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKOA4Vpvuywlwn3kiTEfp92CqPhkDrfJ9u3hxWa1b0QQ2s4ii6
	iNKK4RmKN5yVhSgvx2UMa5fYJAhSghjXATnKPwLnCRO3pN8JtJ4pc85M
X-Gm-Gg: ASbGncszGrv8pHRdmu7ePo/prsLFJbM14ejIHzfCwgWqtTvzgRNntbMRRWpPnbzoQdk
	SCMENCDJW0OkmoWoy5SeCBcik0MEB1BezUSD9A0hIOM0mnHbUFEYQIiJrvKakaiENSeCee6Zir1
	gMvyBJlIJtsorzBJsJNqlpqL9CXculrg6wjKLz1Bsi5RompiQ0L1vAxoC8SGmGnospETSWEhHfz
	pyQBT1q1hCkEW9/DnupbBMKB9An2YANHyUBV6Hhjpl0bOp7HT4iElkxS9Ho2xfyH/o42skXJ9CT
	8ZDD+h3PMhYD+AtOnUaAny5Q8OzylFd/N2dfkZ54bA2A54YS3xtyzCWxkl+YiYzUX5NhcVOwvXv
	M6JGa2Qd3LuUAZDsI6bAWvGKTOdIvg1v4
X-Google-Smtp-Source: AGHT+IGpwYqZSLvuloDemQpps6HazGQohvDaEOzeL74e9j9PrL6xU465ZXDCufj9C4D2mPl9+TYvfw==
X-Received: by 2002:a05:6830:418f:b0:743:2cc:d530 with SMTP id 46e09a7af769-74500a45257mr5265337a34.19.1756104960115;
        Sun, 24 Aug 2025 23:56:00 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61dc790aa7bsm894731eaf.26.2025.08.24.23.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:55:58 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH 2/4] irqchip/sg2042-msi: Set irq type according to DT configuration
Date: Mon, 25 Aug 2025 14:55:50 +0800
Message-Id: <cf73d95140b03b586f44d2495376d367e32857ed.1756103516.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756103516.git.unicorn_wang@outlook.com>
References: <cover.1756103516.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

The original MSI interrupt type was hard-coded, which was not a good idea.
Now it is changed to read the device tree configuration and then set the
interrupt type.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/irqchip/irq-sg2042-msi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index 5249afd93b4a..be47c038386c 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -30,6 +30,7 @@ struct sg204x_msi_chip_info {
  * @doorbell_addr:	see TRM, 10.1.32, GP_INTR0_SET
  * @irq_first:		First vectors number that MSIs starts
  * @num_irqs:		Number of vectors for MSIs
+ * @irq_type:		IRQ type for MSIs
  * @msi_map:		mapping for allocated MSI vectors.
  * @msi_map_lock:	Lock for msi_map
  * @chip_info:		chip specific infomations
@@ -41,6 +42,7 @@ struct sg204x_msi_chipdata {
 
 	u32					irq_first;
 	u32					num_irqs;
+	unsigned int				irq_type;
 
 	unsigned long				*msi_map;
 	struct mutex				msi_map_lock;
@@ -137,14 +139,14 @@ static int sg204x_msi_parent_domain_alloc(struct irq_domain *domain, unsigned in
 	fwspec.fwnode = domain->parent->fwnode;
 	fwspec.param_count = 2;
 	fwspec.param[0] = data->irq_first + hwirq;
-	fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
+	fwspec.param[1] = data->irq_type;
 
 	ret = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
 	if (ret)
 		return ret;
 
 	d = irq_domain_get_irq_data(domain->parent, virq);
-	return d->chip->irq_set_type(d, IRQ_TYPE_EDGE_RISING);
+	return d->chip->irq_set_type(d, data->irq_type);
 }
 
 static int sg204x_msi_middle_domain_alloc(struct irq_domain *domain, unsigned int virq,
@@ -290,6 +292,7 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 	}
 
 	data->irq_first = (u32)args.args[0];
+	data->irq_type = (unsigned int)args.args[1];
 	data->num_irqs = (u32)args.args[2];
 
 	mutex_init(&data->msi_map_lock);
-- 
2.34.1

