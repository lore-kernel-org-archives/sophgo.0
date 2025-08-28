Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AC87260A
	for <sophgo@lists.linux.dev>; Thu, 28 Aug 2025 02:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756347471; cv=none; b=u09U5ugxaDlCNXY/EJks3dSsiQ2eP+H6v3paZLhy6HPZYQrezsiY3iVCajggKnuPfOXjbMTPezvlFezul/ycfJWL4bKUw7YUa/9P4nyUv3YfA1s5mi8hAFd+fS6xdMR5XyJo9RUaKLzmcIDNq2FOIVs8ODgXIdGHUofLRbXoe20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756347471; c=relaxed/simple;
	bh=jsp3ZxCFIwxUfMwp0GyT+wPOde8wDXy/DnjM645DC7A=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BJ09MYwFA7L4qDnRERgwfxs164tZMJJ+0Xh1cbZqoS1tK7G814OXSpVGqB2ouudUE3RiIpvG97dqYSNwXaPr+xtEo9hqmnbppF4V92aj0ccVnBR7fPsGTfi7I5qahaeKNwUan+8oHhq7dEvzV7phKJxIXrEn/38I17OpWBPLGz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWrhZ6ee; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWrhZ6ee"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-30ccec59b4bso461838fac.3
        for <sophgo@lists.linux.dev>; Wed, 27 Aug 2025 19:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756347469; x=1756952269; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1J0WFYBhSOi86+35mD2mRHFDAZtuR1uDJv4Cz+MRN0=;
        b=VWrhZ6eeh5ncy/j0bXUAd4oKfHHB2Puc2rOBHkEb7O9z4fseNxXHBLn7JmKV/2DhNu
         XTCEN7Xb22lpSAO2/oQOrumNB0IOsgzhJ5mm2Xm+x2NNbN2BWriuK1QxaEvibnddK4BI
         zInSo4nJQy/6osGdENNaOfXUzTv2s7U/OJYNaoa5MplsjO4n2SUcG0hspRgkTYY3A71o
         lXVbfgOPBRrUGP7n36ZVZKHi+7h7uZ2VcjWCRdW54K5Gi79GNdijCnf9QOwjgwcRgTic
         FlE2jzNJey/B6qW3dGQMFiNpdWIOdEZC67zDASn6Y/f/Ke6Ms+oP08n0OtNSBaLOW8lI
         ix/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756347469; x=1756952269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1J0WFYBhSOi86+35mD2mRHFDAZtuR1uDJv4Cz+MRN0=;
        b=lMQs1klAyg8MHnowj6szKV5Mg1FvLpaPT6bOm8jEI21bP0CK3hlcqhcpFz5Nt5oy9I
         UVSnnMvqgmC1bl+doshct3ern4CzqAs0MwF4uykPBfkqjKyY1Dsx7ob6OsX3y8DMdeFA
         WED+XiIKpRvRUirWRUbfOBMHRKP5AhaA8rbo9gqXHp+QlJOjvot2YIQYDnGYIH53ME6v
         GAFnBmrnkqkm8pECX593Z1J/kI/I8Hlp4yTJoR9+Zf67dyY7x8P1xws9vxtdQW7ZTRZO
         poBepxbbYtRT7IF2Ydj1a4W/MUYgHIO0bzDH7PvKO/LSXpSa0jfEq2E7kLt5OzHlyncj
         k11w==
X-Forwarded-Encrypted: i=1; AJvYcCWxWorS5W9om4p5jMLHC5z0+HaSaFu3v4HiluziDTtRLETHoVaW7bojSUbDH9C/Ppufj+JtoB8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwV7AbY1fK5bfwmCmqGFc64aXlGnOEgGNxVumiiUUNcaVuCLtDo
	+pJh3e75LltnhfUXTNfsBC3xppQ1KIyDj0XXWiD7bHzycQ3WmrmZtYst
