Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDDA22D9EB
	for <sophgo@lists.linux.dev>; Wed, 10 Sep 2025 02:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757470109; cv=none; b=hbkugcd4w7dX9l/pKWk9OU+J8HZuMXuM08ioXFLnz4qTNnuQEKT0S34tknfyomBlkY+gADAYWDYffFsckGLtxjuQy12h1EPqE70mnq8Kv6P6ALS85K0Z9/PXfdF3EKW1am8uY/F+0iFsz8RZxNuys8GjA2ehomW6vkda0xTR+zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757470109; c=relaxed/simple;
	bh=OS9j70HJBgJdnu++cmJduNYkDHIWHGvyM1VZ0y15w7w=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OR6W5qQhUeMXecIwYcedIBPX/hoSOI8V2n3ltczoEfK3/l7aV+EOTe/GADkQ3zxhwo8E1LHeOoZ8T+tob9HNL6SaI/fn035QjHlQ6bpa3Se2zX4NvCIBjmUZfmElGOZW6rY94kA9QLyeo7O4HdR7vynzLtH/D4xtbz3GaGWjj5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QawiiXCY; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QawiiXCY"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b5df4043d5so66671221cf.2
        for <sophgo@lists.linux.dev>; Tue, 09 Sep 2025 19:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757470107; x=1758074907; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufI02VTMyX7sTfBD7Jn/jEH2YUmO7DVAO0QyMj+WG88=;
        b=QawiiXCY+UKAbUZ+7dzT7OtR6EfD4/bA7SgwbnWuWAN8a9/4FnAut6klZgPqVGnbvv
         yBHCqK0BFtYzLtnxwU0Xks5M54rNdPRwTFi7PesGuRS58QO1Q/kzh3i4Cx0j6wlvgQlh
         p/i/mU1FKlkZt5t26kr/fZ98ytGTNFkma1YIQGxiary4cmiZsQCQMzVz3EZfjdYI+rcM
         06ROgGZfc4kQgBBWcVApmdnzdse3dIUWvEuZ6mQP0UpnrEGjZrgE7lzYBui4cd6z8LW6
         dKDcJH9F03v69wx5aaAOf4BZnP1i6HwhBmDXZP7CAzymQLDIXFNS6dqnb0YDosSV+9oa
         W1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757470107; x=1758074907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufI02VTMyX7sTfBD7Jn/jEH2YUmO7DVAO0QyMj+WG88=;
        b=mD/gt9RK1LoIWSce7b21MDw4ryejpFPdvf3Zg9o9MtmDfZJ8fmWOm6VFx/kA1I8Rgz
         zhUFl7+hIMyPPLlNa7WvPrZS4hssrd0o+u9eOdnBUsQBSy4g/8Ypp3Iv9mNlzMRbiZlR
         7BvvrqQXZy0VLXFqRnAxdAyqXm+GoEBiXr+RrI2+enHy3m9pbBHeANWofXS3V28iOLyA
         AqkzxI9fpbiFP8yN3cuvpUuEBB4RqN00gHnzcbUVRBHg/ekduMRh21rPiJ49gGiwt/5M
         UuMsBB5nXMOc+MPNsZeXEZ/pd59dxSp+LQ+gG12Ncgp1ibfP/8b6trJoCKPzYWiyuCAY
         NPUA==
X-Forwarded-Encrypted: i=1; AJvYcCXIjXxkQnrojvQFu5bh52jeK5yKb8G8ZYe5Ql+jacOxDqS8GdzY332HaXss4xIFx6BZ0bBn70Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUzgVKnyG57NBw8ndEX8WVBAsY8X91zwOWn4Z+ykEnfKgc6xFJ
	yrFEEYlLi1m8ElbBzVy/J345C5sFo7FsFeAT3qL3byXBp4fjsPn3StdD
X-Gm-Gg: ASbGnct83ETrk64bMMPsIXrP3r4dzP4T58YKSAQPZhge9h7valqH6PpUK6DR/PPLHLE
	N5hpHMEf5zm658lQvjrYqFVxwzuMkb6Hoc8b/USvE4WYsXqjnOn7Ou7BoKi2/wTpVERwPSskeBv
	aUrbPXRYu77yNrrBMvMRbCrBfShiAEF1GAlb8P4kprfnrF43lOAj4J6eWsvf0EiyOstMep3Eilk
	aMCXBBfsKPcYBzV60WnzCtR4DwtEfpdWLtAnsNi1pqvwwIHt4l6GvjukMn36BZQIRyPr6VE1Qs5
	7by4xNzORFNpdAaH+D8M4bf1AxbUZqG9c3etHaZwSv0MDiTNOjLisl8HuVOS18x6wyatRYydGNM
	hwTdKXifgdswALA+ZtFqZCd1Ulle+3y3erBfDB8S7h28=
