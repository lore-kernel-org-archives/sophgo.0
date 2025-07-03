Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E76F1DDC1B
	for <sophgo@lists.linux.dev>; Thu,  3 Jul 2025 02:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751508985; cv=none; b=ZEAjy7/e2RFhDh9+ItEunNabSxd1N8GB/0v8j9GaVFcrJt+RMpElvHHOQteYA8iTWQrn/b9KzOIJC+if0V0brnf3lsUffpZuyGQZMHIYdLEc9U9S0ynzDXsIesEkjTR3WRzAx2L1ui5NfTGOH2TKlIl/ttwb8MzCsjaK5TI6EVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751508985; c=relaxed/simple;
	bh=28w6W3M5RoMtkXpLoM2r5jUmQHSYfM+9m3hFwUL1h6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nd4qA55C1tPCQxS8941PuC7N+g8n4qGhTYg7oajffjudgiwd2lGzfAnDs5iYGUUHrZEav91IPP4BoV1XNaB1TJGdLqQRX4uT1Z+Qo3UgyvXCcZyvpbzgF6n1MqN4/rcGmt4h+MUvJlUqKCr0Y+9Dpfe/yZYytelt++EFFMatAmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjXQYN9l; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjXQYN9l"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-747c2cc3419so6978728b3a.2
        for <sophgo@lists.linux.dev>; Wed, 02 Jul 2025 19:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751508984; x=1752113784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9G8EsFLPHcydSdSrFsRKcmtgOEiF67NnihrfLuZNDOk=;
        b=FjXQYN9lMZ6e60I6aLCCn+u+sh7fmltDwgRPdvM19ZT43NNQzTKOT/I6+tmyEftoSz
         cqR+a77msN9DW/s7+Vnc217/Pvt2fBk5ALt6xJLgUue8twdXGW/Cw+T1o9Y4rTacHNLO
         nnFL0bHZ6hFpN9JaXr9j8ojWAQOypMqaODG7DjDsmysuY7N/yxb/CTw9zn6DjRkndBOV
         cUalWMoNCPnTL5nWlPrwQi29Nabinpt4gO2zQ8Eq+S6JDxBZp/8mSyfoDZmJz5UOUM+D
         7z2boRzsx0L1yGqOvqqthX2YbBSBz2GVc8IWgGKFBOOpLFz3tGqgbJpLFjI4f8B2yoVZ
         uYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751508984; x=1752113784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9G8EsFLPHcydSdSrFsRKcmtgOEiF67NnihrfLuZNDOk=;
        b=FFy6+sVFnYlaQYonpaer4flFQ1EOuzyo8XZaWofibI5L02QQ2wud/fFd0mdDHiAhp5
         khonrmWLfIYp4IwyUoYPFpsmAsabqV0y4aJF1T0Fn1M8oyuh5mF9Kiz1tmzoi0U810/s
         IkRTZy9Dnut4XnNiXqt08JRGqhMO+BYKLk26VHT8mb6gPf+NbRexIgtgACOzcCQo+aVJ
         d+/pYpQW/d/Q4PIO/5/Tr7faIQ6fgD4Z0wwXTGQ5he/ldH2ND3dxEaTy96lIDMf91V3Z
         daGqxyNOmI2i1Qsna92hBeRlHG40qMPk0w2NVsMVwD3h0JuFN8akFjVXH59d2HhXRBAK
         EBRA==
X-Forwarded-Encrypted: i=1; AJvYcCXi1/FdjDZhItfRCMan5qWHGWRG0Vdr/mtz5Dz5xBRlAxGN+7k5deuwREKJ6edQ/FE4l/hNmdo=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn3uhXV9rJFxk0QD43VLOTSPbh0/juXOqYxuY6vv6gRqBKM2R5
	Bzwou8e+cyL78eJdD1mtG070g/hsfzBfFZ2chShZzmZ7jQq5j4PEye1v
X-Gm-Gg: ASbGnct1iyUKXLoW20YuZ9JH+0a1hvMDjR36DZkgEX84DYNlMIGbH5AbZT9PgdyrXmL
	CT7y9JsvJt2+nY948U11H60icN6+qsifSBMkOtetIjT0Jb5rQ04tYXa6P4ZnVcBcen/j/EC81JB
	f8F2dHk55LlDgO8UQGkakNvHuOPlcuNkn9eB/V0lD/y+7s9XIATT8QgSrudleSt0c9chBKjOgOr
	aEtpwN4uCTtPlW9PYN3dbtIbmvSKIphBns2aKmzosjvvDlu4oVCS46YKoKId9JyMw73GZPJ8h9F
	OSfwd9z7sPo7qPtce5878UDwn4T9jOWCkG71baDdyeybJnMeDIuXUS571g8p2g==
X-Google-Smtp-Source: AGHT+IEpfvICwsWVQEs2aV82TjO8nSl/wr+6JnI2pnLczgYzsPIqjZfU+7/+o1SmEX0puDeKxR7JHg==
X-Received: by 2002:a05:6a20:7fa5:b0:220:af86:7e01 with SMTP id adf61e73a8af0-2240c6a1815mr2739797637.29.1751508983597;
        Wed, 02 Jul 2025 19:16:23 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af57df5ddsm16245401b3a.127.2025.07.02.19.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 19:16:23 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/3] riscv: dts: sophgo: Add ethernet device for cv18xx
Date: Thu,  3 Jul 2025 10:15:56 +0800
Message-ID: <20250703021600.125550-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703021600.125550-1-inochiama@gmail.com>
References: <20250703021600.125550-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ethernet controller device node for cv18xx SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 44 ++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index e91bb512b099..7eecc67f896e 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -189,6 +189,50 @@ i2c4: i2c@4040000 {
 			status = "disabled";
 		};
 
+		gmac0: ethernet@4070000 {
+			compatible = "sophgo,cv1800b-dwmac", "snps,dwmac-3.70a";
+			reg = <0x04070000 0x10000>;
+			clocks = <&clk CLK_AXI4_ETH0>, <&clk CLK_ETH0_500M>;
+			clock-names = "stmmaceth", "ptp_ref";
+			interrupts = <SOC_PERIPHERAL_IRQ(15) IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			resets = <&rst RST_ETH0>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,multicast-filter-bins = <0>;
+			snps,perfect-filter-entries = <1>;
+			snps,aal;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+			snps,axi-config = <&gmac0_stmmac_axi_setup>;
+			status = "disabled";
+
+			gmac0_mdio: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gmac0_mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <1>;
+				queue0 {};
+			};
+
+			gmac0_mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <1>;
+				queue0 {};
+			};
+
+			gmac0_stmmac_axi_setup: stmmac-axi-config {
+				snps,blen = <16 8 4 0 0 0 0>;
+				snps,rd_osr_lmt = <2>;
+				snps,wr_osr_lmt = <1>;
+			};
+		};
+
 		uart0: serial@4140000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04140000 0x100>;
-- 
2.50.0

