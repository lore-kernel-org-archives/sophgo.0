Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A6D26B2D5
	for <sophgo@lists.linux.dev>; Fri, 28 Feb 2025 12:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740746453; cv=none; b=FUK5uHRapv1rLY7sbFRsa6q7bWGVQeBbdzH40csjkOkxS9wAL+YOHQuOBemTY5EwjRXY6uKzJ+YXJR45iJXwdsOwvdabZSS9fZg9/Jx09UiW31DdtsyYD8rAhf5e59EbfhZE/9TVjxT/wGuHRxUltO5vN6L+sgp2snSk6/epFfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740746453; c=relaxed/simple;
	bh=pPMhzcYM3CTCeeRM3hVc0R8I+4MebI7ljV90QEYY07s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XN5nIMnv660HePMYAGbd7vZH7w2WkJuuXnOpFnuBOfQ+WSTtuc5SqHbHjSdFa2ftseMk3dTsYTt/JZsd5vIFSvmrTzrjxX0KCBi9hyQjCvjD1Bek5XQeTyXZp5iEZtNqUoZiKM7EF7BAcK45C3FeQkYGVLlqG9VIhXeM4DCfgGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUNeXRi7; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUNeXRi7"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso3681749a91.0
        for <sophgo@lists.linux.dev>; Fri, 28 Feb 2025 04:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740746451; x=1741351251; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zaPjgAHsPYLWvjG1+7VgSdE4nc17PmUEpTLjntHG71c=;
        b=KUNeXRi7nH+y/UZus5LRPXvWSCSWFewfRuRzmaLU7KYe02GSCdMw5hZU64d/QNU98F
         XgEpmjhaM1bhdPEmtViMP4cEUD64FCFS5mfyY+jPIn2hDx91IjNfO3mAY3pdG3zqWsMH
         kUx/cXQy4F8ZpUVb3M7f0vAhETTr7LMhXQ9yWNEh8qah5f+K4EDepxepoBlqd4X9kOVj
         pvPKDxBk+84NXz+1RqECdMyyyl9mnlmYBDRQttuiUncKcB6c6DtUhumeLb8ZyTUw2MAS
         pgBH5SJ0TkU1XTswmbMGq+s/yYvTDV6ZDAyIND6lbvAd4eqEUN7w/mq7bIhu+wvuv5wc
         ZO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740746451; x=1741351251;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zaPjgAHsPYLWvjG1+7VgSdE4nc17PmUEpTLjntHG71c=;
        b=qKXMug6t8iNBKwQS9lFVD01gsp91YMLRAFUc8VK+Gjbp632cQIuLDjj5Q/w4iDs/fh
         ucRAhW7yMr3No5o8og65AG4smRqd6JdIY+cmVN5vqkUN9Y6KElka0CX9iL1mtJVLxyrV
         /OAUemy8Sb4wZAYX+5/w5uQx5HlVVf3Dm8GXljbcFtVytndYuhiEyjcQhtENbzUgdo2R
         bIp4N0B6p9OI0XCOtxtFXtTnDR0dIDdMv/hR9fuDZDY7TrAD1tAcd8EX+GkxzgSkN3fq
         0S2783yyhz9YsP6I/+ziLW6P6pDpo5+Qu079UoSB6izq5vuDKeQNB5s4LLm5xLfg5Ecs
         Qc+w==
X-Forwarded-Encrypted: i=1; AJvYcCWEIf9HTBXPNTDi3u7zS+rRRUlSbX+1nYRUMGcLwakK5/8Il3GoEyWHFmWtLW9s2x8SX9gdfDw=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr0PcbuzZMJ76QXxkplQmrHxVrHl2XUZfm5CJhQGuU+yAXTUXp
	F2fCTfTv1KOSuhJ6h6htxzF/ycuwkHFdu8C0Mw85lNYikcg2m7bT
X-Gm-Gg: ASbGncvVpgAEQe/MPtTDb+2KErKyWWx8NnjmA8pJHk+UfNuplbMi3ox5lE4Ixd+2hR9
	c9BmuuZoCc7U6wNs/+7yK64qMcKeXevQbzUyFX6i42iyPRIX2iOq/Qn6ne7g43sE+fKUEG4CTSP
	S2a9pRuslfC2m5eSOkY2/etAgK8OR0JZF5AHfX3eKu7YsUkWzal0Ixh/QPGWPBxgD1M3j3pPVj7
	uzdQYUlCpRNF2uVJ9zNAp8N/PTMJdct6mtjsUMol3ghDbGWgOl52dUa+tg70Pv2nh75tcv5ZojB
	/FWQQl2dJKxT8w==
