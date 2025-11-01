Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F120624339D
	for <sophgo@lists.linux.dev>; Sat,  1 Nov 2025 01:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761961484; cv=none; b=RKW+aimC2Zxkqibw6L/gBQn3FuuQe0EQ5IgiTB8S6t1jmiN3DU9JpWkbq7sVI+L4c0eFh8VkAvduUbEI2iwI13JXU8tF7+LtjbPenc1GfMmpEPXdv8HeC2IWPXaA7rZzQZlxX1TuvUrDbcPucTxtrnO3LcbqYo0E5Y7WvrXe0cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761961484; c=relaxed/simple;
	bh=w2q8A9IGTvZVc96PE268CI+UYIqDqqzAQjTkQcUTTf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6Qfv8+315EjPtIxq+Wh4vkFgzhe5skpSsK5A5lrcZPEZXixXAWIBbv13joYj0cWK08E6ehSn8E5aM8rX+8U+YXG3Pq+nRnzWIf4Rn11W576RUbmf5Xj7oIC/HYh8Q0EUnULbGgBC/WzT/pW8NBJS7a2zsDOGdaVUW9Hx5PBQoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hG0JDdNM; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hG0JDdNM"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7a2738daea2so2862292b3a.0
        for <sophgo@lists.linux.dev>; Fri, 31 Oct 2025 18:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761961482; x=1762566282; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGEyWBftW5DrlPcZTKmzDkZi1ol5FQ6mGvv5tC6kJvQ=;
        b=hG0JDdNMiieENxsm/XaXjS70rU0LGt7lKSrjbEC3qPpIElJvFeR7zE23aA/8yFH7PU
         SifEw+dlTYyuZgfeL2EYgdXspEyKEU+t00mAW9LloPmBms+7sIp8hLHkCRO41lGMh+IS
         vYEWcwoJf4fmdX7tyzGlk45ngHCow8Nysn6IMTf+KUzOW3tWJFnzeyNI+V3yyDVmAOtj
         4WVBrLNKqdu8jFtTkA0UZ23uJiTUTeWaafvuDbEfF0yuDnCJznuIRqWPI6PHrZLbiNwW
         3Gk2L429wGnNVCUV/WIz7hSO0+uqFJZ5MvMMhK1AIUNKlOJNra5nr6u69001Ik0iswcF
         /orQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761961482; x=1762566282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGEyWBftW5DrlPcZTKmzDkZi1ol5FQ6mGvv5tC6kJvQ=;
        b=qfq3zcKSfhjomwMeP7ReHr6kC7qlQQE8bcf0S7fnjgpgiWzRTVBEjoqF4TTtJjdQ0a
         845Kuz+dGXTLYp2yjT/blq8LGc7t3Qhpqefhpyj5Bb+OWBynJtph9vg+9aRZCq707UOC
         RJ8UTeQmvSGPrweQ1D+S5keiGKCrXN9RLik5I3Uq9V2emi9JQU8Cd3dvr0DlSueKP/sp
         CeoisdbOpkDe1krsWs38bjb63+emTvoXjbxLJTFZ+lc2qu5IXr/AROlLHhvQC4GFwrpF
         g1NoWSb8KT2E1Xlf8VEKf2ybqeiQyNp7ge5sqpvlmSksRoE60ou3g8N3cJUzLXqjlX/7
         5pVA==
X-Forwarded-Encrypted: i=1; AJvYcCU/R0YFD35kdHdaRfgQNNpg7Dr68HV6JcZiVzNObZHoYUoNGVVmWo1jFvMJ/P7d13bmQPDowyw=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg04iUbbgWj3khB/KT37wja5nGwAq/SYmikvNe1jNf0GfASFvP
	XQj/h/mDoUzgIWBsvd/6IZheh7bNrCHZEkzkeUf5dqzmx34qO3KrwN8D
X-Gm-Gg: ASbGncsTWIXvEZqKVtu2fuD/QUyWRYSKt9RegK9Ah5HmriEfg8QWqBRgYU1Ey7UgHpc
	rvNfFwI+UQdKYpjB/H9dVMoBm0Xv5idrWhxLhgVQXjxO/In4C14VrcZHf0dscs0Rl3Zyqrd3ydN
	8Ffusff4PmMxTsrPK/BTvZKtQT4PAnKw96eyun3MvjuiYr9h7Y9D3ADthUNUQDrudya45yhk5GF
	uOJ214rXE+Zeasnsgq3SlhLd6/lOE3ObbLhfOpssZyQmEpvcREgMEMFruGqxP56g+AlU6VK0yJd
	eLlOMUkfr7CqpHmvFfR3HYUvIjmYVAFfxPl++JZkba04L0MW+0L6dq6dGNlGHsV1mBlorx7bImd
	CzW4qhQJnddHJoRnQnSE5Ad+rX8X5vFCuBPALV4hmMcj9b83eOa3GtFKaA/5dmjNwSFd9Fvm4AK
	DaQwCddKad20tGkA0GOhyTDCfei0k=
X-Google-Smtp-Source: AGHT+IGVnAhHQAPVSq5nCa6R8Hw5ech9EsY2fmArvbREf6/D1ElN1DGY94J4rKSbFr6PkzPXCQCBhw==
X-Received: by 2002:a05:6a20:6a08:b0:334:8d0b:6640 with SMTP id adf61e73a8af0-348c9f667d4mr7669733637.8.1761961481971;
        Fri, 31 Oct 2025 18:44:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bf078924sm3350585a12.32.2025.10.31.18.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 18:44:40 -0700 (PDT)
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
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 1/3] dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
Date: Sat,  1 Nov 2025 09:43:21 +0800
Message-ID: <20251101014329.18439-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251101014329.18439-1-looong.bin@gmail.com>
References: <20251101014329.18439-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sophgo CV18XX/SG200X SoC top misc system controller provides register
access to configure related modules. It includes a usb2 phy and a dma
multiplexer.

Co-developed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
new file mode 100644
index 000000000000..b2e8e0cb4ea6
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
@@ -0,0 +1,80 @@
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
+  dma-router@154:
+    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
+    unevaluatedProperties: false
+
+  phy@48:
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
+      phy@48 {
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
+      dma-router@154 {
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
