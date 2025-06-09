Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62D3226183
	for <sophgo@lists.linux.dev>; Mon,  9 Jun 2025 23:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749510254; cv=none; b=Z4+CIdlX37+wYMmm/7B8kxzjK1hUrVGfCkQpzdmk4uuFUOAwEnB5umnrOHDLUf2mppV+eaAy632qoObO7S/huiVts92OIvgTZBmb+R/SGmHx8UfXAmmhc6njZL2UI8zkisot02k4Wd+J1nwtiKes3tuyu/Ydit5fw4juAPeaqoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749510254; c=relaxed/simple;
	bh=4P/wiuPesFnh/Uyov5jXLEjhp3/xkYsDmOpBw88N8HQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FPr/LC6fEjNQ9LNI0eKLWXsgz/xHaRbTEJksnPQtplohOC4oZ6r82Y+Sph/jr9M4EzaUORjgkUyKwbrbas6vt8IdGc+s4lVkFQcvO4Ef3KZwuIVX6FsmEP0mUHo93/7+YIDuwOh5U868lhs/ho/dszAISELZZiP8FevPqJyuX3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvQYibk/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvQYibk/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4531e146a24so677515e9.0
        for <sophgo@lists.linux.dev>; Mon, 09 Jun 2025 16:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749510251; x=1750115051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCo+d97U76PkBGkWutYUHF4lfk0UocX8ijiUCJ/8WCQ=;
        b=ZvQYibk/uBqLuzqf4I3l4VTKHqjxhGdNSzWGFsyYkViEle9+xI6gklXb02o9dtNtv8
         atVRfmFtg7ljEXdTRnCtb49gxYPBLMzskIR3iOshIuD8bGeV14F7YwlSQJuCbYvo2voH
         0yXlDZCAOdPP2UkMOepff7NbuvKu+X1SsEKqep5WIeCqiAuZwTvJR9EmNM9gIHpf139Y
         RctwJI4UJlhAsMf5/s9lcZthz2U57jxQhMV2ts8hjRUxAribyrAojrjGByd0yRxbJREG
         72b8TZUyXTt0+iImjRnihfRimcj3O1gqFZOSb7UsjdxrD/7W7eHTZDuhI7cvAs8QUdpE
         8rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749510251; x=1750115051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XCo+d97U76PkBGkWutYUHF4lfk0UocX8ijiUCJ/8WCQ=;
        b=CAKKBZS23GpOuEJOOSWSmKIJ4zHMaHLjFWvuh9b7PdFC9ZeWM5QvLIANwyVf9qEf+t
         I3VTterRnM+GBK30HcpqauQtYVy9gZdN0YfFGJEMUrEN697lvZ73kKMRTLax158kC4R3
         hRRA+UuxdlobpxLGZT611YlLkiaBym6Xu8dWApDjmsOvg6LDcMlRj2Gwm+31l92rjWbJ
         hlsKZ0ou6uxJbtTC1YRF2c39pl7bh9YS5Fti9lRB+z5v8QBaD6vX59VoFQQkGJTqudJZ
         w7lG75gijlQWuscvclyyzMcFJS48rUtS4Pm5cOd653MZ4MFNMzv5g7TKWlGgQqfU2yhJ
         zsBw==
X-Forwarded-Encrypted: i=1; AJvYcCWW5W6WXfeGIKWIwEZS2tcWdz/kOaCjjq1oqZNIOkXHUBQH0PXXITfVJdTjQ8weglMDNMXBOlA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9LljzdzT2G0QUSBuW3qj2e125EYAWN1zI53dXwoko3K91BOc/
	a3TKILvgXMcEaR76d9mxd5MZiOZLuFW5asRu/aaQSnmn1iTxSlVpsDjf
X-Gm-Gg: ASbGnct5+5AFi/+7bVuqKw3vv35D2J4l+zWS1Vp9TOTp6iKNRNOXQZkKJ21noCyToCY
	F2QGG2EamaiF3nEizw2J/y2wt6r8xjsi50R2pKHSl9BreeFtOYMPmYS9jmqMpKuZPYPf1Bm0eRC
	DcRyoQRwcFm18MunuDlH9T3zdEDyR5XAdzUKHU3VPEL3o1d9y6pp0dYIlUNxqOA3QkedLHIlBRZ
	LX6Dv9+mP7tl6pGOLU14yjNBRYneYwfoTyqcf9TmXWVT4s0uBLrAbeLm8l1XpTdJlTkXvOci15X
	LzkMssSJ2pVrCywYpBuz236JNpQweQV3xS6F+jvkf8gCcTvJcMG10jpRu9oyB3PRxN3OowgdPw0
	ApyqSiRIbvQ==
