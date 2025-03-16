Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD581AA1E8;
	Sun, 16 Mar 2025 18:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742151408; cv=none; b=P0I+06yg3rYsQDV3FPaZQDenOoZRIOR5+8h/gtCKPyy64vbVZlb1R1GmYnELQ9AYSf0Act13BGQRRGCCqWOETs1l8lcWiHlBaFgyl/jZ7CVvhQi4R5g9tCitBsK3gZDk4+TSGooc9HHkwTsWuW1luee6Cplq0USE8TbqSzW7FgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742151408; c=relaxed/simple;
	bh=CijXf724R+0o4FNmJZame4FLfuvt1xRf6ldlnloIvyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2Hvv4Ure3BMveULunBkD/iYvG5hJQz7+XBlXfSe0S8AWAKgI5RPCAxtNTqtvBh2TeJabKiQyuSvkPLzQGny+VIX3KYLairk6XJ2RzoPdra21r04aJn4Sz0kx9vxWkZQwyWwtgg0rup9yX43nmyLByMpOy8CiLTZD2/Cpj0DG6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVKmqyBy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVKmqyBy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso9502385e9.2;
        Sun, 16 Mar 2025 11:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742151405; x=1742756205; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xGl7tU6mi9zp8esRyMvnPDAB4/QhtvgdOgPhUcw5vs=;
        b=JVKmqyByPgViHYkX+WuKnO2sL9A+Ln86mkNlWOLKUQ5dWcaimD9tHxCiz3yhKGK+XT
         7GPyc+JnkF0BXOtkBUurorOlVwzLe6H159NTS7fRgUoGpyEm8MjwoVqfWobnlN+ua9m9
         w/Hr0Y0pE+W8dS9x+o4n9cjMrfDKkor29607L4CDO3ZjHN2+Mlf2iwAWsdElEUL6TZAA
         KPUgzPuqAzhwJJ6vCJdhWFVdzzlW/jOqBlZB8sMFPcXpDeUxbbPx9UE8oAnaMJBv30ke
         Ad+IbJpGIduLNQUyCWFk6aADoHzDJdIYtVyL1gLTd63Up4k1Kwe65QFmpD361dSD054d
         G6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742151405; x=1742756205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3xGl7tU6mi9zp8esRyMvnPDAB4/QhtvgdOgPhUcw5vs=;
        b=ZsLvZdBPu1vca8yMBmmKhricvmiw7ZB/SgnadaNhpcOmN2LfNJA+UjutEF7fhligtZ
         OFUVEFu/K64S39PzZJd6xlnZLWF0TDw6eCOyONZc1Url2LEpdwLhlN+nKoqdNpSME+4F
         cCckFAft6KXk8+xrIZhMYQxqkB0pKTaDqfnlQ7f5d4nI7Ivs/fpjMzQLggDFx+unL62C
         f2uCxThMnlaOOlXosUgm1Vx6v9BlsZ7xpkJzJhZFCyHb7BgnVRsN5j8vugn939tYwlbt
         pZ2gm3kRwjpOg6outkHVCpYpbcZ/1vnLF/SbXI7J98Lf2w3tKQ+0LrlMrAyfYm+zqgPU
         2XGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgl2DXJj7ZTmPtkNRJVk7q9qECyLuOgBskob9d4GrJaahrUx2SKVU2TUb1wYhqhbF7f6o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxV9xRY8eokFKuuB71kRFQXvFhPoO8IT84dfgjutdTlDY+TTMJU
	9qhzq60dBe3mTRGE5rnE/3QV5ItWEKyAsewjbS/9fgJ90i399+gw3/QJk21V
X-Gm-Gg: ASbGncsmX2lo7g0lryMGgIQd/wqrOptrD7ge+ugOKXjzV20HmKHn+MsmL+wFWlrwlpk
	TdXe4Kr6Qb4RS10iIwg6LKXBy7S+3de+4MOW7LTtDrCSUTR9rbheIptssQmeS6AWSifjoaz232Y
	dPoFfzWw8rvoJ6RhnsNi1IJ5povmRLpB/cjV8jnVf2kk0wKBTtDA2GiN+LwY4bTowrrEeq/ih6u
	DA8scXU4OT6nqJdm34r7keDwHzrIvMxrFl+GlYDGUslV+fDowy7bzQCP24wCBhszFc3yNyGIPEM
	bgfCwtPH09kcwvRk08fB8BRte6+KXmNUhUrXrbYkCww7f8mnatgkUM8vJggQ51kpZhhR
X-Google-Smtp-Source: AGHT+IFnB56wfH0PJxNYLcoaDP7MiixmnzTmwt0rC/3veroiBMpev8pkqS0kZXFwypu7R00NhnUKwA==
X-Received: by 2002:a05:600c:3d0e:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-43d2bb4d786mr20486255e9.23.1742151404719;
        Sun, 16 Mar 2025 11:56:44 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb6292sm84692335e9.1.2025.03.16.11.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:56:44 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific part into SoCs' .dtsi files
