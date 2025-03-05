Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF571EA7EF
	for <sophgo@lists.linux.dev>; Wed,  5 Mar 2025 06:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741156797; cv=none; b=qG83f+P0bz8j8dGIA5/Scv0bPx2xA6M5lfxQe7EfsQeWajFbs2/rB8vSLjhsae6dfRWvAWjKMXF+Fx4zFFQ1XlOQjX5FHKb17is/juqujMTq1YpedD4zNUjbBw3ObgjsDqYyXF/jbBDlGZx7TYtL2zFXo8qlMcSZDEPiwxWCF/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741156797; c=relaxed/simple;
	bh=rBXNuRvrHKraLlcS5FsB4L0lUJGAUOlWg4KSv4THZGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z77CEeVB9BJrts2ck2Fmz+xCNcu1egymyC1jtA1pfNaMGQ4GtuIVOdmU1Z3Ia8r944diPOo1POk1HLzUtSe1kzj888ZEkDBIfp4BnSq4wlTi1+/TJLlUOY547PLOCYcuPi/3BQdz7yXNWca7Cnc4si/N08jfnykhL9wQO3CYAI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxHNvhRB; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxHNvhRB"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8ec399427so1024626d6.2
        for <sophgo@lists.linux.dev>; Tue, 04 Mar 2025 22:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741156794; x=1741761594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm0v1oLCij0h6SDkpOwWiVAdzDZKq77pVrdFNubwArE=;
        b=CxHNvhRB+VEi765KnsS+qzCnFIC9TP1rmWX6g7R3fBo5rx2H+cOPk8dfOeHldN+SBH
         zduIntIjUxY3jnomORT8j8eIWVS+zYXjrC/dAWL9utvCjO4K3iYT9VCINM+cUjO7PhIw
         kzLcXd+a8S95K/eo3bsr0zaiqNbtmyRXx7f4gXnZv8sruNsMCztMxDtsRG7fPhqljIGy
         gbtU/4M1o5rWpLGSUvbsp6fWJC73UpAXux1DXDqDa9+UqYV8227zbHoZJNkC3eJoFsKn
         tj0Id1jT7pch4uuiWOnMN78ix+XrLqsA3gDuO5XToL8iFsCRVm4WSAb/WZd4YSlPpnUJ
         0bbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741156794; x=1741761594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pm0v1oLCij0h6SDkpOwWiVAdzDZKq77pVrdFNubwArE=;
        b=SyMBkjE8t2CKBhilcgEYrE4sKfORI4l9Li/ZwhEQMbfx79sGiPOR4WLWKCYQRxDPFO
         Hx54GwkavMCfyRfTdUsr18eZV4muW6wWo98Hx2tODCZ+v6B21xbLdeHmZpmDqMNsah0v
         yBeVh9pEnhQ6IiQOVqeqkL3eS/NrUVYsMe16JfZJVNQ6cgKJDVa6jTk8FpfuyqVMd4Xd
         bqfBbAa8gHWisHoElyOWWxr2upa2nxOAz/oGgpSUjxpAPLJUiN8d+A7oTVqlBB3YEncI
         g4CkcPfJFVnVQEHu6tjklvlsqAw70SKpFvo1Elrk3BMPcZbJsrsd44qyNsrlQZePOiHi
         1AdA==
X-Forwarded-Encrypted: i=1; AJvYcCW0tXbrrwpOwKcI8UJ/ZTh/wBmkbjzSAA467BYGQhnZxQe48Xzd8s2T5dxNmWIOHRQVs8rXPj8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1PTRIqNgyPqdgyaxHkrDFF42Y1I8o9I5nVjrzpcS1jR+Veasg
	ERPDJErtBYi6IRr+fHesfurd7BCV80fo3C2gXzh7C4xxO2EDRAX0
