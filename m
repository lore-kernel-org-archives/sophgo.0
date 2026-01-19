Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748203D1CB1
	for <sophgo@lists.linux.dev>; Mon, 19 Jan 2026 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768840270; cv=none; b=sNqs32ceJLPItVrBKlSE4ogewmWtEyKPD/FLh1LGS8EDw+SpHCbXI9l+IH8c3+bYlC7pSK6PHiA/vhR9fRqFZR+jdOhE2z6SSKNbYudFJAZlR/W45dGK2K9JcEdtVrhj38Yqg70g3GphGI90DiyMtQ3/qnzgpKgEPNq3hNNNn/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768840270; c=relaxed/simple;
	bh=X+s12PRGw5dEE4UNo2e5A0PjiGovDts5oKNtEN72P90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KiA7vfF8uTXm4297nYG17oPjjgsizfz07CFw/oHed9ag6ERQZaquh7cVvUoBGuGhOR6RAWaDEKgpR38qoJw2JRfxqJArJicqOqYi5Ysb43FLpoG4S5GJE7OzXiqi4lN0jt0FnUYNyHK4sl/WuQ77lvNBf6UuIi/ejidsmWd8sAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/ciJyDi; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/ciJyDi"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso29599225e9.1
        for <sophgo@lists.linux.dev>; Mon, 19 Jan 2026 08:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768840267; x=1769445067; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNGQeFUv68F6qppT5//wf2zYpim+0plexrvmi4qsXjc=;
        b=V/ciJyDiwy6z73lL490qZYvPArpe/a2cDZHdJwzMQRKckY7Lj8m4PsYleDN0j0fuzq
         BWTw/EC5gG8PNWp7/cHl81THCu3sU33XPKhL5F+S1AknhcIJ6hTbq1iUN/dQ/ofuUkR3
         3pnGwh+up7UMRSOQ8b829Eif6B/wUYHFb1UFxq7CZEN0T6hJRNJg5wB5A6YjPhORVktN
         6gJx2snW3XSkQ8wTaZDq5oeN3NiMsZD4HEla6SEkkRZ2wttpNmlzo8lK5Aq+KXANQuRg
         HL3erC0rg5w9DPi+T2VpVy43iHTMv4x5AwJ0fNgJB/BKJK8uCRNqwML/lj8xHH6rtEM9
         JqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840267; x=1769445067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNGQeFUv68F6qppT5//wf2zYpim+0plexrvmi4qsXjc=;
        b=moMoZzTLDag/j1odwR/0IxXQI/HqUfUGDu6qy42MxfJnFSp70LIklTihS6UWQpuSwL
         lVekOtO8cQY86aigtrHHDzWNqXFgkXZsdRyY0HOhqTxTlv79EzNfBjox/84nAr0Zhv5l
         W2gO330TuzIfy9swnVZGrZ8dCxnI1+nCKDc1noVpd+9On80+AFx31uRh+3TsyZrbYzI5
         k1OgUrQcc3QnLOSgMAnQWwiz/AnrpCKQnmAcxVAKlfxOL4Z5O3eATVdHhch0T73B+al3
         JjNXAnOyWwGzjyjQherLAGEfjwnVFrXFR8PDfkGvHNQ8PHkH9mOBWrTZ0Q0mTk5hxcxf
         LQAA==
X-Forwarded-Encrypted: i=1; AJvYcCXG1QWEZ8UksxgneolMlLREez3iJ0qkBansnXsM8eNL7qfbDYd5rIDs9YHRV1pJaYXlH2CwE+U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9lTHgr1ZmUInhuUCgnYUNTQmR7aRD+c3xVlxhypy0lGsLLSUM
	iRJK0cUPLmHjti2+wZEw/NKWysJvcyYj1nhlMHMMMQNlTj0rIkL+KlPU
X-Gm-Gg: AY/fxX4TO1LvvgVhha0TPmfjjbqglQrbaMsvn6LUqWPwlEC6gqBYucZQAZafVYDN4Dp
	2NJC3HnImHoP9VirgwfROCWQl8uDm/uH7D2sLkHWSg/JmX7VGOVmmg4eddNwB4qElN++K40kXzp
	v5raTmLb/SAVJ6Ipo/5/9ghJxAQRXaxYbKh1pmiW0VRrPoFfz6qMsFlX/XH/CE7L5a2jaeIOWe/
	Xqzacis0Zoceqr2udJaPUG5a2Eu2x9U+xomswRXESM0MsX8nj/GMrtgTQKO8d0NvoKKqdr/VqOW
	w05htj/bTasME9ejJoLNayRHfAWuFuVLvEM0r2Sau49gUdmr98QMhQ0LvAdsF8IRGMyauYLzPnS
	eRS9aILWPVnsIhpdZdj2pQ6FAjgMK9Lq1uOxo0H0F/ZGJblMOZfFl9QdRU6Hb9O6B5zjt3UpnGG
	nZftl0rVbRRq/mLvKo77hxoqdI0gapI2kQTpuU8g/BHg/X
X-Received: by 2002:a05:600c:3484:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-4801e670bf9mr159794485e9.11.1768840266726;
        Mon, 19 Jan 2026 08:31:06 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879537sm201666795e9.5.2026.01.19.08.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:31:06 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Mon, 19 Jan 2026 20:30:47 +0400
Subject: [PATCH v3 6/6] riscv: dts: sophgo: dts nodes for i2s tdm modules
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-cv1800b-i2s-driver-v3-6-04006f4111d7@gmail.com>
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
In-Reply-To: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768840243; l=4275;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=X+s12PRGw5dEE4UNo2e5A0PjiGovDts5oKNtEN72P90=;
 b=r9Z1y74tcJ8gis3RDlg74cE+YXsoSshHRNU33vg0Nu0vl7bHYJmVj2LjZTiPZ8Sjv9vKTCkv5
 kS1aMfQsPoUCC57nRHqqNt4XubsJOaZPwNoX290TDNqfFrgV2YiTRLS
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Introduced I2S nodes and internal dac and adc nodes as well
The new header file provided in order to make DMA channel names
more readable.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x-dmamux.h | 57 ++++++++++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi     | 55 ++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)

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
index 06b0ce5a2db7..ebe5e8113939 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include "cv18xx-reset.h"
+#include "cv180x-dmamux.h"
 
 / {
 	#address-cells = <1>;
@@ -448,6 +449,60 @@ usb: usb@4340000 {
 			status = "disabled";
 		};
 
+		i2s0: i2s@4100000 {
+			compatible = "sophgo,cv1800b-i2s";
+			reg = <0x04100000 0x1000>;
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
+			clocks = <&clk CLK_APB_I2S3>, <&clk CLK_SDMA_AUD3>;
+			clock-names = "i2s", "mclk";
+			dmas = <&dmamux DMA_I2S3_RX 1>, <&dmamux DMA_I2S3_TX 1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		int_adc: codec@300a100 {
+			compatible = "sophgo,cv1800b-sound-adc";
+			#sound-dai-cells = <0>;
+			reg = <0x300a100 0x100>;
+			status = "disabled";
+		};
+
+		int_dac: codec@300a000 {
+			compatible = "sophgo,cv1800b-sound-dac";
+			#sound-dai-cells = <0>;
+			reg = <0x300a000 0x100>;
+			status = "disabled";
+		};
+
 		rtc@5025000 {
 			compatible = "sophgo,cv1800b-rtc", "syscon";
 			reg = <0x5025000 0x2000>;

-- 
2.43.0

