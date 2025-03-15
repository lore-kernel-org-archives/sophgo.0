Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2461A316D
	for <sophgo@lists.linux.dev>; Sat, 15 Mar 2025 22:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742078970; cv=none; b=ap6SRsSRxN8f2BHc32AP7y1wr9kKemE8q9bWQTm1Mjk3JEqjft9xInBPa762oTAWOwbmdExzQHUrbEdp9ZKdmC+m5vC4G9t9DgtQKOy+3OIdCxzYBPbW2WG4fOS02/SvQDVlDYuKLLJDARNhGgOXBNG+JFahGCsH9XV8vgl2p1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742078970; c=relaxed/simple;
	bh=U8t57nZLwFK6PPGjQ8PzzY+8JraTkbKjs1mBleewIVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2Mblx60JPhjIbHoaCoWv7HEDkXPlKr19VbbpnOzkwJ06Y8CWvwJCJZwYohyYCHZJVvxxEDKvryj2psfuhC0I0d5FpZcW4g1nePMDXuWAd9TZplsST6cgeC3f3QuhlTm+WQbv240I9bRFvEG5aXyQfB51IIDxQ9bNrKFjBYO1qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+ayjaXs; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+ayjaXs"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso4788100a12.1
        for <sophgo@lists.linux.dev>; Sat, 15 Mar 2025 15:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742078967; x=1742683767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nug7jayKl8l2iBeYI/mQ4BwgeetvmfA+QYLNvW8wCpc=;
        b=R+ayjaXsqZWYc5cxIY+iaT8zULTgiPgHXmhYQUTJJev4rdgo9Hyeuwws9uDTHztExP
         WOf9NEy6dDCEhk4jShWsdSDQv/O1uYKTz8WwJqpkrW/c3Lr7XssZcdaS8HGVoS6ea1Ty
         606JymvLB5xiT8ms4XVGziz3BJj/0884oGi0EVCh6/2A/q8V+1ElKr5SD4e39QqbvWyX
         nQNAC7mRWCEMRYlFWp5SXPNrVNvIgby+LG++/lCC1U66M6e7ww7NAayW/BQ6gi0QmJhd
         mgzl+pAv0OaaFP0lgyhUg75bX/Qfg7S6uNMyL5awU3rfRpJw4cinsiMc/3ws3CBR9CmL
         3LYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742078967; x=1742683767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nug7jayKl8l2iBeYI/mQ4BwgeetvmfA+QYLNvW8wCpc=;
        b=w0r+l9lU17QJ1eZ2HGxwtD0LVimhtqV+xLb2R5jt8fJ51u202HmFv/V0fF1/1nYtwg
         gSj/NHLMcR9ItIRFE6z0joOPol2wSCJtGEHc3KFMvC7Req9C/woLUQFj/CRD+CJb6LGf
         dtGeYbZo2rh4VIa/XlKihdzpYon9mAkQYeHaI7r3W8uuUjztXy25bcfQX4x3qsG1SsLq
         8RLcwApCTSaWb1998uVtY+NJbpYo+a68aoV38AGvTcMu6WhK3zeSx2cjLbnZVF6Nuep6
         jcHIhYhstdwO5BLn9bbVvuP931zplbqCYkJOAkKodOIYDCnS82BfEtPNxVWIcSjVTN3L
         dZ6w==
X-Gm-Message-State: AOJu0Yy6JwRKYbDFoxbntKAGaLpanaa5NzjE9IieiM3ix5wNEqdoBqvZ
	zTzBlx7ayIA7y5AEFFjDj9xqr7uE1OXv/QhqGAcBCQ98PKIFFSV6Rh4VtRZe
X-Gm-Gg: ASbGncsEhuB5o/heh3yB6+tBDDh6pWewBgwWafmgOayR4JhjvLpTpiOFJxfywGZ1Jk6
	j9p223Dv1oClpOuwQZlB/fTaSFdBLf/vdJQDEpYymAe/GNYiKB/wuMa6/0Vr8wJdhIHTTnwafIf
	R9+fbaBeHpO2mQumhDbKndTxDYICdWGQ56yf8aVOGXJA5R0ctUq/laEMYl0fpflVzdIDoEJbl2l
	nD/B0kaXHrf+daEiA+iHhM6Mb7nd61uqhgEPzx5pFvhNL8GmHsBKJ2VzrR9XuLKS6rBEqViXVIq
	cvxgVXtKAxRbE4/c5K80yi3yjpMV92XngqBw2wfMGu5A8oXWh6sSz3Chkg==
X-Google-Smtp-Source: AGHT+IG2H7DhKVvR7WttZfYnmI/NT3GgvADoWlUJyxvS3Zc8Lbo8pm2sWfgDnCAhYjqx6VsSEhNLzw==
X-Received: by 2002:a05:6402:5251:b0:5e0:9390:f0d2 with SMTP id 4fb4d7f45d1cf-5e8a0228606mr7374898a12.20.1742078967312;
        Sat, 15 Mar 2025 15:49:27 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b160dsm3775586a12.41.2025.03.15.15.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 15:49:27 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rtc@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangyu Chen <cyy@cyyself.name>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v14 2/3] soc: sophgo: cv1800: rtcsys: New driver (handling RTC only)
