Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803989;
	b=D3ui4M8ayml4umlwLM9Vh0lf/WhQk4jBTk8WeBkGssDZyL4H1JDyBzUMKkZEjUG158RJ
	 QoCb3V3AtxnU61ZMzMa/7ulWi6zFv6ztlXfFFUVMEXDlt02vJtvczbA7XVVJJvUZ7G5uY
	 yRZ6/HJZ7AcgTGj60sThFWcG8cJHN/DdFW9swA/si22cAn99R9TsDCRLotmvRAFjbCWrR
	 3uvNbcK+skMX9yvyP80LNTnqNzAkDBBQP4jJcLVy9wZrKFjH7UyiMG9AfP2lTkjVgSmI/
	 LgunVd6dD/CLrU+P+fT/IFwk+1jBOi/CeBNRDOXsO/2Ni20k9Kx1r8p3VUc/raA1uPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dyfF4YBPoL5q5wee8LTCF2WwSqTvhH9a016gXbmqQ6k=;
	b=mdHqJdr8WsV9GTqr42lP/i5hXC3vkw67Bna7KfOhWN5SwmlJaV+W+hBqzk0Zm/GnoQut
	 xPu/DVJYd3G5rXGCpCgP+Nvv8zzJt150m1jpgmy5G83lDNyaubVQAROVBqQWlMRP0WvRf
	 IEcg00KA2Bi95zdDXO90w0qztgnI7yVtOpuh/ZyMdFmKBFkEgCYTxjckySjc33LKO72XX
	 sMMgup/wS0YyHVmG+jUddZGYzyTIbcPaSEN65k3wbDpMCP5QBi0Kfbo/69Yf1M8rAEa0F
	 UYDCxZfeQIfFcWv5Of81DVeC9b8CP1ffzsq04T2Xweh+z4PIUVujVmSWp7dq3kFGyYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cc5DO6sa;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8511606A328
	for <sophgo@lists.linux.dev>; Wed,  4 Nov 2026 14:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8511606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cc5DO6sa
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67c00f291e1so62610d50.1
        for <sophgo@lists.linux.dev>; Wed, 04 Nov 2026 06:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793803988; x=1794408788; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyfF4YBPoL5q5wee8LTCF2WwSqTvhH9a016gXbmqQ6k=;
        b=cc5DO6saAfEeVhHdxQ5TdkAFiwSphBgaB1H34Znu8XXouB9ryQDAui/sKHm1fLL/Uw
         f9jh4rJw7miqYjQeOXn+5LMe6TnGwYXc3whbpxwRmYqOyl4N9r1FHwvyTecOMPi+FrFb
         5m+R5W9gZxf0rDVDBpiF2LwTkNbm0Tfv/IcerqeiwYSUcNny3/jDgK+qYye5+257HmJe
         ORhok1YVSeH1xoZD3BzmB27UHq+5yPzatCCKOnEji83gBOuHyNS3hlm4ZSXVbQJ/0bGf
         WrlMPEMNPkp2VdahD8LQtxpU302YGR59Hxkkrfgp3Q/36idhoq8sG1TNLdyQTGT5YsQL
         Rrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803988; x=1794408788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dyfF4YBPoL5q5wee8LTCF2WwSqTvhH9a016gXbmqQ6k=;
        b=PGLJU5fg+IjPp6WbfaCTWdidt69OXqqdVyza92jZ4tM2dmv7vMFYRIJMRsNb2+tftl
         RoRU+iDkKtBqlwHV1LAcuVQilU3rjkJDpW4NXrFHWgiyy+Mm0BBU7Bkk2GaLPXew3B1x
         szg/QRcpRKVw1xnF6Ynx6zwSj/HhcJvTMK3BwbhYZIoh1caIBPTp8CqCP1QC43x2OQNc
         49LR7M7z8/sYn+CcxgZZeDIZbfVZRVe+hrboxuleHchgQ8rM/G5g1pmgParkHpmQ4/RY
         eZPZnpu+kS7e21U4mfyUTuwMJK8Z2JuqObuZ0CY+0HMGRTm1WFV4PgxqQ6/egmL/yyyU
         su+w==
