Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791E9266F1C
	for <sophgo@lists.linux.dev>; Fri, 18 Apr 2025 02:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744941816; cv=none; b=kR1XQBb6L8gbbYSqtfjNSyMVMh87CkjJJ/Xn1fqG+gFbSqReHMBgEdAmwIe+F3BH0Q4bzXRosMQjVRclq5Ha8ibTlbvPIocOeNGuwKItfQ/yAPJ+2AP7W4JS6oLGpd4ZYu6g71hEumpxPSp0pX1lz0gikl6Q5/yOhALPMf11dSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744941816; c=relaxed/simple;
	bh=WLDxpltDErOzVOTnkbVqExu2Ae4XJAF05H9tQcPPm4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQD4MTB4z9zx1pAW23zCCVelco+JVfKpiBNu45xxKQdV1+UT40+SIsbnMsfSj2ZbUmdxA2hvR36iiRcBTuARpetXVkntF0X3bKwfL0i1X0ENJVuWRNLH7zpn5DQuIkr1MjGs5nF9cYLkB/IADKT9GgVNpMwhN5zjK+Jqui7fdMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMTs3bNE; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMTs3bNE"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c7913bab2cso131205485a.0
        for <sophgo@lists.linux.dev>; Thu, 17 Apr 2025 19:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744941813; x=1745546613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oo/SYU99E48j5meaZwc3qX5Cn/K5aoYJsX5SSwIrrhE=;
        b=iMTs3bNEozpOsRlYLm4mJddiwoOtmW5etKPSpEFWuxAEne6++9n6MhxRX5kBhK7vgy
         XXv/Fm954jo33Z0/5AYDc7vhyEzsjn8TFlZ6MJfvqMacEQMJauqAmYS6pazs1vNOnLch
         LWiubcukAPpOFxUaQpBZA1WmVaeO+JD1BCAyUpeOehIKtNf5E0hkLxtEvn9NdvEwnQoL
         /rLa/DwuS1gJivvVRzikkSlQegfZK5wUonnb75GqcYUlrogZ6NpIpUR4yNyDsL3w9ifI
         XxfMuqCfEevOhZ3b3BoZHxG58anpSaxqMrq0f8ld8YkgoOa+5d4IzdlDOl6YBIS0IrD/
         wcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744941813; x=1745546613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oo/SYU99E48j5meaZwc3qX5Cn/K5aoYJsX5SSwIrrhE=;
        b=Z0AnW0bf+JKwMV4ajBdYbuFyEuOj5f2S4A38oKp3xSJsxAZ5ut5rfBsJ5cw7yzRaHB
         by0JFUQ4lDLlvQuD2CIrspMIlDbBzUuQLZi9pT54c87rrea0ZAOPB8DODt2Wn8WbNHpi
         qI8wtjOx5ZBo9MZ0ivIOFMnSdV/8VwEVL4yt/Ms+46UiH5a3qrjIOBOAciGzu2DzuPjc
         7S6jyPpKNT9pEdO12DSy81b8A0IvGDMFWlFW+00yNXkAUOFHffoBFGoYy6ePBOQfB7Lc
         LeJw6mIjr+6+NqYc2kvW1/x/4H0oO9480HHPeTOId2dEw8NKmiKXpxSxiuVR7XePv+VJ
         I3TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmbMS9q9MZT/9vlhPgT2nofs6CmUxEKtpbV2taJE5GxAHNPrjyKHqERcW4odiEZ+io6geqRws=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHwBNPMKgmEhLpanjN2uXKqbrnABEzkuPbeFGe1QTnPCUBqyzi
	4eSQjmKb5KGGJLVvtFUXXKjoEYmXGnIdpGZ/7OtDCDF/5oasw4tM
X-Gm-Gg: ASbGncsawsdMT3av+xEUbQxC7Q3OKwpUMqLFAweoptMI7ldEeaNkWfx+BjNJP9C4Uvr
	4s+e//6n/mUhoifyN08baNJF3yNmxtj9vdfGQ5gE3Oh+GbPtA6Eytm4cxgPQgAz1y3uyyZfy/nF
	ZzcOYLADwgJBSrOGuGcZsUJoxbmmVygn4kXXYDXSX87lTBATttZOfcLV/XEb5P+E4lVOJX3qrcf
	IVD8Go2SA1WjejyDQOCkmmW6JLr9en+OuSir0ft+YNoDSkL9p3gQtuz2MoT4mUjlcjwpiZKtfrO
	D7fWhSWP5Z+OfXSL
X-Google-Smtp-Source: AGHT+IH+YKx8zZs28YS6wYbQg0JlNTkgEFi5Q6vqgeUkpK1+4+JTc0ay2QWGOVpjNqMg1ZsOzDWH7A==
X-Received: by 2002:a05:620a:450d:b0:7c5:4788:a14e with SMTP id af79cd13be357-7c92801875emr157001285a.39.1744941813256;
        Thu, 17 Apr 2025 19:03:33 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47ae9c17a07sm5564621cf.7.2025.04.17.19.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 19:03:32 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/5] dt-bindings: soc: sophgo: Add SG2044 top syscon device
Date: Fri, 18 Apr 2025 10:03:20 +0800
Message-ID: <20250418020325.421257-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418020325.421257-1-inochiama@gmail.com>
References: <20250418020325.421257-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SG2044 top syscon device provide PLL clock control and some other
misc feature of the SoC.

Add the compatible string for SG2044 top syscon device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../soc/sophgo/sophgo,sg2044-top-syscon.yaml  | 49 +++++++++++++++++++
 include/dt-bindings/clock/sophgo,sg2044-pll.h | 27 ++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2044-top-syscon.yaml
 create mode 100644 include/dt-bindings/clock/sophgo,sg2044-pll.h

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2044-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2044-top-syscon.yaml
new file mode 100644
index 000000000000..a82cc3cae576
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2044-top-syscon.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,sg2044-top-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2044 SoC TOP system controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+description:
+  The Sophgo SG2044 TOP system controller is a hardware block grouping
+  multiple small functions, such as clocks and some other internal
+  function.
+
+properties:
+  compatible:
+    items:
+      - const: sophgo,sg2044-top-syscon
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/sophgo,sg2044-pll.h> for valid clock.
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
+    syscon@50000000 {
+      compatible = "sophgo,sg2044-top-syscon", "syscon";
+      reg = <0x50000000 0x1000>;
+      #clock-cells = <1>;
+      clocks = <&osc>;
+    };
diff --git a/include/dt-bindings/clock/sophgo,sg2044-pll.h b/include/dt-bindings/clock/sophgo,sg2044-pll.h
new file mode 100644
index 000000000000..817d45e700cc
--- /dev/null
+++ b/include/dt-bindings/clock/sophgo,sg2044-pll.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#ifndef __DT_BINDINGS_SOPHGO_SG2044_PLL_H__
+#define __DT_BINDINGS_SOPHGO_SG2044_PLL_H__
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
+
+#endif /* __DT_BINDINGS_SOPHGO_SG2044_PLL_H__ */
-- 
2.49.0

