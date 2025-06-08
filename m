Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5C026A1DE
	for <sophgo@lists.linux.dev>; Sun,  8 Jun 2025 23:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425413; cv=none; b=Yjqnj+fO3JF+QzCsH98nWu5aeRu+N98g0cJUIfyzuWFkvMB5Rs0PuLoIwhWhSss50BQcgyz3zsD1AAyKCq33VlLUYDcMaAs7mtTJoxow84oU1vTFPPcrAKy7Es/1xm4luRIkAJNkFi8ImXq+ThN/licUYCC2xznJ7rZ2gyPfuRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425413; c=relaxed/simple;
	bh=5VUqSYlSo/Buy2lm3tgc3Swi8jf9sGGImqhcq3u+iGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FOyaRZsypvHH4ps/hvcP4Hx939oh7yMNBbonx0MpXWHiCi2BPLSv5ixX0cNaLVEgYUWP1nhZ3vWWfCcZX9PpwXMyFhiRvjM8H8YdcQJbbr1aQqJ479OoHwbuNpygQIeyJOLkxPfRfciq6ANR1Eq/MhoKtjqTA6Wkw8QEquwUx0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3Ss5SPi; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3Ss5SPi"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7cadd46eb07so413270285a.3
        for <sophgo@lists.linux.dev>; Sun, 08 Jun 2025 16:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425410; x=1750030210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmpEekK1exJPpnoGidNY1S75lqWDRnDWJRIusLvDb6g=;
        b=e3Ss5SPiswGzq9w5WJBYeizxWpK7Wbxi5M/Gf6nHEkQoo+WYvh3TdHh9wQkmXc3jCX
         cXj/07/RnBnVIExOVPjbNUA+BZCaa6rTKBFQ82KsM18mG0KVtAVJCaPENI2U8eDa5oHE
         tm3ZLbaD97qvlUz7PVwv8cHAXAFeV4D1d+T48E4HI7uza/pwENrUgiHwnWAHoFj190x/
         Gzrhl5hYDfazfBG+YadBxAFwxhXpOE3zj33wS7hPw45zlvGChdCeAhMa77TSNsI6qpd6
         6M3JYhTgixRAMXc0hJI+R798CgT9aM032lFWoGui8bDTzsYTawER31Ksz/VkxsH3mBu8
         SQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425410; x=1750030210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmpEekK1exJPpnoGidNY1S75lqWDRnDWJRIusLvDb6g=;
        b=HW3N4m5muTbdFnvXQtdF0cWiIGwK087JuCw06PcQdUtzSSTNwLQeIfJe3I3chjkDUj
         N0hsHuZI2+eahfqOMjSbu5mKE2BZe2RTAEiHjSq24wuOTJZVDaMFpoW1X2YCbyU1gg3N
         lah2FYn26Dd4tYHs1Ot7+mW02ply62lpaOawx9WL2S26mFlxdOPL+Hv6L4Y0ubWSHO1A
         qH5aXeIcLOTLpHs+JaxIVrnoo5EMsCFmmdmTc2UaaSsMwqsSLaTLpquLmEZ2utWxIv4n
         7mLAELAs+iOkgY+bnKncpsRCbxTDB37Vl6pd2qZq6/skkQpjTjr7DFS42Px/tkBqFfcn
         n5sA==
X-Forwarded-Encrypted: i=1; AJvYcCUYE9PLW+EjsFNMllaeG1OowJN94tjmHzEjJiPRCjFDd/m8gAmup2qojIdZguJV0MIUCPOphr8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZlAYc2dJfqDnRoEu3/bZzauzYWyRO4308+xVeylAk8TeFgZX6
	hHAeSXogFZciONBaiHNUBkX8/ryPBc8Q/r4EeZRd5gmowwTRPf2G22iU
