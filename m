Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E111F03D2
	for <sophgo@lists.linux.dev>; Fri,  9 Jan 2026 04:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767931710; cv=none; b=MFO+Te0ex9Tq55xVNuTy8GFufAbwvtayBTUpOaj9QTpDBVrY7ZWnDVmYl1QlGz7KabB6V4HlKKYklfA8PJS36bTJwJ2J+FuM/AS4ET8m5xnQ+ez4mNNgrAoqofNxWpX0I82IgvgrOWK2b3Znxl7n4Q23c7aInZmzcuykBcXxqJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767931710; c=relaxed/simple;
	bh=2mcRdk8NIW4UsXr59JY8Y3kTFZlEmbKvPrEyHwut2sM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QBfqoMbJP/XRRjx+r8NK8pPA4R5peCxFS3jpuP0hTE+VxqwBNH6L73sXlNp42wvWth3KsqAPtqBnSs3uhdkEKddCZMVlw2LMmAZjwriLhTN66KxddJy0Nuoid5jlRgEiBX2y/dWEIvwldiYv4oSNgQ9i5tt9aeuF90ayOeY37dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSd94LU1; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSd94LU1"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-11beb0a7bd6so1863389c88.1
        for <sophgo@lists.linux.dev>; Thu, 08 Jan 2026 20:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767931707; x=1768536507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EDDoKbdnv2trjkmUU76X6syGqHliuOylCy3tou2sxDA=;
        b=WSd94LU1eMXaF2/Oxv2Zp3jZYUWBgp6asxVR4UrkuaLrH7k02Ci2kBtI6l5xEaoj5P
         q37lmcjJEKHuwH8Rpv95d61A1isVWZT+L2bG5h1LtwRAJq2VccOLzG6V9XYuhTAJnoKK
         bmBL212uZQ8e3fbja84FxCwqQyA3qBEVjDepv3cQtZ9GYinlLe6PUXK0cZaAmiyqFGIf
         J5cdnQuKBeM6xOWzJioqFYirO7i9vpFOsSP6wLX+SoUgIlgfvWXeP/L2k1y3omWkH++H
         pZV+qwVgDv5Zz7GtMsntSdGtgD+/UAOxR8dQimIvON/C0r7azU8sdjkKrdNIdMTZtfL2
         iLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767931707; x=1768536507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDDoKbdnv2trjkmUU76X6syGqHliuOylCy3tou2sxDA=;
        b=tQL3DsUuFQ7ETgMST8eaKsLI6oLAkgtsHlOd6pxi31Thejddw6hZ0Y/P0zynhqiowx
         gMJNdQzrkiM7aCAr5VxaCxN/GvCp7G2Ld/bcpebaIx94yATOPS5RYTQUw9RzXjPfCaF8
         7hgAjcrkZKHoVJdiF49OL1x0ai/3W5U/0cXpCADnpyrusmbagRWYutfIO3jifiI/rFXE
         AuhA7952rFVShxbjQ3iuG06n0Yr0n1tf7qKRwPWmlLn+phzA/07hYR0sevHPKzKpq/9u
         BRxxXIOu+aczAx+qwduuDg5wzUhWZQmANns1gMbiHKa0QUXn2bcHa4Jz2wv40SfSkQ7H
         891g==
X-Forwarded-Encrypted: i=1; AJvYcCVse5tIOUAGDmSyKNKr7mvhlgiErEtEz6LGF5saj0GboyCepZzx8A93drMc50kIdIQ6gtftKVo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdpR8Nc98PjjVIc4IGYUoaG0/a4DPf96ZK/dqAT4HzBa40+rzd
	nhvU1b7usrfDhTKTjDz+Q38yss2xbqgUtGqEVQRS+5HyrRMXPWBNAnX6