X-Gm-Gg: ASbGncsl16I3Oja8RhMp/9s5bA+Y9EV6mv7itd4xg+GtRC44W5C5rnMYPvPQwJ2itOi
	sWY6Y1KlrfPn39A1VsoDraUTg2NrOdd+lfFzIAStW7ufCHkg9/0BWcj8/oZlC7sJmdZ2x/1lxJ6
	WBvGC3RTA2KcnZkFZwhtlJIvto3CluAz0eoJno3fVsodjE0kiLUyT1cD2/yp/vRDieQfwMV8/60
	fuKHUxjw9cIE7s30xWpecLZ/WGHim2YwxLkE6R+aIXIC9A5C1BjB/RRsJ8InxIYQQ3y4l0fz4tx
	CVia00fyWEtbwvZS1D4O
X-Google-Smtp-Source: AGHT+IE2PxHyAWGJwBqsd4XqiNnUfpUNBM6sb+RyGuOLvmBafepSZRle0SjnzsdkzlpqNK/+2dp1ng==
X-Received: by 2002:a05:6214:e6a:b0:6d8:9b20:64e8 with SMTP id 6a1803df08f44-6e8e6d11d4amr25735466d6.10.1741156794196;
        Tue, 04 Mar 2025 22:39:54 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8a2170bcasm62382096d6.34.2025.03.04.22.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 22:39:53 -0800 (PST)
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
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Simon Horman <horms@kernel.org>,
	Furong Xu <0x1207@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next v6 1/4] dt-bindings: net: Add support for Sophgo SG2044 dwmac
Date: Wed,  5 Mar 2025 14:39:13 +0800
Message-ID: <20250305063920.803601-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305063920.803601-1-inochiama@gmail.com>
References: <20250305063920.803601-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GMAC IP on SG2044 is almost a standard Synopsys DesignWare
MAC (version 5.30a) with some extra clock.

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 126 ++++++++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 91e75eb3f329..02ab6a9aded2 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -32,6 +32,7 @@ select:
           - snps,dwmac-4.20a
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
+          - snps,dwmac-5.30a
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
@@ -98,8 +99,10 @@ properties:
         - snps,dwmac-4.20a
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
+        - snps,dwmac-5.30a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
+        - sophgo,sg2044-dwmac
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
         - thead,th1520-gmac
@@ -631,6 +634,7 @@ allOf:
                 - snps,dwmac-4.20a
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
+                - snps,dwmac-5.30a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
new file mode 100644
index 000000000000..4dd2dc9c678b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
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
+          - sophgo,sg2044-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: sophgo,sg2044-dwmac
+      - const: snps,dwmac-5.30a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: PTP clock
+      - description: TX clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+      - const: tx
+
+  dma-noncoherent: true
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
+    ethernet@30006000 {
+      compatible = "sophgo,sg2044-dwmac", "snps,dwmac-5.30a";
+      reg = <0x30006000 0x4000>;
+      clocks = <&clk 151>, <&clk 152>, <&clk 154>;
+      clock-names = "stmmaceth", "ptp_ref", "tx";
+      interrupt-parent = <&intc>;
+      interrupts = <296 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "macirq";
+      resets = <&rst 30>;
+      reset-names = "stmmaceth";
+      snps,multicast-filter-bins = <0>;
+      snps,perfect-filter-entries = <1>;
+      snps,aal;
+      snps,tso;
+      snps,txpbl = <32>;
+      snps,rxpbl = <32>;
+      snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+      snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+      snps,axi-config = <&gmac0_stmmac_axi_setup>;
+      status = "disabled";
+
+      gmac0_mtl_rx_setup: rx-queues-config {
+        snps,rx-queues-to-use = <8>;
+        snps,rx-sched-wsp;
+        queue0 {};
+        queue1 {};
+        queue2 {};
+        queue3 {};
+        queue4 {};
+        queue5 {};
+        queue6 {};
+        queue7 {};
+      };
+
+      gmac0_mtl_tx_setup: tx-queues-config {
+        snps,tx-queues-to-use = <8>;
+        queue0 {};
+        queue1 {};
+        queue2 {};
+        queue3 {};
+        queue4 {};
+        queue5 {};
+        queue6 {};
+        queue7 {};
+      };
+
+      gmac0_stmmac_axi_setup: stmmac-axi-config {
+        snps,blen = <16 8 4 0 0 0 0>;
+        snps,wr_osr_lmt = <1>;
+        snps,rd_osr_lmt = <2>;
+      };
+    };
-- 
2.48.1

