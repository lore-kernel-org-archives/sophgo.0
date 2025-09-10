Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2EF2309B3
	for <sophgo@lists.linux.dev>; Wed, 10 Sep 2025 02:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757470130; cv=none; b=IKWIKh3CJX//Xf4p/Wik1d8JKSh4KhUgaUdmTsVwArthJVYupyB39JwBcnO279BC8cbYv0NRfYerLjg2/GFknMRX2sU9sE0/w2PrZviWofGmRM2Ewkh4ONnoniCUmORQtxsOn/LrZLDve7mD00CcbtBU2gVFYKCrfgrpcrYRkGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757470130; c=relaxed/simple;
	bh=khIEoJhgTqQOec4hXOVd9L/mM09/lGczpz+2cb8Mj1c=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CaRtCvXa6waycOEr1mlVsSrNMsD7Cc45gRQGg8cHFwQq0r8aBTCwwwlOaR1zXyh1yXilpSPFFs0+atAEEfmDpXqcO9JSm2tfz+emKBAY/BmNcFEkkGkr5ib4PqrUC4xbyxZjtFX0uWhXP22CdaEFneJLcF3ghvHKWPyAoJ10hro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwKZG+Cq; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwKZG+Cq"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-726e7449186so68934266d6.0
        for <sophgo@lists.linux.dev>; Tue, 09 Sep 2025 19:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757470128; x=1758074928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1kKuKImv7GctF9OqERXtoZe8KO1bpSjPCvzB+6cOlo=;
        b=AwKZG+CqMkm9YQ2XrUpJbkYQcROIurzrVpf8osNBcQCF+CAizSQU+t/Yoy4iLFjcK2
         vSZeRrkPg18QYl43IEuQANFQ2R3vG62cMuPf+txPA27FOvXQ4R1u1u9iHDGJCkQ2gfb5
         hgq3V12W4l2X2GzsRuiCvOxd74eAzmO0DuFqp98zpyaNx9LjfKTuerHXhr8h721ticGF
         uktzH05IeJS0RtIapyTv0AZL1Md/D3Pbn7J50FvhRpb2Cs9fN2WWXBZWiuPkQzxGbthP
         AuM5srrUm9hkAkqLpJVIoQf5X98+Nuee+vcvjKgK+EzBmjnZLM7mpLTRujUo0zUnzRVj
         XDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757470128; x=1758074928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1kKuKImv7GctF9OqERXtoZe8KO1bpSjPCvzB+6cOlo=;
        b=BML2+qsgPVj/nj2UD6gHLX3cZ0+w1DDfIiX02KgJAN6sUjhLMkAjXltk9lPz7YD7aj
         EEnJRR2ULT0T8+04l/fIFRfwVfaiO8dl5y9ySuucSgoF4e94vMyIeHC6YU6f1oj09Qja
         fJBq9tVvIl/cFydiw7l/rbX8OlnqPfy1Z1bvnsHqdAZmmSSgt/BLgFGeyoYqcwgYWO2l
         MWdlxYbqhzgQsjxJ5WRu0OABksLB3Gar/5qGFONwSPJWDMk995X0xR2AJ/v6Io5NFFp0
         x2hfkDubUgj4qhzfhS05YfhQqNFPFaXFEYl7dnoKc0InmVLbSD+lkzjzQklacZOasZkC
         AV3w==
X-Forwarded-Encrypted: i=1; AJvYcCU6jYSxEEM8iE+e4zO4LEPMLh9diD6w41YwTHVlfxTpRfalq1jTgpD2YxWaWcCGHrc76z4K8H0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+H+fYJpPuLul++ilAgOvtwat6WjW/JZeAwcOR/5fKdCN5SDO1
	sKUjHGxHi6rnwO2nIbeHFi/alIwKTfNVcVZmMvsklFf6NKMiHvqzxyvE
X-Gm-Gg: ASbGncvYLmukMc7vwwv5VBmNquzsd+1oJ1Hpway7UImwgddSgZx/28wcaWdvReDUOVJ
	FjpOcySXEGNOgANtEgx0gzLgMca5OLmaHS5oWsuViQwzJaSfA327GlpMRIEoUNELycQG2mGOcG9
	n7XOCorIF0kSeik1oqO8RlX5uhx0jaaLZaXnvhtbT884rljstbdk9nVjNm5RTW0gTUSyqZ45z8A
	RtandeXQH3JBI9gOXJTE1JZLelu9ox17+26uKn9PU6oN5Lj7jPc3fRGa7AOWGaPOuf5h8JfzPlK
	JvszfiptAleVFA2rAnZiSC6c63qZeYRC5xHHGIqe2VGZ7b6+cmyS7A+/uts/KLxFJtP6RYnBJtc
	J36Tdqa8vwnVhT8PebYSLWt82cP7EP3Ww
X-Google-Smtp-Source: AGHT+IEP0LcAhoihnbV2d1OBh2Z6NJtDjWlEEi8NwAlfZHgJtJ8a8yODK14yeBgI516xZ4vfhQNFaQ==
X-Received: by 2002:a05:6214:2421:b0:720:e5a:fe3b with SMTP id 6a1803df08f44-7394425a27dmr153957196d6.58.1757470128096;
        Tue, 09 Sep 2025 19:08:48 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-725dda254d4sm132429776d6.8.2025.09.09.19.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:08:47 -0700 (PDT)
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
Subject: [PATCH v2 3/7] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Date: Wed, 10 Sep 2025 10:08:39 +0800
Message-Id: <162d064228261ccd0bf9313a20288e510912effd.1757467895.git.unicorn_wang@outlook.com>
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

