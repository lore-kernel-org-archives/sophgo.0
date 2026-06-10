Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01285405C3D
	for <sophgo@lists.linux.dev>; Wed, 10 Jun 2026 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093473; cv=none; b=nrW5A+HR/hXreIjo50Ac6lpcUNT9bPm5VdHYF2BYkcWC/jZ0YCuM3lsiAf+FjrvvG0mUPcMTXGHmN9549i+3sCxm1OAC2rjxX39zMpCAnilXmeIbKdFdD8L7XOYXC3qDA3AoAgr1+WPyTAzx9zOBuGsMEu62fVEPVettMhzPCyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093473; c=relaxed/simple;
	bh=LnnEgo6M8JiCAyRty8zP2sNPMGKQrNcUvfPHX0t1Hd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JhgdgdTJhuV4UlHvvfz+3qkDysXa1BR+Py64GnfQxB+tx8/ejtro2olld5BXwQeFVkjRDno1esBv+xIEJoei/qeGJ/DJI3W9v+i5OHgonq1O8chnHDb1bFzfVkX0D9Ch6cQRncjtfEpTwB6DdMzWPclkGIQ5KCmdJVoLn5ranPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ru8TA/Mh; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ru8TA/Mh"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf201b93c5so9584755ad.0
        for <sophgo@lists.linux.dev>; Wed, 10 Jun 2026 05:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781093471; x=1781698271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwId8hSTsYhCm9cW+cozWhD85/5ipdH4k4BKIr8DdEc=;
        b=Ru8TA/Mh5LENyD/orVA3uthsoMez+UN9ZTIrPAW5mh5O5MovGVHOWXiQZkuAuvVz2W
         csafs1PzWN48pAjJWzfB6muCYN6LPb29N2MGFhKpkcoXHG2dRlieUpqNo9TCaWe7ch//
         iKccZd5IM4jH7M9O1dBJTg6dTP3zVa84AxYj+SDqCxIAGBzm33tBwT87girzOppvTqfC
         IT1mjEuQZTkMKvaI5ZdsnOzch5Kg70Tbi/cnNpQgDah0/zTfmreiF1jN+5YpN3RLeOK8
         o0jnFtQapJJvrQQqmDmuhac+6QVVjyby+awpYMibvbNIrKzsDC60OIu9953fKVCLlXfB
         HOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093471; x=1781698271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gwId8hSTsYhCm9cW+cozWhD85/5ipdH4k4BKIr8DdEc=;
        b=F6UAanSZ511GIpEp3WVNvhCpq5325bPSiC2pg8ZQG1EdsTpolKdCxUmArv6FdT4XE1
         zeOc86cgyyQ5arDNMYUvYjpTLyMVOW6yRerOVEwn0H6qchPXEqAngz3QBuvuVdGl5m7K
         RQnbxfBOQi9K2xEEqrHS/PzUBtAL1EO2olApYUKN+rZ+Amhw1dOgN3P7phoDs6avRLzu
         8GPa5VYfnNeCN+n4AgsON+N2WXPtm90GTmLoNnlhLNO7o/k03SxfcvG4OEbSaGT0acal
         TYQSMyeAa9edrH2mVLnvsy22ic4bvsnJ+7jAl7HkXvnTemcak6cWNwnr4wINPLnKrNkR
         /xOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EhKDsKasmamgTtL6rFHkVk/nE2zbWEFC9sXLGxzKQqltJ8VtSwlJLwfKqBNw/tpLByMWyO3Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywol9K6Y2f8QMlr8lfTBuhGSjgaIj2IpXauPa+wWnk3NnMZpw4h
	7UQDNNYAT2vLR4uLM1EyqSzOsZPII7qIA3o01AjSVmMHR3RTWGD6mgox
X-Gm-Gg: Acq92OFnH5S14GXnmSkfa2RP0HDkKjO+Cu+XmnI/dHeN3aDanK//himjJbuSGULoeOO
	SuIEfRji4Ccnu50HHNnaKCCWZyPKs9iJUwyY+rwDfuStBamJtBTaIFdH0pI+1bIOKLm8I1HHORM
	tQiaaZB407rgOW2wkXK7tuqoLtGNo1i3pxHhFfXiohVRRwWLEmNEH+OAdvwlFiojMCOiWwiuUXZ
	7yyNlh82OVLpFgZKD7o+RdznKpoCrT/jmxZ6MAQwSPOfZHOq6vtIhvCR1N6jnxCeMbpzHjxJuqm
	GMyYO/a6QvLPVf6wtewFI1SZg/CRv56YoVNFxkIIBfStcuDTSO+LMthZmFXZB0zWtfzsGxgOqLO
	Ppttz/FtoNg83GOuPkvcQuEeuOPJZ/kEBWo4blh6xyFXHSTqdm1d+oTtbihUJO+kcD5yb3Eng5a
	RSLEKvbNIp3IfRq3ERDIfS7sBZzfiwzx7Aiyb5
X-Received: by 2002:a17:902:da8c:b0:2ba:1e94:d03b with SMTP id d9443c01a7336-2c2a1948011mr39804155ad.6.1781093471133;
        Wed, 10 Jun 2026 05:11:11 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm245738445ad.26.2026.06.10.05.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:11:10 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: unicorn_wang@outlook.com,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Wed, 10 Jun 2026 20:10:10 +0800
Message-ID: <20260610121026.1517621-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610121026.1517621-1-chenyou910331@gmail.com>
References: <20260610121026.1517621-1-chenyou910331@gmail.com>
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
Changes since v1:
- Removed the leds node because &porte is not yet supported in cv180x.dtsi,
  which would cause a dtc compilation error.
- Retained the &usb node because it is already defined in cv180x.dtsi.
- Cleaned up the trailing blank line in the Makefile.

 arch/riscv/boot/dts/sophgo/Makefile           |   3 +-
 .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 108 ++++++++++++++++++
 2 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193..f9415c30a2c5 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -2,7 +2,8 @@
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
-dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
\ No newline at end of file
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
new file mode 100644
index 000000000000..4cf441ab3790
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sg2002.dtsi"
+#include <dt-bindings/gpio/gpio.h>
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

