Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E451DD0D4
	for <sophgo@lists.linux.dev>; Fri, 24 Oct 2025 01:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761270939; cv=none; b=oaqyOxuCpMJdcZIcdADSHFD106dplSH5T/Att2QCGk0hBnWvc3eEJvbi7Cp+TGAcJ8NAwoRIRFPrlcfCZ09LmgDmenrzy/DSVDX/cU2MJpwqRnONe9PBNz5MqyMxIFyfgncA4R9g7QQ/Z8PIXb32L+iGWUl/ceHWShXoYzNC6CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761270939; c=relaxed/simple;
	bh=DFXDK1dq0hZtDmvIA9ZvRGa1Eqyq6GKOH8gUqjVv1bY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HUyg6vafV8wWaaOFHBQYKaVtb5OfMy2fYcFt9yQo6bgo/ZM/E/r8T89e6A21IkLWlEITOx9c8cjTMvHNSdrdimKCXoHE0ZgTm7xuDYU6qReGZBHOwQSX4T9h3BqMzuCC1ffQNiqFFU29KWxNbJ0BlX4dUiXB6MMeP1ATfwJxX3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhREGXT7; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhREGXT7"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33292adb180so1476346a91.3
        for <sophgo@lists.linux.dev>; Thu, 23 Oct 2025 18:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761270936; x=1761875736; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qM2K5UWuNXprZvBDJ5c1mMhJQmIFaH7Nb7GuoKXsnbg=;
        b=fhREGXT75L5DK+F3nhRGSCuSJQ7bAtptenMPzExH1BPk43NuklVxFt8WtolgCNztPK
         LxQUf8bKeX9U/WoNf5Hd1AqW4j8WD2gm6C0IhtK/EPar/Dr7qjA0ANb2TSgHmIpqboW/
         qSVNLkmG5MsDz1u3YYifKEAY4R5uetuuUxX3zRXtwzP1ppeRjntB5EGIv4QZ0jMcCEop
         d2GVkT+177k7YminQziHWlLSoXpLMn0r/G5dk4RhPF7RXmeBfOU2T4vR9gJa5S4m0kfW
         sDpnsnWl6vrm7Ex/q0Fy/MDPbHxbc62bzhPMiv1RkJPhJWC2SvcESNWtakSEv4WCRKgL
         lmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761270936; x=1761875736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qM2K5UWuNXprZvBDJ5c1mMhJQmIFaH7Nb7GuoKXsnbg=;
        b=fbH3OpcYCHbZYE+5jWpCiSjfqrRnorSJdMxjTmiMPZVYIOmtlA9fx1NQDFSBwK6lWs
         S8VAzZbKYD6VYx7yKfMXB3ZKY506t4d6Xpot5UiOumUOmKplzID534eQ3vbmGMnBMFh4
         XRlULl4PLFE62sxc9tr5IydBDZbVVUe5b5jy935PhjRb2rLpWGi2x9HJPdNp+jQsvCAv
         oPLI+Cz3LU5JKOmaTnZhZU26/baAeTMShQrFsFaa/cBWw7IHnGfVLAWCfQLgi4khi3f2
         nLh42QPfhJOjiVYds1q8sPVFvHB5DBSrHT+1xyTVu3nGePhZeltLGefU9DSMp+mUrYM1
         49vA==
X-Forwarded-Encrypted: i=1; AJvYcCV8JboQ/1i8TBYVllK/BhoPBl01JPuDG2NvovYokivUPqbPYvfRY+JWd1V+EMnysBtB6R8FeqM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGk5DOb5CzNi9AXxvQonfqrMZ4ZIdDPz+j3MKT/fVeA3x6ufBx
	zKUDqnJF2QQG5HxTBErB8d05BQQsBk5JwPeoNRD17hv0q6WC7PskDrPW
X-Gm-Gg: ASbGncvr/Mr5S/L4TEj/naLMbx4lF3F8p26qAwGRqKkedLJMXVEu5YiV5roB2V9fqkQ
	gKcaMsA2YXSqf3c3OMKAH4Erxk3nDQbc1SdENJqvpTfgVgx5Z/AsL4NtBzY3WMQaaHEmk4ts6ZI
	UGwZG2SxC5HNfyFUgR4JAWb/VZQrcM1/IN+/oGWT7CX68ra1qFHhYCZ3Lz0CyhjpGFq+MIYKUQW
	xGEtm6oEKM0nnBhaMx+MFmSkLDO+uE8flotv9CV7B5UdpGqHzZHZc7caEJjQ6Mp+mcHhHa2XvQo
	S0Me2dqB7HsTncOGMliQ27goxcMB7b26bffYpBkmHeY3c4BzYZFgGZ8tqflq37iovE2t7m76JAT
	sd0gO+7ZVsjP26uBNQTXCV8biufAB14eqzsDPfTYs/oqpfxhRDh85Y3hFW/3ovDuVP9NFM/ptNG
	SEq1IsBgLRxQ==
X-Google-Smtp-Source: AGHT+IFGuiuD5qMaB237ASMVYM5OY1+My1nEaULow6/U2LgSioG18/RvbKuul7ZQNTuvhLccqeac+g==
X-Received: by 2002:a17:90b:5386:b0:32e:749d:fcb6 with SMTP id 98e67ed59e1d1-33bcf86b5c6mr38689912a91.12.1761270936488;
        Thu, 23 Oct 2025 18:55:36 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dff3c3a6csm4951393a91.5.2025.10.23.18.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 18:55:36 -0700 (PDT)
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
Subject: [PATCH v3 0/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri, 24 Oct 2025 09:55:21 +0800
Message-ID: <20251024015524.291013-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
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

 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 17 ++++++++
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++-
 drivers/net/phy/phy-core.c                    | 43 +++++++++++++++++++
 include/linux/phy.h                           |  3 ++
 4 files changed, 82 insertions(+), 1 deletion(-)

--
2.51.1

