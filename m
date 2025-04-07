Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C6D2253B2
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 06:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007731; cv=none; b=FIiYAb2yYbwPxf+tSourDDZJGrblTGTGtadHsqc9ihjJc9Pv39itOV5KpPQAh0MdGtLQtN6zqUWRr+nRmpVbMkcZs6zjNFbXrsP4xz3tIluRKz1M0I6G/q+tquL+YSTUxD7uZaQ4jdmZyjFBYmzFFA1sGMlDpffFwxH0ll3whsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007731; c=relaxed/simple;
	bh=bsOb61YGYomuONd3drp4jb88EZWek6I8D8vdw/YFqjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iOkoNutwVIHnZwsloh6k5ejxEUiFn8S8AfNTFCx/haFM02TA3JLaNAHT5vopjl8rKtLEI1MEcE0LdPOcI7o42EBjNnngJ1TfxFRS93nYJuZidyjw4biY/XEq1HoIG/XKx1ahiB6W+PMWhicH71+7jGWXz60OlKso9wS3if1c/y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRk4zJnA; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRk4zJnA"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30384072398so2987529a91.0
        for <sophgo@lists.linux.dev>; Sun, 06 Apr 2025 23:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744007729; x=1744612529; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYhIc8nI7TQrbMQ5ehdUi9XRR8BUa9kFTApEz1i6px8=;
        b=fRk4zJnA6G5tB3BJ2C5RDUpz43XesrAyEjXsmH1fmg8H9ppshpkyaOB8luRssnHTXE
         +0NZdeE744g15NBq+BzMMYRBjDV5nkOWaqToyD0goxfWO+mIVjN1mvhDXHVcdkGKC9gh
         bz/YyCKyCEGkr2qfeLpvKUUYGRposeviWHLE/JMnX39vBYwlmPQDBJ6xxe0uBGqVzGh9
         RNanZi7CH+AXgeXQKUMZlSreE0ZCZiY7PSlRqzOC0olfeTo4R1JJR8tNyQZ/3poDHA7C
         ZEekJJwbnV8xzaYoWSkXoLIAMSuX0tVa5ditFCscn13wx0dsmCjAzmbpAvKdKwCk7Dec
         tnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744007729; x=1744612529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYhIc8nI7TQrbMQ5ehdUi9XRR8BUa9kFTApEz1i6px8=;
        b=MsYQ6OpjCEtDQrVYUrRmRqRh+K/h6yhdXRxIw/hSS2Pc75JGesBUuCWTA+vJE19e/x
         ULN/zrojQFpICjx/LLmqGvO5S2PvXqKals449tX82lRGbQynxf/PwbInunj9OF640hQm
         UcdIDmXgRtasoUm0YZ8GXIQARJcSMu8WXfrOmRkI8RmqkgVH0MJ4Gyk3luw0HJKB94oq
         Y9BQuB+72PMHP3quycmZx+v+2ynUy7YZSufsPfKPjFaug5/i8J2msiLLkN9/88/T1/h6
         Fq1miqTBk+U7NaqhehHDvKSlerqxyeNMO23PqX1ekWKSaKv++lohSuPNIKvDzHyhfNJJ
         6AIA==
X-Forwarded-Encrypted: i=1; AJvYcCUiY/VAjCVYJY/WnIFZi5XR57Mk/oJoHrrITEcQ9d2Ez+r6t+7N53Nll7ln6JVjIslLlntc1Yk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnLqEKBJBPqmlH6n4TW20+xgoF0lZzCyQ9nUWTTKkZvkg1kjfX
	9ud2z8hzR02G+3a0ctGjWChZZv7F1ZJEWA1suJoftAwOQodx5qJ3
X-Gm-Gg: ASbGnct86Q8oSrMDEFznzyTjJPK8QYgOYGvLVDAPzeOHS+r1ojBR53zsyZJS9xCLI62
	gFD5Uma+C1lDrlBO49qIA/0bO+14qtY+0sHm98a9Bv7sjHcaP1TlwRCy8ACRVZXchkUxvL9DBzm
	jy9tl359GddHH8BBMsss0xVWD3mrw+QsJlJCJlRGX+lwcAs33Y2HYKA+eZjb1KMbnUDRURkZj0u
	aJ9WS1voHIB3yWaJlu/P04HWfLWcBjx53NZ2IiAl0T8QBZX79KcubN+V1vxUPqhlCXPBJwxQlZ8
	GnCwKHb83d7way90IYY1wNyKAAeE6AAIJqFm
X-Google-Smtp-Source: AGHT+IEOZv/5BU5DtfI0kqmCTpjbskhnz9UwTHMxtKxMAXxrUs6NBY985DM+w/yiSsTGLeLjCsEYhA==
X-Received: by 2002:a17:90a:d606:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-306af71d944mr11933303a91.14.1744007728522;
        Sun, 06 Apr 2025 23:35:28 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::610c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983da691sm8048044a91.47.2025.04.06.23.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 23:35:28 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Mon, 07 Apr 2025 14:35:13 +0800
Subject: [PATCH v4 2/2] riscv: sophgo: dts: Add spi controller for SG2042
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-sfg-spi-v4-2-30ac949a1e35@gmail.com>
References: <20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com>
In-Reply-To: <20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
 dlan@gentoo.org, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744007714; l=1524;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=bsOb61YGYomuONd3drp4jb88EZWek6I8D8vdw/YFqjA=;
 b=NJH8TpWiMW4r06WrPW4gxUE+TCU5HZSZXBlR3ljOxPFklJJaLgR52pUKwZe9T4LAOIjOMf7QK
 kowq5MZbB3oC1jnWhE+PHAwndhoVtcWtlfI6l6C42zbkuA6xE66e3bw
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

