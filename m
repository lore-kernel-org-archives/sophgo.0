Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEF32676E2
	for <sophgo@lists.linux.dev>; Fri, 18 Apr 2025 02:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744941819; cv=none; b=qFCoaHbyM38ncgTmK2La2yi4hXislCat0viGeweGMzJGr83fqe9U70nrSnp2DURE9WebQPQHOJ+/Uv4uW/N/t24I4S8HVTuyzw9Ta1i8jV6wYxFeHpUvprZTeQqeJIJfKU+WLJr1gtTUYqw05Z4suiDTiqWFDogcnr7KgWePSWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744941819; c=relaxed/simple;
	bh=tgBKFs4mjjqy0jH1NKNLjstVRkJPGbEFPB7Uc+1VYFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W442YQPhZANqtk5PbzfVyQq9BTa0DRazP356ur0+YeGYGyIg2+dp/SYQ3tEj03/s3YltVkq1Df8gJ6n/jl0jIOhWlLsRqfrZTD4dR8zc2gLpM0pPRzSYaRvvI4W5u1wekj1eiHtdPYy2aPu7/k6VybnI7toaFQoX9GJlCdzY2cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dP6sIdzG; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dP6sIdzG"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c592764e54so166536085a.3
        for <sophgo@lists.linux.dev>; Thu, 17 Apr 2025 19:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744941817; x=1745546617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zh63/3O8DJ0AMhBHTeTn6n+OIaLKyrEbfZMtQSeGAQ8=;
        b=dP6sIdzGQr5OnacZJa4F3HjmeG7l34/7Qbl3PzU46I6wBQ6HJVsive08XK9hnB4Xfn
         I4lgdsm+tqLbw0KM+r2aGWlqAYYllCrlqXYVW1SKsZAvrwlcP69IjmW2Q/rjLbEvPabP
         xV7+xh02I6TR+fj0XB+FLmTC7KlhHYfdeJ5PVQV0c7+YP+hRHhq669Vd2AUSXxu8z0hX
         WRqVv/nge2s2Mo31cE0OZlnNDJ6N/rYBeLKM1zwyoSOP9XcsHU2hH/ApcnhbUE/UoNtN
         Jju+48ceTJ2LsGXIqLae1PmzlhmD7fkCUwibfMCUmc1vqPVOvow28aEhcx86ATxx3NaB
         m1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744941817; x=1745546617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zh63/3O8DJ0AMhBHTeTn6n+OIaLKyrEbfZMtQSeGAQ8=;
        b=YSUjBDOCeycFIZqybzAbV9OY/0DXYM88YidGYj+gQ/fUqHyYAzB1jBNHleB0+6atUa
         FqddOoVwOOPl1lLglSZnOrM2dvoVYqdY7hJ232O2bsuj3D8ngmrgO7kYqlDSSRqHMaFe
         YeNCa1kQj12lneteMC6VB6FmDm2e0qgT+oAIaKveAnTNybZah1LJr9DmnOwi4bNet9J0
         8LyyxYXEdm9Y2AKnOzN59u4TEWpsQWtVVVfjc5bXBjrYCImT98R01kVzNFW9TVPRQx3p
         5DlBnEHtLFxfgtMnncxO/yU3fMqABnYeDtgdMExhri9PAQQodL0r6EZNgzMD1N5FcHOz
         YtVw==
X-Forwarded-Encrypted: i=1; AJvYcCVvrL85upTPkrg/IpBO5ckdu3ZziFp1SulKmgHtwcLrRkxbSs8Y9w9Jveru2YKcu4pNk0RilYk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZTQbmxK3rdh8cs7TWbLEZxKEpoifIlUra5LvsqodNBlWyhXJF
	x/jKwmwNBKx+7gKYM4tX6wgp1p2D1hX9XJ+oHswWovOJnqWeyS9q
X-Gm-Gg: ASbGnctkpdB7NkzZLGBfBw9nu80ygnriiGqWfpsV2RpVjpM+44IPHTz7OVsX0qGQp0i
	tCLTH3y83thb65gGadlbER6sYIAV6J0Sx1RQdKYSj2IIy6t32rTkedWpfiM6Zd+Khn8zk1NWCKu
	aZK2qyNnnrJSpkiZMf7SEBdN1tqeVis0G1It9X+/dfzMjIG8vBNCdur1FGy+95dm4GShZSRI0Ns
	UENItTSsG4Ju0O1HaI0elt/fIHRYT8WaWie6VP+PxjHKIZGS/JcvZW9VWMB9sOxo5YHd7xssB8k
	HbHTU+k7O5VOH0y1
X-Google-Smtp-Source: AGHT+IGt6cgriWdw1rXQhHBTfC5DxaFTz/L+44zx6+z+bVDbjk+lg9rrw0J84BJX1QCTaQhEwNnaKw==
X-Received: by 2002:a05:620a:4415:b0:7c5:6410:3a6 with SMTP id af79cd13be357-7c927fb6a1cmr194704285a.27.1744941816794;
        Thu, 17 Apr 2025 19:03:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c925b75c8dsm55892185a.111.2025.04.17.19.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 19:03:36 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 2/5] soc: sophgo: sg2044: Add support for SG2044 TOP syscon device
Date: Fri, 18 Apr 2025 10:03:21 +0800
Message-ID: <20250418020325.421257-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418020325.421257-1-inochiama@gmail.com>
References: <20250418020325.421257-1-inochiama@gmail.com>
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

