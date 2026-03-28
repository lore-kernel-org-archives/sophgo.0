Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D853A6EE3
	for <sophgo@lists.linux.dev>; Sat, 28 Mar 2026 17:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774719477; cv=none; b=tZ0Qj4/lH42UmJz3h06hjtsKSb7xTpbxNcZ7qjJGidnq86YX4vvyA4rtB7Bxa9s1ntqSbV3uWveE3yun22W/gtOp0/RDlfZRsbQbeHBwRbhab2nlZApVYK1L4BKXzD/q5Xjw7Fpm4PV8Um5GQc9yvlokX9vOWefbanm+Eih1tzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774719477; c=relaxed/simple;
	bh=tFW3YISywSwOMjdHnG6FZDjw1jg1AF8WKQoGy8w1cNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=chFS30vHmta/JiVsXmXvBTXUPUhjVa/7LS6/t8ABzGfWP/b8VIe9UexQu2wCXdu8ZWOIy618V7cfMqOWm4b6pdo3WLgfWHGR32otyOfyXKZA1NR4swgzrff09Xeo7nQ3+0z1FzuMJ94NMGMD+srlvdKwUko9ChpQg97r1l9W5Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RveAesn0; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RveAesn0"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50b29c4e554so40064491cf.0
        for <sophgo@lists.linux.dev>; Sat, 28 Mar 2026 10:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774719475; x=1775324275; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJAPLXH+JSPAdQeklsWr8qGoeKpyEbUrtjYWuQxTQmo=;
        b=RveAesn0tfNBx/WWSiy1XXnMaqgAJzY65An1UHylS2g55k+VJloN1GgwkF/XBn8qoD
         LOOiJuFt/iFV4YH6Gt4j0byDSddxZw9L/WtYrqkkcgg6gJfj7GI/kEXoNbZMhPQUz7+y
         A0h9dt5suvvSaZksos8D87u+bAWJBolIo9pxo/O1o4OAIYAgkjswkNvcH6fd/yAQzYe5
         sH/1+gxAGI5fRoeTTS0dJhzXSatMYgwStt+VDMGDZUobyVLS7vwJMAeWY79Oem6Lr1mU
         7n7qRhTP8I1LNGh1WLO4KwKOEJU2SBhIJBah4WajdTKZRgc9xAJC65Tb4L/pFlTapHpM
         FzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774719475; x=1775324275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJAPLXH+JSPAdQeklsWr8qGoeKpyEbUrtjYWuQxTQmo=;
        b=ETCWjLMzhXNZePOAAz8OpGCVujPNCFocUW65zWloduBFs7oSbIJlkPzJDcEbrr/7RK
         7dCEADUzsT1RzFe6rBVi8fGEhOCK8dBpBMzbR7qmWr91YgRavQLaK9W5RT60Pt9v9l+J
         1/cjUXUv3supRv5puSBSpAQIk63Ptf1/FG0FZdULjtLzzeizJMqxN2Z1bvYG5wnD5NJl
         eU2Ym/KK0MbXYgMt9ND6fRJIMAO9BagY5ygn82uONvuSyBmIj+ntVtK4X4ngShCU/yoY
         zgM7snBOOZxhwQjUS+A4TsDzPyUMJdje7P12yFDZGs2ElNxBUlRB7sZCPyNDcD15xXGf
         DTRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPFnCJjUwpJhsz2SvHCm+tDaJ4SCJLpKP4fSHBx5goBXMoKrfShpa0EnebFJ8/cNLes73wlpY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0co9dxCwRDbN/5dwaIqQ1v+VGh6iT8fs3FjK6Uu/8G2gMmQAK
	MDBQ9E27P8ehhiSQ4JIv+gj7b3CTlNVBVsmL27j1gSjJ4Zmf2WO6oMN6
X-Gm-Gg: ATEYQzzcREDWemDL9O0XvMXr94q6ZpWDUSnZdPpeKg7AlrujI3zP5vnqjWnHECucpxg
	MUd5rQYkZb/M9O2XMxGkU3H3IH+A9lGat14H2nYUL0g5vlVg6w+PjI8g+4HIEZbnvTEBpouEedf
	b97uJ/m9sYd9vBOqN5FHQegIHRa6YEYYwOTTNDwOlK/Ul+Id19E/ukyEun+CL6nYopz6NW8f6P+
	8gzdHj2I4vxtRX3jAc/AWlqAtwsdUALJwKXerH10zgclMXi9RPVGs8GSERSHk9L/bX+FOuuL+rd
	SPseT3HjbD0MH/9pA8k9UehegZ074fG+nCEpx2826IYmil3RRSQNFyle8116fjLNbwdWuNpFFE6
	riSO+qjF1uB9qviv89FibsoeS6d1GTnpmwQufQXN+1HDTIxwzUprfXPyGtxXJHLxzBtxgT1Onfs
	T1MRXaQ92359Hcknb4AXwkL1ZS+H7GzFYd/c3Ne1c5Mq+W+PA5X6p4M5OaQjeWAejv020=
X-Received: by 2002:ac8:5dd1:0:b0:50b:3b54:d796 with SMTP id d75a77b69052e-50ba380f13dmr94020831cf.27.1774719474903;
        Sat, 28 Mar 2026 10:37:54 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm26629641cf.7.2026.03.28.10.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:37:54 -0700 (PDT)
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
Subject: [PATCH v4 4/5] riscv64: dts: sophgo: add SG2000 dtsi
Date: Sat, 28 Mar 2026 13:34:49 -0400
Message-ID: <20260328173450.219664-5-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328173450.219664-1-josh.milas@gmail.com>
References: <20260328173450.219664-1-josh.milas@gmail.com>
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

