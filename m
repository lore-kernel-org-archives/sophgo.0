Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA063E5A3B
	for <sophgo@lists.linux.dev>; Mon, 15 Jun 2026 12:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525052; cv=none; b=ZnbYx+YKnGtQM1NpRHhoHoZ1N/f4+o72JkpZyvpCsEU1DFaWbYqZo+UiVx++BeGpl8qOrYyM6+11KESpECa/N7Kf2nhgOZ7GSDrW9fDZKpOSH0sk03V8W8ekWIgIEvEKGdmEisn7s7rqP1XaxJWwjW/LpWW72bLaQB2+tr0c8Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525052; c=relaxed/simple;
	bh=iRWUrA+FeoABsmVJudqAy1L3BhEakdG0HfrnY40ToaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kAFdd/RnYsaOK8UvT1QlnN8UD9lHCgU1LxxiWMQ6oSqYEQ7BuiwfjI0TnjjRvBSUMp/DKzhe8EbuWXw28lGEbw54KsTM9siU75qwQi+mdwdGY7VeX1YPy5y1Ihj++ANbE1o9XwS8EldmRhlvYrNOx4srJ7/USWo2HrpwPTJXVtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rDzYBHT1; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rDzYBHT1"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-517654b8e28so22620091cf.3
        for <sophgo@lists.linux.dev>; Mon, 15 Jun 2026 05:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781525050; x=1782129850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRwZTT2w4p8NYfNQ0Ipiacgsycn8UzShxm+qaAwvLsw=;
        b=rDzYBHT1reiW93bXEm9ONKXpRnV3GhZgpmj4cBo+dKJllnZB11YrehtmgpVBgLnmfl
         PgTyN45ZqLGJ/9LGkNZVcbHVZtlN53U0giZoM65RIHdQzSsDSNJ6DEoZsZb1q2Gzx+E5
         KXoJssG9L98ACMJjHO+kN3dShkA+2wAB3l1bMp2zUx1TdwvxzAJ6/84kZvJpqT3XBSjI
         tKOVnjTRFO6f5wH8meEmaNK6iOma4+ih2f7k4V78eIizmGgKXvNyMoL7SlPZPTZKDCg8
         MLPX5XA0aFB9wemcFy13B4Js2hmndRaZsD18Lh9Rm2wMw5QJOwIynZGnYWMTcyFmx5SB
         puOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525050; x=1782129850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gRwZTT2w4p8NYfNQ0Ipiacgsycn8UzShxm+qaAwvLsw=;
        b=LwRb2g39eYwgTBdhidQUoNKB+djLaE1sMHy0WNOyDFJU+Cs39DjIrpDjHhDdAGkGOY
         T+CxFU5C59unb23FwANMX8aom93CMW2lGlsmyBRx69XXqnAYNxMeZREvYI6kjaHucVOO
         1+TS/UuICqi1y+ze4/CIwbdMG8UVdel+/xQ1JhJqa4kGR4HKyPsp2Tcu/RS7gAztuBOj
         M1GNZVfRZrYjUSNRzJ7XQYB8mQrd9nOJZ7/SpZGpYGwfbKZdArEPGjYRJ1upD17buvFM
         ZtkJqRRsjozSKtWKiXDwVpWJ6zifAIkwuq65CrOcG0lVyGejumuBJhhorer4a95G7R5u
         gJrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+F2ANy7/ZBnOmYdnssZeoCkSrar1thODvtvQOZOrCssi6zrOVXxrk3Kh2SdXKAPz9EeNmiSzs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0mmN0C5KOVk+jjBStoGKzsDk2tc6H0pUIjum2dqhnEZe7T16b
	Lkf0cxPfMC5RNr/QtgovHcEW9mm7rLOd6zen81sAPuyBX+v0NdlFPCQ/
X-Gm-Gg: Acq92OGHQKcbwDjKAyiHO9LixA+CxTbeGIh9L090M3DhaMrC9xrtlkkh1zoQl9z8XxG
	u4X6zMp1fe1xLt1v0eqjUEM8v7aN67rOIY1tPUv0oScIdhZJc+Hz1SbCfN6I8ijesiiCSaN6M11
	y5VVk/CefPPUzVlZ2fe8hHQ2hDfr+mi88DqhhEfZ7Rlte+WKqpASin9IcBmQMRLtEEk/HTcB3x2
	gBGnqNvkp1q2YOP0xMETBLVJo3m0dj1jd6Brmobt7x60YURNn0/AhNSTuv1Hhtyue4RTqmqRFn3
	F/XrwT7snadxL7izAyv2rKHSWBMOL3i7WXkTCPQ8VJbeowal9UP8oRmFlwxwlcoZqTG/q7kCFbH
	m362jmPjZPVq92wl57P4h0fuDCU7LSRFgWdGN9NSKHS2nnurFv+j3CAMDT/3Ushqfzr5jPKGZpw
	vfpeyA8zXfqhO7Lws4hA8SORt2h1UCGqexrGHy/KRvmi921tNvOHq6sVdH
X-Received: by 2002:a05:622a:1191:b0:517:5b2c:6aae with SMTP id d75a77b69052e-517fe1de684mr198345971cf.13.1781525050315;
        Mon, 15 Jun 2026 05:04:10 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51975955956sm25184311cf.17.2026.06.15.05.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:04:10 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	chen.wang@linux.dev,
	inochiama@gmail.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	hanguidong02@gmail.com
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v6 2/3] riscv64: dts: sophgo: add SG2000 dtsi
Date: Mon, 15 Jun 2026 08:03:23 -0400
Message-ID: <20260615120324.1527881-3-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615120324.1527881-1-josh.milas@gmail.com>
References: <20260615120324.1527881-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds sg2000.dtsi on the RISCV side.

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
Tested-by: Gui-Dong Han <hanguidong02@gmail.com>
Reviewed-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2000.dtsi | 53 ++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/sg2000.dtsi b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 000000000000..38462769574f
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "cv180x-cpus.dtsi"
+#include "cv180x.dtsi"
+#include "cv181x.dtsi"
+
+/ {
+	compatible = "sophgo,sg2000";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	soc {
+		interrupt-parent = <&plic>;
+		dma-noncoherent;
+
+		pinctrl: pinctrl@3001000 {
+			compatible = "sophgo,sg2000-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+
+		clk: clock-controller@3002000 {
+			compatible = "sophgo,sg2000-clk";
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
+		plic: interrupt-controller@70000000 {
+			compatible = "sophgo,sg2000-plic", "thead,c900-plic";
+			reg = <0x70000000 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <101>;
+		};
+
+		clint: timer@74000000 {
+			compatible = "sophgo,sg2000-clint", "thead,c900-clint";
+			reg = <0x74000000 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
+	};
+};
-- 
2.54.0

