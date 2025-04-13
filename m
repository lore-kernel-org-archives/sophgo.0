Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E9A19CC39
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744584340; cv=none; b=S3ZasnjPao/rT7q7vq2KnaMKDY7SBMFQ/DwGbTIo53js2plK8oCRNc/YYk88mMhtdUrLu72zzk9/LBXWl9yIgwhP6zSyFCh/q6V2ZEPJicLnBNTuBBAcoXV6926OFfZz2a1CA8Y9T6lCmHjKiQ7Mk+R/VGWXcxetIHQqPpPxoUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744584340; c=relaxed/simple;
	bh=IgS0jySddCzILyzFOwKBzCA1CFn7BMJSRZKtoNDzOJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDFxbIiV4KQrYLmabtQ1Ok+1uOFFpDx27UGaRhcPX9dngKKlkOhT0luNgw7+rbl4c25tHcpT5qYXjpZ8xphdsP8U3MURepXcU41mbHjMJKpjZBonMzGfgPxY24rwTTTyKjfJI1/AGs41x72FXcDCDmml8y032LFLGVJtgAkB/XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctniSx4e; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctniSx4e"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47664364628so39697101cf.1
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744584337; x=1745189137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLv1Jm8c7NQl2IjDh48safa9dB7KVfLqnGCbo3rz2Wk=;
        b=ctniSx4ekpzrt+7G/14smur2E3YqNRctUoMYp1Q5DYJySzzhsoNCQ/c/IRhQnjGG3W
         5B50v9YfiSIluQ1QgFCjp2XZQYwe5yrpr2Kak+h0rFkmFVDOMZMeDDzH9Bp7CjMNHMUI
         cBnBTTpAV4dfxP3RM2hSp7UAKHRB2fo+eDB1+dkcpCBkJ9EHHccLXAv4dKQBhZR3dM7X
         P7fubWiK1+pcTFh6Y763YwRhNIB+8BBqVzBVqEa7+xY2bNbAq2cd6TvcXLirk6x87+3g
         cdHt5R1KFhfkbFZD3OwFr5lzYmP7a+dUHWcnumk/eV9EBL5Y2EqeEfvdueWwZqkYnHLK
         1RVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744584337; x=1745189137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLv1Jm8c7NQl2IjDh48safa9dB7KVfLqnGCbo3rz2Wk=;
        b=Ru9mrHMWtx51uMJtSavqRZfiOZD/G5d8F0Gor8ed4HvgfITJVhZ9ARmxcEH1n3uVN/
         kP3SNvzIFQPITyd9SOgWfVSzxp2aVGZQyXMFE+scIQ1rtHdOPge0wMEGuRiG3OQ9BcSv
         pAgG7K2ztdMlZqIXgok3lw+jqG5BWowCo592S3v920mSKuyXdfiTturcl8D+S/tFE7ko
         ax9PTWJsPMkNNHktBoe9WwlxEkRxzJBbK0rd3q4aOQmeeAGHs+q/jvPEDFNebmzUmjw0
         auaBrAE3va6aiKq77pPvzXTIydB88XVXCs98UO5wnlZyFswIzXMA4N2FeB29piXceyo6
         qZWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc4lFCBysjgpqfQnIgINe4hE9tO921nC5TpuTkDJZlv6xQpvPS7p6zHB4D2PLAUSQceU0wDS0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwJDv02cP9RhNT7l6uGlA9YQVUG/s5sfHei+EO82ac+FY8mvAF
	xSOJoMqXs4HN3bdzmTH8/q7Cv0+pTBjZtuwb1And6Z1neP1Mf3Pt
X-Gm-Gg: ASbGncsQopz19+s8g3dKCiXsHeSDlTEQ5fiNa+15dfTMDSUxoIlXwv/Q+MoL8xICQRI
	XJZ5n/40pqxvATNTYKq+MVWa+ea2i77xo2a+d0DRjCLZq6E9VoeNCPg+IQO8sjS6F6mG4lHS+1O
	3LjdQb50NjYA9U9PBm2immMKL2xnencoOvtBo5BL8yzXKKVGzNbmqte9lst+NJuYSqXPiY8xaPu
	zGzJJjqMEozqNQCBL58neDo2TCqnhBl9H+0ORpp/IfeJyBZF73TYQ4VumQaXYBL5WZVR0PMR0CW
	RQe5uBMgxFwHDxi2mJFc+P4Ooe4=
X-Google-Smtp-Source: AGHT+IHWsY2Igh59MObycnfp1lr69NA2wpEqLo+C1nHbGkC3vdFYcXBFU36Hw70ORCEGaebGqBPvNQ==
X-Received: by 2002:ac8:5dcc:0:b0:476:afa6:3218 with SMTP id d75a77b69052e-47976d2f609mr153909371cf.14.1744584337110;
        Sun, 13 Apr 2025 15:45:37 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7b7cd5f4fsm298797485a.54.2025.04.13.15.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:45:36 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 1/5] dt-bindings: soc: sophgo: Add SG2044 top syscon device
Date: Mon, 14 Apr 2025 06:44:45 +0800
Message-ID: <20250413224450.67244-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413224450.67244-1-inochiama@gmail.com>
References: <20250413224450.67244-1-inochiama@gmail.com>
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

