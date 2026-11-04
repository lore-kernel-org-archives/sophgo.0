Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803993;
	b=eMl+JFhq8lgdrvditRODuBluLAkSAjdaluRYETTkhndE4+aB8jMUs9sMCN+bR/jms2kb
	 LTrSIdX23HJV/PpMRk7uChI9n+n/v25jXhyhf655Y5HUllbulJrlM7ZYlP5WVlgCRXhj7
	 5LEeRUnb8NzJxoBOlVh3HZUXNWn0VCfENxynvMSRoUnGHNWosNVC5ggAbjdt5URkwBuus
	 Xmb4WFzyU7xFubmTcGAccleu3VfLHabssb+h7IHj9yRvY8jrmu8SWihrImsWPjCekhyNc
	 BDu24VGEOnDCBSYNP3PTJnfKBOT9GYoC8puY7aaV+IDBYpp6vK1eOJ0mYJWV6KBjCzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Bdpb7DkbNvx1cd2LuIdKPUEVWFbLibGs47NkSZrjc4Y=;
	b=cISPSCW39NYpYsXeo5cI2Ls4KqHRalGm5SCDJ905IR7dbh5/qeDXviwZ0olc5w/BRPJ6
	 oh4jRkFNVNFq26HliVTol2E7fyFL6LalNuociNXpKY3C9INvbQ4S9/nEqZb2lOwTaSD70
	 kWa8orzNVYfWAVlKX7xZv7bePRl1a+pDWEpxZp/ssjAmgtQubksjJCkf0ONWsghGrr7WR
	 +TM13DDSCqFXamZdEb2nrhbNqsW8FNGE7rJZHxeFYr1uEOyQ8/K8XD2gBwW2CvSXgF7KA
	 x6lWu58RJotnjVGkpFWdTk+74dBM3IWu4uJLLDDLX6aPiNZ22DW9qZZlx7hTGeZmQNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ft5ZNJSN;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67831606A328
	for <sophgo@lists.linux.dev>; Wed,  4 Nov 2026 14:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67831606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ft5ZNJSN
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-677bc4704cbso967045d50.0
        for <sophgo@lists.linux.dev>; Wed, 04 Nov 2026 06:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793803992; x=1794408792; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bdpb7DkbNvx1cd2LuIdKPUEVWFbLibGs47NkSZrjc4Y=;
        b=ft5ZNJSNWzXXeT7EByfC0L1nuHSONp/ZOA/sI/039R/u+ylA4JVTZkeqKvD40QdxoX
         OF9TOT1We7QSVLCAdEqZQvshJW0IKUc6cjUmVfUEY1aAuNOZS/NfQ2GiL+FlXOweO4/Y
         5j7JlR2pmDrwE498uuYdKD9Zi2PvXRLmP9ysx+N/+yvKoda0NSK8wK85V1XuqzZi5mjF
         I91YHEeFnBcfhc8lApY+lE5XvrwI542Abrz8jV+H1v+KGtWk/V9sohl/hzEdHvDqWhJI
         WR1u8WqYOa52HLa6UOFAk+iWSx3AyPbucQ7JCpYuaxsakemWhoUEVtX8qoUqekL7jn+j
         Ul1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803992; x=1794408792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bdpb7DkbNvx1cd2LuIdKPUEVWFbLibGs47NkSZrjc4Y=;
        b=XPyakOqz45RAI8S2JDFdrkUkLn+3X4ATQ2feal/sqU9FKASKwDoiFbGQjcjylxrhJW
         ty4v0jhGMMTohns2nHdWcpoMh/Jw2I/smjwBfhQgjHa7+o/Z/ANaEt/SxPhOy9eSuDax
         /2oZgliR2ZaR6RNwXGi/ff+Kaz/QhRRcB3G3N+JMIE5xK9Vguu3+ceAw+UNb11Nyh6wj
         k2Q7UhnkhYC4sBLQUvDx0kSEudLkUHGpoyIF2tw2Q6Xj1PG1V8CcyrEkMZqGClvLCZfd
         WV0NF784NfwLXk/3/yxI4X5SvgCRMjrgBq6GD5+1o5KuHIoPMmlAaKdtLjCkV1hpgOzW
         zufw==
X-Forwarded-Encrypted: i=1; AKwUvBxduCY5F4aDLCpK4u5ggYAN+SdGs4DbZ/e8KsxArDiMptvYCTiLNXv+Y9C2Mnrzt+exflwPb5o=@lists.linux.dev
X-Gm-Message-State: APuU4Z/R5MkSHn+xHorA+tpuoEM8qLuoyQrzxKWm8xFcajdpCDYb259P
	foeCbslAd1dMZGFNPhIY1sgvBP9ODRT84+1jJJMlTaXWYO4frHr0XtpBHdJ9ZGNMKJw=
X-Gm-Gg: AYBFou06P9mB0kr9Hv6t996qIGIcXmZfBqdx/gU06OCUur0UT5eq0A+T5nn5lzhUKWi
	BAbX6Eo8DDogq0ydm4EeEVAW1VH+ERwuVU9ofMI/hYTj6pBqpESApYrPQRJjUz6F2o0DN3ug8lI
	kF2QEUz49RbEA42952nHeXHTvE5iMVA3nTi/tcxDqQFH0Ko9hH58NAPLpy7XdkG9mGhs1Gdk6vQ
	+fZ5iGmhUKxV7ULsBV9UCuUrmYgb8cy+XE5g2Re4NWaM85+uiRRrcCh5PIPBtoZK/876+A4Zj2M
	Cboq4kvscgnL4Q8VPIIhxWJVlEWk0mavSE73BFnh5uJG5mGRXvFyePiy/JToFjqrrIvF1qYEmbI
	gBD5wY0+98SprXQqHXWquXYZlbtRteaMebwafXA7vJf3tPh2mNuWuTgoIocBdxkhzKjKm0vZ10u
	lmWfdTy+AFA+hXPAmQbMk4UhpJ4YkCf9LW3oW8SF2h/4NgDrtJt5x3qISQyzh8Y+eLVDfOXiQlS
	U9jxoxrzYcMSZ1ffZl+30vUKsEmO95pjVzpIUOu4Ec8oFcjXrnXvhb/W2mZspVRZzFoep4b0zNl
	0wweMYNGcLu2q073/W8CxSHCO7eV2bvnRzejcWW9Zh0+UAQ8R73conpmbU4nahrGwL3lR2PnBME
	C9b883dGZ2ylyxg==
X-Received: by 2002:a05:690e:16c1:b0:677:b9d8:a475 with SMTP id 956f58d0204a3-67ba50cc6a5mr6545943d50.147.1793803992459;
        Wed, 04 Nov 2026 06:53:12 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee24498dsm1569080d50.10.2026.11.04.06.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:53:11 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Wed, 04 Nov 2026 11:52:34 -0300
Subject: [PATCH v2 2/2] riscv: dts: sophgo: add Milk-V Duo ethernet DTB
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
Message-Id: <20261104-milkv-duo-eth-overlay-v2-2-e3d2d39cf229@baylibre.com>
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

Add a DTB that applies the shared cv18xx-eth.dtbo overlay to the Milk-V
Duo (CV1800B) base DTB. This enables gmac0 and the internal PHY MDIO mux
on boards with the Ethernet IO board, matching the existing Milk-V Duo
256M DTB.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 arch/riscv/boot/dts/sophgo/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 440acd0aa55a..3c9f3530526e 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
+cv1800b-milkv-duo-eth-dtbs := cv1800b-milkv-duo.dtb cv18xx-eth.dtbo
+dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv18xx-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb

-- 
2.53.0