X-Gm-Gg: ASbGncuEseYp1uuf4kcDN8IBpMVyPfoWAfnVVwlBPLWivxfmuPYOIQeEpzMHM39tP/S
	vIggJkwupPMQ0nEgg4PFvlVa25XN9hZy+CLOv/AbtXbYVr2ou43Ioack+tYDVjWODAoepmrgaCT
	pweZrb5ah6U/0u+uWyCsb0J3thivTitWQGNREaEHWnbsON/OlKKKVlJubrkVE0/V5j8Sv3EYF5Z
	WHhor8L+vMTGIhWvZtSnC1yHs1ko82ldAT7RnebCpL4s7pBoec7Cz+she0VEXNm3fS5aBynGPsr
	7Dp9CxdfAn3dydLQOME1wS50anf3DV5sLSuXZA==
X-Google-Smtp-Source: AGHT+IH4mdTeanbw7zBF+9/nISjw3MNAkAWHlSCzX4O+dmLV8Xf9YTcpy4gwDq/IqG6kdY05P5pZ0Q==
X-Received: by 2002:a05:620a:4112:b0:7cd:1d87:6c79 with SMTP id af79cd13be357-7d2298eba35mr1783805685a.53.1749425409927;
        Sun, 08 Jun 2025 16:30:09 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a53745esm466605285a.46.2025.06.08.16.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:30:09 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 08/11] riscv: dts: sophgo: sg2044: Add ethernet control device
Date: Mon,  9 Jun 2025 07:28:32 +0800
Message-ID: <20250608232836.784737-9-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ethernet control node for sg2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts | 17 +++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        | 62 +++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index 75564b2719cd..01340f21848f 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -36,6 +36,23 @@ &emmc {
 	status = "okay";
 };
 
+&gmac0 {
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	mdio {
+		phy0: phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&porta 28 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+			rx-internal-delay-ps = <2050>;
+		};
+	};
+};
+
 &i2c1 {
 	status = "okay";
 
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 6067901cde1e..bbf4191fb87d 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -111,6 +111,68 @@ uart3: serial@7030003000 {
 			status = "disabled";
 		};
 
+		gmac0: ethernet@7030006000 {
+			compatible = "sophgo,sg2044-dwmac", "snps,dwmac-5.30a";
+			reg = <0x70 0x30006000 0x0 0x4000>;
+			clocks = <&clk CLK_GATE_AXI_ETH0>,
+				 <&clk CLK_GATE_PTP_REF_I_ETH0>,
+				 <&clk CLK_GATE_TX_ETH0>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			dma-noncoherent;
+			interrupt-parent = <&intc>;
+			interrupts = <296 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			resets = <&rst RST_ETH0>;
+			reset-names = "stmmaceth";
+			snps,multicast-filter-bins = <0>;
+			snps,perfect-filter-entries = <1>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <32>;
+			snps,rxpbl = <32>;
+			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+			snps,axi-config = <&gmac0_stmmac_axi_setup>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gmac0_mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <8>;
+				snps,rx-sched-wsp;
+				queue0 {};
+				queue1 {};
+				queue2 {};
+				queue3 {};
+				queue4 {};
+				queue5 {};
+				queue6 {};
+				queue7 {};
+			};
+
+			gmac0_mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <8>;
+				queue0 {};
+				queue1 {};
+				queue2 {};
+				queue3 {};
+				queue4 {};
+				queue5 {};
+				queue6 {};
+				queue7 {};
+			};
+
+			gmac0_stmmac_axi_setup: stmmac-axi-config {
+				snps,blen = <16 8 4 0 0 0 0>;
+				snps,wr_osr_lmt = <1>;
+				snps,rd_osr_lmt = <2>;
+			};
+		};
+
 		emmc: mmc@703000a000 {
 			compatible = "sophgo,sg2044-dwcmshc", "sophgo,sg2042-dwcmshc";
 			reg = <0x70 0x3000a000 0x0 0x1000>;
-- 
2.49.0

