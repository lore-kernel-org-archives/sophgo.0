Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B91A445AC4
	for <sophgo@lists.linux.dev>; Tue, 21 Jul 2026 23:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784676933; cv=none; b=f0K9qAaZXdGZsSsdjS8TXwH5LU3WhGwsQrqo1MLQJQOW97tKwHD2vDCww+1M/tsUjx5ySixgVfslESLoZubv9Znqa4Vs8YaCdSTqZLOdCUi6l/yBAXrVLmh2HX26bf0lj+eRHn5N3YOWGeCfjCUq6VllpYO0e+6dSkH4GzXfuuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784676933; c=relaxed/simple;
	bh=4pgycAz8dHsjrElWNtLLwG9xn8sGYdGkxoKcBO7/0Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lw88fF6euCvFRHGMtShDRwgtrZz0WlXicFoiIK7vIrT9Ercn9EEfRoO51U7OCSLkOUFlget2w8hSU2nRx20u1+Te8l4xWDRlxEgukX56w99oQEPSo5F83r4aqOKs3JVbuLDUoGsE3PhHKNWsHGohbs48neCc534sE+Z+yEmHEbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/4XQdIZ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/4XQdIZ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dd1cc8dc8so1250159a91.0
        for <sophgo@lists.linux.dev>; Tue, 21 Jul 2026 16:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784676930; x=1785281730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJgBeOO3ejSAAenm/fnjt2f8BccFZ7Q+isSN8vs0qFY=;
        b=s/4XQdIZL1F5X9Zc2EtLp0dUped8VpQIOa7IDpp46IpmSmScweygk4ByGDj1+Ll2qg
         d+hpOlzZeNDxeiBqVQbbykYFZdFUIO//W3yeTx8CxfCM0WNR0rD0nsReL9D8l27ANdmk
         thsS+TbBN1Zs5QYB9M6z0ZWENwhIaiXjeEgxmA8trAgSFNKvIERg6of7l27FI8Zoppln
         oMbXzRLnLKNu6HrEx8MioQ+LczQDvNeYPwH5Fil4vm8jfaC5Wv9B2hzZCjuXI06FBQu8
         vIXAVEY0+sgzxRQVJrfGs7kq1sVoxWttpS82qs6kBSpzI6HQ0T+AUHfeY05bO8qK8pak
         bunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676930; x=1785281730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SJgBeOO3ejSAAenm/fnjt2f8BccFZ7Q+isSN8vs0qFY=;
        b=IN5FNj2wHfgtfZLdvzLrYeIDMe6R885LAo9IXQKq18rHBVyWKLAGnXaKfr5QVKQB8r
         JevvoOLuzGErhJZk04d6qMY6g5LGhSeqt1lvnPPrK59YK8LMZjO/YgxHF/36ZYoR7mlG
         FztyBNDeH5+gWoJVx12vpVEBYVVRkBykEZZipThDYebnz3ip30r1CV7Fu8BWw709/35A
         yrjZqNBY9mrx7H/xc87IvYlgW1NYRRtZXiwcy+NuBN0g5/6F7ppethwDiznCnpyk6TmK
         nJAboM1M7JUShJ6a/S4SjO1kcSs1AYAVfzo/5QZjEwShPQ0De3+9O85AobXJYXtdYCGs
         T7Yw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2nxHSuOIikBr/G5xRCvEoMjh9/fNAdTUfstdVMqeHhYccKK4Jx/2Kl73xy1cJyf+ljKEXRxU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw19ekNx1SO5nkmM0xYjYFtCb7MdxSlaa9424j/jc1V2iPvQN03
	udVDdk+U/YmDFJDtMeMHBTbqk18jGxkflqnm8cHh3lrRlidPM7IK3E88
X-Gm-Gg: AR+sD121JydGTQJkod/TpyJgrNKQPJZBwxlyzyW+F+gyvY+72Bm3SOa2ktJirUHtjkf
	viltGHmuqB5ArPb4UjJWcZm7VB0PFYrP18itrLoXb455S41Vxx8cZ4NND5OimOnSRbXBPQW0weh
	aV0WePtVoZBa1p3idDIzVIxwWuJS3pr7L1dKPbuUdyqpJrUZrPpoCyusTe5yeHDeJPooIu8YA4b
	Pz8Niu+kS3wraOE7RFV/F6ct20vkBEnPsNuzuK/juehItJrnH1MCVs6Hxy/HED/YuuNQDZl/6lz
	R+rkHpjskPHqjkwCVGcKouN9DkCFc62EAtrFFITB2oeKDt2FAY2Q1w803I+mHB1isuRXYcjMzHJ
	Z+0e6OLLzsFDTDi+/HV0sB1wYXxPCjhLwLRKqNtbG9ZDZzoe0eraW6mU89DRiarh+U3lgPyhJMM
	J9WJ3IewegfSmnFWxVD+d7eEVNJHfTXDhfcA2Lb61555bkcryrwZnj35IkNedPpApVuG1ghMUqS
	27+zdgIyjpH8svFc10f4zbu3GP3Uos/lL0JSFv5
X-Received: by 2002:a05:6a21:e0a6:b0:3bf:b84a:f3d8 with SMTP id adf61e73a8af0-3c42bd60404mr928427637.0.1784676930438;
        Tue, 21 Jul 2026 16:35:30 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ebfcesm245353a12.11.2026.07.21.16.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:35:28 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: chen.wang@linux.dev,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 3/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Wed, 22 Jul 2026 07:34:44 +0800
Message-ID: <20260721233452.112204-4-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721233452.112204-1-chenyou910331@gmail.com>
References: <20260721233452.112204-1-chenyou910331@gmail.com>
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

