Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608DD23ED6A
	for <sophgo@lists.linux.dev>; Fri,  9 May 2025 18:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746814450; cv=none; b=fGLDTrlZLSPuFrZvDyUPgarVQ2UdsGRCxVtZUKdHHazSthgqmBNV3PqhbCAPQbuyzwnPrt2tqolVyhrkzSeQ6Ye+/qzlf020YJfdaimG7hZPNnBSF8Dw/kE9gIBovE2QAtjbFaiCgSlWAmFtYZK7layFwtdtS8iZe/nSiUSLHyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746814450; c=relaxed/simple;
	bh=zDDnWoeVRf/xpKxCrQHhyCfKQgFugAS5W/zOy7V527U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUrpjeh+IjXcgv5Qimeb2N4PdViGA8T+c4BX1Ltl4eKiRw+5ZFEo9sDGl/+0QjFzsZWwIoevv+bwu1VTv9irjsmlLVIRe2+/aOevMYmWB7PaGJOXLyhMoeqX8tLyB78ybcr4rvTpzlE5qewygffLRK41FxxiMnEMLIZtqYN/BLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJg/q8Rg; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJg/q8Rg"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30abb2d5663so2440010a91.2
        for <sophgo@lists.linux.dev>; Fri, 09 May 2025 11:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746814448; x=1747419248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sihitOI2VqTkUCTo505VuHegdwxIY4rc9L16IHG7UoU=;
        b=MJg/q8RgH6MmaimJvRgx8Ng0OnuSVmQ1AvU7GeJrg0AmFIK0QOm/ARLvoY6yjjq7k3
         ILweV+uXOJPQqEk0BspI8SJsTEVL2HB0EqhmUa7I74yHxuRwQxWUlA5W3WT52UXY1hIw
         cHcO+x5qCpTUP5jTECPGMLYucqoT5fGVISbHoCx0P0I9ad3FD5uJoOYDXij/XhpTBAtg
         3ZUbXJ7CIZHxE2b99QNsS7uuRQBbvXEfWpipcR21vC5X+GuYVmiotlkzQa6f7DDrKRQx
         zCMvhAUqpdgl3qXOz8di+TGVHpcb5hnBHjzcmX/YKJlWegF4X7aUx9OtbeEiKIopygI7
         vx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746814448; x=1747419248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sihitOI2VqTkUCTo505VuHegdwxIY4rc9L16IHG7UoU=;
        b=lQXwKXjLr7HLxBGe/3iax26g9Lkejw+w18R59vyGhdYIxJJ0Wufn1WgbMnI3qgoFSS
         6RokvUqDrfhWv3xAXT90pQ/6a1ejYnr9Aa3hQxdsmBQ4l8OEULLOvfQZLqL5tTcKRWdX
         MQ0aoJe/mbaLQ88XKHj8z+cK5z6PF2WUjDUynJ6wsc/BjyQQ2IBPV23qGh1ETZg34CwU
         X4JFRTZTV/y6A/oe7pOGJWHCMPcDfsMoZkbZw4vb0OhpqHY7zUCelN6DMVIfo/JhCUW5
         mHlyjWsDykKYr4k/Sbj7veq4ESUu9qF9OO5tShuIPllZUZLRqXV94Qsc9t7N9FXuM+0p
         ujnA==
X-Forwarded-Encrypted: i=1; AJvYcCUXws1165nb1Waz8ikDF405aRdiePOeI11TUn/GDtXeo8GSy8S0PJfDn+H28+3+2qWOjjgtgGA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzFPfmxIdOpq9uQZ+u0fBCsnNFuEFA2dAlvuDVTIYW8rbC1wcm
	mClJOPrBZ1DE9eQeoGFFcRYtPXqpSs2zHqhvK1ktLzLrFu6YM6Hk
X-Gm-Gg: ASbGncuP2Fpmyh86OT3ThWORLsSnPKWoFrRw2/zNZrc6WpRqWvXbPxdn0+DNKal8hDb
	GabVVA0BsjyX8bqdRKhy3n5JsEk6PxFXJf7rj6OhipefFpCjZAZbkS0v0GwcW8dpOXO3ZB/FUN4
	RexCDlyAiTetA1gNghCyF1RcsIqGz4JaaPQ5bFrG0O4gkxnqtL7tzGcH+EiLv0SfyOkLGfTTziu
	bGw9TicEogF8YbV91Cf+18ktsS3DM0RMhbFTDKCPRaLIT2wRK99mBjqs7S4myivg+X+vP9Ozw2g
	d29CH9OzYhmx6p13nQ1hrFwjBxsP0jpJ1ZqYAF5tPhbjByO4OFs=
X-Google-Smtp-Source: AGHT+IEG4j7wKbPsUfKIgf/34I3dl6xnmZJzBzACRfx//R8GM6fu4AfBcZ+78vA/c1bBjrYM5m3Bfw==
X-Received: by 2002:a17:90b:3b4a:b0:30a:a034:bb0c with SMTP id 98e67ed59e1d1-30c3d62ec5dmr6818233a91.28.1746814447178;
        Fri, 09 May 2025 11:14:07 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e61083sm2127309a91.30.2025.05.09.11.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:14:06 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] riscv: dts: sophgo: add Sophgo x8 EVB board device tree
