Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C731373
	for <sophgo@lists.linux.dev>; Fri, 31 Oct 2025 01:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761873894; cv=none; b=pHoQK/ie4JkmVXhgTFrqV2JFMD6PO/JlBlwrPEa4H5Q1KxA2LwTl/iE7+/bfweEmPUuvl3K3dZQzw8ke0FLMLfQOnsZZO1HiCndFKaaJj4o7LFmUaYSzM9LX3CAJcEWVtm0b0ihsy3Pr48L7ubgBbBbqX/PCxYs5UcDE1x3BE5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761873894; c=relaxed/simple;
	bh=1O5Q6QjcYdLu+tr6/vdj/EJ3D91zuR19wO0QY5I8Boo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gplEw0TDdMlsmA9BwBXxul1cEzrp+n46StHG+rjPvpc+4GhSF+aqPLncnfz1iNvKqHVE+FxDGaOXVNLKnO7sXUJcHBhuvbtSWOvI5udxq76zoDmOlbz4HolGwcpza4ZJ7XXFOtQ616309sUEWikQooKW4S3JLTFnI0FPkmajASM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMYylq0z; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMYylq0z"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7930132f59aso2543883b3a.0
        for <sophgo@lists.linux.dev>; Thu, 30 Oct 2025 18:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761873892; x=1762478692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4k5u4IDHa2ldPO/YRgbWN7ExpsWnE3pSTkUg9MZsePQ=;
        b=OMYylq0z8PceKiV9qGZUi7bxaHSEp0LZ78EyOaCmTZ0XXWkqee1jj3sAeiEMjt4yoV
         w6ofxnXCwfk136EJLSkEsBo28Uqv1LlfVZ8QwYWjl1MFoVw3QxHWClSVm/D700ubbDcD
         FmpRTxs7S/Ngr6vU1w5nJazYEO76FnPTyKDQgE7vcC01+6K1UcePudooTLZzV7QEvfzC
         SloYjY8dNmbwC1gMj+zZ2M7IoC9+J8cZUfNQ8YAydxn0wbujwxId9QXbxaZZ28J8wKbB
         VQoNBgOLnOfKxEto8vXKF+Tp4CkqS1iLIwoCVfR/znXxiG1c96IYDrULfpz1HF71vOm/
         EKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761873892; x=1762478692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4k5u4IDHa2ldPO/YRgbWN7ExpsWnE3pSTkUg9MZsePQ=;
        b=MTO2Lri1f120rU+5N7UlOrmpYZ9KKQ4Prh4zxRtiqmWzK5lp56Gm/dKmLakZLn584W
         WVxXHVLG//1mkm5j/vb6lDlbEjNFy3ChA3yZjr5rEGVldaBzlVWMpwmokfzykD6dk7aL
         UYIQEKCPzDKzJo+w1kHvdLETFVROLmzCzR+QahZGmSaQbWOxQZjVdQ3NHJUl5JdQTunr
         tRRuJZKus8jAevIdATuWs+RaczGwAOcJZwSRD7bLxyn/L7Ma2iBnz4LnU1G4c8cH8yI0
         3/L4N65FQju11pMzoeZQOkKQfEoRw1RvCO7pFsNfCLDiDbtgxQ1ry/gHQlRLrJD8VffT
         NeUA==
X-Forwarded-Encrypted: i=1; AJvYcCUwfoACAmUld9rv6V01PDKmRTvU1PBnZbS0t6U2vMfilugIQRIA6xmsYMBXo09fscbIf5dX014=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTGxVyEW/0oJysvagjxtEZmMu93cNRF8haUzuJ1Grlifb50W8q
	3qS/lfZo5qkHwZ1QXDeq5QgrWUZ4GE1SQ0iOuSTubOp4uUaOMkYJonRm
X-Gm-Gg: ASbGncvGAkfPim5lw8ugNyKguP5QE5J+y0vcdVXL7Lttt/92ON29OFaWG0yYyUjz7UQ
	XTL4hqNScoctSP2VsRKfCDdzIJt+fbul+4p0wLgxMe4RFCiKrQzhP7DJFU8LuJI62UOF3woYWrV
	MNq2475p5yz+gLpASvOVquP3lxNZl3Od2eV+Wb+f1hAvCXDIIw7w5M2v8vfs3aKC69Vj2g1nqCc
	xHUX5c1LHsMKDCWGKEaMx0OL2XGHncRUTKEKgxXTxJIrQlCPmGGHs8nzki3xPi9LPVst6drw0kr
	Z3sCx1Jz6GMb1lIn9KfuDVr4bfCYwHZYYm6NxtBsWGBybLWENS3GclNFy4/eh7/i4JhGuQDvGk0
	gbUlsrhbHCoIS5lPyMjIBOwxmuy/+IDab4faOGm0R6+2xA5sJjKtLAXJWfvSVZVLanrJEfhzHNJ
	4=
X-Google-Smtp-Source: AGHT+IEKj3bBCS9FtDr97rBmPSsnGuT/6Hzs7PvtGv6PRK2iG5dvba7cpbCl+e/48QRV8/RBzMyxUg==
X-Received: by 2002:a17:902:c401:b0:24b:182b:7144 with SMTP id d9443c01a7336-2951a38fdf9mr20303525ad.7.1761873892179;
        Thu, 30 Oct 2025 18:24:52 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699baabsm3091035ad.76.2025.10.30.18.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 18:24:51 -0700 (PDT)
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
Subject: [PATCH v5 0/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri, 31 Oct 2025 09:24:25 +0800
Message-ID: <20251031012428.488184-1-inochiama@gmail.com>
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

 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 20 +++++++++
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++-
 drivers/net/phy/phy-core.c                    | 43 +++++++++++++++++++
 include/linux/phy.h                           |  3 ++
 4 files changed, 85 insertions(+), 1 deletion(-)

--
2.51.2

