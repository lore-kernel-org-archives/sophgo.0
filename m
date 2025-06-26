Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EF725C712
	for <sophgo@lists.linux.dev>; Thu, 26 Jun 2025 08:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750924875; cv=none; b=YMHrAVesj+EHiiVl80uoH3x8Mr19gP2yxqFMEI1uoWVKb76Y6U+hN0wAE26Cmzl4jYGvHpmBzj1CqFJeao2otVtENy3NDJUhYsRhK0UVoDr03qYWNAD+PuTq17Spknsx01/SVIXmz+DvyDuDlc9Agz/Wek2MvT/4HX3ohhQu4Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750924875; c=relaxed/simple;
	bh=Zf9YtBRoyG1fXgqH+qYiZixnKJmXnCz2BxV3aQe2Ago=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XbXpDBGPksUwxnBuWIvOdhuA0lS6+HSsIoDKECpvWwc6UrtyLNu4D+2+Un/P6vLE8vu8NHQRiHrVmQUBTNIfJ/pPGjY97YaBuO0S9HGmP0nvXSVjUB8bSLArOUVj9FD+dxn3Vx1QVHi7dfXnlm+dIwIUYPrtczf9O1hsrWnSjYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLi28A+n; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLi28A+n"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so908673b3a.0
        for <sophgo@lists.linux.dev>; Thu, 26 Jun 2025 01:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750924873; x=1751529673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6V/oR/DnwI2Qi+5VQkNfiNRfkRvGXnx3kp/m9SpAb0=;
        b=TLi28A+n37u+OHKXKjDB3/jg1eHsEw8ILKZj39umt/pgOxy8OzszyLuDtKxR0vAg17
         UgUonGOORLHXiSEszxdOlk+eqDT/w34+2NiQ3TVeLSKDE59FjuAD8jG62dGdiYxthWUq
         5putBuXcK4WpwVKPj3U270gq7mpTnH9ul6liUiDQAMtPidfCM37BXyGJeDLwzjJIX90C
         EkSc4vWtRVo8lEbDYkrZ+Kol4bB4qhK/rZ4TMsGNhefhm0/Qr4XcN5ZjJ/6nPDSp1xnl
         CNlwEH6G97LMEa/YYuKBr1fOH8FZpFNBeJ1c12zYwTSYHXC4JMaq8HnR/+/RtNWmY/Nc
         Ardg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750924873; x=1751529673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6V/oR/DnwI2Qi+5VQkNfiNRfkRvGXnx3kp/m9SpAb0=;
        b=wlfflu7YPPCc6vgzuQ/w+2kmm6/PUrTsFdBRqz+XMzc5Z/xUKTd2WNgbySNmd4Day0
         nUYMHL5MtmPO15YV78wukjg3XFXN6uZuKL/nDvAzTWYvuVNdW4dycpRWvyD13DzLep0O
         gSKWIuIVnh9QIwfvLMyU8j9v3mMfbH6x3UJDOM1cDH1rV7qq6xy51Frpj4Jpa2Vv1RlR
         s4LpdYfeo8Rih0rZZNHJH1muG5t6XFxCAR8mz4P8GOmwGf2kMLztA+xtjZmtahjfUlKT
         i3ACCfKbZy4E641r/15UDh+cIWSt+TZbtSs8h7wp8UzOf2u/sV/WsaCr/PYV4zf+imMo
         WwZg==
X-Forwarded-Encrypted: i=1; AJvYcCVwEOXzSAvn+VBe5NvO2VIcVj6roLyc3CW3A1fBJdEVNGCyQpZGpJLQOVs8SIFePS6K9UfMQGo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz97WuXGpycK/6XSQ/KiSAlZs3FojpNmYJjCp3NAf4tiBw2dusu
	Nr7uPsSHkP5p35VvM2KvthO9rg3ZjMWerfy+7e8A2UAPc5h/K75S3ol+
X-Gm-Gg: ASbGnct0JYukMCPIoQQYBlIbHMsC7TBLjBsd60f3hk+ZqXdxCvCeL7ze6biwmqyM8Pc
	MOObekxStrY+ryYQtz8YUwQynH/SmzH04EtxJPZptOdd6I7LXcJD/EmiKkCD37cP28D9ex5lqVR
	aVSTYQNWSov0RenAT/ap9DOXc8znVkZU2gagTMu1fDKOsIvSJuL3MT/9oF//DgrwR8gFxZui/VU
	OxRtkglUIKsaSqtV7Yh+xex1jG4KjMkfBQJ0K3CJU071z/ENpA/zy04yU+wvD9vZVH0tPTu4XAc
	NTg7WOofdkCE4IEvQb/SXEmhnFb57OxVUz3r+MIW/0ZYtzQlNAkjna7xIoCVXQ==
X-Google-Smtp-Source: AGHT+IHj+Op94mzlo16js4gRYFsEOUzqX/RPIICMR4H1DzKdZ+5MaSCW3aQOPebkZZvTUcK0EQmzrw==
X-Received: by 2002:a05:6a21:103:b0:21a:e751:e048 with SMTP id adf61e73a8af0-2207f289a0emr10750457637.35.1750924872745;
        Thu, 26 Jun 2025 01:01:12 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74ad63d3facsm3799107b3a.102.2025.06.26.01.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:01:12 -0700 (PDT)
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
	Ze Huang <huangze@whut.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH net-next RFC v3 1/4] dt-bindings: net: Add support for Sophgo CV1800 dwmac
Date: Thu, 26 Jun 2025 16:00:51 +0800
Message-ID: <20250626080056.325496-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250626080056.325496-1-inochiama@gmail.com>
References: <20250626080056.325496-1-inochiama@gmail.com>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
new file mode 100644
index 000000000000..8abd2cf06e2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/sophgo,cv1800b-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B DWMAC glue layer
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
2.50.0

