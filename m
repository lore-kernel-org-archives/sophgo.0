Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7108117BD3
	for <sophgo@lists.linux.dev>; Sun,  4 May 2025 00:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746319489; cv=none; b=Z7MyGA99IEvv7DuxkLm3Olp1ynFNrqn7kHsxFvQt0o0+eutJ4NhVk9wMxwYGQuSFIKIfCOXTNhDvQB+WHtr6S9S6P/v/MEDXKgfVNugCFT82LzUmawKKAMM9H2mkMz1ntQE/+D+E0mncy/UYEfUsId811Vmg2OZJEgbz0jwis3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746319489; c=relaxed/simple;
	bh=AiuXcbaJV+NjYtUCDlBF6XIAxgKFZTkh5kCXtC3qd5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O7pX3yjfcpZqdhVq1TVuUMZ9oQazc6+pomh6k1HvQvnSELk/ZjRGGmumWnugvhbpWAx7WInt54FnydXPQR5JepdyI6XjUwdyXfeM0vd9hUYaHRLUcyRgneqp1k/9OMCshQHcU5aS/6FtDz5ysxy5R2VDPBZRtJkr/bIesDXWFZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ve8rcXMy; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ve8rcXMy"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5e39d1e0eso359344885a.1
        for <sophgo@lists.linux.dev>; Sat, 03 May 2025 17:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746319486; x=1746924286; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoA+ZSOYEZQCjKYMYI3mrz31xQWAvL5C4Z9pWmjD/v0=;
        b=Ve8rcXMyuAUk53JRXHR6/0ZdADw9oEDq5sU/JReFUnOwrXwwLJcfryOOKErZtLn8Sk
         iiAPkGDnLiGGrYJYkLSupk1HHbQgmecFf0HrBl9GoQtlcC50zbHq8JhQGiHyBUDtYb/f
         uDAHjCYNmEPY5Nf//J0wcKOocZ6rQgW8xtq6juhjwUCVsMlFwBYnBReZIj5xwITJeRXS
         mtpheu7Ey8dEsDhzex/gCDEKvUb8o4ljD4EiD7utRyH7q/al6VfO+yVWCC2AJh205FLy
         AnULtymkYqm+i+xHIof5jl2/B15R6W0j7vn1jeudmQM5O0bscIrnXOYtDy4BrpTWahMe
         yuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746319486; x=1746924286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoA+ZSOYEZQCjKYMYI3mrz31xQWAvL5C4Z9pWmjD/v0=;
        b=ozVHas0XEVzsYw7l2gdEP0QggcviDDeC+n9aO2DUDmhOqx13yUngOHIXy5cm0QLRW4
         Vx3GkH1nkAUunxa86C5q6nJdbUgJkYYN2eAOgoUWdc5dLIOF4y3AmhZ1dPKteuSaGgx6
         kjeKUHpTDsMPqlmCpP2fYHZRub4BvIOnZQVRZHmY0P0EgIuaUbooOlmHDa0g7D0PQfUL
         unh3LmOqKd175YBijpaXWowy8vyj+j0n9m33p9EGYZVyJEQ7R3YwtQC4/hOsen0I7k8C
         +y5BZVqcpYJS4+r9chrZM9z0XTm0GvRJVZGeVYjCO5AhIRTvSFh+K9wReb+gSRAgwMjr
         eHjA==
X-Forwarded-Encrypted: i=1; AJvYcCUXZySbS1afBur76kpWZQf2VLVjxfxZFICsuemVomWa8OXzyGG5cJoZSllTdIhHp11MHg0Rvpw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxURbxWP9wieJQMC1b7aLEkEb78Ih1FKjs52zFvSWIIFEPybRJl
	ZvyBFIIaMI7poKsJfJpMPo07yMgplaf4dSOfGGKckJin8ixVlkvK
