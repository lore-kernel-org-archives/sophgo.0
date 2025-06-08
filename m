Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991D42686A0
	for <sophgo@lists.linux.dev>; Sun,  8 Jun 2025 23:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425398; cv=none; b=oX62l+o79hiGzEIWyNcPq641Tnw2ekX2KkxmCBRMVq6T2H3umK9KvvrsoawHmULeQd5940Gr2504DpS3wj8ruaxJcSiYtRP67GL6K7cfP/nQAK/rLQMaffJpbhfN7CkiEW+vTM+2GgShv8L9gjJnz7ULmmDbf1HlSVOtE3+tS54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425398; c=relaxed/simple;
	bh=xapA1CHJjr1I1KXvM9NNUzE3Fb5YnoqfxPlZi8DGQqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SNf0v9muw/N1/I/lbhQ3zQxbGX0pXMOtORixCI5H9SAM28DT9yvbzPBy/kpJM/Vbk7LW7zW7CM9YnXDSpO0KtzYVN+ZlusquMjugIt827F/hp7lDfMYuWUVcqVsn64Ml4X+2SPRtIXmI1CODefdP6XFcdk6qa8YhQSeieltwsS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJAo34J7; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJAo34J7"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fad8b4c927so34633176d6.0
        for <sophgo@lists.linux.dev>; Sun, 08 Jun 2025 16:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425395; x=1750030195; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9s+OR8R49kht0oCLKo0xvH8vU3cihaJW7otzDR/klE=;
        b=EJAo34J7Via7BAssvhJVQqmDCWnB3H2z+ng/ouFW0rkp0XJzYMmmD5sDlU6Yn2JRCo
         CcrhjAyVz0BMuDvqFSeSVWHHkpu+O1YOs8N3Zh/wYHSlBTmd3sQ3FdjcBOve3tlCz1no
         Zp4sZzFQR2QePC3Cki7MhhqQsAU0Dd5pbHy8sfPSVfrFbka/s8fSKA7qGXQmtH+LrXx1
         2eTIMfdnb1ENfS2vDfhVyNUk/EvEgsGtfXcKAnIeA7ivFhaz3w6aBtxj5pSSe1rE412I
         usqZ1yZKQAdEoqb7yP7M/FctqRDgwXUDhwt2E2eDCJfyzefqUEhGs6u58RpTlKXykfFi
         l0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425395; x=1750030195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9s+OR8R49kht0oCLKo0xvH8vU3cihaJW7otzDR/klE=;
        b=q4jPLmreBSmV6Wb4B9zCZI7bNu3nN7XdRqP3dKHtgE8A6YuzktVfvDzlRKJwzL2/xF
         YJZDMB6catYYv0noEiyIjIhObMkhmhqB1fj/pOCNMEDp+tPTPDmN0gfeYwpMw4KA2UaT
         8U47QeXl6uLCbRstD1fEnLhuzWDVdlugYZMx7iDjk41gN9XsYOZY61P1ytBs3EOGQBAR
         iP8SaiihDW2IbIDpmJSsdNh5TOI+ODaJqLoiZnKJbuComYX3iyNyg/u9EbOcTfSA3nR5
         B53r2s4wlubsjpbr0dJ0PqBFDz0TwZUwmo1/VFNKCe3AcwQsff6HGUE9sbL6Oopz94bk
         E6EA==
X-Forwarded-Encrypted: i=1; AJvYcCVqhBhqJzUxi47jYbiOQXzEJm0L2k2a1j+IVzKuBp0fPt2GhHUqlKQUu8GcxKv4aZXwZowAwvY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwpGxlUWjJAmkBBB0A4zfSeQK3W2dRxXIEDieUL1aaliZmdkeE
	DOm9mYwixQnaemhGbdBsH0PzEiCLxib/BazKbCoFaAp0LIsYbyYKNS5c
X-Gm-Gg: ASbGnctYzpsHSmI3kMlsl6jwy7WV+mscz7iH8Xoae/b2PcMs2lubUfQXfQgVG2fBX1q
	qT6SjIDlD4LiJOY/KYG5G/sSRYhN3SCp7nDAAgo+LBexQUybyRZcvSg+BlEC7bWepSpU64IKDsb
	xQKvpvnl0l+AczJqSwErfOQxMSMFz1ow2gyC4FhociJaQju0JSZItWy9iX4/Z/k1AYnBtLIkcoF
	2mBK+aeWpt301s6TtPPCiHGiPnfYWkhm70G5lh6z8GVcBbZYh5UYA6QwPvIA7JFm3tKsS3SB2uJ
	faXhtRp7HNbjGRyvHUIQCLNdvcSBlsChd8QhVA==
X-Google-Smtp-Source: AGHT+IGVTE7AStEym8OCBDDJDYJzCP+mLeMVtHSUB2sGRL4PF3E9St8SXV/iVZLVAiLmOZXbB+WmAg==
X-Received: by 2002:a05:6214:d02:b0:6fa:cdc9:8aff with SMTP id 6a1803df08f44-6fb08f612c7mr204216496d6.25.1749425395577;
        Sun, 08 Jun 2025 16:29:55 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b1ce38sm44503256d6.68.2025.06.08.16.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:29:55 -0700 (PDT)
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
Subject: [PATCH 04/11] riscv: dts: sophgo: sg2044: Add I2C device
Date: Mon,  9 Jun 2025 07:28:28 +0800
Message-ID: <20250608232836.784737-5-inochiama@gmail.com>
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

The I2C controller of SG2044 is a standard Synopsys IP, with one
the ref clock is need.

Add I2C DT node for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 70d1096f959f..a25cbb78913d 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -91,6 +91,62 @@ uart3: serial@7030003000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@7040005000 {
+			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
+			reg = <0x70 0x40005000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <100000>;
+			clocks = <&clk CLK_GATE_APB_I2C>;
+			clock-names = "ref";
+			interrupt-parent = <&intc>;
+			interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@7040006000 {
+			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
+			reg = <0x70 0x40006000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <100000>;
+			clocks = <&clk CLK_GATE_APB_I2C>;
+			clock-names = "ref";
+			interrupt-parent = <&intc>;
+			interrupts = <32 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C1>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@7040007000 {
+			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
+			reg = <0x70 0x40007000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <100000>;
+			clocks = <&clk CLK_GATE_APB_I2C>;
+			clock-names = "ref";
+			interrupt-parent = <&intc>;
+			interrupts = <33 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C2>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@7040008000 {
+			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
+			reg = <0x70 0x40008000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <100000>;
+			clocks = <&clk CLK_GATE_APB_I2C>;
+			clock-names = "ref";
+			interrupt-parent = <&intc>;
+			interrupts = <34 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C3>;
+			status = "disabled";
+		};
+
 		gpio0: gpio@7040009000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x70 0x40009000 0x0 0x1000>;
-- 
2.49.0

