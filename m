Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15871E5711
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744584344; cv=none; b=H2md2SNcEtmJraXgPHYnR+C1CkWICNPYr+ykKndGGy+l1wlIDh4VOXW44i9mJMbv+rJUYPhZ6wANYjGyiDjuxpemHXmQxN3WPWj/Lkra3hGoJlzOwrUdhTRnsihALKjHzF9SMHzzx6/GzXUInyI+dvqyedROy6tlcJG3GxicrwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744584344; c=relaxed/simple;
	bh=tgBKFs4mjjqy0jH1NKNLjstVRkJPGbEFPB7Uc+1VYFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gc6x4BZ4mwJ8tUHtic0AM7ACCLwEIBBH0KUOJe6opmcdB46/BLGWkTkHl2qVdxlYMYVVnmfeydtfTz5lL57hqegp3yJnA1aomNzCWNQVTF6QLACMBaqVWK/sVjCvuyaqvY5RQfZaQTt//4fClOXr2PRvygT+HWxX0L6ZRyFXsis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDtE2P0G; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDtE2P0G"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c7913bab2cso373432685a.0
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744584340; x=1745189140; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zh63/3O8DJ0AMhBHTeTn6n+OIaLKyrEbfZMtQSeGAQ8=;
        b=bDtE2P0GlIJxgks+1P6bt6pmTJuTmL1bVrRlgJ5HD1SkxLSFnsefUM9rYb6xRsMGtZ
         TK/2Dg+ZMBK71LDM2O12kdF7dGopwUzBnAfwMPGLF8TQo1J8hpkS5BLZ6M/QH1A6waWm
         rXgxlC3ZAMqpICtMXeOHeWP3VB4FY8O0896jXaWdTXJp7M0Kkr4APLjkDo69ppiEylvs
         raSvwM9E/LumOI+fda4HQvR6XnfRbvCXHDwX0EAIqtIavnBvlLE0sjwVzSROVid8s3Jm
         B2gs0HwtkHGvMtzf1+G86vne8wlw6/N6E8Qz/TPDy4dTb62Ba2AjlN3uvHJVK3RkLo38
         qCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744584340; x=1745189140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zh63/3O8DJ0AMhBHTeTn6n+OIaLKyrEbfZMtQSeGAQ8=;
        b=gynVey03NmXlmwjeLVaN5rTmlQhPpXaEDfpQZ+ez6ZT7Qj4u1w+hzMX/hp+MIvzAGd
         FeV/+5y6X4bSofK+UAzSZRGM3+2I/rUhcDdRhhN6KwTKbD3JM06/itirfnfT09IRm2tp
         6blN7W09d/B+AXuEX7mBxKzMgj7C7j51fumbQRjsksKPyZrMe0val0fjXQuGMqNReiTZ
         cqtSM0hoMvBAYK5d0n/TU8GCVIvn7d+UOBCGqEnD53uXBl2a8zYdrdhmcLGG3/uUxzIN
         pE5/+8itUYka/bKfigIepXjNMknDx7NfXztB1J3Coio59LPxk6KtSYRZmwLxJ1Ra//8e
         DR7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgY5+UXBVi9Q2sJLwWs8UnLcubj5cjmX4oFEOKtOP7+LqnpzhmRGNIe79kD627y+ICB8MPBn8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+qLOEZoJ4y4LlnNuVzKGz6FhgunSQ37mF/IH1dSI8ARFaBkOg
	0KU+Z7xbig3pVeFQdAaCs4Bmhz94QgBX/opTWVZbmvxm8L0bVV0T
X-Gm-Gg: ASbGncsENcPKbJH/HyAWJH0eGPkygoD/JQ7YnL6gZc1iPNHNBay6WfO8P0lI9kadE4G
	/jRwSrZtTt/QafZUONFBas8sTXEy0u+Yo3xhTZVdfJGfAZDBEXDMV/ZjdBXoTZ9tivHNa8PbHGM
	D+cDmqErzaSQJF9U/OQBVZ0I0dp60wS8q3m8+9tnPupWLhC+WiNV+4G8d6OxcendK2YA+A50YWq
	LotCahWnEYfwcY5zhGQ5VjcuPlUMjd9G0dUgflI58wVawZdx7w6mnfVN65Si0c67el29/Ei7M3r
	hhWgTXwbFKe4KV1oRLQbIfna2Pc=
