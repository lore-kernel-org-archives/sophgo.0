Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DBB25B2EB
	for <sophgo@lists.linux.dev>; Thu, 26 Jun 2025 08:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750924881; cv=none; b=lRFAqYUJ+9FCvu5lULolsjiV2HKMK34yuHhybnLtfUg3TJqyqDeCfD1QkIgOo61pYprTD9xwYGPBx12cChbjNW3JCU00OA8plLoR0cDXkkEQ8Y7a2mu17WCsK/Ax/OBHyVu4IoPln86xdBKTsW9ucHYokM0r/jUtqlUzMudmzjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750924881; c=relaxed/simple;
	bh=fj+xPee/HF/mBDPxlPDL/LzsHQQkwlx0t0JHpZFbg4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jo3hATh6AmO5ja+DSLkY8tkTNJLJk1BRdUdHi5I5XhzsJ2WH7KrRNJ02xdW9yFvI813qQN7mfQp8J5QAiVBNjtDJC1Kbv27cf0mGongZdkX1uoPEVb7ujHH/srlIKSBJHDv3O3EHJW+H1QRjoYoU5TBFncm9v34vArPy05AlhmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clgdOBwN; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clgdOBwN"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234fcadde3eso11285575ad.0
        for <sophgo@lists.linux.dev>; Thu, 26 Jun 2025 01:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750924879; x=1751529679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFiZF96xm8hXJ6qEv7hyvXI+A/Fh5sgECxhLDPhb+6c=;
        b=clgdOBwN25FfVml3h+ZmRmBDfQZd2tGDXNjZ2C+fo5dFj602vC/TuQ9jQqo341dlsT
         HbLE1/veBV/xLEK8jgwcXYX9ay1+Jk3UEJq6ibUn5Zh1vaWMPsLKU0fR7BPSsCFZ0btY
         OP3nNN0lg1Mojithr2Eld9uelQMTFRW3vZlBGdAa8rWxRBKtRzc6tq3HZrw+DBoTGFJ7
         lXR3gfqvsA/bSL9gp5yHri17aLcx16UJc9XkOALsQxTF6ndLFCIgP1pEHPVG9cOtJF2d
         YyjQchWBi3a9kSGJjgEN9As1/zAjr/dBX6sfpIr4pGQ/V9bKV4Jg/lTe7rE5f6sKiOrn
         fwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750924879; x=1751529679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFiZF96xm8hXJ6qEv7hyvXI+A/Fh5sgECxhLDPhb+6c=;
        b=eL5HQ+a0qaTtENTbhpYpu3c9QsCD5r2GuqouF4VRrHlbplJcja3UKobiQacoKp2ld2
         IwI+BPGyg49+Sb1IewBX7UxvQFWcOB4KVeAlSERHucXEfIQn5W+zVZiOLKe0/frfllBG
         WoKQRhIHukXuEsL3LYx5ce7qcEdXzzb1I5TTBaMc7wYBce45P/1sYFlnn+H0vQQaZuIs
         BCXl5Rbn28SqNK3O+XhJBhYkAGSp0Jm32Sph1dN5OE0LGwXDNxWjZXj/Ch6JI1rwbAw1
         GiBZxlAzOUWIayGKd7PJ/jTfAuwPWCUaJhJiX3wcu2QTuWAlEQdBeflRmzUV1enSSuYV
         OESg==
X-Forwarded-Encrypted: i=1; AJvYcCXVRdfxG7UiYtFrfcHBy9s2Aobk+3mgubYwTlxYsFv2NtHxvel8Rlk8e/691itiJrY8bq+HRT4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpKRAjSvkBQt0520mtW1M5S7KwWF4irhRX91fMOX37EAzwvVT9
	u8VmicuVk53qbwiEky77RJW7NrxfCQ1228oEL5eiRGPvpfDdFOVbhcaO
X-Gm-Gg: ASbGncvWzT7S/NFIY2PJgA6QFFaCpphDx96moU0sfhtmMqh01sCkS9Heab9tTnD8Mhl
	AfaIgKmnu43kbPVDqlAE5bMOi7hhU6kto0PU0yWINdIFUj26R9lCE5Qo3WA6RKCheQ1awr3fsMv
	06NLAKry/+OyAvJ4hywmY6A+2DNZG9CckzaE9fNVsVp8RdJdyehJzmXXa05hROwZTwcDh6zplEn
	CKDrnQ9RxshCBPGMSMqDBJ5DrqZJJuHb+C9pPdFPpBWC3DxXd+DGW1HfgoU/GcTtiVbBuEjrPzR
	PlePjQPDXHkol5+QTlMCoa0oXj5tuIq/Os3xu8SHeR8epxsM8ud5RJ9pAJISoA==
X-Google-Smtp-Source: AGHT+IEa1Hm8a3WI+XQ+UR9EdbEMJuz6B0Te5cpmW0w6UUDcyQFF377cGhIUp8q+Q++YcoVyKJYXMg==
X-Received: by 2002:a17:903:22d1:b0:235:1706:1ff6 with SMTP id d9443c01a7336-23823e51556mr102958175ad.0.1750924879294;
        Thu, 26 Jun 2025 01:01:19 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d8393249sm149406985ad.14.2025.06.26.01.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:01:18 -0700 (PDT)
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
Subject: [PATCH net-next RFC v3 3/4] riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
Date: Thu, 26 Jun 2025 16:00:53 +0800
Message-ID: <20250626080056.325496-4-inochiama@gmail.com>
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

Add DT device node of mdio multiplexer device for cv18xx SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 7eecc67f896e..4c7335ff93a1 100644
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
+					reg = <0>;
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

