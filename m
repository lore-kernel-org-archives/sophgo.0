Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640E118A92D
	for <sophgo@lists.linux.dev>; Sun, 16 Feb 2025 18:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739729377; cv=none; b=gOrWBMcLd4wwPyFLFl5QMGI4rl/3sZw3qlYrAnNekXEvFPNotCn5xYeYjrRb8ibb/nH6WtdCYG7xFic2wCDryg9daTj5uWuQ5q/BBStGRrT5e+FZypYAmNjVHCesQXjC2YgDfgvQJdALB1qTYUDkg3FLNT3GabKm4Cw9E7OrJ6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739729377; c=relaxed/simple;
	bh=Z/E2jVKQjg00whzxYSWZzggCCsussqYqWWHWhmFLPg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kl2ZAIqmgHXtxGfKxI8tUHFZs+VqNKm/4HB2TIbuMcVUjyHo/PfF2RfTJIkv6ItQGVZRGSIYYQ8kW3QLDfMj40pbO/MC56S/vxWBHbG3+VjorKudHm4FnHtmq5YdlEi5NUdbFgsb4LpqfUBstjelSJo3wwZi8nsaXbe223REXos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzgdjJrD; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzgdjJrD"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aba868c6e88so313573966b.2
        for <sophgo@lists.linux.dev>; Sun, 16 Feb 2025 10:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739729374; x=1740334174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jDKGgAw/XBDG/QV4A9vk0jo2V9VB2oQWQFTgbJUtcfc=;
        b=OzgdjJrDNM3nN2yl7F/XBRVN5eTLIJYsTkTrOmkcPIspplsLuvS84VhiJF0aurLkmY
         W8yDQ0qQQTAD4Cx0zUbJSfquuKN+rp4HKKrNeWG2chFP1q1fVwrLYThqzvFrIL7NR3/X
         ZrUzcW85wxmxcd/nULJ7gBKP6drzlrTaiT7Q222Rnaczdpu8+8fdyzt56qc1ZwFtyFBR
         8HqL9p++a8dVxQCG2uI+PwFSZlGkzV9lgtB23GUcgoHHYAM7X+T8OXP28lIKHmkqjlp5
         jM7HQaHvfAy3YQTIcF25ca9d3ouD+mExSz1lrDl+CY5t+xTkTEoXCw05T1PnCnTT+H0H
         WEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739729374; x=1740334174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDKGgAw/XBDG/QV4A9vk0jo2V9VB2oQWQFTgbJUtcfc=;
        b=bBdWhfM7+Qea6IhF7V9xgQnvQ0qnUqscOaD57aYYUhVMX4oO1qiXkAuihJbXHqM3RY
         b+bCkXU6wCRqP8XGFwFaTb0ilHI4yiKK7/6tvuFor5CoTTiPPmkLhwW2Q34/fsXzkC9z
         67lggp1Hyvy29JzmLfC+Ha5B8LKytzTM84YstjukTAVip+6RcKCDPTWyCntVtd9lJbw8
         HYsc+z8DN07QDdH8coI6kRTDgE7UBo8Wa/lxyt851gfaryPuZE4pG0hlHKC5PsZwitJd
         sncWbtkxZaFK2RriCdNe4G3q0Miqwe5ePHqKidqIaAgJIJPxD2mPVxa8ASay55N3np06
         EjHw==
X-Forwarded-Encrypted: i=1; AJvYcCWgKvNRlktQCLpJCCZqKAUcpA4n3WRyT16PYxj9rwwYQogFKfGobGbDkuakeMuViTulcfRIUb0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlyGjYNfOgXrUlfTcbOtGM1B3weCnuXDDVjqa+P6VVtt/O8eTg
	UBA2aCPtOJEN9aeo0W2Mrw7SJ71lwhqWWiiuDFp+slnr3G5GmpiA
