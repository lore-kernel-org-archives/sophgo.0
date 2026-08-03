Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548E63803D0
	for <sophgo@lists.linux.dev>; Mon,  3 Aug 2026 16:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785774881; cv=none; b=KoX5/HNEws9SGF3R5oyhV62f/ZhbLcrsuSCpi0H7/EtgkejseI6bHxSfsJqEeKK02Ti6gMkTXED5lYUs06m5F7+Eefie7xxdCuAsaaD/oJII0RA5/PorJh04yGHP17sF1hhzA/2SjyJ/ourzj37Ac6xs8uTpMS/MYOKSmZ9fxvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785774881; c=relaxed/simple;
	bh=EEVP9pVu3z+hlSGNX14rsUHc7/USklIJ0bXaAo53PIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cmzB/plW6ougBtghibOu6E0MI/ERtiatawIrAh3NUvaqOke338tmtfVEgEtcc+GyXMWJbwKbJyRAdeQIJRKCOWu/3k4Np+ZsDmas73q2fh8ua2Uug7JuY9RDEM/moTsxM7fT9wK/yQ5wDLbFg4xBcuvqHSY2VFY+0tA4PaStTc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8T2XwEz; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8T2XwEz"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbe4c537ad6so73556a12.0
        for <sophgo@lists.linux.dev>; Mon, 03 Aug 2026 09:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785774880; x=1786379680; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipT5exq6LUV0S+KzcId/vjoUA8Xp4TlUp/KpBpmvGT4=;
        b=G8T2XwEzEnxnJ8sD/WH2EBCNoyQkylCDL7s9xE7BwEtKqVeJNwLBRF4G6ShMQmmeaR
         zU2QXIftP+nqkliVW9IiMIGc+iOaNz3iDKO4hbNwdy2TSeaDpE/iXKr7rfd2ernjNhyr
         1iTOfTwtEWhFG9/AwYoyn5rUL5macLcyr5zk/YozX40agVIXvlwhQ8BqcDXI7xk068wM
         suRCXyFdJvkRNDkqImy/oxNZre3TKmSSm8W8bS4Z37msP4mGU1Rrp/tWErRsemv+75mX
         E7IfWpaIoedJTix7cfN/a+r/mtg3MtFs1aqcIybCQMN1yAxskm2Sb1lwiwO7O4Lnpzeu
         Z3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785774880; x=1786379680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipT5exq6LUV0S+KzcId/vjoUA8Xp4TlUp/KpBpmvGT4=;
        b=C4Q/rtk280titwq6O8bHCoGudaMG7uEzzG12UGbrOeo862/4k/DacPCoH41j/YzycB
         AsPLPLFFaTCz8UHBoDyv7+Xh899NO4h0YsJ4O73Pio8oJmx251aFxXAzxSmPqOAu831i
         eDfqbl9FbLU7MqdtjKvtLyrsF6rAU26RqEKcXK+cBqGIVo4pT8sIDrPR92x9FT/CUo7M
         tRaNmyZu0drD1jxHgs6lr3qvig4lo2DrdJCLxuPZk8D51NPw2CpGPn3glVCq4pfPX7gz
         SY4vanDJ5POFaiB95RvHTTlhTNymuWcv9hMwE9P/hT80iJPGyxPT/eGPUcKmF04pReWA
         YUPw==
X-Forwarded-Encrypted: i=1; AHgh+RoMzbSV6aYHXtwAGWe0ya3NNU//+zfTojezG5WrMmuqztvCA4iN042ahMBI/E+coUl5gMDgFxM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJJlu1RrCRl2/2mAmc8uJ+zwLK5AtNgl1qm2tX/aKybgW1lgMh
	o+pQrRuHFWJjBird8WStn4XH5r4b03PeyNs0oVAArLP2SVxYRxIibWVM
X-Gm-Gg: AR+sD10Uywc1QwzkOsjYx0z73Q1hbXyFqEJkx1x2ddtyDUb5Q2f2bYXAgR688ANLqx4
	Xon9rG4zrrtxPiCdY33SPD9tOqAyrjqA6p954soKFTsoH6M7wtJzP7W5jnlUHn8lrcmafygGHpT
	LhPl5Yblb1F9xZJMKOc1k796rZAnXWJJbqDFd1LR8sB8uGFUPP/OU7j4/x8FHLQtkiJ/ocKB/Rw
	3bJLtyLXhOvwiSExGQPsP3pt2z9tSDyXsXUGIOTj9PE6D4vXSfNAuga9xrA1ZpNM24B9ekKy40j
	S4/t8WesldZX5mHzZLd6JNL8v76O8UCfOmcbrT8aIH+bX2PLMeCz+Z06/d2K7fGsMs5gGPethUM
	3PKeDkbK7e/aXZwFOHX9clT29hkiQklJ3AA+roAg3Xqk+a/6LCfoSXJNO2ejDyVJCtaO8RNjiZf
	eC5Kul1WkPb9/u9oULYJSx1lL0TqxIf/cKP1xbr+q7jQ3ASKAAgguMZMBx1clHsEhbHoA00KPO5
	29ci9k0SztdEb/mnAmgsmBlmEzH7RfuN+SQFvP9grt7LG65E1TKM7FzKChffgmIH7uygG2I6okY
	gQRsubNEVlaCP90kdRPcOMI=
X-Received: by 2002:a17:903:1aa3:b0:2cf:ca85:57e2 with SMTP id d9443c01a7336-2d05219bb79mr145306785ad.1.1785774879604;
        Mon, 03 Aug 2026 09:34:39 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae99af1sm41180545ad.33.2026.08.03.09.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:34:38 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: chen.wang@linux.dev,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
Date: Tue,  4 Aug 2026 00:34:24 +0800
Message-ID: <20260803163427.74445-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The internal EPHY node is named "phy@0" while its reg property is <1>.
The unit-address should match the first entry of the reg property, but
this is not checked by dtc for MDIO buses. The kernel confirms the PHY
is indeed at address 1:

  eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]

Rename the node to ethernet-phy@1, which also follows the common naming
convention for ethernet PHY nodes.

Fixes: ba1abacc57cb ("riscv: dts: sophgo: Add mdio multiplexer device for cv18xx")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ec3bf305274a..cf672cc6b935 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -71,7 +71,7 @@ internal_mdio: mdio@0 {
 				#size-cells = <0>;
 				reg = <0>;
 
-				internal_ephy: phy@0 {
+				internal_ephy: phy@1 {
 					compatible = "ethernet-phy-ieee802.3-c22";
 					reg = <1>;
 				};
-- 
2.43.0