Date: Sat, 15 Mar 2025 23:49:13 +0100
Message-ID: <20250315224921.3627852-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
References: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add driver for Sophgo CV1800 series SoC RTC subsystem. The RTC module
comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state
machine to control chip power-on, power-off and reset. Furthermore, the
8051 subsystem is located within RTCSYS including associated SRAM block.

This patch only populates RTC sub-device.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v14:
- Dropped MAINTAINERS F: entry in favour of the existing N: entry
- mfd_cell name "cv1800-rtc" -> "cv1800b-rtc"
- Removed Cvitek brand from Kconfig
- Not built by default if COMPILE_TEST
v13:
- Moved the driver from MFD into SOC subsystem
- Dropped unused "cv1800_rtcsys_rtc_subdev"
v12:
- new patch

 drivers/soc/Kconfig                |  1 +
 drivers/soc/Makefile               |  1 +
 drivers/soc/sophgo/Kconfig         | 23 ++++++++++++
 drivers/soc/sophgo/Makefile        |  3 ++
 drivers/soc/sophgo/cv1800-rtcsys.c | 63 ++++++++++++++++++++++++++++++
 6 files changed, 93 insertions(+)
 create mode 100644 drivers/soc/sophgo/Kconfig
 create mode 100644 drivers/soc/sophgo/Makefile
 create mode 100644 drivers/soc/sophgo/cv1800-rtcsys.c

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
index 000000000000..e50666e423a9
--- /dev/null
+++ b/drivers/soc/sophgo/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Sophgo SoC drivers
+#
+
+if ARCH_SOPHGO || COMPILE_TEST
+menu "Sophgo SoC drivers"
+
+config SOPHGO_CV1800_RTCSYS
+	tristate "Sophgo CV1800 RTC MFD"
+	select MFD_CORE
+	help
+	  If you say yes here you get support the RTC MFD driver for Sophgo
+	  CV1800 series SoC. The RTC module comprises a 32kHz oscillator,
+	  Power-on-Reset (PoR) sub-module, HW state machine to control chip
+	  power-on, power-off and reset. Furthermore, the 8051 subsystem is
+	  located within RTCSYS including associated SRAM block.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called cv1800-rtcsys.
+
+endmenu
+endif
diff --git a/drivers/soc/sophgo/Makefile b/drivers/soc/sophgo/Makefile
new file mode 100644
index 000000000000..8f22b4e79311
--- /dev/null
+++ b/drivers/soc/sophgo/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_SOPHGO_CV1800_RTCSYS)	+= cv1800-rtcsys.o
diff --git a/drivers/soc/sophgo/cv1800-rtcsys.c b/drivers/soc/sophgo/cv1800-rtcsys.c
new file mode 100644
index 000000000000..cb271f02afcc
--- /dev/null
+++ b/drivers/soc/sophgo/cv1800-rtcsys.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Sophgo CV1800 series SoC RTC subsystem
+ *
+ * The RTC module comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module,
+ * HW state machine to control chip power-on, power-off and reset. Furthermore,
+ * the 8051 subsystem is located within RTCSYS including associated SRAM block.
+ *
+ * Copyright (C) 2025 Alexander Sverdlin <alexander.sverdlin@gmail.com>
+ *
+ */
+
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/property.h>
+
+static struct resource cv1800_rtcsys_irq_resources[] = {
+	DEFINE_RES_IRQ_NAMED(0, "alarm"),
+};
+
+static const struct mfd_cell cv1800_rtcsys_subdev[] = {
+	{
+		.name = "cv1800b-rtc",
+		.num_resources = 1,
+		.resources = &cv1800_rtcsys_irq_resources[0],
+	},
+};
+
+static int cv1800_rtcsys_probe(struct platform_device *pdev)
+{
+	int irq;
+
+	irq = platform_get_irq_byname(pdev, "alarm");
+	if (irq < 0)
+		return irq;
+	cv1800_rtcsys_irq_resources[0].start = irq;
+	cv1800_rtcsys_irq_resources[0].end = irq;
+
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				    cv1800_rtcsys_subdev,
+				    ARRAY_SIZE(cv1800_rtcsys_subdev),
+				    NULL, 0, NULL);
+}
+
+static const struct of_device_id cv1800_rtcsys_of_match[] = {
+	{ .compatible = "sophgo,cv1800b-rtc" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cv1800_rtcsys_of_match);
+
+static struct platform_driver cv1800_rtcsys_mfd = {
+	.probe	= cv1800_rtcsys_probe,
+	.driver	= {
+		.name		= "cv1800_rtcsys",
+		.of_match_table	= cv1800_rtcsys_of_match,
+	},
+};
+module_platform_driver(cv1800_rtcsys_mfd);
+
+MODULE_AUTHOR("Alexander Sverdlin <alexander.sverdlin@gmail.com>");
+MODULE_DESCRIPTION("Sophgo CV1800 series SoC RTC subsystem driver");
+MODULE_LICENSE("GPL");
-- 
2.48.1

