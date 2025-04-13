Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B32F1E520D
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744584617; cv=none; b=Ow+cOzbX7vib6CxBj2fcncmq7J/72uW+zgZ015nljTwYfWOIRZzmGIrVi1rTSf8XpGTzJwIQ2zR2Pptgl3Fr/a4PPwNoREGJamlHSXJ7W+plsnakmDVwttemAa/f+FXI5QDxqLYdiEvtyGKvjFgsIhxnrGa7qbGYigmHnMtVkew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744584617; c=relaxed/simple;
	bh=TvussfnRfYLYN7bMCiS4qcHL2BvUF7ky1QmPmFU0WC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugW2LoNEo4AdBw34iZ/XLBPe5BjFMFmXp9x75/RO3Iwt3KNQU7RDuPuOKaARlLXcKQwA0MVsj1a+mJLexA4b1/j0uMxTYnhR2APYK39ZaBd2A0B25+82nlvVEan6rNktV6md5BxlVZvjo/RMlFgtylVkAQ+Tp/hu+MFwoi8ATCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lo11fRf0; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lo11fRf0"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8fb83e137so28277896d6.0
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744584615; x=1745189415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNuAwK5l1qg5eZzpnXcElimfuBDVA1SQBHeuFqgCLXY=;
        b=Lo11fRf0UsOLLlKdJ0w8725AANgJ9+JqEqFvkxHnad22eXjnXXPFx5TFI/CDA+o4xN
         uPmdL9NkYXlqFzm+mpZdwKMHTPG06QPKBxFLAYSPziW0+UQRXVj+gvWCt691HVMO3FAr
         L6yfCiGaP0a0vYOZkA+7Y8+b5UOzQvnP1QQFVwvUCbaiLkn9JyeBv7IFk6c1XDBkjo25
         iF+QsCeHpxvA3gLG9TGKZM/0yOprn24fQBgaFH+EFXm77vKfS+7WjaqIJ5Rz0c40ZY/S
         JA/MQj3c3tPmUqVbiqk3uPDmcwQvQpnQ+7RhkrxYhHYjcJOXwFbSrgisfChn3V7LGWGH
         lpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744584615; x=1745189415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNuAwK5l1qg5eZzpnXcElimfuBDVA1SQBHeuFqgCLXY=;
        b=j+VSqzwKEO3/PbNL3bcURpyiOrGzNXx/T7o2xpqq7LsCE0od5JdCvfWt7TqWc5EqRH
         dLquK1hXmfs3o0W3J4pN5ULdCe7DrDNnVAJljb7c/Z8HpgMfe7+T8dHFBZrhdTMeZPEH
         dfmBj9QkJupGtS1DAP7yZVUOo7t/2od6bqXOKaJRW/yNT0buIqQrgA5woJXYKw4F9N2H
         +tJmAEB+ZHcb2LB+Xt5EFUusICd09XTToxWQsjBzVPdrAVfvW4hIi9uBegE4g+PmOSTW
         oufOb5EDeiZc82KcewIdMwWiuSeil4/joInApEXRfQn33Gn14MsXf6yCmI3RGsvFlK4E
         EaXw==
X-Forwarded-Encrypted: i=1; AJvYcCUr6sGB4OXi/myBVSn1SuGyDhLD0cYAAGdfDALxzAKeuBZIT3uUVVjGMCjUDMbaYCAg2ghUTV0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ3Fmg+AXQxTOuXI9se0Mc56qE914XLxCmwhSYwbpSPv6S22yU
	wN3TnCJh9LuEVgfzMbunZQyJl/u9lYns77aY/voTeT+kMOU58qO4
X-Gm-Gg: ASbGnctNkJzwFSP7wJyK0oiZuwbnwRCn5mHl3+LESuUN1ar9Er5W3dQKvMmxuIosjjW
	+VPQN4qUrUz9gADct3VsVy9ypiD7dZLaG5HhN9F11Bry1vm92zShpAKPy4fKoHqt5sDe6TcIn91
	W/Dwr1SQGirG6DoojJxg4WoT5ArBtDLZ9WSwEseTbIN6kVC9AikOF+D+0RyjRIAEf5xdRJ+lejb
	y8K424+ycLADVdVJ4WJWp8ucRqAvglualNruu8OfEWm64IS27i/CwlbwnwT9QhjMM3wtxpsIgR8
	iKx0phPvnlQ2qnrK
X-Google-Smtp-Source: AGHT+IHRHcxaQs9JOgRbASUfsmCG+mgKORamgJ6TgwFCiz5A/92qYj0zVZrm7+cqXUE9dwCrha9Ddg==
X-Received: by 2002:a05:6214:1252:b0:6e8:ee44:ce9f with SMTP id 6a1803df08f44-6f230d72b03mr159468186d6.20.1744584614751;
        Sun, 13 Apr 2025 15:50:14 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de982674sm71540476d6.67.2025.04.13.15.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:50:14 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v4 3/4] irqchip/sg2042-msi: introduce configurable chipinfo for sg2042
