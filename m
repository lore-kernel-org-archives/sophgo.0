Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87731E9B31
	for <sophgo@lists.linux.dev>; Tue,  8 Jul 2025 06:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751957210; cv=none; b=G92lnjqedWHLXWb08mre+FoJhBEgF7g6+tn/vmoUPxOsP4F5c0OQY2FQqYSCIEre6uhuF7xuVWDdkJXYWz5ifRLEv+5X7iF7LjZi49E8B9zbKaZLY2BD7itgxW+3RihDgvtBCuwly6D9ixUi6oBKoXQvAkipHtzy3aB8XMYmtZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751957210; c=relaxed/simple;
	bh=/cApN7+nPLX4ympFWe9LXoIFG9iaQZgbTZy3sGnfWz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g73Yp2anRWAUiq6p46hFzNigW8H7RQyZ1WGp7eMVTJveCKTdwnICxuP1VB2AdmirJ7cqBwbC3sUaB28P6r/yj53g9dsWAKxygfgwThy9Cfjxq5h1i+OPUIeXWNJu+md+qzsB7Mtw05ilWpO61t4L9rg2m4ImOv2X6iUhgpUb+Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnJfza4n; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnJfza4n"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b31d489a76dso3270070a12.1
        for <sophgo@lists.linux.dev>; Mon, 07 Jul 2025 23:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751957208; x=1752562008; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=awAK1sQvEZGu9RSuFaWauBkV5Ie3EeA43euQnu2ZDvY=;
        b=gnJfza4nbWpeP9CSXn/LTXvWhF5Y6c3rVuiyeceljOXNePMIKe8mWg/oyr8LzSf6Fz
         yHvTL7+wMQZ+Hf4FhI359Nk5lecGa2mlDiPm+5esHo9lXHQv76vut+/9s+wPNTc84yRA
         DMrhhnFKYDljOlug8PflGdxPDV3n4BUIxFn1lTHK8rVsU32zF+pJKP08jiGDFJ263XB1
         LFI/bb9JH/Jp5C5MQNc8S1zlsiNxpi6XrfVlEY5z7nwUc7baP3UKlLgY+6lej7KL2jDP
         dieQgA+9dtbFOYtnqJ1+A0fDoI2N1y3yhCYjPzYpLHP16+RQJdrJPd6QJr0u9lvaxq8k
         ASIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751957208; x=1752562008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awAK1sQvEZGu9RSuFaWauBkV5Ie3EeA43euQnu2ZDvY=;
        b=WUJQGp0jSeaxSGrMxA0wJgxoUExSgWkxY7EeXYutzyO1NrkZYSIbaXUcmtLgkNueQ3
         Wye/Ada5sMY1ufH24JGCvupo5wpRl9iIg1Gs+fwNhAfR1yCQcZvBHy3OHxIhWydbUM0o
         Fi8JFW4wGhVGAqzcVeLneT0j2DJ/9LmQ6G9Hdr2lnTLUE3ufo2OKeIz11MQNvucM1nbV
         FU030GKthGVoHVi8fjMJP2rFve2a59mFJHDhFFgJjoa00Mf56Y7cWgxakWez6akVlKEW
         ZEgSabglWxhnMB7ViwgUbNmD5khXXIzMvD/5knG0YF9z3yQj0l/P2kp5XgVAvA8mr7Um
         0M0A==
X-Forwarded-Encrypted: i=1; AJvYcCUrCGMUg5X9RmYDfJZEvwVSuSkCqtmqnZqm0/5cdxe7y+VqgJZ6a4eQOrIjX62Ur0da741nPWk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMwZeKEtIQycobkufhXdfh+NhQGPoHxlPIgbGR1J9fKiGxqkj4
	dCrJdsPsTsTSjybMY5A1Cjy+6QOkPOt0R3IlmKvlv+X+GNyzGXkqVBw6
X-Gm-Gg: ASbGncuo4ERDU2+GJLwL8T4LVhWUREwmn0TrC4bO7qcYHPihzlEN19LZnTrP8rMN+Hi
	4UflicU0iHgVAVd73VLGMMrT/HbgBIZRuVvGohCjfhM+vJb6YUv5+Zlut4azySoGB9GSkqrV5Cm
	hUvwHJHYYDav6Oq2qj/n3YH4E5mvQKjgiaPoC0ASBEbe5V5E1cDeoXOpmfV1pQ2+w41r0y1HetV
	R3nYc8jmWsFYN+s9n0VmtFGuIxgDR6/ebENryD/KbXGlvI5fHXB+nejF5OYGCp6FFZdtUuMed9X
	km/qGavvtqXnn5VKZZ9S+4TOpBs0z4iFFtvdjcPy1EOYHWSbo6otaeDF4YLsHQ==
X-Google-Smtp-Source: AGHT+IHNx4OiWoCq7M9t3p40CvKjBGEYTQs9/RQVmrqVzX0hKDNozKjkB+NwYNXyY7dlbQecei9Awg==
X-Received: by 2002:a17:90b:2ed0:b0:311:f30b:c21 with SMTP id 98e67ed59e1d1-31aadd9fd46mr18022165a91.26.1751957208011;
        Mon, 07 Jul 2025 23:46:48 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23c8457e15fsm103684335ad.154.2025.07.07.23.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:46:47 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Guo Ren <guoren@kernel.org>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH v2] riscv: dts: sophgo: add ethernet GMAC device for sg2042
Date: Tue,  8 Jul 2025 14:46:25 +0800
Message-ID: <20250708064627.509363-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ethernet GMAC device node for the sg2042.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
Require the ethernet patch series for functional device:
https://lore.kernel.org/all/20250708064052.507094-1-inochiama@gmail.com/

Real board dts patch:
https://lore.kernel.org/linux-riscv/cover.1751700954.git.rabenda.cn@gmail.com/

Change from v1:
- https://lore.kernel.org/all/20250506093256.1107770-1-inochiama@gmail.com
1. separate from the original series and add dependency id
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 61 ++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 85636d1798f1..b3e4d3c18fdc 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -569,6 +569,67 @@ spi1: spi@7040005000 {
 			status = "disabled";
 		};

+		gmac0: ethernet@7040026000 {
+			compatible = "sophgo,sg2042-dwmac", "snps,dwmac-5.00a";
+			reg = <0x70 0x40026000 0x0 0x4000>;
+			clocks = <&clkgen GATE_CLK_AXI_ETH0>,
+				 <&clkgen GATE_CLK_PTP_REF_I_ETH0>,
+				 <&clkgen GATE_CLK_TX_ETH0>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			dma-noncoherent;
+			interrupt-parent = <&intc>;
+			interrupts = <132 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			resets = <&rstgen RST_ETH0>;
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
 		emmc: mmc@704002a000 {
 			compatible = "sophgo,sg2042-dwcmshc";
 			reg = <0x70 0x4002a000 0x0 0x1000>;

base-commit: cc6a9fb055e446e76a23867e42f12c4eff44eb00
prerequisite-patch-id: 7a82e319b011e5d0486a6ef4216d931d671c9f53
prerequisite-patch-id: 5a30fb99ec483c1f5a8dca97df862c3a042c9027
prerequisite-patch-id: e0da79790a934916d9fc39c18e8e98c9596d27ab
--
2.50.0