X-Gm-Gg: ASbGncuuf17etjM0QIxX3/kU+r1PjieNYR1TUxqbR8TzMov4E1nQEDXxmweplfLa+XZ
	+7E5gUsIVtI7gnFzu+hg3FBOvJRrPJl4JuyPeDvvBHenF8Ty6RKD21ZYmufmOfatak0LXKmC8xl
	5PuymWSrQTznRvH6gJw1cMxhqI/wd35N1SP5ZnUaTJxg69lhLKRXk11vmqithc0zgzFQgXhnwOf
	mT1G2XorgzmNcMAEDxCO8IwTkiM0gyDH1vO9Ojd8VnnxqyC9D9eXGnuETiN1+H3sL88Y8Bg4RnO
	by15sOvImxxgckW1Md7TZhUHIZBx3wvTJSduv7b6heNxSodGk2qQqM1OppRa/36epx6ploU29gb
	dwZvtYQqEvyzBgAwj7Ngy18JLwKG7itsCmQlgJltGw8Q=
X-Google-Smtp-Source: AGHT+IHsxuJu7jkWvWsps1igHiY/UUiFcSFtA/FN5HQqjKuBeXruePrLDEHJj7TO/JjdqRVkSNwrvw==
X-Received: by 2002:a05:6871:e387:b0:315:8a2a:3f59 with SMTP id 586e51a60fabf-3158a2a4cf7mr1544247fac.21.1756347469269;
        Wed, 27 Aug 2025 19:17:49 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-314f7a2dc16sm3674563fac.12.2025.08.27.19.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 19:17:47 -0700 (PDT)
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
Subject: [PATCH 3/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Date: Thu, 28 Aug 2025 10:17:40 +0800
Message-Id: <1df25b33f0ea90a81c34c18cadedd38526a30f01.1756344464.git.unicorn_wang@outlook.com>
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

Add support for PCIe controller in SG2042 SoC. The controller
uses the Cadence PCIe core programmed by pcie-cadence*.c. The
PCIe controller will work in host mode only.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pci/controller/cadence/Kconfig       |  12 ++
 drivers/pci/controller/cadence/Makefile      |   1 +
 drivers/pci/controller/cadence/pcie-sg2042.c | 134 +++++++++++++++++++
 3 files changed, 147 insertions(+)
 create mode 100644 drivers/pci/controller/cadence/pcie-sg2042.c

diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
index 666e16b6367f..b1f1941d5208 100644
--- a/drivers/pci/controller/cadence/Kconfig
+++ b/drivers/pci/controller/cadence/Kconfig
@@ -42,6 +42,17 @@ config PCIE_CADENCE_PLAT_EP
 	  endpoint mode. This PCIe controller may be embedded into many
 	  different vendors SoCs.
 
+config PCIE_SG2042
+	bool "Sophgo SG2042 PCIe controller (host mode)"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	depends on OF
+	depends on PCI_MSI
+	select PCIE_CADENCE_HOST
+	help
+	  Say Y here if you want to support the Sophgo SG2042 PCIe platform
+	  controller in host mode. Sophgo SG2042 PCIe controller uses Cadence
+	  PCIe core.
+
 config PCI_J721E
 	tristate
 	select PCIE_CADENCE_HOST if PCI_J721E_HOST != n
@@ -67,4 +78,5 @@ config PCI_J721E_EP
 	  Say Y here if you want to support the TI J721E PCIe platform
 	  controller in endpoint mode. TI J721E PCIe controller uses Cadence PCIe
 	  core.
+
 endmenu
diff --git a/drivers/pci/controller/cadence/Makefile b/drivers/pci/controller/cadence/Makefile
index 9bac5fb2f13d..4df4456d9539 100644
--- a/drivers/pci/controller/cadence/Makefile
+++ b/drivers/pci/controller/cadence/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_PCIE_CADENCE_HOST) += pcie-cadence-host.o
 obj-$(CONFIG_PCIE_CADENCE_EP) += pcie-cadence-ep.o
 obj-$(CONFIG_PCIE_CADENCE_PLAT) += pcie-cadence-plat.o
 obj-$(CONFIG_PCI_J721E) += pci-j721e.o
