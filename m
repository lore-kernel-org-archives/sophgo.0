Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC311F8697
	for <sophgo@lists.linux.dev>; Wed,  5 Mar 2025 06:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741156810; cv=none; b=WErpIp6RdWPo0YcJ3iLVujNWQYYC+GJZPDyD7KxVzKnMqKMql6n6qQuzz+hMMEcaY7cpqkM0sG5JC47VPlgBZH9nPNuEGnS2EaMaWopHADqqZ71PpabKdZCeIerQisnS492PzoAKfghdRitv2iYVHEgo0M/WGFksH3u31vOQRgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741156810; c=relaxed/simple;
	bh=AGPOsmkN5Fae072sh/GeM7rngO+K7bS+aZizA0BpZdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umPvNwlNkWCHcPY7k0ozJTbfGZglOaZQeipaXh7AA3lYwY1yKe5SXABmCs6iqR49TKmuz7ZgSztVwWIwsPF6ZCeOJhH96YPCUDtemZmaJ3DBqfIQgC1QVP1zwSr1o2latK2CDcXj08SujEpS5Z01mQ8VBbiKfzt27xkdvL0JRBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McgR9rfc; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McgR9rfc"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c3db4a6110so21003885a.0
        for <sophgo@lists.linux.dev>; Tue, 04 Mar 2025 22:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741156807; x=1741761607; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cY6Pi0eVXjTj4iYGf3V3W021FfEKM0ai79ohmKI0mfc=;
        b=McgR9rfcBf+XAO9Il5IN7S7WUPv7dZoPaS5gee/lVk9lAuzcvswtZU2lABOu25QCf/
         b8MJmob3bvMf1Vj3msZMVQ7RtB5Cv6KYJd67fsGCrzuOA4/Sn+SYOmEi04ipfHEccFIa
         WtVYnUQ8xTm1XVNPv1LtQ0rKW+TXd2Z2QKvu27aIvS2ZkDeEpN3JU7DoQM6j5YmtHLJ/
         Aw3r1l6HU+iz+V36FTwDDY5JCTHD3dRsiZxJ8sGVeEUHVJvCBd8A3RD1MqFdHL3q8A9A
         COG82XN3bn7r4hlqd0o0Q3hvTEyDbFmZjB1oaaeCbuXp62Ef0oLjBvT1wSl+UfDKRaeF
         J/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741156807; x=1741761607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cY6Pi0eVXjTj4iYGf3V3W021FfEKM0ai79ohmKI0mfc=;
        b=gfwXGoXJqPnYQqvqsx42vNKCnjLJ/9DfmH64qyM1i+Zf0HGLb1bxgBqqriU3x/8NE1
         2ON4GYrMmStop3hIxs/cDBXBq5nwSIzV/pM8hPSZoPp7lj4ZtTZLvVzrYye6gEVcBmNX
         kAW9N57p8xpWjWOY7hNMZy4p/ObSS6D4zitUdv8N8DoZtxOCpKR+w0/9H/k24p8uJYie
         RoOtwYgwUOgeNeiegeAADsulteJNPHMKBpWFlYeTRuPfTW3jOA1DnbkXXP5tXfmeAm61
         KHF1cdsVYMYhd2rU6XuG2QkHshWYKHfjSBt6Ihp53fhYt65oXruFvdD+mY3N1SBfXVBU
         AjoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWo2FHzTAjKL37cv8s9lvNIIaCcCS/TlTicakFvkotTjKv01B7Kk8nY0qKhMyykA3Q4o8i7Zk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZk1pgkAWEjuzf5sRasOmzZUgqPCaiCUnv4UoVqzG77U0sEEdO
	mn2NwhR4bkZofY+IY58vDiR1aPyWVSjK4gylWRyq49ioeFfvyvCX
X-Gm-Gg: ASbGncuqzywN6RS6uYX4T8QHziPzhm+RoMXyohsr1WB57FweLgk9or1vI+cnJq23e4G
	3iDiJHyApM3RGlzLow2WWUXmrI8A+DTxjyfwTozaa8uww9A4y79MiHlRA471mzDL6bpBGa9oEOK
	WCPaGafzC/Bl4EpJkEO0EudwwCzI3IBakQOBjgJWzMLu3tLPTJS7+WOsj3RbhDYaZLoXyeniBuU
	2/VraujZuiyxgI097HXv5DOCYz2v1zlW0TER2vxSSnPHRHMeACGxvM+tK+vwTNJHb/X5H5Sd6W0
	SdM1NiTfEkAJblQouioP
