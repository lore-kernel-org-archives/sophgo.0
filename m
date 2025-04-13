Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683AA1F3BA6
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744584621; cv=none; b=R2Rgs2kXm1EVUYBwmjjOkou0sXlwBwllWRSZ9E7k/sr+nd4X7o/60SJxGRtH5CdOUyKh2UXpeSdwazJCiBENyvEaM2wWcg393vp2pFJ9Xs9pomwABjyUV224YGo0ctF50fDpwdHJaa+xlQVESpsTlnXcOxFRmX3m/qFyBAJMnIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744584621; c=relaxed/simple;
	bh=ujdnlGUtRNZigYzNz0t2+1fwPRskSbIXQgkP52jn4qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yn0YwfBmtjCS+sYlzsIu2XSOrT2gExS9t+aeKbiKUZ/E9kuJuMfIO3Hq3kizvEZqrUDhEOSb9iEJIi/qXmSJlve2BEX5zcs87aO2/fLEpW3XjNK2zOO7OUtanQgAuMthGu+bopVnZNxcB7miEBlNHK3EOwrztMXgN37d1tszbTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSEJ4Vg6; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSEJ4Vg6"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47677b77725so39734131cf.3
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744584618; x=1745189418; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhn7f9otCsg/MVQagoUwCUBtVOB/y6riNLqsD8/Ejvw=;
        b=fSEJ4Vg6JlqwcCBmrAaK3BHaycJ6QVfc36sdXO2CsP19wwPC6whhGK3nb+rzo/hPox
         +PAgYYx7JK+5g2ezx5oLOgLoSaVWXPZ+wzY75yZVgPmesMoylWbt1195dnpjam04gYB2
         k/KrJOJardc19tr+KomAhxMMHhf3mJLJWVJTTjoPtl8UZ7mN4TtVn6Vk677vBLV4ag+y
         4hjUTHmG/En449Pf8LgqFzQXggisNB7BIYExzRebcuyN+2rj5NfIZnR7UN0tyMvt4HoK
         Kg//0dxnLygZ6WK9GZ1VuAr2xD9cojB6F/LoQ3Gr/BLaaoTJ2248jmEeb/8PIPUF7oVf
         V7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744584618; x=1745189418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhn7f9otCsg/MVQagoUwCUBtVOB/y6riNLqsD8/Ejvw=;
        b=HzgZxV6nrJP4ZgjDI22Zmlgo1hBaXzuH+aVfd94B0uCSeBOiT+OqZpFauoCPqEbUC9
         diTxpxz5+OuFOhsnRshBaHJf3+sCkotux1MkJwfn5cMfB2LjtZZCKTw+Q3IsmYBhgkq2
         PRyDfnHWUXXHzdY/ECe1yLupytNTr70/HhlZVasXcJNsAgkiZtVWrN7jJ6sK5hXcxv0u
         XhNweDW+mMOnX7V+KpH9jg1c2VNnpBYMeS3B2t3GkmTzrQ3KukXBerKDO8SxAl7+Jlf/
         87Z262834RiqciQAq8x5TxqXL+H2V90wrfvh/V9/gEXr+XjSOeByC6Jsf+qGkA/x2F6q
         4Q6w==
X-Forwarded-Encrypted: i=1; AJvYcCUPj1O5mFZCrg4TmgPZnFESK3iLdUxOf9UBphuAqIlhVcd63tHXSQgzelPsRREti217oCtG9Y4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSmxUr+T6u8yYgRF8EANHLvAIWS0PaNsHiCB+Moc6O+LbUm2Tp
	E7uR2J70+gtMq0I/hmYM+bxZcpKJJT36QIax3wHnKXb0r5uzWGic
X-Gm-Gg: ASbGncttYQWqqFUuPVbyiQGkXoE9WUzVrQn16D7hk+vuqQM/JzQFC8UkQ8wv0VE8/ke
	60MlWDja3Oho1b41wJIbSlzVLailRic0M40KITwA+5X9g2nrtkSh5wnfVGteUbQQ2JFMKTtZrJ4
	4IEG4tWrl+XgvR12nM+6nGlhqpnSVZFHhFT4I/bSVh2+iczOYYHPg2GC3pmphqFZ48ck/Z1IT3h
	6fE6nTSbRTEU19eZOMAJ7f3KYgBXO+YWSzlB+XhxrW5fMxyavSzFkZOSI/lyAYrW4Xx45Skwx9A
	mhTX+Zul/MZZ5Sgi