X-Google-Smtp-Source: AGHT+IF9QL0BSm2MkcIQqxgCM1KsqBHMb+NHGINqAC5fWDSx6gqC8dNQv1p+5MAyDgt2C/yVUIW7Kw==
X-Received: by 2002:a05:622a:40cf:b0:4b3:709d:1f1f with SMTP id d75a77b69052e-4b5f8490899mr154710911cf.75.1757470106975;
        Tue, 09 Sep 2025 19:08:26 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b61ba871e4sm17265451cf.14.2025.09.09.19.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:08:26 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH v2 2/7] PCI: cadence: Check pcie-ops before using it.
Date: Wed, 10 Sep 2025 10:08:16 +0800
Message-Id: <18aba25b853d00caf10cc784093c0b91fdc1747d.1757467895.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757467895.git.unicorn_wang@outlook.com>
References: <cover.1757467895.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

ops of struct cdns_pcie may be NULL, direct use
will result in a null pointer error.

Add checking of pcie->ops before using it for new
driver that may not supply pcie->ops.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pci/controller/cadence/pcie-cadence-host.c | 2 +-
 drivers/pci/controller/cadence/pcie-cadence.c      | 4 ++--
 drivers/pci/controller/cadence/pcie-cadence.h      | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
index 59a4631de79f..fffd63d6665e 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
@@ -531,7 +531,7 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_PCI_ADDR1(0), addr1);
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_DESC1(0), desc1);
 
-	if (pcie->ops->cpu_addr_fixup)
+	if (pcie->ops && pcie->ops->cpu_addr_fixup)
 		cpu_addr = pcie->ops->cpu_addr_fixup(pcie, cpu_addr);
 
 	addr0 = CDNS_PCIE_AT_OB_REGION_CPU_ADDR0_NBITS(12) |
diff --git a/drivers/pci/controller/cadence/pcie-cadence.c b/drivers/pci/controller/cadence/pcie-cadence.c
index 70a19573440e..61806bbd8aa3 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.c
+++ b/drivers/pci/controller/cadence/pcie-cadence.c
@@ -92,7 +92,7 @@ void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 busnr, u8 fn,
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_DESC1(r), desc1);
 
 	/* Set the CPU address */
-	if (pcie->ops->cpu_addr_fixup)
+	if (pcie->ops && pcie->ops->cpu_addr_fixup)
 		cpu_addr = pcie->ops->cpu_addr_fixup(pcie, cpu_addr);
 
 	addr0 = CDNS_PCIE_AT_OB_REGION_CPU_ADDR0_NBITS(nbits) |
@@ -123,7 +123,7 @@ void cdns_pcie_set_outbound_region_for_normal_msg(struct cdns_pcie *pcie,
 	}
 
 	/* Set the CPU address */
-	if (pcie->ops->cpu_addr_fixup)
+	if (pcie->ops && pcie->ops->cpu_addr_fixup)
 		cpu_addr = pcie->ops->cpu_addr_fixup(pcie, cpu_addr);
 
 	addr0 = CDNS_PCIE_AT_OB_REGION_CPU_ADDR0_NBITS(17) |
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index 1d81c4bf6c6d..2f07ba661bda 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -468,7 +468,7 @@ static inline u32 cdns_pcie_ep_fn_readl(struct cdns_pcie *pcie, u8 fn, u32 reg)
 
 static inline int cdns_pcie_start_link(struct cdns_pcie *pcie)
 {
-	if (pcie->ops->start_link)
+	if (pcie->ops && pcie->ops->start_link)
 		return pcie->ops->start_link(pcie);
 
 	return 0;
@@ -476,13 +476,13 @@ static inline int cdns_pcie_start_link(struct cdns_pcie *pcie)
 
 static inline void cdns_pcie_stop_link(struct cdns_pcie *pcie)
 {
-	if (pcie->ops->stop_link)
+	if (pcie->ops && pcie->ops->stop_link)
 		pcie->ops->stop_link(pcie);
 }
 
 static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
 {
-	if (pcie->ops->link_up)
+	if (pcie->ops && pcie->ops->link_up)
 		return pcie->ops->link_up(pcie);
 
 	return true;
-- 
2.34.1

