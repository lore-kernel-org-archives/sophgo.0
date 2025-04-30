Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8010F126BF1
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 01:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745976440; cv=none; b=s6Hnd7GErRK2dxAZY98xD+4TJpfUvPuHav2YUvpmvh5QGgjj7RI6r5Xk32qNzT8QonN9uVZWSmRnGD7gBrIi4b+bEAp0SxIx+ViF6Yfl7Du/U6dNvmxA3PPJKeLcFNMdqaXUYZno5R2S1wkrVjq/p6u+s30BQgp9eYuWt2M6YkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745976440; c=relaxed/simple;
	bh=8wYCM7YU0tl0/Rc4UBIYztPvbcQfswX+GXCV2ki6VNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ed4TH9nmpwXRId0TNHRoL2BvhJ+Ku+c/KTSwycsIV9byvaAE1AN3/l5ImEULCYAqUbcnE+kzv4bhhu2ATGm+2l6JP+5dtv3De9BfZeqCnuvpU3dLOPPXNKOpsNqfiFK5NJ8BaHc+7lEkMmkaZeXapOP1qoradXcGri/i0545L8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxdYq/E6; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxdYq/E6"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5e39d1db2so415707285a.3
        for <sophgo@lists.linux.dev>; Tue, 29 Apr 2025 18:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745976435; x=1746581235; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqOgteceJ97EqtrfFsHCyBg+ecnlV+lK+Sepl7glG9Y=;
        b=NxdYq/E6UGbeNPT83wyZPIl0s1LuHKHpJMfTisC3dKoD5QwcOrJLb3zl7N2C7hI+DA
         YWbXl+/nz2nlxysjOljLmFSVoKqaIguB/A3u/xMqpuyXRHc84Vg1WyPsaGFO3abU9nNV
         glCvdCwT/RyXt9qgTT1m/5fiNzDUqmSsyogVWbTy8VmMDbaJYcI4kZUJ/a40QvC0utEZ
         6tzAhHV6Ymqwod7QwDtDTP3QZaMO/WaBzc1NmQNujgGp5XnJZfj5MUWZw6KvZPFKv07a
         cJJzZVkmWEzt67kL0AMgUUNapCczbQZ+TLyQBuyy1qyOlOTrI60opUrXqcVtJqbkN3yU
         lzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745976435; x=1746581235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqOgteceJ97EqtrfFsHCyBg+ecnlV+lK+Sepl7glG9Y=;
        b=L13xnUwWfZV+SVZyJDg3ADH7U5fN8D90JTYcuOMoU2GISm/OWucWvD+zZy5AHScfrZ
         CSog8uMK1wrbQeN1z/ykRr0+u5/52XSjs4DrTgSdeDPWJH1tosD0vAsqlYDVOo/ze3Im
         En13ZdPVrR39dLU7WfOIXiiZwCpXwkqQHaKdL6RF57KJwNfl4gMWNwBn4E96q8tJK6gK
         ke99+HlyurB6bWwd38yJpbHN28RjuPLyTB6j9XrvM45RXzSJpCnZg/zTO/UtV4y+Fl3r
         C9e5ppZaqDVG/+VsAWnwmdoVjSIM8xG85AXzX2WUcx3jnA9BgqvyOuAlI1NXyRt3M7T9
         RKrg==
X-Forwarded-Encrypted: i=1; AJvYcCUP7iasmg/6BY8kdOnMu0F2VV33i3O9kkWJwXeed1djk1S5EdGOECynCM5dVIK08zgnwjXMIc8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyaKT4O8CqsF0SxoIicfkOPQPMUikE8Fv+Z4Wh703NBPavh3bt
	vnhPDxbgCmjxFxyD15GTf2m1QZxxH6k1LjfR1znoLJ/qsbCED4dd
X-Gm-Gg: ASbGncvwnx6dqpBoupgtwxnzogB0Y5Av9jVreTJQR3OJ25m4fB+iDkL//idKnd9SCbe
	KbRIy7AszSEAcw/e6hXD3ST7rd+iJhyVIeuo7YFzeBziwmMJ2OhGr+o+0YS7lTXr2GuMBysUZmu
	mnfSCZeEYsKQXLtCksM0ddT3Q9bLgJktJdvQNV3yua/6W9MTlAoJ+WH64GMoFu4/+Tq8CiYi2mo
	hzB/YV07wnBnQkAIyk1u+7DMpT+vabvKce9+WKeGbArUS2KV/YAlgY8wnzKH7BBrMWf2GPEYS9a
	f+ddy5ra9VhqO7P7
X-Google-Smtp-Source: AGHT+IFznVwOf+7rTL3cFYJFJLEVhnwOPHd8m3x4Z5Bx6Mo8zEqI8CE8JP0GuGQpjVtULfwA4CqyEw==
X-Received: by 2002:a05:620a:2a0f:b0:7c5:6ef2:2767 with SMTP id af79cd13be357-7cac74086famr152959585a.2.1745976435289;
        Tue, 29 Apr 2025 18:27:15 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cac60e24d4sm68062285a.39.2025.04.29.18.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 18:27:14 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/4] riscv: dts: sophgo: Move all soc specific device into soc dtsi file
