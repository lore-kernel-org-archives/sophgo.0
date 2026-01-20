Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A66477E2E
	for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 19:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768935993; cv=none; b=Lz+9ezJVmWtDCOUBdD8jQx5uvo9XfPdF3iN6lP5Vo1HtKg+oVrXIu4Q4GLhCzIwcOIm5lWqJlSezJW1D4HP4mwvHmhKrAwV4Yx3gbf+LCwqzD5DXcP5QGMumUtsUHMY3midTiTDNWbAru8Tq/dD8LRxFUHUc51+406+4Dw+f1j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768935993; c=relaxed/simple;
	bh=X+s12PRGw5dEE4UNo2e5A0PjiGovDts5oKNtEN72P90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bjY6dyDkXqO+IjDQntmEKasEr8UaervFm3m+2DF/wjPHnS2eZP1P7XDXY8MpqiNGRK8rWmvWXo+4RLvvFC84xTQsP+j1UU+z7SGzPTJ34DtDi744AO80u3yzF3E24Rr1pGCfvX2Anxh0JdVaOm36xNVSoJufhQtwIvO9bggqwQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTifseP1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTifseP1"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so46144135e9.1
        for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 11:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768935989; x=1769540789; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNGQeFUv68F6qppT5//wf2zYpim+0plexrvmi4qsXjc=;
        b=KTifseP1jtfSlw0FaT+NcCiqER3ic0tFS6tMhhhODqommK+zWzMQhIJvlIqkVdoW7L
         UryBjpb1u/Ag1Ad2ODJes6lntwyilsTuJ83XWxM5D/7IqeF8Tp1H4z1yb2bzb+ZiwHJQ
         uPr9AxRT0h5lkoE/iZtcJJp8m08nzYKoOvdWSdk3u3Qf/m//luODN5NbK1/uUZiKS9hY
         4cmGBJTZaDUsI01wFy1OtwyGvbJh8NDZkpc5OubQJ9lGa18gu4yTLQCDJ/wAqzRLa0sC
         roL04gJnHupMwnfKFad4Dx7mUbMhhzTSVvhxc10T5icNLRBzgc0BZZJQfYBipijoQygl
         E2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768935989; x=1769540789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNGQeFUv68F6qppT5//wf2zYpim+0plexrvmi4qsXjc=;
        b=OuTOLUe7/unNqKJll7Of2I9DouqIKdTrziX87o7IWQPJg8okY0Ud0YoSPVTFByZz2k
         aXENAFyYncU2AN7qd95B/HguBGJ63/C2sjLaOqgEccozzmvbMj+s3T70GlCu+C0joAhD
         zFsVPEiySOk8xStbg4YoUI8MxuHGnhhAx1eRM5mDYGdMXkL3PqhGsjSrEXGYiMEkCBQt
         uosuF0OgiTADE0hWycLJk+4uB7KihwltvzxUw1DR667erv/Ku123jmRxZnFbuYyqjm/u
         cl3CQ9KQSYq5Hd7/oAPgPnv469JXX1PaJkirbgDPky0j3USOSvgQM3FYxK+XrTls5jcG
         Fvkw==
X-Forwarded-Encrypted: i=1; AJvYcCX7PF7qYb9DsISsfkzmTLeppcdIqMQLShGRhrnqk5fcEOLSra7vvRP6taGNdlIZo51L5jiQdEc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKkRYGGzuxB6CwqHhkx9AD+J3eiA6YjXzTDz6KY3nbvlAPqYcD
	nziYC1yms7fx53GI/R81oBwFjfLIUj4aMjtKklhW8vtd4dGvlnQOcStS
X-Gm-Gg: AY/fxX75zaZ5hGiFx9OyiLDQd4H6SU9+9/7aqgAZAT8lJW1uEMqM68JPBuTCsv/psoI
	a09t7p6U9s/HzOLhVopEcXKgQMSQqv7lmL9c5orluLx+Gagx+CPsXEDVdzpulKmW/Cuos9QNTPp
	FeOYhRHZQfqTSqcs3NJsqQswznr+ZThKtve6gVZFD/eQdp1zO6VOzR10V3n8VdNYAVO8bRf85lU
	Nr0PKmQ1rT6jDgLwm+kqXh2wsekOfa8fOzCyjb1bzQA4HA7n943Nv06+iQ1hjaludcbJFM9UAQ+
	CxiTXOdHO9xr8BuFGT8I402EWLesB8UIaXqQyjd4Vm+6rMTz6kSabtAu9/MuxiiGy9uVfBIpvZ8
	yUi03xS82hWTrn1L18BWfhPej2mjRxImBnwsUGW9f/Kc0mmVAeSDKxOw3xFb75woHr1v3BZsifH
	sEsukqXo5803KJfhsCQnsvHgb9wOG80YCip36s8HSNgYxv
X-Received: by 2002:a05:600c:1c13:b0:480:1dc6:269c with SMTP id 5b1f17b1804b1-4803e8046a7mr37670375e9.37.1768935989139;
        Tue, 20 Jan 2026 11:06:29 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804244c6cesm2005735e9.0.2026.01.20.11.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:06:28 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 20 Jan 2026 23:06:08 +0400
Subject: [PATCH v4 6/6] riscv: dts: sophgo: dts nodes for i2s tdm modules
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-cv1800b-i2s-driver-v4-6-6ef787dc6426@gmail.com>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768935966; l=4275;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=X+s12PRGw5dEE4UNo2e5A0PjiGovDts5oKNtEN72P90=;
 b=Cwq4vdM8lAMNexXf49piuwk9NPj4tlC29MXQjZSSksluPp5PAggrMazkMg2b0Y8QaQtdqFUDc
 1DAE12pFXwmCl8OKZPgqfeXsmPUQBgO22kRGdD2kMXHTTkzfheVfobG
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

