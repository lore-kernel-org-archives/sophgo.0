Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4692EB866
	for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760949564; cv=none; b=WsXyvq+1FRvRgebIksnF9kmnkkahjI1Vk99ZBS/ZahKdooWVVJHoqmQym46FX3QZ4NgnS/mmkVpO59XJFWWG1Kjm9+y1vOnSInc4AuXW/0anguOVpqIOLKPeHkA/PEMRxjIOgid2uMO0QQnSVXLH8I69IhQvecGj4tgPKaOgcKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760949564; c=relaxed/simple;
	bh=SpdjqF0RNVAIJOByNkOLYV27BSgUDptGZvchj8Jm9Ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7lPu2odfxdtiW1IyD+Kf3ux7wE00QVTN5isdcusf09Ts1xtVcvZgvLDjqZ8NtVwvZz5JOAVPA0jCxvB5lcruDw9OI9rK0cOsNa8XnLx7K2PHIK+WID7upMvbV03gsfXtzgVgxKD9q6ZRGsLSd6ih1jVPVhTWsnBrqaU77J+6io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1+THXlv; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1+THXlv"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-791c287c10dso3153424b3a.1
        for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 01:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760949561; x=1761554361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0wVZ7hOfq1JTjvymKctSVmADp+L2YAB/emY4FxmrCM=;
        b=I1+THXlvkBB9lRI1sZW90siFwO90FRghq2W1h4ptTx1piiX2zQWa+PqBciZDRZa7fo
         WaL7n+/SZ2uLAdW7m+we1bF22MncROFHafhgfnr4igFFX2L7dVCqk0EsW0UWVtWeK5Eh
         Od4yD02FdQN/EoQLlZF45IdepauQHrIaalX+hqwLr2ruZ47kSSsDtTim1Hd6Y39XZgzT
         uw+YFvbJ9p4pKU1DbmXsp8avC0WPzuyLrPKhMK6VUvNB7GAsLBnRShAt4JG7KZcLxJ84
         36QWm2t2adiXIgZIgt2sMr5TKKQ41Zi/bJyRG/rOjOfSIOdybFM/iri+kLUBv/sE9TMC
         imhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760949561; x=1761554361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0wVZ7hOfq1JTjvymKctSVmADp+L2YAB/emY4FxmrCM=;
        b=Vg1ky91xK9iQ5D5irQY7HOnkLpU4MhfWTuN0xhCOZXciXVe9eUtyZ7OKwwglye+Rwe
         oJjqEf/VdlosCaRdzHGJNuIlv/e/Y891qTsYnRVbYL59Me/C+ukkUOuLClNzI3HAciyG
         LlWgLsrLEqs/Hl+sv1AtCH1na/4WxgncH5eQzxcSrwB46jfk4fQvKWOndcwHQsNO+npv
         ljJ0WBq2Yx+lv2PCpmdhFPczvOopVQon/PWXd5YTOz+Jt8WjtbwH2u9tgiWRxoo/mywS
         Zzbw6WfWdu+a5w0Pi8vtlEX8LYoYFiuFli8slmsPyY81l8FSnh2GS7K1Sx1HI7xHK6Gm
         u4kg==
X-Forwarded-Encrypted: i=1; AJvYcCVExbVWCtPQflvkgm01TvGGvwpJuRIApu00zJZGu5x40Rqc+4XDJjBk1+3HAR1R2JKkUv9t1S8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFlYYtBOntnm4QMjiqa9PRos6Fm7/UuPqNGV1EC+nN1Um5BxBq
	rvCsp1G6zRwT6IjEhboOQFs9NCh2oowPIhEHXFAVq6P7SbVgDyn8A/BL
X-Gm-Gg: ASbGncuG76Dm6Qe3A8Ggxwy9WO1YaNXnF6Q4Os9JdhEIYlUVpv6i0Bj9js3Y7WCGi69
	dAPrVSaQQ+N5b137LGA8XNVtiV59xELuDPVKnSlzd8USAauSLp3ECm1WVG2RlM0l7dz8GlUgshF
	t5a/G5rZBnVzsqUxXHJRRuC/17+ZmdBIcCdYusxvQ/6va1RDAGMdqQLXflm6aSLWAisHo57WHLd
	18D3JR3OvNvGI80WtALgDoaFifbYLgx+ONjMoX05sopUOKeIf198naEFTLzVAn8hacTFqdDsunD
	Bzg33r4TYC9TSXkCw+0c4e0olA8sn138TfOfjphwNDC9J6+Y1JsmZkZUjS8m58teyzokrOXPJ6o
	8sWQuCRv8jLz/MHX5hqOCaVvGcMI8jEMWvRGD1PxVPlpvmXkjctQys2VBLtJ6s2Xv3kUeRTFhA8
	3AVSDvrc3hqXBmcdgZ
X-Google-Smtp-Source: AGHT+IFa8iFYE1mHZNLZZAoIBMPVdnAa15DTVssEZvzZFMtBAOg9AsW1j5BAqmNh19zqSPqBIE1AmA==
X-Received: by 2002:a05:6a20:9144:b0:334:7e45:e6b1 with SMTP id adf61e73a8af0-334a8546501mr16610469637.14.1760949561425;
        Mon, 20 Oct 2025 01:39:21 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b5d0b4sm7062386a12.29.2025.10.20.01.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 01:39:20 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
Date: Mon, 20 Oct 2025 16:38:31 +0800
Message-ID: <20251020083838.67522-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020083838.67522-1-looong.bin@gmail.com>
References: <20251020083838.67522-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sophgo CV1800/SG2000 SoC top misc system controller provides register
access to configure related modules. It includes a usb2 phy and a dma
multiplexer.

Co-authored-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
new file mode 100644
index 000000000000..d044ca661fa2
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV18XX/SG200X SoC top system controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+description:
+  The Sophgo CV18XX/SG200X SoC top misc system controller provides
+  register access to configure related modules.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: sophgo,cv1800b-top-syscon
+          - const: syscon
+          - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "dma-router@[0-9a-f]+$":
+    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
+    unevaluatedProperties: false
+
+  "phy@[0-9a-f]+$":
+    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+
+    syscon@3000000 {
+      compatible = "sophgo,cv1800b-top-syscon", "syscon", "simple-mfd";
+      reg = <0x03000000 0x1000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      usbphy: phy@48 {
+        compatible = "sophgo,cv1800b-usb2-phy";
+        reg = <0x48 0x4>;
+        #phy-cells = <0>;
+        clocks = <&clk CLK_USB_125M>,
+                 <&clk CLK_USB_33K>,
+                 <&clk CLK_USB_12M>;
+        clock-names = "app", "stb", "lpm";
+        resets = <&rst 58>;
+      };
+
+      dmamux: dma-router@154 {
+        compatible = "sophgo,cv1800b-dmamux";
+        reg = <0x154 0x8>, <0x298 0x4>;
+        #dma-cells = <2>;
+        dma-masters = <&dmac>;
+      };
+    };
+
+...
--
2.51.0
