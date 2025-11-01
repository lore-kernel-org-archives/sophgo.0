Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078BA2505A5
	for <sophgo@lists.linux.dev>; Sat,  1 Nov 2025 01:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761961498; cv=none; b=qVf34vzG7tXxF6ijNM5MJO6o2rovTlT2qjfxtfyOhGQ+MbyHKlnZ3Y+WbqkE742GVx/Kuojxm4qaSat5pWcZulf6vxdtTodLY5RJepr24F+eEDpshJDCSYdtwwmzaZmiARKNN978LurxQdVsF80NCQdaNjIQG892surlgRGuxFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761961498; c=relaxed/simple;
	bh=Wr7LJ8peoDW/jo3pY5MeceHU7Si+wM9BWcaylcwONyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZAhTGbsnkU/+6m7mWXJVjtuhfL0EMA8ENoAhMTEspHHwcYtrvsCS9DwX7dbXb1PEr940JxNunLLwXf4j66WylQZ/BF+SrCidaj8HCIUoVqsTzVREnIMaOfxnfDOaeoMTvUYNcmNUCYSuhGfCsguh6NLcB7PXgs2L3hzFmjJ4Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZfovpxe; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZfovpxe"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso2955962b3a.0
        for <sophgo@lists.linux.dev>; Fri, 31 Oct 2025 18:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761961496; x=1762566296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gK6/9/Nd88Q9gusSePNbcMpaVCV2+VwX5wGIqW+nXzI=;
        b=HZfovpxeRhdBTvb+y1RjutMsMfiIYFu0u03ndGVteE41YVH56e4TiP1WkXCvtqtrc3
         41E5zhQU0zV/Ik7XiT9OW3xFt3aHQaMTY8mvoUUW2HvTeR5vZCEmn3STVpQ2+If1SQMv
         LY18sN23QIlQaIOTc5KnsQEdNVRQHLM7bttkDieKLFBG81FAR7z2fm59iyKm1mmvNj/7
         tfoeYCpNWkkEiLUVLIK2aLpFyXiVwOObdCZC084Zb5MOfsxAtAZDZFsrktO1BXSkbMP1
         xCSNKvQbdaAVmGgevJse2Mg4Jjl5lgTT9fIuRzcb1axI+LKl3RR+yU3agnZGYPvmf8OD
         K0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761961496; x=1762566296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gK6/9/Nd88Q9gusSePNbcMpaVCV2+VwX5wGIqW+nXzI=;
        b=rkq8vGjGmhhq3tPsfsGLk5uHA25CmQ97TDdJGUgqggWqwhRZDk11zl10sTaZ7fN0k/
         DThN/5Yb2mdeiV574IrkB9OseOjoPimE0RsoxFeNIDJnMli29h/X/p6jVrjeOPWJjOqO
         yj7Bifa0VxA+hrTR41+YIOq2y3U4m42rDP1LwytPW7P1KLdpEV8StcFRq0A06BnRd7hA
         rJbVHynyjsx5ceaXH3zHEsUoMM29abxhJlQGdovpNDjxgY4tjFVDe6qJCK0xPtSrMVW9
         f+5KmD2Jze31BiGAEMrMcHyt9oHS+dM7+9RvFpdiFi5jPOAg5APKiTSSxko5YNJ5kyN+
         ac1A==
X-Forwarded-Encrypted: i=1; AJvYcCVQZ4L9mnbWdiL0Ph76msLAqoYpG+UHuNWndr0XsfVMlzLd4JPdB0k2ACJfzfWD5V5L3pfRbEY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjOk6BOL8sL1lduEVDvxO6Jlo3AoBLYRWin1fm0GuRkV2r1ZZK
	p6jNgUAfiPIXGw1o8VJNE+Hy7YdO0YHcw9PZkXQ9eCprN6BsizFE4NzChu048Q==
X-Gm-Gg: ASbGncukaG2EMl+4c6iBSZmUDycjDjQA9y9JVUJTMS0KVCyv07CM1FM5tsVwItUDYBM
	mz8zQ05t6f47JJF/srRAKZlhWtLFSlmLQLpF4HVBw2pB6e4qTBBeotMuQaHPsH+4K8tPUe6oVNe
	0QuswVCfZ38vOjNErYPNpXpE3aofIdSXvnzp/QBl4vdo4Bz2S/zVV69QsCxvZltijkQP14Iohha
	eDFmefnBdYENhibib8jhEnElP7Q96eBjT3aAA8MGdPp/9jhvzWUMreNAbIOewFrXrMhrfuGMoj4
	/r8MvMMIixfd3JqtMfOCH/RASLmq9ICsTwjPYkGNpwqthVlCUDZ7Cj3pzJCjZSPD59jvQgzWcPQ
	O2/0JCCKCfg8NZ8AKn7jLu33XaQA8uFFUorQVqtnJid5inl2FZoncHKuZHmCk3jzT7W1iGhrlRQ
	x09vDr5rOu/IcTKCod2UP5ful/tWzYCxrGKh1bDA==
X-Google-Smtp-Source: AGHT+IG73fXaL0VcqLIqRkANfPCq0IjyN6Ot8qtT20JHVXUm6Q3Tb0hIJV982rzY2kwxu6Q35wHvuw==
X-Received: by 2002:a05:6a20:431d:b0:334:a953:1263 with SMTP id adf61e73a8af0-348ca566211mr6539181637.9.1761961496152;
        Fri, 31 Oct 2025 18:44:56 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bf078924sm3350585a12.32.2025.10.31.18.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 18:44:55 -0700 (PDT)
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
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 3/3] riscv: dts: sophgo: Add USB support for cv18xx
Date: Sat,  1 Nov 2025 09:43:23 +0800
Message-ID: <20251101014329.18439-4-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251101014329.18439-1-looong.bin@gmail.com>
References: <20251101014329.18439-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add USB controller node for cv18xx and enable it for Huashan Pi, milkv-duo.

Co-developed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts |  5 +++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi           | 16 ++++++++++++++++
 .../riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts |  5 +++++
 .../boot/dts/sophgo/sg2002-licheerv-nano-b.dts   |  5 +++++
 4 files changed, 31 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
index 9feb520eaec4..0e6d79e6e3a4 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -100,3 +100,8 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 42303acb2b39..1b2b1969a648 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -432,6 +432,22 @@ dmac: dma-controller@4330000 {
 			status = "disabled";
 		};

+		usb: usb@4340000 {
+			compatible = "sophgo,cv1800b-usb";
+			reg = <0x04340000 0x10000>;
+			clocks = <&clk CLK_AXI4_USB>, <&clk CLK_APB_USB>;
+			clock-names = "otg", "utmi";
+			g-np-tx-fifo-size = <32>;
+			g-rx-fifo-size = <536>;
+			g-tx-fifo-size = <768 512 512 384 128 128>;
+			interrupts = <SOC_PERIPHERAL_IRQ(14) IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usbphy>;
+			phy-names = "usb2-phy";
+			resets = <&rst RST_USB>;
+			reset-names = "dwc2";
+			status = "disabled";
+		};
+
 		rtc@5025000 {
 			compatible = "sophgo,cv1800b-rtc", "syscon";
 			reg = <0x5025000 0x2000>;
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index 4a5835fa9e96..aedf79f47407 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -86,3 +86,8 @@ &sdhci1 {
 &uart0 {
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts b/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts
index 86a712b953a5..b1853770d017 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts
@@ -93,3 +93,8 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
--
2.51.0
