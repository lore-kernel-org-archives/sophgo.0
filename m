Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B19538F24D
	for <sophgo@lists.linux.dev>; Sat, 25 Jul 2026 17:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002058; cv=none; b=eNwrbO96fyXZS9KMve7MCOyHK/mAh3lVKOfcNZWfutVLBP1jxGyT6WcEvQgrHTd1hm4q3zRMqu0GxFM0Ryn0epaP0ZMYzNOOIivgl3yPxpUsCfUA+/VOKnDPvloo/NOJDYHTYotttD9tO0OimgE6Waqw62zVDUxEh7BrPp1tJWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002058; c=relaxed/simple;
	bh=z6uzbwrcOov01EjwziOQYmuDCveUrzDWnXGNZMo2r2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltgD7HPUot/hjfrJzVpshz2e8iOzTdpbuPekfR4WQx57lgjyd9HopiA9C9fBqCtyMDbWta5OuxCmf1nftxyjMrqovuKTFdzGY3jXTJM2FOPp4lh86phhFudBXeHY6YtwhyowsPoTfKPlgg0sTMUzH0L08uUL6hVsrbECTV4u2Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYwachTw; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYwachTw"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38cfcb507a3so200088a91.0
        for <sophgo@lists.linux.dev>; Sat, 25 Jul 2026 10:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785002057; x=1785606857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hvOKbp3xG4QlT34RdqQIXOPX+sCqsh5Q/jZI9nYCgFU=;
        b=cYwachTwCmEVvjuyrZaAALe6+Zc2Bvmn/L0GPtA9EueF8KxUuA1nItxc7EOBvUo41S
         6duBd1rJ9rld2YbbQxVmIRnJOy5EOmsUTJwbqnfM/lM0gNuQZOy5bDZV3kI0TXzPpQm/
         FNSTyxRkwvlI0eiyCl/3NsAvAzKJqM5czbHCROT/6vsJlz7+uc3ZFHa/DyaC9wau6Lmt
         queL/S/ze211PSR21GNJq1OeUV/UXSe1Dxfv6PWnNLeUUt4jr8GWvwVJzqQWi23SSfqX
         lnfXjfdTJ4Kd7BsBhSniidQdz/9u418LenJ8ghGKhJVzFoWyuTzanmAxP5/HnlsiXhyI
         Jjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785002057; x=1785606857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hvOKbp3xG4QlT34RdqQIXOPX+sCqsh5Q/jZI9nYCgFU=;
        b=KK2MF6okMg8ZSQsusmluYKeHtJqA2vpp1rMUlOqyvljyPmdxhZBNaRc70BFF28E0DF
         YbDXLZ9NVhOX151CVLEE8k3QjJLMzj/gqiNTdTmZKzQWWYxiOmHl5C8AiKN6wvXKrey2
         24SFoxbTyB5HobZhmS6MSFrX7xTOckronEyY6EVvAyxiPpz+EKFimaFYGJCFkbaWgOxg
         KOxRortdJoeenlz37EOhbmnB8pfHr+11Px5uukHo9B44STvIBH7Icb0QebFVGqzIypN/
         Hfx1Cxhgdm+lsobAsFhiUZouRV3fXgk5S64f/DljeEOZ25EX7l8OzqvqjOvMaRfHq7qz
         /lnA==
X-Forwarded-Encrypted: i=1; AHgh+RoyQaEHwBNH5BHONj71UEuvhU8giJwbU9NAYI1wSrj4RSBvs5dmCUMgNQY5qjouKL28nKGHZ/I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjO6xjSlZWJySVDqn+Q2TDLLci5ARjNWbv2zGEx9lh9rWha8M2
	ZhqHX7n9lo1LynN93cA94SovrEDNtceKfrNlLLJDgKAPba41ZIiehidF
X-Gm-Gg: AR+sD12xrDM1kLH8gClr+Aai9LB44SmnbRhq7BRPx8x2PVUURzRmdAMSjuX0kH/L3df
	QKjrYYdgVRmdW7NxMe/L5563GIJnXewXmHjXDylnONnBIDn0wiYBbwklAlOuBCY6naD6mz7n9Wb
	KqfEcmoZPPj9jkM2PPfRSFogJEvQBxwxiiIeiPKvx97M6RqaD3armvWvMAtCqWaTDcMBnKf/g4T
	E4BpLabgE1WDTBCZD9Xn7sMkT0KqOruManmX+1X5k2qscR+JF1gRwznrSMQHV/Z/nm8GCSJzn0q
	NZK+yMNI08+zModDtVIbbvAZEGoKYolP3UB/BxsySAa4X2n86i5OrqS4/sbCbFKNV7KGa+xYiqc
	fELbV5CkyiaioxfysbbzG9Cdt1Ytyiy/7SzaQ/PZ+BreaRUpmn5cO9FhVIVD4mY/eO946rIKiB+
	MuulNJZpLeAG3Wxc1zVeG6thy1BPFhO4hg4RyiH0Tqhqfe70xV0nPDRKMO6N2Z7gol89flUEMzh
	kzii0cfaA==
X-Received: by 2002:a17:90b:314e:b0:38e:480b:99a5 with SMTP id 98e67ed59e1d1-38f293c6d6emr2056503a91.2.1785002057132;
        Sat, 25 Jul 2026 10:54:17 -0700 (PDT)
Received: from chenyou.hitronhub.home ([2407:4d00:cc10:114a:3b0:934a:d409:94fe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f031d1d6csm3005276a91.0.2026.07.25.10.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 10:54:15 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v5 3/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Sun, 26 Jul 2026 01:53:45 +0800
Message-ID: <20260725175346.139173-4-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725175346.139173-1-chenyou910331@gmail.com>
References: <20260725175346.139173-1-chenyou910331@gmail.com>
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
index 000000000000..a2797c0bd767
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
+		coprocessor_rtos: region@8fe00000 {
+			reg = <0x8fe00000 0x200000>;
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

