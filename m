Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C214217BA9
	for <sophgo@lists.linux.dev>; Thu,  4 Sep 2025 03:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756954894; cv=none; b=RzebtPY1iv4kI8eKXEIo5Ln2vI1hHBBjtmh/xk7DJbTfpZG1oXWBD1joJRD6qplS44z0QwIL+WyrnBaBsmRJUYNZmXz+6dOKbvKEbacmWIFGhiN7o3TijnWC73HtYxVLFql81ggsM7FokNbDupBeOYRKCwMeaNdCNQQrlqNkHe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756954894; c=relaxed/simple;
	bh=OM+N0mj6PjGykT2FoWQd4MIbb/hzZ0tAzLpZGoLpbXc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eHoTB2kceEQfDc7sG51Abx8e1EyK4qouMc86Q0kJaVWoXi1LXH3D9/l49ziyTsbtnTcGdWN0CM0EfVXMCE+T3DqCOGBjKgvhBXyT8fGtMb34P8PKvpfk0UjG2Ccyxlvqa7omsZFKoLop5jNojNI+DsddVNDJvrGaVgZasJqt7BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZN4/dXK8; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZN4/dXK8"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-745752ed069so135279a34.1
        for <sophgo@lists.linux.dev>; Wed, 03 Sep 2025 20:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756954892; x=1757559692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9CajuAm7VsoRhpeotc4jxkIe8TBDwxy99+zM/DwbrY=;
        b=ZN4/dXK8Siz9UqUU19WsZbNhmbKf/hOkKTpK1iCmQocNyAszemMVcpRfmAJxwP9F2R
         ec40XJR3Nb6iw1iEXJ59NdD/8pMu2APGWsJ5HzY8tD86hgcPhQ5VwT9IIIlbkrD8NXDg
         vAJk8FG2cVx+Pf92EJBhOuv5NcthFuHPVWpGiO3sxP6qTJZTzipSc+yQQyn4HZ4Ffkxc
         pLZN3Ycjf0jBg8ovbFj9IFYXrPdCBImvsH/pEJ+lNnFbjTielUqYqkWw2C/VllPrrYck
         jjtaTCDD6ce+VE4HCuNG9hVMGW3TRmELJBzmLt6RskjjW/W/41yeBO08OmwC0CVpUMnC
         gIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756954892; x=1757559692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9CajuAm7VsoRhpeotc4jxkIe8TBDwxy99+zM/DwbrY=;
        b=A6aWPnrVaplr4pJ530hkbtibYFwtEPnWjfMJtjuNXEv+V7ZB3j+yBMTiB7pEbHBYSz
         iK9zO5eNgQdlhudil50Hv9ruubL3gIBdSiSMDeQ9fe/xP5Xm7Rb+qp+BqRFwcGjN1CaD
         C19zbqjRQwOuc0iDc88j/zPbtSVy/mkjYGfJCuYt4y1SFB9zdDTUS1oH/6pUdJYq7tUr
         B1v9rOf3BZT44W8lj9aIzzFeFFlZrShFOHzbFQxV47AVVQIuO5wE06/OvK60xz6hJxZw
         oRHbqdxN3nSwtoLCCI5hdHp8as7rQBIDhqm4UKqFAFu6TIha36HOO/jAwUvQPqg1/cu+
         A5/w==
X-Forwarded-Encrypted: i=1; AJvYcCXBSY3TVgoFyVm5rph88VL4EnK7nq4sEN7hmai5tIrjxDM5jvt+D12xOlGddFTevQ/9wsZPFPQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyXCi33AwHXIJQH2raUfDG6rRk/pG43QIzw+JHQ/5up3zmOqzY
	4lNKQDIIQfumvyl1XO/3rKxjLGm7C5l2Gr1Nhq8AgKARWGYxGae1Lq/9
X-Gm-Gg: ASbGncsg+HhKSfkSw0qkHtfqgByd6EAqz7TyeKrwpkF9ib58v6Jjxhm3PiWu1eUVeVC
	YZnkxw1G9OdapS3BHrA0LOirudu1HjWIR21dri8P6Ss5C3tSBj7iO+8RK+45q6sVcDItIndXjTM
	NgMZXVCgEE1EtpGbZDMPPIhye+OGA3mtFYLL8CM8yPAamNXNlB9FazAK7rLCcXhBrMg/SlylD2q
	312NI5FwDtJZo0rQ8MmE8FXJsLGnl+HuD5PHkyK7wZeJfQFY/TB5zDHxGU3ev7qIwPjggDbYoom
	dWGdDA8TXJZXbn4/yWYVjWpM+KWNDjJbSP6E8B8z62Lm1yDCx4zpZ4f01E2tQbg1EppX39WMMrv
	m1MXuS8vROVQQvwhswq2MDSshKjhkmeCi0sB2YP6wyLM=
X-Google-Smtp-Source: AGHT+IELP+mxSGzElVCEVywyn+fMnmBhJCUygHmISkh2tEXspU6mwEADZzjNbwOJ0l2qTQ0URFRXBg==
X-Received: by 2002:a05:6808:152a:b0:438:247a:7d8f with SMTP id 5614622812f47-438247a8372mr2232071b6e.4.1756954891838;
        Wed, 03 Sep 2025 20:01:31 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-745a09af8efsm406946a34.29.2025.09.03.20.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 20:01:30 -0700 (PDT)
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
Subject: [PATCH v3 3/3] irqchip/sg2042-msi: Set irq type according to DT configuration
Date: Thu,  4 Sep 2025 11:01:19 +0800
Message-Id: <b22d2b0a00a96161253435d17b3c66538f3ba1c2.1756953919.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756953919.git.unicorn_wang@outlook.com>
References: <cover.1756953919.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Read the device tree configuration and use it to set the
interrupt type.

Tested-by: Inochi Amaoto <inochiama@gmail.com> # Sophgo SRD3-10
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/irqchip/irq-sg2042-msi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index 3b13dbbfdb51..f7cf0dc72eab 100644
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
@@ -298,6 +300,7 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 	}
 
 	data->irq_first = (u32)args.args[0];
+	data->irq_type = (unsigned int)args.args[1];
 	data->num_irqs = (u32)args.args[args.nargs - 1];
 
 	mutex_init(&data->msi_map_lock);
-- 
2.34.1

