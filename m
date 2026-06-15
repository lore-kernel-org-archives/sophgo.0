Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BFD3E5ECF
	for <sophgo@lists.linux.dev>; Mon, 15 Jun 2026 12:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525043; cv=none; b=AJEC+oMcLcfxC4dkjiaZwUQ0y6LM1kKkl0dxv86FxZQHK8TYw0kDodMM5x1PeWfuXTcYcWfRpRE5jFy+eXrDMUTZGHAFnmnM00qBlPijkIoQ3WL2GrGVViqkl1ctnvR/sPltPmcfgjCjt5DWWB1E+SObnhtUEe+O2i2Rz0s3erA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525043; c=relaxed/simple;
	bh=Ft08IgUXh4oNU8ppJ65OFIwc+1F6KgXGqX4eecDpO14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QS5BttIQY0liXr2YcwwdpTuatSW4lxZEZ8Q3c2FH1BZAAc6+UUyoM6GGCJPMnjPTL6ylACrosllSMPgGlA53kKTvAvtCe24YyXb+1S+oDUPKFVW/uJd7gXmbjaIpVODBf/JGtTSkL381UzLb5pC57Ml+eAo9PkFCVIoDsraxJ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrILFBrS; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrILFBrS"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-915d64fead9so434546985a.0
        for <sophgo@lists.linux.dev>; Mon, 15 Jun 2026 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781525040; x=1782129840; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLsSPyO0xdRuHjYZ1xItpqNCAh/cCNAbIOIeLrTOYo8=;
        b=ZrILFBrS0LC9qihGOQXpIhAwMOMMTgn2xjXpSvdIU68ABoSN24exoHeQAGfZaN1w9R
         6hxqOCMnIJji6La9/Esaj/ktY32VsowKtFtrGgZ2NbkrAx9Kca4q24XmQO8k3rBISW19
         oerxgAcBAo5OsbrzvlyHAIcKQMPWbPxUJ0blbd5+N1LCmpwC/nSQFa6m2zkSTzPREY0j
         xzXXf7la6kVLUPj95N2AAHudhG/3j9bEmC9iaghPwKbZ7SaZNzVl+jYcobpg5iSiXDEJ
         2qsUN7Ae5Utl69MnaRDau/ymGZA2smihrTybCxhZV8BuU7BiQK5wJzMMKtvfIeDwA54e
         XTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525040; x=1782129840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rLsSPyO0xdRuHjYZ1xItpqNCAh/cCNAbIOIeLrTOYo8=;
        b=OJYGP0It9BqTUsRVd6Endnq08b89T7E8wRTzDqesk6bZMCa4dBxNAVVqwcwCj7F9kF
         2HVohMULWDS5SDSU0wJjhChKwdBSPL12gmxEnEbagrDvX4cXT09cqv8q0DoLCHh3a3PW
         viK1RR4mqLU8casJbo9W4qjArB9GGssmd+ngrZaac8rR6j7QlQqjuqJNjY3yvevotI/P
         7gd6Hi65ObRTiz0bMJzFepQxsd+LKt7irDJcDFNUq/UYg1UotRKJ7iWLXJM4MAy6mPtx
         UFnM2sC0VYwQLM+O13iKP59B4YV4+NMVbyqs2cFvP5edNlaqUC975irxwfaUke3Dp1qN
         IIsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dcjok0KZO/U2YsJXFc+bkOneqkPFSva4pRCHlS+r4WCvPC1FMoKAx9dkpOtGOznyHJ+7im9g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yws0ZSZTNQADlo7ysWAjgHI4UN1m+/9Uc1ZPFGaxLKpjk8xWUrt
	yVP3XIS0O5r90okbioA4X3R/vMwbO415Ku9vaSXSCMEBE3IRQLscTp6g
X-Gm-Gg: Acq92OEyJYcXX2kEbTS7VjKcksZsmLtj8r2s4ozPrSB2A5fN1/R4PvINzWUiOanESMm
	KfkO6DBNwTLfXngHRGHoV+nppg0kao1Z36+UtkxllUwtX3GnXJIRsaqzjwvlTaUDKASzXbGxHH+
	rZZCbkDOFKsQh2ELo2hvzjOg6rpk/zbqKwYcXg4YubUeisemYyN8phNqrTHwATtAzocYRNc/41e
	XReRujg7neIdmDAm1WBytGErnOdemTu0ZkTI7HznwDpNgNtyE5UZ/S0Xe5vlhEQeJw/BfVsFjto
	5vaZw5pjItz0tFaU27WBCPfbR2CJtvk4ouyyLE5TiZgXrfj36E/RPzDr/nY7vZAO3zglRlUD3D2
	R5HuW/B1xKgyx8yjxDNQEJrRBuob08xxE38lBnWCjiyCz3eZA3WRzAgigob8SW7sYK5IshCh/8C
	sP38Xol6Cs2xiMk0VcK5GUTJPr/lCJsAwH8GiiM0tW09VGbiUBGe3vVfxo
