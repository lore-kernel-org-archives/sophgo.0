Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A828266EFA
	for <sophgo@lists.linux.dev>; Sun,  8 Jun 2025 23:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425026; cv=none; b=ZTm0v4FJ7kjLiRai0fvc7GqsOzlPYu20qsCmTSirzzwAq5qs+v6xXACMSg6eq8qgI2rawKBWWGC/47h2mncG3pASj1gsaf4/Pp/KmCcmce7x1TxcSESGxdOaRXOMpcQ8l8eVczU+RaZfbUxvPTWqIxp+191Ohev2Hf6kN1LA1ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425026; c=relaxed/simple;
	bh=hBgMPetOaLI2yQ8hN5lqvc9AJmOF865LMQBDSkW0aw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwdZlLuUmFFSRGAUvXn8gCYiiW7jXMREO6Mr2C8qMIwgXcrVK9cR54aNlmub2tTmEfPxz/nOf8pGoyQzVXGNqJ5GdY3GStVOllFTn23U3LN4uHFFeYk1vC5pyDGNbOCaQ3edhqHHX+6NHJtQjE22iYRNl4ffEwlz/6TCGflZY1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lttC3lze; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lttC3lze"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6facba680a1so42474446d6.3
        for <sophgo@lists.linux.dev>; Sun, 08 Jun 2025 16:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425023; x=1750029823; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f80/rTjexX6kZx0F6zMPRlo3NF3zV6bgMpBVAmghpHA=;
        b=lttC3lze1qd/ZLosisxr8WErZYzB3cHh2AlXWVv+S9rFaloGzL7tPI6T7QUETsx1sN
         IhfeCU6DNOdWPUNmWiKrZWT/ubhCLyipbRI5ZTQDKrDgRs2a9hXFvxq5Xu2YRsD9+orN
         KjTo0IjV9VwSBpF34g5hv2h8ITScgySt1rRN7FwnRI4S/lhkWs7nUslOh6Ktv8uB1IzH
         xJCE21luP1c4TbSCqgGK3nNqUOYCCWEsdHVI9n2x9XQpXpebhJrq7AOxEKQg7T584nIQ
         /n603fFsG8wu6mx0eEU83AR2Gr3isu8eWVkB7pFH7+2NN7kWJlrd9YTL9zf/W02i98FB
         vJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425023; x=1750029823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f80/rTjexX6kZx0F6zMPRlo3NF3zV6bgMpBVAmghpHA=;
        b=MzFxPvj60YKI/h1S04eKIIWG7ZpEuRAkLRpmK51r0AHAii3O3a2YqCOr6WWfVotIh7
         26hp4XBNs5J/VmA+dg5zD6zp7cRH/LFpLhqt8qpyj0tV4IdKVzKv7Sk0CPNQxEargJOd
         Rm+rVqX6RYka7zgZ5j1twLOP1NGEpQUvHtKHSkvxDw1I7i2odV8K/CkKdaThcYcoMvaF
         K8hAhdhcX5lvrCqH+s3PydKEni3OjAtPK67ELaF3IMXN7XyTeE2CTqYG7RKkzLptqM4f
         WhVD91x94Q1LAgnzwKBN16jOe7XIc3GAVJ27tKRjqJ+MEKJrx5QbMZ4/q/7Zi1Ye624H
         Zp0w==
X-Forwarded-Encrypted: i=1; AJvYcCV+FUH934dDYt3pWWL77vHJgDRO0x5moOyYhXVr1lkQdlnEKiHmWjvOxp0Eo0sFAbJGePBFt/M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEhkVPySxHrUzpMKAGoFvRRHx//EZD61YAehUP7taIQCv6MDG/
	TrlSj3EiZ6M3ZkWGePr4/QwZUmb9FuOev+dVYia0Ynkv0kFuQf0YyRmH
