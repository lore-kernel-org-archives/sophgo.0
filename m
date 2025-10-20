Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4639B23EA88
	for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 09:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954156; cv=none; b=nU/pO2VNVaE2bG4803hD1ZJhWGFWvfGSgGAwGsTgP4cNy+Xh9gNSzdXDNZibiORO/Vq1O4RR2GZQmWIo5bcgfTHCDVoJ2u3VU3mcbI10DElu7TH2Bfm3XWXd/wt0y+3+M23thfNcgY9VDALnNhMlqtskD9GjYv5Ab7iupMrX15A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954156; c=relaxed/simple;
	bh=rIsPkq1dARb1QczmgvcZPGvLvmgyJgmOrN52SnXRNk4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oJNUj+7nwETJ2Ua5H7xdc+2bZSeTJ6biRANG7HBSE1KAuMtBvX5JoP4BuZhNN+NeeHpKEqIQUVFMeD0l/7yHbMfKztkQ06b1vNCRAYetdCybn4EqRnTiDZ2XiWGRRByQZA/tmL+JcTgEt1T89fk9ENaazIJW1fnSnXT0j/pKaDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBS3wj/M; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBS3wj/M"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7a213c3c3f5so5412167b3a.3
        for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 02:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760954154; x=1761558954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HnjCj7JbAdjNvBUGLpD1SpiGs6GWZ/iOIsdOQuRNQDA=;
        b=iBS3wj/MnnEP+KhPrX3qex5exccR2vinSCnuoJDYlyqGXZV3SprQmGZpu5jDJxMG1N
         wNhA82eTODBxibUVm3iRudzBfEdOXPwMxfK9T+c0wNNAqd2VwhyvRpW2shLfNz7QrWC8
         o/MPs7K48obDhlnnaWjIRJDQuGD8H/tnxqWfoSlczgITuSP3JPXzKRNKsFMmdFV45Hdz
         UnqLnTZptpR1gQjZp4892nxDcK2P7c5JpsCrIPo296mHEYa0y0M7GZAslybJnTLoNsAP
         BfiRI+wWd9NW7rXaCycwWontQ5wU5TBRC6v4irziDRGH38z2ipbgHCFtyigXBb+lUCz4
         xYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954154; x=1761558954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HnjCj7JbAdjNvBUGLpD1SpiGs6GWZ/iOIsdOQuRNQDA=;
        b=cn3GpURqo7XSZhN94/uwI1JdJZYVHHNjh5VFq6PzVEmcGlyoLiNMVvBkWxhiwcGAFB
         8YNdyvJpeN892JccVeol1jnMH6Uoi0FSqMBAVFBYBwmZ5Ds8QH/ib4291ttsFEoDMyu0
         JEcABkGYMHIv9l1QEZBnq5BeGuQQqQr0JzVvJkIxtuq6groS7Jq7tYcSogoRH3U0ptD9
         nkjjJWIBDx8EKmZEVuvklPoiPzlWHFpopFsxmYVVCJ6uOjHcOXR1zfZ6MYQwh5bOYrkd
         oZqJ203uHEV/mf8UKwkh72qn0tDwxyDnh+1qiY/LYJBH5uhcXCqdxZXPAcs0aLfU7uue
         NqYw==
X-Forwarded-Encrypted: i=1; AJvYcCUTBNvnoPfWshxTSXkJtm1AAf2q0MmYaHwbxAbh0BNmQQLI7ZsGq14NPrIU3E5jJF6nxFUrLf8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvHzdwOx7TaSTbGnzqEVm+JGM0dQ3H2fbNFEB8Upd+G0qnMHHQ
	knRtKs7iGxnsMU8fzERQ6BQV1uLPk7p3ng4vVI7yk0kDEbA4wjxIqNy4
X-Gm-Gg: ASbGncsRnEaH8sGWTBHJyA08vSoibiqk7Bein/lWaefOQF4Tusr4ftD8Y8VR4KV4GYd
	us8Q6sbJMgMX3KWK1MyrpYk9PpX4i7QcNwfd5tJhDcSe7wvu1AHv1+uZnppkUjqcsgvnHR2yo2V
	xWH1Oog35I6Hzfh05NoAQTNtR0SgRKytpx5Wrc9CRThRgux9wUb0twh01kQVP4jWrX6HBJ8VhW5
	VSCnAcKK0aKCcCfyB3YVQWXU/LZnV63n0j4upNAjyS6BZpDhPQwoKzZyzLL3QI2X+eOK/xSJaq1
	bSoJ2wsuQSkeJycfG58B5rU4MTfmwuLnaaFghtCDBmvMfPYi+LBSRSlv3OcpWaGNrmsqyyXDYPk
	i5Lrrr1UXPixi1LoRs9DhC2yWg/BwLR03R1oWX26dYkBFn5/eD03vTIjZQbLdMmANUEWheBrVNE
	g=
X-Google-Smtp-Source: AGHT+IGgDyGZ3OQ57iwdb2555NKJghSCCZpCKxoCPXr9rM53NE7X3m8ehUVd2NOzuBByD+q6WjfyCA==
X-Received: by 2002:a05:6300:8088:b0:334:b8bc:1031 with SMTP id adf61e73a8af0-334b8bc1040mr10403992637.58.1760954154496;
        Mon, 20 Oct 2025 02:55:54 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b6f302sm7256845a12.38.2025.10.20.02.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 02:55:54 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Mon, 20 Oct 2025 17:54:56 +0800
Message-ID: <20251020095500.1330057-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
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
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 17 +++++++-
 drivers/net/phy/phy-core.c                    | 43 +++++++++++++++++++
 include/linux/phy.h                           |  3 ++
 4 files changed, 79 insertions(+), 1 deletion(-)

--
2.51.1.dirty

