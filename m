Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A15923E35F
	for <sophgo@lists.linux.dev>; Fri, 14 Nov 2025 00:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763080715; cv=none; b=XIX6qC8+79fJZM0Fx0DkX0Lz3VW1OIPJ6VzdIKi7G3QJsJmNJCr4OtRqLUQ3eow37I+rmWtToPTkg+jbP9S+xFLNjN/ipgclrMszVB0UKf5DOHqSYkuxarJXp0iFQ1kj2RMR5qkMVeAQOKpJKenWZ+j8jMWgZs+d7GivYQxiOdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763080715; c=relaxed/simple;
	bh=KRzqLJ2KAD3SSV1T/Z+RQ+x63XYbWGfjYNte8LTxVXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uPmEEDPlw6AlQiYGcMVTXju5RghsvAs2DQ9SquL778ZY/E7zEUIS/AtBKC6zsRxpPxds216WiN8+rz3pl1KDVPN6QOmXVKRZ3IsiSl1q3kzpExz6IpJzTvllkN2G2R0q+ryX9Er4cHgGz1aRLZTZcz8cD/TM69qB1JFVG8By5kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfaA/kl3; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfaA/kl3"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-bc09b3d3afeso876372a12.0
        for <sophgo@lists.linux.dev>; Thu, 13 Nov 2025 16:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763080713; x=1763685513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FVPzw5zfoDTWTXFnR/h7NqjV1cTezTe2Ib/OrTkeKgU=;
        b=DfaA/kl3gCYwGNjoQtliTcKpqarc461Eqcsw1zpDPG1mlFJzS0AQEIYXXe1Pw6VwGk
         LKb1mqX+QABQzSr53bGZ7Bi07P+z0CO34jn8IbrYTpZEF7iNN/3X8ceZKYydQK90pSle
         sFWiXfvqHAnWKDXUzCprmwbfbSrRLq4ujs7YGMts92YxT2zgZojfAP/V0VSfpMb2ufBM
         9K60A9DFlxtP44M/XYvRrift/bWCwCFYci2ZC/8d3LWzX95Q7Hn3mW/VG92vmIhEBsAE
         55ERUHTkn7P73DuEWIS6FvvDAUvIwu7G6G2xmQjCcyKxRO+NYA3gq6E4xpAsbxQ5DiHl
         NqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763080713; x=1763685513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVPzw5zfoDTWTXFnR/h7NqjV1cTezTe2Ib/OrTkeKgU=;
        b=hZGYxI7NxEgeEmBz1iyTi8Br+bfDJefSsIrVlmGZlr3NYsL9zMsnUpUj9rCGFs4gfa
         K87PbOoy/BYTGmpX3P91fDur2SPJ3LTVIKRZyFbaMXDBlLZ0sSGlJtrYNMGapTWQVpId
         Zbc+Z8aRQIGjRXE2fAwRu61fBOVWHCxvT8xaozzfBkAyue8dW0XvSrXU7aGnY/HiO2WT
         XbXIrWL6pKAUFFj9GXh0zgOXU81o9VsqMvXvBXQxdSAbuqR+XIIqAdfyjTVoBHbesrc9
         mAppV9HCJoyr/pS5KUl25KF9fWgzaxxYPdhsFcQZujOrOzq97Grs91mDXwOIn6xRIyno
         XQGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0Zr5cmQtxMlTGrGqID7A+u6XvRB3YBgMVhwhsopH/x/hDaYruYDZrml3tPLX58ABQ6SlAvWI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZa3xvVLEG0GZcq1VMnIC9xzZ3fDBy1DhuqVD1qcg79QPWtEso
	YcWUsnN4ti76hEPC61jcB0nCEmokdk/UM5c4VotM3iiw76V2x6VJd6ug
X-Gm-Gg: ASbGncuneM9hKtbKGs4Vw2aOiqRcg0oVB9dvtvYdpGICHXFyR9LnNRF9GkxkieTZ3XK
	kvJDXdK3Bv+EpIziu11QBeZy7bVfyiXuAJijlvcq9cXOVwg4NF9Hc6d/tjYLahuAwi2OR6z1z6x
	/5zHub19dcDdSKJIjtqTM+lyOENspKkZ7e9MwyzJc8QV7aapd10D+bJb7FdcPX8pCRIGOGwXVzI
	R79OLpdjlBv8odhiZoSp4dl/9u394vzMDhdo4Kmg1y0vVpqVYy3M/bAh1VjbGzHyn5nxu5f4VTK
	vXeutb+CcwM/emG6A3JSrLa9lr+i6ikTggw0xrcRxmpoDmLCCmNL8fS8hlwVsN0KP+y14eKSlRa
	6lUxygn2KpFeTYssto2Rvzd3d1O1PJbon2rNgUyGwLFQsBJTad861Ce5as1xMVeotx5htWx9Nhk
	g=
X-Google-Smtp-Source: AGHT+IFMN4Id0VDWD4vgNY5yrLAnESY2doxKYngxGOLEfNZ2u1GtM7J0GBLB9kpY4AWTmMpVtXfBvw==
X-Received: by 2002:a05:7022:6284:b0:119:e56b:91ed with SMTP id a92af1059eb24-11b412096e8mr571996c88.30.1763080712752;
        Thu, 13 Nov 2025 16:38:32 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885c0sm3384978c88.3.2025.11.13.16.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 16:38:32 -0800 (PST)
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
Subject: [PATCH v8 0/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri, 14 Nov 2025 08:38:02 +0800
Message-ID: <20251114003805.494387-1-inochiama@gmail.com>
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

Change from v7:
- https://lore.kernel.org/all/20251107111715.3196746-1-inochiama@gmail.com
1. patch 1: fix a mistake that using rgmii-txid instead of rgmii-rxid
            for SG2042

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

