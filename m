Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AA022A7F9
	for <sophgo@lists.linux.dev>; Fri, 23 May 2025 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997719; cv=none; b=HP0Sox27Sc8apqhple6gYj58+JwWgL5I/jiN/tBWg75zQM/4aRA6rwKb90hOB6e85MbHs/2Zv01tN8yg7/iW7uUz4QYIfOhmh7/LNS2vnyghtqHOQ+IQNXcza7vdjiM4wiTUDsjvgNVwDXIbhLa8fMQqu2uTbS/IK1J9Q4TC96U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997719; c=relaxed/simple;
	bh=1GDh0zAEry6mVGUqkPUqxMLAqpRze3QvTZVNyNvZNiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p0HzuVBEdsLqFZVmz+69xkHQiukQaDaBcchfh5qh1ma76j8OGAKNkoR2TVrkH69B6hy0c9vHQ7yEue5qYOPNm7wQjWtS1ZcKGN75HzG2dX3Xg7khz4XjjgqMx8LO008JYuq/hk4ZnWW/k/QTKXbMRFyXXHFDn+9zYlVyh4bThqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ttn0OlJY; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ttn0OlJY"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-742c035f2afso4170439b3a.2
        for <sophgo@lists.linux.dev>; Fri, 23 May 2025 03:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747997716; x=1748602516; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxmiZPl5Ck8pukdGXQ0/lqOM6oa5lUIp5yTgqKF3faw=;
        b=Ttn0OlJYNmWAddiDFqUsV0zIyziUhSf2LGYe+wlr4tjWE0/LASwuF7v8qjQU8reRuI
         H4xPupMXi1CK3GU308qEO09KpUejgha1s35Go3SLJKtb0XKeRVFFmfnzfybX9jrniU7Y
         YaGBKLdt+IaRHq5MBNIrNJCicXu22Lz8GtW1BJe5D5IxS2DoISw3zwVt6UMwtdomRzq4
         nbDTkbBBOysGJOFqxrAMrR/N8BogdCjLLufdW9OymfCyFqwegTCKkXTq/Z7XN/BmJx2/
         KDKQgVe77M+ABbEHM/sPhO9wEseQM4wmB/tVy8AxIn/POJ/DX0n7mZnf+qLiiQHPqVjs
         UF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997716; x=1748602516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxmiZPl5Ck8pukdGXQ0/lqOM6oa5lUIp5yTgqKF3faw=;
        b=S/J76qJZiouuJRePhIWodHtecLrrvaY+VJA6ZFo0TjoQXRrsacvQ3zDA07AtGFmrcM
         A2Y7W6RDHCvZ9y/9vydeo8qEC6ENvP5swcFJ6MUBLHJaos7gtAilR0un6MQw84IVp4ml
         hGutOqsyyfWB1I7OOf1aWHVAQ16wQwincOv+vcd8IlSufyTa/S8MdRJPVFlzAoNgN6Dq
         VLyGiWw1+eU7TjkYHelo0K2hksUWl21mPrfQqdafjq1noKTaCK47YI0zKcFbMztTQlZ9
         vmtyocRdTKhIscbemen7DiUAvJSCm9MW0LoTBiS173T7yLyriI+kNDFDqcUURU3L5u9V
         fk3A==
X-Forwarded-Encrypted: i=1; AJvYcCV/HfHKH3RrFuI++UXXnF71IVfrBXPNwrnoKh3Pzl7frKLXlqc6eyDlYYh5cFq+rEL9j1o7tyE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzfMzEh008n7YKMlLhFIy89VDGvMBsJ7Y9lv69pcVxutfk+C4k
	TbpvvN0Rg1TQmR/f2BvOXjmi2kWFGCo0Jgp+HZ80r/wA4INJO0vcmQsh
X-Gm-Gg: ASbGncveJWG8KJMSWOX7BYDTcOw2rzmN++RaWZGEmjEhw5iacZCcYii2pgDC2XSRVQn
	yK3PyNdZ9JNPQ9kFdblsdps0pLjcyN5kmmdaRynqVK+dHHOAxGG0/3sI4HfY+Z3iZ58Wzu0u1Ph
	wxjsqBgr5ak/3le6UCFsjQgXOmiEZU4nCGR/GESPHGFT8LgB0Bi4iFNv/euKxbGa8tjtlVWKowJ
	dP4K94O0RVpitmHT8iuaYnM3nW4/MKDu8zmnfdpwXyGj6J8uCPn9S+h5vuBdZin9nnEw8viDWrz
	JDioETxXGEOLLQiJZFWSY8zvvbxLFUI8k1oTjPSEuoDOZqm+Ci/mpw==
X-Google-Smtp-Source: AGHT+IH4Nepegl0mcTej89S8M81vz2ympEfH22RcRGrsFdndLJpdaWHD3e9xghthl+2Ys9cAmW6dww==
X-Received: by 2002:a05:6a00:198e:b0:740:91e4:8107 with SMTP id d2e1a72fcca58-742a963242bmr40755354b3a.0.1747997715930;
        Fri, 23 May 2025 03:55:15 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9739cdesm12623687b3a.82.2025.05.23.03.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:55:15 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Fri, 23 May 2025 18:54:51 +0800
Subject: [PATCH 3/3] riscv: dts: sophgo: Add SPI NOR node for SG2042
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-sfg-spifmc-v1-3-4cf16cf3fd2a@gmail.com>
References: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
In-Reply-To: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
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
 dlan@gentoo.org, ziyao@disroot.org, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747997691; l=2232;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=1GDh0zAEry6mVGUqkPUqxMLAqpRze3QvTZVNyNvZNiQ=;
 b=ggUaIaLAnq0XDvfVdPu0NfePlrDLY2dn8MKJT0iKXUMiF1MEHy/syRdJlgoTBOGeUSfm4YIlT
 KSDFwsD6mtwDCqBFTgLW6Ay7wnXJkzFi/5pSIsZelDxnHN+TG3McRkL
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add SPI-NOR controller and flash nodes to device tree for SG2042.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 18 ++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index 34645a5f6038389cd00d4940947c6bb71d39ec6f..c59a819e35d3201c484bf98392aec14392a7eb04 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -68,6 +68,24 @@ &sd {
 	status = "okay";
 };
 
+&spifmc0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+	};
+};
+
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 212a3edc73fd654de59e10fab2094af2fec7f88f..06b433d5949bcc2374ea90223ff2d81434fad2b5 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -83,6 +83,30 @@ soc: soc {
 		interrupt-parent = <&intc>;
 		ranges;
 
+		spifmc0: spi@7000180000 {
+			compatible = "sophgo,sg2042-spifmc-nor", "sophgo,sg2044-spifmc-nor";
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
+			compatible = "sophgo,sg2042-spifmc-nor", "sophgo,sg2044-spifmc-nor";
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

