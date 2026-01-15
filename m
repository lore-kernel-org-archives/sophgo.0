Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B677B2FC893
	for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 19:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768504706; cv=none; b=OuI3qGAaGcGVpQT6bEwvCIN0E7KYthGSh0o0r+gZgTbEciv1uq5m1KtGZHbEiNAcK3HPlO8EZUtYLGloHJbgtjU7+KhF/1rBxjNBAKSDej+nKCjOyZSM/mFd/NfMhXEbFYKaCtVt+dZEGDejO6DMIkSUX+Qa/QcEFpgWBeGbzCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768504706; c=relaxed/simple;
	bh=ZvpnRa7g8hCkE7r1q64LPBBaiWff0x2lLnMd+0VKnb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YsApEjiBgOHe6fvBGa8QD9sOMMD4xaAEfipClRsOJfEkP0GXxk+HAwUSR7CY+9UaAej3dHCqRxspSjXIAelQDys2LNetGF3V38aIIPXxD4/ZbAR7SS+YUtlrzJS09DDJ+Yc5BE6Wa9UP9HH09EznJK4Q7d6f5QWIwhg01Ci123Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILWgz3If; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILWgz3If"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so8289005e9.1
        for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 11:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504703; x=1769109503; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bZybh6ajNmTP3emcxjHSZEZGR4b5MsX3LqH44SKh2E=;
        b=ILWgz3IfZZUvpxnZs2KSiBl52dChJqst080/zwnAKP8LZW7/SBsVFF4UMeXsw794a+
         EYUUtRTimfI6sTHxDir3QTsd4rAN2Fe8kQrY3mM4e3vPWpQCMAfS83FMkDa2ogCK65xd
         Ia0n1gVuiCXkEHo0hU1GFR194ihOB3kwYYej/MPlHw3UMW7iMYJg7/L2Pd+wTnyaCcHO
         KDEvyikM7umKqJMfrZmyajOVVoPCYD74HFQ7/lLxuJAT/w6qyulqYhg++bNfKnOe6dXz
         +fOY+S9Fveq24P0fr0Nb2P7rIN7SACMj97tX+rzNbL/FJdKGa9sX+OgHv+/k+SgkB4jD
         Lqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504703; x=1769109503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9bZybh6ajNmTP3emcxjHSZEZGR4b5MsX3LqH44SKh2E=;
        b=PE1251kXEjti/+GnSVMfBCgv5DDbj8Rk8q+Z4PALtEwue3nYiSS72aaazAVuFaMn2R
         YqjEOJsD0ALl9IH/6mLBcLE4x1UGb+aL1D/Cbj6eYpWZfuZxdij/JJatf60qqSW60jLq
         42R8uSw0bVYkhMc/oz4CFZjX9r47wvuiazz4HaUQCFUEJRJ/sZXG0hbdUkXL5zPzVuq+
         zjZaETnj682PrjHsJsh80wRsDrGFYeqngiTphBoHeN3AhqUHn/JGnfI+1lg8L9W6zpgr
         nSShoEzAL+090kSbVK+iXMCeKy+GMC6TnpHTpTvy7yOelCct85Tlc1sjc3ZJ2NEwhtAG
         A/QQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3hnn0llyuA5D/g/syvSBmCRqNqGO2mbHA/ohXDFQx3DY12GLzL/TYATPYAeWswDGp2e5i8pQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTrUnal8LgNzm1VZbM0gtSKGNEgfjWeN+WlaVi7g9i8x15cX/S
	k4ZEjFEe6xowz8YMkre6161ERRjW0OWXIGJPOX/MC+9+SyojY/eYLjtC
X-Gm-Gg: AY/fxX5Kpr7m4Joyf54Huxhr7wClH2InK4rcF6Eo2N/7CrgaqwODGamKknQwrR5JXsM
	nBHF/uzmmAE/nk/r7SKFPV0Iw1uZYgqLTDluXBT9npDch4xjIeio2dTy8Z5hqbtPCk/Z6I5suKt
	wLQSd2ie8i+eDjXyfrFArvC00HVBHiQ5gdLJLFdoFg+pTdrlW+j1+NrdEc9NE5SP8FIkyZU6vxN
	TOX5HTxK00KCE2lPRLvxDfp1ufrz5u/nfbLx8uiEhnF6JxQxnFASxDGkrI3HEfw/BxZUXZQQCUT
	e5RHcKkfBMFPLbDd0ggMbx4cYcL3p81ZtH7FktXuAuo6btyg/+u+P3NRMjKfnS+WNNLGwRuQzH0
	P3/uEE2Ofxm1WB2TYoWjRCVIwyxyiiUmahElazKWqlHaoKA6UdNKN6XkLhdxQEh9JqsWQ/9Gj1M
	xZ2W0Onxp/1/MFCaNTiB9ItjjvLwXUUyqQcfpms3+Pijke
X-Received: by 2002:a05:6000:2209:b0:430:f7dc:7e96 with SMTP id ffacd0b85a97d-43569bc59b6mr523652f8f.48.1768504703038;
        Thu, 15 Jan 2026 11:18:23 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm692734f8f.9.2026.01.15.11.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:18:22 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Thu, 15 Jan 2026 23:17:44 +0400