Date: Mon, 14 Apr 2025 06:49:14 +0800
Message-ID: <20250413224922.69719-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413224922.69719-1-inochiama@gmail.com>
References: <20250413224922.69719-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the controller on SG2044 uses different msi_parent_ops and irq_chip,
it is necessary to add a structure to hold the configuration across
controllers.

Add the chipinfo structure and implement necessary logic for it.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Tested-by: Chen Wang <wangchen20@iscas.ac.cn> # SG2042
---
 drivers/irqchip/irq-sg2042-msi.c | 52 ++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index c9bff7ba693d..1001c1117b00 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -19,18 +19,33 @@
 
 #include "irq-msi-lib.h"
 
-#define SG2042_MAX_MSI_VECTOR	32
+struct sg204x_msi_chip_info {
+	const struct irq_chip		*irqchip;
+	const struct msi_parent_ops	*parent_ops;
+};
 
+/**
+ * struct sg204x_msi_chipdata - chip data for the SG204x MSI IRQ controller
+ * @reg_clr:		clear reg, see TRM, 10.1.33, GP_INTR0_CLR
+ * @doorbell_addr:	see TRM, 10.1.32, GP_INTR0_SET
+ * @irq_first:		First vectors number that MSIs starts
+ * @num_irqs:		Number of vectors for MSIs
+ * @msi_map:		mapping for allocated MSI vectors.
+ * @msi_map_lock:	Lock for msi_map
+ * @chip_info:		chip specific infomations
+ */
 struct sg204x_msi_chipdata {
-	void __iomem	*reg_clr;	// clear reg, see TRM, 10.1.33, GP_INTR0_CLR
+	void __iomem				*reg_clr;
 
-	phys_addr_t	doorbell_addr;	// see TRM, 10.1.32, GP_INTR0_SET
+	phys_addr_t				doorbell_addr;
 
-	u32		irq_first;	// The vector number that MSIs starts
-	u32		num_irqs;	// The number of vectors for MSIs
+	u32					irq_first;
+	u32					num_irqs;
 
-	DECLARE_BITMAP(msi_map, SG2042_MAX_MSI_VECTOR);
-	struct mutex	msi_map_lock;	// lock for msi_map
+	unsigned long				*msi_map;
+	struct mutex				msi_map_lock;
+
+	const struct sg204x_msi_chip_info	*chip_info;
 };
 
 static int sg204x_msi_allocate_hwirq(struct sg204x_msi_chipdata *data, int num_req)
@@ -115,7 +130,7 @@ static int sg204x_msi_middle_domain_alloc(struct irq_domain *domain, unsigned in
 			goto err_hwirq;
 
 		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
-					      &sg2042_msi_middle_irq_chip, data);
+					      data->chip_info->irqchip, data);
 	}
 
 	return 0;
@@ -174,7 +189,7 @@ static int sg204x_msi_init_domains(struct sg204x_msi_chipdata *data,
 	irq_domain_update_bus_token(middle_domain, DOMAIN_BUS_NEXUS);
 
 	middle_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	middle_domain->msi_parent_ops = &sg2042_msi_parent_ops;
+	middle_domain->msi_parent_ops = data->chip_info->parent_ops;
 
 	return 0;
 }
@@ -192,6 +207,12 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	data->chip_info = device_get_match_data(&pdev->dev);
+	if (!data->chip_info) {
+		dev_err(&pdev->dev, "Failed to get irqchip\n");
+		return -EINVAL;
+	}
+
 	data->reg_clr = devm_platform_ioremap_resource_byname(pdev, "clr");
 	if (IS_ERR(data->reg_clr)) {
 		dev_err(dev, "Failed to map clear register\n");
@@ -232,11 +253,22 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 
 	mutex_init(&data->msi_map_lock);
 
+	data->msi_map = devm_bitmap_zalloc(&pdev->dev, data->num_irqs, GFP_KERNEL);
+	if (!data->msi_map) {
+		dev_err(&pdev->dev, "Unable to allocate msi mapping\n");
+		return -ENOMEM;
+	}
+
 	return sg204x_msi_init_domains(data, plic_domain, dev);
 }
 
+static const struct sg204x_msi_chip_info sg2042_chip_info = {
+	.irqchip	= &sg2042_msi_middle_irq_chip,
+	.parent_ops	= &sg2042_msi_parent_ops,
+};
+
 static const struct of_device_id sg2042_msi_of_match[] = {
-	{ .compatible	= "sophgo,sg2042-msi" },
+	{ .compatible	= "sophgo,sg2042-msi", .data	= &sg2042_chip_info },
 	{ }
 };
 
-- 
2.49.0

