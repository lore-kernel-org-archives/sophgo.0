Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C801267AF1
	for <sophgo@lists.linux.dev>; Sun,  8 Jun 2025 23:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425391; cv=none; b=bqul5oN87QWlrwCVnL1zrrc5eMbWaMB1KstxyMzAtkQwzHD8PyZzZQre+iglmvh5yfCs9hNZumcZoJr05D/9ExzNGsQqGTOKC9tRD81MXi/F0LDUlwSapX7hEUjiHwHEahpjWLcOuZ4T/5oKS61/ohlgFKDnqkxqvLVtuFYZRVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425391; c=relaxed/simple;
	bh=P6GnW41nXG1w+GDEwxNGovllpbTbaAJ2B/IEZM6cIDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEyoJEoJjKQd/iX+hLJbBv6Q30Pin60Ti9ExGnUyRkP65HWg1lR7irEgVXR04ZcvS4uOyB/2GZXnQOiD1DasWkrwVUtiTJGEVvfTn/qnN27LVqlmcI5mayvp8xb2oB736YZbYZnujvca5phybzD9TjqsDMhHcLvcES2ZtevhAKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWauN4AH; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWauN4AH"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d09f11657cso365080585a.0
        for <sophgo@lists.linux.dev>; Sun, 08 Jun 2025 16:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425389; x=1750030189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRmOcfIym+jztFj2oNw/dbYG2NDcS8k8iQRMon2PBA8=;
        b=QWauN4AHxeaARWI9HJCQAcYFGhkqd7fhsYRdGoe547821Uz/pDi1LgmlnoRiT8IEqk
         ihkySoMIyzXnmxnFXGFGvk3V4btmrIc3uPYF0hsGRWItQ9MPLCOBacl95iQ6a7d/DRAL
         pkgD+8WICXURtk/O2/aBLCZ+raMLwRIiKYG3k31W0pEXjgpBfjSdmC6gDAMGRmy+tebn
         90BiqC8zo3nbPf+aurOaEduZavFBX04VVSQV60gmpLQM+PdypNA+/bpmABJrDz8TL52G
         iDIesg4T1zIyTV7ANCm6WrRkCcOKkIwJFicwErg3VnRBDhMMkDDxAuSQBpI6bm9/xbPx
         HTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425389; x=1750030189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRmOcfIym+jztFj2oNw/dbYG2NDcS8k8iQRMon2PBA8=;
        b=dBynyuccGnAyntyqF0KSNFB8b6d6EW3N+Joc4h20P2BFXNqYFcixLcCNfxXyef5xZt
         pH3I+o1wUh1vKpByjH9OCFGrktFBJ36v7rdhm12YSEj0R/YNRVDFNeOGv/Ee3tIU8w8K
         B8+XBclwBduXmA+04OcQ/YalGVC7sIS6d/QJjs2D/q2Vr8Rg6kTCL0mlSaZePcJlrTQO
         NihBcI+A7n4pmK3IoeeC/giDOLBJfZuF/lKNYavspl0KX1feNbY7E1wzL9rj7XUuX9Fr
         Q4b/bvfnglNqVDgfLgDjwsemN2XZI3GdA6untv14sEBBinYQMPuIBGcY3S4tfghlYnw1
         5A6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVooeVZRmGxUA76MnIfgizuYX1GwJjum1b1sGzQueWtawBt6h7AC7xlAQ3YaeUdoXEN2FrK1vY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBVpjnMZnaI7J00EVQKEBCuNTma4x/e+rGJ4vUAkKpu9rGQZCn
	+UKsu5vjT4pBStfrkeZqWoWn7D0KT64Axj2qm2ZOuotl+bK2A3rZDfZ5
X-Gm-Gg: ASbGncvhdM/tQkHlvPG38KWxqsMtgwHCXj/OdH934TReQlZQRUi1RwTb45D57GhAicI
	qZdQuxc2aXtOPpIIGnfRQwO4D/CEWmIzqfPNlvb7zkdDwdB8DZIc3gp5bjRY870PF4QB91UxQ7j
	sy5xUjatvBl9wfBlcIIRTxWrJ/ZH4YrDJ4a/UZYs6gaVLmAA+O+8tSrjvpvyOSa+QKFJIqTM2MW
	e6H8wG9EFE8U7Wv3gpxl6NA6KGIWKh3E62X6/8UXd+xH8R5W9AX7SPNzypxW7Z2bWQOI0UA6fIM
	WscDIUjwnFUTu1NimptywSkowTNg72cktBjCRw==
