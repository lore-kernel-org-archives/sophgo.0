Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A169114F117
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744584336; cv=none; b=rYl3tG4zZpxKy+Vr2wfKNcyA0Re4U4sn4oCf5JfERQTPzmsMnYN0XWfHtuxMJX3Zc+bo1e99AXXc++nUqw3qIt5P+jTHkTmuk7/syaaaRBKHDo7nAjBMtKH9LaUUs4cNP/idd2TnW1wVcs7mnw/CRzxjaSU1EDw4TUMhIiH7Bz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744584336; c=relaxed/simple;
	bh=SdLZZ1h9MOoJBEvmI+iW761zRJgaR89JWkPra8d1nsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=thbjE1zV3nU1U/5qdpDlncdto8vRzFsJV0B1tyNQyiBQ49u/RUWmOTkEV4ONygCYYvxHa6ZX2ku/ZWkWdECMXCQqg1FiMX1VKe36NTVFU0WEH8yEWZp2BlK494X8DA04sNhRT6q1fvqxRpoJ+95qPs5v1GlzH30F7GhXkheOLSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emniWb4X; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emniWb4X"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c55500cf80so305837785a.1
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744584333; x=1745189133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1yEG8Rwh4CvxK6iCp6DxsJEufqiqUGIzvjMR5YWVKIw=;
        b=emniWb4XhXR9RkLF4HJHoUcrx1Qb4wks8JALl1qnS+uZRqiTJGuyklMetHaauV2zi+
         pc8nUzIfJgEEQ60Ub19v8UtaO1B6RKnD6ewvI8/zzjq6Rie47EM93xDZSeqOtB8FEfat
         dNBsgb/Vop79bg0B8h9tRuCssGbAB/7LHm7NYkZee7UGjfmlCaSjnjxDVXHqB1hVj1xn
         EasspcRrbsopiwvCFDO+gH4NIsGW8i2H9xmuFWcV1QoGJVTz/whhUjE8s0oDw3gVpi34
         15ly2gn6seVIUJjZOfR0KZCuLg/VRUr1JHULrqpTPONoYEwsn+iyHrzUByqg1QIa1GUw
         gnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744584333; x=1745189133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yEG8Rwh4CvxK6iCp6DxsJEufqiqUGIzvjMR5YWVKIw=;
        b=JVKscarQ18aQAQy0vZobdRxgmpl4A7SU+H0jo2zgvU7pDO0lDeQ0SSbEOtp7+7YL9I
         l7XYJHfMYA+C76JuG1+lzjxlL17TUAq4ggps1ELvF1zTabMCeLtCUFWNyWiySDGvn1jp
         L3hvF5Xz+Ld1sY2TChU0b/yspdah6EMl9d8GooAslS2cF4e18Q5kVPCcssXRQulEIexv
         Ov3L9jYocrvqj+sTyJqsoDUKw9k8AtNl/OA5+RRqmiYdgmns1D+bzTwqCirC6/btRzf2
         VPrSnF+E26MZ8eTXLDjcZcsku1JFCFSkz/M+Xslo5Uwl5xUYqNlP6sEdsWNVYtiqn0Ke
         EQOA==
X-Forwarded-Encrypted: i=1; AJvYcCW972TmggMaEo1zenlcGuiEcba6kHKwFipBjcuYi20+ZCTVAA7QMcCUanlcKz1czANX7a9Av+w=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBIH1C0yytgeQ7lnFgOHMdIWRuUJOQJpf2pXb27GK83sSVnLBd
	z3l8L28ZXL4KWzjx3iZEH+SqTU2bm7zhr6JQFKcl3BhFwQ2nb7Ft
X-Gm-Gg: ASbGncsyCQEfNl8ZeRya7y4/J7XB33xmDdEFLq58+SlvtJuRjHKsehNH6Hr0ZsBer1L
	yvviDikt89Ep2PSLrzpDXtXRdq3kFLrygDnC0umO2p9rIgvpYHGOi3Nso5yN0lWOeedWHqWYQ5O
	pRUG9TFP1JshMCDAlbGtcCbdDAL3nx48qeq7qhi99Z4J8yHOG3Ys7DYuV1fns+F5ElA+fytZUoU
	+FTP3GPkMEaLM3iL80spFU1USSnmJq1S9bzum06IM3LzxSmFcsUIBWbq1AKB89XaSsQ8HJq0x4s
	MX1ie58XIj2wgPrO