X-Google-Smtp-Source: AGHT+IHBOLrX9hJVpiyQi7xpuFvt7jnPbdlf4ABzm7L9Q4dlQ+R6Fz+CFJzUT+ceifsEKtvMg0L7wQ==
X-Received: by 2002:a05:6000:2203:b0:3a3:7593:818b with SMTP id ffacd0b85a97d-3a552272cccmr312945f8f.21.1749510250875;
        Mon, 09 Jun 2025 16:04:10 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b92d4sm121340585e9.19.2025.06.09.16.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:04:10 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: [PATCH 1/2] dt-bindings: reset: sophgo: support SG2000
Date: Tue, 10 Jun 2025 01:04:14 +0200
Message-ID: <20250609230417.620089-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609230417.620089-1-alexander.sverdlin@gmail.com>
References: <20250609230417.620089-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the reset module on the Sophgo SG2000 SoC.

Link: https://github.com/sophgo/sophgo-doc/tree/main/SG200X/TRM
Cc: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../bindings/reset/sophgo,sg2000-reset.yaml   | 35 +++++++
 .../dt-bindings/reset/sophgo,sg2000-reset.h   | 92 +++++++++++++++++++
 2 files changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2000-reset.yaml
 create mode 100644 include/dt-bindings/reset/sophgo,sg2000-reset.h

diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2000-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2000-reset.yaml
new file mode 100644
index 000000000000..ab44d45ae061
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/sophgo,sg2000-reset.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/sophgo,sg2000-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2000 SoC Reset Controller
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+properties:
+  compatible:
+    const: sophgo,sg2000-reset
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    rstgen: reset-controller@3003000 {
+        compatible = "sophgo,sg2000-reset";
+        reg = <0x3003000 0x28>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/reset/sophgo,sg2000-reset.h b/include/dt-bindings/reset/sophgo,sg2000-reset.h
new file mode 100644
index 000000000000..23604a800f66
--- /dev/null
+++ b/include/dt-bindings/reset/sophgo,sg2000-reset.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+
+#ifndef __DT_BINDINGS_RESET_SOPHGO_SG2000_H_
+#define __DT_BINDINGS_RESET_SOPHGO_SG2000_H_
+
+#define RST_DDR			2
+#define RST_H264C		3
+#define RST_JPEG		4
+#define RST_H265C		5
+#define RST_VIPSYS		6
+#define RST_TDMA		7
+#define RST_TPU			8
+#define RST_TPUSYS		9
+#define RST_USB			11
+#define RST_ETH0		12
+#define RST_ETH1		13
+#define RST_NAND		14
+#define RST_EMMC		15
+#define RST_SD0			16
+#define RST_SDMA		18
+#define RST_I2S0		19
+#define RST_I2S1		20
+#define RST_I2S2		21
+#define RST_I2S3		22
+#define RST_UART0		23
+#define RST_UART1		24
+#define RST_UART2		25
+#define RST_UART3		26
+#define RST_I2C0		27
+#define RST_I2C1		28
+#define RST_I2C2		29
+#define RST_I2C3		30
+#define RST_I2C4		31
+
+#define RST_PWM0		32
+#define RST_PWM1		33
+#define RST_PWM2		34
+#define RST_PWM3		35
+#define RST_SPI0		40
+#define RST_SPI1		41
+#define RST_SPI2		42
+#define RST_SPI3		43
+#define RST_GPIO0		44
+#define RST_GPIO1		45
+#define RST_GPIO2		46
+#define RST_EFUSE		47
+#define RST_WDT			48
+#define RST_AHB_ROM		49
+#define RST_SPIC		50
+#define RST_TEMPSEN		51
+#define RST_SARADC		52
+#define RST_COMBO_PHY0		58
+#define RST_SPI_NAND		61
+#define RST_SE			62
+
+#define RST_UART4		74
+#define RST_GPIO3		75
+#define RST_SYSTEM		76
+#define RST_TIMER		77
+#define RST_TIMER0		78
+#define RST_TIMER1		79
+#define RST_TIMER2		80
+#define RST_TIMER3		81
+#define RST_TIMER4		82
+#define RST_TIMER5		83
+#define RST_TIMER6		84
+#define RST_TIMER7		85
+#define RST_WGN0		86
+#define RST_WGN1		87
+#define RST_WGN2		88
+#define RST_KEYSCAN		89
+#define RST_AUDDAC		91
+#define RST_AUDDAC_APB		92
+#define RST_AUDADC		93
+#define RST_VCSYS		95
+
+#define RST_ETHPHY		96
+#define RST_ETHPHY_APB		97
+#define RST_AUDSRC		98
+#define RST_VIP_CAM0		99
+#define RST_WDT1		100
+#define RST_WDT2		101
+
+#define RST_CPUCORE0		1152
+#define RST_CPUCORE1		1153
+#define RST_CPUCORE2		1154
+#define RST_CPUCORE3		1155
+#define RST_CPUSYS0		1156
+#define RST_CPUSYS1		1157
+#define RST_CPUSYS2		1158
+
+#endif /* __DT_BINDINGS_RESET_SOPHGO_SG2000_H_ */
-- 
2.49.0

