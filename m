Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19773E170E
	for <sophgo@lists.linux.dev>; Fri, 10 Jul 2026 07:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670391; cv=none; b=h9FjMPMzznkzg88ONywyJVF3J2/BKy1z5VeHt6bX2kFEJ7/h/OHVlQfIbdEazdRF+BQNHWfTANAOH3d2RtVg7Dj5adNQb7EiGBNmKCY0v5d9zUupq99s/4gEPmewhpWdl6sEAmaw3C8er76RE33eqhhpypRGOFM0iLSJNon5Z50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670391; c=relaxed/simple;
	bh=4pgycAz8dHsjrElWNtLLwG9xn8sGYdGkxoKcBO7/0Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYp/O1BmiRvRln5rCWw2TbC4I6bwZPM7lAmJC8i/QvZL8lPkYrE0WQAeQa0B0nOyjNDLclHmrwOsARcKhp0wTeggGumhKAm/tkQSEho3V9ujszT4OeXTr9Pg8Os7cbKs6JOEBsWhWzCGpvr8E5dz/DKd2NguiSliJyLTWva5YD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRCdWoM8; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRCdWoM8"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3800f0907d5so143564a91.0
        for <sophgo@lists.linux.dev>; Fri, 10 Jul 2026 00:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783670389; x=1784275189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJgBeOO3ejSAAenm/fnjt2f8BccFZ7Q+isSN8vs0qFY=;
        b=kRCdWoM8hSM8M1ad2k2L0FYjYl1QyUtgLF0FaT/agpehry7u9WTSne2rRvnOUd+Wdp
         NyRPV2pzlcSUBuzD5FxcwlR7UI6RsRv4+nYlsvEAwP7XqPWyyDinyz/neEGsFjglcsd+
         NgzF9MhHIR8W+2+VskUC+yBjDEq31vzjetNsUYN5MFjZkbFUdJPI8w1kJGy0s+ZBsqMv
         tbh4YEtK8w2Etejv0gujuawl5fMYiywio+YdYieUhXuxKdORQsYzTUYwvJ+gJrKrTQV7
         lfwx5ykssqwp0DIeMLVRUayNCissT0hEsto3EX6gqPW0dM+yFa9RT6FmRMmFUOafj8fF
         0HVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670389; x=1784275189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SJgBeOO3ejSAAenm/fnjt2f8BccFZ7Q+isSN8vs0qFY=;
        b=B6vMCJUUvYtZ37NXKA1JI5ucAZ2M9BAYwvNpUiIib/vi8NK9Jzq8g2+H4d87RdvYUN
         oCau9RnIHyXbxTiRlwRMRrrGJH2tngmKM83V8g7XQGfawMru1/ArAbMOO7eG7StS6IXR
         BYIldzn/ptS4ac0Rr+/2QIc5At2dPA5SSS3PgNJZAEsHK9snH4jZtr1piasJVAC3+IR1
         gky0b3usY1y9YJsFIdcDQmhM8IB3bv51hsVhl8lcLJdLvx68QKEjB9HjSRjxwOO8lhUx
         mppDqhARPZ2Mt0KfFnNdgMUi7qthLQ1t0Qja8RrGHRvG0aTpbAHB5rRdN03hbbdYrg0f
         X0yw==
X-Forwarded-Encrypted: i=1; AHgh+RpN7Zixs9CiYkbzQ6flRnELWSWV3E2816OiTktCkaYDgKlIydboYrODto0ZYvD7Rk2iKqMT7/E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQU/7iMDJJl/HIO+mQKuMUnLlgTh9HsSaSWN65ZsQ6vPe8ezPz
	y2mFvR7EjP6iIDJz7R6jiT+GYtxv5b7VXvHfMKN9GBcw/5RLiUOUDVN0
X-Gm-Gg: AfdE7clpgXpijzIY3mphMyugQLwxyDRTDa8UigJ0gcppYmkWfV6Fn+e2cWkuYeh6Tr/
	lfHw/vXUxEM7P1nCyDNQ9eDMIJBJqlpbnUXDpjwwh5J9vlFLkg3mwsgzakROLeqxWJ4eh4SUH65
	SXXzr10AoK5OZmiOAMzOOLV93VErcDbgo2D7jozFtg5A41HebLScfJBomaIbcSlvo+u40t1Qh5V
	1+NxkGUftAGTA91x9j670kIBTMItFBpXjyXGplflOD3ad/zMu2VMvya+zn5hvOeK4bKQQpBlLGP
	mUnsKdgJ0GHLte0HNoQdqlrWyrIy129hLO1bfejQp9dm5AXLRnuqeC+ACDYb8fIwwwEfyWxUkrG
	F2HhHLnYyORf9okgw7pt18aKAZtcWWhtY5+iD1opx4MaYHUw2Z+1cKojvtB02bOiVZw2LA5eXG4
	g0vycgXfP4levIl6s=
X-Received: by 2002:a17:90a:d606:b0:36a:5438:cff4 with SMTP id 98e67ed59e1d1-389421acc3cmr8740580a91.6.1783670388957;
        Fri, 10 Jul 2026 00:59:48 -0700 (PDT)
Received: from chenyou.. ([140.116.78.205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm19044999eec.26.2026.07.10.00.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:59:48 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 3/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Fri, 10 Jul 2026 15:59:17 +0800
Message-ID: <20260710075917.159969-4-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710075917.159969-1-chenyou910331@gmail.com>
References: <20260710075917.159969-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Milk-V Duo 256M is a small form factor development board based on
the Sophgo SG2002 SoC.

This patch adds basic device tree support for the board, including:
- UART console
- SD/MMC controller
- USB host
- Onboard blue status LED (connected to PWR_GPIO[2] / porte 2)

Tested on actual Milk-V Duo 256M hardware, verified boot to shell and
heartbeat LED functionality.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 121 ++++++++++++++++++
 2 files changed, 122 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193..1ff69cf7f178 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -2,6 +2,7 @@
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
new file mode 100644
index 000000000000..21ef6ed9f0d2
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2026 Chen-Yu Yeh <chenyou910331@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "sg2002.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Milk-V Duo 256M";
+	compatible = "milkv,duo256m", "sophgo,sg2002";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			gpios = <&porte 2 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		coprocessor_rtos: region@83f40000 {
+			reg = <0x83f40000 0xc0000>;
+			no-map;
+		};
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&pinctrl {
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-clk-pins {
+			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <16100>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cmd-pins {
+			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-data-pins {
+			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
+				 <PINMUX(PIN_SD0_D1, 0)>,
+				 <PINMUX(PIN_SD0_D2, 0)>,
+				 <PINMUX(PIN_SD0_D3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
+
+&sdhci0 {
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+	bus-width = <4>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
-- 
2.43.0