X-Gm-Gg: AY/fxX7DvyJVUDQkGX5JBsCkAS+WQo7FPQAXvM0vHO3Lv/SUnZc0gQ8Q87d+Pc9YELN
	sdjZ4CUdJGtgi28t8oBv81L+0qye6IWB51Y8oL6hnMzE48xWx58a0lSbgfVU2ZEk3RVy5EXIs3z
	Yc1KMF1rvh7Cwp4uVCvjLk0/MleTzdabWvKRKkuQXLkDi9cqHVWmPzv+uEjcpeM+2l8QU0Tohwu
	Q/GZ2deJ50KNyQiTlcuynKeare7C3GsWvxXHGbgUCZND3VeVO7wg5fbytkUSeV+WSGIccuZOdCS
	Rup/Q3mrX7f9ot9OqKoRGsae3Cp5VraEP4aevqxtgPOmefRL1clS1/Wr2M6/uVDEC1sXQVcCFWk
	nCPz/lk/mAhGAYePbai05WkCu9XTvvdbVjcbeVTw7d/ucZyE/vb1O2SBVZHw/+3Ay+ZgdZpH1BK
	JadTtlztEqAw==
X-Google-Smtp-Source: AGHT+IHYEyj9/7o+tBP0yDD4Xk/5DkC3757Xe2hVibZ6VY5BlbkB0VR0LKgl6GAvoD4FVDJZvGGtvQ==
X-Received: by 2002:a05:7022:3d04:b0:119:e569:f86a with SMTP id a92af1059eb24-121f85f242fmr7240325c88.7.1767931707386;
        Thu, 08 Jan 2026 20:08:27 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c239sm12869881c88.9.2026.01.08.20.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:08:26 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	linux-pci@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH] PCI/sophgo: Avoid L0s and L1 on Sophgo 2044 PCIe Root Ports
Date: Fri,  9 Jan 2026 12:07:53 +0800
Message-ID: <20260109040756.731169-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM
states for devicetree platforms") force enable ASPM on all device tree
platform, the SG2044 root port breaks as it advertises L0s and L1
capabilities without supporting it.

Mask the L0s and L1 Support advertised in Link Capabilities
in the LINKCAP register SG2044 Root Ports, so the framework
won't try to enable those states.

Fixes: 3309df45e6b5 ("riscv: dts: sophgo: sg2044: add PCIe device support for SG2044")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <gaohan@iscas.ac.cn>
---
Change from original patch:
1. use driver to mask the ASPM advertisement

Separate from the folloing patch
- https://lore.kernel.org/all/20251225100530.1301625-1-inochiama@gmail.com
---
 drivers/pci/controller/dwc/pcie-sophgo.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-sophgo.c b/drivers/pci/controller/dwc/pcie-sophgo.c
index ad4baaa34ffa..044088898819 100644
--- a/drivers/pci/controller/dwc/pcie-sophgo.c
+++ b/drivers/pci/controller/dwc/pcie-sophgo.c
@@ -161,6 +161,22 @@ static void sophgo_pcie_msi_enable(struct dw_pcie_rp *pp)
 	raw_spin_unlock_irqrestore(&pp->lock, flags);
 }

+static void sophgo_pcie_disable_l0s_l1(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	u32 offset, val;
+
+	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	val = dw_pcie_readl_dbi(pci, PCI_EXP_LNKCAP + offset);
+	val &= ~(PCI_EXP_LNKCAP_ASPM_L0S | PCI_EXP_LNKCAP_ASPM_L1);
+	dw_pcie_writel_dbi(pci, PCI_EXP_LNKCAP + offset, val);
+
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 static int sophgo_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	int irq;
@@ -171,6 +187,8 @@ static int sophgo_pcie_host_init(struct dw_pcie_rp *pp)

 	irq_set_chained_handler_and_data(irq, sophgo_pcie_intx_handler, pp);

+	sophgo_pcie_disable_l0s_l1(pp);
+
 	sophgo_pcie_msi_enable(pp);

 	return 0;
--
2.52.0

