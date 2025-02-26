Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B9325DD1B
	for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 23:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740612232; cv=none; b=fOvqKNPQIpJeV7rST6mMUtX5QheVYbZQYrvdN9qdgsXJAKrlzp++T2ESDZgkyk5WqYmcOJWcMWLcGWULWfr0ckKyzHKKqunjmTP6FStUDiQlPLYvQ7ygO7eKd3qR4i/YOsQGPBsliwiwz23h9sROdpBV2Dg1H1JwWLj4utTx1qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740612232; c=relaxed/simple;
	bh=W9UOtlGwWIK3N2S4o4LjNzuK9cGXGZBDY5zm6seyjXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eYtIejJwqUy5m8H7lPWoeoFxnsNqefgaRCB2K1DUbOBTdHz4SWliSr93xYUR/ryydtRC3k0CXSJkYRv99tyk2tsY7/rhCBk+Lp6IB+UAvLa+wtCLJRn8EqBGQMF1nnDKUX+NHcK0T7S1a/OI4N8tv26Kvx8wzC7HGpYujZY5Ds4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzAZPeDd; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzAZPeDd"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c089b2e239so42164685a.0
        for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 15:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740612229; x=1741217029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohwwvHcdRfCz5Tmjdrotz9z6I/5PmjKMye5D/1vf6F0=;
        b=JzAZPeDdMpL+D7ZEhYoetsZoOCyetN+GS9T339AJdKMhFuzQQfJTYkjaK9ojKSO1Ph
         ioYdwzkL3VqcR4MapmRxoiR5SKsA4xRBn0Xyb6y3LQfDFM5jg4DbSltia/MwLxR2/wSB
         XIgIFJdJmom0Xi4V1iyGMl8jUr8BSM68W0JbVnpCIPeyktS+A66+0V7e4YnlegnV9FHG
         wd+B9rzfsUxY/2WndR1F/1vwA8WNnMh/RIaYJ4MaC5rl5MlgUp+WsBChWZC2ANEkv+b+
         Em/3hIODnGR6pkeY1xEqYYK5C1BytH/pURb5EWX4IYiBliHsxiAEmJIOHk43nMXT2B39
         hFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740612229; x=1741217029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohwwvHcdRfCz5Tmjdrotz9z6I/5PmjKMye5D/1vf6F0=;
        b=KUTmexiGuBnMk8klrAofbC+YMPFlYSvixNt9Fje/1d6SoJBUPVcQJHtNk0bLv6scLc
         BjIeQQCJHncE3Z2AXDQK3Fs+dV9x4zaBG59iviXnH42GvnnT/8lnJETLWzSBBYcLME3+
         WFL85/7kfSnKaFlTWqWW299ehce6jPGHlA/ZYlG+qpi3G7otvV06hi/4CbhVCxBQ//NQ
         XXD9VHWQOZ/l3pFexM+xrVxN6Ety06oHjFTNTlVNFchj1hrd57WYVkE5Cpxd3zL2vsG8
         +2Bqwg7JGle83UrVSMX+wA/28fF9V1DYQZgiY5ChdK9lrFZ+HCeqwQ9CKkMfg4PMOK5m
         HdDw==
X-Forwarded-Encrypted: i=1; AJvYcCVs3LWqrHCKFAtGXbaLUE8S52gp7blZ49hQD3VdZHgjU2TWfFmq6A3NthT09zriMGxLmPHoc+Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtxKr4bCIYJj5IZ3Jow/G11e8uwjeT1wrBql9brPlRO0TCZvTH
	2oPQyd4hsXqzxT/2hKGSEryTLCUvrXKPmDWJXfFo4avj0jm2Nxay
X-Gm-Gg: ASbGncv2TGYjrsgx5mQmct4lHphvKK9z6RBoxQlKL7TpFgYJ2F8kd/PmnTeHjGARnpV
	WZ+xAJfw1GgLczEm2B+7uJDhimXWCJ5E10tTyYQr83VnOW12YvPCH4W0wZeonT+CIW9q83OFBf4
	ne8qU/CQllYwbPL+W54etUr4E3HBnuu97GhLpM/U1CX7KZ+g4AOVrcnvAemV5q0XOdBZd1OSpxy
	NQ0oyxUGxE4/nz6FbPWmWtV/kFMpQAxoaV9kpGWD7NI3JT4sZRod9kqu2xOVMMO7yWEkGyM47bw
	Vw==
X-Google-Smtp-Source: AGHT+IHikxm+nmCYj8S8OUriXacgBcvC8EgA2lwQ61Z7MkJBuTeYR2oL7y5t4ggjNNiEj8M6XAba3w==
X-Received: by 2002:a05:620a:3913:b0:7be:513c:3371 with SMTP id af79cd13be357-7c29f441232mr152429085a.14.1740612228604;
        Wed, 26 Feb 2025 15:23:48 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c378d9fec4sm20672085a.67.2025.02.26.15.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:23:48 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: clock: sophgo: add clock controller for SG2044
