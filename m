Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA671F8724
	for <sophgo@lists.linux.dev>; Fri, 24 Oct 2025 03:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761275167; cv=none; b=fWvNRG14HyQknEK78jB0NUSDIGY6QBDHdjm1VUkIErv6ikdG1qaIPTmL7fWHAVMHKubV3aTHVagATtEGrcdMwS+uefN8iXwTB8nCZdfK9iaiOW/kqQEsEhXMsnqpP3RIBTqVEfkSEQpbhUseVCaA8sHlCe2PWqFSFDFnftMpWww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761275167; c=relaxed/simple;
	bh=jvSX3J8jPQqhJX2B4VHaOlDmkC/RiIzNCXzw8R80QpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b3o9uOkKiPn+xcToCyPDLy3j+LH7KnYrMlJI2CeWy5nFQBSIPaHOia2h93Uk/wRCjBR5cF7VLe988H6mShy17YOXEwmIC14umg0JGxBDqbuwrRl0JiEbSkFxCuHnPbEL9pkGyw+v5c7e5A9JyDa4+H6SqVct/KYCXf5nSMMDGiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/F43LiV; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/F43LiV"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7930132f59aso1988357b3a.0
        for <sophgo@lists.linux.dev>; Thu, 23 Oct 2025 20:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761275165; x=1761879965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pQ7cw/eYIuJvEdOndGkOkiOfxNm4SkQwTboprdy7EY=;
        b=M/F43LiV/Wyxg0t47lnRQzYX+B+7hcW/e3vG+kVorpVRjVBJCAZEOx0hXOto1A8bE5
         nLapvvNIel/NSd2aQ2uJTpuz50AGY/Znm0gn0753a0lod57eClZrYQW9rdv0Uadc+sA3
         R/pZXPPOk8+opmxlk54DWwEkccVTNSxhZ3RH3bUuyTYt3+WzvsgS62KhpJdzPBPeuTCL
         A/LW9/Hp1fVwyjMl7wW7Nw5z6HPakh4iR+DVf21P6T9EhSTQm/yb6ngVOJLUMniMaKZd
         0mJbAhP4bSEXejLYdTxB1Gsh5QqFMoSms/tcDENH1lpSY0nDY67NxNTpV2jRSopnyXNN
         eR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761275165; x=1761879965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pQ7cw/eYIuJvEdOndGkOkiOfxNm4SkQwTboprdy7EY=;
        b=h+3QtVq3cw0OqGskmjQMiJlyW7sLklQeE1uZZgPNJMK/d5DCjlVV97IpeuYjXA2/yj
         C3+geBMJ2+EP2djNJ4nIWWSrf4fvVdH9hM1YufcqVQWvBmJkE/SWdF4bMYLI6tqeVy6/
         k7B56+g8QzWhTEeIhrBO310komB1YzM8aaD+Hul11X6mOaVw+R1sn58oDEhDmK/xkGmR
         48QopUWs9FzlRmSLdjr7UN/nAAb973UmcDOhWhslO8eDhyiu8dOP/vBGfSMpE7Tu0l0y
         rKbEmRJkpZMIbOrc+eAxsl5ZUX3ySGvrwpnWFKpBcE7fTh1HX0uiCYfIHU2F8AxPp13Z
         Frfw==
X-Forwarded-Encrypted: i=1; AJvYcCXPpz2L5+p0e1vZti8D/C6IOXRdgX5zd0zQAx1Hs1IQac1b11pysKmWr5eFl5CtWnGSFUuJBYU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgb5gP2NYXCiJFcMplkMpHFAOBMhIPrwE/7rtRuJ7NXgVrEzCo
	xHF8xI3o09IAOATufkh3g8LgbQPs8zIGluSxct5ULowPyM17pH2SOGkb
X-Gm-Gg: ASbGncvN+hoKErH/9cmeMiqLFdI1ZP5nn1CWmUMXfD3ovebF2EmQc8b/2btPVZyu6D3
	P24Ww1ZL+c+Ub5Fa9peqL9hOS3qSpLrNptJsVcoTc81IaNKbxGNq6nQMu/Dhz7d2Ld9eMIdkeOG
	PknIsIwCzd7hIf1CxrRQGyWF/TI13jJwFp0aOnknwgoTQiHHj8DGTSVxRJL7tDcS3v738LzBP20
	KkjqAySfkaAdINSzFxW72PL8SloUH47vvnGMYaCgespQeRnPqE+TkIEskSS8mtkk93GO9xxBE7H
	cBYAZPowmfjMacb2PisvT31RjX2ozmWLNDXyg68aRo9xawug0j/n2JKaF+kG81qydlSAzTJ2K1U
	WAc9h5HJBafASF/gYl/ydFI/7MjG1CW5eLpWWXVSVjCu/ejsMTp8LfrJ/x/zIdWFq0Kjmk83RyT
	4+11lGPb1AZs7RdPAM
X-Google-Smtp-Source: AGHT+IH6m88GOzv4ruiUFmy0KxUAD5xi8gFnH40Y4X6IxplEL8oLQu8svkKTRzRK2vev5GUxpR773Q==
X-Received: by 2002:a05:6a20:3d05:b0:334:a2ed:5fa9 with SMTP id adf61e73a8af0-33dea180ff3mr788936637.9.1761275165082;
        Thu, 23 Oct 2025 20:06:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb86cbsm3574172a12.7.2025.10.23.20.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 20:06:04 -0700 (PDT)
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
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 1/3] dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
Date: Fri, 24 Oct 2025 11:05:14 +0800
Message-ID: <20251024030528.25511-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251024030528.25511-1-looong.bin@gmail.com>
References: <20251024030528.25511-1-looong.bin@gmail.com>
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

Co-developed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
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
