Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC10A23E23C
	for <sophgo@lists.linux.dev>; Fri,  9 May 2025 18:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746814458; cv=none; b=fsLDusj4pCBcDSZ/IoCgwUfly+TlXgylpSGpGZ9Te55D6DMP/7qx6l+JoT3D8QAg/n6Z4quHFXhYUCo6gRHdNygCiHApHAyhvZBvf6Rq4jnNytjx2QMrc1AYMx7oOQcU46WHg7jifzH6KWQOLu0DNvk734cmfgteBKoOgiF92Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746814458; c=relaxed/simple;
	bh=MCFeHr+BcgK2STC+qWEfnaYLJOjjf86IY+wc8JFdLyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qjRivjDCtHLxtvjGFpzgs67ysNaXOz9rwa57GuL+2WKV5U3msn5Nwb5kn5g4wTmD0xkH+aP2fpp7I/jHoH8co20ypkMOU4SZiwcahIrVfqQRu7DrVaecdhlGIpCL2GcyXPjXZbUQ2WrITJ5q4LyOCyRbQAK8uqRHiSp0GUrh3OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ob9VjzH0; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ob9VjzH0"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2093aef78dso2094858a12.0
        for <sophgo@lists.linux.dev>; Fri, 09 May 2025 11:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746814456; x=1747419256; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psAvYOGXh6qfdM0gGsrmFRR1sHt1RBa6/E1HfecWQUQ=;
        b=Ob9VjzH0j3cMJS1HWMVGjT2UuC5kJ5+4dvH0yvJE64ay+LADk5KT385bW288QvGTDV
         ur5GYgjxvz8OGau6WNQ48Hkrq+m3iPLyTQhduSL7/sbz+yGvomS6W32CtcsKuCcabitA
         035qgw7LWG+kawZFQk+WkgfNI+uHuE3SdATGS/lXN5j8hMu1WxHu4ERUw14kBXYFnqyQ
         S7IY1p/QVKSnrB63HXxW4JhBQqF5A6o8Xvp3f5T68ipQjvqLXS7RWHvVDp/Z22IrbXCn
         sNRB20AIZKwvf8pEDACeZi5sF3yOxzG2UugEsv4QeY9BODPBr38PmlaI0EU32tNoCEuf
         Sfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746814456; x=1747419256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psAvYOGXh6qfdM0gGsrmFRR1sHt1RBa6/E1HfecWQUQ=;
        b=u9IpjtP66flXYYjtCbad4HLvD/qXnIxmDBGgSQ5VCAsAL6Wdb4oRwI5/jklu9x6ZMf
         HlsIxHENUr+bmMLnicAFxNLnZZ2VREMko5y6nwT5/yKtzl+3JE56yyzxHipL9GgIjsZE
         /vMKvc9P7u/n7dquOym4bcWE1hZGQq/te0v8b19udYPrZB1nvtoMcfmstPGVJpfdUdC6
         FHr3Jjqcx3co3EFTzXDQP2ACAUxrf3Mior1BaoRkab6M/6KjJpwPYkGZwZ/vOx/4weGA
         /WTHNWKD36CUqy3uuhwGTIkbs8b2LDQ1NDQtfwQaW4v0Yn46VL8zfiyyI9GDpHnm8+ri
         iXng==
X-Forwarded-Encrypted: i=1; AJvYcCW6iUyaeC61sseYhxXXb+1AamRjy3dZ0C6z+T1EuP8dRT4a79KDeGSGMirKmNKvX9+q6jUbQgc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc5iPPrhcueQ25UIk0X43YLOGX3pkk4qXfSo0E5inAr9L/IHnE
	D/AaOCj+udGW25Fil08a6jUBxZDuk+PlO7c+vSg+SYLjwzSPhLEp
X-Gm-Gg: ASbGncuE9zcjUnu+XD/U0Co0Y6E2Xx5eD3e7MqqJZSylGaTA1Gy15v8dCnQJGW4BVgD
	VO0VyUYGEVA3jmKcb1MB1iS5iBcGhsE/+vgNQ6LL71cr2o7BIrlb7MFRREM1motMnNT2cngeOMN
	ThM235vI7H0AggJW05eHxnaOKL+NSWQzTLYnoGvDQTTxeWQS3KqwS3OtG1W90KXrw8oyvpTks/t
	ExkJFQxwqayLv1OvFZ+Ua1jzzHxa9wy9D9jFxpb9w9n2hB45kFT/r07IqsnJqNTScFZNeuqwycR
	29lyuZ9ow/VLQrzuMK4kkdU0Y5VvnckUkhAlC5tHlj81eN+Q37A=
X-Google-Smtp-Source: AGHT+IEmvpSWc/iMW6qMXvu2u6JswvB2BzKJQqY7rwJhZRadXgo56zWgSuJT8/CI5hnAI5/90BDGng==
X-Received: by 2002:a17:902:e745:b0:22e:7e9d:9529 with SMTP id d9443c01a7336-22fc8b59806mr59755985ad.20.1746814455731;
        Fri, 09 May 2025 11:14:15 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e61083sm2127309a91.30.2025.05.09.11.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:14:15 -0700 (PDT)
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
Subject: [PATCH 4/4] riscv: dts: sophgo: add Sophgo x4 EVB board device tree
Date: Sat, 10 May 2025 02:13:30 +0800
Message-ID: <b6ef6550da398d0440851854c6eec1e53f2d4a96.1746811744.git.rabenda.cn@gmail.com>
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

Sophgo x4 EVB [1] is a prototype development board based on SG2042

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2042-sophgo-x4evb.dts   | 235 ++++++++++++++++++
 2 files changed, 236 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-sophgo-x4evb.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index ee6495065521..4d39e644c2d1 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-sophgo-x8evb.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-sophgo-x4evb.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-sophgo-x4evb.dts b/arch/riscv/boot/dts/sophgo/sg2042-sophgo-x4evb.dts
new file mode 100644
index 000000000000..7165d49c3887
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042-sophgo-x4evb.dts
@@ -0,0 +1,235 @@
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
+	model = "Sophgo SG2042 X4 EVB";
+	compatible = "sophgo,sg2042-x4evb", "sophgo,sg2042";
+
+	chosen {
+		stdout-path = "serial0";
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