X-Google-Smtp-Source: AGHT+IGPkOq+aW1xOSstUBVfkd7f5veHxmYuq86JO/7QxDtXjPe2HsusNOEdc8ZIbqHJ6p7GgaZyWg==
X-Received: by 2002:a05:620a:454f:b0:7c5:b90a:54a6 with SMTP id af79cd13be357-7c7af12e786mr1719995785a.13.1744584340354;
        Sun, 13 Apr 2025 15:45:40 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7b7d914b6sm298036385a.59.2025.04.13.15.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:45:40 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 2/5] soc: sophgo: sg2044: Add support for SG2044 TOP syscon device
Date: Mon, 14 Apr 2025 06:44:46 +0800
Message-ID: <20250413224450.67244-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413224450.67244-1-inochiama@gmail.com>
References: <20250413224450.67244-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SG2044 TOP device provide PLL clock function in its area.
Add a mfd definition for it.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/soc/Kconfig                |  1 +
 drivers/soc/Makefile               |  1 +
 drivers/soc/sophgo/Kconfig         | 21 ++++++++++++++
 drivers/soc/sophgo/Makefile        |  3 ++
 drivers/soc/sophgo/sg2044-topsys.c | 45 ++++++++++++++++++++++++++++++
 5 files changed, 71 insertions(+)
 create mode 100644 drivers/soc/sophgo/Kconfig
 create mode 100644 drivers/soc/sophgo/Makefile
 create mode 100644 drivers/soc/sophgo/sg2044-topsys.c

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 6a8daeb8c4b9..11e2383c0654 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -23,6 +23,7 @@ source "drivers/soc/qcom/Kconfig"
 source "drivers/soc/renesas/Kconfig"
 source "drivers/soc/rockchip/Kconfig"
 source "drivers/soc/samsung/Kconfig"
+source "drivers/soc/sophgo/Kconfig"
 source "drivers/soc/sunxi/Kconfig"
 source "drivers/soc/tegra/Kconfig"
 source "drivers/soc/ti/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 2037a8695cb2..0381a0abdec8 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -29,6 +29,7 @@ obj-y				+= qcom/
 obj-y				+= renesas/
 obj-y				+= rockchip/
 obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
+obj-y				+= sophgo/
 obj-y				+= sunxi/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
diff --git a/drivers/soc/sophgo/Kconfig b/drivers/soc/sophgo/Kconfig
new file mode 100644
index 000000000000..d97de4a41d5e
--- /dev/null
+++ b/drivers/soc/sophgo/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Sophgo SoC drivers
+#
+
+if ARCH_SOPHGO || COMPILE_TEST
+menu "Sophgo SoC drivers"
+
+config SOPHGO_SG2044_TOPSYS
+	tristate "Sophgo SG2044 TOP syscon driver"
+	select MFD_CORE
+	help
+	  This is the core driver for the Sophgo SG2044 TOP system
+	  controller device. This driver provide PLL clock device
+	  for the SoC.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called sg2044-topsys.
+
+endmenu
+endif
diff --git a/drivers/soc/sophgo/Makefile b/drivers/soc/sophgo/Makefile
new file mode 100644
index 000000000000..171a2922d75b
--- /dev/null
+++ b/drivers/soc/sophgo/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_SOPHGO_SG2044_TOPSYS)	+= sg2044-topsys.o
diff --git a/drivers/soc/sophgo/sg2044-topsys.c b/drivers/soc/sophgo/sg2044-topsys.c
new file mode 100644
index 000000000000..179f2620b2a9
--- /dev/null
+++ b/drivers/soc/sophgo/sg2044-topsys.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sophgo SG2044 multi-function system controller driver
+ *
+ * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#include <linux/mfd/core.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/resource.h>
+
+static const struct mfd_cell sg2044_topsys_subdev[] = {
+	{
+		.name = "sg2044-pll",
+	},
+};
+
+static int sg2044_topsys_probe(struct platform_device *pdev)
+{
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				    sg2044_topsys_subdev,
+				    ARRAY_SIZE(sg2044_topsys_subdev),
+				    NULL, 0, NULL);
+}
+
+static const struct of_device_id sg2044_topsys_of_match[] = {
+	{ .compatible = "sophgo,sg2044-top-syscon" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sg2044_topsys_of_match);
+
+static struct platform_driver sg2044_topsys_driver = {
+	.probe = sg2044_topsys_probe,
+	.driver = {
+		.name = "sg2044-topsys",
+		.of_match_table = sg2044_topsys_of_match,
+	},
+};
+module_platform_driver(sg2044_topsys_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_DESCRIPTION("Sophgo SG2044 multi-function system controller driver");
+MODULE_LICENSE("GPL");
-- 
2.49.0

