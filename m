Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE6D6F2F2
	for <sophgo@lists.linux.dev>; Mon, 23 Jun 2025 00:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750638666; cv=none; b=raj1iV+onbZQ2qbVxeDGagfnhC/1y35EUTiIYaYGcrPWTw8I+PbDw0f/Noz1cHdfbOEBxJVCS2VnQnybjXJ8SfwYUaZzOB+8VqsLlgydToGL8d4KujauxXuYbH++wnC4NBxI4LYzayhtB7a/wIAXJS4IfjxL4qBs8pEfTbuF0n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750638666; c=relaxed/simple;
	bh=28w6W3M5RoMtkXpLoM2r5jUmQHSYfM+9m3hFwUL1h6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OiEbVdu98wQwPXEYSYJqR47hvxyBEc5pCZwOGpL+JC+QlXVZFGcmuXTCaj0mf93xKEOZqkPvkih9/x+D0VSneVlA1IxuMvA7D6toqZ/Oneb7G8MWOvqpq9RUEnWYaYnL2HLvTilD953awONXhlobEyuvWj7elTzJQYSBjoV5wJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrY7ZUTZ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrY7ZUTZ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23636167afeso35492285ad.3
        for <sophgo@lists.linux.dev>; Sun, 22 Jun 2025 17:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750638664; x=1751243464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9G8EsFLPHcydSdSrFsRKcmtgOEiF67NnihrfLuZNDOk=;
        b=DrY7ZUTZpQOQYw+pzmGpgoAqqwi5b01MT0VBq8bVOXZlb9mt9WqGeZrtMp80eQaeZz
         Hd5bNEuP47lEC+lbf2vN24qHhH3SKwVN7+wZszYQ6mFiasmGShLXw97Q80egG46k46Tg
         uKwN0tlzwU7TnkU2fvNeIB1ALdfSA5FxnxUULLqk9dmm01kJkRub6uqy6s0kW9v9a0pl
         W5g2VpN+BQ4h1x80mrv4+yoT60UE7vNcDTmScDlUC6GBjtLhEZS7e6LtMLCBqVK8KVha
         se0hyolrDKPN6IzMQY1yfchfIs2uqCf1oU/OubOUKRBBFum4FGEsnlW4ZwefGo3qOdp0
         92Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750638664; x=1751243464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9G8EsFLPHcydSdSrFsRKcmtgOEiF67NnihrfLuZNDOk=;
        b=T58T6FyNBmlP5f6mk/StaHOpzCUez62xV6nL0A9rLLEGhTYzXzN4lK6Tru5aJFUQOz
         2Rd8cf3JkSNS83xrzt6GRbZcKkrCWm3yNEPd/TUdw6h3JBxA38BtinL88sk2y1/y58dr
         8N3qej+Isq23B2JXrA03K2RviWAALB8Qb8UoAz9oKFLiuvmUxIwzp4IRZW1MWfRObiTS
         QNC5uljkHLDm9pP66E0CiuYCHzn2Hkqr3FB/hMIolL0rKDCsJOa5jaIAniE1uZKD83wd
         NKsA6VK7oI8BWFDbBYBUQx31fl3VcAyYDJ0zSTusa4mPpNHsJ1yHpQCi2ctBfoTTpxlx
         GyWA==
X-Forwarded-Encrypted: i=1; AJvYcCWBMlMOgP5i2pXf2va4K0JErz+vgJ3IXHTh4hiJvrP7vzwvWmrAzBf9cvzBdSJcSdy8oRee7p0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJI08JaReLlT33Xry68M/Kq++FPUDI1ILxe+lfrYTvFNT/IEYr
	9LtimWCrMH8WTQM8cTFd1adwoxz4Oj1+i7mQSFZ8NNqAByvmyksqATW3
X-Gm-Gg: ASbGncuuexNjRRqSCKWTAp/KpNwQ7ZjzPcQBguqA4zv6t4jGxH1Okzb1hvfXxAk/ndh
	bYLNXOKA0QTPfVG3DrksYRy9gAzejFPnJ8TJuo0SZdQc9DofOz5wB2ediwkTG8xYqdau9NYt34U
	bI3c0WMQ1in3Mnedw77CGjYYYKZ9gk+WUsRw9M0wyqEGg+d7NGLe+ovJTNaqDTVLfzL7aeYZ2h+
	YPBmNSaa6mEEj8hGoTruN/yUlEpiLIvpJBnLKAJLvUS/OzFdh0CCwvqinBRp1mbIbiAD21/b+qM
	iH74y4oRvHb/TwqL8RCfSRcu8c2y7QzCFgh82bh91XX6u7b2LeFHxGDjGVQ44Q==
X-Google-Smtp-Source: AGHT+IH9nFpNJSObaAZYjqO9Xl+MXCzAAap0YDff4CiKEVwvDjlQgHiHJJhK3EZNLfia51iUp2PVwA==
X-Received: by 2002:a17:902:eb8a:b0:234:c86d:4572 with SMTP id d9443c01a7336-237d9a42e01mr143684805ad.30.1750638664409;
        Sun, 22 Jun 2025 17:31:04 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d8391494sm70195695ad.1.2025.06.22.17.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 17:31:04 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v2 2/4] riscv: dts: sophgo: Add ethernet device for cv18xx
Date: Mon, 23 Jun 2025 08:30:44 +0800
Message-ID: <20250623003049.574821-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623003049.574821-1-inochiama@gmail.com>
References: <20250623003049.574821-1-inochiama@gmail.com>
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

