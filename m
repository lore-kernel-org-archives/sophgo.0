Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34E31A257D
	for <sophgo@lists.linux.dev>; Wed, 18 Jun 2025 02:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750212018; cv=none; b=STIrt3anPqqEjMsFpS5PV7mN2TK/7z06xyuggq9C75dlbGmdfpDxN6JsiNp/VS9UFfRD3wDqwT6ayX1g2AkAPlVd9cBBpyrheon5/W2VKfj5RFOo+wVT6cEyb6LeuzEz3Z7LnlFEwxfZbXql6uYV3VxQzrb4nF8SbmDEVycEIZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750212018; c=relaxed/simple;
	bh=rFyq+k00g1iR4pymAZnHIBBhW32DLS17AQJkKExG+FM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5mabxPRkkU0B1V6sBVaCPhXL7vHigKSaiwy+3MNEQT01zbD0sd5O4hUfipuPOLo9PW8FHuEzlNL0LWOHuptb5QvOTpy5XmvyAljA2hjt+W61j7JJxZB3KfIWeG+Ut3sOvuG80queDzqUoNeITtp9KAvjdJdGGLJIvQGUhprYCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFs2Xhfk; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFs2Xhfk"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so228321a91.0
        for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 19:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750212016; x=1750816816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tE1Gb1OrqiG3LYX4Be49eRK89ofo8s8025uwaNDm1VY=;
        b=XFs2Xhfkp3e/rWjbYGTCvfgjLzffPCkdjO+e2VN6t0jjUdnz3gK/gb2wQ5IC+CVoBB
         zvcKaCamqjvJLj01LmgrOkhmkQGfCXE+Pb7WoQ/Or8XSYHPoU96hOdoMJQv9R+3dgk1N
         KNkl1mSuKU2M7RCKD70bnyXJrLT1zaHaNefAxVzaj2qWMPzR7Nd5q3DRjwhixnJkTVkg
         O4tyz3Wo8XdijmvM/9WESVFCmUlSk+bREkol11UBVx/JC9ny8HpJA07fwrrup/AnRcl2
         X5dd8DJ+L8Jo/aS89H2iuUCR5pl9IG9YqbmSoMlbZ0+rTpWitsIv+esZEr+K5pnoVmqe
         l5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750212016; x=1750816816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tE1Gb1OrqiG3LYX4Be49eRK89ofo8s8025uwaNDm1VY=;
        b=ZQpRyG0kKWRrZ1P8gBgbGxu+bmYvNi45kcJmlkEZ57NkXbBCWPh7L2p9ykDfZrlOt9
         w3zkwbyMlTxIh0FsprqZ4c3K0OncxadNYHA7Fc+yYqxMPOrEDbq6jueDH/IBPhVJAmGY
         S1zs4sGpeNp0WKoEC2NqowgOEf6sulJLoZCfPYwj15uDzffmRYCaeDm5KhICENd12/Ed
         HcEsXo+CEOJYSOXmkQwKLg/rEZ5VAkmG1Ra/mZMUza95+zHh09UEs0rz3RMIaUbm3ULi
         Wpsw3aW/9pBddFnTnh9GvdhCC9Es1VQ2TIIG734CmnqpiYBNxnqG0RbZzibwOlUwrZMM
         6x0g==
X-Forwarded-Encrypted: i=1; AJvYcCVW6UHX289FZsxJV1wTD3pI+h2xHRwiw9ZD6draPC1tpB3xDAysg9A+5B/fMJS3Y8tQSO49s7c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKaeU3+iM3n1utyKIX/fSsV7g+lqlUj55yfVqKBYKTP2m58zSX
	WlTLiDeldYqaY11mx6S701UWiGaPHOBB4ok3brLgOX0sYLwHxrRr5/jR
