Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2BC82864
	for <sophgo@lists.linux.dev>; Mon, 23 Jun 2025 00:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750638669; cv=none; b=jwF9laumFZ3V4q4xIc6ev1m0o6wXkz86WtKR1XYeebUSnsCJFlqZ9cfSUW0YgAg9qgAAvE1YnAPa7UPToqt/yPnpDERChEbGfWVnvpQ9VBDmg0DZU4/MzaAZuHh6j4/psBz6RtozjGp1sq9tIeyCl4UlPmRcVAiC9KL5nyodtcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750638669; c=relaxed/simple;
	bh=MPRNEeeXHuI3gjyT14JRFPyjJQDWqxmEottnPMANd+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uq+y6rAOPjSPvkuXK6k3h1xVvo0WlwkG7+bFOa/V94LfIcdVwsZzmEwr/62f2lTaYGPUhtCQpRv95ID4CTyJEKTiW3HIYB1Qa10CVcyuEAaNQfOGZpkAkroNZBgQ+iv/V06HRVyD2hDiQgFewhyuEqnv/2fsETKspxdnjHOJpQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWvlWaJj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWvlWaJj"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235ef62066eso47395385ad.3
        for <sophgo@lists.linux.dev>; Sun, 22 Jun 2025 17:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750638668; x=1751243468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3DJOTF+zABOGXS6R+n2iHwCpUm4ATi4UcMKKDrEt9s=;
        b=jWvlWaJjVYP72cJfE3CqSR0IXLACItzLHMeKjZ1LZrUERb0qtI9JLBNwxdD8/AQqHN
         S4ydMLLSqhASfLVnObkyu3lxJbFQo7OBtzjHgPyLL1CplHtQkpDQsy0aiDaXaiU2sEqh
         Q+RHXowPBbdfUUzSMrw1O4/Y/7FQYEB787orjG24ejjjRuq8RC0jw5HgIYl6rN2otsKf
         rp8zP/2YcJOPm/0Q6fIa2yRdfxgQH6YQdZWpb6SYN2XOh8p2AY6HBs8IDC3XdakCPlQZ
         fKAjfsyWzbVEkRTDOc4QQxdkVm7RczA7F+9HLtr6WbfhFSnYXK2ikTOb/joowH97UvWD
         zhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750638668; x=1751243468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3DJOTF+zABOGXS6R+n2iHwCpUm4ATi4UcMKKDrEt9s=;
        b=j3qjOwG84q1G2vBex8aJSwithmEGk2WEm1YFlmmpbJprQ06+tPDqAj8QkCvXz7ftBW
         sinVsSHPxp4y0eqEPaufdme2aK7Eyzk+dJeTQJjn4bYy4diDkRMnf/FCvQln7jq8dIwp
         7F0R8UOXjkHJ8lr7MpxP1hb6RUtqK0vLVkZtWUeBgZ4SJ/ZZNmQEcOuf3PQmfOAzaGZK
         B6vWsRndtpJfUTYpAVcoTqEQBYyRa8gL1RZKlAe6IwSKnfIqB08EsEWudt7A5ckrnqLm
         hxerRq6DNXJlZ5q8OSSMNl/HsKXKzmBjsA+3h4cYB8IgRfzbV0RdYjDjOxK4ENAGGwgv
         nA7g==
X-Forwarded-Encrypted: i=1; AJvYcCU4hhkth6fsjPdHKZVSc1ys8nc1Pwj9z6LvBH+Qn9+91E2k13SIrfX+HChVuW0MaEQk5ME9OL4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0d6ImihyUG6lhkBjp17UOK32MpE9hG+wWs5puZ/WwFwYZbcFp
	AjbT4MDkRZV4TzpVa2DNjEXX+K4Cw609Z5Mahtu/98iOFrMHeCKF+zJs
X-Gm-Gg: ASbGncueEtgxpv3zxyxZmn8/qA6GIhseF9hWtzfUmTbY0G7CKhvHW1vn1cI2W8FdpI0
	mCQcVkXn4uu+oNqXFknvCRshxJpznOGN3jvrN/3moEyif6WGTtYRL4YN1L8UxSq00/iLo0MF6sw
	S0x9pLXPYn094Ltg254XbsBaR92QNBl9yURkQie6SNsOruRjtjIU4tZV5schYzYN7Oaf2Emms9v
	DYVqu8feVZv8zY7Juhrwjy8dKyoHXf7gr7wwo9fmT5U27CD39IwADpqHYidGOKHEr6N32BPRMbx
	KF6W+4WJx+cipDcnazH15hJlLyLXszoDH8Zz+NwllH06tNc80+8v79fxcCQFqw==
X-Google-Smtp-Source: AGHT+IEPurWQUxaEWPyN4+mm9MSHoAtR/TSkQSrkdqynb1L9lfATLd6vGy5CZaBedpCYL0fvbN+EeQ==
X-Received: by 2002:a17:903:2305:b0:233:ab04:27a with SMTP id d9443c01a7336-237d9a746b0mr174827965ad.53.1750638667818;
        Sun, 22 Jun 2025 17:31:07 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d86101e0sm68637875ad.96.2025.06.22.17.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 17:31:07 -0700 (PDT)
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
Subject: [PATCH net-next RFC v2 3/4] riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
Date: Mon, 23 Jun 2025 08:30:45 +0800
Message-ID: <20250623003049.574821-4-inochiama@gmail.com>
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

Add DT device node of mdio multiplexer device for cv18xx SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 7eecc67f896e..01deb27a95b6 100644
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
+			external_mdio: mdio@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x80>;
+			};
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
-- 
2.50.0

