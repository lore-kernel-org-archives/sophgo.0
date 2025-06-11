Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DC723F296
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 07:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749628485; cv=none; b=u882x6aYHHWrDPy5Y1bGyHVdC3YSkKNAH2fBWtsVOCFk3afXGda3hJuU42Yj+9McXMtLFZ5POmt3DV4QN+mbpZAJ3OmPAEVj32/g/u1sC0BVW/+kwRd+fhwEsP82IfSdxUedDIp7z/rrqWF4lYaLH5A9BaE2r3QmlzRFwv+Uhgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749628485; c=relaxed/simple;
	bh=8GrpHyotFw6qoax0TmiooIxZmjK9mk3pgyVRG2KobhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwArnV0/Om9aJg77zjJbO042539zDOdeUxtINLbpYyxOj2k273EJ0+ukaDtZ8DvJ60bI1AEs3A7NSWjkKd9zhFFQUZv6MG2JaOZ5PVmXiPx6vJOCfh/w6qNOY+lnbyTF4LLa+oQ+fZJj/CKZIOjTXPeg66dnmvE3RaE+kxpwRfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7olrejh; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7olrejh"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d38b84984dso561237885a.0
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 00:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749628481; x=1750233281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UymgIkDUFmAW2hJ2k6aLRjbZp7eBofh8hO/e/40bbVU=;
        b=I7olrejhIuT1tKnXNWbXiZ3S3pxacNQ3+USltAfKlX5oPCCUev8/6sih9cjCGOe4Sf
         H2Y1pyjt+EBtt9b65lR5lfxvIFxm9QJPEOjqxnIYEeaRIN7+fi7Wu3KFwyd9ryHfFkhM
         aNzQFJegAMf7mtBmmoOV58nYP0XmBiMcBkFfgZS8Kj38DEzAduGJTEg5u70T5BLM2XBi
         DaUI2XThqCvfgcdSvoCoMhVADfZkikmCiY0MdZOPror/t1q1XKkN+wxD2j7K4mImkWaq
         AWZS1Cb/7BMAnH2522QPEgu3h9PvZ+9L1g2et0BCClZK/f2oqPf13sRYprf6DArlbmNw
         5LgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749628481; x=1750233281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UymgIkDUFmAW2hJ2k6aLRjbZp7eBofh8hO/e/40bbVU=;
        b=H3vHsrri1OjAlf7iWC6OMdVt46u4oVzOqufRsgRyhsGaOP50BcdYGfxjdo6sw6A5nR
         GzTrOzV2mRC65bxPWPwCBRcg40ax3dJRuXi4qcEoHiDNFDI6ID5VHaRS9ZQqKYxUxVCl
         km51WlXse38zYlatok4V0jgn3frXJKuO24/Z0uuR/RL6X8qmZwZvyXMBGB6esJxWspxw
         I50a2Hk9gSHEK47LkwkrU1wsBjma++GSWAJvmAby34fAaSnfr9+5JXMkZfrrcIx6ZQxr
         eB5a+jSJ3R9PdpUwxYPe+eLmzVmqvlkMVZt+GdD0GetaqBqFcuYNT3mXMqqlvoQLyNoZ
         /Xwg==
X-Forwarded-Encrypted: i=1; AJvYcCU+iGlszLsSpfzxecBDQywlTYJnrUNARVzh9v+J3GtcI1CNSNUGX7Q0bQLFIU0rkvnHnYByNus=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzbz/e7uCNIsqV01AUVlp6sJ2FZMQraF+SY6tR2cvMF1NosY3+R
	gHF+zVyRyh3qPOsi8wnxVVq2wu6xyzvC6VKOOSzbNZbTvr8n+Y8CKryZMEyvhgCM
X-Gm-Gg: ASbGncstobZUVA3MSpVJECbZLDpTl0dRS9yHF+l37DKY6A5wrWIazxW2e3M5KpVq9Fd
	4uUFLEBlEISSIBTCaCyX1v+Pcyil+ETBxi2m0XFutnBm0KtYtiA9dBuK+5H6xWXjLxl2Ig9Mnvs
	YNzgi/yf6RGVluT1wt2o+i1VcNApbwQ9IDJexTqM3SAkLfgVRhWY5C6ck9PaxgSeAcfRJIcl7rA
	Dl7Ztz42/vzNYJ25A3OhliQGi/FZOJE5lyvy6ZI6nyhZRzgDF+/d/74PEz+eFUPN3OsHf1Tzr+F
	+KGpRpHKviUW02f5k5srmIMHqB9uCLFgZH3njw==
