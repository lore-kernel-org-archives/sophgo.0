Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C95F126BF1
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629306; cv=none; b=Jhn/9j0Hhb/j0EmbjM750n8gDwtLt9s0bTZRYaFR0zWTtt2ZuFGJpXpbzT/0D45qWqFEC+JmLYbviziN/AgFdPEJFq8zNbneQqzoaVkCQcfQ/8lqQPYj7LqyqHQPxvJnCrlHLufdFyK3iFkqbVdDqyFahr16OvhThWt32kV+FWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629306; c=relaxed/simple;
	bh=DrqMQ49i01HIdFYjm/LKGgiRhhEO+OPa6PK6orMmpjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8AvHPq5VJRd1xPQasyfqlH+qjbSbAxiEhrFDgN0zuX9449414qnTDUm5KOJSPpmxeqeanPOaDd9t5sWdFhRNWNV1KFBfqZfquvFl2DpG9MqS7AWexzAxVNQTirZm+CRPWn5+Wa4jkMVzKdnJcOL5XU0+hTYm58ArmypPqV3UuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZPj7Ps2; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZPj7Ps2"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a442a3a2bfso112969541cf.1
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 01:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629304; x=1750234104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKco8WF5XLIx4+g+zOsrDdvMj/5C2WSueef/n5luzHI=;
        b=UZPj7Ps28RPfV6k6JyOya98yP2GILeBpkxP8JwdIlHdt4R2nCuZD3mSf6ULL3FYpnF
         ehtWJ2aXWt47+Ri9DRUKg73qen+NTyoRx3YG7voWwUGTMtjQT/nAmeMr9EpxVH2aSxPM
         MHHAzGmIq7FCdTiwiI+4tq0pl11dziCiKvYjpxO71wNiIQ9ZgIMAAclZRl6YBbgknb4Q
         XVtsVtPWp0Oy8j92so1VmsSH5lyKU2a4fxm7JtS/ZN6Zkjx2sx0C4eHYycr5mWSN+Pux
         zZxd2JdpRabuj5r7jzYXfVHV1r4DUnYdBmrOXkGB1Mf+kQJc/2goCOet4j+33Q2HXTA0
         3Bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629304; x=1750234104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKco8WF5XLIx4+g+zOsrDdvMj/5C2WSueef/n5luzHI=;
        b=F82xF10x7ewS0+93dSg007lC3laApBcVypjIfNeTNL0suDZcqsFeIA/5+n6BluNHuY
         9dun9MevzDiWX1yXxGsfTFXIy/j/2mX2ezeGKXPYTmKllMGXGfk9gwLl16Uv/2CUk0aD
         DColooQTKlAojnr5vQTdMSgFNFiUiY2t93rV+S0KLAmdMBAYWVIb4CUG3MH/65qzrJZE
         cB/DpLAT5oAnkVUm3fhuk1AUEuwNedSh3R4aiIH5QzytIPm1zkkRJsL86g7ipB9WaEjE
         b8X/7itc8qSFIVhfksPOiBhn9tV5fHEuCwtTN40a8UUc8T2ZnJlGxxxx8elZelaKOxzk
         11sA==
X-Forwarded-Encrypted: i=1; AJvYcCXL/7Z/j8DTUFI0/4FWb9ySUCnYTqLnOJHYufCplAv5cstq7Lq9KlhfFbwKSx87vkyosAkNNwQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHYTVh932z3XCQ4hH1SG3k26iZfBvrgiETxGU6xZ5BJAQwtIxK
	oJsKcfNTG77OjTmvWxHvYJJyY9sDt6+yMoBwuYTsEabchnkT05kiycAR
X-Gm-Gg: ASbGncsk9Sc3fcVG9pDtCteiq6J2DdnsozY37JlxjjfRmjLCWSsIn8wCA00NZUWL08f
	GsveCcMLb/l2waFpB7zInhzQXDE62s49eCNKaafxijt8suZUQaHaAFgIJ83lKuWxLguxlZt5Xsr
	VWQA4b0aCDyTK3+CIJtNlkXMKEvAygCQjQ8NBiw+ET1rk5CwomRScBJ5ghLLpyrf9CZP+SB+jYW
	ZnKmXBbKGUzAi0wscmIwx6ZMSUgCERu2YN65FIInIqpcSPrV4nTrQDcy6orHlkUnIpeJ5ypY8ha
	1Ov2M8p5qH37eMZt++LKhGlE0ePOGeuH4snlCg==
X-Google-Smtp-Source: AGHT+IE0wepui9ZWUWrK1RdnFP2P1vv+cUAkbMh57NubxjGl2orNJ+i+g4FXFBHss/bMOX/R1l7e7Q==
X-Received: by 2002:a05:622a:5907:b0:476:87f6:3ce4 with SMTP id d75a77b69052e-4a714c9d74amr33190841cf.39.1749629303992;
        Wed, 11 Jun 2025 01:08:23 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a611150462sm84318391cf.14.2025.06.11.01.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:08:23 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC 1/3] dt-bindings: net: Add support for Sophgo CV1800 dwmac
Date: Wed, 11 Jun 2025 16:07:06 +0800
Message-ID: <20250611080709.1182183-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611080709.1182183-1-inochiama@gmail.com>
References: <20250611080709.1182183-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GMAC IP on CV1800 series SoC is a standard Synopsys
DesignWare MAC (version 3.70a).

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
new file mode 100644
index 000000000000..2821cca26487
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/sophgo,cv1800b-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2044 DWMAC glue layer
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - sophgo,cv1800b-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: sophgo,cv1800b-dwmac
+      - const: snps,dwmac-3.70a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: PTP clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: stmmaceth
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ethernet@4070000 {
+      compatible = "sophgo,cv1800b-dwmac", "snps,dwmac-3.70a";
+      reg = <0x04070000 0x10000>;
+      clocks = <&clk 35>, <&clk 36>;
+      clock-names = "stmmaceth", "ptp_ref";
+      interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "macirq";
+      resets = <&rst 12>;
+      reset-names = "stmmaceth";
+      rx-fifo-depth = <8192>;
+      tx-fifo-depth = <8192>;
+      snps,multicast-filter-bins = <0>;
+      snps,perfect-filter-entries = <1>;
+      snps,aal;
+      snps,txpbl = <8>;
+      snps,rxpbl = <8>;
+      snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+      snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+      snps,axi-config = <&gmac0_stmmac_axi_setup>;
+      status = "disabled";
+
+      mdio {
+        compatible = "snps,dwmac-mdio";
+        #address-cells = <1>;
+        #size-cells = <0>;
+      };
+
+      gmac0_mtl_rx_setup: rx-queues-config {
+        snps,rx-queues-to-use = <1>;
+        queue0 {};
+      };
+
+      gmac0_mtl_tx_setup: tx-queues-config {
+        snps,tx-queues-to-use = <1>;
+        queue0 {};
+      };
+
+      gmac0_stmmac_axi_setup: stmmac-axi-config {
+        snps,blen = <16 8 4 0 0 0 0>;
+        snps,rd_osr_lmt = <2>;
+        snps,wr_osr_lmt = <1>;
+      };
+    };
-- 
2.49.0