X-Google-Smtp-Source: AGHT+IE5/Gz8qqya3fci5rtlQe9R/OPJWsD97+s3Z1RsEKIEirjoWmQf9uF/h0NVyozgqLtYvjZHjg==
X-Received: by 2002:a05:620a:4154:b0:7cd:c6:40f3 with SMTP id af79cd13be357-7d22985c859mr1849137885a.2.1749425389266;
        Sun, 08 Jun 2025 16:29:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b2abfcsm43841216d6.104.2025.06.08.16.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:29:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 02/11] riscv: dts: sophgo: sg2044: Add clock controller device
Date: Mon,  9 Jun 2025 07:28:26 +0800
Message-ID: <20250608232836.784737-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clock controller and pll clock node for sg2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 34 ++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index a0c13d8d26af..d21a59948186 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -3,6 +3,8 @@
  * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
  */
 
+#include <dt-bindings/clock/sophgo,sg2044-pll.h>
+#include <dt-bindings/clock/sophgo,sg2044-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 #include "sg2044-cpus.dtsi"
@@ -32,6 +34,9 @@ uart0: serial@7030000000 {
 			compatible = "sophgo,sg2044-uart", "snps,dw-apb-uart";
 			reg = <0x70 0x30000000 0x0 0x1000>;
 			clock-frequency = <500000000>;
+			clocks = <&clk CLK_GATE_UART_500M>,
+				 <&clk CLK_GATE_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupt-parent = <&intc>;
 			interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -44,6 +49,9 @@ uart1: serial@7030001000 {
 			compatible = "sophgo,sg2044-uart", "snps,dw-apb-uart";
 			reg = <0x70 0x30001000 0x0 0x1000>;
 			clock-frequency = <500000000>;
+			clocks = <&clk CLK_GATE_UART_500M>,
+				 <&clk CLK_GATE_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupt-parent = <&intc>;
 			interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -56,6 +64,9 @@ uart2: serial@7030002000 {
 			compatible = "sophgo,sg2044-uart", "snps,dw-apb-uart";
 			reg = <0x70 0x30002000 0x0 0x1000>;
 			clock-frequency = <500000000>;
+			clocks = <&clk CLK_GATE_UART_500M>,
+				 <&clk CLK_GATE_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupt-parent = <&intc>;
 			interrupts = <43 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -68,6 +79,9 @@ uart3: serial@7030003000 {
 			compatible = "sophgo,sg2044-uart", "snps,dw-apb-uart";
 			reg = <0x70 0x30003000 0x0 0x1000>;
 			clock-frequency = <500000000>;
+			clocks = <&clk CLK_GATE_UART_500M>,
+				 <&clk CLK_GATE_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupt-parent = <&intc>;
 			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -83,6 +97,26 @@ syscon: syscon@7050000000 {
 			clocks = <&osc>;
 		};
 
+		clk: clock-controller@7050002000 {
+			compatible = "sophgo,sg2044-clk";
+			reg = <0x70 0x50002000 0x0 0x1000>;
+			#clock-cells = <1>;
+			clocks = <&syscon CLK_FPLL0>, <&syscon CLK_FPLL1>,
+				 <&syscon CLK_FPLL2>, <&syscon CLK_DPLL0>,
+				 <&syscon CLK_DPLL1>, <&syscon CLK_DPLL2>,
+				 <&syscon CLK_DPLL3>, <&syscon CLK_DPLL4>,
+				 <&syscon CLK_DPLL5>, <&syscon CLK_DPLL6>,
+				 <&syscon CLK_DPLL7>, <&syscon CLK_MPLL0>,
+				 <&syscon CLK_MPLL1>, <&syscon CLK_MPLL2>,
+				 <&syscon CLK_MPLL3>, <&syscon CLK_MPLL4>,
+				 <&syscon CLK_MPLL5>;
+			clock-names = "fpll0", "fpll1", "fpll2", "dpll0",
+				      "dpll1", "dpll2", "dpll3", "dpll4",
+				      "dpll5", "dpll6", "dpll7", "mpll0",
+				      "mpll1", "mpll2", "mpll3", "mpll4",
+				      "mpll5";
+		};
+
 		rst: reset-controller@7050003000 {
 			compatible = "sophgo,sg2044-reset",
 				     "sophgo,sg2042-reset";
-- 
2.49.0

