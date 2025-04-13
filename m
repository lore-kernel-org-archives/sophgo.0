Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DC01A9B24
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744584614; cv=none; b=YIUmAkPtZfFJmYbXJ138wvW19VW63y8ZJnlnBI0/Qk+XGQXFmm1BsK+LNqUpmQIsqWh7Fm92SM+BihiF4CtfnWnfOI8ODdQ23iBdftMklAJzbDQxe8okdNpEe6XP47n5RK4KSpKw0/BzGS2EV3uNJVrlA+BhioL7y0arOfXYzbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744584614; c=relaxed/simple;
	bh=m1QL4n2hnIEQd1dyErGMiuUFBadyc8JkLZb35bSy5Uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=meNZc7PsAqtNARrQAYpzdiJ5bSGeAlq+dieSdPLJMZcI7fySScCp+Yin3nMiCndz+/KkzsugKHuA4RqgeE6A7gvbMetO+c4c0Dgoa/8B/aitJPeGw4Z6MGmTd1Hqg/ldzon1YKcpiLTxa3blX7EYR1UttPtGsk8XvjuGAYDn43c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuKwq2rC; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuKwq2rC"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-476a1acf61eso35913801cf.1
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744584611; x=1745189411; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzknkghvm2nSJ8gncEp08HNumOsjilrcwaey6FHX4Cw=;
        b=EuKwq2rCmpFGUaUXYN5icw1Awjxxsu3S39gpJhTOXrYNGpfg6T6snyLZUs05Mw39cB
         AvikaV9YdlTfLuCdjGzBM0apboWqxPIDdaLq0rJgzpRVNKjVV7myCkywFrNjsbU1iRpZ
         wk3qBMuaBLT9nJZoSwaG2zIeqJmiXBkKtf1ahwP7M08qU3eQ4IerBln9KTFVSktRmNBG
         0AkzLgqxy7tGgf4mDsTfexiX1phMO2AoFIhvgJdU9p2vT1+Ph/NY/Qfq4sygUsDvXPLS
         n9bN9MXGVg+aECf/a7Ai3AeBfxT6E7Sse42TEXLuieS2b5QIo/kK0WJVUwIWdC1qJml9
         PZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744584611; x=1745189411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzknkghvm2nSJ8gncEp08HNumOsjilrcwaey6FHX4Cw=;
        b=iq/1rewxs6Foye4lmx2JPW1ZxqKkGDdumGKBNz8oH6sJ/m2YSUQ1kD3g8zQNQTLBjr
         7GRh2lwZYEqeXG8pCDjYl8vTBG5Lx0MHbM4aagqNs1OS0ugRNbDmnu8oTrtbPqk6Y7fN
         nrDVXKCfTk28bjQG94ag8w79LNQtxmkp/RM/WddQh4Y/sB87sa5xfd7rYoY+8rUlVeBo
         zTOEVYJhtAjdkeFxMtpDfvTSJPx+1ndtFe94m5AijOTMZ1w/AyBskD+fxtzoPuHhFihZ
         L4pfldDu4MvZI1ZOfyPg14TsuDPmBauqyziUXNr5DTK66JrVPQE3BXO4ORUhEATvgKei
         eKKw==
X-Forwarded-Encrypted: i=1; AJvYcCXypLCAJh1kFHH6uBCZ5bdtlXdeIrvNdNB2y8bj42pLNaCVLt+743tdsKeQZVUrP8ibBPbq7iw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhwLnU7NOCdrJ789T1qtmNShMIXO4KKdjcR5B/4bUDAPbFKyMn
	y4k7G071ADTW6fAHPSH3dB6F/BipwiEIAD9ZT+WBjGsFLdUYqzVE
X-Gm-Gg: ASbGncsPTVUSq4NZBN4YGalWXJC1o3TFu4b0ESJKM95+1EW7fpu3fnOxKN2GM5CP62A
	hfO3QfaV83b5FE5SBFTNUdgrvBdtImwuxAwhryxWK0KbVzgC479Fo+vKVd0Ij4GBzKD1h4l/utg
	4tWLD0KKAifnf6QRhiKh3cypFbd2W8fXZrKwSx8vQ/76CbDkVjdpnW0ga1BOSGjsEURHIpXR8gM
	pIMpV5SFTNIiy763O9rwmCEMr0BOHZ5yQrdfqjsQvpyjSZgGA9RvI5nnyCjRjXTza92Goes7XZ9
	6HRVWfdNwUGx00cEEpBtiKQXcR8=