Date: Sun, 16 Mar 2025 19:56:31 +0100
Message-ID: <20250316185640.3750873-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the peripheral device tree re-usable on ARM64 platform by moving CPU
core and interrupt controllers' parts into new cv18xx-cpu.dtsi and
cv18xx-intc.dtsi.

Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nubering
into "plic" interrupt-controller numbering.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v5:
v4:
- cleanups dropped
- cv18xx-cpu-intc.dtsi instead of cv18xx-cpu.dtsi+cv18xx-intc.dtsi
v3:
- &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
were moved into cv18xx-intc.dtsi to reduce code duplication;
v2:
- instead of carving out peripherals' part, carve out ARCH-specifics (CPU
core, interrupt controllers) and spread them among 3 SoC .dtsi files which
included cv18xx.dtsi;
- define a label for the "soc" node and use it in the newly introduced DTs;

 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |  5 +
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  5 +
 arch/riscv/boot/dts/sophgo/cv181x.dtsi        |  2 +-
 .../boot/dts/sophgo/cv18xx-cpu-intc.dtsi      | 54 +++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 91 +++++--------------
 arch/riscv/boot/dts/sophgo/sg2002.dtsi        |  5 +
 6 files changed, 93 insertions(+), 69 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index aa1f5df100f0..e5494f0f1f45 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -3,8 +3,11 @@
  * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
  */
 
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
 #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
 #include "cv18xx.dtsi"
