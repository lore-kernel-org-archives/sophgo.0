Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A3319DF81
	for <sophgo@lists.linux.dev>; Sat, 15 Mar 2025 22:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742078971; cv=none; b=t9V2pVlOwDYH3RIe/0APLCEI4vE91ZSqXeMEaLvtGACqA0NSPfa4/Ah31t3qJ9Yv1Q3j5olnD4co6k43E73bkv5qOrPKq7VRQCxamSU33H0C04VxzwMrEIQifCrF1zbCPQtmUou1vUbsdC+4ORHPLHjaKgkW1nO8bCmoybXS4j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742078971; c=relaxed/simple;
	bh=u3rqUwCU4XDWiEqSaLjp3Ri55hicxwzBah2VGWN3MoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7lQIZGPK/QmPvXgcsuvdbnBNCM6illeZIWAM0xWkVplAJNxu9I7+XR2MTzZ+4lGJ49nVJ/+J+7808iOvx+17qnphauBy1MWze5JeQR4Gkw/OkXyYoskksWDmahb7diOIyqAkNOFZGXxCS0oonoUEVR409Ril94GyZ3qPOe4/rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=no1wQ2mg; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="no1wQ2mg"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so2279093a12.1
        for <sophgo@lists.linux.dev>; Sat, 15 Mar 2025 15:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742078967; x=1742683767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dymk5NDXOnGvVfyO9fnI/EnalYvslfe/wlkmevGLGhc=;
        b=no1wQ2mgfbi6jKvhcizyYnNRYHlbwrpA9Sail2ZbBiILtJKWqiP2NEKl9arKhlw1VM
         /RJycwqSDsKlC5MtaEtzMfRIhICNTFWjnBXnt4nVUGBTG9wwDGwtjhwGncohOBjhcpV6
         5NbIQscD9sXPwnkD8rQeykjc2mS8FDMonwXS7cpifcjYt2aSNEnpfFldDv0jmbXQMkHt
         w5Cxp1KK6Wq23uSKU5hQGT/CW3j9x1jbH6TxD+xqMuQy00+o40cjIJO8ehId6XuK7Ys/
         37nFnPZsPI1D+EMkOf9KzWlr8jSTXd148abJ+0jXQ2vH5/iXNyDGorH4OnCOmAlnZ51A
         S+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742078967; x=1742683767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dymk5NDXOnGvVfyO9fnI/EnalYvslfe/wlkmevGLGhc=;
        b=L6Up2iALPDo/1zpM3R+6SLENBh9kOoc9AeuO/L5tCR0pdmynvhtNGpc/frIni0S6g7
         6unAdxnv75MV01I+Fm3g/vSY+mXefVZa5RwaYJDpeDQtp7eXeyo9Go7rKyJ8YVuaP6My
         E5ekl+aCOVZjObxDuUe32YDxUsMMDn81XY0um62qjzCBoCrYpo5+hIykrN8EYQbz61zk
         ptfOBDcGiIEpNO7vy5uQWcL4jACDB98umBljBR/qvSM4viMN2zKI3B82QA0sFPSrBWzK
         WrIPjCUfzJQhHEMG0JO7ztkWFSEzDaJrxRipXiy6z80x0dO+1ZMzUUUYUtrPiSrYSHXZ
         N98Q==
X-Gm-Message-State: AOJu0YzAVCSAA1aYAnEs3PN4Ec0APlubLuj3fSQ4zHkJQzbS6MDyll29
	ScaWnna4tF/BzV2FhItOEUmMxLaV+HvNbzDypRHhqXRvypidxnHkIa8f9uwP
X-Gm-Gg: ASbGncs+jTyTnKicgwXvK/ZADiYajaStWY8h2oM0UBgaeC5CR0KCRaWxh0FHLJZO+Bi
	nZRqz0s2rmIRGA3O1ClSCnfVdeEL499WZyszdihX4dhPJUBFFwVQYuUCBZUtERTDyU4qS4cquP3
	0z5s4MpQ87DMuKbDx9npNEwYHuCBVRZcWfLijsT99vWU5wKtlMe8zByKDMghxpF9OFrM6cyHvMv
	L8//0Av0XUgePQnbR4BbWVjOOu9IErcShJBJ5ALUelHn/NTq/NlxfhNriS4RuxG4Mdae8cdf4D2
	PZjCmXzlHRHVNsQQyVpKMXPDrbs/W8fgg7BghoaECjk5jKXycF9HwGrTqw==
X-Google-Smtp-Source: AGHT+IEufEPFKmezzyyBW1gs6pWk9iMehkx2yVP4twAuvTceJ1xSya1DnKsBPx/LLL+anXc1DsJ6nQ==
X-Received: by 2002:a05:6402:50c9:b0:5e7:c50d:9dd8 with SMTP id 4fb4d7f45d1cf-5e8a0bf3c89mr8361479a12.32.1742078966534;
        Sat, 15 Mar 2025 15:49:26 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b160dsm3775586a12.41.2025.03.15.15.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 15:49:26 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangyu Chen <cyy@cyyself.name>,
	linux-kernel@vger.kernel.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v14 1/3] dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series
Date: Sat, 15 Mar 2025 23:49:12 +0100
Message-ID: <20250315224921.3627852-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
References: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
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
(MCU core), accompanying SRAM, hence putting it in SoC subsystem.

Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changelog:
v14:
- no changes
v13:
- Moved bindings from MFD into SOC subsystem

v12:
- maintainer Jingbao Qiu <qiujingbao.dlmu@gmail.com> -> sophgo@lists.linux.dev
- dropped Reviewed-by: Krzysztof Kozlowski
- link to TRM
- mentioned 8051 core in the description
- binding is now MFD, not RTC
- added "syscon" compatible
- added "interrupt-names", "clock-names" (because of added PM/remoteproc)
- main compatible "sophgo,cv1800-rtc" -> "sophgo,cv1800b-rtc"

 .../soc/sophgo/sophgo,cv1800b-rtc.yaml        | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
new file mode 100644
index 000000000000..5cf186c396c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sophgo/sophgo,cv1800b-rtc.yaml#
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