X-Google-Smtp-Source: AGHT+IF+PyqRU43XMrjpdH8Sf/GcfpRnHg9qbypvylMJLHpXBxFaINLCZ1xlBzd+4FY11BwiFGXEFg==
X-Received: by 2002:a05:622a:1903:b0:477:6e6a:8a31 with SMTP id d75a77b69052e-479773feebemr148304991cf.0.1744584611481;
        Sun, 13 Apr 2025 15:50:11 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47983cc92c6sm29498771cf.6.2025.04.13.15.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:50:11 -0700 (PDT)
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
Subject: [PATCH v4 2/4] irqchip/sg2042-msi: rename generic function and structure
Date: Mon, 14 Apr 2025 06:49:13 +0800
Message-ID: <20250413224922.69719-3-inochiama@gmail.com>
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

As the driver logic can be used in both SG2042 and SG2044, it
will be better to have a generic name.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Tested-by: Chen Wang <wangchen20@iscas.ac.cn> # SG2042
---
 drivers/irqchip/irq-sg2042-msi.c | 46 ++++++++++++++++----------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index 375b55aa0acd..c9bff7ba693d 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -21,7 +21,7 @@
 
 #define SG2042_MAX_MSI_VECTOR	32
 
-struct sg2042_msi_chipdata {
+struct sg204x_msi_chipdata {
 	void __iomem	*reg_clr;	// clear reg, see TRM, 10.1.33, GP_INTR0_CLR
 
 	phys_addr_t	doorbell_addr;	// see TRM, 10.1.32, GP_INTR0_SET
@@ -33,7 +33,7 @@ struct sg2042_msi_chipdata {
 	struct mutex	msi_map_lock;	// lock for msi_map
 };
 
-static int sg2042_msi_allocate_hwirq(struct sg2042_msi_chipdata *data, int num_req)
+static int sg204x_msi_allocate_hwirq(struct sg204x_msi_chipdata *data, int num_req)
 {
 	int first;
 
@@ -43,7 +43,7 @@ static int sg2042_msi_allocate_hwirq(struct sg2042_msi_chipdata *data, int num_r
 	return first >= 0 ? first : -ENOSPC;
 }
 
-static void sg2042_msi_free_hwirq(struct sg2042_msi_chipdata *data, int hwirq, int num_req)
+static void sg204x_msi_free_hwirq(struct sg204x_msi_chipdata *data, int hwirq, int num_req)
 {
 	guard(mutex)(&data->msi_map_lock);
 	bitmap_release_region(data->msi_map, hwirq, get_count_order(num_req));
@@ -51,7 +51,7 @@ static void sg2042_msi_free_hwirq(struct sg2042_msi_chipdata *data, int hwirq, i
 
 static void sg2042_msi_irq_ack(struct irq_data *d)
 {
-	struct sg2042_msi_chipdata *data  = irq_data_get_irq_chip_data(d);
+	struct sg204x_msi_chipdata *data  = irq_data_get_irq_chip_data(d);
 	int bit_off = d->hwirq;
 
 	writel(1 << bit_off, data->reg_clr);
@@ -61,7 +61,7 @@ static void sg2042_msi_irq_ack(struct irq_data *d)
 
 static void sg2042_msi_irq_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
 {
-	struct sg2042_msi_chipdata *data = irq_data_get_irq_chip_data(d);
+	struct sg204x_msi_chipdata *data = irq_data_get_irq_chip_data(d);
 
 	msg->address_hi = upper_32_bits(data->doorbell_addr);
 	msg->address_lo = lower_32_bits(data->doorbell_addr);
@@ -79,9 +79,9 @@ static const struct irq_chip sg2042_msi_middle_irq_chip = {
 	.irq_compose_msi_msg	= sg2042_msi_irq_compose_msi_msg,
 };
 
-static int sg2042_msi_parent_domain_alloc(struct irq_domain *domain, unsigned int virq, int hwirq)
+static int sg204x_msi_parent_domain_alloc(struct irq_domain *domain, unsigned int virq, int hwirq)
 {
-	struct sg2042_msi_chipdata *data = domain->host_data;
+	struct sg204x_msi_chipdata *data = domain->host_data;
 	struct irq_fwspec fwspec;
 	struct irq_data *d;
 	int ret;
@@ -99,18 +99,18 @@ static int sg2042_msi_parent_domain_alloc(struct irq_domain *domain, unsigned in
 	return d->chip->irq_set_type(d, IRQ_TYPE_EDGE_RISING);
 }
 
-static int sg2042_msi_middle_domain_alloc(struct irq_domain *domain, unsigned int virq,
+static int sg204x_msi_middle_domain_alloc(struct irq_domain *domain, unsigned int virq,
 					  unsigned int nr_irqs, void *args)
 {
-	struct sg2042_msi_chipdata *data = domain->host_data;
+	struct sg204x_msi_chipdata *data = domain->host_data;
 	int hwirq, err, i;
 
-	hwirq = sg2042_msi_allocate_hwirq(data, nr_irqs);
+	hwirq = sg204x_msi_allocate_hwirq(data, nr_irqs);
 	if (hwirq < 0)
 		return hwirq;
 
 	for (i = 0; i < nr_irqs; i++) {
-		err = sg2042_msi_parent_domain_alloc(domain, virq + i, hwirq + i);
+		err = sg204x_msi_parent_domain_alloc(domain, virq + i, hwirq + i);
 		if (err)
 			goto err_hwirq;
 
@@ -121,25 +121,25 @@ static int sg2042_msi_middle_domain_alloc(struct irq_domain *domain, unsigned in
 	return 0;
 
 err_hwirq:
-	sg2042_msi_free_hwirq(data, hwirq, nr_irqs);
+	sg204x_msi_free_hwirq(data, hwirq, nr_irqs);
 	irq_domain_free_irqs_parent(domain, virq, i);
 
 	return err;
 }
 
-static void sg2042_msi_middle_domain_free(struct irq_domain *domain, unsigned int virq,
+static void sg204x_msi_middle_domain_free(struct irq_domain *domain, unsigned int virq,
 					  unsigned int nr_irqs)
 {
 	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
-	struct sg2042_msi_chipdata *data = irq_data_get_irq_chip_data(d);
+	struct sg204x_msi_chipdata *data = irq_data_get_irq_chip_data(d);
 
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
-	sg2042_msi_free_hwirq(data, d->hwirq, nr_irqs);
+	sg204x_msi_free_hwirq(data, d->hwirq, nr_irqs);
 }
 
-static const struct irq_domain_ops sg2042_msi_middle_domain_ops = {
-	.alloc	= sg2042_msi_middle_domain_alloc,
-	.free	= sg2042_msi_middle_domain_free,
+static const struct irq_domain_ops sg204x_msi_middle_domain_ops = {
+	.alloc	= sg204x_msi_middle_domain_alloc,
+	.free	= sg204x_msi_middle_domain_free,
 	.select	= msi_lib_irq_domain_select,
 };
 
@@ -158,14 +158,14 @@ static const struct msi_parent_ops sg2042_msi_parent_ops = {
 	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
 };
 
-static int sg2042_msi_init_domains(struct sg2042_msi_chipdata *data,
+static int sg204x_msi_init_domains(struct sg204x_msi_chipdata *data,
 				   struct irq_domain *plic_domain, struct device *dev)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct irq_domain *middle_domain;
 
 	middle_domain = irq_domain_create_hierarchy(plic_domain, 0, data->num_irqs, fwnode,
-						    &sg2042_msi_middle_domain_ops, data);
+						    &sg204x_msi_middle_domain_ops, data);
 	if (!middle_domain) {
 		pr_err("Failed to create the MSI middle domain\n");
 		return -ENOMEM;
@@ -182,13 +182,13 @@ static int sg2042_msi_init_domains(struct sg2042_msi_chipdata *data,
 static int sg2042_msi_probe(struct platform_device *pdev)
 {
 	struct fwnode_reference_args args = { };
-	struct sg2042_msi_chipdata *data;
+	struct sg204x_msi_chipdata *data;
 	struct device *dev = &pdev->dev;
 	struct irq_domain *plic_domain;
 	struct resource *res;
 	int ret;
 
-	data = devm_kzalloc(dev, sizeof(struct sg2042_msi_chipdata), GFP_KERNEL);
+	data = devm_kzalloc(dev, sizeof(struct sg204x_msi_chipdata), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
@@ -232,7 +232,7 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 
 	mutex_init(&data->msi_map_lock);
 
-	return sg2042_msi_init_domains(data, plic_domain, dev);
+	return sg204x_msi_init_domains(data, plic_domain, dev);
 }
 
 static const struct of_device_id sg2042_msi_of_match[] = {
-- 
2.49.0

