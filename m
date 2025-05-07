Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE27928E59C
	for <sophgo@lists.linux.dev>; Wed,  7 May 2025 19:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746647792; cv=none; b=QcuxxeDC0G1D0Bomry8KJ4NwEXb9iO9A4SsLfDKljtwc4BFIMpeI1s4hVw+lJQWbslgIQXI+oCujSG5ibnRW4prsAWcPNUuxY4MOmgXeBoyfCdxjmsoRl9nn6jxuCabQjFbZ/Af+gdOf5omNj/iRxBWV4NN2K+G0cOp4dk3M990=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746647792; c=relaxed/simple;
	bh=jP7cwJb7BQXpptavncYVB1y333BBlp7ZMaJKzFRSX8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NOhCu2/cLv5+n0DALGJXwipvnnSKgxRZkXPrC334ZROUKfJGgRP6MNSjyyD93+nT7vOjYLcCD0owqvCda6ewyp64rM8xc8QnQu0F1UhOFL/eT5afprI/uQ5SfcyBSOMqlmw2NM6j7huIppENkLYnzyag8kq7234cZnDu9bkQZfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/mpZ5st; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/mpZ5st"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so10364315e9.1
        for <sophgo@lists.linux.dev>; Wed, 07 May 2025 12:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746647788; x=1747252588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=25rSMDMLx7blmHqby0vCgZmhAkbft50207hfiKZb/RM=;
        b=G/mpZ5st4R3BBWFZQ03LHvpePNFQfMguNvAHSBdKUcMs1QQ4gzxGdmSpkji19Io1dp
         YZPvdpADEZ7/sP/Cncb8idcu61GS1u+oj+5qTHzTqWiUTALh6b4YcZMhzHfFmTpQej6f
         8OAox1CJme66UOn1MM97y+F0ystWIUaYTXxuuKoz6lhQMCPgLfQl8tNn4qUlT+qJd1gR
         qlv/rWno/9kKAfJj+mOH5jf+CipeCsLvBKQjasCKFWZfhmw+DUbp9C+9KZ8fSXhdIv+6
         pZe30MZJzJigrGqxPOb9VdVYAxXP8xmBeAUCVaaW9VlR4TAJI2gXfvzlD8j6z+oq0CJi
         09dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746647788; x=1747252588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25rSMDMLx7blmHqby0vCgZmhAkbft50207hfiKZb/RM=;
        b=rbwkGmgX14TXY/vhY7ZX1DqRf/WJCIyPBCKG1541kXxthR6R5suUisiLxVDhmqF3u0
         hcLjpq7tqYO+LpDCc1JzBqo7TsR4hj/IS8A+2vspdP6tgiELu99A7GzhUYdwOkVUQDBy
         XTkw5Hfrnb9CbeAApn3VXxjr+GqYnt9p8MKVZyowGyYibU5NeZpGt7X7J3CVj04xOq8p
         dNxckcYxZuKgw8YL/4L1zGBLAOe7qY8xki7wv9ur7eqBAk9ybA86UvJ1sarobY9PuJBj
         3AD7/y4ARGUzZyi12n4NTTrK2Zree5afos8HMhNKKPROukq6M2NdO690GMIDqcRdbomh
         lNSQ==
X-Gm-Message-State: AOJu0YwglMFGrouR/XBaSRxVDApPzmO6klKgjvyYXvLbNcdfOeC3QPar
	ZpRDRMEGN3sX1iZYJKy8OMJqxgO9dBTssnpCzTcN9Mbl8lbvK+teqalpne4R
X-Gm-Gg: ASbGncvgOiNkVaRor6yAvAl34wSrUlxcElxzZEGr8/QIvZW4tMNyAPztWiCHOSqRoTL
	vXKXr2OdrfR3Cmbd35Q6nCi/dz3KkxcZal3BOuD5zjqXufofgrCFEZT+ol7SBHt4au1TC82Mos2
	qFzb5ni+KoGRu+Zezr8cwG0lRj8T7rbbNZfXhlItQdWinP1pRRQZtekYjIJTz7v1AOcA7QdpEIp
	1LGsIRlwnsD7jo9VqS9JWElQNhLk0+s4sFyt3IwY61DkXSV+WCiIgvrbpHijuy5cV7wurFUSMRa
	Trcwd24GolrhagcQNo1aUGeMQO5ODAEPnMBB4V1fFqydzwMK/oDkXw==
X-Google-Smtp-Source: AGHT+IEWGVunRe1T+TMBgKQkGEPuCsjWQh9IifYPVQbjPao9tYBd3DmTHFoXcA2n5FJUeK60pB0IgA==
X-Received: by 2002:a5d:5c84:0:b0:3a0:b8ba:849f with SMTP id ffacd0b85a97d-3a0b990852emr670708f8f.4.1746647787692;
        Wed, 07 May 2025 12:56:27 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b170e7sm17468159f8f.86.2025.05.07.12.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 12:56:27 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v15] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
