Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE902E8E12
	for <sophgo@lists.linux.dev>; Sat, 17 Jan 2026 20:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768681194; cv=none; b=qeNg4Mx8Zq7nfe3UyjE1k4crDuZ4IHVuGl3JfbV182qyDR0V+rH0p2ckq7OMAPcqffc4isDBILXsF5eEMy69E76HA3lucift8HS+91nV4E4mldiIBRqa2/hYW5Uw+WebA2ipPK/yXbEl8W7MzvLunvaIY/v6f7EbqGctN68P2j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768681194; c=relaxed/simple;
	bh=g4t3ASBfpTD6MsKZ16mnOZXRVvOWIeS8pZgY3yatJ+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mgJXv1T/hIXcmYjZ39DXDxjfzB2ngWnrwACfuLZW988Y05ECAgGqtRzWFrzDFP69+Yt7wluWz/i4zDLvNSgVIcvdUf/sTabjRiQiueZhdgZi3Zwrg2HqeKXZ+QdOOno5niJSgguHMqxTOyZwD+Ygq7vYOjp3todLxxoAn4DWZJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGPuGycN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGPuGycN"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so35724635e9.0
        for <sophgo@lists.linux.dev>; Sat, 17 Jan 2026 12:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768681186; x=1769285986; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aFd557jOvMya/P6LqfoMyYvVuvH7cOmI8lbzWePx/N0=;
        b=aGPuGycNEZ77ixfxp3fZG/VAKh6dwxcVFKD8NzvKDyhx9uahSyGB511HGwlX2ezVWy
         AN6R+D9Ux2+NyJuyL/fxURPiVkhf2J6SV9BawUCnnXF1znoL+MkwEUbIXq44EHJo+KYP
         vaqkE2183S+7Z0GSFnrbnDInYc3k8tG2hC1wZlrNgJ6yf3Dafmg7ydlEA9+yrHHMtteH
         5+oYBjgP4rP4hNqkRbX5d65EHlIq/p/Im5ZPPn0SUEPWDq2ugQD0czzN1qjzDdEM45Yp
         siZfoxWGHm9i9m6R6ZBAdwQk4mK5ipZCY1QL+DsMuS3SHgk/JIufJ+ca6GuJjZqotIok
         H23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768681186; x=1769285986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aFd557jOvMya/P6LqfoMyYvVuvH7cOmI8lbzWePx/N0=;
        b=uSLFmmFtcE+0pWlq0Xqz49AXC6kkvzlMl0Zhc1fdyRh64uDkxMKfpb3/IUPgEqXahQ
         ZEmDXd2rbBPj90z6p6wc/+OVjyi98HoJDPjQDzqFyW3PsPgORhRqniG8Oy/LQf2PgcjM
         THXgslqkqfvSw0ByIKIeoRMR2OZzRVFF7/RT0Zk+/iDOmC158nICta8LjFpfENBHIcnL
         UFfqv0W7ljh4wxhqiDtZBdfDL6sZudMT5RkmZgYmjsurch5hFVL5xLkkzGVyPVB657bA
         tmF6NGt9eMSikAmrCMSpULgY+X/J2i7rc9i9GkMSWuJpzPEIKh6UIUGMcWYs8rNOo4N4
         8hvw==
X-Forwarded-Encrypted: i=1; AJvYcCU14O+EonKc7i4P1Ez76RL81Z9BTeKadne9KuRX7NpgqraCdjMZhwe2a5HFsIdvcnjOJ0Su65w=@lists.linux.dev
X-Gm-Message-State: AOJu0YyN+DgWc2EsjHrGuZvxTcG2d95KbB8y2u2uiGL0rjrEuOlNpsBg
	dfgBP5Lu/ttI7pjonb6BIIKli73K9dr8geIMSK346BwXVLyNLEHEOsEl
X-Gm-Gg: AY/fxX5E6hNyOJsC9d5t8pAnz8aEM0KRYCOJr2SXA8IfJyy6B+kuVpsqVv750RCWK4I
	oc0hPaSi2Vh9NN/0KprMU/qu/Z/AH5Xz74RV1WMhFIIDRweIDqC/zvRpCnJikDvmheBnJJIoutN
	QxiOfUFe34NBewJWqyZ+dJ98RgoLdS4NdbdzKf9e4Im6LfMexx8eXDOhCTKZ6nWqSXEYEEge2YT
	NhTwcbMKLBg86KBzudAWfQ0+1ohNoZVLFxRlYE/PyEL7uAu9dW5nfrjXjHz5bwHkioLbWmDe5Xj
	6+0Xegd7s+Qt6JHFTGp91qrsF3XF3SUpqBnK/hlyZvOw2y6BKGSAn1hAXLPZTJP+lq27rLKvFjJ
	7GProaEijRGiFmPDVg5GnlQay1SWvgAzJ9LIpZyqFvN6IgiOehi57I8yTYy4oS0qZOjtB4I3DYY
	sZ7X4otfqEM43QAwPTsKHiNlDfP54GkMbOCNTnvlTsOzI3
X-Received: by 2002:a05:600c:4f8f:b0:47e:d774:80a6 with SMTP id 5b1f17b1804b1-4801e34e81fmr87603705e9.34.1768681185822;
        Sat, 17 Jan 2026 12:19:45 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879542sm112402295e9.4.2026.01.17.12.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:19:45 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Sun, 18 Jan 2026 00:18:59 +0400
Subject: [PATCH v2 7/7] riscv: dts: sophgo: dts nodes for i2s tdm modules
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-cv1800b-i2s-driver-v2-7-d10055f68368@gmail.com>
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768681160; l=4478;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=g4t3ASBfpTD6MsKZ16mnOZXRVvOWIeS8pZgY3yatJ+k=;
 b=IP/61jcli7ye+ePhqXMU/dvjwgiJnBsZKE2W1q/UjFBh0BZ0qWBFmNKibfoStAitWRS+TSq1X
 s+qHIH+9TLWA4M+O7mS88p7iE9XRfRSp62cdieG5oTFmNQ5FOulvhvx
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Introduced I2S nodes and internal dac and adc nodes as well
The new header file provided in order to make DMA channel names
more readable.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x-dmamux.h | 57 +++++++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi     | 63 ++++++++++++++++++++++++++++++
 2 files changed, 120 insertions(+)

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
index 06b0ce5a2db7..5a56951f7e4c 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include "cv18xx-reset.h"
+#include "cv180x-dmamux.h"
 
 / {
 	#address-cells = <1>;
@@ -448,6 +449,68 @@ usb: usb@4340000 {
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