X-Gm-Gg: ASbGncu5ciRSLDejIbnn19M60mOy4U6832cr250AQkaf7KVWgMtnoGJWeXFeQwdUGWs
	y5QYo26/nGOOlHQeSHc85oKuRIfJOD9Q6BhVpXfgHyRZIreNwracf1Gt2CQzh205y2iy9W/Bwon
	mcejYqqnC69DURUhkO9+2ovES2RjJNBctSCU23cabfh75YApsNBheE/10Kat+P47qeizw3J+q2C
	hyi/sU9g9fcneCGBzVTx3rOzo9BucrdhUFUImT9AqpOAYrPNqjGVUCf4BlT8McV1rPEEoqgBNlY
	XS2ahT76EAaOjHCtGCwasJUD0NDL76n3tyWkmw==
X-Google-Smtp-Source: AGHT+IGDR5vCzjnRiL5Bd9DmHdP239tGw9TK/2w6p5uhxMHd8d9XEN7rTINOxss4Gjf2OI+0cHYNfw==
X-Received: by 2002:a05:6214:5017:b0:6f9:51b5:45b4 with SMTP id 6a1803df08f44-6fb08fdc76fmr172715016d6.12.1749425023356;
        Sun, 08 Jun 2025 16:23:43 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b36759sm44140746d6.121.2025.06.08.16.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:23:43 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 4/4] riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series SoC
Date: Mon,  9 Jun 2025 07:22:10 +0800
Message-ID: <20250608232214.771855-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232214.771855-1-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add known reset configuration for existed device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 4c3d16764131..e91bb512b099 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -36,6 +36,7 @@ gpio0: gpio@3020000 {
 			reg = <0x3020000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			resets = <&rst RST_GPIO0>;
 
 			porta: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -54,6 +55,7 @@ gpio1: gpio@3021000 {
 			reg = <0x3021000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			resets = <&rst RST_GPIO1>;
 
 			portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -72,6 +74,7 @@ gpio2: gpio@3022000 {
 			reg = <0x3022000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			resets = <&rst RST_GPIO2>;
 
 			portc: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -90,6 +93,7 @@ gpio3: gpio@3023000 {
 			reg = <0x3023000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			resets = <&rst RST_GPIO3>;
 
 			portd: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -133,6 +137,7 @@ i2c0: i2c@4000000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C0>;
 			clock-names = "ref", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(33) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C0>;
 			status = "disabled";
 		};
 
@@ -144,6 +149,7 @@ i2c1: i2c@4010000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C1>;
 			clock-names = "ref", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(34) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C1>;
 			status = "disabled";
 		};
 
@@ -155,6 +161,7 @@ i2c2: i2c@4020000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C2>;
 			clock-names = "ref", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(35) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C2>;
 			status = "disabled";
 		};
 
@@ -166,6 +173,7 @@ i2c3: i2c@4030000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C3>;
 			clock-names = "ref", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(36) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C3>;
 			status = "disabled";
 		};
 
@@ -177,6 +185,7 @@ i2c4: i2c@4040000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C4>;
 			clock-names = "ref", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(37) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C4>;
 			status = "disabled";
 		};
 
@@ -188,6 +197,7 @@ uart0: serial@4140000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART0>;
 			status = "disabled";
 		};
 
@@ -199,6 +209,7 @@ uart1: serial@4150000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART1>;
 			status = "disabled";
 		};
 
@@ -210,6 +221,7 @@ uart2: serial@4160000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART2>;
 			status = "disabled";
 		};
 
@@ -221,6 +233,7 @@ uart3: serial@4170000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART3>;
 			status = "disabled";
 		};
 
@@ -232,6 +245,7 @@ spi0: spi@4180000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI0>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(38) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI0>;
 			status = "disabled";
 		};
 
@@ -243,6 +257,7 @@ spi1: spi@4190000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI1>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(39) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI1>;
 			status = "disabled";
 		};
 
@@ -254,6 +269,7 @@ spi2: spi@41a0000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI2>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(40) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI2>;
 			status = "disabled";
 		};
 
@@ -265,6 +281,7 @@ spi3: spi@41b0000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI3>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(41) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI3>;
 			status = "disabled";
 		};
 
@@ -276,6 +293,7 @@ uart4: serial@41c0000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART4>;
 			status = "disabled";
 		};
 
-- 
2.49.0

