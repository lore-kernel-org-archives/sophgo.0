Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03BE235044
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749628488; cv=none; b=XPlcolXjkSLsHQ5YYttYV0qBqpq3OQ/Ttrw+3NTbtaciPlCE84CgEfv7Tk+jxC/uglzGSugeiHPnqCVxuk0KrwgrTgy5ulNqGFzTAs/z5+0dIelW9W14BFKbGWCvYtS7GAzlVG9K4Ts5hy2HppA61nMVo548sns9G/ad/RBPWvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749628488; c=relaxed/simple;
	bh=VluJ5mmYbGngSNNUREfnzarLKZaoN59HUH1rSdoa7gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzXeQ0GlzDFdY16PHF0yf97G6FpQGHK2WWwDF2/acHqEQhdgwxWDOIOohOAeaF2r3FS0dTh2pb89IemjRU0bBg9NJoPmOLvvvTWu/x1Hbubh8r2rF2pRYVxtu/mhNaGI4DAsl5OrbNZMz3b9ViOtyRCYK7O4YYyK2pHSQf+3XOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YW7UG+EI; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YW7UG+EI"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d098f7bd77so71406585a.0
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 00:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749628485; x=1750233285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhFbypeFAxQ8f5bzL+8ikB/KiObjW6nRA+DZBhJ2u9A=;
        b=YW7UG+EID5RzE6X5Dr6WO8V0E9gUqHH7yuoB4pkHxBFLif+cxcYl2o+Pa2zv6nKrCl
         5AX4y7FGqzrGTxNQlQg9hl9YCii33hPF76ESG7/Vr8JxpE1rY1VnQFdHPNd/9jFuhpO+
         wAyDuv66rZf2nEIxLzOrdZ8VwT+IBoND+YBXJfmdh+ksSz8zYxfFFp9DIDp03FAB8vOO
         fKPaOodDZuW9aOnh4mm+who8kKjrgfTVxRs289kZUaDeZCQYWMR3zHTppYGQV16tzkHV
         7fMlZ1EwHT7NZCiXdtrGZh178JrEuw9WTq1+V1PMv3sTertvxO8W6/Lvgfmo43DZsZVQ
         ZrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749628485; x=1750233285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhFbypeFAxQ8f5bzL+8ikB/KiObjW6nRA+DZBhJ2u9A=;
        b=ApDqJMfjVQXyRJZmRBjjKlxhiE5jh+J9qvYUPahxLsJOseWF9Ec/P9ffTjWoZKffDE
         WN5cepmtiLkvtBSsGqplwJ7asA8DIbY8vGOm/ioNejL2YYDrAe8xcoLvfkaTvk1IkXdD
         uROtJR9cOd8sCu2O/h/NVHgGye/nqNnFVpcukZEFvyMwQEe+LZcE1PFVJnQIsfTk8wGp
         WqFZJKq7EjtdYcdRGSFr5O2uD+zesvfThbv6vf4ht3OfmKdQiIMoiJfTUmPKim4b1QBK
         Z2F9t7N59aDlwHlVXJCxqKTuNe2rf6IOR8RPh+Jo2StguIGMEdyncJ4waBhqP6niSFXN
         Apkg==
X-Forwarded-Encrypted: i=1; AJvYcCUJZxQ0cYsw9J3BXg9ht2cqEYrLS5x2vJ/lNX4jeNmUIC4ce+ocd2cfDidJPV9ZM/XqLdZYCrQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5RrEYeejS8Rd6D8vciMgFeUYtYsZqe5Nd/MtHj5h1yCVC/SRL
	WhS80j/k2Wn+mrVkKG9ItVqcuhg++c0yWJTUP0DPITAB6hTq3vlYHqEG
X-Gm-Gg: ASbGncvI7A3xhi/B+9Lz3rjYGesOymamNc9Q36VE89xvb38zPddXTILjgdIqyG9ZldU
	xZnZOTGtWT7zK7zTmqapSnAjAI+CRMGW8O2FlM8kzfIEduOWfudeNafR4UOp4/VYlsDZgn4l7ao
	0h/diJO4o5mdWYzBodV8SDab0ULLkOl97LetNRTLUHa6VctJ5kBDcqkr64dqBi5E1Ld47pZw2S2
	od4jTTsMoBmluoVh9zaYv8i3iA5AscCMY+RUhJYc1xXZhJX9U+WrNrDEzHXHS1HlXqnWHhYI2NR
	x7EpxvxlIj3UA6bZjGhg13rgIJWpXW2i1kODEQ==
X-Google-Smtp-Source: AGHT+IG+bZxDKiJkiUxLzUSj6ZSrcG1zMQKfyU+XGW5MIGqNr/oq3BfFTD+gZoUkdiX7PQSX/dupCg==
X-Received: by 2002:a05:620a:460e:b0:7d3:9e56:6345 with SMTP id af79cd13be357-7d3a88088c9mr358828585a.10.1749628484647;
        Wed, 11 Jun 2025 00:54:44 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a60a1dbsm822918885a.56.2025.06.11.00.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:54:44 -0700 (PDT)
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
	Vinod Koul <vkoul@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dmaengine@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 4/4] riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series SoC
Date: Wed, 11 Jun 2025 15:53:18 +0800
Message-ID: <20250611075321.1160973-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611075321.1160973-1-inochiama@gmail.com>
References: <20250611075321.1160973-1-inochiama@gmail.com>
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