Date: Thu, 27 Feb 2025 07:23:18 +0800
Message-ID: <20250226232320.93791-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226232320.93791-1-inochiama@gmail.com>
References: <20250226232320.93791-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock controller on the SG2044 provides common clock function
for all IPs on the SoC. This device requires PLL clock to function
normally.

Add definition for the clock controller of the SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/clock/sophgo,sg2044-clk.yaml     |  40 +++++
 include/dt-bindings/clock/sophgo,sg2044-clk.h | 170 ++++++++++++++++++
 2 files changed, 210 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml
 create mode 100644 include/dt-bindings/clock/sophgo,sg2044-clk.h

diff --git a/Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml b/Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml
new file mode 100644
index 000000000000..d55c5d32e206
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/sophgo,sg2044-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2044 Clock Controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+properties:
+  compatible:
+    const: sophgo,sg2044-clk
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@50002000 {
+      compatible = "sophgo,sg2044-clk";
+      reg = <0x50002000 0x1000>;
+      #clock-cells = <1>;
+      clocks = <&osc>;
+    };
diff --git a/include/dt-bindings/clock/sophgo,sg2044-clk.h b/include/dt-bindings/clock/sophgo,sg2044-clk.h
new file mode 100644
index 000000000000..1da54354e5c3
--- /dev/null
+++ b/include/dt-bindings/clock/sophgo,sg2044-clk.h
@@ -0,0 +1,170 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#ifndef __DT_BINDINGS_SOPHGO_SG2044_CLK_H__
+#define __DT_BINDINGS_SOPHGO_SG2044_CLK_H__
+
+#define CLK_FPLL0			0
+#define CLK_FPLL1			1
+#define CLK_FPLL2			2
+#define CLK_DPLL0			3
+#define CLK_DPLL1			4
+#define CLK_DPLL2			5
+#define CLK_DPLL3			6
+#define CLK_DPLL4			7
+#define CLK_DPLL5			8
+#define CLK_DPLL6			9
+#define CLK_DPLL7			10
+#define CLK_MPLL0			11
+#define CLK_MPLL1			12
+#define CLK_MPLL2			13
+#define CLK_MPLL3			14
+#define CLK_MPLL4			15
+#define CLK_MPLL5			16
+#define CLK_DIV_AP_SYS_FIXED		17
+#define CLK_DIV_AP_SYS_MAIN		18
+#define CLK_DIV_RP_SYS_FIXED		19
+#define CLK_DIV_RP_SYS_MAIN		20
+#define CLK_DIV_TPU_SYS_FIXED		21
+#define CLK_DIV_TPU_SYS_MAIN		22
+#define CLK_DIV_NOC_SYS_FIXED		23
+#define CLK_DIV_NOC_SYS_MAIN		24
+#define CLK_DIV_VC_SRC0_FIXED		25
+#define CLK_DIV_VC_SRC0_MAIN		26
+#define CLK_DIV_VC_SRC1_FIXED		27
+#define CLK_DIV_VC_SRC1_MAIN		28
+#define CLK_DIV_CXP_MAC_FIXED		29
+#define CLK_DIV_CXP_MAC_MAIN		30
+#define CLK_DIV_DDR0_FIXED		31
+#define CLK_DIV_DDR0_MAIN		32
+#define CLK_DIV_DDR1_FIXED		33
+#define CLK_DIV_DDR1_MAIN		34
+#define CLK_DIV_DDR2_FIXED		35
+#define CLK_DIV_DDR2_MAIN		36
+#define CLK_DIV_DDR3_FIXED		37
+#define CLK_DIV_DDR3_MAIN		38
+#define CLK_DIV_DDR4_FIXED		39
+#define CLK_DIV_DDR4_MAIN		40
+#define CLK_DIV_DDR5_FIXED		41
+#define CLK_DIV_DDR5_MAIN		42
+#define CLK_DIV_DDR6_FIXED		43
+#define CLK_DIV_DDR6_MAIN		44
+#define CLK_DIV_DDR7_FIXED		45
+#define CLK_DIV_DDR7_MAIN		46
+#define CLK_DIV_TOP_50M			47
+#define CLK_DIV_TOP_AXI0		48
+#define CLK_DIV_TOP_AXI_HSPERI		49
+#define CLK_DIV_TIMER0			50
+#define CLK_DIV_TIMER1			51
+#define CLK_DIV_TIMER2			52
+#define CLK_DIV_TIMER3			53
+#define CLK_DIV_TIMER4			54
+#define CLK_DIV_TIMER5			55
+#define CLK_DIV_TIMER6			56
+#define CLK_DIV_TIMER7			57
+#define CLK_DIV_CXP_TEST_PHY		58
+#define CLK_DIV_CXP_TEST_ETH_PHY	59
+#define CLK_DIV_C2C0_TEST_PHY		60
+#define CLK_DIV_C2C1_TEST_PHY		61
+#define CLK_DIV_PCIE_1G			62
+#define CLK_DIV_UART_500M		63
+#define CLK_DIV_GPIO_DB			64
+#define CLK_DIV_SD			65
+#define CLK_DIV_SD_100K			66
+#define CLK_DIV_EMMC			67
+#define CLK_DIV_EMMC_100K		68
+#define CLK_DIV_EFUSE			69
+#define CLK_DIV_TX_ETH0			70
+#define CLK_DIV_PTP_REF_I_ETH0		71
+#define CLK_DIV_REF_ETH0		72
+#define CLK_DIV_PKA			73
+#define CLK_MUX_DDR0			74
+#define CLK_MUX_DDR1			75
+#define CLK_MUX_DDR2			76
+#define CLK_MUX_DDR3			77
+#define CLK_MUX_DDR4			78
+#define CLK_MUX_DDR5			79
+#define CLK_MUX_DDR6			80
+#define CLK_MUX_DDR7			81
+#define CLK_MUX_NOC_SYS			82
+#define CLK_MUX_TPU_SYS			83
+#define CLK_MUX_RP_SYS			84
+#define CLK_MUX_AP_SYS			85
+#define CLK_MUX_VC_SRC0			86
+#define CLK_MUX_VC_SRC1			87
+#define CLK_MUX_CXP_MAC			88
+#define CLK_GATE_AP_SYS			89
+#define CLK_GATE_RP_SYS			90
+#define CLK_GATE_TPU_SYS		91
+#define CLK_GATE_NOC_SYS		92
+#define CLK_GATE_VC_SRC0		93
+#define CLK_GATE_VC_SRC1		94
+#define CLK_GATE_DDR0			95
+#define CLK_GATE_DDR1			96
+#define CLK_GATE_DDR2			97
+#define CLK_GATE_DDR3			98
+#define CLK_GATE_DDR4			99
+#define CLK_GATE_DDR5			100
+#define CLK_GATE_DDR6			101
+#define CLK_GATE_DDR7			102
+#define CLK_GATE_TOP_50M		103
+#define CLK_GATE_SC_RX			104
+#define CLK_GATE_SC_RX_X0Y1		105
+#define CLK_GATE_TOP_AXI0		106
+#define CLK_GATE_INTC0			107
+#define CLK_GATE_INTC1			108
+#define CLK_GATE_INTC2			109
+#define CLK_GATE_INTC3			110
+#define CLK_GATE_MAILBOX0		111
+#define CLK_GATE_MAILBOX1		112
+#define CLK_GATE_MAILBOX2		113
+#define CLK_GATE_MAILBOX3		114
+#define CLK_GATE_TOP_AXI_HSPERI		115
+#define CLK_GATE_APB_TIMER		116
+#define CLK_GATE_TIMER0			117
+#define CLK_GATE_TIMER1			118
+#define CLK_GATE_TIMER2			119
+#define CLK_GATE_TIMER3			120
+#define CLK_GATE_TIMER4			121
+#define CLK_GATE_TIMER5			122
+#define CLK_GATE_TIMER6			123
+#define CLK_GATE_TIMER7			124
+#define CLK_GATE_CXP_CFG		125
+#define CLK_GATE_CXP_MAC		126
+#define CLK_GATE_CXP_TEST_PHY		127
+#define CLK_GATE_CXP_TEST_ETH_PHY	128
+#define CLK_GATE_PCIE_1G		129
+#define CLK_GATE_C2C0_TEST_PHY		130
+#define CLK_GATE_C2C1_TEST_PHY		131
+#define CLK_GATE_UART_500M		132
+#define CLK_GATE_APB_UART		133
+#define CLK_GATE_APB_SPI		134
+#define CLK_GATE_AHB_SPIFMC		135
+#define CLK_GATE_APB_I2C		136
+#define CLK_GATE_AXI_DBG_I2C		137
+#define CLK_GATE_GPIO_DB		138
+#define CLK_GATE_APB_GPIO_INTR		139
+#define CLK_GATE_APB_GPIO		140
+#define CLK_GATE_SD			141
+#define CLK_GATE_AXI_SD			142
+#define CLK_GATE_SD_100K		143
+#define CLK_GATE_EMMC			144
+#define CLK_GATE_AXI_EMMC		145
+#define CLK_GATE_EMMC_100K		146
+#define CLK_GATE_EFUSE			147
+#define CLK_GATE_APB_EFUSE		148
+#define CLK_GATE_SYSDMA_AXI		149
+#define CLK_GATE_TX_ETH0		150
+#define CLK_GATE_AXI_ETH0		151
+#define CLK_GATE_PTP_REF_I_ETH0		152
+#define CLK_GATE_REF_ETH0		153
+#define CLK_GATE_APB_RTC		154
+#define CLK_GATE_APB_PWM		155
+#define CLK_GATE_APB_WDT		156
+#define CLK_GATE_AXI_SRAM		157
+#define CLK_GATE_AHB_ROM		158
+#define CLK_GATE_PKA			159
+
+#endif /* __DT_BINDINGS_SOPHGO_SG2044_CLK_H__ */
-- 
2.48.1

