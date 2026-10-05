Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D48945C6F6
	for <sophgo@lists.linux.dev>; Mon,  5 Oct 2026 09:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193104; cv=none; b=hl73FVsu87bl2/Ur5Zn0NlCHIw5PfO+RcSogYtsz0dLyNnro2mKcMq0RpaW8MQ43hfEv3gPaHCmN7ro4VS4W6SLCDEY/FigmvzNTJ4Tpk/FdIinhmduaNRg4QUB4Itt0wGEu9/lUAb81caULiTCLwYxfx9jng1bO/vpNJOzYMD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193104; c=relaxed/simple;
	bh=TptV6f88hXIUqbtGbW4D705hFvtXNKkk+IwN1eoGE0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFSjQb58j3ppYrx3hEqOHHr3BrtkUO0kbHcn+lEQoC0s/LvL+A1Yf/Sl6ITD0uALPCNu0iGxAbHydL0daXpedMwOCOV6DNKQr4EFEbdws6OYXdy5HKQHh6dPXoxAuxn0AtQA9DHBveqHXb1kb6504bxikBLu7r7+SpwqSCNXsT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVTFqyil; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVTFqyil"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39e57ee1cb0so120187a91.0
        for <sophgo@lists.linux.dev>; Mon, 05 Oct 2026 02:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193089; x=1791797889; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TduQRpu05Uu8Yeb3OgsHJqQKUhZPES0toI3gcywm3MI=;
        b=lVTFqyileWc5WmnwxxLd9//jmYiVIBgJfxzjh1HcKEAgZ2/u3Eo6LMa0c2rDlwQrvH
         7Td3otYyesETsn0QzW9reXzEjhQcYImd0vVC2qXdGAYXRo9tEmxzJaQwMixqIjNiIwvR
         4dMLtIzKxTosOfIN9OPetyEjvD05L3rFLDMGwoXlbD7rSTlVNqXl6uhudhKRun6p2YTi
         F9iI8yWj6dycdZho+r1iYHYZtM9CE/jzI5UD2/mEeiPum7iUGAzkCeotgKXKi6EVcSqJ
         jVY1VgnR0rKwmITqfI/NI4xS+brYRFSufMgaBuRcWXrnU6n/leABA+2cRpKfOgPDGHXN
         7PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193089; x=1791797889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TduQRpu05Uu8Yeb3OgsHJqQKUhZPES0toI3gcywm3MI=;
        b=kUp9H2DXolyYeK0l3nXxJ2QMG13VyXDUOcHHwPisEnhGegvxJu7nmTjqLqMk8TCRs0
         Sp94V0pVQ5c6aC3WiRW2218+G2U6aTjZ/ys3THymFKldxQa8KnUvlW0a840MhHbz7PAF
         5mcSV3s6F1fOZmpj7tfCi90I/3gjmt5CdiZoEkHQeoT1RWFlwK+uK4/cg74UZ3OxUrQa
         c/01KSmjuMUTYaGE75A0HNLMw93hk2SGzesYGXYNV+ZWCyihXpPOHwMXgANXgyvXQIzy
         bLb9exmS/npWT5DifrEZhcH62E3QpiUfUZp8ZKIWuLhvGLaSKZB95h8movdGcNQAmRIe
         Jy+Q==
X-Forwarded-Encrypted: i=1; AKwUvByZHS5UzQJtM585CMaYb5B5bIWg5RgRuIlH9O3iVQujQI4hoOBFQf10gdfOF+htiTEXgzcIdUQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYKqEdLG8gVxF+3lXR9OKVhZfKrHDVb/gvxrcPBhskO6ZpXLYzjk
	e9JO7UCNropqKzMRDM6KFlCP5t0zpxbqQD2Gs5VkZWIH7wcPHw6a3h11
X-Gm-Gg: AYBFou1+oF0kAhVECi3VAexSnvJ2wsGVPg7/v0V1tK/+Zsk6jaFTmAOtw0LPwHAQgRD
	RiiOQ6z1LxCNJNP7sEJyYqxZme9UiGEqhYmx8geAugm9KGYwY3hotVIIfhdfSRg7l90L1Ds9xD5
	3IboYpXrNc2ZnnhvA54+crcyO+eHDSP0raF3Z7R0SZNp7jGC7sXDUm9IOPuSICJLX5zGA+H2qoj
	yQREMkIK+L5O2cCiOaudqOQpb+ZMxNzX9CunE3AMY96YW8EaUwCMwi+mWtFMwNKxYiFGgxWv0Mp
	QtHLPd45HEa3v7A6ikPLS6oO7MclSXAxogiw4Nj561WWIH4yKbDhL2e+f4FebFf8/OL+ty5b61L
	DB7w6duJFd6VpDDhqil0I/nX4TWkmvwtGuRe0EiBP4K0zQLGupxeajXYrGvD3fzvORuvkv+F7e2
	61nWHwWPL3pvZiMcAzZQuhNsbIzVzfwcJ0oEGomMgrWcI4W1dQk9IFXjrpeiyZmS9Hkgcumwgkv
	xgmNhzrPWjqOOjfDASqnMOOM8W6/NuxzkO9hOO9jOQqopItOH3nkzEQJw==
X-Received: by 2002:a17:90b:2f48:b0:3a0:e7ef:bc81 with SMTP id 98e67ed59e1d1-3a6ce7c94edmr14943856a91.3.1791193089049;
        Mon, 05 Oct 2026 02:38:09 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e42026fsm10568067a91.3.2026.10.05.02.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:38:07 -0700 (PDT)
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
Subject: [PATCH v3 1/2] riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
Date: Mon,  5 Oct 2026 17:37:48 +0800
Message-ID: <20261005093749.645014-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005093749.645014-1-chenyou910331@gmail.com>
References: <20261005093749.645014-1-chenyou910331@gmail.com>
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

Reviewed-by: Hiago De Franco <hfranco@baylibre.com>
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

