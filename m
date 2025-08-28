Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F723A1DB
	for <sophgo@lists.linux.dev>; Thu, 28 Aug 2025 02:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756347426; cv=none; b=WbHwgborlQsCZSx6IcyiXeIihER5Hlv/xgIr3BEJMAYstTY3anvtGkPo5x4sU6s8X+oC5Qv2HHdj1b449IcgRN9olDBvgZW1DZJpGYAwKxVSvEO8jrbqgpXWB4zQf7ZEJtywFIrBoxsdrwup862j9fIdqp/4tHPtscJRU4s4WrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756347426; c=relaxed/simple;
	bh=Vb4oqaAF4AAxL3ENJorO5f5xQALMvDpa1QKstivrv7o=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DmOt4GzfeVcrPVKr8nOJMVSrU9AYj9eFVUk/iMn3Io15grGULyJg0hPW2E6yFi0NJnpfQoukJPZWw4uel5QesRy6zo6fhBZiAu9jWcAhnNG2QEQava0QXDlJcER/2G39i+QNUFpHfkLd2fQCxHCU49T4yQS8GnrJ5Gde2/JvEM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWvywE+P; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWvywE+P"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7452b1964f3so365670a34.1
        for <sophgo@lists.linux.dev>; Wed, 27 Aug 2025 19:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756347424; x=1756952224; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGcfuQl3yrFvMTXn2qxpt2B+zvl/KTrt/bi1+ryxB9w=;
        b=XWvywE+P7tmXZB0gOEml3PSdXmnYHwoeIjrPoa7JOXBVBBfzbYTieny/epBiakEO9/
         8iLrjTGA8RpU+Sf9uv7+TMUyCOX1HMaMPAjz1TlNCVJozlgJCwYFGEgHrEFAPdqfcXAL
         jrH9V3XCn2OPWfmlH6qIOkx4q+kMnBFmqDYLn/iDRPcXQOryPT6wnPdZkcg7b+HNKQE0
         5Fui8vYdpzno4tom6txbcmxO4cxjXy5bGWirC17wfg9PL4AZLHsa1KCoP7z+lKyeNdvo
         tYEPz7/WYOFjf3jfsfGFg4/Jo4DxTBD5eTZlfPT6FeRThbeHnBt2wQUPz5Vgd5pSD/dw
         FuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756347424; x=1756952224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGcfuQl3yrFvMTXn2qxpt2B+zvl/KTrt/bi1+ryxB9w=;
        b=QSETn5SXs3lZKxW+iJpKgqbpLLyh4orWDhW94jPlEfOe6PrPYSz+zgd4mxiSJ7tDh3
         CgyZmpz1472wzp8W48b79fwPtHUPGD/ubxTWih7b9EJi8yUMlESb9kO8YI+IUTf97XXH
         J3f/CE78mjX88EdcIdNAlpTACUWxJ/2Pfh1qfY3D+ZwefPJosya9juVnz0QRtTFC8s8k
         YO0QaRYvKhFsJ8se3LOFvLO2t5JE8bPQtzNa+qITUdw+BXWmDbcI+ygE7/xlsPgSoyDz
         iEWVvDuICLXCTafe6r/I7ZnzR/j393/UHtNjSqAgT3F57cegPySj0WeRYhzpCLBAwMIa
         QqWA==
X-Forwarded-Encrypted: i=1; AJvYcCUnsHN5dREuKg8YqxDBP7fvRZw2HFTIkrg+PMyg7CVT19MdNdJRlwjeSTFN9JhSa3sA61Emlcc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwD13aF/d1G4Ss0WrVfZa9XCqZgZheIPBxJG4+f3a3XsQRHPchB
	N0YMXToGjGKjsrKa0VH+mQ9pirsMED5cO1UoChW84weSOn5HeIXgGU45
X-Gm-Gg: ASbGnctYUU4J3xKhSda4Cwh51hwmsRRrjMCV1NkR3Dk/nGQep+XdyOOXvfyy4xBrhO9
	pG0Jd7qAVsPvW9vRRl52beudzOhXXXngU/L0CFxsHgY7X3lf0RaJVUPCIrY+pt5SpqxTEKa8ZAB
	udU4e/lYtACIjPsOiCSh1D+JlFoHU/wROawbdUvX1VxsfqIcp71mOFZzjMYskzpJfBukW6bKyVv
	Ec5w0XB/akYZc5plc7Kkn74fC7bpL2KvADpmlBnxTM9GUj3kisO7euLcJiry2G8e8TjwSfBBOsQ
	ejbr7Vnt5XzMDdoinLNhe+oi4+rzLgLkAaxu1jXJPFH3RItZGc6hHqpglZwJeMiIURZ7oCQTi59
	Xy8ynSxgxEavDibXNkPWXXhhG7+Y0XUSGulb8R+xNXUg=
X-Google-Smtp-Source: AGHT+IH2Q5rRfVSJUWNf+uE6eBwAzJ9xOs26TnCu8U9MzwRkPuvLFqxwmj/xUnRfEFrOQCUo3+by3A==
X-Received: by 2002:a05:6808:4f50:b0:435:774c:c443 with SMTP id 5614622812f47-4378516a635mr10246498b6e.8.1756347423714;
        Wed, 27 Aug 2025 19:17:03 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-437967dbedasm2276940b6e.13.2025.08.27.19.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 19:17:02 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
Date: Thu, 28 Aug 2025 10:16:54 +0800
Message-Id: <c9362bb49e4d48647db85d85c06040de8f38cb83.1756344464.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756344464.git.unicorn_wang@outlook.com>
References: <cover.1756344464.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Add binding for Sophgo SG2042 PCIe host controller.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/pci/sophgo,sg2042-pcie-host.yaml | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
new file mode 100644
index 000000000000..2cca3d113d11
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/sophgo,sg2042-pcie-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 PCIe Host (Cadence PCIe Wrapper)
+
+description:
+  Sophgo SG2042 PCIe host controller is based on the Cadence PCIe core.
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+properties:
+  compatible:
+    const: sophgo,sg2042-pcie-host
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: reg
+      - const: cfg
+
+  vendor-id:
+    const: 0x1f1c
+
+  device-id:
+    const: 0x2042
+
+  msi-parent: true
+
+allOf:
+  - $ref: cdns-pcie-host.yaml#
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - vendor-id
+  - device-id
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pcie@62000000 {
+      compatible = "sophgo,sg2042-pcie-host";
+      device_type = "pci";
+      reg = <0x62000000  0x00800000>,
+            <0x48000000  0x00001000>;
+      reg-names = "reg", "cfg";
+      #address-cells = <3>;
+      #size-cells = <2>;
+      ranges = <0x81000000 0 0x00000000 0xde000000 0 0x00010000>,
+               <0x82000000 0 0xd0400000 0xd0400000 0 0x0d000000>;
+      bus-range = <0x00 0xff>;
+      vendor-id = <0x1f1c>;
+      device-id = <0x2042>;
+      cdns,no-bar-match-nbits = <48>;
+      msi-parent = <&msi>;
+    };
-- 
2.34.1