X-Forwarded-Encrypted: i=1; AKwUvBzuYwaGOHWilvNo5COfVmFpwuGnhHKy1UikqrLD0nRILScvyEfriVtoxrD0rHGg9BE0+9F/X6c=@lists.linux.dev
X-Gm-Message-State: APuU4Z9sfq+vtLpGG4MyoNvP1XlBBjmbqNgOZPiWE9lIer2JSFk2D8Es
	w0usHiBxJdM0ZpFdxJEytcKoB8Re2SmHjDfVkSaLmH29ImbpG4PJ+DhNzGR2jflhstU=
X-Gm-Gg: AYBFou27U1z5VSg3AJ962qkP02H4thO/wRcB0i9/MCdEn+i5t972w+wRTCmNxqYyQO5
	EY0glA4qJccoNIlKC41G4xN/i4+Dtjaynk652agLbpBDAq51OyDfJeGPe03jPHiRVcNyMeZurh0
	GhOk4+655pj/kTdoH5XysZdXMQ10Xp1+KiJ9g4Iw6X4xVjHEC7yY7+ltfe+WOE4SHKd++OIsPMZ
	H/SHHhX6jxUYRB+0wO+B+9S+V+3OudzRdrpnoJhoJn5UnEFV5+DmsFSDDmEvYL2OH/22Bj4Ixf9
	uRZgIrrIlO2zS03q73OUGAJ7l/Y39VmAvqvU8aeTq81Cj1NJW88itb1bF5UuePc7mOT0ZesFTRU
	vAEQ5cFKjFAhJs6JyR2eyg93i3fgu1btTOF/zKJEAT7NVHqZ58ke/dNLDimFP2ldGUiGaBF6TTw
	mX8tLI7kdo0ArVLL/Eiwi6oohWl/d5kmIN089+Mvm6kbJD28w9iJ2+4sW97jkDJBGtW7QOwoCb1
	bRw7ElHDQhJdd487u5ei9/CUDvBYAz4lqlv72asWokZ6BKirAcRnl59Wt4PMDJL9CWBx0oii8fG
	x244X8VTos8SaEQHlSNaJ25jOiVIxiAZecB0GAE+btFDxsIv3/dE3s1ZnCLjtvq1YCMveA==
X-Received: by 2002:a05:690e:c6:b0:679:a898:7da2 with SMTP id 956f58d0204a3-67ba50e4d9dmr6951996d50.153.1793803987737;
        Wed, 04 Nov 2026 06:53:07 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee24498dsm1569080d50.10.2026.11.04.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:53:07 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Wed, 04 Nov 2026 11:52:33 -0300
Subject: [PATCH v2 1/2] riscv: dts: sophgo: make sg2002-milkv-duo256m-eth
 overlay generic
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-milkv-duo-eth-overlay-v2-1-e3d2d39cf229@baylibre.com>
References: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
In-Reply-To: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

The overlay only enables gmac0 and the MDIO mux, which are common to the
CV180x and SG200x SoCs, so it can be reused by other boards such as the
Milk-V Duo (CV1800B).

Rename it to cv18xx-eth.dtso.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 arch/riscv/boot/dts/sophgo/Makefile                                   | 4 ++--
 .../dts/sophgo/{sg2002-milkv-duo256m-eth.dtso => cv18xx-eth.dtso}     | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 49639cb0888b..440acd0aa55a 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += cv18xx-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
-sg2002-milkv-duo256m-eth-dtbs := sg2002-milkv-duo256m.dtb sg2002-milkv-duo256m-eth.dtbo
+sg2002-milkv-duo256m-eth-dtbs := sg2002-milkv-duo256m.dtb cv18xx-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtb
-dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso b/arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
similarity index 66%
rename from arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
rename to arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
index cc93746d932c..cdb8db063977 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
+++ b/arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
- * Enable ethernet on Milk-V Duo 256M with the USB & Ethernet IO board.
+ * Enable ethernet on boards that use the internal ethernet PHY of the
+ * CV180x and SG200x SoCs.
  *
  * Copyright (c) 2026, Chen-Yu Yeh <chenyou910331@gmail.com>
  */

-- 
2.53.0