Add support for PCIe controller in SG2042 SoC. The controller
uses the Cadence PCIe core programmed by pcie-cadence*.c. The
PCIe controller will work in host mode only, supporting data
rate(gen4) and lanes(x16 or x8).

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pci/controller/cadence/Kconfig       |  10 ++
 drivers/pci/controller/cadence/Makefile      |   1 +
 drivers/pci/controller/cadence/pcie-sg2042.c | 104 +++++++++++++++++++
 3 files changed, 115 insertions(+)
 create mode 100644 drivers/pci/controller/cadence/pcie-sg2042.c

diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
index 666e16b6367f..02a639e55fd8 100644
--- a/drivers/pci/controller/cadence/Kconfig
+++ b/drivers/pci/controller/cadence/Kconfig
@@ -42,6 +42,15 @@ config PCIE_CADENCE_PLAT_EP
 	  endpoint mode. This PCIe controller may be embedded into many
 	  different vendors SoCs.
 
+config PCIE_SG2042_HOST
+	tristate "Sophgo SG2042 PCIe controller (host mode)"
+	depends on OF && (ARCH_SOPHGO || COMPILE_TEST)
+	select PCIE_CADENCE_HOST
+	help
+	  Say Y here if you want to support the Sophgo SG2042 PCIe platform
+	  controller in host mode. Sophgo SG2042 PCIe controller uses Cadence
+	  PCIe core.
+
 config PCI_J721E
 	tristate
 	select PCIE_CADENCE_HOST if PCI_J721E_HOST != n
@@ -67,4 +76,5 @@ config PCI_J721E_EP
 	  Say Y here if you want to support the TI J721E PCIe platform
 	  controller in endpoint mode. TI J721E PCIe controller uses Cadence PCIe
 	  core.
+
 endmenu
diff --git a/drivers/pci/controller/cadence/Makefile b/drivers/pci/controller/cadence/Makefile
index 9bac5fb2f13d..5e23f8539ecc 100644
--- a/drivers/pci/controller/cadence/Makefile
+++ b/drivers/pci/controller/cadence/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_PCIE_CADENCE_HOST) += pcie-cadence-host.o
 obj-$(CONFIG_PCIE_CADENCE_EP) += pcie-cadence-ep.o
 obj-$(CONFIG_PCIE_CADENCE_PLAT) += pcie-cadence-plat.o
 obj-$(CONFIG_PCI_J721E) += pci-j721e.o
+obj-$(CONFIG_PCIE_SG2042_HOST) += pcie-sg2042.o
diff --git a/drivers/pci/controller/cadence/pcie-sg2042.c b/drivers/pci/controller/cadence/pcie-sg2042.c
new file mode 100644
index 000000000000..c026e1ca5d6e
--- /dev/null
+++ b/drivers/pci/controller/cadence/pcie-sg2042.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pcie-sg2042 - PCIe controller driver for Sophgo SG2042 SoC
+ *
+ * Copyright (C) 2025 Sophgo Technology Inc.
+ * Copyright (C) 2025 Chen Wang <unicorn_wang@outlook.com>
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "pcie-cadence.h"
+
+/*
+ * SG2042 only supports 4-byte aligned access, so for the rootbus (i.e. to
+ * read/write the Root Port itself, read32/write32 is required. For
+ * non-rootbus (i.e. to read/write the PCIe peripheral registers, supports
+ * 1/2/4 byte aligned access, so directly using read/write should be fine.
+ */
+
+static struct pci_ops sg2042_pcie_root_ops = {
+	.map_bus	= cdns_pci_map_bus,
+	.read		= pci_generic_config_read32,
+	.write		= pci_generic_config_write32,
+};
+
+static struct pci_ops sg2042_pcie_child_ops = {
+	.map_bus	= cdns_pci_map_bus,
+	.read		= pci_generic_config_read,
+	.write		= pci_generic_config_write,
+};
+
+static int sg2042_pcie_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pci_host_bridge *bridge;
+	struct cdns_pcie *pcie;
+	struct cdns_pcie_rc *rc;
+	int ret;
+
+	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*rc));
+	if (!bridge) {
+		dev_err_probe(dev, -ENOMEM, "Failed to alloc host bridge!\n");
+		return -ENOMEM;
+	}
+
+	bridge->ops = &sg2042_pcie_root_ops;
+	bridge->child_ops = &sg2042_pcie_child_ops;
+
+	rc = pci_host_bridge_priv(bridge);
+	pcie = &rc->pcie;
+	pcie->dev = dev;
+
+	platform_set_drvdata(pdev, pcie);
+
+	pm_runtime_set_active(dev);
+	pm_runtime_no_callbacks(dev);
+	devm_pm_runtime_enable(dev);
+
+	ret = cdns_pcie_init_phy(dev, pcie);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to init phy!\n");
+		return ret;
+	}
+
+	ret = cdns_pcie_host_setup(rc);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to setup host!\n");
+		cdns_pcie_disable_phy(pcie);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void sg2042_pcie_remove(struct platform_device *pdev)
+{
+	struct cdns_pcie *pcie = platform_get_drvdata(pdev);
+
+	cdns_pcie_disable_phy(pcie);
+}
+
+static const struct of_device_id sg2042_pcie_of_match[] = {
+	{ .compatible = "sophgo,sg2042-pcie-host" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, sg2042_pcie_of_match);
+
+static struct platform_driver sg2042_pcie_driver = {
+	.driver = {
+		.name		= "sg2042-pcie",
+		.of_match_table	= sg2042_pcie_of_match,
+		.pm		= &cdns_pcie_pm_ops,
+	},
+	.probe		= sg2042_pcie_probe,
+	.remove		= sg2042_pcie_remove,
+};
+module_platform_driver(sg2042_pcie_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("PCIe controller driver for SG2042 SoCs");
+MODULE_AUTHOR("Chen Wang <unicorn_wang@outlook.com>");
-- 
2.34.1

