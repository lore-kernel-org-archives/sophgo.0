Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65474264A76
	for <sophgo@lists.linux.dev>; Tue, 26 Aug 2025 01:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756170587; cv=none; b=rad5uDSCnPYD9Tbo2nMo0EKss/CmcgYWf5bhpCDxhdcweKQFC7AyXToklh4YnTjEgscY/Y+exo1mTvCMCu0vT+o3Kb+zUvAdN6QtyDa62KrTcqCrDWO4RnXOYqldZGhqQFcFAf/7CRy7ZOi71V29dA0et1sMs6T566eDv/xc7qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756170587; c=relaxed/simple;
	bh=cG4YLB8fcRCQp9z/a4wbR6zYj3boTDYm2wYTkAWOUY8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BzHMYxPMu/+9KHVuLIdhzNy4F+xLsoCvh8oLdGbO+Qsgvd7EuqNpwY7g1/kVgrdjbWSbibgOhpe4F0/quo4U9hIWiD40FAREza4Gql3vRG0hyvVI/OW9kQBYtrr18QfPI0cAPC6h2JM9hmSmv0DuhozBLkEFWVku+p7qxafngZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0ocwld2; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0ocwld2"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-743749537caso4813539a34.0
        for <sophgo@lists.linux.dev>; Mon, 25 Aug 2025 18:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756170584; x=1756775384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKcbDX8RSeeRVr6XtjQvaqenalc/kXd0hVTqBKK4oPg=;
        b=P0ocwld29qoakSG3o0+dYKxvOcuR0Ud3HzvPblKpqNVV0RUgFC3ywXU3mXSZSyzE8g
         bhRzLmDwHDxX/LSb0DTlITHY1GLF6UUjooUbVR1yYpSwOyFgRWUbCxvv/sYLYDU5Hj0i
         5m5sYguq14Nn4m8dY7koqayUnL953oBeFP2Q3F3XYdN/ZrZ4mdZulf3psrGtSJJev2RO
         2kL6HMLMgsDe4qvrktK+uLL1m01ubpm1Y6ofasffjfft7L6vT9CvyoU580v+N8LJSdfk
         LXtGi/521fdtvQUMuQ/PzYEVDyTT1zsmP5EYLa82wK/bduAUbvWP5Q1coO9RfF7rClrZ
         ow8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756170584; x=1756775384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKcbDX8RSeeRVr6XtjQvaqenalc/kXd0hVTqBKK4oPg=;
        b=LJ7foQWWw7zyGv6QDwIvwrU0rYThubaSdsa4urB1ayKcDyU9qeXAdusoULAvbr33mo
         ZKN5zwCtUEKgQ2mO2tor0R79TsXMHzThiLLHZTTojTm7dlsa3lZsMiS5MtuxiewwjcpO
         PMUt5nMzLXYNYQlSFMjaUus2xy6fqNRCY13cni10QqxyFQ2TRNjNBeC3bJsrlrixnqam
         sCRj7nJEGfe+m/b78xH/sTsYLw4kXu2keN3xHFsVEjwfpuUiJ7uC7I4exyrhDRkBGcsq
         EaQIkNphHZsJZFJG4iZ+4ZtkvWDoWR/Vn7Qb7a1FxEIj0XYCS0g0CwREyx42eDA2L7Wv
         M0ww==
X-Forwarded-Encrypted: i=1; AJvYcCXhFhf+MBQWSUiH+2CxVi0tbk/+FEXams+r/TBl/wBpoAJ/iKOoRr4UTcpOq28gMV3hBefxeWs=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywwl40XuR/hBOwQW7Q5RKZLO3FTpPms5R5DYlvvR68pX1Vgjwsi
	62EDvKJIrUR4C6MJgO+KKn81U4yM+M28Iwi83N9jQmzFZycBZ6oRxa/n
X-Gm-Gg: ASbGncuimBmwhIs9ryUmYC8qlVKYpj8owdXplk35huWjOQf0nenMh1XtkNebOpwXYUa
	dtIMzXeDdyRKCXkm4M8F86QjJzADA1BFgdCBLPuQGYR1Z2C6A+kvwudsQDGwjseDMMcK9451/4y
	bQHvps8NO6uLdP2IERwIxghE+hg+wjBExyERKb6nPrNSlza2SZgzrF06qozcGG83B6cVa6IElhT
	93vmLqrwh4qvKYnc4LkAHiNq5AaySO3QfztlYMK+0syhRrJ7O+DFMtwfL9nihnG07ricNRMoQgh
	c52+d4vjj1v8XZx3ojvCsPMZbDutjMidrfnGPyMD5FKt1C4PHzvi3v3REGH0ZV6fssH2uUrZ4bi
	7jR0jgQA1/lP3VfRgPAqsrg3wtXYg1/5E
X-Google-Smtp-Source: AGHT+IE6F65QfwFabXNAuH7zs863T2wcLpZREnYgSei9bH+TLiPtsmlTeVF5Ku/WEWK907SSi5O82Q==
X-Received: by 2002:a05:6808:1799:b0:437:75ea:6c77 with SMTP id 5614622812f47-437be056166mr849846b6e.20.1756170584317;
        Mon, 25 Aug 2025 18:09:44 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-437967dc1dasm1327704b6e.14.2025.08.25.18.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 18:09:43 -0700 (PDT)
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
Subject: [PATCH v2 1/3] irqchip/sg2042-msi: Set irq type according to DT configuration
Date: Tue, 26 Aug 2025 09:09:35 +0800
Message-Id: <49e70989c2f0a8a67e48527e57b4877262996214.1756169460.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756169460.git.unicorn_wang@outlook.com>
References: <cover.1756169460.git.unicorn_wang@outlook.com>
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