X-Gm-Gg: ASbGncsFXoQM9TcaHtJbqXYLqksoQYwYOEdLcKeyOrt6QU5Cb3yGNZKdeik0SqcE5LN
	9Vg50j5J0kfDQOA9B6N9JZOLhuiqEM0xK0j9cEG8d7mKMGCx1j/EYarckZlF9kmovfHKKwXO2hR
	y6b8dxVa+ztbTjGhok0eh/kWNwL5zgQAxBbWLkCs0suOud8QyTYpNFMBHA10V3ZWKb9GFXBymdb
	0xK+tS/9aGXMdzLIVniIvUCB1dQn/Z6nA+A5c4LxkeZ/4QNyVTH7ReNj5o7b/EZCPX7rdBdgHb9
	nHGHBDQ+bueOlPNR
X-Google-Smtp-Source: AGHT+IHlMrma4ZEgM4G81axUlK/JXKGY6wtDLe1XBP+NpBnysT5RTGS7PbK4xZuVe4+AfSaQT4uAFw==
X-Received: by 2002:a05:620a:448c:b0:7c5:5e9f:eb30 with SMTP id af79cd13be357-7cae3a9ce2dmr321428085a.15.1746319486286;
        Sat, 03 May 2025 17:44:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cad243fc7dsm389133685a.94.2025.05.03.17.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 17:44:45 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Niklas Cassel <cassel@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Shradha Todi <shradha.t@samsung.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: pci: Add Sophgo SG2044 PCIe host
Date: Sun,  4 May 2025 08:44:18 +0800
Message-ID: <20250504004420.202685-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504004420.202685-1-inochiama@gmail.com>
References: <20250504004420.202685-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pcie controller on the SG2044 is designware based with
custom app registers.

Add binding document for SG2044 PCIe host controller.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pci/sophgo,sg2044-pcie.yaml      | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
new file mode 100644
index 000000000000..ff1133bae3ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+description:
+  SG2044 SoC PCIe Root Complex controller is based on the Synopsys DesignWare
+  PCIe IP and thus inherits all the common properties defined in
+  snps,dw-pcie.yaml.
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+properties:
+  compatible:
+    const: sophgo,sg2044-pcie
+
+  reg:
+    items:
+      - description: Data Bus Interface (DBI) registers
+      - description: iATU registers
+      - description: Config registers
+      - description: Sophgo designed configuration registers
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: atu
+      - const: config
+      - const: app
+
+  clocks:
+    items:
+      - description: core clk
+
+  clock-names:
+    items:
+      - const: core
+
+  interrupt-controller:
+    description: Interrupt controller node for handling legacy PCI interrupts.
+    type: object
+
+    properties:
+      "#address-cells":
+        const: 0
+
+      "#interrupt-cells":
+        const: 1
+
+      interrupt-controller: true
+
+      interrupts:
+        items:
+          - description: combined legacy interrupt
+
+    required:
+      - "#address-cells"
+      - "#interrupt-cells"
+      - interrupt-controller
+      - interrupts
+
+    additionalProperties: false
+
+  msi-parent: true
+
+  ranges:
+    maxItems: 5
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      pcie@6c00400000 {
+        compatible = "sophgo,sg2044-pcie";
+        reg = <0x6c 0x00400000 0x0 0x00001000>,
+              <0x6c 0x00700000 0x0 0x00004000>,
+              <0x40 0x00000000 0x0 0x00001000>,
+              <0x6c 0x00780c00 0x0 0x00000400>;
+        reg-names = "dbi", "atu", "config", "app";
+        #address-cells = <3>;
+        #size-cells = <2>;
+        bus-range = <0x00 0xff>;
+        clocks = <&clk 0>;
+        clock-names = "core";
+        device_type = "pci";
+        linux,pci-domain = <0>;
+        msi-parent = <&msi>;
+        ranges = <0x01000000 0x0  0x00000000  0x40 0x10000000  0x0 0x00200000>,
+                 <0x42000000 0x0  0x00000000  0x0  0x00000000  0x0 0x04000000>,
+                 <0x02000000 0x0  0x04000000  0x0  0x04000000  0x0 0x04000000>,
+                 <0x43000000 0x42 0x00000000  0x42 0x00000000  0x2 0x00000000>,
+                 <0x03000000 0x41 0x00000000  0x41 0x00000000  0x1 0x00000000>;
+
+        interrupt-controller {
+          #address-cells = <0>;
+          #interrupt-cells = <1>;
+          interrupt-controller;
+          interrupt-parent = <&intc>;
+          interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+        };
+      };
+    };
+...
-- 
2.49.0

