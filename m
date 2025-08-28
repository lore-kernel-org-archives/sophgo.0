Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304931DF268
	for <sophgo@lists.linux.dev>; Thu, 28 Aug 2025 02:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756347447; cv=none; b=Qa8vf/2wZjpZ0rzuy7o0n0hSqKAiJBKUhsibeIES1jiutQmMpnHdVqyR6CCua0NkznehjC84FwIBsMVu9W8vGGGjaiMmS7OZOqBoBpArKg8Qaauac1vzXw5vYNXo5kPEYo4UoeE133D+eu4RJV+9R8Cm5bs8SyIOhh7fFhSf9AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756347447; c=relaxed/simple;
	bh=5f2mmt9u33RfwW27TpFBKhySW3NJY0la1B1vEYqwVz8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QNXZom3I8f3FIcGeack0GMJbkbf9/wf8oG/19VBisy2blz8Ad2/48aSHdsJEcu1vcSxetaRbf0Anxw5ShI4rHBAmXY2iyK78buuVsgVl6z9T67eX/YKU/YQcbzRZ1ccfu/dBim72xMZx7o0pGPkgme5/upHcGB+inh3v+c+6xec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IuXxwAUa; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IuXxwAUa"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-74525666d65so356038a34.2
        for <sophgo@lists.linux.dev>; Wed, 27 Aug 2025 19:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756347445; x=1756952245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cMD9oVw7wzB9jTZgK3seO4aPiDIfpeTKPhUfVzD+DA=;
        b=IuXxwAUa2MohyXYQ0Hl6FXJrv95DT/rvl4dDl4jz6K3gQcRF+hOpLLgRWeMpZ3OIdS
         7Zqpds4i7QZJPn5A9z16tOcSa3U8AQvj9E/mOja/uP0So009jKGYK1ZavhhVm14v6LwD
         ka13xvbuJrijLvtq54vqJhz3kpvIahNCFpHTcTRwY+BR5RN0P9Hh9dI9wQSrMrD6uwbq
         +cu66Y6ybUqTpG61yR5K1mbG/w/amnu84yIRoACU3K6FBQmO+GD97URjNb1VE5tieW4B
         UueaITEeOzLmtyLovmlzajdhCTsTW77cY84weW9PmYyNr8qhha4yNE+xT8nawTuk+WU/
         +/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756347445; x=1756952245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cMD9oVw7wzB9jTZgK3seO4aPiDIfpeTKPhUfVzD+DA=;
        b=B4S48HqMwW2jXCZKq/m3pSmugw2oycjHzymVubL31Nbk0WOMOKd0T+Du14E9EnGMMJ
         yImPSZMphXNL5dzHhEFlAHZUc0o5uW28v9nykkAogngN93yRdlrGoXyg2P7z+9GGehZt
         cTTgSYXYW0gZaBfMkvAQennLJ2w3GNxA4pHOHa8mY1UIFbhyEguzq3TFi1P7pmw+TG2Z
         roB5Z565AHzjLpg1y3hjga1d1PjiLdzkds7zsXUVZgo/93iGq19k3+8NMNnZ79axUSwD
         e3L+EwcNFUVaTUBqzF8jMbzC8NgysmDnnDSM9MyR3UotPMFYlQDg2A/2DNddmnOCvK53
         k/Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVWSpSeAjO6T7uRXwVusBXyWIlRx4I+LppKN6eqipjSrZZlImw+IE8l1ekC31ICgwBo1DZmhX8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu2UVcB/H+v5mUlYtC1UvQwrlWyxjZ+c6qTNrXF0XbQzAr4NdQ
	5dgbMA7DbS34muipmdi/Rlje306O8IhtY/J6MivXuHFE2Ibd5GX+eyue
X-Gm-Gg: ASbGncsSXli6BDmuA/FmBjglZU/8b2DZdS3/pXy590YKgnRQLwUXZrV2zEjXiAOdIQo
	cjWgYeVQ2CQPL3WBAJQ+qownhjWvm0VMHpdgDfglkYgQSq2/ZAsCUJSkxsCS+Mx8bEYScR/+h/0
	+XKFwqrObJB9z5BETkf3GmEhrq0gvMnUJd2irGmiF5nWGSDFKq2Ik2AZvW3Mdghlr74FO9WWSVP
	0CNz6JWVbJ6H3/JJ/FhVxvdM58FbTLqVvU2uw0D2tyswor4AoVxLi9HdQxeAfdXXtdOBFjB9gVc
	gEAlAq6so4rTWn8Da8/dO9Xa+DaO84iy330Ko0Sfz3AE5AQ+SAVISPye+XPDkPoDLMG9ykCEDp4
	S8zm1XTwfe+z00YiNAvNr2oHPDd2BFh3vTkXADNnU8P8=
X-Google-Smtp-Source: AGHT+IFUMTBN0ewK0J12WWwmbqPZ20vlkC0r+3NLs/KDPeS4FrNivKz6PhTVcy1KC85aKvA34B7Fow==
X-Received: by 2002:a05:6830:6b06:b0:73e:9857:9839 with SMTP id 46e09a7af769-7450048644amr11399123a34.0.1756347445072;
        Wed, 27 Aug 2025 19:17:25 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7454eb2816csm63490a34.26.2025.08.27.19.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 19:17:24 -0700 (PDT)
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
Subject: [PATCH 2/5] PCI: cadence: Fix NULL pointer error for ops
Date: Thu, 28 Aug 2025 10:17:17 +0800
Message-Id: <fca633eb6d667a90f875cdf1263fcea2bcc2c969.1756344464.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756344464.git.unicorn_wang@outlook.com>
References: <cover.1756344464.git.unicorn_wang@outlook.com>
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

Add checking of pcie->ops before using it.

Fixes: 40d957e6f9eb ("PCI: cadence: Add support to start link and verify link status")
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

