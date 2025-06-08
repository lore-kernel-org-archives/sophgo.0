Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26DB2676E2
	for <sophgo@lists.linux.dev>; Sun,  8 Jun 2025 23:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425022; cv=none; b=Lkb/XzN+VQkn9xq7ogj/DVs8DMQl6hPeKcZnJtHmZadcDUFEYScbnCoFgnzgmdiRqBJ1LKZ7DYM20/YdC3DgkXt9b/ADqoT5aBnhIjInqI7XqOC0J9fnz6WOpHngNvmiI4JpOiErfQMwwmQWSX4eHFXb9VKE5s1QwpD1qxS7qZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425022; c=relaxed/simple;
	bh=AHpEN/dJhul4v/WmXKedW/4rDaSNB2ehr9j/Q9PtQqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cj8txkVOQaRPZXRwPWkq/wnJ4fCnCIo2dncaOPbbJTFF3n3nnDGuGue4Ti934+oxTdpHIWr+JbIqHHn6X1OjKp3FS2v+VbObY/QUpTiWu0FUkep9K8FCSSgy3q4aMiz7jnityAz3oxZwpSkWaX0dNh/z7NBvEaKIFszbU9hxkVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZqirUrK; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZqirUrK"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a442a3a2bfso69841401cf.1
        for <sophgo@lists.linux.dev>; Sun, 08 Jun 2025 16:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425020; x=1750029820; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyOPT5bb27xpSlfKUprjkFPzASHSgU4t1PeuReJqiO8=;
        b=TZqirUrKUzIJIJdM+fqFk7Lqtq1K1d3tZpOJfcMi4UF3jYF+4iv6Xjh6ta64j7ZxmF
         GEPes8Oiwid3etmjvve3KLRFwhC7KavD5+m34vVW757idufucnEZvxX5PPT2+yFq7D4+
         f54HBkykb6guQXFCcIOxTrRSJKs2kAdS2WmbH1Am2Oxo82gRP7p6nqy4tqxrXCfZrNwq
         ZET7dChuQtxbO81/QTPSDDafGBkt1MlSQgqTTcMJd63M1QgC5bmb6QQRXvpNo3lFoB0L
         ppM6QdA3egiEls/K758qq7sgjX1UrK/b/7LJan9n2sSvx/jUuB0DDoOoj6vm+lCwn90b
         LRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425020; x=1750029820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyOPT5bb27xpSlfKUprjkFPzASHSgU4t1PeuReJqiO8=;
        b=MTzm2zuw9NzonGpKAP6aKGH5rEdxc+O3AawOn4NLV5xV/i2xwfLdvQ04tFuGCCFPUh
         HJpLzqRiQFcf139OQJaUiDtdXzoKPEAsZl7FHVg6Ui1/BPYoPGCGjQHJTeDpiFP9lYJK
         rpN8kgKaRbGtNnPNjy+zsFXabhXHarMwFgDtEDSpX+jRjkpiNKCNEAZjJgOOi7ZoXYbZ
         BBLbfu6Ru+G7xOl2Xb+Sgmki2MvWudu7G7Ysy2huzOiX7v5S3omrT/zO0bvPu3vB3sJO
         CznYsiNY2ztcs6w12lH+ihZJENnhQLuRKq+beC0pY2zxFpOPQsgSrKOEscMR15I2nDxc
         MYgw==
X-Forwarded-Encrypted: i=1; AJvYcCVLtdToXP1eJGgTtBrji6RG+24zII8PrKT/BSc454THg7kaXkIL/7muB+4u3K1qNht8jaT7vF0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx04iqotiBBcvKYruswEQLPRzYAAPXiOv2tKyoz5umOxhMp7Jxh
	NECQL1uqm5NshoqzG8yGC6w56awJBDW14OoFpr0GYlbkwYHRJnqZajUn
X-Gm-Gg: ASbGnctjcZonZhmLuDTS9ewfBAIQoO2jdJtqp4UnJ4/4Q9cyA1KRrnxXdFcAt49GPO5
	GPiz3ALjezV3iaedQwHpwnH8ZR4EFK5by8DzM6+fDKF8bpnlf0N3znw/8Hd8ZJYQEixXFsQnFos
	rwWJTbBd3Lj1bcn1oRrVo28WF3Yn0pJ2sUIJ+s/fuKIurbm65BPF0YASbwYoDPTcJdz0ytvTEUV
	ruJ+D6btuwTM8oKCNuxfKXfHfo8ITA2IDpnE8s8zP9JtYFaMWN2R/N5kcBgV+3Wz2O+vVWXxrEp
	U62pFUxRTMze1RNvUdsjD7NddVctksISOXhc8A==
X-Google-Smtp-Source: AGHT+IET3f7QbRTBxJ5zmqMOJC3RYOEvWDP8i0B7bIKfGXy4c6ekxkf5y/zk5WatlDc2mvCvrtc3kw==
X-Received: by 2002:a05:622a:1cc4:b0:477:1ee1:23d9 with SMTP id d75a77b69052e-4a5b9a2ae3bmr204216041cf.20.1749425019695;
        Sun, 08 Jun 2025 16:23:39 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a619852dedsm48449871cf.39.2025.06.08.16.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:23:39 -0700 (PDT)
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
Subject: [PATCH v2 3/4] riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
Date: Mon,  9 Jun 2025 07:22:09 +0800
Message-ID: <20250608232214.771855-4-inochiama@gmail.com>
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

Add reset generator node for all CV18XX series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
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
index 000000000000..b9b6dd56a9e2
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
+#define RST_CPUCORE0			268
+#define RST_CPUCORE1			269
+#define RST_CPUCORE2			270
+#define RST_CPUCORE3			271
+#define RST_CPUSYS0			272
+#define RST_CPUSYS1			273
+#define RST_CPUSYS2			274
+
+#endif /* _SOPHGO_CV18XX_RESET */
-- 
2.49.0

