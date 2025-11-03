Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D50154BF5
	for <sophgo@lists.linux.dev>; Mon,  3 Nov 2025 03:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762139144; cv=none; b=RQI9So9+Vc0zMbXYIhcy3pNXykPz7XX+pKO0vFZTN/zGIyVJKcIyUOFVt+KxJn5/ZXQrlLqDD/tMaH4wX0TfBcksfL7Wd9nLe6fZAgXw4iu2xeL64ICIqogFpSOcNgCTD3OpO1/xUzhmAc3gAg+ykDG8kQB5WMJrg92DkVr4xj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762139144; c=relaxed/simple;
	bh=0som6ehbnOrZUCiYGu7DmOQpitEQpLK/28RN7gfEbIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z42TJa4bN8CBbpRo9HHN2jR1gAkPwLUciNLL5AM5K0r4ufWjSmxBxcbXy7ZBPYyW1HX+knqZVyfbzA8xaHy8iCcKIy+J75LRbuIepm0ZFHlCwXF/PtjkwhKHVBM9k/JgxNzTMGNyPz9UVE7HkTWyQc13bvS2o33hJSAiFaql4XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYpZ9jZP; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYpZ9jZP"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7a9c64dfa6eso625084b3a.3
        for <sophgo@lists.linux.dev>; Sun, 02 Nov 2025 19:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762139143; x=1762743943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sf2MtafIziFxv0+iZSQBAt6orU3b9FFBk8saiJeqI+U=;
        b=OYpZ9jZP8/a1SJyFbXc3sqb0mMEB2i1KkkYY/Rl5LVSVByIlTBuhs3OqDLBKBqxCST
         1iDde8CbtYrYXxifckY1hJHWlXLM0AJDOj9fahhy0Rt8/KgHJJLGMIhgBeeiF85HBZ1I
         BhLwfN1wmcGy6El37V+g/W1HUpmJSVl5MKrWe1gVwc/we0Ip5w8JW5kK/pUI1F6vCwe0
         jUSyyVmVFjgUg5sxesR9phI5+M+pQywaXcF/Micmws7HoxIh8Y1CP2FWXCFcODVXPwYS
         S+diS0lcgHvDvb5WndyAG/IqfizEi6omuRoeyOLjkEZAztJjC2rwxa7VKSX54KNH4gTg
         T3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762139143; x=1762743943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sf2MtafIziFxv0+iZSQBAt6orU3b9FFBk8saiJeqI+U=;
        b=gN5qR/ypCO4Ovh8FLrbpEDcgIeKNnYmILDtp+cR2581U5PWvH7HFmTXDTO/YDyBoia
         ZyWgKHIOeUnwWH9k561LJZ2B8RNTGCBiuW9uzgqGBS+liqOFduXvURBG8uv5UkpfVRMi
         WYdWIX8MkBCwrixASFnKCWDJqVDjLelLK13BvakrbWhzgSk7fxQRjreSmLwEfz4I8pip
         i3uHmCbKiZHw94DTFaVqbngKITAzgsjc01FjrC9+DPIgEUkvYOYjq6u6V8TwbTHgGhMx
         ZC9gg3NESLsqAsrvK8YWsp1BaDa/DFVEt6U04MWMg4SBHyPFJ3zicERmtqxZZ+Oy0I+R
         Ecow==
X-Forwarded-Encrypted: i=1; AJvYcCU1QIrSI69wahI2Fx8lR+miEri3vBT+aY+8N44QRK08b3ecp1gfWEp4VshrvrcGtWOW9lzDkJ4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNAKOjlaBkrnWDEU65WpkIkx/t+hnfFCxtqOhgQBRG+IU8FnZx
	7bHLDo3t7cQ+I5eI+OE76Ww732MpyRKXaPhIJVGLH1WRQi53KzHNd6iX
X-Gm-Gg: ASbGncuUKBTnPBKv47cJHKmxnbvEyTxcw3ecoGn76Nq8XhB3+WzdXmGoGccml9xrZuF
	fjPdw7NClVKBQ0cAh5vlMzja8DtZsqUxQETy9bIGEFD2f2yPUzvpwiEtgL2mRO/kQ/Y5oObJAkd
	ATxfj+rHX9T4SFsq5lq63K+tYA1dGsrw77x7JHy0VUtnJ27D4VpvPRqgyQE1AHXoww6aJAvZJc+
	K+5g81A9i9i3IiC/9BXo3zoxVU0ZYGzRT7FNSfUJm+lSJL4SBZ0kmKWg1iQ2/QmRl1cJJxrijL2
	digNFlL4/sj6UwfebQ9JhXmyIPxPjyl9YLWcvEBRqJu/oLBiF+xmb/LJVBAAiESnZaCPkmdQTXx
	2hxMi1Qa5fO4bu9MZdYbla+IVVyNi0W9vSMeJGWhvJBApBxk13Em77C3vrMjyk0Wmy8gmG03vRR
	DN2ep4oW/k4g==
X-Google-Smtp-Source: AGHT+IGYS/nnpitzE/eUQ+F68Ex58b2ct1BccZhqdFnCOq0bLpSK6sj1xCHRpQ3LEE1D/LOlqIwsLQ==
X-Received: by 2002:a17:903:2286:b0:295:4d24:31bd with SMTP id d9443c01a7336-2954d243448mr108631195ad.17.1762139142642;
        Sun, 02 Nov 2025 19:05:42 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295c2eb15f5sm11691785ad.2.2025.11.02.19.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 19:05:42 -0800 (PST)
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
Subject: [PATCH v6 0/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Mon,  3 Nov 2025 11:05:23 +0800
Message-ID: <20251103030526.1092365-1-inochiama@gmail.com>
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