X-Gm-Gg: ASbGnctYN8/2AoIAouGD4oIttiuNEHcPxHujE3VbPpt2ni9Mrz7zPxMFyGUJfU0zZS0
	QqyInhRQNSaPpOq5Np+VfOE9WAQQqLmBwjA3ws+DbywpsZiooePbxrV4GPGjcm/dap13kqsSUgs
	Dc2+XVFWxOuBMcnD7LJv3HYuSicCpEVyFDTNwxcHiGOXhgj4mMOY/Bci0TIYWu3aO/MDNoxYZCy
	cIy5mx+XnhX3YAOzHKUSoVINZaInj/+kBjyKmZk01gvylKoXX8rTbIqWPMFClgSHwU0nHcESF9o
	gos+8SvIxqwNtCYHPqZnEqGdaR53
X-Google-Smtp-Source: AGHT+IFkY4om+Y9dsuLLfHc/ExMOv5QyNvMmLcNt7jetS7qFMsh3KyfXK15v7y8UdkMryMOIKaHqmg==
X-Received: by 2002:a17:907:9494:b0:ab7:ec84:10af with SMTP id a640c23a62f3a-abb70b1d813mr737311566b.16.1739729373356;
        Sun, 16 Feb 2025 10:09:33 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8eea4d65sm164712666b.161.2025.02.16.10.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 10:09:32 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC] dt-bindings: rtc: sophgo: add RTC support for Sophgo CV1800 series SoC
Date: Sun, 16 Feb 2025 19:09:09 +0100
Message-ID: <20250216180924.2506416-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RTCSYS devicetree binding for Sophgo CV1800 SoC.

The RTC (Real Time Clock) is an independently powered module in the chip.
It contains a 32KHz oscillator and a Power-On-Reset (POR) sub-module, which
can be used for time display and scheduled alarm produce. In addition, the
hardware state machine provides triggering and timing control for chip
power-on, power-off and reset.

Furthermore, the 8051 subsystem is located within RTCSYS and is
independently powered. System software can use the 8051 to manage wake
conditions and wake the system while the system is asleep, and communicate
with external devices through peripheral controllers.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
QUESTION:

I'm unsure about reg properties in the subnodes (child devices) of
RTCSYS:
- they will not be used anyway by the drivers because they genuinely
overlap (the whole point of going MFD) -- therefore the drivers will do
syscon_node_to_regmap(pdev->dev.parent->of_node)
- as I understood from the history of MFD dt bindings' submissions, regs
are encouraged, if can be specified
- overlapping regs cause dt_binding_check warnings:
Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtcsys.example.dts:34.19-39.15: Warning (unique_unit_address_if_enabled): /example-0/rtcsys@5025000/mcu@0: duplicate unit-address (also used in node /example-0/rtcsys@5025000/pmu@0)
Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtcsys.example.dts:34.19-39.15: Warning (unique_unit_address_if_enabled): /example-0/rtcsys@5025000/mcu@0: duplicate unit-address (also used in node /example-0/rtcsys@5025000/rtc@0)

Shall I remove the MMIO resources from the actual devices or rather ignore the warnings?

 .../bindings/mfd/sophgo,cv1800b-rtcsys.yaml   | 222 ++++++++++++++++++
 1 file changed, 222 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtcsys.yaml

