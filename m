Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D6E275AE9
	for <sophgo@lists.linux.dev>; Sat,  5 Jul 2025 07:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751701236; cv=none; b=rChdhk4Aiutsvm3AcgEOqJlQ10O76FqSwMqG6c1BI3dml0/2L/xeIPOIfceqQ91pk32XVLqq3UdSaz4CtRkndMZGBn3nxG5gNsUcfDLccte1uJ8FfqblvkF/qJzGyrrL+Zzv5z67sR4vBnCH2I/bdnE32JXp0pjK4tKX4A6/dlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751701236; c=relaxed/simple;
	bh=Hzq7nspsK0aD2610NfrWHBwq6B0G1B+f2OJCZ3QBNwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dHQvjRnAGhHbf6kLztqPse62Zt6MG4u2qbGCxgheWdsAEUdC2aV1EKmquC1z8zv7IMMxCblzysX47LHRY9nIeH8UXNq1+28D6qR3Ss9dO7S4CBNCHPiBwGrfUtW0C/Fy/DOMjRQEZ5TQGIVxq8Ga8Aguk6+4o1r6WG0O/VbqqtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyFWdeKE; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyFWdeKE"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-747e41d5469so1795698b3a.3
        for <sophgo@lists.linux.dev>; Sat, 05 Jul 2025 00:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751701234; x=1752306034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5pKCohS34WfPUKUpxcwZlTKqTz2/JTPjMDgBU0dsFE=;
        b=jyFWdeKEQ6pf/k2qXgTbc5OlE4xt5I5QueUGVVt96+DqWAnaf5JaqOZW9MN9OewIpc
         oFNgHbDvAS9akU7xX7Lkywhr7EhQxoff++2OUVjPDwHPKUZPZp8G5E6wcKa/DLWHE2Jw
         XAn04ey5BffwhDLyQCP2v9jRVwn0/DT8AeGaH4INE+/45gAcuqiXfPn24HU6pOkheQq0
         qpjSRA2HB9EebAu7TKSvlkJJvNAe7Gj51acPqVjqGeGRfHxhGnP9x6v6KVoJhUn87iGB
         n1jjoFp4sX8g2pMq+LsmnkdKmiBq6Qk2JnCyVh0zLZR5/ZZPguSeeSCYBKFgW9pt172t
         G8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751701234; x=1752306034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5pKCohS34WfPUKUpxcwZlTKqTz2/JTPjMDgBU0dsFE=;
        b=gBaEXdE0HjeHY358qcSuEUOt6rxjXqirIE/iuKSbA9PYmiGmp6VrnUenha7kzA6zPG
         RjJamnSt3ctOsazQJjG8VzyhcKQcvUbyByjVAGF72bcJhM8zNanFfA9hINm05iAsADNw
         qRcg02Inxv28lwaiLYalBx4e2tyFyNu5UFnN7Z7G/+2HTzEO4YAM+ctVFYBTYVOTgzrv
         7OKNKVe7TNyV8Hp676NTYQK2dohs/OTWAhrWALn0YKFaZTUy9UmpdrQtwxL6+fejVgnr
         vo2SkPws8S348V4urfBVCPPVUHZOs2MP2MW6GZyerNcYbE/JsLvpXSc23Wr64aEJMdQ8
         3imA==
X-Forwarded-Encrypted: i=1; AJvYcCUFxYFCNWZRRhqydYjXanp6hXvJMoPtQJHKCuxRiOinCn143tPSaV+RcI+6Lesranbco3kxOQM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxO5yl8W6OZ0my+lkUTEXz6lgwfJUWcGO3JWI5/O2BU3JailAde
	AZqI4o7bmk/BhE7TUoYfn2pIxBwS4EBNh528iEEslX/CBjZzgkucyiL4
X-Gm-Gg: ASbGncvovUBU3E69Rw3nyxWKO+fr8brUqXBNGekygK8/DgZ+cJw28hoHrekp1BNfdPv
	aixU3BnCFM+FbdG4NUL1a2R+7+E34YWjO1bEVhUa2WAZ73aM9gZ1APRx5zSzxcXUypUeco+j781
	WMXR/TkaeeTQL6r+/giAvs4gOThJtko3sxFDhOnAYWq3twp/rceV4YkE7McK6igDiY3uZa24PJY
	/re/5pSJBUbCul/uUYG2lGlD/+XY7Cd/j+tmyrMW0H2GYlDKaLOK0CKOUO8R0N+ovcLm88WEkEl
	LiGR5lym011kvGj4kaoLzYdE90zQRhoTDc75YCipDvWQunRkHlQ2XoEEzt3TmEVtBt+rqbem
X-Google-Smtp-Source: AGHT+IG9dNZaCVFQzrF7QkF/dQRjzMwk0JAyu5rEKfoJplsviezLQN6u7ejFaJg52GjdxcVnYOftLA==
X-Received: by 2002:a05:6a00:4613:b0:736:5b85:a911 with SMTP id d2e1a72fcca58-74ce884e035mr9064827b3a.8.1751701233432;
        Sat, 05 Jul 2025 00:40:33 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e852sm3993616b3a.85.2025.07.05.00.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:40:32 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0 board device tree
Date: Sat,  5 Jul 2025 15:39:56 +0800
Message-ID: <c1b6ccdc69af0c1457fc1486a6bc8a1e83671537.1751700954.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1751700954.git.rabenda.cn@gmail.com>
References: <cover.1751700954.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo SG2042_EVB_V2.0 [1] is a prototype development board based on SG2042

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile          |   1 +
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 233 +++++++++++++++++++
 2 files changed, 234 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6c9b29681cad..6f65526d4193 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
new file mode 100644
index 000000000000..46980e41b886
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
@@ -0,0 +1,233 @@
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
+	model = "Sophgo SG2042 EVB V2.0";
+	compatible = "sophgo,sg2042-evb-v2", "sophgo,sg2042";
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
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
-- 
2.47.2

