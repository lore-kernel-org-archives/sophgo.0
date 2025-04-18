Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D07266EE7
	for <sophgo@lists.linux.dev>; Fri, 18 Apr 2025 02:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744941812; cv=none; b=oIKv1g9zwxUYsA17nb3McqTg8xnu+KotoU3fqpv8bWEYBrF/wqHs+bHhjJRzxq5IOwJeyPb4ATzfhrBjrDg6MY1ZOwKhslpFxEVnFsOBNrvq+NHJmzRYQCmeeX0NPrYD869usW6WjyC3XLb7Ry3RA+Eqf2MHxHdSZ/mQ3QPwOx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744941812; c=relaxed/simple;
	bh=H5q6z+kuaAQjDm2IXTAh6qpMlWwWMy8TFUHZl2eXCFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CHPddLpueMkdvAURClL0Bsx683eFD+XFhRcQnQJifyhMsSTuJ+xG0PHe6+vasZQpmNkrHz86+b+oyvzUjyfNeAarDQBaax6qzYBzjJLngZ4pgbqbgoeeeiFkOzoYoqvFyEtPdmR5Suki30ACkmwbIKZ5e956ovsZAZ1FC2IxA+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHyjWt28; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHyjWt28"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ed0cc5eca4so26025186d6.1
        for <sophgo@lists.linux.dev>; Thu, 17 Apr 2025 19:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744941810; x=1745546610; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QiJSTAombYT5YK5lOs7JKc1JprZJDm9gl9IdWPklRRU=;
        b=SHyjWt28PbSIofab6YjacCJqptrKVghuXmI/2z7KpvVXuE+LS92gyA3GWKCRLcqBeR
         ROVh6iQPhIrd2EoMS22LS8n5nAwSEWy0lwzm1GvRZFetobtmkMpedB8xVK+y7WSlwy+o
         tlilUHbtxRaTEBHJbWILtSn1ydI71KJuBQvPPFsNYxzzSAssameoq8BgMilMjiUU3Ozs
         myD++t2F91RlFSl6VLtDLQPvPBXOm9JpyZmTnvrC7j7xzeesZ+2gTPVLuHlQKAl11irP
         frOZCY7IpaIiAMKF+SesMEtzQMMIKnQ1eG2OJnXVEMTbnCHZWa7wJDTPGgZBQiDbKgJg
         96oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744941810; x=1745546610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiJSTAombYT5YK5lOs7JKc1JprZJDm9gl9IdWPklRRU=;
        b=JtlTPweEHVtqEPzMWqxnNuAc6KRC/kW+E/FVVIe3CjqHv+ZLPtv2+AxxXR48Pcjfp3
         b886IXpw045/mUD8fJXVzycgH6LljCh/KJ+tsZN85oDopfLXkK2Zzvoc/bj5q8oEOcKQ
         L+/uzUfpmGIIsrHzji8oAOngAG3bFihO0MSzj2P07/cE9UqT1T7/ZtWIqOyPZQSQNPtT
         fiTtF4I4yR5Yhg6qIEQJ7mobiGGN+F77I/ETSsMsaeBxdD/JiF2rqmEfxImh3ZnCGdgj
         HVwUZ6mPeeEeUjtzS/aT4lyMhbz/iYyPHA7chMkiqDu6itUxCMm+7S7oM9WQUQFmIeuz
         Mwbg==
X-Forwarded-Encrypted: i=1; AJvYcCXptdpWNM5UD/QZ+mZWdFAf9/KM5/T5GaMP5DnR23d1JhcrZkQ/S9nlat5O+kxvcZu1zx60GW8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9q2mD7I/ggQZUX8Gq5aYAel6UsDZBzb6b25e9QwJd+Vg0nXOD
	MfMhF+GugmSLeoRjq9BWsjPsuJFNGHLnUY/S2YEuoaiytG5zKndM
X-Gm-Gg: ASbGncu+MZvx1sbhs1y7eOE3xEvk6iNWK1WowglmiQDywyg2Mfkw2P2t7rTrH2eRLtD
	k12esT8W0FMAW1LTylkGJjWOBHHk7g3Xw4nqwxO4RIvoEBaHID3DC8NQXasyt+OYPJAEk0ADGDO
	KUUPyj5i44oxBXw86WKsvSDb/nm3l3eP7Pp0AkTVuCvVRne+eqn38J2zYnCG1sC7ktOJtIIcaU+
	GjgBMCLJT4AsOEmVKvspGN27foIc1QwvmuckbsOvdU0JUUFCGVz0S1HzF0su9oYTTUITZCriBk7
	9Mt5ddHLkwwPkPFD
X-Google-Smtp-Source: AGHT+IEB9i6YpWsKnz7rlzD/nehkmDd48Zhy2xDMAbnR9LFBTSUlrOuNsa3E9u2yLaM0AMch338igQ==
X-Received: by 2002:a05:6214:2686:b0:6e6:5f22:bb58 with SMTP id 6a1803df08f44-6f2c4ef8b65mr17022866d6.20.1744941810074;
        Thu, 17 Apr 2025 19:03:30 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f2c2bfd198sm5589856d6.71.2025.04.17.19.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 19:03:29 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 0/5] clk: sophgo: add SG2044 clock controller support
Date: Fri, 18 Apr 2025 10:03:19 +0800
Message-ID: <20250418020325.421257-1-inochiama@gmail.com>
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

Changed from v4:
1. patch 1,3: Applied Krzysztof's tag.
2. patch 1: fix header path in description.
3. patch 4: drop duplicated module alias.
4. patch 5: make sg2044_clk_desc_data const.

Changed from v3:
- https://lore.kernel.org/all/20250226232320.93791-1-inochiama@gmail.com
1. patch 1,2: Add top syscon binding and aux driver.
2. patch 4: Separate the syscon pll driver to a standalone one.
3. patch 4: use abs_diff to compare pll clock.
4. patch 4: remove unnecessary else.
5. patch 5: use clk_hw for parent clocks if possible.
6. patch 5: inline the header which is necessary.
7. patch 5: make common array as const.

Changed from v2:
- https://lore.kernel.org/all/20250204084439.1602440-1-inochiama@gmail.com/
1. Applied Chen Wang's tag.
2. patch 2: fix author mail infomation.

Changed from v1:
- https://lore.kernel.org/all/20241209082132.752775-1-inochiama@gmail.com/
1. patch 1: Applied Krzysztof's tag.
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
 drivers/clk/sophgo/clk-sg2044-pll.c           |  628 ++++++
 drivers/clk/sophgo/clk-sg2044.c               | 1812 +++++++++++++++++
 drivers/soc/Kconfig                           |    1 +
 drivers/soc/Makefile                          |    1 +
 drivers/soc/sophgo/Kconfig                    |   21 +
 drivers/soc/sophgo/Makefile                   |    3 +
 drivers/soc/sophgo/sg2044-topsys.c            |   45 +
 include/dt-bindings/clock/sophgo,sg2044-clk.h |  153 ++
 include/dt-bindings/clock/sophgo,sg2044-pll.h |   27 +
 13 files changed, 2860 insertions(+)
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

