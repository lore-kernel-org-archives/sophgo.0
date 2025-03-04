Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4321F8BDD
	for <sophgo@lists.linux.dev>; Tue,  4 Mar 2025 07:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741072403; cv=none; b=FuuyRXsrrbPBoiAymsTthh33UuYW0/a2tTo2dd7qoeLf9yerCvul9OeuhH8dH7y2BuWoceEWsrGC6YWAzvdUOYqeMnGrThsiEQ3/m3LwbH+oOg2r1ebS3d/U2MxwKEDi+mBuEvy1FolshR3P/c67iVvKhkeD44IhpeT/iLIvRHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741072403; c=relaxed/simple;
	bh=WVGXxBVXg1aTl+bt/UgUg63ySw9YcbgbqMypwQzqcBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBkA9bC1YUU0PqZMZWzpwfz5tERW0QJrCDMEuO+itxLcJN4ihj0qE/xo5D9bnTpkMm6B4ej+Kl4GcceFEVqmaoZZYus74xYeC0HeyrkKjZYYumQSsy6Ico4Ltl6vIvkna3uZkgeTE3X+p7V9ZR/eA/+/NF0cFbNCu8leQtuJ+Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXUzDpiu; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXUzDpiu"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e89bce647fso50439516d6.3
        for <sophgo@lists.linux.dev>; Mon, 03 Mar 2025 23:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741072400; x=1741677200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwq6vuPmMVxWBoFCtw5ASb1VQcjTGQ3SeY+f38l0crU=;
        b=UXUzDpiuXXgZjK54i2eMFg0j+Z7bh9vDjVhAEkNVK8SDAMmXFgHLEyxkUOLPEFVi7z
         zeTKfPlOBSGzpKIEOTKmfN+USebMArrQv9rMzeNZqJ3uf1Kf3t9QZlNZGNkP8mmHbTji
         Z6BlHwqy6EHVgbn1o9+zPRenH1Y0J5tsE2HNYf8gPifZQAQMUTF64gBilgaIzUbxyutP
         sB8MMzgYO+3nFm+PkJ7hM1mgD2jbnsT0rv5N5yFsvwZIcNLiSVbI0rUUyt4kiFxcwu2S
         ff/nLgQLMKQ3d/noctY72esWAZe9hKX3k1Ywa7Vv+RmvBqH1HZFI9ltEVk6hE5bTbOTd
         yd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741072400; x=1741677200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwq6vuPmMVxWBoFCtw5ASb1VQcjTGQ3SeY+f38l0crU=;
        b=I8MTqta0k+mmhFhdKksgaUKghMN7FSHv0NdCYgytyuAJQou6i2UxV6aeRi4moSIa8z
         5R1Tc88rEWBD1APJLJsTNvSDUu3LM2RkghQt1r4Cn3utVtQAEdVF/G9dpVh+yDD1yYNE
         /xjTz7ZMgJoDUjtvSP3GjG4nXnbTTPZkP7V4lgb1qh0osCp7jYBt2Cmls6O4OvL2W0Lb
         f3faYJCBNX512Vh5RWyCAEIasLw2zqLNlTGsW0Qyyo8HKZsK8L+M22GjJpWE3chLVrDp
         aK2AizuVqdq8A+FsG5DDJB0RXT4IuBzAlCE9re+nZtxDjGbnloYZj/GG5CX32WTBnxzu
         /s8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZ5Qy2epvd+dqltZV+R+Xf3miCPa3ZogeauhswXuoLDrK68OQoGBulBK5Nmgo6M/e/TbuPBZw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXA55s+iq4Wdttd1eJ0BA5r41ycJJ4aUxI48BArgD5VHqr6VgC
	GbpGcpWpQp4Tw44eqExjBS/PpV3kUjhfRvUYFgVDUG971r8KksMf
X-Gm-Gg: ASbGnctdylNgjPeX8y4q6uBWQHaF8MNWyy+jo0xUz42aS4uUrHwc3cVypJNWlAviYCE
	SaowTGWV+qL+XNMWYcXwjvBXcBeU1hZpDFQhfsUMX8ZrPRtfZXNX/ZareNMTzqmnOUeNx90OfPs
	1pFwV2/rMXf/C8mrvLy0Z3hoqk4wbpWe17+iVyg7vmm2bT+f9VQ1/ksHcY03aw7taZX3osWzYBS
	aQsvxDKOW3GM8QUAhJTsqL6rcMDETvOqebQiZ4XsbrDpOTsamF+KxpbVq8mXs3YZgUfD25HNCuV
	k2wSRy0z0DbC4e/nbmRs
X-Google-Smtp-Source: AGHT+IEKSycuKiArRIB4aWqnh4JSLR0m/JXw8SZWd7kwiy/1aB9gpEr55GNFHqueYCWrKy1q0fPQNg==
X-Received: by 2002:a05:6214:2aa1:b0:6e8:9957:e705 with SMTP id 6a1803df08f44-6e8a0d4a9f6mr259141056d6.34.1741072400555;
        Mon, 03 Mar 2025 23:13:20 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8bd85184csm33263806d6.49.2025.03.03.23.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 23:13:20 -0800 (PST)
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
	Johan Hovold <johan+linaro@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/2] dt-bindings: pci: Add Sophgo SG2044 PCIe host
Date: Tue,  4 Mar 2025 15:12:37 +0800
Message-ID: <20250304071239.352486-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304071239.352486-1-inochiama@gmail.com>
References: <20250304071239.352486-1-inochiama@gmail.com>
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
---
 .../bindings/pci/sophgo,sg2044-pcie.yaml      | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
new file mode 100644
index 000000000000..2860d0f13146
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
+description: |+
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
2.48.1

