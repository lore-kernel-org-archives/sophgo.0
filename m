Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B222B1F940A
	for <sophgo@lists.linux.dev>; Mon,  3 Mar 2025 11:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741000645; cv=none; b=HiQMCj4GGXBiyX31E8C/Z1TO34J7gejgQSOuO8aM1EqUSDyDNGUkB3F33HappvQBI7rrU2ngOIV4nL2CM9+1eNNqoKVxo9FQxn77pX4xMeYuQu3BKjFEg0eUWKzUqd7Mcf/ncMExvGMBuQ83radHcxD0WO7H6WfWqlE2YT9JwQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741000645; c=relaxed/simple;
	bh=vs77aUJcijnJ0GNIGtqT5sfhnBoIxjPqvhmlisw6XU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WMZcM78U2htDur513GS3J2NatvOIfKGFlo6AxliiuGBSf7J074VHT/GQVW3Zjv5HfqMBzR+Ka1ZuCwBfIYRG34OokKyZowmraD/4ckKFTrt0Ll1gcClp+G8VPi8uICty2+QumqHvUy6m1hk1oiCezE5d+/i0ZiDmBl9E3DoGY2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cimKzhaI; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cimKzhaI"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6dd1962a75bso34964326d6.3
        for <sophgo@lists.linux.dev>; Mon, 03 Mar 2025 03:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741000642; x=1741605442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYoAzmCu0vns5tkw7HmXXaJNkE1M+oV59kCo2vApjko=;
        b=cimKzhaIsVWJ9x9wTYJdV2KeRXxoHWUU+5NcF64P4q+626/kNh1XW8NNVPQkJFAnO8
         B4/KjiJqvs45DdFilO0bOzeYu5MXKum9pSVMJcgpZsadIb0x1wd0odaKeMzPFe11DlBV
         fG+F2LeMyMbxGyBIF7HhpsGUWSmMDNFqgR/b0RsJFkIUbUq9hyMQYIudKYXAd3tmv3fo
         Ny5wEciVW0O8IHIG/iNeYKxdUMdNiRtyExbfmfkP5CeZ/Ea75owZM51kCs7cb5yBZ4MT
         fQXnDI2GnW//G+MAJAPcBj0rSQJ6DWof507H9qWH1OjM52KjzUEKudFDVvThVj8EczYI
         AWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741000642; x=1741605442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYoAzmCu0vns5tkw7HmXXaJNkE1M+oV59kCo2vApjko=;
        b=mNdj1hDU7FEkAxkODutxepu2mnfOXHj7dxJVL7DrAqlUFjNzTAMiaxbGO5/SW3tjVT
         PxaGHIsIyAj4E0SsBM571qrI9zJrZV/PmJTKIJAWI6o7/dx8S6vQUMMZo4aBrE/5k9sm
         w6nQF1GIHJXxn+mJJPNpl8ejql7W3R379ls7LyxjIm2A2rom4WJvtOlINVm/RjrH4WrE
         oMyJTrrp1x8KM6Yjx+zSbLkdR6l7//Avq/7Y6UomolotX7G2RcH0GMW8/oRBEuN9Dpct
         +UO6QlzYq2bXDLfu9YKGHf16VPKO4CliS4zg3EYP/PCz/b/0QRgzbCnHVCL3sj1hpI/P
         Bkqw==
X-Forwarded-Encrypted: i=1; AJvYcCXF7ZnYcjlQA9QuENY9eWVo3bpCbKnZqN2Z60/UCC5gcyCLcdq5H7IffQqraQTiaEmLVTgPsHw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZdlHq92Byx7yYWmBa1mX2Cwadbu5nkhymv67vpEmUZiC8RYWy
	K/7xMwLjESfwBrQeprp+bEDTPVe0XrWgkrcYiYWp5w8Q/8rkF5lM
X-Gm-Gg: ASbGncsho67dXMKMMEG0SC4EmEKHp9r132YQTSFIADYxj+WfxQ6kPCbrt1kqlzabnps
	VkAlUD7Pxg1HydLDbsW5L16n/p2X4PgZche2xmmwUhOMjYUjNck7ey/2RjqyYbclutTdSCnCeoO
	XIK+ASJDbEXnZBlpdsh/2e2B/cg81r455qE4sNhXv9pLhL0Dc6X1gF8ayDMhqS88ZVXD6cKxO6t
	BEDvNhbWmNbsi6l/H9V3KFWiVVKeKRS4eG4y+DU8fFTc49JWeUOCsCuAjx1/wKmKf/UMcQWyYA+
	MwTXD0qFSNeK3IxVXzQ1
X-Google-Smtp-Source: AGHT+IFnzI5yYMUwpgzC+CtqnF8PkSTTAOhLnziiXOW13TnV/5ZF1J9/Py1jNWLdgQBT5OjaRQ4YPg==
X-Received: by 2002:a05:6214:5193:b0:6e6:6048:f42c with SMTP id 6a1803df08f44-6e8a0cd3f2emr192488796d6.8.1741000642572;
        Mon, 03 Mar 2025 03:17:22 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8a1aba663sm39485296d6.50.2025.03.03.03.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:17:22 -0800 (PST)
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller
Date: Mon,  3 Mar 2025 19:16:47 +0800
Message-ID: <20250303111648.1337543-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303111648.1337543-1-inochiama@gmail.com>
References: <20250303111648.1337543-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Sophgo SG2044 MSI interrupt controller.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/irqchip/irq-sg2042-msi.c | 86 ++++++++++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index 9c0a5f2777a4..4b3992821797 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -21,6 +21,11 @@
 
 #define SG2042_MAX_MSI_VECTOR	32
 
