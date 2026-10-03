Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC23EEB3
	for <sophgo@lists.linux.dev>; Sat,  3 Oct 2026 08:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791017209; cv=none; b=FhINKcko6umkZlnSX8/Nd7VY9H/Af7E5Ewd5had2l2aoILSafJYxjj/kMljf+V7RxdY0tqXiSP8twH3CK9M0te4yTsSQUBjc66LP/xVNeQ/CjnptE3vGaJMb+U7wzcfJHKu2LaOq0UuiAhmevvWu7WQW0BSULQKleyIeZGtdlG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791017209; c=relaxed/simple;
	bh=qyBCYS+MPERrvSOjCZVI+1tSKoaEhtcRPA6ygVGDDxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QDQ6bcEEO34iVuzV/8M4lH05QeyDdH9fd0SytOJBSRZnVj8u1pHuOgNE7l4YhvARyU+fZgpFQZoH1bTHnYJ3Z2mpSZwZY3pUFOryEBH+Kx8fHIL+kErW33z85CIgiJgbcLb8p/2dgO3F+MyhUP4h2e8+0KuNMYmPEO2V3uwTQR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8B82nSK; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8B82nSK"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cca1f026cfeso65857a12.3
        for <sophgo@lists.linux.dev>; Sat, 03 Oct 2026 01:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791017205; x=1791622005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2X6RfdoRZCSwn03+0O701g2gXtz+LDb8LKtxHTTyDg=;
        b=k8B82nSKObCCShZy81KvDgsgQegHhLPZuCoo5bBBRrB4NMfcTTxfQZUBjhCNtgs++0
         JsYDZGYguBc2tge8GBfW1hsSEy3jL2leMXf5wheoWc1TOzlrUtbkRMSbQua7P+5mTL6f
         aSlJOJiPK0YtDva+VHg7khICSve4/hOO7rC4ThDU5AJKRwrVZaqANnqI1ddH1LckptuQ
         cdXAvEPH0bgcId9fAa+rYTCfUUWZQ8XO3P/ec9oGTx1f2p16f/JrzeLzrnce5kFTvyTK
         nnLMxYObcHRRhQbz5bSbpCxe6jIOPPZIQL18WGmkbdIFd+fL1X5MA3cfqIRUsMzGqO+q
         WGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791017205; x=1791622005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2X6RfdoRZCSwn03+0O701g2gXtz+LDb8LKtxHTTyDg=;
        b=wh0RFnOb05spZ0GXfiSVsC5hkwpqTJ/qk1dQdPaVDdez+5FlvoU2qtAdxVQFRuxG84
         9v/p4iJKgnLjOKd/9k4swUe6CBuL8ZzHRGbFLFOtYFD90u6/PPyAtjwMSV+luW6s1iJ3
         8JopHYL8wtJhkNZ0jKE7KgGthK0nNH2ySWcdZ/xsr9pYSvK0nNY1O+ZE1FY4CBoGZE3s
         ih/QUvNfUteia1DrC51k8w/YXgq4CZjw5VbyubyeOFE6JHG+E1HU8rhT7GstE6bWVEF7
         tQzI+LCpHsP91/p3QbVK6saSu+bQGMLtvUXJLZhRI54MFpA9SLNkfQa39CmUHVO0GuMR
         EpzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxI/UEk24wXlp2c5oheGqME2FgI/gHkaWzwlPbhwHmoXOyOA9CRLmkqTXysntDJKx5IuaHPfe4=@lists.linux.dev
X-Gm-Message-State: AFq9FYKdlNTI5MUzsMYVpSl6v3crhAbjmyvIThVUr1ba1pxhv/A23p4o
	bS8gJn6eV4bH98lQHwA02zWy5P6LHcmeNeS7AB3U3KxphgaDxdRwyop4
X-Gm-Gg: AYBFou22wkHwTyx3UdY04EVzUUagb0RPOtx0HSpnU4tEnjc+TY6bQ1O3fFnr5RqHER3
	HXsq/mPgdT/L/nWn3C83i8Gere5DRPjv+JtpLJlVaMhqV+vp8KIwzZ6f5hx9QwuHFbUTwmRMku1
	ngYDHeaEY6FO19hLs1Pm27hHRvTy9hA5Gj1U5vZefRCyxdH18fxyQY08y2zR1NwFM8SjYGgrdO2
	x6hSjO1Os4fuP08xjpmNDM/EdpV2SVkTKfOqfzzGcVixPf/W7VteKrYMUFjFkCK7YznMyJqhvZD
	nsyPbOpkEtjKpUGKZJVTOcxvIYbZpM+p62S1MPNFk4Ncn9F/bq6KyuRxFKWhKZ3EeMtZuXlWFJv
	/6GQa7kNEsqykJii1qKSfnsfW17e/D2GRET8Si8gadCeic/2w/rCY1t/qcy2prLR3hvyGsQll6F
	mBf+AdAxb5vg1EGTAYXX4cUXU1wE2Ypezf8L6S4Jx/KwnsDeK46aOnVHoLh8Ud3Bs7ryA49L+EN
	rxiXnQTcYLJ7QpYWdWEB0DG/RsdRq75egu3i4BUq3BwD8YDadTP6DDL0+7XpGz+QL77m8c=
X-Received: by 2002:a17:90b:2804:b0:39e:3728:3b11 with SMTP id 98e67ed59e1d1-3a6ce6dc25dmr7643738a91.3.1791017204760;
        Sat, 03 Oct 2026 01:46:44 -0700 (PDT)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4664ebsm2208033a91.7.2026.10.03.01.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 01:46:44 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 1/2] riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
Date: Sat,  3 Oct 2026 16:46:25 +0800
Message-ID: <20261003084627.353899-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003084627.353899-1-chenyou910331@gmail.com>
References: <20261003084627.353899-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SG2002 has an internal 10/100 Ethernet PHY, but on the Milk-V Duo
256M the Ethernet signals only reach the RJ45 connector on the optional
USB & Ethernet IO board. The MAC (gmac0) and the MDIO multiplexer used
to reach the internal PHY are already described in cv180x.dtsi but are
disabled, and they cannot be enabled in the board devicetree because
without the IO board the same pins may be used as GPIO.

Add an overlay that enables them.

Tested on Milk-V Duo 256M with the USB & Ethernet IO board: the link
comes up at 100Mbps/Full, the interface gets an address via DHCP and
passes traffic in both directions. Without the overlay, eth0 does not
appear.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile             |  3 +++
 .../dts/sophgo/sg2002-milkv-duo256m-eth.dtso    | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index d5c80d4ff005..49639cb0888b 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -4,6 +4,9 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
+sg2002-milkv-duo256m-eth-dtbs := sg2002-milkv-duo256m.dtb sg2002-milkv-duo256m-eth.dtbo
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
new file mode 100644
index 000000000000..cc93746d932c
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Enable ethernet on Milk-V Duo 256M with the USB & Ethernet IO board.
+ *
+ * Copyright (c) 2026, Chen-Yu Yeh <chenyou910331@gmail.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gmac0 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
-- 
2.43.0

