Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C781F463C
	for <sophgo@lists.linux.dev>; Wed, 10 Sep 2025 02:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757470089; cv=none; b=V1BUdGeg+5Fu4uW9f6U879vxpXS3lyT4xIs3shGM8vH3dYyZOx/us3x6HK5cFlDcwbTqjMUHq0WiESVXQHLqAwABeX7DIIqSVr5w7rfI1Vkf8y7lhntd8iY7k6WYR5Ph7DnVczWtzyefL7CJuH4235xQrSCidpoGOPq3MLtPs6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757470089; c=relaxed/simple;
	bh=ne/AJ08EINCLHq1YL8QOv01wvisw6A7Ct54Qvu1CzBE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TE2VjJT7jOCmWJDB+kbd1d+RlgWNerabubDjF17I7pTk0Yh7H4DLVOsQKVJJmmq3MD5rcNpIN0ehcLCAXig2+UB51DQOdbedhUqSck6P8OAd+ViBnmxx5EXwEvQ2tyn8qQuur6gxxnBPUbGr79QgWVVUwfXkRBjb+du1FqDAxvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jr/Ru2PY; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jr/Ru2PY"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-7209bd264f0so2131496d6.1
        for <sophgo@lists.linux.dev>; Tue, 09 Sep 2025 19:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757470087; x=1758074887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XFM07Z5n/PQZ1U15JfmMTCdL390KHJnWHFIuZFK96s=;
        b=Jr/Ru2PYDYmLMYrhAx+i4VTpCquvmfD27QDAfGKbKa0RWH4D1izwBEteNppuUvcOEr
         b+siCevhNZWYGi/tLFMEdLEmJ69gUxm7km2HBcdnncLjvvocrvC8PPJ2q5qgbeaXVVyw
         cf2m6E1/mfFWEgnkgJWd+xDLZ/dswXE0rfAoJyI+4MFczQLSXNOU3oNXsXFx+TA4Z7tY
         YI2s9BKh/Xsiso3d+DlV4YyWukOwKv5oZ/cUCNzGV/s1PQsG9VuhCDamOPYqy3pW1gmW
         R3IkVLwh0AKdOxYdjOEvvEYpL3S1Pn+himzU3YfA16z8+9qSCWzxa+fxn2dILuF1ARG2
         HQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757470087; x=1758074887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XFM07Z5n/PQZ1U15JfmMTCdL390KHJnWHFIuZFK96s=;
        b=I+PqQ8Ux2O/W362/W8LKhN8Smcuh+d3xN4TEZmenEQMgJe8as29oLlb9Xy3u1ytXJI
         RHk6LejMuvaBwc4D6onXpcYcBaUyEjCJk5twRXwMrrIIlUccUrQ+L1UXrykgaJNSdfM+
         WYgBscooNmTeOZBQah5Au5a/DgUpVKZ+Z7A/kW7NB/grJ0s91TKrAGRUi2KoNt057v1O
         vyVLgRiTxggPjJIHtioB4NaN59JkWzcp5blsf8bVgPc0HUgqzn1EP9C93gtKHxeuQ/hd
         iTe/YMYU4wEM9xyQH2Mk43cwEX4Ja6xBl0+6Y1xzCrJVlIuZwwZi+ZIfdlES1MAxBPmS
         xSWg==
X-Forwarded-Encrypted: i=1; AJvYcCUe6j5AHA4mAyy4otFmOcvBIwz+21Lte6tV+MIxc/YVilpd9DtoYlfmTqw8KPPzCQbQXgrUYzE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsH09eP6pgaHtWBKa+UbPQMiHgw2/QyktAxp5xE5SOti3ah3ZG
	2v9vBjTt73Oaso/66ObICNomb+jzKcaOM0RvTamL5W0JeynKk8Xkrhap
X-Gm-Gg: ASbGnctOGR9duHmQsXzHCQZxH1xLKTrB5BNWfTigiShmEJQuBoAHi3kRwp/sBDOhJvR
	fM8Uq6Afz3Q6Y8w137TarR7hQi/pOAvDrBcShVuLzX8JT3cs2exZYkGDOzpYzNwxVU71FZSsUk2
	Q2toh03Maq9iCXa1DFxFCkruYqlWWE8sED3AM4AT1wsJEo9U1vJ8u5i3xFamqQdI9P55iCZTt/w
	q2tkZV+ZAos+KM6wZhRfM058bMtBAIs06ha5tGSHIBrHIY6RDGDeJ+ZF3TTzPYFUIWkdgKQwMEB
	4qFRIKSIWo9wSStqQFeWeNlMCPjYKsybmq1TzyuOz1p5LVEZEOW/uAFSTdzPQR3OZYWf/CWC5oZ
	/Fx/03oe5nhmTm4YemkEQGyd3Mc+lvsDF6HkuuJKXCiyULC9sqa+Txg==
X-Google-Smtp-Source: AGHT+IGNC8sHtACh6gI+vt2l2BTS2R0uh7vi8B+8jgdFE32SPqkIaSaf1sgwm1dD4KthnaDiWgRQyw==
X-Received: by 2002:a0c:f096:0:20b0:71f:b221:9aa9 with SMTP id 6a1803df08f44-73a3dbf58a3mr135461976d6.29.1757470087200;
        Tue, 09 Sep 2025 19:08:07 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-728d6f8b338sm119377366d6.0.2025.09.09.19.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:08:06 -0700 (PDT)
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
Subject: [PATCH v2 1/7] dt-bindings: pci: Add Sophgo SG2042 PCIe host
Date: Wed, 10 Sep 2025 10:07:57 +0800
Message-Id: <2755f145755b6096247c26852b63671a6fea4dbf.1757467895.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757467895.git.unicorn_wang@outlook.com>
References: <cover.1757467895.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Add binding for Sophgo SG2042 PCIe host controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/pci/sophgo,sg2042-pcie-host.yaml | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
new file mode 100644
index 000000000000..f8b7ca57fff1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
@@ -0,0 +1,64 @@
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