+#include "cv18xx-cpu-intc.dtsi"
 
 / {
 	compatible = "sophgo,cv1800b";
@@ -15,6 +18,8 @@ memory@80000000 {
 	};
 
 	soc {
+		dma-noncoherent;
+
 		pinctrl: pinctrl@3001000 {
 			compatible = "sophgo,cv1800b-pinctrl";
 			reg = <0x03001000 0x1000>,
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 8a1b95c5116b..96e1a2f14d3e 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -3,9 +3,12 @@
  * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
  */
 
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
 #include "cv18xx.dtsi"
+#include "cv18xx-cpu-intc.dtsi"
 #include "cv181x.dtsi"
 
 / {
@@ -17,6 +20,8 @@ memory@80000000 {
 	};
 
 	soc {
+		dma-noncoherent;
+
 		pinctrl: pinctrl@3001000 {
 			compatible = "sophgo,cv1812h-pinctrl";
 			reg = <0x03001000 0x1000>,
diff --git a/arch/riscv/boot/dts/sophgo/cv181x.dtsi b/arch/riscv/boot/dts/sophgo/cv181x.dtsi
index 5fd14dd1b14f..bbdb30653e9a 100644
--- a/arch/riscv/boot/dts/sophgo/cv181x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv181x.dtsi
@@ -11,7 +11,7 @@ soc {
 		emmc: mmc@4300000 {
 			compatible = "sophgo,cv1800b-dwcmshc";
 			reg = <0x4300000 0x1000>;
-			interrupts = <34 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(18) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_AXI4_EMMC>,
 				 <&clk CLK_EMMC>;
 			clock-names = "core", "bus";
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi
new file mode 100644
index 000000000000..5e5d163e79d4
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+/ {
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <25000000>;
+
+		cpu0: cpu@0 {
+			compatible = "thead,c906", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <65536>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
+};
+
+&soc {
+	interrupt-parent = <&plic>;
+
+	plic: interrupt-controller@70000000 {
+		reg = <0x70000000 0x4000000>;
+		interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+		interrupt-controller;
+		#address-cells = <0>;
+		#interrupt-cells = <2>;
+		riscv,ndev = <101>;
+	};
+
+	clint: timer@74000000 {
+		reg = <0x74000000 0x10000>;
+		interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+	};
+};
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index c18822ec849f..62c1464a0490 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -12,47 +12,16 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	cpus: cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		timebase-frequency = <25000000>;
-
-		cpu0: cpu@0 {
-			compatible = "thead,c906", "riscv";
-			device_type = "cpu";
-			reg = <0>;
-			d-cache-block-size = <64>;
-			d-cache-sets = <512>;
-			d-cache-size = <65536>;
-			i-cache-block-size = <64>;
-			i-cache-sets = <128>;
-			i-cache-size = <32768>;
-			mmu-type = "riscv,sv39";
-			riscv,isa = "rv64imafdc";
-			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
-
-			cpu0_intc: interrupt-controller {
-				compatible = "riscv,cpu-intc";
-				interrupt-controller;
-				#interrupt-cells = <1>;
-			};
-		};
-	};
-
 	osc: oscillator {
 		compatible = "fixed-clock";
 		clock-output-names = "osc_25m";
 		#clock-cells = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&plic>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		dma-noncoherent;
 		ranges;
 
 		clk: clock-controller@3002000 {
@@ -75,7 +44,7 @@ porta: gpio-controller@0 {
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				interrupts = <60 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <SOC_PERIPHERAL_IRQ(44) IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
@@ -93,7 +62,7 @@ portb: gpio-controller@0 {
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				interrupts = <61 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <SOC_PERIPHERAL_IRQ(45) IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
@@ -111,7 +80,7 @@ portc: gpio-controller@0 {
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <SOC_PERIPHERAL_IRQ(46) IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
@@ -129,7 +98,7 @@ portd: gpio-controller@0 {
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				interrupts = <63 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <SOC_PERIPHERAL_IRQ(47) IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
@@ -137,7 +106,7 @@ saradc: adc@30f0000 {
 			compatible = "sophgo,cv1800b-saradc";
 			reg = <0x030f0000 0x1000>;
 			clocks = <&clk CLK_SARADC>;
-			interrupts = <100 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(84) IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -162,7 +131,7 @@ i2c0: i2c@4000000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C0>;
 			clock-names = "ref", "pclk";
-			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(33) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -173,7 +142,7 @@ i2c1: i2c@4010000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C1>;
 			clock-names = "ref", "pclk";
-			interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(34) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -184,7 +153,7 @@ i2c2: i2c@4020000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C2>;
 			clock-names = "ref", "pclk";
-			interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(35) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -195,7 +164,7 @@ i2c3: i2c@4030000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C3>;
 			clock-names = "ref", "pclk";
-			interrupts = <52 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(36) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -206,14 +175,14 @@ i2c4: i2c@4040000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C4>;
 			clock-names = "ref", "pclk";
-			interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(37) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
 		uart0: serial@4140000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04140000 0x100>;
-			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(28) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_UART0>, <&clk CLK_APB_UART0>;
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
@@ -224,7 +193,7 @@ uart0: serial@4140000 {
 		uart1: serial@4150000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04150000 0x100>;
-			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(29) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_UART1>, <&clk CLK_APB_UART1>;
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
@@ -235,7 +204,7 @@ uart1: serial@4150000 {
 		uart2: serial@4160000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04160000 0x100>;
-			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(30) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_UART2>, <&clk CLK_APB_UART2>;
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
@@ -246,7 +215,7 @@ uart2: serial@4160000 {
 		uart3: serial@4170000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04170000 0x100>;
-			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(31) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_UART3>, <&clk CLK_APB_UART3>;
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
@@ -261,7 +230,7 @@ spi0: spi@4180000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI0>;
 			clock-names = "ssi_clk", "pclk";
-			interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(38) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -272,7 +241,7 @@ spi1: spi@4190000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI1>;
 			clock-names = "ssi_clk", "pclk";
-			interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(39) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -283,7 +252,7 @@ spi2: spi@41a0000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI2>;
 			clock-names = "ssi_clk", "pclk";
-			interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(40) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -294,14 +263,14 @@ spi3: spi@41b0000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI3>;
 			clock-names = "ssi_clk", "pclk";
-			interrupts = <57 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(41) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
 		uart4: serial@41c0000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x041c0000 0x100>;
-			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(32) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_UART4>, <&clk CLK_APB_UART4>;
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
@@ -312,7 +281,7 @@ uart4: serial@41c0000 {
 		sdhci0: mmc@4310000 {
 			compatible = "sophgo,cv1800b-dwcmshc";
 			reg = <0x4310000 0x1000>;
-			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(20) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_AXI4_SD0>,
 				 <&clk CLK_SD0>;
 			clock-names = "core", "bus";
@@ -322,7 +291,7 @@ sdhci0: mmc@4310000 {
 		sdhci1: mmc@4320000 {
 			compatible = "sophgo,cv1800b-dwcmshc";
 			reg = <0x4320000 0x1000>;
-			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(22) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_AXI4_SD1>,
 				 <&clk CLK_SD1>;
 			clock-names = "core", "bus";
@@ -332,7 +301,7 @@ sdhci1: mmc@4320000 {
 		dmac: dma-controller@4330000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0x04330000 0x1000>;
-			interrupts = <29 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
 			clock-names = "core-clk", "cfgr-clk";
 			#dma-cells = <1>;
@@ -344,19 +313,5 @@ dmac: dma-controller@4330000 {
 			snps,data-width = <4>;
 			status = "disabled";
 		};
-
-		plic: interrupt-controller@70000000 {
-			reg = <0x70000000 0x4000000>;
-			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			riscv,ndev = <101>;
-		};
-
-		clint: timer@74000000 {
-			reg = <0x74000000 0x10000>;
-			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
-		};
 	};
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
index 7f79de33163c..a0cb8080dfa5 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -3,9 +3,12 @@
  * Copyright (C) 2024 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
  */
 
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-sg2002.h>
 #include "cv18xx.dtsi"
+#include "cv18xx-cpu-intc.dtsi"
 #include "cv181x.dtsi"
 
 / {
@@ -17,6 +20,8 @@ memory@80000000 {
 	};
 
 	soc {
+		dma-noncoherent;
+
 		pinctrl: pinctrl@3001000 {
 			compatible = "sophgo,sg2002-pinctrl";
 			reg = <0x03001000 0x1000>,
-- 
2.48.1