+obj-$(CONFIG_PCIE_SG2042) += pcie-sg2042.o
diff --git a/drivers/pci/controller/cadence/pcie-sg2042.c b/drivers/pci/controller/cadence/pcie-sg2042.c
new file mode 100644
index 000000000000..fe434dc2967e
--- /dev/null
+++ b/drivers/pci/controller/cadence/pcie-sg2042.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pcie-sg2042 - PCIe controller driver for Sophgo SG2042 SoC
+ *
+ * Copyright (C) 2025 Sophgo Technology Inc.
+ * Copyright (C) 2025 Chen Wang <unicorn_wang@outlook.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "pcie-cadence.h"
+
+/*
+ * SG2042 only support 4-byte aligned access, so for the rootbus (i.e. to read
+ * the Root Port itself, read32 is required. For non-rootbus (i.e. to read
+ * the PCIe peripheral registers, supports 1/2/4 byte aligned access, so
+ * directly using read should be fine.
+ *
+ * The same is true for write.
+ */
+static int sg2042_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
+				   int where, int size, u32 *value)
+{
+	if (pci_is_root_bus(bus))
+		return pci_generic_config_read32(bus, devfn, where, size,
+						 value);
+
+	return pci_generic_config_read(bus, devfn, where, size, value);
+}
+
+static int sg2042_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
+				    int where, int size, u32 value)
+{
+	if (pci_is_root_bus(bus))
+		return pci_generic_config_write32(bus, devfn, where, size,
+						  value);
+
+	return pci_generic_config_write(bus, devfn, where, size, value);
+}
+
+static struct pci_ops sg2042_pcie_host_ops = {
+	.map_bus	= cdns_pci_map_bus,
+	.read		= sg2042_pcie_config_read,
+	.write		= sg2042_pcie_config_write,
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
+	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
+	if (!pcie)
+		return -ENOMEM;
+
+	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*rc));
+	if (!bridge) {
+		dev_err(dev, "Failed to alloc host bridge!\n");
+		return -ENOMEM;
+	}
+
+	bridge->ops = &sg2042_pcie_host_ops;
+
+	rc = pci_host_bridge_priv(bridge);
+	pcie = &rc->pcie;
+	pcie->dev = dev;
+
+	platform_set_drvdata(pdev, pcie);
+
+	pm_runtime_enable(dev);
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "pm_runtime_get_sync failed\n");
+		goto err_get_sync;
+	}
+
+	ret = cdns_pcie_init_phy(dev, pcie);
+	if (ret) {
+		dev_err(dev, "Failed to init phy!\n");
+		goto err_get_sync;
+	}
+
+	ret = cdns_pcie_host_setup(rc);
+	if (ret < 0) {
+		dev_err(dev, "Failed to setup host!\n");
+		goto err_host_setup;
+	}
+
+	return 0;
+
+err_host_setup:
+	cdns_pcie_disable_phy(pcie);
+
+err_get_sync:
+	pm_runtime_put(dev);
+	pm_runtime_disable(dev);
+
+	return ret;
+}
+
+static void sg2042_pcie_shutdown(struct platform_device *pdev)
+{
+	struct cdns_pcie *pcie = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	cdns_pcie_disable_phy(pcie);
+
+	pm_runtime_put(dev);
+	pm_runtime_disable(dev);
+}
+
+static const struct of_device_id sg2042_pcie_of_match[] = {
+	{ .compatible = "sophgo,sg2042-pcie-host" },
+	{},
+};
+
+static struct platform_driver sg2042_pcie_driver = {
+	.driver = {
+		.name		= "sg2042-pcie",
+		.of_match_table	= sg2042_pcie_of_match,
+		.pm		= &cdns_pcie_pm_ops,
+	},
+	.probe		= sg2042_pcie_probe,
+	.shutdown	= sg2042_pcie_shutdown,
+};
+builtin_platform_driver(sg2042_pcie_driver);
-- 
2.34.1

