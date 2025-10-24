Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A0726B973
	for <sophgo@lists.linux.dev>; Fri, 24 Oct 2025 03:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761275176; cv=none; b=HkyNQOiyXxbMmO3sFm06X7qwX5+Dd4ueONduais/+EsRTrxQEa7D0/5okjVDNhngSmeldeeYoqDA548vAnH2jwhOYWmdc/9lvbFh6jXUd7laR5bIkAj12nbaOF4XuXX+gi+Xi3K56o0Pgh08yfRmJ4/0HBV3HXoXXn3N+WAxC+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761275176; c=relaxed/simple;
	bh=gHKwX7PP5gGOlLXqIefFTY7ny3XOT8J2aK0JKv2/Ofk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZXpKipHSOcwC57I4k57xC//dLQ5drsKkZar+kNtqyCt/A5kn6dv1dKLrLmO991DIDZeDm5lmWanpsl1oOqEzqZ7T0nh0b6IM18mngIUBSegwNY+5RnGtRkqaJc4fy+AFEobG1cajQDR+Em4HpIhz22UxWq59EqD7xooxcefFGFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWrPxQsY; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWrPxQsY"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7811a02316bso1183010b3a.3
        for <sophgo@lists.linux.dev>; Thu, 23 Oct 2025 20:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761275174; x=1761879974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDm1+WSNoDjU3S+YxmjJ+3pKYEs3Q0EpdQk5O1Ku0Ho=;
        b=XWrPxQsYrrEzxM+etbnhiCTMndJEmHlr9cBTi2+PhoZBmcz3LBzDHDaRJpZjot26Yc
         QPBpk9kO8/fK6ZandfTu36tFnCHqKatQ5lIqnosmgyCclFpax9aRjc2afqClHrurfyUP
         iaa/5q/XBTNqWinYu0okFCuQFlf5EApw4x16p9z99t5y9wlsUCGFk/fet8E2ZM2pIciD
         iJLlehzAVjL3MSIer516n4IeMfPm6yGxzDwgAzrlR6rPtoJmCLZuK/z3OFSu1gjwDicl
         EX/GzBYlj96oZbgOIV5cxr67BPJAz8kIZTa5ikX2wr663UoTzEaH5PxNo1JAIDzQnUHn
         BNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761275174; x=1761879974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDm1+WSNoDjU3S+YxmjJ+3pKYEs3Q0EpdQk5O1Ku0Ho=;
        b=eiUpxovDVmylACCF+GRsBtsG/5i7qo06WYoSgCzNiVd0tLI9PJNDRCpooC+vf3UBlJ
         bbwd2bpQ2SOQwUdolUUZqrxIA+LEXEBzklR3+I84tkqJ3RwG/VxiS7HWqVgmDFvK5CAn
         mD+UsdIbppAFI7cY2RQMUP4oAmp6LaX5ax5ZKpQJRSGAkWz4FKij44lu44Scn9LUG/Mv
         vSJlsiDjGL7UDwHbC/XyvSU0aQeF4XFKKnqyTLvr0oRW3Ui3VrIO6Ygg1mwk7gxAX7gj
         WLzwhUBjHyoUt+G1GGnCsg6KfU8zuYYsQ+hA0hroUzD3gIKDFootiCg7DccubUJ/M440
         a7Og==
X-Forwarded-Encrypted: i=1; AJvYcCWZtNlrn3r/6RNA0TOtyiwpwxrUCWJ+as8KnZg8b1f7m0tNb1+nHDKxBkt500AnUyEHbKPgyek=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKJQxgECyrPoT3I0CLM3xj0aPXpBk9g5114pOCrWmBn2GR1D4x
	l92f759ijb0I8c9glPTAqe1Op1E6qcSRe1ykqDEL1QlEd/rRNY1GtkXV
X-Gm-Gg: ASbGncvUujgEg9PA53a+bakIHJGTQhff2IDS5gVMcZOR5+3RRdGau9dE1FzS9T8C+hL
	f+d8UUX77CthMCLrRDYE4+XGv4yimLlnGDB3+scQhLj2nYVpZtzwwsUVbAPzfYHcxIzN17wjs/X
	V9gbCXaBOCPji24Qkvr9NfLYbTQuVqg1JI011H50b1I/ucUrHO0tVqf+eJkjqzQZI4oXaTeNE6w
	Mo1r0wE/hG75bzS0AppTMetj7uFBcDr9KIHsVZsSrPSaJ1MIGat3tdfHM98QLHzlj2rLx3tL+tU
	Ri73aQFYzvd4SCCn8mpMCdC5O+6bWOXVslLwxLvgeldej9yqyq4rjuKAKisJXvyIABTlMAeX11E
	r7n/jJpwNEM4lcU4AnIySalxF5ZP3jdL7THDdF3gG9tlUOP/EXI2VEJXRz9f4bCtuXxn2KMZpJn
	eDQp0vuHf+S4Bs35By
X-Google-Smtp-Source: AGHT+IE/XFUouf2Y2+Ufb3mHguZuerhicLnASzdw3OZ91/123tlViakv7Utbf09cEb5A9VJEhESMKg==
X-Received: by 2002:a05:6a21:6da6:b0:303:8207:eb56 with SMTP id adf61e73a8af0-334a850614bmr36652432637.5.1761275174071;
        Thu, 23 Oct 2025 20:06:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb86cbsm3574172a12.7.2025.10.23.20.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 20:06:13 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 2/3] riscv: dts: sophgo: Add syscon node for cv18xx
Date: Fri, 24 Oct 2025 11:05:15 +0800
Message-ID: <20251024030528.25511-3-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251024030528.25511-1-looong.bin@gmail.com>
References: <20251024030528.25511-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add top syscon node and all subdevice nodes for cv18xx series SoC.

Co-developed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ccdb45498653..42303acb2b39 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -25,6 +25,32 @@ soc {
 		#size-cells = <1>;
 		ranges;

+		syscon: syscon@3000000 {
+			compatible = "sophgo,cv1800b-top-syscon",
+				     "syscon", "simple-mfd";
+			reg = <0x03000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			usbphy: phy@48 {
+				compatible = "sophgo,cv1800b-usb2-phy";
+				reg = <0x48 0x4>;
+				#phy-cells = <0>;
+				clocks = <&clk CLK_USB_125M>,
+					 <&clk CLK_USB_33K>,
+					 <&clk CLK_USB_12M>;
+				clock-names = "app", "stb", "lpm";
+				resets = <&rst RST_COMBO_PHY0>;
+			};
+
+			dmamux: dma-router@154 {
+				compatible = "sophgo,cv1800b-dmamux";
+				reg = <0x154 0x8>, <0x298 0x4>;
+				#dma-cells = <2>;
+				dma-masters = <&dmac>;
+			};
+		};
+
 		rst: reset-controller@3003000 {
 			compatible = "sophgo,cv1800b-reset";
 			reg = <0x3003000 0x1000>;
--
2.51.0