X-Google-Smtp-Source: AGHT+IFcYfRlGLgXB5F75tcWrqlrnxZDfFg6hV8DyibBKxLYVxu4hGJ8Kf67guFwXWUTsXHBzsnNvg==
X-Received: by 2002:a05:620a:29c1:b0:7c5:562d:ccf4 with SMTP id af79cd13be357-7d3a955398amr275831685a.4.1749628481494;
        Wed, 11 Jun 2025 00:54:41 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d250d7c2b8sm832873585a.16.2025.06.11.00.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:54:41 -0700 (PDT)
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
Subject: [PATCH v3 3/4] riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
Date: Wed, 11 Jun 2025 15:53:17 +0800
Message-ID: <20250611075321.1160973-4-inochiama@gmail.com>
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

Add reset generator node for all CV18XX series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi    |  7 ++
 arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 +++++++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ed06c3609fb2..4c3d16764131 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/sophgo,cv1800.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include "cv18xx-reset.h"
 
 / {
 	#address-cells = <1>;
@@ -24,6 +25,12 @@ soc {
 		#size-cells = <1>;
 		ranges;
 
+		rst: reset-controller@3003000 {
+			compatible = "sophgo,cv1800b-reset";
+			reg = <0x3003000 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-reset.h b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
new file mode 100644
index 000000000000..7e7c5ca2dbbd
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#ifndef _SOPHGO_CV18XX_RESET
+#define _SOPHGO_CV18XX_RESET
+
+#define RST_DDR				2
+#define RST_H264C			3
+#define RST_JPEG			4
+#define RST_H265C			5
+#define RST_VIPSYS			6
+#define RST_TDMA			7
+#define RST_TPU				8
+#define RST_TPUSYS			9
+#define RST_USB				11
+#define RST_ETH0			12
+#define RST_ETH1			13
+#define RST_NAND			14
+#define RST_EMMC			15
+#define RST_SD0				16
+#define RST_SDMA			18
+#define RST_I2S0			19
+#define RST_I2S1			20
+#define RST_I2S2			21
+#define RST_I2S3			22
+#define RST_UART0			23
+#define RST_UART1			24
+#define RST_UART2			25
+#define RST_UART3			26
+#define RST_I2C0			27
+#define RST_I2C1			28
+#define RST_I2C2			29
+#define RST_I2C3			30
+#define RST_I2C4			31
+#define RST_PWM0			32
+#define RST_PWM1			33
+#define RST_PWM2			34
+#define RST_PWM3			35
+#define RST_SPI0			40
+#define RST_SPI1			41
+#define RST_SPI2			42
+#define RST_SPI3			43
+#define RST_GPIO0			44
+#define RST_GPIO1			45
+#define RST_GPIO2			46
+#define RST_EFUSE			47
+#define RST_WDT				48
+#define RST_AHB_ROM			49
+#define RST_SPIC			50
+#define RST_TEMPSEN			51
+#define RST_SARADC			52
+#define RST_COMBO_PHY0			58
+#define RST_SPI_NAND			61
+#define RST_SE				62
+#define RST_UART4			74
+#define RST_GPIO3			75
+#define RST_SYSTEM			76
+#define RST_TIMER			77
+#define RST_TIMER0			78
+#define RST_TIMER1			79
+#define RST_TIMER2			80
+#define RST_TIMER3			81
+#define RST_TIMER4			82
+#define RST_TIMER5			83
+#define RST_TIMER6			84
+#define RST_TIMER7			85
+#define RST_WGN0			86
+#define RST_WGN1			87
+#define RST_WGN2			88
+#define RST_KEYSCAN			89
+#define RST_AUDDAC			91
+#define RST_AUDDAC_APB			92
+#define RST_AUDADC			93
+#define RST_VCSYS			95
+#define RST_ETHPHY			96
+#define RST_ETHPHY_APB			97
+#define RST_AUDSRC			98
+#define RST_VIP_CAM0			99
+#define RST_WDT1			100
+#define RST_WDT2			101
+#define RST_AUTOCLEAR_CPUCORE0		256
+#define RST_AUTOCLEAR_CPUCORE1		257
+#define RST_AUTOCLEAR_CPUCORE2		258
+#define RST_AUTOCLEAR_CPUCORE3		259
+#define RST_AUTOCLEAR_CPUSYS0		260
+#define RST_AUTOCLEAR_CPUSYS1		261
+#define RST_AUTOCLEAR_CPUSYS2		262
+#define RST_CPUCORE0			288
+#define RST_CPUCORE1			289
+#define RST_CPUCORE2			290
+#define RST_CPUCORE3			291
+#define RST_CPUSYS0			292
+#define RST_CPUSYS1			293
+#define RST_CPUSYS2			294
+
+#endif /* _SOPHGO_CV18XX_RESET */
-- 
2.49.0

