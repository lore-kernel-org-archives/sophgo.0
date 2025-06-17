Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDC028DB57
	for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 07:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750143797; cv=none; b=hJJWrEynsisZFjYqk4D9fko25yPVfenGQc6ssEdYtVBevG8Q5cgokdtuKxGh859MrLM19e260KzuyipyS0r7RtRAPDE2BsVfZtcmsDI38LCoHzLbSFLa1KUZzfbCLUQ7KYpcBeN2dqZWFTYgpjTtyJ2STbC9RpRKRY2Zo8NpqAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750143797; c=relaxed/simple;
	bh=VluJ5mmYbGngSNNUREfnzarLKZaoN59HUH1rSdoa7gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eD/DvTKV7rw2SjFM3jFMQ321re7L2dKpMRh3fUv0pyx9bWfT0K/uFgP5+xdWZwNftH+pkRHBSG7SCgfwtWyGl7A1/oSMErgPnYVHmL6ONv16xlTHED7dNDxj4XbIbazgjQ0As+F3DZiBn7y+jj9HrQzyP/7mhoCLxyeTD2c9RPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoyI8oCW; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoyI8oCW"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23636167b30so47292955ad.1
        for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 00:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750143795; x=1750748595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhFbypeFAxQ8f5bzL+8ikB/KiObjW6nRA+DZBhJ2u9A=;
        b=VoyI8oCWwt397RATAH7x2gqTkKWukyB4TP7g1kUsgO8uqzUhtLLgY8Bdtm56miAK7M
         fBdp2emh/2NfTCpnLx3CeiXlX1YEvRN5scftm/Ksw0za4bzAqVTWwSmBp2bZskrODRBt
         uMnQCw/fqKQYcsYr2gQrF0hDYbJztK4MzX/khVOm9miieWKT8gzqlVrK9ljYqgQU914X
         UAxt0KqrV/u14Bjht2Vp9wKoe2puXmJWDAZcdPk32/1kkgLZ13AVwiy6a96z9tPPpsNr
         ISO29/+s5b0Dw4Uwabf+SkU9a5nnpmRjlj/pyQcfHu8LQqCQmzz4tpE/z1ggCS3EUwBp
         EAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143795; x=1750748595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhFbypeFAxQ8f5bzL+8ikB/KiObjW6nRA+DZBhJ2u9A=;
        b=rdEToitqTW7caSoyTpWy7AnMd+ZXP3ldIT2ezzUR9zCSx4oM+hUrcaLN7uyd7cEINS
         tjj4DJu9De/MwTMFhEQ2NFg/6nB/CclETHiBfjUfBUjJaI4MnokDX1kFNMMT21cMC/qE
         3VuGVts91lBW+MEstAnTElHXgwq9qXSfgR7ogV6Fp7MDCCq8rAtzdyiULaD3SVY8qdMb
         DKtGpRdFwtP1nYNAuZjN51mcgCUkkD2JZylg3MU2HUzxQ2acO7lXfVstwS/DQswbVdxK
         Z7ORmIYz4gB2iyRvsZnYKzchEhN8dlTWY5ztIhlNd7LkcSYyCROmDLlNFzHmu7sO5h71
         wHnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaz30mgcbjkFsQKAy05nc3hhp7aQSV2Q8bp05AlQuS59p1iDV6vYiyYngXE4CfCJQxhFLFy8s=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkEVb7UYiFzIF5NvxMuLxxxwpFv+BuKLayZ+zfYdVBr7yrbgkC
	q9+hMTRcMD45YPJ+oKdVly9iYrPZ4/tqxu4P5jlnyXWhIn7wJkWTWrtO
X-Gm-Gg: ASbGncuJrqv7YIR2e0+Kr1Kzp1DTA1eY9NXEj5xolT7X6hXfZBIsQfGNphUEn1DkInj
	Qgvlm9SZMTIcDgdjfMI+9CFWEInrTk9EE1EW3NuiYdJK0Lx4dTN12s+JRtKWpQ0Xs7OtJSiyK/e
	hqc5xJEVtO7ZbeqS/8VKbMyV0scuketA08SWFJda1NS+iZUjA6RFiBtWSsRkfNRyjPJBfoh2jCR
	ZeIKRnAAatYc89DahoBZH552yKctgbuRohi6X2EI/jX78WQu2qNx4Pz4E+V0LY4G1Qv08UgQWUk
	sA3aD5y8muWCUzkLcbIp8XZJHGKxD9XQkJvq/sk7vXcu7NW3+v2Fq7gdbVCk1w==
X-Google-Smtp-Source: AGHT+IGquMYy9J6PpRL+56Mq61pt/MlvLwF1SpDEEd7f1j3VKZC02BPbkX5zBO+98uLrfjRn4M7OLg==
X-Received: by 2002:a17:902:e315:b0:235:f143:9b16 with SMTP id d9443c01a7336-2366b3e388fmr153621545ad.41.1750143795583;
        Tue, 17 Jun 2025 00:03:15 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365decb0e6sm72648825ad.220.2025.06.17.00.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:03:15 -0700 (PDT)
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
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 4/4] riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series SoC
Date: Tue, 17 Jun 2025 15:01:42 +0800
Message-ID: <20250617070144.1149926-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>
References: <20250617070144.1149926-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add known reset configuration for existed device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
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

