Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A134918E02A
	for <sophgo@lists.linux.dev>; Fri, 12 Sep 2025 02:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757644574; cv=none; b=DYUoTIIZrbVpJzM1vQiQknTdpBfN7KoCsp/o7ewoTA/C0HQ9kzMoALY0STqlnUdLt7w/EwK32bGl3AUY378ATSfOeNLSxsOwSihcDazvGTKG43ULvWIP1P419MUPnI94t2EVOF3t5aXR0z+ZDjcMP6N5ajCZcxTa2lQIOeUNmzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757644574; c=relaxed/simple;
	bh=OS9j70HJBgJdnu++cmJduNYkDHIWHGvyM1VZ0y15w7w=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bZ0EXrc+1rRU/kBuoG4mzjktapoLSB8rD+DElalGESvFpFDk4PJByYA7YTaLV4Vsus2vjOCddetf8ho8HuUTd0Qu77ISj3R8t47uee00KVJJaYOSc9NLHVsEVtzj2yIHkAIdZwBoq1DgpZdOiFNT61i1EKv2cs/qYT/E9q5G6O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dC2bi6Kx; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dC2bi6Kx"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-74572fb94b3so1380986a34.2
        for <sophgo@lists.linux.dev>; Thu, 11 Sep 2025 19:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757644572; x=1758249372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufI02VTMyX7sTfBD7Jn/jEH2YUmO7DVAO0QyMj+WG88=;
        b=dC2bi6KxUIJDA73g/byKXa5D1BSWoYNJim03bMkiELEXNUfjU8nkKr5mb5aqz8tVXq
         KhYe4ToUjrKrcstd5aprWqZi9oi5IY6OxKDClhUYa8rHfShP8oF6XXFJp1iX8lpTqduI
         Q7qdTmL3pHOA+bIK8uPnxOfJTAASlKr6Dw/tmVQP1999HMuoyfRoi8NQAgGf4O9c3IvL
         YU6z6Cw5qbi+ZKmVIjVMF8CvKBwx/qRhQztLMnBpBieRaAkocJitCG2UP90Cu6JSp+X/
         e/NP8Z/UTK0fMfB4ClIeJbJn8zxqa+cjaaDAUwUUC14GW81q6+A9cB3UuZnwIp64xhPA
         G19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757644572; x=1758249372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufI02VTMyX7sTfBD7Jn/jEH2YUmO7DVAO0QyMj+WG88=;
        b=TcknWzqU0ozcbnhII9VtHy4WiZpl1i158Rh4ZbOTksfMfFC8i0EPkqb2D4C/JDpkST
         jnLMB/Ao3YYleU2l8wUeORK7/EF9+CDtJrE6JgRxhv8GbGmGLG/p/cQkidZZDbKxxcvD
         iPDQc0Ud4pMWl89TjKlZJH0mfVq+4j5PVkkZXwGGfYTl5MHGEzeF7ubJrBZMQKjlR1vD
         l9StsXLr0Y8NoynKVI1aYrqJ5ZRVISk+NFsaeSzwvXjXzWHk+xomZQtQQjsfhTsm9e3I
         LqZwqsZEo/dLcAzjUCWuoOfDXQySGlJdXRR0jG5nETpID+IkHXtU/Bcn8JLyPUeivgNP
         0m5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1qekjzeg+ynMXe55MD6GxzxTU568+IQKPxEy/eQ7sE63mCnzWuqUvicZWXBk7RA1q4LnzFsU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4U8Ek4P5/MvkxOi2eLDoukoEOJuqyueYwlQr7t9BeBGV+MUmo
	1DakrTosWGRmv8+u9IuwMScH/1k7wYyQtL7CcDQ3/ZoHQ1NFNl8HSRLM
X-Gm-Gg: ASbGncvZRoWDH4fDiRVWrLxYsJ5+T7Zr1SUJ0AsHy6UZwqUqJ9Kh1Jo1cYM6HE6f5bO
	uhao8FiqWlX2tDW4lJZPDUYf0XQo2z+8eXGYViv0bCijXP/NXiYQWBFZW+XIAi8x4Jpt0kdmhFh
	QySSojYyP9McxmtfOzdOc/r8tP5/MP1u2zK3MzjKEJKNwHa1kAmB0vUlRNaXLyaiWT8TTF7CPg6
	tHNRdVPdaHfxzJ8i7ARRvp0PUw6W8bI1wc62hoHic/wWO1mqBQ8ttXDivjIph6/ePy8xZaimwXJ
	Hzn1PBYs0PrPAcZhnJH4HUDSgQTgI00IGXi0f8rOdduDOKswqVORvxtni3Mt3OvVPwTmS23lKsS
	QIg9wAe08kxGmU/r7fYthNAXbMNVxn9qM
X-Google-Smtp-Source: AGHT+IHP2whgLxUbkCPCNG1W78sKOKWUGbVdpP/qwDmDJygd12n8LXTyx57fCwWzBECssKtsoYm6OA==
X-Received: by 2002:a05:6830:d10:b0:745:3cea:c705 with SMTP id 46e09a7af769-75353875ddamr997804a34.14.1757644571861;
        Thu, 11 Sep 2025 19:36:11 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7524986a7cesm752506a34.11.2025.09.11.19.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:36:11 -0700 (PDT)
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
	fengchun.li@sophgo.com,
	jeffbai@aosc.io
Subject: [PATCH v3 2/7] PCI: cadence: Check pcie-ops before using it
Date: Fri, 12 Sep 2025 10:36:01 +0800
Message-Id: <35182ee1d972dfcd093a964e11205efcebbdc044.1757643388.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757643388.git.unicorn_wang@outlook.com>
References: <cover.1757643388.git.unicorn_wang@outlook.com>
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