Date: Wed,  7 May 2025 21:56:20 +0200
Message-ID: <20250507195626.502240-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>

Implement the RTC driver for CV1800, which able to provide time alarm.

Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v15:
- the only patch in the series left
- dropped changes to MAINTAINERS file
v14:
- https://lore.kernel.org/lkml/gztsdu5p4tzt7emlwiuc3z74f4tfgkclcyrl324prqzp6dqhhf@ezrdmmhvf2nm/T/
- platform device name "cv1800-rtc" -> "cv1800b-rtc"
v13:
- Change in the Kconfig dependency caused by the move of the previous
  patch from MFD into SOC
v12:
- added MAINTAINERS entry
- depends on cv1800-rtcsys MFD driver
- use syscon for regmap
- get named clock from parent MFD
- corresponding platform device is expected to be instantiated by MFD stub
Changes since v10:
- only start RTC on set_time;
Changes since v9:
- further simplified bitmask macros;
- unconditional RTC start (rtc_enable_sec_counter()), otherwise
didn't start on SG2000;
- dropped ANA_CALIB modification (has been forgotten in v8 with
the drop of SW calibration to switch to HW calibration);
- successfully tested on SG2000;


 drivers/rtc/Kconfig      |  12 +++
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-cv1800.c | 218 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 232 insertions(+)
 create mode 100644 drivers/rtc/rtc-cv1800.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 0bbbf778ecfa..46593103db11 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1395,6 +1395,18 @@ config RTC_DRV_ASM9260
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-asm9260.
 
+config RTC_DRV_CV1800
+	tristate "Sophgo CV1800 RTC"
+	depends on SOPHGO_CV1800_RTCSYS || COMPILE_TEST
+	select MFD_SYSCON
+	select REGMAP
+	help
+	  If you say yes here you get support the RTC driver for Sophgo CV1800
+	  series SoC.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called rtc-cv1800.
+
 config RTC_DRV_DIGICOLOR
 	tristate "Conexant Digicolor RTC"
 	depends on ARCH_DIGICOLOR || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 489b4ab07068..621b30a33dda 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_RTC_DRV_CADENCE)	+= rtc-cadence.o
 obj-$(CONFIG_RTC_DRV_CMOS)	+= rtc-cmos.o
 obj-$(CONFIG_RTC_DRV_CPCAP)	+= rtc-cpcap.o
 obj-$(CONFIG_RTC_DRV_CROS_EC)	+= rtc-cros-ec.o
+obj-$(CONFIG_RTC_DRV_CV1800)	+= rtc-cv1800.o
 obj-$(CONFIG_RTC_DRV_DA9052)	+= rtc-da9052.o
 obj-$(CONFIG_RTC_DRV_DA9055)	+= rtc-da9055.o
 obj-$(CONFIG_RTC_DRV_DA9063)	+= rtc-da9063.o
