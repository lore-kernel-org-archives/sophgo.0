Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5691E5B85
	for <sophgo@lists.linux.dev>; Tue, 22 Apr 2025 02:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745288859; cv=none; b=cedpXCr7tw9zK+Yx7JeZtEFi+gGhSabcaP7otnXiqc2Mz7BPLBA3WKT8WthdssymeQAhwFf4sbrQ9q+J2mktPLgXxzuLcKuZOe5CC4GNVDN1XHiyo5Rnz61enlWvYWG92jgdMYzWXGuVqyBYbV0N0BOmBAy6DZZyMSAMylwNJQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745288859; c=relaxed/simple;
	bh=bsOb61YGYomuONd3drp4jb88EZWek6I8D8vdw/YFqjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oClz6vEIpsyn+D+sGFghKF9E7veudAVrCVtD+TRCSwBLhoRvaq3rHS9lvByp80gfFPRyvdzoB2O/c2R0Gqti5i87CKzbI9u0t3kYyjgAxwkL42UjDHe5LOSNkQLZvMKi4SkKT/doWPMkRmQSajmBV0CJ2VAaP3hQQWpifTeqxKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRKGuWow; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRKGuWow"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224191d92e4so44991365ad.3
        for <sophgo@lists.linux.dev>; Mon, 21 Apr 2025 19:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745288857; x=1745893657; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYhIc8nI7TQrbMQ5ehdUi9XRR8BUa9kFTApEz1i6px8=;
        b=HRKGuWowePlO7AMiQLZGUqLmjAHbizBXw5vVlx1UOl5/FJPToQP9AbA7oPBcgtsHpB
         pfA6FULZxTIRmShlfdioQwRu6wLzkP0d7fqg6DMSSY0/d5i2gn2zVxYutaZyokKceCxR
         VQgJ+3pDz3bqthsDLESpmJjwaNM56zsXzKmm1FMyFSslIQN7gs6zAB5P9zZ5aL/OXYs6
         fYK9jS2bom36k6Di6O3FE9ePVFjajMfsaRA0ot6Rn2k2wXu7Qp3tcLwhU5eVOUbjMauQ
         f8/73vhbhj9GxYnv8ruNEyEi3QPj3Lg+IsoCtljbiWJNQ2pDaZIEagmCL+QvNg++4jNe
         Xr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745288857; x=1745893657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYhIc8nI7TQrbMQ5ehdUi9XRR8BUa9kFTApEz1i6px8=;
        b=Jc6/hjBEvdGKT0ajgMWgS+7R+ol00qSMBa6LawvBemWk5nMkQfIK9VRqkam7LYjnwV
         jSFUzfYdxiOVAbe7kjapzfNkOBoD9jlJNCPlL1qAsFkhqe/vaG/SNiwWU3Eu1sRUHgby
         iKjHAVcky4LxTjnNB2bVKGfsmjIDIobs7Sy9ewVnVYXnGjo7FengqVqKEqY9T3EAKgx+
         sZ6gyipdDB+2Eg8qyHTBWiZ8k96k8DSLzV4eMBf/LvtmjCX/2wqjl6t9aRXu5aSjIN6p
         KaAddNvdob3/jzN2HTqt639E7RXHh12Bw0PRlaqCo3ApxztOEemhLhy4w/SqjcYAqzPk
         dQZw==
X-Forwarded-Encrypted: i=1; AJvYcCU7gKTigc7aIh3sz824Av7kKwU5hViHO4jdTvUGomMeIkOttqbgPBhjbosPzTuGfByQgHez6oM=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh6XHcdyzB+3CnxOOYNZ1JOOzhWN04b1cd3xSA9qwKdgg9g9gS
	I2yfEG2t36LDaELTb/mcXDNEHE95P0xtn2+cv4/BCEBii9/JAzPC
X-Gm-Gg: ASbGncuU771/7WPd9hOd1pC2W6UcqRDePy3S4ZQgMwYzk9KLjtGb1hYMRCrdPTIFISG
	rwMZu6UwTk+fOYPVi9TIUuULEC9qheQxUr6ZZV7LZre0O13L6M9pSkyxVJxKQbCmvXmfQP6a38B
	mbnrGhDBEXZ4GmWGtgd/4lYl2QyV1dSa5uAaqpa2hKwVoYpsTYbIN1Jxa8HViFrVUIBwmW23qpl
	3XLLyb2QvbXwrJFbDiXSpzizu7o1Flz9ZYUZ49GOSNyuDCYOaDWRaAulhmKtnOUFiRtHjep07rI
	LyT9RkrhodXuFzEF1+sl0I9sFQ+rfDM5FU8zO1uupmBBvBv7
X-Google-Smtp-Source: AGHT+IExQ+ztUjssrgQSM1us5/55FyqKMbgSSaCY7W9HzLRHDBJHaDVv7TjABQFxbCdhKT4/A3fWOA==
X-Received: by 2002:a17:902:cecc:b0:223:4b8d:32f1 with SMTP id d9443c01a7336-22c53285bb0mr208982725ad.1.1745288856770;
        Mon, 21 Apr 2025 19:27:36 -0700 (PDT)
Received: from [127.0.0.1] ([101.76.241.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4ae9sm72962905ad.110.2025.04.21.19.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 19:27:36 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Tue, 22 Apr 2025 10:27:10 +0800
Subject: [PATCH v5 3/3] riscv: sophgo: dts: Add spi controller for SG2042
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-sfg-spi-v5-3-c7f6554a94a0@gmail.com>
References: <20250422-sfg-spi-v5-0-c7f6554a94a0@gmail.com>
In-Reply-To: <20250422-sfg-spi-v5-0-c7f6554a94a0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
 dlan@gentoo.org, linux-renesas-soc@vger.kernel.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745288836; l=1524;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=bsOb61YGYomuONd3drp4jb88EZWek6I8D8vdw/YFqjA=;
 b=3nFg+D2YxLVxcX9tiCAuyqRm8Zv2W7XtJoeJ8rKEUvkzPCQBp52ycjtBSOgMztlNMYeeHMmsX
 cQ7rG2Mn4jBD1jpXGmi2Kk12Xwa/vhSD3KiPhLi8rrykE6nn/wTVzcW
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add spi controllers for SG2042.

SG2042 uses the upstreamed Synopsys DW SPI IP.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index aa8b7fcc125d71eec12b09493964d90f5dfed27c..ddde4c613c4734db191de500b016b322a9602efc 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -537,6 +537,32 @@ uart0: serial@7040000000 {
 			status = "disabled";
 		};
 
+		spi0: spi@7040004000 {
+			compatible = "sophgo,sg2042-spi", "snps,dw-apb-ssi";
+			reg = <0x70 0x40004000 0x00 0x1000>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>;
+			interrupt-parent = <&intc>;
+			interrupts = <110 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <2>;
+			resets = <&rstgen RST_SPI0>;
+			status = "disabled";
+		};
+
+		spi1: spi@7040005000 {
+			compatible = "sophgo,sg2042-spi", "snps,dw-apb-ssi";
+			reg = <0x70 0x40005000 0x00 0x1000>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>;
+			interrupt-parent = <&intc>;
+			interrupts = <111 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <2>;
+			resets = <&rstgen RST_SPI1>;
+			status = "disabled";
+		};
+
 		emmc: mmc@704002a000 {
 			compatible = "sophgo,sg2042-dwcmshc";
 			reg = <0x70 0x4002a000 0x0 0x1000>;

-- 
2.49.0

