Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D615E3E6DDD
	for <sophgo@lists.linux.dev>; Mon, 15 Jun 2026 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525058; cv=none; b=Yelber7yUF6k6/qAM3e8PIfhi2+KhnLDZBgcg2WnFSSJqptyMANJuDr879wKLTIvSlmMY0jZB0doRdmqOYAohuq8Tb/y9tC9piEP/WPzivOtgE26Mim+vaAy/x/QXJ4sfrxXfFxtADKzb/ti6mMqpHJtQihyaUjiibAOYH8KhKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525058; c=relaxed/simple;
	bh=44TbCxTVIe/FzBA8wmIEoz6YwN5izDWzxpNkbmfbrho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tXaQypg5CUObqebAwebS4l7ODmzdH2s4qImKWtB04OJhUsSqoQW5K3X2Y+07DbSZ6zAQDAvJLhKtQ3/QkzVh6rrvCOJHF3g65uuTEZSKV07L2+rPz5LkuedoPxLXgzQThwnSU4V3rDbS+xIkAnuqfz2ytmTmCfmWRX3voyOwJl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCy4zem2; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCy4zem2"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-517654b8e28so22620661cf.3
        for <sophgo@lists.linux.dev>; Mon, 15 Jun 2026 05:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781525056; x=1782129856; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaaLk3EgsloTd17mTIl3bCyAeJenYIahR3avArgMblQ=;
        b=jCy4zem2JU4BkMb/OpqArDLyndxnLYcIG3FgzhcSiU/FvzkmSb6j02G3e4B1gCv+3y
         ddK4RUUTe4j1wRzjialKt4vW+3jPeEJ0rGbG7XnVTl336rVyNYp0RCNUHFLTjxO+w0JH
         BrEVEjM2Ykda/aCg8VpqUQH/lygsrDoI5RV5ciRobore1bcDuuewKMIDyNvQA2t+D59I
         awmq/SN5Aq4+FR9tdi5YAezLg/zAUAJfzC6QfqKtD1EOgIxBvFHtInq2Tm6CvYXdumjs
         Es+VcYNL5yWLAicJ7ohhLv+SIQznjbRmFhu1ytt8bdDvsT6Bi9G2eKhRFSTvWTFsvMHM
         eD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525056; x=1782129856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VaaLk3EgsloTd17mTIl3bCyAeJenYIahR3avArgMblQ=;
        b=k7oP+de9RN1bJN/5AeZ09Ce0C4iS7ib03uhlleS1Wq9PsmDmZMJoTW20od1bltN79D
         MNdbHnUyUtwXJno4NZfu8acRF4teNae4hS9jqqyUCjzSVIllCxMRs0P65U2vCBUlGsbF
         0FUCSmFo5NkJioDHmfPQ+Kc2Bezxlql+qZI4/CJ0d1fb89R+Q8JjbpJyTWDXqOzofCZD
         daGBOwZCEUSTFCs3FJTB5Ukr0yoQWOeqHe+TdwiVjXq3VlE248rTcoUaBXp/JtASmf46
         mVLyUAZcDdBchII+Fz5lcEFWTftfwHxG1AfskkTSqiFppbqZtnDJ2g0Fxe6dx25Fg8NE
         Z2Ng==
X-Forwarded-Encrypted: i=1; AFNElJ9TM4PYYfOAdQeSF0WcTYP35H8T1i3Kv14EA6CwT3M/7a/n6sY5Pbk54Q9evpD77EGmgHOb3aM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxU3KY2/tfxtK/JvACw2Vsujkg2+fd/F5SjX8F4wvB3NWX7IZ6M
	lU4wzCfaxNEDbDzdg9jIwEslNeJkfYaYAtwjKYJG4gOho4yZbVJdhOU0
X-Gm-Gg: Acq92OF+NV1KgYjmEXRi3QizaJxR2HcP3Ncb/Lk3TVizN+KyOglX901/G5YRf+OXwjc
	WAT7DMOtM5lRTy/MaTek9KiLlaskTQIF7VhBsJFQ7nX6H5gVOU+5lSY/Ra6aRLyjlQxAIqP89Vp
	7zG/YvUha845wdTYi33miVCaEjkU5DG9Tkyss0YDZ1Nq2Dq1chsMWknpVzrt3hll4RJf+sE0OLw
	caRKlYIEIg2PeomCYWShxXrkqUhacMTmxDsekD6LDRk45nehtsAc0l5EuWvC00/83nPpW4NAHP6
	rh8uhjrc8AIig+xdQfei+SMHwQ8RINTIDAkURxmSPD5tymcJ97sjXXhsuqUHKmrRAyzjbQI2Kjp
	phMXXlcYbZPvfW0iY+Q+EPWuIqFz87dVMmxQTRQs/tUwsuIndtFrPb9PVpWikIbkaOIjHaBC+Uz
	LITu5AjUfeae+INyqzN4YOm8OKn/vD7QyA27j879b1kvXvC/2SKQU0aGNr
X-Received: by 2002:a05:622a:229f:b0:517:8242:5bc1 with SMTP id d75a77b69052e-517fe200008mr205748761cf.15.1781525055524;
        Mon, 15 Jun 2026 05:04:15 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51975955956sm25184311cf.17.2026.06.15.05.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:04:15 -0700 (PDT)
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
Subject: [PATCH v6 3/3] riscv64: dts: sophgo: add initial Milk-V Duo S board support
Date: Mon, 15 Jun 2026 08:03:24 -0400
Message-ID: <20260615120324.1527881-4-josh.milas@gmail.com>
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

This adds initial riscv support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 245 ++++++++++++++++++
 2 files changed, 246 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193..58cc6b70d8de 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 000000000000..f56bfddeacc4
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
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