X-Gm-Gg: ASbGncs/oZwQOwCakCUfrXTuTiD8fezozTUgvO4AWE0sLgXMo3IBbk47xmE6aRSoOyI
	SUbi/jy0ueOla7SKmo53Jn3iBUYSI/0fqLNMClyTrCzJw2XxA7VQQuSFf9KtXHL0smigJVRN8dY
	XVBO/IG489y3Q/LYpBWw+bzJT82g/DJDe0CRBvyhbKp/XLSLGhsygvu/mQO6evQzdio0aQuVnYz
	YuQ7a0KYU+rU3KM/Dh15ENI8kFhSsxMn/ooXDzWbqRUgNODBQmusbQTGBvxilm5bScewrAh0ELK
	cJSnJZutUd0IOAqs0HQFm/ZQMusRt+t4jOJPgVQAbhQi9l/W2oWwYeFUinq9wO8/KjQVgcNK
X-Google-Smtp-Source: AGHT+IFWxCdtQjg8rgmCsHjBzQbH7FXpOqcmxWb+qrwYJsBbZ1/KLDpnvQFLZBFfFo4AEIEP+41QoA==
X-Received: by 2002:a17:90b:5825:b0:311:a5ab:3d47 with SMTP id 98e67ed59e1d1-3157c6ef628mr1088722a91.1.1750212015879;
        Tue, 17 Jun 2025 19:00:15 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-313c1bcbb57sm11479969a91.7.2025.06.17.19.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 19:00:15 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 2/2] riscv: dts: sophgo: sg2044: add PCIe device support for SG2044
Date: Wed, 18 Jun 2025 09:58:49 +0800
Message-ID: <20250618015851.272188-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618015851.272188-1-inochiama@gmail.com>
References: <20250618015851.272188-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PCIe device node for SG2044 and configuration for Sophgo SRD3-10.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  30 +++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        | 175 ++++++++++++++++++
 2 files changed, 205 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index c97bd62e5f06..1ca5fb707061 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -67,6 +67,36 @@ &msi {
 	status = "okay";
 };
 
