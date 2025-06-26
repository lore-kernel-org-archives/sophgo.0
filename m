Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65B825D8FD
	for <sophgo@lists.linux.dev>; Thu, 26 Jun 2025 08:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750924878; cv=none; b=uDtvnN4W8S3zjHI6FxPG0oanRv8Kj7XZNBou5YlpSoyHUKKG3tgaLvSNgGMXq5hwbgl8roNbuBc6uUukkadl9GoGpqaTaMxYV5SH/Ls6IAEtF+0sRO3Yk6GY/As+b9JGZoswiQvOqJ3ID+107AlToKgKQAR2m4zv3Bwe0iRftpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750924878; c=relaxed/simple;
	bh=28w6W3M5RoMtkXpLoM2r5jUmQHSYfM+9m3hFwUL1h6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RsChHR3WJH16vhvKYUgq/H3EIHaX2UGcnLKHwsZQ99i+d8Ao+20a8+0s+SseDtKUPmO65+xDDJBLiYRvdRgJV0Aa/Krb0Kv1EWG3XS/WqBtP8dY6TWctLHJxZG8R9r9ydruu/rHWojOzahc7Ju8VmN1lLL596iCXuqL5mHKTMXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEO2HYuv; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEO2HYuv"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-747fc7506d4so767981b3a.0
        for <sophgo@lists.linux.dev>; Thu, 26 Jun 2025 01:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750924876; x=1751529676; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9G8EsFLPHcydSdSrFsRKcmtgOEiF67NnihrfLuZNDOk=;
        b=BEO2HYuvPf8cXDMF43RNM1GqtjadFHQ84JPZCgdyeaurMGm+SPz3vCQnsvdqaumu+l
         xujSslvbH7EQ/PUh+GuX7tMmcyUjmkQCaWyauxGeco6XBDcwRXYlVupM1tSO7YaMnxep
         sOHYyhfASDEcvNayvWNQSaiWl3OzGNbrCsOPJeRdhJ+ktvNggHpOd7eyQODJNcl3yHQx
         zW0FxOkHfZA9beFq2QzaT7GKKdl5l/O8MgpcBEVrBYFRuB5IH3c0Xn1nFkCEb2LkYo88
         DGBTxqhbsBAoDVZLRS886kP+AK0giovx5R3lFEQnKck34lLe3Rc7hweKvPoR3PisJwi5
         U/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750924876; x=1751529676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9G8EsFLPHcydSdSrFsRKcmtgOEiF67NnihrfLuZNDOk=;
        b=uIlEj85gQBNlI4HfSpZBPEUZU5OnpOWwK1T9+iIrZIor0e0YucbBgZEasgvZ2VGr6j
         pl1KwOQNZl/br2WTaMkxUCkTHsVFEKbf/Z2425mNExYl2cIxjVxSmUo3MqcbrE+uxiU8
         cMdhIH43dDIxB3N+zE+t2MZzJ0ZZduO7TUVi3xGyqaaGpTN3E0hsSk/FXlgkaeRUrbYL
         Zzf5uAafaAIyCtD+K9aQKDYma0GjKU8mgiHnOB+4mgZJ7wcGleAvqI41ueF1Jeh1/rlE
         0LWf6oEPI4wJQo9YeYlzITmjI2+Cexiz1I+fXiA/N9N0RON1jUSbzD7rOXXbF9Lr6EDQ
         2hFg==
X-Forwarded-Encrypted: i=1; AJvYcCWwTv8HNJIc6eL6ukLz4jVt564a8eaWgVfSAczprzLbQiObG4rIPJ6cC0esj9dW9jupLw5WIBk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyV9IB5DO0QSlg2DGlMcBTP2L43wfBaV3asgHYAHudokmTCBgsI
	hsU+pNm6bLmdLslR0o+3gkEM8j1Vmy3yXwZaLCBC3xO03tZrt/GRNzY0
X-Gm-Gg: ASbGncvN+i9mbaf+O6k+3g+46niOj3uWHsYW+wNaKOZyfXLYemIZyYWdECrAvS6hItm
	ldsXKGCilktkHn4Zv8jTiY2dKa/6UjsaF+fWeQn0mmR9vaU1Ybt6xnyLixumbuQDaWL+svjkCQm
	RQy0E7UaZBwzeC010syoQkuyqYWhofoQQKW7oCBa4/UFU1v2g8ShpZHmcZ/ANwjD052DWgt31mo
	ZIDJkC0iiDoeoCDBWZTX32H+RUkUyz0YQZebOL+1jlgwEVePyCwxjlmm8wUZOZlTfeqZhYt3ZDY
	H7pulj4WstO+O4zacFotqcGgN/fhunfDE9c/uqy1vLTvNJW/kd5x2ac/OyZypw==
X-Google-Smtp-Source: AGHT+IEeIBWKO8E5PCuCUGThQMx4lBDCQNancA7w0a6KHPfjh8T/RV1VkMb32vMY4xaiTzsYTWtccg==
X-Received: by 2002:a05:6a00:800a:b0:74a:e29c:2879 with SMTP id d2e1a72fcca58-74ae29c2a25mr3579898b3a.15.1750924875839;
        Thu, 26 Jun 2025 01:01:15 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74a9697817esm6108788b3a.124.2025.06.26.01.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:01:15 -0700 (PDT)
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
	Ze Huang <huangze@whut.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v3 2/4] riscv: dts: sophgo: Add ethernet device for cv18xx
Date: Thu, 26 Jun 2025 16:00:52 +0800
Message-ID: <20250626080056.325496-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250626080056.325496-1-inochiama@gmail.com>
References: <20250626080056.325496-1-inochiama@gmail.com>
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

