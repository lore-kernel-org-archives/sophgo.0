Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4A121B1A0
	for <sophgo@lists.linux.dev>; Sun,  9 Mar 2025 20:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741552011; cv=none; b=P9FnSK2Nl+6KpqGB5abdcYjztoqxIzalYmK0DNnfoCnOLiBeCiQL6ZTIYwHXWp8C+j0Z1s0pG8XhQ6LJg7qA0TIISD/8YI7sFRSjQSWQhb8VTODjXcyJquMZwCHUtkJB2LOmHETWlzIcZaCYuXG4v8HHxEfU23j6R0NkJihbtpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741552011; c=relaxed/simple;
	bh=7VX1BSlvhenQSbquGdgx+W88iFUaSsE3inny0vBm9As=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MW1EDbuCrMeNHLU2C04b4QqveJnge7Fq8TmRSTFJ0yYA5c7ygpnFrPOLdfhIFdtOGekgbblTKx0SwZMwFmkehfk7gK3IpmZpOyfRsA4oln9HOfrER1/wEX2raD9++V4cPogZtRHnxxr0zZk+xzn/xWhLiu/T8SVE6+Ta5cssZIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UANOG8HY; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UANOG8HY"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abf64aa2a80so687164066b.0
        for <sophgo@lists.linux.dev>; Sun, 09 Mar 2025 13:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741552007; x=1742156807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gw7/cRMLqRZEOHmaQSQc8kR2LyWY/sX3ioRlmxvefbM=;
        b=UANOG8HYCklxO2O1DKEgKg/Zws2kl9Un4QVvgQhpBfMLHnsWpj8qAJJSuzrslhC7X1
         CGZt0+bzd0OsVF2wnR4tGLUUtUz7P0HaNsALzj+NPxEkn8jHDeklA8f232vH87MmdJnR
         MVX0tsjpVvn9IlCKBywex06d5aWZ6LUSNLWCfYaLmYFVwJIa2vE+004Glcq/DPiGAcon
         IwtNDoRSGS2sW0/OMriaPAzeeaLUwOZpTchM7Qn2OZ1ZA3nQeBSEiwGZWo55IebB9Hnh
         wx7L6L5S3yXsqMP2C55TQ+BtfjD0708jsmqgNDPTWtHSjzs1tC2JnXreb5auaZyHxyoy
         L61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741552007; x=1742156807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gw7/cRMLqRZEOHmaQSQc8kR2LyWY/sX3ioRlmxvefbM=;
        b=MBm/SNDVcBI2MN7ESd1ywc+H7ttBZpz4IFb3eU1ulmRRu6zhO7I/oxwLXSiA41cFDa
         TQfFI6hDWiIZh655XIDKY4rk3CPZ/9IxV93DSurfLHcJfBlWgtlfzvrvnewnrcSM62M+
         eO7yLeI5imiVFThL20FEWDoutJ2tJsz6XA6zC2UIVfHzMzCINIjhDcHLTiRK84A4Vn+s
         1EMny6qYF+GxLOCYqPXu2PqFOxxvDIEuprPztFzUm17Js+wN0KZ2QURSZ+OBiQ5dtDyW
         NlUiW8h/VbTJy0UJTgV6aKWBORgUND/X05JKMnoRwYh/UA8U4R6BZhpEA0cX22ILX5TU
         2Sdg==
X-Gm-Message-State: AOJu0Yz4ZGM9vjU7fSanjvjj7w9j3SHkfe+IlqephBklDnLJ+QKjtwE6
	CB9tlyxobFe4ftc9/O/sjjqMVss79Hb1slCV/36u1TG5jJ9lXnlhofyRVFw4
X-Gm-Gg: ASbGncsb7bxAp5G+f9JDnq8dHAE3ZlWxhzql3S/3m6WCNxjQuYA09duwmr01JwhFck+
	+Dkrv+5GvMIf8B9spSgUV3CMl2gaWvUPg+VEpkvNkl73esDpUYhwd+5OdMPEKW9WjSVP8dHG+AO
	KEd5U/Q6G34yg9eTcEgPp4VfleeHqyLn6UIYk2fq/P+XH6clgHEoFSqUowh+h/W6kN4a28Kear5
	IaM9pTGrc4IAM1VLR28N8nUgLbE/WiMbc8BJZSaSPZU8X5hGW43YlsbPYm/cBrItR2QrKWB5PY7
	QnpQLopovZ4PvOOXn70ZY2ERuEKRQ56GjQ0TkBk7wsxrGXMnpeJUb07rNg==
X-Google-Smtp-Source: AGHT+IGAXfaXpuQ14waj4NhT86vpzngczi5+WF0SSRJjHCh71cfkSjOTmMNuBVqn+diVxJcamNjEVg==
X-Received: by 2002:a17:906:eecd:b0:ac2:4bf9:bf87 with SMTP id a640c23a62f3a-ac252e97382mr1502763366b.34.1741552007124;
        Sun, 09 Mar 2025 13:26:47 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac27c7e29bbsm281833966b.92.2025.03.09.13.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 13:26:46 -0700 (PDT)
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
Subject: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver (handling RTC only)
Date: Sun,  9 Mar 2025 21:26:24 +0100
Message-ID: <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
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
v13:
- Moved the driver from MFD into SOC subsystem
- Dropped unused "cv1800_rtcsys_rtc_subdev"
v12:
- new patch

 MAINTAINERS                        |  1 +
 drivers/soc/Kconfig                |  1 +
 drivers/soc/Makefile               |  1 +
 drivers/soc/sophgo/Kconfig         | 24 ++++++++++++
 drivers/soc/sophgo/Makefile        |  3 ++
 drivers/soc/sophgo/cv1800-rtcsys.c | 63 ++++++++++++++++++++++++++++++
 6 files changed, 93 insertions(+)
 create mode 100644 drivers/soc/sophgo/Kconfig
 create mode 100644 drivers/soc/sophgo/Makefile
 create mode 100644 drivers/soc/sophgo/cv1800-rtcsys.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3eee238c2ea2..ac15e448fffb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22354,6 +22354,7 @@ L:	sophgo@lists.linux.dev
 W:	https://github.com/sophgo/linux/wiki
 T:	git https://github.com/sophgo/linux.git
 S:	Maintained
+F:	drivers/soc/sophgo/cv1800-rtcsys.c
 N:	sophgo
 K:	sophgo
 
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
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Sophgo/Cvitek SoC drivers
+#
+
+if ARCH_SOPHGO || COMPILE_TEST
+menu "Sophgo/Cvitek SoC drivers"
+
+config SOPHGO_CV1800_RTCSYS
+	tristate "Sophgo CV1800 RTC MFD"
+	default y if COMPILE_TEST
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
+		.name = "cv1800-rtc",
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