+struct sg2042_msi_of_data {
+	const struct irq_chip		*irqchip;
+	const struct msi_parent_ops	*parent_ops;
+};
+
 struct sg2042_msi_chipdata {
 	void __iomem	*reg_clr;	// clear reg, see TRM, 10.1.33, GP_INTR0_CLR
 
@@ -29,8 +34,10 @@ struct sg2042_msi_chipdata {
 	u32		irq_first;	// The vector number that MSIs starts
 	u32		num_irqs;	// The number of vectors for MSIs
 
-	DECLARE_BITMAP(msi_map, SG2042_MAX_MSI_VECTOR);
+	unsigned long	*msi_map;
 	struct mutex	msi_map_lock;	// lock for msi_map
+
+	const struct sg2042_msi_of_data	*data;
 };
 
 static int sg2042_msi_allocate_hwirq(struct sg2042_msi_chipdata *data, int num_req)
@@ -81,6 +88,37 @@ static const struct irq_chip sg2042_msi_middle_irq_chip = {
 	.irq_compose_msi_msg	= sg2042_msi_irq_compose_msi_msg,
 };
 
+static void sg2044_msi_irq_ack(struct irq_data *d)
+{
+	struct sg2042_msi_chipdata *data = irq_data_get_irq_chip_data(d);
+
+	writel(0, (unsigned int *)data->reg_clr + d->hwirq);
+
+	irq_chip_ack_parent(d);
+}
+
+static void sg2044_msi_irq_compose_msi_msg(struct irq_data *d,
+					   struct msi_msg *msg)
+{
+	struct sg2042_msi_chipdata *data = irq_data_get_irq_chip_data(d);
+	phys_addr_t doorbell = data->doorbell_addr +  4 * (d->hwirq / 32);
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
 static int sg2042_msi_parent_domain_alloc(struct irq_domain *domain,
 					  unsigned int virq, int hwirq)
 {
@@ -119,7 +157,7 @@ static int sg2042_msi_middle_domain_alloc(struct irq_domain *domain,
 			goto err_hwirq;
 
 		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
-					      &sg2042_msi_middle_irq_chip, data);
+					      data->data->irqchip, data);
 	}
 
 	return 0;
@@ -162,6 +200,21 @@ static const struct msi_parent_ops sg2042_msi_parent_ops = {
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
+	.bus_select_mask	= MATCH_PCI_MSI,
+	.bus_select_token	= DOMAIN_BUS_NEXUS,
+	.prefix			= "SG2044-",
+	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
+};
+
 static int sg2042_msi_init_domains(struct sg2042_msi_chipdata *data,
 				   struct irq_domain *plic_domain,
 				   struct device *dev)
@@ -181,7 +234,7 @@ static int sg2042_msi_init_domains(struct sg2042_msi_chipdata *data,
 	irq_domain_update_bus_token(middle_domain, DOMAIN_BUS_NEXUS);
 
 	middle_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	middle_domain->msi_parent_ops = &sg2042_msi_parent_ops;
+	middle_domain->msi_parent_ops = data->data->parent_ops;
 
 	return 0;
 }
@@ -199,6 +252,12 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	data->data = device_get_match_data(&pdev->dev);
+	if (!data->data) {
+		dev_err(&pdev->dev, "Failed to get irqchip\n");
+		return -EINVAL;
+	}
+
 	data->reg_clr = devm_platform_ioremap_resource_byname(pdev, "clr");
 	if (IS_ERR(data->reg_clr)) {
 		dev_err(dev, "Failed to map clear register\n");
@@ -240,11 +299,30 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 
 	mutex_init(&data->msi_map_lock);
 
+	data->msi_map = devm_bitmap_zalloc(&pdev->dev, data->num_irqs, GFP_KERNEL);
+	if (!data->msi_map) {
+		dev_err(&pdev->dev, "Unable to allocate msi mapping\n");
+		return -ENOMEM;
+	}
+
 	return sg2042_msi_init_domains(data, plic_domain, dev);
 }
 
+static const struct sg2042_msi_of_data sg2042_of_data = {
+	.irqchip	= &sg2042_msi_middle_irq_chip,
+	.parent_ops	= &sg2042_msi_parent_ops,
+};
+
+static const struct sg2042_msi_of_data sg2044_of_data = {
+	.irqchip	= &sg2044_msi_middle_irq_chip,
+	.parent_ops	= &sg2044_msi_parent_ops,
+};
+
 static const struct of_device_id sg2042_msi_of_match[] = {
-	{ .compatible	= "sophgo,sg2042-msi" },
+	{ .compatible	= "sophgo,sg2042-msi",
+	  .data		= &sg2042_of_data },
+	{ .compatible	= "sophgo,sg2044-msi",
+	  .data		= &sg2044_of_data },
 	{}
 };
 
-- 
2.48.1

