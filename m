Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F8C19DF4D
	for <sophgo@lists.linux.dev>; Tue,  1 Jul 2025 01:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751332678; cv=none; b=C6Exzw1LVK/kmB91Di05jLlkkzt7QBlIfDSafDJHWVQTlp8UMQ4aUDR6Og1Epg8C0w2+ybeexYW7fH/qMvPHSllcUcX8Vc/zkUHSdtAq8P+l40zJ1uzUzaw6ZKfi1RVUV1Ym1SYe6eSQCv7SCiJCcgpGrY8BYYwix2fBUjIltdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751332678; c=relaxed/simple;
	bh=28w6W3M5RoMtkXpLoM2r5jUmQHSYfM+9m3hFwUL1h6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SLZvjNn+8HxBPd9S3r0pOO74bWnQcEKtAHJSjVwVSuugwoOy3vreugq823sAnorithBZt21WqQ23PqIBU37ThS3QCz9cZJ4knvDE2Q9zwgGyAtQxy6YB5MRdnDlI8nkdMdxE7/Xw/xk6qELuhobMDaPxJHT7QiS4mBcYf59/Qkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNBoGKjy; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNBoGKjy"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b31d578e774so5762000a12.1
        for <sophgo@lists.linux.dev>; Mon, 30 Jun 2025 18:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751332676; x=1751937476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9G8EsFLPHcydSdSrFsRKcmtgOEiF67NnihrfLuZNDOk=;
        b=aNBoGKjyHmNdclktiSR2Q3QjPBpzV/XEjcaCNtd15MkJosybbvOfeNbvtJXPaUibmj
         dEm1eLngGTbpZhowoTKOEC9qPCBelA8F3CGbrPnWijeHUgcLXWzEQ/L5Mtq6j4tkGbmw
         N8uEpoTNi+sbQnkxa0lT8YL/Kf/lbaExHW6p23AxYKNbY83ehAFgM6vhoI32557zTEhu
         p5PEwP96XbVXArHSic8VaHNrJwS2WHRfQ1Pr5KDj1CspDh4lnXbuHnNSd/aqO3ekOJkf
         f7Q8Dzl2JLXMqA3IX+nCFJaJjOuXUJYUAcsKkaadSUvE/sgMO5K0UzW2alHCPINVju0e
         ZCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751332676; x=1751937476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9G8EsFLPHcydSdSrFsRKcmtgOEiF67NnihrfLuZNDOk=;
        b=hW9b24Jsr+Nclq8yB2jvhc2dqCNxUP99ZsshQxTNptEJdxHvLkS8919hnr0v5dEXTC
         9XPbTwOKzSE3Z+kBQVDe159YAnz0e4oyhpk7CifjPpngEd72kncLr0eQ6njufp56b0an
         fah3/sJuU0uS+muU7nbXt9yWqBRA20nXCHI32Gmnxc9MKESw/8hm2gCevhGzZUhljQ3E
         cQlUA/Zm1TYUhDtQNpsD8vQKJjRj0sAsSJhgoxr5SLXqp8OLNlmW3b9ObEYcTuT+I9t6
         ahP0rcgsMtOhlv/tmuu/+1XZIq8EczN7vccvYBDYM+UpLggkcYDWVAJ7uDUzwUiAbN4P
         EmaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoFP0vmKA/JLHdiqVDlD7OLcRvUF8WDnOn9l49W9ih6NkoaQfBPL7IgOwSpjP4LNmh469Wxbk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTbiXxdCwV/XfUdA+EQmgkOycqZHxCeA7oIoRmlBfNbSzuAB+9
	Kuk2E+X05Yt32Spo6KSEZLSLpFhaO/dz7DOGWyJAJu45BKNazrDKjyKQTBWNPcSFVXc=
X-Gm-Gg: ASbGnct0dwbMxXgUC/V+/UE1q3UnjiccftrHKeFnHY4GFdotdxTLKym1VrYdRB6Y90B
	BoivxbfY/UHPuir00cKFzYXRSi0TDiO9D7893+g/RQ/nSy1szhCfX5k9CF3yIOQ7gVYYMgzR4hA
	jB3GtWhzgSvxRvwFJeZV0/8wUr+E1dmEWwIlqDkjWCL50WSR5HAlnjNAKXDSGQklcJvmnvzhBmi
	BRzmKd0bnXeJGLYQBt6FCl6xGvR9CfcHGfvEmBDUoQk3ZDaosDxuvh06FAAYfd7rrJgw+FIJxXp
	LELScaEKAYpzKYYLJYuELEOhxPcKPUnvGqxNUQCcU2VGATG8AcseN0qavve+OOagSm0YpMyr
X-Google-Smtp-Source: AGHT+IFM9lShrZ0gDhqDAmlJO1Tr5XQLrwGfLFH9sgY8PsJvx+UPrYvYdI+o7sjOwSyPkHhG0w+dDg==
X-Received: by 2002:a17:90b:5150:b0:313:d342:448c with SMTP id 98e67ed59e1d1-31939b6400bmr2096527a91.17.1751332676004;
        Mon, 30 Jun 2025 18:17:56 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb2e325bsm93040705ad.29.2025.06.30.18.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 18:17:55 -0700 (PDT)
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
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v4 2/4] riscv: dts: sophgo: Add ethernet device for cv18xx
Date: Tue,  1 Jul 2025 09:17:27 +0800
Message-ID: <20250701011730.136002-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701011730.136002-1-inochiama@gmail.com>
References: <20250701011730.136002-1-inochiama@gmail.com>
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