X-Google-Smtp-Source: AGHT+IHJaPS7nAWo8+3DUEJFZbc939ADvLZRPhmV1f8rKlaJBVH2JhuXRBrI1YKI8mtfdte0SlaBzQ==
X-Received: by 2002:ac8:58c3:0:b0:477:6f4a:adb9 with SMTP id d75a77b69052e-4797750f876mr160859681cf.5.1744584618380;
        Sun, 13 Apr 2025 15:50:18 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796eb2b816sm61761971cf.33.2025.04.13.15.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:50:17 -0700 (PDT)
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
Subject: [PATCH v4 4/4] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller
Date: Mon, 14 Apr 2025 06:49:15 +0800
Message-ID: <20250413224922.69719-5-inochiama@gmail.com>
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

Add support for Sophgo SG2044 MSI interrupt controller.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Tested-by: Chen Wang <wangchen20@iscas.ac.cn> # SG2042
---
 drivers/irqchip/irq-sg2042-msi.c | 51 ++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index 1001c1117b00..2935ca213306 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -94,6 +94,35 @@ static const struct irq_chip sg2042_msi_middle_irq_chip = {
 	.irq_compose_msi_msg	= sg2042_msi_irq_compose_msi_msg,
 };
 
+static void sg2044_msi_irq_ack(struct irq_data *d)
+{
+	struct sg204x_msi_chipdata *data = irq_data_get_irq_chip_data(d);
+
+	writel(0, (unsigned int *)data->reg_clr + d->hwirq);
+	irq_chip_ack_parent(d);
+}
+
+static void sg2044_msi_irq_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
+{
+	struct sg204x_msi_chipdata *data = irq_data_get_irq_chip_data(d);
+	phys_addr_t doorbell = data->doorbell_addr + 4 * (d->hwirq / 32);
+
+	msg->address_lo = lower_32_bits(doorbell);
+	msg->address_hi = upper_32_bits(doorbell);
+	msg->data = d->hwirq % 32;
+}
+
+static struct irq_chip sg2044_msi_middle_irq_chip = {
+	.name			= "SG2044 MSI",
+	.irq_ack		= sg2044_msi_irq_ack,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+#endif
+	.irq_compose_msi_msg	= sg2044_msi_irq_compose_msi_msg,
+};
+
 static int sg204x_msi_parent_domain_alloc(struct irq_domain *domain, unsigned int virq, int hwirq)
 {
 	struct sg204x_msi_chipdata *data = domain->host_data;
@@ -173,6 +202,22 @@ static const struct msi_parent_ops sg2042_msi_parent_ops = {
 	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
 };
 
+#define SG2044_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS |	\
+				   MSI_FLAG_USE_DEF_CHIP_OPS)
+
+#define SG2044_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK |	\
+				    MSI_FLAG_PCI_MSIX)
+
+static const struct msi_parent_ops sg2044_msi_parent_ops = {
+	.required_flags		= SG2044_MSI_FLAGS_REQUIRED,
+	.supported_flags	= SG2044_MSI_FLAGS_SUPPORTED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
+	.bus_select_mask	= MATCH_PCI_MSI,
+	.bus_select_token	= DOMAIN_BUS_NEXUS,
+	.prefix			= "SG2044-",
+	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
+};
+
 static int sg204x_msi_init_domains(struct sg204x_msi_chipdata *data,
 				   struct irq_domain *plic_domain, struct device *dev)
 {
@@ -267,8 +312,14 @@ static const struct sg204x_msi_chip_info sg2042_chip_info = {
 	.parent_ops	= &sg2042_msi_parent_ops,
 };
 
+static const struct sg204x_msi_chip_info sg2044_chip_info = {
+	.irqchip	= &sg2044_msi_middle_irq_chip,
+	.parent_ops	= &sg2044_msi_parent_ops,
+};
+
 static const struct of_device_id sg2042_msi_of_match[] = {
 	{ .compatible	= "sophgo,sg2042-msi", .data	= &sg2042_chip_info },
+	{ .compatible	= "sophgo,sg2044-msi", .data	= &sg2044_chip_info },
 	{ }
 };
 
-- 
2.49.0

