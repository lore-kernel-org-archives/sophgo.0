Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858551DA31F;
	Sun, 16 Mar 2025 18:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742151411; cv=none; b=mLihJhLVVxWV4Zj75fdGEdf1fuTax0B/Vj0ZAOC8H0U9Xvn3GQja90RRo/K/upafzFkJ74/XgvE6X2MnKU+kpOMHu5O1Nnj6CC3xxs83Yhz93+xJo6AR+TO3RiTliui88CHv0N3tYmtB6rLKTX4dN9R14qxr/2X7mHG6HGoHQxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742151411; c=relaxed/simple;
	bh=vooiAA7iCXb4etNJQXR1mlqUeD1VnrvY7Zyyfhq2AfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UMzVl8oUKxHxgp2bKrxtJ1jW2bhmZrOSNpLhDY2QZEyeMBYR459iD5YquivPczYu/LNC4nDlxgGaSABgiyc5Py0yqOFwAUV10Wu19nJiCVBgR93GVtoz/A9y+F5HYCrVYHOWy0DdoM2YJSYTzowQEsjRWc/AWh2RSIOj2NJK1b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrHJGpol; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrHJGpol"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43948021a45so14782475e9.1;
        Sun, 16 Mar 2025 11:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742151408; x=1742756208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pb1dxZGebo6nHqsuNHV+lx93/PLHdbwZTSKy7EcNex0=;
        b=hrHJGpol+TDJnKx9m7tnP6BL7pVmc5dtm136vltKGseCwRdP8Bp8MKZb3Wilbxfoek
         gU3Wve4SZJEAILxwHkYXjX2GDMDvkgh/N2A45RbYPs0tZtPZEe5KTBS8Au/QYycN7ygM
         MK9BXHAHLmr9gLU0+sQzeyCJpKUGLtS8qwh+111hZT8KmNZn+kmJjwo2kfrxFyN9TMG5
         eYiJ3A/3yP/QmnPAMuBQ5xzpYfoeYkn4OGvHcV48fxkexe4kMslLyXH8x5oeO4L/6n/n
         8muMYRgs98/GdrPH+Y3IFmNtxEJz19BKdWdWg19fiBp/7LVoJ1h4i+VhzJ0XrFMzzqAf
         Ct8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742151408; x=1742756208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pb1dxZGebo6nHqsuNHV+lx93/PLHdbwZTSKy7EcNex0=;
        b=JHzZxBbTZcgkZrOid6xHEXHyzqoGso5AIbykghzAuQh2HZkLiqLRBIsVGlDHkGRHqc
         gMmILsYkXYabt4RlnhXP9E6PyouWgv0kQ09uNaUt3XkcJ1jl0l9u4GzNniNMa1mNchID
         6j6+ukgUqVTE8wjg1+TE46Ez2xiaaLV3QH5Q0zk6kMZEkTVD3lOuSkWqME1ItAdtzKR+
         i//SUyx4ZLcL45dqX4gZm2xSvHDMfoJQEG1rhOoB32+cL8tsB4Rvn93MdbuaihbTOrP5
         H8S0LYhJ8WW8CKp2V+42qBJtxhhL5EzurHu58fnMDpJ5OVx521yQAsO+3nzEM2LvsB+W
         xuoA==
X-Forwarded-Encrypted: i=1; AJvYcCXr7e7IT2IOmDBhn8GzTOi9BiU7OEj81WcIhl7ZuDV7JliGxmdMQ1TW282zrpySHz2saJE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkstnchOEIASJEOiW5H7BGPPQbdpCM8JVylita48W45S8hkb8f
	fgwBl5IZIbBDXhCRDscnJD4+SumML3RCe8asDFMJnUBmUvLSQVyJ0Ppr9h7R
X-Gm-Gg: ASbGncvCGxzFQ2OjTVIJ5T3G/TShNTMJUiY6KGUkynF0f6X/DJ6VdPjK9n8C/mzcJCh
	5tWZdHe7F1k9q/4fp67CXAxPfk3E+Z4L0V7pEPxY+HLKl0zG3nJtom72+Ip7ZjFcr4ZdnD8k1Ni
	I/r441tbMeNe1eKJy/GOA+jdAq24uE8t/NZucRL8/pD+vaHVdsunSn3f9QdgyearqAM/OQxlwdZ
	NznWHH3x8u40RB5pZk5ZwvF42pk5ozJsLYY8wM+FyyBE9U1XPDDzhcgboSk09Qv+Zu5VJ3a53wo
	hsAYtpjwkkwFkA3I6OJOZMJBrWHdgWNnKvlxG+1Hv7uYv/owd/daLEffGw==
X-Google-Smtp-Source: AGHT+IHFZy+0lw/Dp6DjLzQfA/ftWygxBDcebBKg38wTFmBJaPs8U389GwX3qDbhTwDISEehh/tR+A==
X-Received: by 2002:a5d:5f94:0:b0:391:4914:3c6a with SMTP id ffacd0b85a97d-3971e1b49ccmr12926932f8f.29.1742151407582;
        Sun, 16 Mar 2025 11:56:47 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb6292sm84692335e9.1.2025.03.16.11.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:56:47 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 4/7] arm64: dts: sophgo: Add Duo Module 01
Date: Sun, 16 Mar 2025 19:56:34 +0100
Message-ID: <20250316185640.3750873-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Duo Module 01 is a compact module with integrated SG2000,
WI-FI6/BTDM5.4, and eMMC.
Add only support for UART and SDHCI.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v5:
v4:
v3:
v2:
- sorted all nodes according to DT coding style;
- added "compatible" property;
- renamed the new .dtsi not to use underscores;
- added status = "okay" instead of deleting it;

 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
new file mode 100644
index 000000000000..bb52cdad990a
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01";
+	compatible = "milkv,duo-module-01", "sophgo,sg2000";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&pinctrl {
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-clk-pins {
+			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <16100>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cmd-pins {
+			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-data-pins {
+			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
+				 <PINMUX(PIN_SD0_D1, 0)>,
+				 <PINMUX(PIN_SD0_D2, 0)>,
+				 <PINMUX(PIN_SD0_D3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+/* Wi-Fi */
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+};
-- 
2.48.1