X-Google-Smtp-Source: AGHT+IGwtGEt3KqPtzEArH9EO6uoLdPaUjiF2hOKrwwHaDa+GSJgxxkM/g83OEgs0VgyrS2u3iChTw==
X-Received: by 2002:a05:620a:2626:b0:7c3:c500:ca96 with SMTP id af79cd13be357-7c3d9172203mr291491985a.9.1741156807126;
        Tue, 04 Mar 2025 22:40:07 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3d9bcdcc3sm65443785a.60.2025.03.04.22.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 22:40:06 -0800 (PST)
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
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Simon Horman <horms@kernel.org>,
	Furong Xu <0x1207@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v6 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Date: Wed,  5 Mar 2025 14:39:16 +0800
Message-ID: <20250305063920.803601-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305063920.803601-1-inochiama@gmail.com>
References: <20250305063920.803601-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds Sophgo dwmac driver support on the Sophgo SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   | 11 +++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |  1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 75 +++++++++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 4cc85a36a1ab..b6ff51e1ebce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -181,6 +181,17 @@ config DWMAC_SOCFPGA
 	  for the stmmac device driver. This driver is used for
 	  arria5 and cyclone5 FPGA SoCs.
 
+config DWMAC_SOPHGO
+	tristate "Sophgo dwmac support"
+	depends on OF && (ARCH_SOPHGO || COMPILE_TEST)
+	default m if ARCH_SOPHGO
+	help
+	  Support for ethernet controllers on Sophgo RISC-V SoCs
+
+	  This selects the Sophgo SoC specific glue layer support
+	  for the stmmac device driver. This driver is used for the
+	  ethernet controllers on various Sophgo SoCs.
+
 config DWMAC_STARFIVE
 	tristate "StarFive dwmac support"
 	depends on OF && (ARCH_STARFIVE || COMPILE_TEST)
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index b26f0e79c2b3..594883fb4164 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
 obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
 obj-$(CONFIG_DWMAC_S32)		+= dwmac-s32.o
 obj-$(CONFIG_DWMAC_SOCFPGA)	+= dwmac-altr-socfpga.o
+obj-$(CONFIG_DWMAC_SOPHGO)	+= dwmac-sophgo.o
 obj-$(CONFIG_DWMAC_STARFIVE)	+= dwmac-starfive.o
 obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
 obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
new file mode 100644
index 000000000000..3303784cbbf8
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Sophgo DWMAC platform driver
+ *
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+
+#include "stmmac_platform.h"
+
+static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
+				    struct plat_stmmacenet_data *plat_dat,
+				    struct stmmac_resources *stmmac_res)
+{
+	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
+	if (IS_ERR(plat_dat->clk_tx_i))
+		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
+				     "failed to get tx clock\n");
+
+	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
+	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+	plat_dat->multicast_filter_bins = 0;
+	plat_dat->unicast_filter_entries = 1;
+
+	return 0;
+}
+
+static int sophgo_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get platform resources\n");
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(dev, PTR_ERR(plat_dat),
+				     "failed to parse DT parameters\n");
+
+	ret = sophgo_sg2044_dwmac_init(pdev, plat_dat, &stmmac_res);
+	if (ret)
+		return ret;
+
+	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
+}
+
+static const struct of_device_id sophgo_dwmac_match[] = {
+	{ .compatible = "sophgo,sg2044-dwmac" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sophgo_dwmac_match);
+
+static struct platform_driver sophgo_dwmac_driver = {
+	.probe  = sophgo_dwmac_probe,
+	.remove = stmmac_pltfr_remove,
+	.driver = {
+		.name = "sophgo-dwmac",
+		.pm = &stmmac_pltfr_pm_ops,
+		.of_match_table = sophgo_dwmac_match,
+	},
+};
+module_platform_driver(sophgo_dwmac_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_DESCRIPTION("Sophgo DWMAC platform driver");
+MODULE_LICENSE("GPL");
-- 
2.48.1

