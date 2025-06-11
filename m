Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F23F239E8C
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629038; cv=none; b=rS3PJX3zTDQDDkrrqMP3gHWkyhnHRqqDczO6VuI9ca5XNcEyCiQvHd4unx7yZQ+bhpnAa9Xvq9esDUnHAUbytCxpIl/6LHprqJiQ/i91f6x3C2XYu7y/SgBC2oWPc6WPGXnI0AMwCe8dIV6W0cZiRXpVZZXoWoAN1jNhPfI+pVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629038; c=relaxed/simple;
	bh=EUI5QeL6eieWbEgVrm0C7erl4rUu/YZ5aTHVZ4tgyXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EAIPXjHtnFxANL6hv9m75daFT1aEx4jZlP6VF7etl4VhKMmlZlZuFeYffYMxIPHb37heT/wM8dWvVW+EnhDitVNNv0MIwWcbKZDvkYV3lMad5hwKSugLV47Mri1qX01PEXqBzMih5YVYOjD7rvPTi/4LJzc/WGQd7reCRTC94Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOT6UnCI; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOT6UnCI"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fafd3cc8f9so101715586d6.3
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 01:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629035; x=1750233835; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jk7Khhw8gAKW9DoLENa1NeEo5OGSYSokoeVpM6P3AMw=;
        b=aOT6UnCIbAMmPzV2pcu9w4lQaD8Nk8pg2R7r2M6RNGQLPbT3DwryeAye09m3SWyOyK
         TQuN+AELKb1+pXd+N+M7U/4tgfZYuVcNXD/5U3bv/EHUkDfzKRviS9S4ZhHe2OvmQxtn
         PFBnU56OQ1Jhn+HQ/RJ7uNFZh1vucYqDnK2jm4+/7dRPb06A38C08PVJYbN0ic3C167x
         CmVu1uo3+Heke7oeMEvIxl8zqy+uKR7eUHZEtkQdscb4h6jsv5n689RosbVOhZ+6D4XJ
         rzjN8Ci3tfoymcm/T3dcLAdeuTk13yFMyBEeRIH10NiO7qD+Zw/i6k3rMOLItz6vTU0e
         u8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629035; x=1750233835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jk7Khhw8gAKW9DoLENa1NeEo5OGSYSokoeVpM6P3AMw=;
        b=Agxpcopey0Z2g4rrYWWe0lvS8LYDFbSAxGUF3yzGf/OwgzWEnkVlyWFGuHxbXe9cGx
         /2Ni40ucBIoOs/4Kk1lIqoXM6ueySzP5/gWlVPDBynbF/ncM7d6p3IQgULQtGNWZ0sV9
         MVwGIpESWVamex4oN+/HSDTBM8VNy9cc1jHe32YALkzS9AWdl7/6EL66IYOqGRowvCGg
         /B1LbRNjI6sp8vBm+bwRfhbT7fyVJv4+sJJD9N0/kWaLGZOo0bMzT8pHEuhPlPIR5BU5
         AA6mGdIBYBrPMgjGBNptdxg+cVPwIdqK59Nh69ulgIMFSbOug9zT6J4YdHmojJbH/p3J
         g5pA==
X-Forwarded-Encrypted: i=1; AJvYcCVUlnEgc4cKtTazh/JhRIUkQ2/9z5KVj5dqdTs9BmdNDUm1coXAMs06fFX35GuHeCIFzUh1JFM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGqw+NMGVHaf3J8V73FTeErC7wGZ31gkORyUI/Z2jxV6AtYtyX
	Vx5sF6jBpG9pWPslAg3cZ8Nyy7rkicEcrXmWBH2ezx1VzN5o9el0fa18
X-Gm-Gg: ASbGncumkVx21RaWhqC5Q78ZuDFqqTH/Kc9Iae65A+RmCvTMJc+rS/rICSLLr6pPfSq
	js2850aHdxyOMmmDEKtC+fMAMfnMyGrIhLffhTy8rN8LHKFjofZ5hE5IlwrlR0Sfq+bbfpBJHc2
	3rOMlbU0fCX2iMH+k40+qmfv/cYo7ot6DfN3ByfcVPXwDQcNjBo4LTm/G63jOY1yxFAP5SgL8Rm
	mxyy43k4r3j+hsydxNsI+rqeRk8JsSvUGytVPwvPatGBwZouDPiJaGRX/09G3EExtA3ie5jNwuB
	aYNVaOqOeFSqAP5im0QNR/Lotlo3ChyKxeP9LA==
X-Google-Smtp-Source: AGHT+IH0eJcVpA3Axo1UhLVYk276iRhesKKZ51mNNdrlNRONtSi0+NgwJZgm5NkVtqY8aPkz01lwfQ==
X-Received: by 2002:a05:6214:2a4f:b0:6fa:c246:c363 with SMTP id 6a1803df08f44-6fb2d1355b7mr30778916d6.13.1749629035565;
        Wed, 11 Jun 2025 01:03:55 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b36737sm79188206d6.115.2025.06.11.01.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:03:55 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next 2/2] net: mdio-mux: Add MDIO mux driver for Sophgo CV1800 SoCs
Date: Wed, 11 Jun 2025 16:02:00 +0800
Message-ID: <20250611080228.1166090-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611080228.1166090-1-inochiama@gmail.com>
References: <20250611080228.1166090-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device driver for the mux driver for Sophgo CV18XX/SG200X
series SoCs.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/mdio/Kconfig            |  10 +++
 drivers/net/mdio/Makefile           |   1 +
 drivers/net/mdio/mdio-mux-cv1800b.c | 119 ++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 drivers/net/mdio/mdio-mux-cv1800b.c

diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index 7db40aaa079d..fe553016b77d 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -278,5 +278,15 @@ config MDIO_BUS_MUX_MMIOREG
 
 	  Currently, only 8/16/32 bits registers are supported.
 
+config MDIO_BUS_MUX_SOPHGO_CV1800B
+	tristate "Sophgo CV1800 MDIO multiplexer driver"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	depends on OF_MDIO && HAS_IOMEM
+	select MDIO_BUS_MUX
+	default m if ARCH_SOPHGO
+	help
+	  This module provides a driver for the MDIO multiplexer/glue of
+	  the Sophgo CV1800 series SoC. The multiplexer connects either
+	  the external or the internal MDIO bus to the parent bus.
 
 endif
diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
index c23778e73890..a67be2abc343 100644
--- a/drivers/net/mdio/Makefile
+++ b/drivers/net/mdio/Makefile
@@ -33,3 +33,4 @@ obj-$(CONFIG_MDIO_BUS_MUX_MESON_G12A)	+= mdio-mux-meson-g12a.o
 obj-$(CONFIG_MDIO_BUS_MUX_MESON_GXL)	+= mdio-mux-meson-gxl.o
 obj-$(CONFIG_MDIO_BUS_MUX_MMIOREG) 	+= mdio-mux-mmioreg.o
 obj-$(CONFIG_MDIO_BUS_MUX_MULTIPLEXER) 	+= mdio-mux-multiplexer.o
+obj-$(CONFIG_MDIO_BUS_MUX_SOPHGO_CV1800B) += mdio-mux-cv1800b.o
diff --git a/drivers/net/mdio/mdio-mux-cv1800b.c b/drivers/net/mdio/mdio-mux-cv1800b.c
new file mode 100644
index 000000000000..6c69e83c3dcd
--- /dev/null
+++ b/drivers/net/mdio/mdio-mux-cv1800b.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sophgo CV1800 MDIO multiplexer driver
+ *
+ * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/mdio-mux.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define EPHY_PAGE_SELECT		0x07c
+#define EPHY_CTRL			0x800
+#define EPHY_REG_SELECT			0x804
+
+#define EPHY_PAGE_SELECT_SRC		GENMASK(12, 8)
+
+#define EPHY_CTRL_ANALOG_SHUTDOWN	BIT(0)
+#define EPHY_CTRL_USE_EXTPHY		BIT(7)
+#define EPHY_CTRL_PHYMODE		BIT(8)
+#define EPHY_CTRL_PHYMODE_SMI_RMII	1
+#define EPHY_CTRL_EXTPHY_ID		GENMASK(15, 11)
+
+#define EPHY_REG_SELECT_MDIO		0
+#define EPHY_REG_SELECT_APB		1
+
+#define CV1800B_MDIO_INTERNAL_ID	1
+#define CV1800B_MDIO_EXTERNAL_ID	0
+
+struct cv1800b_mdio_mux {
+	void __iomem *regs;
+	void *mux_handle;
+};
+
+static int cv1800b_enable_mdio(struct cv1800b_mdio_mux *mdmux, bool internal_phy)
+{
+	u32 val;
+
+	val = readl(mdmux->regs + EPHY_CTRL);
+
+	if (internal_phy)
+		val &= ~EPHY_CTRL_USE_EXTPHY;
+	else
+		val |= EPHY_CTRL_USE_EXTPHY;
+
+	writel(val, mdmux->regs + EPHY_CTRL);
+
+	writel(EPHY_REG_SELECT_MDIO, mdmux->regs + EPHY_REG_SELECT);
+
+	return 0;
+}
+
+static int cv1800b_mdio_switch_fn(int current_child, int desired_child,
+				  void *data)
+{
+	struct cv1800b_mdio_mux *mdmux = dev_get_drvdata(data);
+
+	if (current_child == desired_child)
+		return 0;
+
+	switch (desired_child) {
+	case CV1800B_MDIO_EXTERNAL_ID:
+		return cv1800b_enable_mdio(mdmux, false);
+	case CV1800B_MDIO_INTERNAL_ID:
+		return cv1800b_enable_mdio(mdmux, true);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int cv1800b_mdio_mux_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cv1800b_mdio_mux *mdmux;
+
+	mdmux = devm_kzalloc(dev, sizeof(*mdmux), GFP_KERNEL);
+	if (!mdmux)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, mdmux);
+
+	mdmux->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mdmux->regs))
+		return PTR_ERR(mdmux->regs);
+
+	return mdio_mux_init(dev, dev->of_node, cv1800b_mdio_switch_fn,
+			     &mdmux->mux_handle, dev, NULL);
+}
+
+static void cv1800b_mdio_mux_remove(struct platform_device *pdev)
+{
+	struct cv1800b_mdio_mux *mdmux = platform_get_drvdata(pdev);
+
+	mdio_mux_uninit(mdmux->mux_handle);
+}
+
+static const struct of_device_id cv1800b_mdio_mux_match[] = {
+	{ .compatible = "sophgo,cv1800b-mdio-mux", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, cv1800b_mdio_mux_match);
+
+static struct platform_driver cv1800b_mdio_mux_driver = {
+	.probe		= cv1800b_mdio_mux_probe,
+	.remove		= cv1800b_mdio_mux_remove,
+	.driver		= {
+		.name	= "cv1800b-mdio-mux",
+		.of_match_table = cv1800b_mdio_mux_match,
+	},
+};
+module_platform_driver(cv1800b_mdio_mux_driver);
+
+MODULE_DESCRIPTION("Sophgo CV1800 MDIO multiplexer driver");
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.49.0

