Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3AC219A95
	for <sophgo@lists.linux.dev>; Thu,  3 Jul 2025 02:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751508989; cv=none; b=cdM419ytQijuYSfyImE2FDLrZ6MkwOE/ilVYK9PxbeVA1G1V7c3fCrBhxZgKJN8/R7hflr2rFdIJIDNq7XGttd9yR2Y+MCVECCL1BKOmX3kxeuZ2Arumny0d+HVRJMLuf82Uy/KQcBPk2cuXsBr6xyPWutL0GlItTvxNeTT4cyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751508989; c=relaxed/simple;
	bh=R3+mZ/ahgSxUz73+rZU26mssIWzCroveyiCdoSoe6Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nvetv9lGu9DK/T1DulcQfBe8rO/MolsHu0qBwvKIh+izogivGvrJv0rnfyRAuU9LFi8vB/HW/hFxUydSX743i4V8mRQU+tKqKaPCUSWhI/ogC0lhv4lPv0oMMNbJs05qvgZsZ8eek5Pw8ULyIRHiBfOY9w3kuFuyFB8O5SwSDZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSpDwc+M; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSpDwc+M"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235ea292956so48236865ad.1
        for <sophgo@lists.linux.dev>; Wed, 02 Jul 2025 19:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751508987; x=1752113787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2YnPV5R9z5TbfIfu+epngB5XBVjG855v9YBWyemiuo=;
        b=kSpDwc+MgHyuYncjlIi56tcTj5Im5zGXagQht9iGbyoqcwOj/jf2VdPZKrgRHG8byB
         5ocuN0o2GCnE/pua1OlYRPUKrBq3tRS1RWGk0WNtBs/IeM8w4paocHG97Fd6g8h02+AK
         uRP1U6O0Pwx9g7ZwGyCgabsM8LUdlwIiwGBrt3oKSXMXOdiPsm+vOZK45sOvMnDqqbMk
         ejwr4LwA2+QcFgPMd0+ddPgKf33UyJhoZZrO+dlQ66kRjM21GK1Ii0FrbmhCbHOZReb8
         DKcJnqw/hxU5X6nvejh0YGbAfUCfXPOzHjpvJB6dXmLi4I/d70TjsnQGfX4+hGv1MqKm
         qCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751508987; x=1752113787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2YnPV5R9z5TbfIfu+epngB5XBVjG855v9YBWyemiuo=;
        b=ItzSRZy2uTYROjfppFLyVDSGB0FzknK/Nh8B/1BC7YyLdfBUoE2oqJIV6XsMmEHeIc
         oP0E4Eoz6AnLow8vCQLcM4mh8kWli4+LELpMQY+32O0oisVY1kcmLQlGpk3MZCR2x2Yq
         6hqCkYZayhIKZBHhcrKf7TdJwQBduBKbgTX4/da8S3Gs2JVWeluRKVRhvIQCOqBqC9qL
         m0vdavpI7v95Bwz8rkpDuGIVwN0fzpiOQEA8oP42ogcdQ5255ls0U3eux+5oVscPr4OF
         LJSzJcSGGZIXudCuam7CpB16mVZ15oZU6RSIS/FH5JyRtcFpaeQEirLBlR6fQvJ7Cd8S
         YLkw==
X-Forwarded-Encrypted: i=1; AJvYcCXjJf67H1G8qNwOwuWfnRwpk5FNK4fsOgerJuf57mY8vjEW+DQgwyx07cJLlYEFUhuBd/OVMJQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YypZWy8jgywH+PXCDl8WbwLrQtoIZStJKC380NxOF5ULPacrZmf
	MBkzowLL3d2aqvuWb5OrKLXiEUwCDKGsCH+ki18WY3S3YowAN2/gp84F
X-Gm-Gg: ASbGncv0u3V/EgMCib1Tx8zLTq1UQxh82BB5wsgVaMDl9zFhWg6itv+1xTEkGY6eCQJ
	VSoqYePomSadvVZan7YUu5sEHrQNN2W2bqGnALhcaTs7EMeowRcCXJ8G+vGOPD8QH5MDjYroKV7
	q3L03Jd0s6MIZKZ0fuivLqqho1xICyJq8+2LRhLn//YT7kNDoYmc9KOqFKixLult0vt2zQfDvXE
	rs2aHIq92YMWy138INz5gDsYlbbetTxfKviJZoZ+oH7UkXCSSwJbygG1Jw9GhtTCIt0A+jSKpfT
	SmdKX2Sub+R8HLg456+mHpAJ1+Cnqwhc8lUt9Y8LYspky4aQPVwZQXp1uu/pTdTzS5waJ5So
X-Google-Smtp-Source: AGHT+IHSEMW9eiJM2jAiH3yvHUFxCLUuLck/E/k8l3c6BfFYTR43saftR5J6mphdwx+U28fhcLnfZA==
X-Received: by 2002:a17:90b:4a4a:b0:313:db0b:75d7 with SMTP id 98e67ed59e1d1-31a90befeb3mr6810465a91.27.1751508986742;
        Wed, 02 Jul 2025 19:16:26 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31a9ccf86b3sm928863a91.30.2025.07.02.19.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 19:16:26 -0700 (PDT)
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
Subject: [PATCH 2/3] riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
Date: Thu,  3 Jul 2025 10:15:57 +0800
Message-ID: <20250703021600.125550-3-inochiama@gmail.com>
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

Add DT device node of mdio multiplexer device for cv18xx SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 7eecc67f896e..3a82cc40ea1a 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -31,6 +31,33 @@ rst: reset-controller@3003000 {
 			#reset-cells = <1>;
 		};
 
+		mdio: mdio@3009800 {
+			compatible = "mdio-mux-mmioreg", "mdio-mux";
+			reg = <0x3009800 0x4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mdio-parent-bus = <&gmac0_mdio>;
+			mux-mask = <0x80>;
+			status = "disabled";
+
+			internal_mdio: mdio@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+
+				internal_ephy: phy@0 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <1>;
+				};
+			};
+
+			external_mdio: mdio@80 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x80>;
+			};
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
@@ -196,6 +223,8 @@ gmac0: ethernet@4070000 {
 			clock-names = "stmmaceth", "ptp_ref";
 			interrupts = <SOC_PERIPHERAL_IRQ(15) IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
+			phy-handle = <&internal_ephy>;
+			phy-mode = "internal";
 			resets = <&rst RST_ETH0>;
 			reset-names = "stmmaceth";
 			rx-fifo-depth = <8192>;
-- 
2.50.0

