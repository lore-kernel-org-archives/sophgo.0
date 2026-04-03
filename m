Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98208364958
	for <sophgo@lists.linux.dev>; Fri,  3 Apr 2026 11:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214966; cv=none; b=PO9HXDpfATUjS0AejXK6CAJJ05QGYR9OHU5F0Q8WrRc+cfmA/82RMAFjeTMm+K46GR5i3e3FjGQvG7EhFd6VPtE4XXLOgqLIlCFtW0w1xjXbmPeIGckKYkKZRqRdXByeJpjeWmxJaExHuDlyD75j8UKGEVCTBF0sVZATAMRosX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214966; c=relaxed/simple;
	bh=tFW3YISywSwOMjdHnG6FZDjw1jg1AF8WKQoGy8w1cNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YZAGhfxNUPJtRIxKUNxhI/EoB8v597BvdNjl7InQe2+6L/Hj+oGG9nhQYOR4ubOCeR4+Rv+i5RXxudk8c1ml7UKQSowVI+hTwZbPndRcj4LHKYJPNQ2ONbmGdWO+3JSpkXrjvDuuuqVit3c8VPngsroRuIrdjeJNJs0qHTXhx2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcZB9f75; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcZB9f75"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-89f68634786so23055886d6.1
        for <sophgo@lists.linux.dev>; Fri, 03 Apr 2026 04:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214965; x=1775819765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJAPLXH+JSPAdQeklsWr8qGoeKpyEbUrtjYWuQxTQmo=;
        b=dcZB9f75AM4YbSpG+jhLRoGwNc9JFeOe32f9hWlyUY5VSChXhqyZr7Nv50HvzarQU4
         FKy2dEHj/vPlpPtipQZJeQWJCfvl9U2q+zqjT66q9MYbV4RMkfFH+72vHj+kh4ejMmm5
         OMZAt/HxB8WIM6YygpDO7RxC9wnwgI4PwmXRWOIcB4poTnDwtiUjffsKvBaNTPd+cF+z
         /yVmSHuuMYYcowu/8Hzi6TaRSLRB5UtBIO4P5YBpExfuOAj7CmS4zYCNfA0JpdW8ATXW
         /bENFeoXymX9y5EehQhiyKXjTTIJEjrEmkXqAf1a+TzDXIqTzKPv6/dZuHkZkAq3lCbr
         h1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214965; x=1775819765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJAPLXH+JSPAdQeklsWr8qGoeKpyEbUrtjYWuQxTQmo=;
        b=VyEQwJUlIdmgzQvsvYVqgEr06yrOKM72S/7QEnuCbd3daU1LLxgzzxHK6V0Rcj7q8u
         HGrcxZ9GdJN1yqYBsAZV8Pc6wlursW9aTfTjDczzKTIbNu6iMtUCKtoaH3z6cjscEIq5
         NW00NGvl5XJTeFrtpxpU9iJyZLLURNI6Yk4R5dys0nJbwrl4UN6xVO0hoXu4i3yaDgO2
         oLkQLde//OG8IEwiT6izYKjvA47X9wN5udP4mWqn890yw+inlH6Fjiio1edtBkTkc2tx
         pyO0gdlo6+57MpLIQeaoyVSGUudhucs9h38HFtbR742zNAHes3K/Rzt2qzpeCZIrGlwF
         nc8w==
X-Forwarded-Encrypted: i=1; AJvYcCXevP2DXQCT1d7g+f0QQa/v2k8xih0Fwkre5CB53p4BpeY2AJ27WXiREjdP8piBeeszK9w2Z0Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKdvpDMiuY/mKUAMKoMljiVENET+50qbzqRGewwdlBpzb9jUN+
	hd/Ah+MNNcDzRquIhBCH9ZdzQ7g5meynas8+lK4LbN1yhmSL7YTEFQDI
X-Gm-Gg: AeBDieto5b+Icgl8Fvl4vEtDHJzACxJQ+xaimy9Bl4kSPEsqDmXlHTUwiPAEQJFOG//
	udERYGO+HZZtXvfopeVYfvOSyb/V+Hw6bHde6oO2uDZQSSj5xrxOGj8LoHVtr9PlwR5uSwhJZTI
	i578qCZkpFBxe0f3jLW2tzw8Sp3jpaA4V0+jDJbXA3x5IJXP+82VHErhT4so4hBIbOveHAvXRIn
	fwx7e0XTvR1XkUygABMmYIwHOUG0JtDFEqHBPr9vALwi7l+c2dP52/awqtKFqWb65cip1wGRsJP
	x9k/Ji3MCBHsvGRwwadjw347rT4IJsHrZ1N7VBJSW2KaD5R45zPUAoFMxdJYP2uL9ohKcYHqNKI
	lnBnXokoF/5xhBdvjgQGVxHfyTQ1r//9MQmnQ5NHiHDQZxMAGOJGJeKqHDd81eQu2lu43vEAwpD
	c5i3gpY/a77SE8/W5bfCGuzkTdakaS3sFHsPbJ/xk=
X-Received: by 2002:a05:6214:55c3:b0:899:a91a:2e08 with SMTP id 6a1803df08f44-8a704bb920fmr38024396d6.52.1775214964596;
        Fri, 03 Apr 2026 04:16:04 -0700 (PDT)
Received: from sleek.hsd1.nh.comcast.net ([2603:3005:1473:4000::71a3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974e8e8esm45319836d6.43.2026.04.03.04.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:16:04 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 4/5] riscv64: dts: sophgo: add SG2000 dtsi
Date: Fri,  3 Apr 2026 07:15:15 -0400
Message-ID: <20260403111516.379795-5-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403111516.379795-1-josh.milas@gmail.com>
References: <20260403111516.379795-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds sg2000.dtsi on the RISCV side.

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2000.dtsi | 53 ++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/sg2000.dtsi b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 0000000000000..412adacc00576
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
+		reg = <0x80000000 0x10000000>;
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
2.53.0

