Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42611991CB
	for <sophgo@lists.linux.dev>; Tue,  1 Jul 2025 01:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751332681; cv=none; b=A2uPdjsMEe1arX0FzebIynOToN8LM4Xxb1di6Vo44k78KVCUpz+hgbwWZq1kBmy/Cx8QL54aarm7O6iXoHxwAsc2XgI5hweTh980kBx3fnOsaJm+eYWPBXGDcjntk5r2ckGQOvUvWYKki1ch9UNhWyfB/yPn8VYUH3EM9FVVc1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751332681; c=relaxed/simple;
	bh=R3+mZ/ahgSxUz73+rZU26mssIWzCroveyiCdoSoe6Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rn5EZkVTafLAzQp0YU2n55meOqLLUOKwoAZbTI5NHvP1EzrOrDJIuEqhk1LB9DNYqJwIZSE/rzG4MvKv/UuwzUS2IV8VLb2Ztg34ZGW8oaUes/jiIaDK4YcUigQePZVWaOxJveoMble6ZRZ+ZhbBZxrygkhe2KAVZR4zbMOKyYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8DdNswB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8DdNswB"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2353a2bc210so23341355ad.2
        for <sophgo@lists.linux.dev>; Mon, 30 Jun 2025 18:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751332679; x=1751937479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2YnPV5R9z5TbfIfu+epngB5XBVjG855v9YBWyemiuo=;
        b=N8DdNswBCoRs8RfqNyv+PPdEuQuKe/Zo9hltbrxKCnfwAYkP3H8MIZLSCfvBRYMaFw
         +wyLJ+TEjPYjKBpvnqdBV5ggwQ6FJUTJdFBUADNSUgLgSljOQVyatXYCba9J3xwdwb+R
         dpnWEMei5P0zMzdfHuMeK20jXYAMAj3mOtrvSo4wti3MiTGUSd5P9Q2lHV2HbDjkCHZr
         oY/up+gsFivsUFr3xbCAsUdEOuzJhHWqCGI+6fo3oOcHL1CbY8lOgXlaQ8S4ohOTFhji
         bOGw7Hk3DbBBkFQI+NBaTidWAEjTBPWeaAXOcxlwge7YgfXglGiYStO3V9+1PVBWs6Bz
         +JcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751332679; x=1751937479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2YnPV5R9z5TbfIfu+epngB5XBVjG855v9YBWyemiuo=;
        b=wIJXencFiNEq+5Kap12QwdLDALQfk//cK8KnK8flFiarrsNPEwZUcXxT0lgNc7fyeR
         C4Xgst412PR0IHJbJLUiOh3Tv23AvlAsJrnPJK2sm/7SjO1tUeLMM3qqyXyPAqoPCmHz
         DRVVmo8348LlYoo/RLQ8j6oWbRoRq/72bqcpBbR4NQYWrqHfJdBrThBZiLbBmkgw0BP1
         1HpcDBE5hqIBtX1aKdOLGN1NTMI+D8/6JDc0zUkGdIPG0oDQM0fsc6Gv9DVdnerBfyvU
         wchVSAD+4VFpclX3wkS8GRbfGrj2MUPbUSPkOnpMWh9EPBXerDToBB6sBejtI5RmtF+i
         BgVg==
X-Forwarded-Encrypted: i=1; AJvYcCVTT8C6ZfeV20kli6bWTaiaJtxVYQTx9I37E6A6fKLYYxDIKqLGVKIYrWj80LwC9oMybg/bBTo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1mGjaBCTgcVkjPtQuBuip/jgcQTniLse0OkSMnVcTaIRp/N2t
	UbdUXLoUTeSitPS+xTCFNX6KxSDBIBC1SV88TqyGwZQKhxv9PFL3Hzvn
X-Gm-Gg: ASbGncvyl6CHrL7fV6A+M99bw8FuXuR/vssbMU8f5M+DerICorHWLcOEL8doOSm7Om7
	Fj91gB6g7RR7il15cln70DXPPqMqWEh4RK9GNJtmW7pey8tziCIOL1i8lZyvYmiBg8Qcbgw3Ihq
	N5NKtW/U4o1RSeSFk6GH6MD8QW+ORIjKduDyvjlXct33MFVnJGP81SOHmCHV6W25i1YpVpzgfjm
	BMOHBfbmAy7BGAFQ9CMEYqTqf4RA/xeojiwpTKBHUJFWXzdB/E0S9AvtqJXMIO3M6ErHZV6BCkh
	hiO+YLvuVabuAAXLJDnLUuEC8EQle/5d1szNH+suBXG3+Nf1+2Xvb2JYYHOwYw==
X-Google-Smtp-Source: AGHT+IEPm2Op+KWjehC59VQnKMDkBVgZ/YpPUASGIk3XgNcj6OU/ub8JMgiDzUUFauKHKc2q4eWCfg==
X-Received: by 2002:a17:903:b86:b0:235:c9a7:d5f5 with SMTP id d9443c01a7336-23ac3cf5f89mr243983855ad.13.1751332679204;
        Mon, 30 Jun 2025 18:17:59 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb2f0b91sm99104865ad.53.2025.06.30.18.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 18:17:58 -0700 (PDT)
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
Subject: [PATCH net-next RFC v4 3/4] riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
Date: Tue,  1 Jul 2025 09:17:28 +0800
Message-ID: <20250701011730.136002-4-inochiama@gmail.com>
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

