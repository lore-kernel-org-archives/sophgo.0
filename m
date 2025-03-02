Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA101E7C10
	for <sophgo@lists.linux.dev>; Sun,  2 Mar 2025 19:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740945144; cv=none; b=R/94UotGKVl67gbxni06A8ubN+qhHE0gjOWfHtSMHI3/a1AjeJBp4dJwVd0TXX1rts9eos2LuVoHwO6Kg/YA/MGz4h1dwSTRbVgTkXJXKMK+RMkugIgVOqWL6fJj80jcIMYASSmKgfJ/W1Rl4Y1mNosLSPx+JdJIBflKQhW0/YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740945144; c=relaxed/simple;
	bh=Vf8pU4k/6I94NEvTRNngJqsiSOFMb1PByV25ql5hlew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VIG/yVG6ECQp0HDjq182WYT4d/f2pQS4AJWfayulybptynJG3OyS1mErs6qE6NCtm+G2gp0trAmLYYd9/0P9oA4WEwZowNGH4hLSByfBNlPrjLHx56aUvccgU+qJjvuALNwcmOkDvo7/C0VgBRs6hT+epelrHGlq/+Fonmm4CzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k08WREC6; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k08WREC6"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e52c1c3599so1545650a12.2
        for <sophgo@lists.linux.dev>; Sun, 02 Mar 2025 11:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740945141; x=1741549941; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5c4NPufpKoLHDbbT+GlLj3VGqCkTEQTVZclMQAkqv7A=;
        b=k08WREC6RF39ggTWK+c8/S7RP+sfQLI66HZir4kAR4C9m/XN1xg74/PONziss/9jG+
         85qpDWjaJLXHddP1LDNfxQTda4Qi7DoqG171EaD0ptW4R1jbnI7nZbGvTuylA/5/JYKI
         9vO/cEVoieFICriNI8MHEzyLMCy4mqCd9zzEmvqrVH7OVzAA9tasrUpoitIeXNkz1PhN
         D/HuktMbZstpttdt0JBKzPdaRHTjariauN91zrSc+VrWPQUQYg5GwaSXP0Z2LP18plKu
         Jnld71rWLCF4+046f5mP9JyZfanxxIYYl/RaYTscedkflMwp8DEIrv9yJB4S+17Kh0aE
         ZdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740945141; x=1741549941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5c4NPufpKoLHDbbT+GlLj3VGqCkTEQTVZclMQAkqv7A=;
        b=mnNFw24Jph41sziZrk5Rd7apip2m4WV2ndllNgiG2EJPxnxioOrDeKR1T94ec+6Y03
         aLynuDKb9gDR+I6/7iQhdlHoLUx7fQykVSxtz42topLA9/J1zTT/bAiDSBW4KvjPLrFC
         NKMC0wlP/x9gI81OI2I2BK18c16hfTBY+WR1u0T46HJpjpNm/ea3KbEatjDdnvaN9kCd
         Vxeqwu6V441GCjJQLsbESphZyVg5B0XTO98zh7AKZT0ImxVyUOJ0kRU3YAbu7Ioaf2oi
         HaxBw23fUENghZ3ldBSdFbNUQca+jSR3elqmCOggG21N8Ve1d+4M1WwDHLvLPkn/rpqI
         R0HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNq7sAbOxYmH1iYCL2SEKXFhFYIZj8IB18igfXsGvz2QSeJJDGb0Y6bb+9h/HBcsg/hDpeaGU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrlnPRJkqbyli8s2GhUADWzq5b5koXCsxjuY5ZxWr+IsEjFC7u
	kF/MuqFgJVyB7BP4RY0TM4GDcjDVaX9sXHBfP2cpyj+/Oi7AkgVt