Date: Wed, 30 Apr 2025 09:26:50 +0800
Message-ID: <20250430012654.235830-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430012654.235830-1-inochiama@gmail.com>
References: <20250430012654.235830-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although the cv1800b/cv1812h/sg2000/sg2002 share most peripherals,
some basic peripherals, like clock, pinctrl, clint and plint, are
not shared. These are caused by not only historical reason (plic,
clint), but also the fact the device is not the same (clock, pinctrl).

It is good to override device compatible when the soc number is small,
but now it is a burden for maintenance, and it is kind of annoyed to
explain why using override. So it is time to move this out of the
common peripheral header.

Move all soc related peripherla device from common peripheral header
to the soc specific header to get rid of most compatible override.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 38 +++++++++++++++++--------
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 38 +++++++++++++++++--------
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi  | 22 --------------
 arch/riscv/boot/dts/sophgo/sg2002.dtsi  | 38 +++++++++++++++++--------
 4 files changed, 78 insertions(+), 58 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index aa1f5df100f0..fc9e6b56790f 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -15,23 +15,37 @@ memory@80000000 {
 	};
 
 	soc {
+		interrupt-parent = <&plic>;
+		dma-noncoherent;
+
 		pinctrl: pinctrl@3001000 {
 			compatible = "sophgo,cv1800b-pinctrl";
 			reg = <0x03001000 0x1000>,
 			      <0x05027000 0x1000>;
 			reg-names = "sys", "rtc";
 		};
+
+		clk: clock-controller@3002000 {
+			compatible = "sophgo,cv1800-clk";
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
+		plic: interrupt-controller@70000000 {
+			compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
+			reg = <0x70000000 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <101>;
+		};
+
+		clint: timer@74000000 {
+			compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
+			reg = <0x74000000 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
 	};
 };
-
-&plic {
-	compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
-};
-
-&clint {
-	compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
-};
-
-&clk {
-	compatible = "sophgo,cv1800-clk";
-};
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 8a1b95c5116b..fcea4376fb79 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -17,23 +17,37 @@ memory@80000000 {
 	};
 
 	soc {
+		interrupt-parent = <&plic>;
+		dma-noncoherent;
+
 		pinctrl: pinctrl@3001000 {
 			compatible = "sophgo,cv1812h-pinctrl";
 			reg = <0x03001000 0x1000>,
 			      <0x05027000 0x1000>;
 			reg-names = "sys", "rtc";
 		};
+
+		clk: clock-controller@3002000 {
+			compatible = "sophgo,cv1810-clk";
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
+		plic: interrupt-controller@70000000 {
+			compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
+			reg = <0x70000000 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <101>;
+		};
+
+		clint: timer@74000000 {
+			compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
+			reg = <0x74000000 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
 	};
 };
-
-&plic {
-	compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
-};
-
-&clint {
-	compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
-};
-
-&clk {
-	compatible = "sophgo,cv1810-clk";
-};
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index c18822ec849f..805b694aa814 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -49,18 +49,10 @@ osc: oscillator {
 
 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&plic>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		dma-noncoherent;
 		ranges;
 
-		clk: clock-controller@3002000 {
-			reg = <0x03002000 0x1000>;
-			clocks = <&osc>;
-			#clock-cells = <1>;
-		};
-
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
@@ -344,19 +336,5 @@ dmac: dma-controller@4330000 {
 			snps,data-width = <4>;
 			status = "disabled";
 		};
-
-		plic: interrupt-controller@70000000 {
-			reg = <0x70000000 0x4000000>;
-			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			riscv,ndev = <101>;
-		};
-
-		clint: timer@74000000 {
-			reg = <0x74000000 0x10000>;
-			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
-		};
 	};
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
index 7f79de33163c..df133831bd3e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -17,27 +17,41 @@ memory@80000000 {
 	};
 
 	soc {
+		interrupt-parent = <&plic>;
+		dma-noncoherent;
+
 		pinctrl: pinctrl@3001000 {
 			compatible = "sophgo,sg2002-pinctrl";
 			reg = <0x03001000 0x1000>,
 			      <0x05027000 0x1000>;
 			reg-names = "sys", "rtc";
 		};
+
+		clk: clock-controller@3002000 {
+			compatible = "sophgo,sg2000-clk";
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
+		plic: interrupt-controller@70000000 {
+			compatible = "sophgo,sg2002-plic", "thead,c900-plic";
+			reg = <0x70000000 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <101>;
+		};
+
+		clint: timer@74000000 {
+			compatible = "sophgo,sg2002-clint", "thead,c900-clint";
+			reg = <0x74000000 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
 	};
 };
 
-&plic {
-	compatible = "sophgo,sg2002-plic", "thead,c900-plic";
-};
-
-&clint {
-	compatible = "sophgo,sg2002-clint", "thead,c900-clint";
-};
-
-&clk {
-	compatible = "sophgo,sg2000-clk";
-};
-
 &sdhci0 {
 	compatible = "sophgo,sg2002-dwcmshc";
 };
-- 
2.49.0

