Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474E82D1F4A
	for <sophgo@lists.linux.dev>; Wed, 13 Aug 2025 08:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755074024; cv=none; b=X/6lLMB+UPBZrAFBqvFaPetQzdRaW4pJzWW9MvfiX0TF5uwYJuB6vvBhD/sjm2BV7zBdryeig/FI6/eFxH+XGIsvffPuBJc2Sho9PHc+/53BftQZ6kZV1HxSm7bJ1wkqBNj2wLQtBvMKdXEoD0om2+i/eXE7Ja/KMm65GTEd/OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755074024; c=relaxed/simple;
	bh=3Lv5bTYlKhpC0eWwB0IvqfV0hV7JqAASipFjDdwVTeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZHQ6UGEXfQLFJJ1l7m2Lr0PtHoN68IoQ9t3zygObv/xUbNzltFuUL3oUbEcrAUAz8Lnbd2zbvgGRii1nrR4LCsy1Tnnl5qGeCwK5m04kO2CXMRd2MpLyYWB81ifGoS2aYrdnDWaVC+81dV9RvKfyZOSKRVPmDoB90/Omfpg0NBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZL/9+Wan; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZL/9+Wan"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76bfabdbef5so5294039b3a.1
        for <sophgo@lists.linux.dev>; Wed, 13 Aug 2025 01:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755074022; x=1755678822; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FrVKbMMxUgucaMuE8fujtQNji+Pr9aFYe0T4La7C6k=;
        b=ZL/9+Wandlk9UygvUFt/QwPH6KQOXOo/Lp9g3pJvDavJ7TrligR91EKCUUNoYZooHS
         TxAuL+Zo1Lse20oLc9STp+GVGM2ikTpQomu8DofbC1DHG8nbHZ5DeSzHfp8JuWROLSJa
         2w/7XYerST1KiJx0lcL3hyp6GYCw57/RWWO1RXIAjGWPtswx4pp/vE12BSNMPSzulJ1w
         NxX3iRblbESA6sAaH+Un11ah5BHlETxpqLgXQ2iC9oBMk3gbgJkRzTPqltpMt4UH6LtP
         nXLBv9SW9gBdQwOHCyWMwTEJMsyzzPsTNwv6IpixL5Bts99YNJc+zwYfA86vvk7bxir9
         b+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755074022; x=1755678822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FrVKbMMxUgucaMuE8fujtQNji+Pr9aFYe0T4La7C6k=;
        b=wv9mPogMWKXuhI0QM3tSouy03CJq3XHHdpHYQ+uNCaxrhJ3BB5l21DhvVjWrxiDPiA
         a5I/JzEPUJJzhZOL+/54K5BkgMFN6sRm+UdfFQdqNkgKCVt+31T8dm6tu9RrTNMB4qYd
         NY0HOAXhDkkosSeO9+KuAqJDKOEhobAXqllzpaq+YbxCuuIr+wS14CYbC06mVq8GciEe
         iEwH9sUdMiLUzfzQNF8GCd0tVZDdRPmmoBUo12dO9V3cWRnxr+yoAI7KyXESQsti/5Vu
         hOGZ+tgjH0CbPgfxA4AH/G2uhDZtp3xUk4aJGrtdNu5nZLNE049yC4Jmevxr5hg8D4bm
         UZyg==
X-Forwarded-Encrypted: i=1; AJvYcCUT55ZAZ4nlSL86FQdsUZLfEXASUSfedC9qlbFigS8ZCs2IUdWx6Aw5tkkKyTPaOqWeZZ5r8N4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaCBp6I8MbabYukBFK8QFiU7zOJNu0aHVjjJn8cgly0otMo5to
	xaRCp9vcuXCsKczJKHzj7qK0KUXDul8NJVcagvZwwAN1msz7mdzJQXQQaJ+hOaDDyHk=
X-Gm-Gg: ASbGnctq44UPx1T1EFLjJIKq8te1bNbxz2nKZtZsLM+im5QXt+b5ST8JV1WJyngnsLT
	FUQEknDeiy0nQcCjNN0Vm2P1lztvJu0WT7yJB/qPEGo2sNpcAKtTmPYnm/4urbU+kstunjuDpDk
	L1qr28iQ8iUE+h96axldZfob83gr3vZLUX75b/cYZmgYlBl/krjfoq4KU7P41M1dVEivLF3nJEg
	Fse7Zd8zRB6JNVYlP19IWVrUBBsbo/+X+oJULIRykEiF0mixt60mxCIPOpJnpSTGrYNjU1jSDLY
	QxMc32QmIsCqMQyYxJ2Rcduq2AKfzSuB2cEglqr20As3iAPZ7jZYM2E3Zn/9UprB/AZhSkFCMV/
	drVgxnbLWPhg+shByLzLRZA==
X-Google-Smtp-Source: AGHT+IF+s8cQXKEirEmIJJ5qRb8UyALTc33892JJyQWbd8Eu8uoFYzitLuwaOSKfnI5pphmxlLCAGw==
X-Received: by 2002:a05:6a00:3e2a:b0:742:3fb4:f992 with SMTP id d2e1a72fcca58-76e20d09aa0mr2982062b3a.10.1755074022038;
        Wed, 13 Aug 2025 01:33:42 -0700 (PDT)
Received: from [127.0.0.1] ([36.255.193.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe50c8sm31307814b3a.120.2025.08.13.01.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 01:33:41 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Wed, 13 Aug 2025 16:33:17 +0800
Subject: [PATCH 1/4] riscv: dts: sophgo: Add SPI NOR node for SG2042
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-sfg-spidts-v1-1-99b7e2be89d9@gmail.com>
References: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
In-Reply-To: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755074006; l=1514;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=3Lv5bTYlKhpC0eWwB0IvqfV0hV7JqAASipFjDdwVTeM=;
 b=BJ8pWBbvIH0FzbHcdXVpTFAH5lT0rZrjui0Ve61V+wuFm642CvwU6DaqC/dcoIV8XCjY7DG54
 qI4V3t1jAbxAPR4ndQ0bSfWHDppgyK0MUgXDmPse4XVc4ZfdG6PbS68
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add SPI NOR controller node for SG2042

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Tested-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

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
2.50.1