Date: Sat, 10 May 2025 02:13:28 +0800
Message-ID: <d3f5b2304d2156d7b39261ce507dfe21f18a2cba.1746811744.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746811744.git.rabenda.cn@gmail.com>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo x8 EVB [1] is a prototype development board based on SG2042

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2042-sophgo-x8evb.dts   | 247 ++++++++++++++++++
 2 files changed, 248 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-sophgo-x8evb.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 47d4243a8f35..ee6495065521 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -3,3 +3,4 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-sophgo-x8evb.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-sophgo-x8evb.dts b/arch/riscv/boot/dts/sophgo/sg2042-sophgo-x8evb.dts
new file mode 100644
index 000000000000..a520b83948b7
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042-sophgo-x8evb.dts
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2025 Sophgo Technology Inc. All rights reserved.
+ */
+
+#include "sg2042.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Sophgo SG2042 X8 EVB";
+	compatible = "sophgo,sg2042-x8evb", "sophgo,sg2042";
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	gpio-power {
+		compatible = "gpio-keys";
+
+		key-power {
+			label = "Power Key";
+			linux,code = <KEY_POWER>;
+			gpios = <&port0a 22 GPIO_ACTIVE_HIGH>;
+			linux,input-type = <EV_KEY>;
+			debounce-interval = <100>;
+		};
+	};
+};
+
+&cgi_main {
+	clock-frequency = <25000000>;
+};
+
+&cgi_dpll0 {
+	clock-frequency = <25000000>;
+};
+
+&cgi_dpll1 {
+	clock-frequency = <25000000>;
+};
+
+&emmc {
+	pinctrl-0 = <&emmc_cfg>;
+	pinctrl-names = "default";
+	bus-width = <4>;
+	no-sdio;
+	no-sd;
+	non-removable;
+	wp-inverted;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mcu: syscon@17 {
+		compatible = "sophgo,sg2042-hwmon-mcu";
+		reg = <0x17>;
+		#thermal-sensor-cells = <1>;
+	};
+};
+
+&gmac0 {
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	mdio {
+		phy0: phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&port0a 27 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <100000>;
+			reset-deassert-us = <100000>;
+		};
+	};
+};
+
+&pinctrl {
+	emmc_cfg: sdhci-emmc-cfg {
+		sdhci-emmc-wp-pins {
+			pinmux = <PINMUX(PIN_EMMC_WP, 0)>;
+			bias-disable;
+			drive-strength-microamp = <26800>;
+			input-schmitt-disable;
+		};
+
+		sdhci-emmc-cd-pins {
+			pinmux = <PINMUX(PIN_EMMC_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+
+		sdhci-emmc-rst-pwr-pins {
+			pinmux = <PINMUX(PIN_EMMC_RST, 0)>,
+				 <PINMUX(PIN_EMMC_PWR_EN, 0)>;
+			bias-disable;
+			drive-strength-microamp = <26800>;
+			input-schmitt-disable;
+		};
+	};
+
+	i2c1_cfg: i2c1-cfg {
+		i2c1-pins {
+			pinmux = <PINMUX(PIN_IIC1_SDA, 0)>,
+				 <PINMUX(PIN_IIC1_SCL, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+	};
+
+	sd_cfg: sdhci-sd-cfg {
+		sdhci-sd-cd-wp-pins {
+			pinmux = <PINMUX(PIN_SDIO_CD, 0)>,
+				 <PINMUX(PIN_SDIO_WP, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+
+		sdhci-sd-rst-pwr-pins {
+			pinmux = <PINMUX(PIN_SDIO_RST, 0)>,
+				 <PINMUX(PIN_SDIO_PWR_EN, 0)>;
+			bias-disable;
+			drive-strength-microamp = <26800>;
+			input-schmitt-disable;
+		};
+	};
+
+	uart0_cfg: uart0-cfg {
+		uart0-rx-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+	};
+};
+
+&sd {
+	pinctrl-0 = <&sd_cfg>;
+	pinctrl-names = "default";
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+	wp-inverted;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/ {
+	pwmfan: pwm-fan {
+		compatible = "pwm-fan";
+		cooling-levels = <103 128 179 230 255>;
+		pwms = <&pwm 0 40000 0>;
+		#cooling-cells = <2>;
+	};
+
+	thermal-zones {
+		soc-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			thermal-sensors = <&mcu 0>;
+
+			trips {
+				soc_active1: soc-active1 {
+					temperature = <30000>;
+					hysteresis = <8000>;
+					type = "active";
+				};
+
+				soc_active2: soc-active2 {
+					temperature = <58000>;
+					hysteresis = <12000>;
+					type = "active";
+				};
+
+				soc_active3: soc-active3 {
+					temperature = <70000>;
+					hysteresis = <10000>;
+					type = "active";
+				};
+
+				soc_hot: soc-hot {
+					temperature = <80000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&soc_active1>;
+					cooling-device = <&pwmfan 0 1>;
+				};
+
+				map1 {
+					trip = <&soc_active2>;
+					cooling-device = <&pwmfan 1 2>;
+				};
+
+				map2 {
+					trip = <&soc_active3>;
+					cooling-device = <&pwmfan 2 3>;
+				};
+
+				map3 {
+					trip = <&soc_hot>;
+					cooling-device = <&pwmfan 3 4>;
+				};
+			};
+		};
+
+		board-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			thermal-sensors = <&mcu 1>;
+
+			trips {
+				board_active: board-active {
+					temperature = <75000>;
+					hysteresis = <8000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map4 {
+					trip = <&board_active>;
+					cooling-device = <&pwmfan 3 4>;
+				};
+			};
+		};
+	};
+};
-- 
2.47.2

