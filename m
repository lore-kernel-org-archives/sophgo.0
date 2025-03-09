Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6E421ADAC
	for <sophgo@lists.linux.dev>; Sun,  9 Mar 2025 20:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741552010; cv=none; b=fkhJbfTUqZc//gM8g/n6Z3gWciR17feZkItyXazBYgEFVT3129hokLjzyWAoCIaTcnPyBcYyhEn8i0wyL+n1vfDE+18Lx2FK1hjP7FUERyF5KREipA3YZ+V4KzpwKbGt3k/njMM/xZbGzIK1tLfvW26IYM3nGW01byz2wM2YC54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741552010; c=relaxed/simple;
	bh=F3cdf2Pun+QwUrQMwjJHLneORLZHKHKObVzmIuTIgpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YyeM7e1/scJOBMxdkagO0HP66STkdRS8QktRUV6ZFOqV6WkNJiGlOrgY9FVgVTew4tsqvRqmPISBd7tm0jtkpzh0aBuV/TU+qvuqk+ZkO6tcYZi766D9JmOg4e1oxRDsrivJmwFWYc4ptNiIevzmIAYmrjKPBeQv+xMYrKEyMUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyuEOsfz; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyuEOsfz"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e033c2f106so3741273a12.3
        for <sophgo@lists.linux.dev>; Sun, 09 Mar 2025 13:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741552007; x=1742156807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdqKnoVx0etfX45OW+fypKpA3XDIhcKZ1eSXDwOmnjI=;
        b=NyuEOsfzGHBxBDzriY28YsyTwpd2FGg6pMYGy+F8FH4WRRN62IbUHEa6o06z97OSTi
         0Sjsv8dqbbuoSZlfMrjhxnN11K2NaTTmnDvRhASC13mLN3aA0Q27bLGbujexgfp0sPoZ
         r9Ip4jDRrGdlLfI8Ycza4S5sY1OItzmw8g3T3rBB8LDb/pqBPAMBcpTXGYZy7GTrbCcj
         zDcj67KSbiLVyRqnr8+Vl3S27nX2m2YvwFmhldWsyw2ebbjYoBZueGSQkW0DbJr/L2H3
         2Lt/thM+0iJkRBri0lRWG14k/TKM6BwAmXeZMUW0aEc7ILhS9KmeuDOFKt+W1YMT85IF
         d8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741552007; x=1742156807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdqKnoVx0etfX45OW+fypKpA3XDIhcKZ1eSXDwOmnjI=;
        b=ecGnxSkWHBph9SVu443I0k+gXH9Md/pk7duzRiORAYKygFWn0D4M04ikNS6BTiZAPO
         StrRnQdmCVSllZiqZddTI8rEmk4bascW8rs6mim0tGfiD1sALDgtmSk4ezAvEujMRgJF
         lAcOChNNjQ5OYr0IKDRVa1VAg53ExQmgPjdF2vYIgX1DZXx66+XcwyebF/WJdq4Sfh0Z
         CjAbPBWlNmsP5xgn6erao0KAMMlZ4EjpyV++gQHnE2V6FmtDtF68G+hp0ZGK/2ELjAx4
         XglYeKeL/4/yk0hNRwIFxeDJIl/nZhbo2OrDG56TdUNK+4GmjNdx/JwTG+RxRiFJRkWP
         COVw==
X-Gm-Message-State: AOJu0YwbkJxHc+ict4wBPNLvRthXaE0VHesiZVO3w25zX1fl3JsSmL90
	Kt3BK4cqet5d8nubpy05+ljyiHZGpzSdrdopbioAbrskP+hHvE1NFPW50+dh
X-Gm-Gg: ASbGncv0l0o7frJUseQF/FO9OV/lJJqNJPsZx+7Y+ti8j/Dzz5EyOzIUFqKf9yETAOl
	CBes9pat3bHTlCgyVoAFk+tvk1fmHySOIqKKbagN06PuHpupISUrtgoSGCQsICU/TsaWm6XFeft
	eZXvPzqraI3WqfuuaXVqXICR7o0f+ZZvmU8RQc/Qllmuxv/CNbXXn4d1mRyZ9mTYgfg68TkXsUa
	nghkz0oOgksXHH46bOy7NfXzjmmgt9L4OE7hzLViokr6utnhOFpjsrZwFrZ9Rbx7KltiUKq+3uH
	GtEoQEqWREmAArRwBocVZRn3heIAch37pfY22rpbCpndA42wq4BGpkmngQ==
X-Google-Smtp-Source: AGHT+IEfsqIh7jXsVRSTB3hJ7A+XE0NL1Lyzez6UJvECg4L8wiO8q2zzms77Kr1kJYB9s1cac8H5Yg==
X-Received: by 2002:a05:6402:42c2:b0:5dc:7374:261d with SMTP id 4fb4d7f45d1cf-5e5e22a3716mr25364446a12.7.1741552006303;
        Sun, 09 Mar 2025 13:26:46 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac27c7e29bbsm281833966b.92.2025.03.09.13.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 13:26:42 -0700 (PDT)
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
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v13 1/3] dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series
Date: Sun,  9 Mar 2025 21:26:23 +0100
Message-ID: <20250309202629.3516822-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
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
---
Changelog:
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