X-Gm-Gg: ASbGnctFI5ymqSwVnsQNfPicAA7nlvTE87f0jBncK1MK9EdXgNs4xF7Ztnh2ZzABU2J
	6c0pc2bK4rNAPfpPZ6zhrowHGxmLwjtNgswKFZYw95hvhx5sUCGnzFfCOsBK5FTaXd1ToDtcMvb
	nquNa8MquCUYY59xVDBKi5YEdhe24CFbSc1C8Ht236moNgV1eU7RMz3fVqvMHGJy+ItwCEmVzBX
	mTsTiOjr5CD4ZgXvljHnQzqxA2os0X60vAMss+Cy8iqGWQ5Gr4IVhqz1FTAKFO9AyhPjHf7bnW7
	QT+8N1IkQ3wwn1XnHdIZJdpo4+S6TSfaumPc7mUN5+t2xxK0GTgNVgo3zA==
X-Google-Smtp-Source: AGHT+IHMRWSeokwzGm9sYVxt6NEktsQseTTVLAH9cmQzwWOcNzWx1ZDznjFLVkWHDK9J21xpb4xkkQ==
X-Received: by 2002:a05:6402:528a:b0:5e5:437c:1daf with SMTP id 4fb4d7f45d1cf-5e5437c22a7mr3296240a12.16.1740945140979;
        Sun, 02 Mar 2025 11:52:20 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm5809705a12.77.2025.03.02.11.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 11:52:20 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	sophgo@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v12 1/3] dt-bindings: mfd: sophgo: add RTC support for Sophgo CV1800 series SoC
Date: Sun,  2 Mar 2025 20:51:54 +0100
Message-ID: <20250302195205.3183174-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250302195205.3183174-1-alexander.sverdlin@gmail.com>
References: <20250302195205.3183174-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>

Add RTC devicetree binding for Sophgo CV1800 series SoC. The device is
called RTC, but contains control registers of other HW blocks in its
address space, most notably of Power-on-Reset (PoR) module, DW8051 IP
(MCU core), accompanying SRAM, hence putting it in MFD subsystem.

Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v12:
- maintainer Jingbao Qiu <qiujingbao.dlmu@gmail.com> -> sophgo@lists.linux.dev
- dropped Reviewed-by: Krzysztof Kozlowski
- link to TRM
- mentioned 8051 core in the description
- binding is now MFD, not RTC
- added "syscon" compatible
- added "interrupt-names", "clock-names" (because of added PM/remoteproc)
- main compatible "sophgo,cv1800-rtc" -> "sophgo,cv1800b-rtc"

 .../bindings/mfd/sophgo,cv1800b-rtc.yaml      | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml

diff --git a/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml b/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml
new file mode 100644
index 000000000000..b80d68502c48
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/sophgo,cv1800b-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Real Time Clock of the Sophgo CV1800 SoC
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
+    https://github.com/sophgo/sophgo-doc/tree/main/SG200X/TRM
+
+maintainers:
+  - sophgo@lists.linux.dev
+
+allOf:
+  - $ref: /schemas/rtc/rtc.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: sophgo,cv1800b-rtc
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: RTC Alarm
+      - description: RTC Longpress
+      - description: VBAT DET
+
+  interrupt-names:
+    items:
+      - const: alarm
+      - const: longpress
+      - const: vbat
+
+  clocks:
+    items:
+      - description: RTC clock source
+      - description: DW8051 MCU clock source
+
+  clock-names:
+    items:
+      - const: rtc
+      - const: mcu
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc@5025000 {
+        compatible = "sophgo,cv1800b-rtc", "syscon";
+        reg = <0x5025000 0x2000>;
+        interrupts = <17 IRQ_TYPE_LEVEL_HIGH>,
+                     <18 IRQ_TYPE_LEVEL_HIGH>,
+                     <19 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "alarm", "longpress", "vbat";
+        clocks = <&clk CLK_RTC_25M>,
+                 <&clk CLK_SRC_RTC_SYS_0>;
+        clock-names = "rtc", "mcu";
+    };
-- 
2.48.1