diff --git a/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtcsys.yaml b/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtcsys.yaml
new file mode 100644
index 000000000000..2dc7c2df15c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtcsys.yaml
@@ -0,0 +1,222 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/sophgo,cv1800b-rtcsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cvitek CV18xx/Sophgo SG200x Real Time Clock module
+
+maintainers:
+  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
+  - sophgo@lists.linux.dev
+
+description:
+  The RTC (Real Time Clock) is an independently powered module in the chip. It
+  contains a 32KHz oscillator and a Power-On-Reset (POR) sub-module, which can
+  be used for time display and scheduled alarm produce. In addition, the
+  hardware state machine provides triggering and timing control for chip
+  power-on, power-off and reset.
+
+  Furthermore, the 8051 subsystem is located within RTCSYS and is independently
+  powered. System software can use the 8051 to manage wake conditions and wake
+  the system while the system is asleep, and communicate with external devices
+  through peripheral controllers.
+
+  Technical Reference Manual available at
+    https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sophgo,cv1800b-rtcsys
+      - const: simple-mfd
+      - const: syscon
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
+  "^mcu@[0-9a-f]+$":
+    type: object
+    additionalProperties: false
+
+    description:
+      The 8051 subsystem is located within RTCSYS and is independently powered.
+      System software can use the 8051 to manage wake conditions and wake the
+      system while the system is asleep, and communicate with external devices
+      through peripheral controllers.
+
+    properties:
+      compatible:
+        items:
+          - enum:
+              - sophgo,cv1800b-rtc-dw8051
+
+      reg:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      resets:
+        maxItems: 1
+
+      sram:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        maxItems: 1
+        description: The SRAM controller to host the code/data
+
+    required:
+      - compatible
+      - clocks
+
+  "^pmu@[0-9a-f]+$":
+    type: object
+    additionalProperties: false
+
+    description:
+      Power-On-Reset (POR) sub-module, hardware state machine providing
+      triggering and timing control for chip power-on, power-off and reset.
+      Supports battery low voltage detection and interrupt generation, as
+      well as button-triggered wake up from sleep.
+
+    properties:
+      compatible:
+        items:
+          - enum:
+              - sophgo,cv1800b-rtc-pmu
+
+      reg:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      interrupts:
+        items:
+          - description: long button press interrupt
+          - description: vbat detection interrupt
+
+      interrupt-names:
+        items:
+          - const: longpress
+          - const: vbat
+
+    required:
+      - compatible
+
+  "^rtc@[0-9a-f]+$":
+    type: object
+    additionalProperties: false
+
+    description:
+      The RTC (Real Time Clock) is an independently powered module in the chip.
+      Its calibration module uses a 25MHz crystal oscillator clock to calibrate
+      32KHz oscillator.
+
+    properties:
+      compatible:
+        items:
+          - enum:
+              - sophgo,cv1800b-rtc
+
+      reg:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      interrupts:
+        items:
+          - description: alarm interrupt
+
+      interrupt-names:
+        items:
+          - const: alarm
+
+    required:
+      - compatible
+      - clocks
+      - interrupts
+
+  "^sram@[0-9a-f]+$":
+    type: object
+    additionalProperties: false
+
+    description:
+      Provide 2KB of SRAM, which can host software code or temporary data.
+
+    properties:
+      compatible:
+        items:
+          - enum:
+              - sophgo,cv1800b-rtc-sram
+
+      reg:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties:
+  type: object
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtcsys@5025000 {
+        compatible = "sophgo,cv1800b-rtcsys", "simple-mfd", "syscon";
+        reg = <0x5025000 0x2000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x5025000 0x2000>;
+
+        mcu@0 {
+            compatible = "sophgo,cv1800b-rtc-dw8051";
+            reg = <0x0 0x1000>;
+            clocks = <&clk CLK_SRC_RTC_SYS_0>;
+            sram = <&rtc_sram>;
+        };
+
+        pmu@0 {
+            compatible = "sophgo,cv1800b-rtc-pmu";
+            reg = <0x0 0x2000>;
+            interrupts = <18 IRQ_TYPE_LEVEL_HIGH>,
+                         <19 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "longpress", "vbat";
+        };
+
+        rtc@0 {
+            compatible = "sophgo,cv1800b-rtc";
+            reg = <0 0x2000>;
+            interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "alarm";
+            clocks = <&clk CLK_RTC_25M>;
+        };
+
+        rtc_sram: sram@0 {
+            compatible = "sophgo,cv1800b-rtc-sram";
+            reg = <0x0 0x1000>;
+        };
+    };
-- 
2.48.1

