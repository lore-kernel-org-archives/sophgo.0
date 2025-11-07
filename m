Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6FD30AAC9
	for <sophgo@lists.linux.dev>; Fri,  7 Nov 2025 11:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762514258; cv=none; b=ovvIloc+AlgkAJkCcMKZN9p+J1k0ZQ22/qVYILoUgjkUGNipmN+gjaYiK6kMuQjrzA4C84hWW05HNrtp/qFhqDwL/sNOtgDYT3t/mDEWre+0YIzO1wMTrCsDjrWYN7HJvVgg9mbU1AwJUhjnPAoLxgaKyGthLfb9kl7lsw+ijJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762514258; c=relaxed/simple;
	bh=cSppAl7ekFmJZsAY8PhVJr/WleO/l+2uOj25qvFGNsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pgpPfiHMLtmrhI8OxmFxZwDuW2VxRV6bieDqixpGPidgRAQDZjpSG2iTROb86/wiGjHyD1n9zWe54W3N5/ZZ0gUtcgmyOlH4AAl6K6iZ85CVFoEK6OZu9afLUfoBvPzi0BKYOp4DqzumHv5tilP4siWgcygxDB9kgtriajjW0f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVcOAW83; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVcOAW83"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2947d345949so5042695ad.3
        for <sophgo@lists.linux.dev>; Fri, 07 Nov 2025 03:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762514256; x=1763119056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LN8J2MPpiqnkZZeP9rMuN2R02piDWN78Q70NiOhBpfM=;
        b=iVcOAW83rRt53iDZEV4zNzn3MpxAARf2rcd0ZP1Q3eeVjyLfcnOLWWBNhjUMO8iB2E
         wXvgS9d37aROAPL9fHtxx9wCFnVrGge0l2v0/t6kR+Xk3hxII01hmgj+0kJ6Yt+BQ0WI
         QCiC0VRSXVuYqjzJE6NTxU5PesjCAvaMzkpvtbzrwgTWsgp8UKmFR+T0kNLEgo/kXecf
         G2RD43mdnVJrjUDR2uwRIo2l6eYxFEq5ng+z1wFKtRBg9ckFYwLG9S0tGUUM9V3ik+j2
         RU9bJxKWnj+Qgq0aHAgZ37EGWHU2oQv9RPCnAwrAVco17sxd6geQI9hfwaGSt7N9kLVU
         8hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762514256; x=1763119056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LN8J2MPpiqnkZZeP9rMuN2R02piDWN78Q70NiOhBpfM=;
        b=m358Rp3ALHZoA1Nvb0lhGx29y3OgqtT99Pge0Q6kstYIvIzFXlU6xbVVsxP4U7Ksc9
         QdDYBttANS0PnTddBFtLlkDgALJFbsvZa5pNUz+2ZjiDn4/k1O3w9w5EV+usVNYcwK6K
         YrkvMIZU7TAV7pNKdtr5KEl43PAI4TZIGJI24+79XC8AuO/B1VLmBRk/MroRHve+g/2I
         9fF75NvhhnrivgVH49UA7kWfl/wThRkHlrd1NfQno243HqatRQ38TPjXvrrvBaZk46T4
         hciCXgOwPmyh6Qbu3Go90hdRJlGLcjKB1vifbETDq1zb8q23uj5Z+aJI3Jene5dCL2B8
         jNQg==
X-Forwarded-Encrypted: i=1; AJvYcCWOFU1i8eEgf0cF73VYelbhqAV1qq2oFwj2BdqUGgwtXsJxfKnW2sVJWqHlpEcPwSVQMaimhcA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqM5GxMV7e7oQIUm0HC7wcKHddz2FoGTfsbVSiX+74cgYpAoGU
	bRFXgDi5YOpn9FJSVf7IRxaaKHA8IPCSwi4Ldupqx40pB9pdBI/S9ggp
X-Gm-Gg: ASbGncuRbyyp1Qna5iNEa7nRtPDX7+IdJbtgFlkfdy9qJVkjJh31SenzWHFjnNTgbNU
	CWSPe4aZJqTNvLo9dhBG6NMbLMFmBNVgruUs+US9a8z+pJHNkdkMWMQldpES7fskIXzlx7N3Wng
	J2BwwTZxoZrHSVr2H6XeDPRsjBhQLA33WR8s6ji0Ht7E8Wulpr0O1VuMCG5AL/jNQWCau/V5x96
	T9lT8eaGRSCk7x9BuasZvoggOKErwNYwmGXdDQx1spVtLthvGYO2CpyQRaYlT5wfvmZqFoFZPvp
	loH/zVUI2S3AG2bWnnFhDk5ixQi/kQOFGVbE0XvgEAHv5BOrQCGtyw8TXpQAW3OOMKhX6hG9viH
	dmU6Tk2u9by3a4gWzJbm6wnTONzDD0e7jfSvyvqn+VGoafpKp+x5bttEUMClwVgfdaPF8z9P/Un
	WcIGKJ0yZl9A==
X-Google-Smtp-Source: AGHT+IE6dkmZ1xSfeQ8gFlQLsPa6AwKU7ATxDW7ucEzzW+bfiWTWRF3rzrVJ+aYG0hm2l5jNpYpSqw==
X-Received: by 2002:a17:903:19cd:b0:268:cc5:5e4e with SMTP id d9443c01a7336-297c0386b92mr39537185ad.1.1762514256178;
        Fri, 07 Nov 2025 03:17:36 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c6f6cdsm58791375ad.71.2025.11.07.03.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 03:17:35 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v7 0/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri,  7 Nov 2025 19:17:12 +0800
Message-ID: <20251107111715.3196746-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the SG2042 has an internal rx delay, the delay should be remove
when init the mac, otherwise the phy will be misconfigurated.

Since this delay fix is common for other MACs, add a common helper
for it. And use it to fix SG2042.

Change from v6:
- https://lore.kernel.org/all/20251103030526.1092365-1-inochiama@gmail.com
1. patch 2: fixed kdoc warning

Change from v5:
- https://lore.kernel.org/all/20251031012428.488184-1-inochiama@gmail.com
1. patch 1: remove duplicate empty line

Change from v4:
- https://lore.kernel.org/all/20251028003858.267040-1-inochiama@gmail.com
1. patch 3: add const qualifier to struct sg2042_dwmac_data

Change from v3:
- https://lore.kernel.org/all/20251024015524.291013-1-inochiama@gmail.com
1. patch 1: fix binding check error

Change from v2:
- https://lore.kernel.org/all/20251020095500.1330057-1-inochiama@gmail.com
1. patch 3: fix comment typo
2. patch 3: add check for PHY_INTERFACE_MODE_NA.

Change from v1:
- https://lore.kernel.org/all/20251017011802.523140-1-inochiama@gmail.com
1. Add phy-mode property to dt-bindings of sophgo,sg2044-dwmac
2. Add common helper for fixing RGMII phy mode
3. Use struct to hold the compatiable data.

Inochi Amaoto (3):
  dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
  net: phy: Add helper for fixing RGMII PHY mode based on internal mac
    delay
  net: stmmac: dwmac-sophgo: Add phy interface filter

 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 19 ++++++++
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++-
 drivers/net/phy/phy-core.c                    | 43 +++++++++++++++++++
 include/linux/phy.h                           |  3 ++
 4 files changed, 84 insertions(+), 1 deletion(-)

--
2.51.2

