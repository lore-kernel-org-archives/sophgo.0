Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAEE1940A1
	for <sophgo@lists.linux.dev>; Tue,  1 Jul 2025 01:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751332675; cv=none; b=mo8ysDMY8tM9pbYuPoCDpMQB0WqB33S+92M3ECP/M+vBE/RsF+miUWAkk+PwqKyTjIGNqvx66F9bcoIA6OpvE9+VNR9M7prgMdP9NrERMVlNnIeSv4y+WKS0p19C1mYKgvJjHBhTSsSMy9uQxy9lLmUFf6q7bJlMOEy6deW5P0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751332675; c=relaxed/simple;
	bh=Zf9YtBRoyG1fXgqH+qYiZixnKJmXnCz2BxV3aQe2Ago=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PX0EbiEnsGY7tAGzyZpMjNu2juOGcGG2aat+Id5KNtoqp3Kzmj5guwzbGYIbzzRc4MrXVO+RVAry8E1tujOGP+XT4m731qY4c6J9VEPaRwDn9aDGRVKOnRwufeULbrnmGnF3zNd7REK/APfKLVp4Pg78ck0ObJpqD3BgebKIZV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCSRedr5; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCSRedr5"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b34a71d9208so2116131a12.3
        for <sophgo@lists.linux.dev>; Mon, 30 Jun 2025 18:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751332673; x=1751937473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6V/oR/DnwI2Qi+5VQkNfiNRfkRvGXnx3kp/m9SpAb0=;
        b=mCSRedr5tm5tTfW8JFtzVoFny6InLahYTBm84RYzGjqLu8pXp/k8Zr9dApEbPRU7PX
         NoGcoladyDvtGOowcfUnRVVhk9IS+IFSbmkTcuv7YJzkRNeNsHpoGlzh5bysMN+wr7Rt
         EtLWvV3kHnaav8HvrOBkFRD8V3tqkusXFJ23G4ORIHzvoU0xCdlX3FajyIofloSuICht
         O0N00BS6gDeiviNugNkznKQ/jfyrX55qRnrhbHTjUBYire2VswEochtNTWqM7hAIktab
         JC7pyhGbdWHipet1QllliD2FLEgOpL+lDqDdSX4kZhjYUxXRlRgDhjonJGYY7Bm9m6B0
         tiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751332673; x=1751937473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6V/oR/DnwI2Qi+5VQkNfiNRfkRvGXnx3kp/m9SpAb0=;
        b=i9jTchSOzpiCTQOkLsffQOrRh0kAOU4HlTJbOITzR41Y/e5YrpGFAm95uc3ZGF696g
         X2OW8nfto/OhYHpAEORF5vf6wGJ+NO8D/J8IyS/1HGQlb8d1zsUBjZIPg7PjlsW1o7Nt
         nNCB4OiKdehz8VOYsm5zqwX+UuvTDOWvob8e6tcPUcUwT/5CBXVGtVKNnORR3CIY3wIv
         DNBx/5mbQ38r0sYv+bbexoNTx/4ow6nJIj1DvQ2YxQq9Mau61sH0U0k1LImYEOu2yfrZ
         5mX2f8Wq7rHhKpAnkyZUS9Ae6GuA3CkLEjlEtzZWmd9xSEuXVh0mSCYDEjzsWt24fHu2
         wKmA==
X-Forwarded-Encrypted: i=1; AJvYcCVh6yUo9uB04JsaMNk3wpyx9bgrG1k+q0/amCwRP8ytbkhFaq0ujo/QgI8p9QP7/23cojPaIQM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi5XQkNgXBoeka4gVSNEsTeBLgEhHQLWooqnvKAz+rOHVxq+8k
	y6XgiRVdowhTrR2cTo+twuERlxjOSZAFQANeIDDiaVQBAzny9H5EYXUD
X-Gm-Gg: ASbGncsiT79bzN1dXic6cBExc6Qn7zZScpIEXl5J2K5bBd7X5D9idFiGOegvMHBzuDr
	5h8CQSI+XTfI8+iVzJgkxXSQ9l9dXGsbxQRNETnKkaIhEWM4eZoBbiILaLTZjxxja66FPatwv1t
	7pccJJv1aylIb1otxNzCYnlWNAGUgsGUPsLezKOiYMJ3RGjU4dZjMxhtBajavhBYNDQSAywwmMU
	xu6me4jXt+/quotd5mr13z+uILgCBPEIHqwBHzTJTRiQWp8Rr9N0rNSB9/5wcaeZCvttKqQM1Rx
	FQjawnpl1868Pfikl6Gc+ZBHX4+OadgbclDb09bLks8AYSk7R3vIAEG2+tTT+Q==
X-Google-Smtp-Source: AGHT+IEFk/FnRYvs6Y6xEEcbP+1Lq6A9vyPI9waISIZsADUyiuWGqUmeYCfcJmprh6OASfWb+Olujw==
X-Received: by 2002:a17:90a:e703:b0:312:b4a:6342 with SMTP id 98e67ed59e1d1-318c93101afmr23958419a91.33.1751332672895;
        Mon, 30 Jun 2025 18:17:52 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb2e1af8sm91067735ad.41.2025.06.30.18.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 18:17:52 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH net-next RFC v4 1/4] dt-bindings: net: Add support for Sophgo CV1800 dwmac
Date: Tue,  1 Jul 2025 09:17:26 +0800
Message-ID: <20250701011730.136002-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701011730.136002-1-inochiama@gmail.com>
References: <20250701011730.136002-1-inochiama@gmail.com>
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