+&pcie0 {
+	bus-range = <0x00 0xff>;
+	linux,pci-domain = <1>;
+	status = "okay";
+};
+
+&pcie1 {
+	bus-range = <0x00 0xff>;
+	linux,pci-domain = <0>;
+	status = "okay";
+};
+
+&pcie2 {
+	bus-range = <0x00 0xff>;
+	linux,pci-domain = <3>;
+	status = "okay";
+};
+
+&pcie3 {
+	bus-range = <0x00 0xff>;
+	linux,pci-domain = <2>;
+	status = "okay";
+};
+
+&pcie4 {
+	bus-range = <0x00 0xff>;
+	linux,pci-domain = <4>;
+	status = "okay";
+};
+
 &pwm {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index aae4539dea98..6ec955744b0c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -32,6 +32,181 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		pcie0: pcie@6c00000000 {
+			compatible = "sophgo,sg2044-pcie";
+			reg = <0x6c 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x00300000 0x0 0x00004000>,
+			      <0x48 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x000c0000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			clocks = <&clk CLK_GATE_PCIE_1G>;
+			clock-names = "core";
+			device_type = "pci";
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+					<0 0 0 2 &pcie_intc0 1>,
+					<0 0 0 3 &pcie_intc0 2>,
+					<0 0 0 4 &pcie_intc0 3>;
+			msi-parent = <&msi>;
+			ranges = <0x01000000 0x0  0x00000000  0x48 0x10000000  0x0 0x00200000>,
+				 <0x42000000 0x0  0x10000000  0x0  0x10000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0x14000000  0x0  0x14000000  0x0 0x04000000>,
+				 <0x43000000 0x4a 0x00000000  0x4a 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x49 0x00000000  0x49 0x00000000  0x1 0x00000000>;
+			status = "disabled";
+
+			pcie_intc0: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&intc>;
+				interrupts = <65 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+			};
+		};
+
+		pcie1: pcie@6c00400000 {
+			compatible = "sophgo,sg2044-pcie";
+			reg = <0x6c 0x00400000 0x0 0x00001000>,
+			      <0x6c 0x00700000 0x0 0x00004000>,
+			      <0x40 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x00780000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			clocks = <&clk CLK_GATE_PCIE_1G>;
+			clock-names = "core";
+			device_type = "pci";
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+					<0 0 0 2 &pcie_intc1 1>,
+					<0 0 0 3 &pcie_intc1 2>,
+					<0 0 0 4 &pcie_intc1 3>;
+			msi-parent = <&msi>;
+			ranges = <0x01000000 0x0  0x00000000  0x40 0x10000000  0x0 0x00200000>,
+				 <0x42000000 0x0  0x00000000  0x0  0x00000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0x04000000  0x0  0x04000000  0x0 0x04000000>,
+				 <0x43000000 0x42 0x00000000  0x42 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x41 0x00000000  0x41 0x00000000  0x1 0x00000000>;
+			status = "disabled";
+
+			pcie_intc1: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&intc>;
+				interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+			};
+		};
+
+		pcie2: pcie@6c04000000 {
+			compatible = "sophgo,sg2044-pcie";
+			reg = <0x6c 0x04000000 0x0 0x00001000>,
+			      <0x6c 0x04300000 0x0 0x00004000>,
+			      <0x58 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x040c0000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			clocks = <&clk CLK_GATE_PCIE_1G>;
+			clock-names = "core";
+			device_type = "pci";
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc2 0>,
+					<0 0 0 2 &pcie_intc2 1>,
+					<0 0 0 3 &pcie_intc2 2>,
+					<0 0 0 4 &pcie_intc2 3>;
+			msi-parent = <&msi>;
+			ranges = <0x01000000 0x0  0x00000000  0x58 0x10000000  0x0 0x00200000>,
+				 <0x42000000 0x0  0x30000000  0x0  0x30000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0x34000000  0x0  0x34000000  0x0 0x04000000>,
+				 <0x43000000 0x5a 0x00000000  0x5a 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x59 0x00000000  0x59 0x00000000  0x1 0x00000000>;
+			status = "disabled";
+
+			pcie_intc2: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&intc>;
+				interrupts = <74 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+			};
+		};
+
+		pcie3: pcie@6c04400000 {
+			compatible = "sophgo,sg2044-pcie";
+			reg = <0x6c 0x04400000 0x0 0x00001000>,
+			      <0x6c 0x04700000 0x0 0x00004000>,
+			      <0x50 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x04780000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			clocks = <&clk CLK_GATE_PCIE_1G>;
+			clock-names = "core";
+			device_type = "pci";
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc3 0>,
+					<0 0 0 2 &pcie_intc3 1>,
+					<0 0 0 3 &pcie_intc3 2>,
+					<0 0 0 4 &pcie_intc3 3>;
+			msi-parent = <&msi>;
+			ranges = <0x01000000 0x0  0x00000000  0x50 0x10000000  0x0 0x00200000>,
+				 <0x42000000 0x0  0x20000000  0x0  0x20000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0x24000000  0x0  0x24000000  0x0 0x04000000>,
+				 <0x43000000 0x52 0x00000000  0x52 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x51 0x00000000  0x51 0x00000000  0x1 0x00000000>;
+			status = "disabled";
+
+			pcie_intc3: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&intc>;
+				interrupts = <73 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+			};
+		};
+
+		pcie4: pcie@6c08400000 {
+			compatible = "sophgo,sg2044-pcie";
+			reg = <0x6c 0x08400000 0x0 0x00001000>,
+			      <0x6c 0x08700000 0x0 0x00004000>,
+			      <0x60 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x08780000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			clocks = <&clk CLK_GATE_PCIE_1G>;
+			clock-names = "core";
+			device_type = "pci";
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc4 0>,
+					<0 0 0 2 &pcie_intc4 1>,
+					<0 0 0 3 &pcie_intc4 2>,
+					<0 0 0 4 &pcie_intc4 3>;
+			msi-parent = <&msi>;
+			ranges = <0x01000000 0x0  0x00000000  0x60 0x10000000  0x0 0x00200000>,
+				 <0x42000000 0x0  0x40000000  0x0  0x40000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0x44000000  0x0  0x44000000  0x0 0x04000000>,
+				 <0x43000000 0x62 0x00000000  0x62 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x61 0x00000000  0x61 0x00000000  0x1 0x00000000>;
+			status = "disabled";
+
+			pcie_intc4: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&intc>;
+				interrupts = <125 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+			};
+		};
+
 		msi: msi-controller@6d50000000 {
 			compatible = "sophgo,sg2044-msi";
 			reg = <0x6d 0x50000000 0x0 0x800>,
-- 
2.49.0

