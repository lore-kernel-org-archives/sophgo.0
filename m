Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527331E51E0
	for <sophgo@lists.linux.dev>; Sun, 29 Jun 2025 08:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751185443; cv=none; b=prZAR3/L6XM1NC08/sI767LVMERvblMcxZbU6TWK/yWDHGxu+AO3h/0L3L2E64ABDap5Q8DHjTteuotmAMdaC/u7jxNvnapVEkuk9e56AKDper+x/v2TAMLt90Ili7mprYUadd2OzpZuuj1zOrQjCQvXvJ/lq6qu4NSfqzRRvMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751185443; c=relaxed/simple;
	bh=b+ls9Cn6mM3MfOnV5MwzeFfnl2Z8gVpyt1s6gAiujiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bNFRAEZn6YHfQd7ipDFRqQfdLeVgU9l+SCP9Ng5/DKj6aJWU5HgUbembAfO1U63Ucu3iaCRfwgdysxwpUVLy8l/IF1gyN3ODIXc/VebRHTxFPJXROmUYeOsPBStod8zU+UWGJ0N3MAEjdo7tT0G8ZiGkeGE6hKtEzsbCAej+w8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsfAvZXj; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsfAvZXj"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3134c67a173so823815a91.1
        for <sophgo@lists.linux.dev>; Sun, 29 Jun 2025 01:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751185442; x=1751790242; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97fxYmkEtlOpyahoQx4M5It56A2ScDgvjgQGcXq1u+M=;
        b=CsfAvZXjkLAp+AYYnO22f4B+ABTa0lduB5aX/FnmNjUH6YpCfvgOBr3ZEdD+YxBqvO
         dlyJf8l4d40nsVkkXLWsyYWk5mcQvG/PQjn3rDi2i+y61OtGfIO8Up7cdm+ICyqDiwAt
         AF6haeisduDlXLmf5YCYJUv5H0I/d6NNhv8sWnmyfu0qiRc9KK3ZHoSENj6aDY2CmP+a
         fodbcXNMNVbuz++IGfcR68i+cWz2NF7fsiom+FRGA5V4PPm1VPh4RJ6WATuej+LGGRHU
         KPBdpr71YDDIVu0ARVbwfYcmbxIFx5Lo/a55jnsAl2jTVcyU+t/a9CmVpBXJrSaFZh09
         +4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751185442; x=1751790242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97fxYmkEtlOpyahoQx4M5It56A2ScDgvjgQGcXq1u+M=;
        b=aVpsvOV5UigFhjnyT/0LKQ8kpu/AdWTSBHOvEBtQO46EKI8F+ZhQwqDla1w2zGBkpK
         sPVt6KhijixFlyVjG57KbXvV0kRZi6Y1cT3xjCXjjY+Y5vZG45n6OWsKyX3zMhZl754L
         M2pWKIb0OW2D4g5eizWLioxNyaoZnDOFQWwPef74j1/QuWSMCQIvloM6e1NalMkAwauk
         mudgQyJ9GwncG1oPMusizGPtwqTtEW+eexzj6PWYiXAqubM1tXIh4u1BAMrd45j59YlS
         fPkqNxHiYozJD0MYNfwMwcVjgt3X3A3BpsZ1dZ+AxGE1TSHCOLGYGVOsnPii737q+pPA
         q3xw==
X-Forwarded-Encrypted: i=1; AJvYcCUHuqBvhxhh2EUW+01NJK2/jy7NUrdSAgZkDz83SuJlu6fkXou1iR61RBwXChQlRN7TqM1cGcA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7ANIOwrjRPjYe/8I8NckI8yHSrr07O5MzgOhh270EqPnfLauY
	ks/GfHBIyaL6Jz34aNiTsslpBrInJ4l368RLEWOfBwiUaNi8oZRFMMAl
X-Gm-Gg: ASbGnct9Z+ES+PK4ped7A4u4Hif1D5aHaJHoP7kKblSDSUoaixPWCb/mnpDZNfwoc+d
	L3ZOZquQde/YATM+DRM15boMKd4pvEeQVeSrQGlbeJcrJUYvSKRAK1kBVIRKsomXu7f0Y8PqQXa
	Y1Tfof0DCWuGZz98ND1sRAYM5vwAus5jSKRm5SDgR7CEQKbFBnLNzcdpf2FX/IpAxYSdjDkJwIG
	eaPGQ+tIzaoij6UroCTXUg0HTKwQ15ndb/eE4nXtYZGB3zMzFujH2QrUWZzULq3R+yZ481upd8F
	Lxzj9cjsoNguBCdp9DBHPo3nb1tyMl86v6J2GIo++22jHKZOlRyQMQ==
X-Google-Smtp-Source: AGHT+IHAI6D2+4NaOQwnBVFRV6TfBFP4M7lyDzfYRNJ5iP2pargoe20VvUzU6g8JZlrc4J5MmumIGA==
X-Received: by 2002:a17:90b:554f:b0:311:fde5:c4b6 with SMTP id 98e67ed59e1d1-318c8ecda6fmr14121094a91.6.1751185441085;
        Sun, 29 Jun 2025 01:24:01 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::168a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f542661asm10495839a91.26.2025.06.29.01.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 01:24:00 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 29 Jun 2025 16:23:13 +0800
Subject: [PATCH v3 4/4] riscv: dts: sophgo: Add SPI NOR node for SG2042
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250629-sfg-spifmc-v3-4-28db1f27e999@gmail.com>
References: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
In-Reply-To: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
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
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751185413; l=2460;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=b+ls9Cn6mM3MfOnV5MwzeFfnl2Z8gVpyt1s6gAiujiE=;
 b=qcKJ8A9MKl1P77tnPMI3NfkU32uwTXkSDZJvQfYIjdv1Qyo0isAzCFstxLD0cUiPLM5fWPmEW
 4K+vp3bYOuCC+x8B5wTmbP07YTNgDyop6esoGUoR3UyZXUwmcVKdIjv
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
index 85636d1798f11804546ed8606595ace1b4cb2a2f..0e1fcb54480af71147d0e71178a8eb08a31b75c3 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -48,6 +48,30 @@ soc: soc {
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

