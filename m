Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAA0404BDE
	for <sophgo@lists.linux.dev>; Wed, 10 Jun 2026 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089935; cv=none; b=AJ7ovYrb0Sor2pxKT6sNjHU3vVzhVH4JpxbaV9CHz/UNr+z4Qz4/yE7PaP7VL+IRDttO+IDqnQ9nXPxgtyB1m6x8Of1NzF/J6N1xH3wxyYJMkdZZJQOt1rBkRFOVbIQXhDmB2I5Q2sbfeUv4+vrLHMqDx+bDUUk3jcPFyGObAj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089935; c=relaxed/simple;
	bh=vOmQpMOTQmAD5HUHEObt2DjkT0/15ApbNdH9hc08UQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dr8hRxAMYg1hWFvXIzXuRNgP9H3BsmL954D3Fk1gjF1Fu2xX43apD1x+ut1Q+wcVXubsL0RNHrLJmL2O8SkDrLkNCSoRPjfxV6jemTr8oonpt405fuvHhgRJzRpNjNWhy+DUh9QtyxxdNDIzt9F6Y86vcb7Jz2yfPkemRUnX+5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmGilNFQ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmGilNFQ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf20ddcaeeso5581885ad.0
        for <sophgo@lists.linux.dev>; Wed, 10 Jun 2026 04:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089930; x=1781694730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ax95pId9QMw1FjsoGhe01/2Zutu0csI1tByOFuVoTk0=;
        b=XmGilNFQt48jVlL8SNhT7EH559JCmo1d7/uwUohGOfJnUsBbaf1+VN+AYrh0EKYULG
         Ypc+BeuYjM+sKMPkUZReC1OUrduh+iz0gUcaPpBoJc5yemNKXlGS8dhr87bf03G69Mjy
         jHgPPMIwJBcRWYhjUAm6YvMOByDmDcLKR3t3i80J5o05FGzXLJL8GNIai6eWqatsf+qD
         hMdEuo6hvcsn/doTFkPzVgxz2d07olhIfSOmdj6XY0csfxWv8zJhCv2P/gyrXJiDVH3G
         hRTUtQdjhhAxChUCd8bHW3kBN0WeGkPO7I4aztrIZzl5nFJC1WVUXhFtq8BflZUshzOT
         rycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089930; x=1781694730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ax95pId9QMw1FjsoGhe01/2Zutu0csI1tByOFuVoTk0=;
        b=dIZH12XOq6+9Z7LY/KYR0Tcl3rp0vflf0LvNZ1aQfIzB8QxOzaRMuLLtJT3Rh0++aC
         +GIBBOmBxetGOwO0DxhQ0IJmwb5ciFDuHeDUmE4S442m2KheOUNDJi1PE+OQknXhg0ps
         EcLGgIccBRcmb8zEDxXNmAAYLjiB/Sm34Oeurns5jq3/RdDfMpU00TnsCQE9ioBYUKL0
         sWscUL1apxQOgUXfXiN2bJMFJD9MWySLq3lUxyiK8df8tByUeCXWiUBtkHgFarWuAb91
         vEMsq94MBGatyv3MKbv8DDIQdde0rMI+34xoVi0fGgTZ7esoSseGemj1VWnzs4clQQd0
         mzMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/z4/U2BVfOsAgao/W+92j6TXmkN4pZPhu+CYRFvhKY/+dQxCbnLIK5ERx+dGoYg6FMm+U/Ct4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGTtn4C75Yu0IaqSmQAaWHRjKqBtxjHF1Gi3QJzs00H5eFrk7S
	to73a7gJPfkz+2tOa4wiU/qrhH8ZoLC/UOFoYv8XwwLSvZAuCScMH1ai
X-Gm-Gg: Acq92OH7mcLmh40CL34HoVswIU+/ETfT5ZFpJ01JygslOpTDimBMX3wa1mGwYNxmREy
	rZLTWtoUq0rkXGQwWM+o+Ez+ylsuPocIYOvcR4C7dBoy5IRA/eGMSdLAcoXksoZTuNzzb0aiSvw
	8wEh8aDW6xy+tFW9XZRDD7nezxsk03Yq1+sJvSxRPeAvGycRBft7RfUocDm5zcgGolVNtlDlDAu
	qs6UMEDgKBmBajTlWZze6ac0g3JKnqMsIY4ICyc7Ce/TBvUEeVafSh+Nj22P0g62qRTx4Ok2uWZ
	5X6UIkq9XiU6vQa0zXnTp0N9yeobQrYPccvUaETLSvu/lAxP4N7+kahuPO0650mL4FMx3GKsTjt
	b7+k5NEpKBFBgoCVsDKlV/P1LrEYB2R4nDB02UkAAzhNhGDVqTF21v+FnWNAUIXaxRUPxk1chYH
	ANGYo60noi/cGnB7U+1pJtxwOwuZ3VVQOm2ilAgZEh75eQ9IY=
X-Received: by 2002:a17:903:46cf:b0:2c1:13cf:19a0 with SMTP id d9443c01a7336-2c1e8332ademr127346645ad.3.1781089929478;
        Wed, 10 Jun 2026 04:12:09 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e234sm251328535ad.53.2026.06.10.04.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:12:08 -0700 (PDT)
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
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Wed, 10 Jun 2026 19:11:21 +0800
Message-ID: <20260610111136.1514155-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610111136.1514155-1-chenyou910331@gmail.com>
References: <20260610111136.1514155-1-chenyou910331@gmail.com>
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
 arch/riscv/boot/dts/sophgo/Makefile           |   2 +
 .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 119 ++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193..e49c8233ae1f 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -2,7 +2,9 @@
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
+
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
new file mode 100644
index 000000000000..882fba441396
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -0,0 +1,119 @@
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
+	leds {
+		compatible = "gpio-leds";
+
+		led-blue {
+			label = "milkv:blue:status";
+			gpios = <&porte 2 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "on";
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