X-Google-Smtp-Source: AGHT+IG2oguQtkP0baYvz7DFJRXL72Jyi0nbCU+efrgTYtEnyx8hDBEi/ILU1lDlG5ECXjkwwcxA3Q==
X-Received: by 2002:a17:90b:498b:b0:2ee:8253:9a9f with SMTP id 98e67ed59e1d1-2fea1346613mr12045174a91.11.1740746450459;
        Fri, 28 Feb 2025 04:40:50 -0800 (PST)
Received: from [198.18.0.34] ([2401:b60:a::698:7eb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea676c55csm3624891a91.19.2025.02.28.04.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 04:40:49 -0800 (PST)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Fri, 28 Feb 2025 20:40:23 +0800
Subject: [PATCH v2] riscv: sophgo: dts: Add spi controller for SG2042
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com>
X-B4-Tracking: v=1; b=H4sIALauwWcC/2XMywrCMBCF4Vcps3YkGRUaV75H6SJNJ+mAvZBIU
 Ere3dity/9w+HZIHIUT3JsdImdJsi416NSAm+wSGGWsDaTopohaTD5g2gT54smys8rYAep7i+z
 lfUhdX3uS9Frj54Cz/q3/RtaocTCtsTyaq9H6EWYrz7NbZ+hLKV//58KnngAAAA==
X-Change-ID: 20250228-sfg-spi-e3f2aeca09ab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, chao.wei@sophgo.com, 
 xiaoguang.xing@sophgo.com, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740746442; l=2729;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=pPMhzcYM3CTCeeRM3hVc0R8I+4MebI7ljV90QEYY07s=;
 b=MXqgr2mcGpw61fx8C5ZrYZfxi0VQxHbEiCtbasaOy/l+UsC9ySW1oMZiECMbe7Z6EzrpdMDf3
 8e33dSukgSJCTHvc6ot+tBqGiX8pxcZzdamJjhsWdceYQTAQyZI5FqC
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add spi controllers for SG2042.

SG2042 uses the upstreamed Synopsys DW SPI IP.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
For this spi controller patch, only bindings are included.
This is tested on milkv-pioneer board. Using driver/spi/spidev.c
for creating /dev/spidevX.Y and tools/spi/spidev_test for testing
functionality.
---
Changes in v2:
- rebase v1 to sophgo/master(github.com/sophgo/linux.git).
- order properties in device node.
- remove unevaluated properties `clock-frequency`.
- set default status to disable.
- Link to v1: https://lore.kernel.org/r/20250228-sfg-spi-v1-1-b989aed94911@gmail.com
---
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |  8 +++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 28 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index be596d01ff8d33bcdbe431d9731a55ee190ad5b3..c43a807af2f827b5267afe5e4fdf6e9e857dfa20 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -72,6 +72,14 @@ &uart0 {
 	status = "okay";
 };
 
+&spi0 {
+	status = "okay";
+};
+
+&spi1 {
+	status = "okay";
+};
+
 / {
 	thermal-zones {
 		soc-thermal {
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55abd922b5ef796ba8c2196383850c4..500645147b1f8ed0a08ad3cafb38ea79cf57d737 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -545,5 +545,33 @@ sd: mmc@704002b000 {
 				      "timer";
 			status = "disabled";
 		};
+
+		spi0: spi@7040004000 {
+			compatible = "snps,dw-apb-ssi";
+			reg = <0x70 0x40004000 0x00 0x1000>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>,
+					<&clkgen GATE_CLK_SYSDMA_AXI>;
+			interrupt-parent = <&intc>;
+			interrupts = <110 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <0x01>;
+			#size-cells = <0x00>;
+			num-cs = <0x02>;
+			resets = <&rstgen RST_SPI0>;
+			status = "disabled";
+		};
+
+		spi1: spi@7040005000 {
+			compatible = "snps,dw-apb-ssi";
+			reg = <0x70 0x40005000 0x00 0x1000>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>,
+					<&clkgen GATE_CLK_SYSDMA_AXI>;
+			interrupt-parent = <&intc>;
+			interrupts = <111 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <0x01>;
+			#size-cells = <0x00>;
+			num-cs = <0x02>;
+			resets = <&rstgen RST_SPI1>;
+			status = "disabled";
+		};
 	};
 };

---
base-commit: aa5ee7180ec41bb77c3e327e95d119f2294babea
change-id: 20250228-sfg-spi-e3f2aeca09ab

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>