X-Google-Smtp-Source: AGHT+IFfZqLMdcGt4A1VgkvuhAuM9F2UXKgD0vPQ/x3qJW4kCkL5FkA1cOoFIYdzUiOewxsp1srBgQ==
X-Received: by 2002:a05:620a:4141:b0:7c5:b0b4:2cea with SMTP id af79cd13be357-7c7af1137f6mr1512437485a.38.1744584333493;
        Sun, 13 Apr 2025 15:45:33 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796eb15c24sm62806241cf.21.2025.04.13.15.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:45:33 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 0/5] clk: sophgo: add SG2044 clock controller support
Date: Mon, 14 Apr 2025 06:44:44 +0800
Message-ID: <20250413224450.67244-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock controller of SG2044 provides multiple clocks for various
IPs on the SoC, including PLL, mux, div and gates. As the PLL and
div have obvious changed and do not fit the framework of SG2042,
a new implement is provided to handle these.

Changed from v3:
- https://lore.kernel.org/all/20250226232320.93791-1-inochiama@gmail.com
1. patch 1,2: Add top syscon binding and aux driver.
2. patch 4: Separate the syscon pll driver to a standalone one.
3. patch 4: use abs_diff to compare pll clock.
4. patch 4: remove unnecessary else
5. patch 5: use clk_hw for parent clocks if possible.
6. patch 5: inline the header which is necessary.
7. patch 5: make common array as const.

Changed from v2:
- https://lore.kernel.org/all/20250204084439.1602440-1-inochiama@gmail.com/
1. Applied Chen Wang's tag
2. patch 2: fix author mail infomation

Changed from v1:
- https://lore.kernel.org/all/20241209082132.752775-1-inochiama@gmail.com/
1. patch 1: Applied Krzysztof's tag
2. patch 2: Fix the build warning from bot.

Inochi Amaoto (5):
  dt-bindings: soc: sophgo: Add SG2044 top syscon device
  soc: sophgo: sg2044: Add support for SG2044 TOP syscon device
  dt-bindings: clock: sophgo: add clock controller for SG2044
  clk: sophgo: Add PLL clock controller support for SG2044 SoC
  clk: sophgo: Add clock controller support for SG2044 SoC

 .../bindings/clock/sophgo,sg2044-clk.yaml     |   99 +
 .../soc/sophgo/sophgo,sg2044-top-syscon.yaml  |   49 +
 drivers/clk/sophgo/Kconfig                    |   19 +
 drivers/clk/sophgo/Makefile                   |    2 +
 drivers/clk/sophgo/clk-sg2044-pll.c           |  629 ++++++
 drivers/clk/sophgo/clk-sg2044.c               | 1812 +++++++++++++++++
 drivers/soc/Kconfig                           |    1 +
 drivers/soc/Makefile                          |    1 +
 drivers/soc/sophgo/Kconfig                    |   21 +
 drivers/soc/sophgo/Makefile                   |    3 +
 drivers/soc/sophgo/sg2044-topsys.c            |   45 +
 include/dt-bindings/clock/sophgo,sg2044-clk.h |  153 ++
 include/dt-bindings/clock/sophgo,sg2044-pll.h |   27 +
 13 files changed, 2861 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2044-top-syscon.yaml
 create mode 100644 drivers/clk/sophgo/clk-sg2044-pll.c
 create mode 100644 drivers/clk/sophgo/clk-sg2044.c
 create mode 100644 drivers/soc/sophgo/Kconfig
 create mode 100644 drivers/soc/sophgo/Makefile
 create mode 100644 drivers/soc/sophgo/sg2044-topsys.c
 create mode 100644 include/dt-bindings/clock/sophgo,sg2044-clk.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2044-pll.h

--
2.49.0