diff --git a/drivers/rtc/rtc-cv1800.c b/drivers/rtc/rtc-cv1800.c
new file mode 100644
index 000000000000..18bc542bbdb8
--- /dev/null
+++ b/drivers/rtc/rtc-cv1800.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * rtc-cv1800.c: RTC driver for Sophgo cv1800 RTC
+ *
+ * Author: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/rtc.h>
+
+#define SEC_PULSE_GEN          0x1004
+#define ALARM_TIME             0x1008
+#define ALARM_ENABLE           0x100C
+#define SET_SEC_CNTR_VAL       0x1010
+#define SET_SEC_CNTR_TRIG      0x1014
+#define SEC_CNTR_VAL           0x1018
+
+/*
+ * When in VDDBKUP domain, this MACRO register
+ * does not power down
+ */
+#define MACRO_RO_T             0x14A8
+#define MACRO_RG_SET_T         0x1498
+
+#define ALARM_ENABLE_MASK      BIT(0)
+#define SEL_SEC_PULSE          BIT(31)
+
+struct cv1800_rtc_priv {
+	struct rtc_device *rtc_dev;
+	struct regmap *rtc_map;
+	struct clk *clk;
+	int irq;
+};
+
+static bool cv1800_rtc_enabled(struct device *dev)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+	u32 reg;
+
+	regmap_read(info->rtc_map, SEC_PULSE_GEN, &reg);
+
+	return (reg & SEL_SEC_PULSE) == 0;
+}
+
+static void cv1800_rtc_enable(struct device *dev)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+
+	/* Sec pulse generated internally */
+	regmap_update_bits(info->rtc_map, SEC_PULSE_GEN, SEL_SEC_PULSE, 0);
+}
+
+static int cv1800_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+
+	regmap_write(info->rtc_map, ALARM_ENABLE, enabled);
+
+	return 0;
+}
+
+static int cv1800_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+	unsigned long alarm_time;
+
+	alarm_time = rtc_tm_to_time64(&alrm->time);
+
+	cv1800_rtc_alarm_irq_enable(dev, 0);
+
+	regmap_write(info->rtc_map, ALARM_TIME, alarm_time);
+
+	cv1800_rtc_alarm_irq_enable(dev, alrm->enabled);
+
+	return 0;
+}
+
+static int cv1800_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+	u32 enabled;
+	u32 time;
+
+	if (!cv1800_rtc_enabled(dev)) {
+		alarm->enabled = 0;
+		return 0;
+	}
+
+	regmap_read(info->rtc_map, ALARM_ENABLE, &enabled);
+
+	alarm->enabled = enabled & ALARM_ENABLE_MASK;
+
+	regmap_read(info->rtc_map, ALARM_TIME, &time);
+
+	rtc_time64_to_tm(time, &alarm->time);
+
+	return 0;
+}
+
+static int cv1800_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+	u32 sec;
+
+	if (!cv1800_rtc_enabled(dev))
+		return -EINVAL;
+
+	regmap_read(info->rtc_map, SEC_CNTR_VAL, &sec);
+
+	rtc_time64_to_tm(sec, tm);
+
+	return 0;
+}
+
+static int cv1800_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+	unsigned long sec;
+
+	sec = rtc_tm_to_time64(tm);
+
+	regmap_write(info->rtc_map, SET_SEC_CNTR_VAL, sec);
+	regmap_write(info->rtc_map, SET_SEC_CNTR_TRIG, 1);
+
+	regmap_write(info->rtc_map, MACRO_RG_SET_T, sec);
+
+	cv1800_rtc_enable(dev);
+
+	return 0;
+}
+
+static irqreturn_t cv1800_rtc_irq_handler(int irq, void *dev_id)
+{
+	struct cv1800_rtc_priv *info = dev_id;
+
+	rtc_update_irq(info->rtc_dev, 1, RTC_IRQF | RTC_AF);
+
+	regmap_write(info->rtc_map, ALARM_ENABLE, 0);
+
+	return IRQ_HANDLED;
+}
+
+static const struct rtc_class_ops cv1800_rtc_ops = {
+	.read_time = cv1800_rtc_read_time,
+	.set_time = cv1800_rtc_set_time,
+	.read_alarm = cv1800_rtc_read_alarm,
+	.set_alarm = cv1800_rtc_set_alarm,
+	.alarm_irq_enable = cv1800_rtc_alarm_irq_enable,
+};
+
+static int cv1800_rtc_probe(struct platform_device *pdev)
+{
+	struct cv1800_rtc_priv *rtc;
+	int ret;
+
+	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	rtc->rtc_map = device_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(rtc->rtc_map))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->rtc_map),
+				     "cannot get parent regmap\n");
+
+	rtc->irq = platform_get_irq(pdev, 0);
+	if (rtc->irq < 0)
+		return rtc->irq;
+
+	rtc->clk = devm_clk_get_enabled(pdev->dev.parent, "rtc");
+	if (IS_ERR(rtc->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk),
+				     "rtc clk not found\n");
+
+	platform_set_drvdata(pdev, rtc);
+
+	device_init_wakeup(&pdev->dev, 1);
+
+	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc->rtc_dev))
+		return PTR_ERR(rtc->rtc_dev);
+
+	rtc->rtc_dev->ops = &cv1800_rtc_ops;
+	rtc->rtc_dev->range_max = U32_MAX;
+
+	ret = devm_request_irq(&pdev->dev, rtc->irq, cv1800_rtc_irq_handler,
+			       IRQF_TRIGGER_HIGH, "rtc alarm", rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "cannot register interrupt handler\n");
+
+	return devm_rtc_register_device(rtc->rtc_dev);
+}
+
+static const struct platform_device_id cv1800_rtc_id[] = {
+	{ .name = "cv1800b-rtc" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, cv1800_rtc_id);
+
+static struct platform_driver cv1800_rtc_driver = {
+	.driver = {
+		.name = "sophgo-cv1800-rtc",
+	},
+	.probe = cv1800_rtc_probe,
+	.id_table = cv1800_rtc_id,
+};
+
+module_platform_driver(cv1800_rtc_driver);
+MODULE_AUTHOR("Jingbao Qiu");
+MODULE_DESCRIPTION("Sophgo cv1800 RTC Driver");
+MODULE_LICENSE("GPL");
-- 
2.48.1