Subject: [PATCH 7/8] riscv: dts: sophgo: dts nodes for i2s tdm modules
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-cv1800b-i2s-driver-v1-7-e8b22b8578ab@gmail.com>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768504677; l=4041;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=ZvpnRa7g8hCkE7r1q64LPBBaiWff0x2lLnMd+0VKnb0=;
 b=vwb7UYqSlXo3rPP9yGKTfWtMY3ZhNyyOZjfBpq/qKetxn106Ow7lZhWEbkNRzwEkQv1jaiQWa
 4bJ9F94rEA5BNdFZq1EVeJ1mjB3FJd8ZDKSoSUN8dkyyucDYqKQeG9n
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

New dts nodes for TDMs and readable DMA names

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x-dmamux.h | 57 ++++++++++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi     | 49 +++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h b/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h
new file mode 100644
index 000000000000..6314bf6e9dc8
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#ifndef _SOPHGO_CV18XX_DMAMUX
+#define _SOPHGO_CV18XX_DMAMUX
+
+#define DMA_I2S0_RX		0
+#define DMA_I2S0_TX		1
+#define DMA_I2S1_RX		2
+#define DMA_I2S1_TX		3
+#define DMA_I2S2_RX		4
+#define DMA_I2S2_TX		5
+#define DMA_I2S3_RX		6
+#define DMA_I2S3_TX		7
+#define DMA_UART0_RX	8
+#define DMA_UART0_TX	9
+#define DMA_UART1_RX	10
+#define DMA_UART1_TX	11
+#define DMA_UART2_RX	12
+#define DMA_UART2_TX	13
+#define DMA_UART3_RX	14
+#define DMA_UART3_TX	15
+#define DMA_SPI0_RX		16
+#define DMA_SPI0_TX		17
+#define DMA_SPI1_RX		18
+#define DMA_SPI1_TX		19
+#define DMA_SPI2_RX		20
+#define DMA_SPI2_TX		21
+#define DMA_SPI3_RX		22
+#define DMA_SPI3_TX		23
+#define DMA_I2C0_RX		24
+#define DMA_I2C0_TX		25
+#define DMA_I2C1_RX		26
+#define DMA_I2C1_TX		27
+#define DMA_I2C2_RX		28
+#define DMA_I2C2_TX		29
+#define DMA_I2C3_RX		30
+#define DMA_I2C3_TX		31
+#define DMA_I2C4_RX		32
+#define DMA_I2C4_TX		33
+#define DMA_TDM0_RX		34
+#define DMA_TDM0_TX		35
+#define DMA_TDM1_RX		36
+#define DMA_AUDSRC		37
+#define DMA_SPI_NAND	38
+#define DMA_SPI_NOR		39
+#define DMA_UART4_RX	40
+#define DMA_UART4_TX	41
+#define DMA_SPI_NOR1	42
+
+#define DMA_CPU_A53		0
+#define DMA_CPU_C906_0	1
+#define DMA_CPU_C906_1	2
+
+#endif // _SOPHGO_CV18XX_DMAMUX
diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..9dd93e028ba9 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include "cv18xx-reset.h"
+#include "cv180x-dmamux.h"
 
 / {
 	#address-cells = <1>;
@@ -448,6 +449,54 @@ usb: usb@4340000 {
 			status = "disabled";
 		};
 
+		i2s0: i2s@4100000 {
+			compatible = "sophgo,cv1800b-i2s";
+			reg = <0x04100000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_APB_I2S0>, <&clk CLK_SDMA_AUD0>;
+			clock-names = "i2s", "mclk";
+			dmas = <&dmamux DMA_I2S0_RX 1>, <&dmamux DMA_I2S0_TX 1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		i2s1: i2s@4110000 {
+			compatible = "sophgo,cv1800b-i2s";
+			reg = <0x04110000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_APB_I2S1>, <&clk CLK_SDMA_AUD1>;
+			clock-names = "i2s", "mclk";
+			dmas = <&dmamux DMA_I2S1_RX 1>, <&dmamux DMA_I2S1_TX 1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		i2s2: i2s@4120000 {
+			compatible = "sophgo,cv1800b-i2s";
+			reg = <0x04120000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_APB_I2S2>, <&clk CLK_SDMA_AUD2>;
+			clock-names = "i2s", "mclk";
+			dmas = <&dmamux DMA_I2S2_RX 1>, <&dmamux DMA_I2S2_TX 1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		i2s3: i2s@4130000 {
+			compatible = "sophgo,cv1800b-i2s";
+			reg = <0x04130000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_APB_I2S3>, <&clk CLK_SDMA_AUD3>;
+			clock-names = "i2s", "mclk";
+			dmas = <&dmamux DMA_I2S3_RX 1>, <&dmamux DMA_I2S3_TX 1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		rtc@5025000 {
 			compatible = "sophgo,cv1800b-rtc", "syscon";
 			reg = <0x5025000 0x2000>;

-- 
2.43.0

