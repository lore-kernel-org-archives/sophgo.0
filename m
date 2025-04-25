Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48AE153BF0
	for <sophgo@lists.linux.dev>; Fri, 25 Apr 2025 02:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745548140; cv=none; b=TO2jHCMqa3T2ejQDxOTeaUdUa5QRGRyDsDZpseZa41ibPAr6cgzu4+Qzdz8DLMOuXYITXWamQHxydajb4l288McYGj18MaY0L3+V9cC8eYmScgXxyv7d6upVNLcHlpqcVxS9VMQsAN4SabxxLvADNJnXLpRiC6LsxIBWRxnzIHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745548140; c=relaxed/simple;
	bh=bsOb61YGYomuONd3drp4jb88EZWek6I8D8vdw/YFqjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gjo6+l3R6s8USdcBaBBH9ktoS4Pz7TAGvkleuPZNfZdz1VJkIOLjBmaSDgxsKJ1L0qDFG4x/KH9Qt5AYZRiuGXVKijGWCRVOLrYiu+E1L66uAK1U50dr2r+p6/cIO+5301EnHWNC2fWfbht8omIjEeyneq+B9tavZ2jjYzrxEeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXE48GYh; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXE48GYh"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso1550875a91.0
        for <sophgo@lists.linux.dev>; Thu, 24 Apr 2025 19:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745548138; x=1746152938; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYhIc8nI7TQrbMQ5ehdUi9XRR8BUa9kFTApEz1i6px8=;
        b=lXE48GYh+R/z1audRinGbqriC/s1uE9K6DJvzXkfGGfmvGmdDvred67XX86+QsqPTd
         u/lHP0fsOAVCfb+LSolvWQ+4rHLqx+OYmi5qbMX2abl9ZuYd63sN/0h90BelSqkKRRT0
         wDzyAPTioA+6YiiVz/sN8Qv8Wx9Rj3zfS22pzF7woP3dqH4vTFH7XsEeZHScXpU1lFhT
         bvDbjZDbmdCGa1+hBm4OF8Ee8N9vTm6DQMkqL2PrskI3L5H5QOYBCeGoIiOsKX7LXvOB
         19o6GGqD4bCe14I8AAHZ+XrnoyA6AmOY/mxnJ9iFsN0l1bZwX8BS0rErG1NZM8svFUu2
         F0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745548138; x=1746152938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYhIc8nI7TQrbMQ5ehdUi9XRR8BUa9kFTApEz1i6px8=;
        b=GfXatAELU5HQKPHEwLu1WAHiupCuGUV3et1bQi7c13QdrXnjOrR2khaBe0cq4zitlO
         tA+584lzUnXSF2L5wIsHoH+NjMujsC4ZtmUG9PXz4lttMSJccFqXNkJiZ6aH/x1sKxas
         VoB7MUmWrSp4kIOby4SujUqR2F3fE5/ke6Iil2DDMEWko+yQBqHApMbcQX4NRhF/FC+O
         K8gvd+viy1zjeNK+rpRbDWpoG5JnnG/LwcDc/TyigrKaKpDmFEb1NlRn43Tjaf/7VUdx
         sf8gHbUjILbaDw9ZYN5FX9kbA7ggZxiX12bM/E19wCVAru9/IpBbQSS7Mp9aqG6yXxHM
         8W5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1EP6aJyb/0jK+cg5RSYyEithuYNgwcP99gKMenbmiXWKJ6ZPjg5ko5qnzoeRqv0lZuJOqFNM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGnMdRBV7fFPjrDzQTUOaPcB77BO/Ct4+RqdOCK/lx5//bXhAp
	RwON6mryhtTTLzRwBLuEB9GLGfiM7zKo1np3Bx5aixYATNnEbZ+J
X-Gm-Gg: ASbGnct2JliWp4MoZXYgBFrmaJZEfmj7nFmSwfwEQNEOZuD8OrySmcv6kdA7GMeTbl8
	DyDZTgeZioxqAnCjwz7Q472JjiR89fLy88cJgZCE93mMiCwmKZkYS8upFUb458e4MP1iaKQ/r7k
	jCj/uaV2ibem5Mvr+Ng7qhiM9OeQEkjBksNIX+s3dokKXkIzFo/IpyME9wbTWU/p9CzSRE6SdWJ
	9ARiXbTvU0zAwUcb7DGnLiuDRj/UV0Yl5tPoyAtv7dKrydu2N86xmB4hR4hOfDmehBqAwZX/Itr
	NGbByjAyUfpDiHoiGWE/iSurp1ohoBwr3vlx2ztxamh76A==
X-Google-Smtp-Source: AGHT+IFQ/ASdtiEJLWyy0JwXJvK9BuImD6nRYcmLkOuTSd7G4uxDP0nuVfFuf8LFPcPjATGegctLZg==
X-Received: by 2002:a17:90b:558c:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-309f7ea86abmr1328288a91.33.1745548137606;
        Thu, 24 Apr 2025 19:28:57 -0700 (PDT)
Received: from [127.0.0.1] ([223.80.110.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d4a9sm365455a91.30.2025.04.24.19.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 19:28:57 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Fri, 25 Apr 2025 10:28:14 +0800
Subject: [PATCH v6 3/3] riscv: sophgo: dts: Add spi controller for SG2042
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-sfg-spi-v6-3-2dbe7bb46013@gmail.com>
References: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
In-Reply-To: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745548101; l=1524;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=bsOb61YGYomuONd3drp4jb88EZWek6I8D8vdw/YFqjA=;
 b=0QyxC+63XX3Z4RcBnZwI+jfagaTUbfSPhQbRudW6e2AL4aoUOOld3mI48zwlew9sNlIgXaoqk
 YmltacDzoa4Aa3AoJ2E0K74/56hzddLfwyrfC7PxbezhYZU+k/gUfTg
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