X-Received: by 2002:a05:622a:1e92:b0:513:e686:b361 with SMTP id d75a77b69052e-517fed37c66mr172462931cf.2.1781525040526;
        Mon, 15 Jun 2026 05:04:00 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51975955956sm25184311cf.17.2026.06.15.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:04:00 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	chen.wang@linux.dev,
	inochiama@gmail.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	hanguidong02@gmail.com
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v6 1/3] arm64: dts: sophgo: add initial Milk-V Duo S board support
Date: Mon, 15 Jun 2026 08:03:22 -0400
Message-ID: <20260615120324.1527881-2-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615120324.1527881-1-josh.milas@gmail.com>
References: <20260615120324.1527881-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds initial arm64 support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/arm64/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 245 ++++++++++++++++++
 2 files changed, 246 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
index 94f52cd7d994..68aace728223 100644
--- a/arch/arm64/boot/dts/sophgo/Makefile
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 000000000000..f56bfddeacc4
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo S";
+	compatible = "milkv,duo-s", "sophgo,sg2000";
+
+	aliases {
+		i2c4 = &i2c4;
+		mmc0 = &sdhci0;
+		mmc1 = &emmc;
+		mmc2 = &sdhci1;
+		serial0 = &uart0;
+		serial4 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&porta 15 GPIO_ACTIVE_LOW>;
+		power-off-delay-us = <50000>;
+		post-power-on-delay-ms = <200>;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&pinctrl {
+	emmc_cfg: emmc-cfg {
+		emmc-rstn-pins {
+			pinmux = <PINMUX(PIN_EMMC_RSTN, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+
+		emmc-clk-pins {
+			pinmux = <PINMUX(PIN_EMMC_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+
+		emmc-cmd-pins {
+			pinmux = <PINMUX(PIN_EMMC_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+
+		emmc-data-pins {
+			pinmux = <PINMUX(PIN_EMMC_DAT0, 0)>,
+				 <PINMUX(PIN_EMMC_DAT1, 0)>,
+				 <PINMUX(PIN_EMMC_DAT2, 0)>,
+				 <PINMUX(PIN_EMMC_DAT3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+	};
+
+	i2c4_cfg: i2c4-cfg {
+		i2c4-pins {
+			pinmux = <PINMUX(PIN_VIVO_D1, 7)>,
+				 <PINMUX(PIN_VIVO_D0, 7)>;
+			bias-pull-up;
+			drive-strength-microamp = <4000>;
+			power-source = <1800>;
+		};
+	};
+
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
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
+	};
+
+	sdhci1_cfg: sdhci1-cfg {
+		sdhci1-clk-pins {
+			pinmux = <PINMUX(PIN_MIPI_TXM4, 1)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+
+		sdhci1-cmd-pins {
+			pinmux = <PINMUX(PIN_MIPI_TXP4, 1)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+
+		sdhci1-data-pins {
+			pinmux = <PINMUX(PIN_MIPI_TXM3, 1)>,
+				 <PINMUX(PIN_MIPI_TXP3, 1)>,
+				 <PINMUX(PIN_MIPI_TXM2, 7)>,
+				 <PINMUX(PIN_MIPI_TXP2, 7)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+	};
+
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
+	uart4_cfg: uart4-cfg {
+		uart4-data-pins {
+			pinmux = <PINMUX(PIN_UART2_TX, 5)>,
+				 <PINMUX(PIN_UART2_RX, 5)>;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		uart4-control-pins {
+			pinmux = <PINMUX(PIN_UART2_CTS, 5)>,
+				 <PINMUX(PIN_UART2_RTS, 5)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
+
+&dmac {
+	status = "okay";
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	pinctrl-0 = <&emmc_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+};
+
+&i2c4 {
+	pinctrl-0 = <&i2c4_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
+&saradc {
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	disable-wp;
+	no-1-8-v;
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	cap-sd-highspeed;
+	keep-power-in-suspend;
+	no-mmc;
+	no-sd;
+	non-removable;
+	max-frequency = <150000000>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	pinctrl-0 = <&sdhci1_cfg>;
+	pinctrl-names = "default";
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-0 = <&uart4_cfg>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
+
-- 
2.54.0

