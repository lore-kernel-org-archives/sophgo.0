Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929051E1A05
	for <sophgo@lists.linux.dev>; Sun, 20 Jul 2025 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753000406; cv=none; b=exXkkdEIjXYZtPB7wXPxTPfw1F/biC49tclPz/qnBB5WdscUM7i5hg6jMmhRo0vXpx9QieKHOjf3owH4/D2gxj8su0uzRT8WMrrnYsIfh2vKGDQU+w50Rc/hAI63tSl/+dO1dGiQK7+yS66UFd8bg5eooRjwPiYtH1uotO0XxIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753000406; c=relaxed/simple;
	bh=TvdO4gaLKUzOJEi1aNELCkM4P/gdBzPDf2IOJYLCNW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8NBIC0n2vlQiZAEZ/zjZGHwzDqRzAQu9lhM55mX2tV1kZ2KOkxSORTy0VA/Fb5UovQ1xUdDLPnasviA/J6dQB0NAiWqNCN/powtYKPWfKewfdkkzsC1IsxgWb95hm/VNWibA721JP3eP+62+9i4cRhttfw/HryAR5H/exx5LLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLrW6wpa; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLrW6wpa"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso2508323a91.1
        for <sophgo@lists.linux.dev>; Sun, 20 Jul 2025 01:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753000404; x=1753605204; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vk2QbpeYdfxireOkVMTO8TaReVM+NxnLECNCVQYv1vc=;
        b=lLrW6wpa3bjmx1ljLmG5J+xqiNrLLD0hZLrxWIcjDD1jRAdcHr8GqYcW95odQGCbjP
         9UB4proRChg4ueO19UtVmTf0Cf25R4+XtnUACDL5yHDvhaUOSQYtwa7AbcKdP+92PU+z
         7cdDL+H+t+wbA+fr6u3QrTiCLtkSb1JW/75l1Wp/c7Xc/zXnzwjrtPK9AvlzK9r3Y7Mh
         EEdaHOsioQ7ux/FNkhCwJpRw5i9R4U+kTEMvbRvvDAa5XtAV/gN9Qj5glPGGUmqs1HXq
         fzH9P6QaVAlQ2mO/Pki5e/ucRlStlCHrPAlJTxjwcsPqUwjHVgmm9n+NIUsZUHsUePXt
         EvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753000404; x=1753605204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vk2QbpeYdfxireOkVMTO8TaReVM+NxnLECNCVQYv1vc=;
        b=jYqth5FH7hkHjPJZiQpw9EV9ulQ3pXbDaHfdVq6ZdJnLIo1LJza0lvDrQBfP3q0SuZ
         J7zYUSoRjvFNHCBXZ0RdjhtsIk+KygFN+UrEMlPQFqWqoLiYhL638NtIcUdTmwx1itIZ
         43DKndE3hJx7YXVLLXPllqcWZzZJFlqb0Zt72KJrICiZZBXHjeUnIU5vd0E/MWmmPW2D
         SIP3Hr9KU4mZyM/xJiz1XTu/k/aVisthO8FfTjVc21ND7NuSJoDvHVaq07h4PcCUi38Y
         73RHAAjMN6SutXy2eZXu/Bx6fbxk1bRvVXRxdEaRZjRN/dRRi61o72bAFpLJdd0CJ4NL
         WbnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGllqV1TxWoSAqeqhJ/W2ZVByVsjkrKYSSmzcrHdK7pevXKkfmxKr8iOD5W7Lhkxl7YCnoZlo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnJbMwp1eVZ9CWK7vj/gnzd3TZLt09fPzZzYXgysAIEAIE392m
	e5qwCUu3yuvja5JyUlNLJ++//iS2Rprmd5ZIsCQFuZzk94deIg9f5cvW
X-Gm-Gg: ASbGncufAqha7Dd2m1afM1fwJ0825IV6FkVm43zIrPomYqJhN4vzrUYEtt3s8A2fMUh
	h56msK/3dXWdmg5zxWll662ks4adJ4hFKf8+gdPraT1q6JOlOzkb7oD83Duq3xGlYP612NU4+HY
	45aCeFULqCtRJLkKdqrOdARuIqhj95y29Q8SnLdDc9JksxCSxqRXGlG6EumOa4MdOCcE4FLJA+M
	syMIMImsIW9yk+WJ8QhBq4h8cZ1HNl9sIhoht6ZH/qVUvJMziuHRI8mm1JegkPbwzwjTc0TOTlc
	ccFL2DxK729e7AlimV3w/9/o/V5/xjSDma+tVTyYKyE4oV1IT3wdTlHzVXgR9KGN31+jDGjpcvY
	3idhVIftFcJkP2h9UZyX+sz3n
X-Google-Smtp-Source: AGHT+IHQ6aqsMzWnYc8OhtpmX48954oW5ZQ+i2KvLoOdJi5CschQ3b7WowKF1it0RnWS+9kS3TgT1Q==
X-Received: by 2002:a17:90b:4a8d:b0:311:eb85:96f0 with SMTP id 98e67ed59e1d1-31cc25e80b9mr13870327a91.29.1753000403406;
        Sun, 20 Jul 2025 01:33:23 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1002::1d55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3f46b97sm4079721a91.41.2025.07.20.01.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 01:33:23 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 20 Jul 2025 16:31:46 +0800
Subject: [PATCH v4 4/4] riscv: dts: sophgo: Add SPI NOR node for SG2042
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-sfg-spifmc-v4-4-033188ad801e@gmail.com>
References: <20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com>
In-Reply-To: <20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753000358; l=2404;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=TvdO4gaLKUzOJEi1aNELCkM4P/gdBzPDf2IOJYLCNW8=;
 b=lksiYwk8mrj89e55V3la17CqB//aoirRCF4dGn/kRQVvc4FfgGgqWzJjjN7U9PCxlzb/HE4sL
 Ep2vwiJTSS8CDJasYtL7IvN2wVCJy850Qx3X+F2AUBsS4K41YfhCVqW
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add SPI-NOR controller and flash nodes to device tree for SG2042.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 24 ++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index ef3a602172b1e5bf3dcf54a8cacdad5172b7f50e..554ec14d58453a44a02a82da40a7aedb80d61dc9 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -138,6 +138,30 @@ &sd {
 	status = "okay";
 };
 
+&spifmc0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_cfg>;
 	pinctrl-names = "default";
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index b3e4d3c18fdcf94c2294a56ed6ad866fc59a6adb..0f7d8a3743c35046ceec902902af2b8d3ec8e6bd 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -48,6 +48,30 @@ soc: soc {
 		interrupt-parent = <&intc>;
 		ranges;
 
+		spifmc0: spi@7000180000 {
+			compatible = "sophgo,sg2042-spifmc-nor";
+			reg = <0x70 0x00180000 0x0 0x1000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_AHB_SF>;
+			interrupt-parent = <&intc>;
+			interrupts = <108 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_SF0>;
+			status = "disabled";
+		};
+
+		spifmc1: spi@7002180000 {
+			compatible = "sophgo,sg2042-spifmc-nor";
+			reg = <0x70 0x02180000 0x0 0x1000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_AHB_SF>;
+			interrupt-parent = <&intc>;
+			interrupts = <109 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_SF1>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@7030005000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x70 0x30005000 0x0 0x1000>;

-- 
2.49.0

