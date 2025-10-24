Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324BD26E70B
	for <sophgo@lists.linux.dev>; Fri, 24 Oct 2025 03:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761275184; cv=none; b=YCqGM7k7cqVHLY+Ja65E2XUZhiWl+moY0u45YK2kJI1M5HTCPd68YQdzDDepEcpZCzsspKYx8h0UHdVJmtuAneOu8jVyT+yHQmnU1Pw5RZeHP029IwCzGC0rD3Xo8A7/fQzZzYQPFAgBxFuQ6hL/Nps9O2v/h4LlbspD1GPO97U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761275184; c=relaxed/simple;
	bh=Wr7LJ8peoDW/jo3pY5MeceHU7Si+wM9BWcaylcwONyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QqAuY75zE+rN5RLatCijpyvnIca/zA+xRR1PTgs5jb/hlXH8wUhG9iIjHxxcVU8Bx2IWHSFr2X5mbHQ2V9B/2dkjXPMohtKslnHNNeKZGSkxBpnLJYXuUpGqxQTMT2/G3u5eYXrP3Z9uhU/bbh5j8hOHkk0ULxEmVQAhUCkkos4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnGgpsxH; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnGgpsxH"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b6ce696c18bso1372744a12.1
        for <sophgo@lists.linux.dev>; Thu, 23 Oct 2025 20:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761275182; x=1761879982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gK6/9/Nd88Q9gusSePNbcMpaVCV2+VwX5wGIqW+nXzI=;
        b=UnGgpsxHOryljn+Tn24WJyJnwREfDHWs7/xl7BcTLNKQkpe1VI7P3f5vT1AQdxDQi+
         uLsfkWVC+SrBpU507euYhLkJ1DPjKM2eyCrzQKdE9TgIgsFwgIfUtUEAIrleZRyPWop0
         z4XZ0w0aWW6OHawVvjVcLlOqXWw6gEfxjVc0VYp90Uwetv4mXjOTH6DB/RntAHKt2G3C
         spCUAPySpmKT4/bfJoH2HzZLJS/nkujLt2Ln7J6UeEYv6sX5y6vSLwB+qmL8lnTm5PoE
         GNYaWApDfSI9EcngcBKu+nsMIyyZWmgIFltvVaEUY6ScEH+5MWMcdoXY+8H9bq89tbOW
         q5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761275182; x=1761879982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gK6/9/Nd88Q9gusSePNbcMpaVCV2+VwX5wGIqW+nXzI=;
        b=t212eqT9gsg1oOuB04j1yWHHALWg5i0TSaKOPv4UfPiOW6lnu/ciypM2s2oWw6aMMy
         EVm8Do0ptTucCf5O466sn3esyl3XjaDwqC15wD8OFAx9IkqL360J/1XwrBq3e60OmOTA
         brMaFHqrS09XsJWr1vVTQiTQX+xKpOKvJNkVdMtbODhoVRadeeMs2BlMLPeRwt/uZQXJ
         mBoofOn8HLpusbHZSS4iI9uI//RCbWy+SUfUzObn/bRgz1L2pB5D0XNolzW5QhpXb5Rr
         JhevcKW+pI2r68scmirHP6wL57hBq2yCnWNG9zZu9VIe0/EZp4GVxvdfXtITOP7F8Mso
         NutA==
X-Forwarded-Encrypted: i=1; AJvYcCXM8sHnVyuDCn6EFItHUjhTn6ZlIHX1gPk7z2PDf6FvSb9qbBUyAy3sPYcaDOP7nDJZkRqtzOE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRU8wpHpy8kEIJDW5DDlfpDUmVQmPxuLx+xaIWunGoeviy0egN
	KtxpG09TqXKdkrFRIUqdHdt9puZfHvW3SLUpqsWdQ1PAVgLnPd0dsz1n
X-Gm-Gg: ASbGnctcQGJq5Eb7QPZMvAb6iTMTrzvvfyX45icbg6KH1AeWzVF4LmTxVqGry+WNbar
	yMkCDr989fG8tnY7/tGYp8kx8kXhYgeuz7FqllMWmwkq0bX5vni3pw5SEpqiWHswNy9PykjWzt3
	fYKEI33hMLHujzc3cAyVLWnN/v6KlCxCzGWBKhlVM/MbjqXKUmq44QhXn80NfCSnFiPWgy0mmsf
	S6iiLL1OihWCLgtRQNWD9CXSPhEE42tblD13JzTaKmzyvCf9+VTso94dMcpHQUeALSMYDtVNIao
	yUCvFKY+uvBTe53J6H0xZvP14HrY9+77Nk85bKhefYKa9CGHaAUW33aUBU8fePQHTIyqqVf43C7
	nSAHwVJrHbe1opIDClyM+X6J4eLCeLJju3kK9LJ8O7mjW9/nCSC3Sk0smgcD/3g8p9hH6nAR7H0
	yhMLLKNBarX+CRlRhY8p5n9w8Zf44=
X-Google-Smtp-Source: AGHT+IExJ6H9VPiKo4oFXupf4Hq1rvYGBs9i2gm80xYGGd1NKgjymGlzndYHMYAVYcF8kMC8+cCiAw==
X-Received: by 2002:a05:6a21:3287:b0:32d:80ab:6d12 with SMTP id adf61e73a8af0-334a86372dfmr37551806637.40.1761275182290;
        Thu, 23 Oct 2025 20:06:22 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb86cbsm3574172a12.7.2025.10.23.20.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 20:06:21 -0700 (PDT)
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
Subject: [PATCH v4 3/3] riscv: dts: sophgo: Add USB support for cv18xx
Date: Fri, 24 Oct 2025 11:05:16 +0800
Message-ID: <20251024030528.25511-4-looong.bin@gmail.com>
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
