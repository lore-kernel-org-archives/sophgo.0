Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240581BBBE5
	for <sophgo@lists.linux.dev>; Tue, 28 Oct 2025 00:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761611949; cv=none; b=QpQtk3szMWBIb2sPkXMM8QH5Jwd2xYVLBQorbup+qFRD+gLwx708HZR7duoBYJgAiOrJFGKNEDRnTrtaRtqxZRZubDX7ibDwDu5432VYFbNEeIfgayJMVmqZ5bpEOZAbM77mjDjQmsgA/QFK9hkaTTsL623bKdXI8XOMqaikisI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761611949; c=relaxed/simple;
	bh=92L3b4Ntl7Ogh3uo+qzMPWm7sN+t4dOvnC1FUrJY5ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ipn8a9gfcALBGNI1+Rsqnqr/NWiTo06lv+6JFSHYka5GlXrbEk5IBhIxs20IOaBrzbhkoeUlzziF+aIGMGBhddH61+gkXFEaxc69hyS3iW5XJENfC9vg6OyxhHqMlP7JeO+umjdagTTepToE5L2s9alj/zOdKS72pkBMdRTctX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMboEgiC; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMboEgiC"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b6ceb3b68eeso4031044a12.2
        for <sophgo@lists.linux.dev>; Mon, 27 Oct 2025 17:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761611947; x=1762216747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8s7zFl+2eb3TMAz+jhCE+xRnt2/MEJ1FXnvoxEqZlz4=;
        b=XMboEgiCvc7fiD3lxVGftNVcARvFa+QAEyeU6Qrh+Rymo+Q7NXtDHWwtoZjwoDdkm2
         m/VKEomq1XPpXm/eH5sUMwEHMUFjcNQ1AnbRWTSX9MnWzo8uwb5Jqepke5i17mcBF3M5
         LwaYF7G8NxPjoFq60FzBO4A9ELhMc/S/QqYMPq/rXN8zBKwTpGMvnuNA18hiH4Ln7vG8
         DNYirwpgQmW9FT8DdYGuY0WDmHftHqUz5ZgAS41jdJzayKfySDJS6HnrvItFUVYw5+t6
         wiKKhGS+IHRMaTs8KhgvHok5Pl7BIrL0lIcKdA/lGXbW8LF2s6TWZZTQT0hKJ1QJSo7M
         8Gsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761611947; x=1762216747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8s7zFl+2eb3TMAz+jhCE+xRnt2/MEJ1FXnvoxEqZlz4=;
        b=uw0l/kATXGJLvMudup8Kl1c81WYXqKzrSvL5UHFdlwBk4iH3QyU2Ps32AC4dal08OF
         sr4hd+5AgaeKL3M0WLK2d58xjktCL9D2CT6jKnjPT3S+hWKHrTXsYUDLMlyaXl1hqfXV
         X7Vmgw1vuyuWi9lAkaIkBM6W3a6YRBrE/L8GMJTLnyGg1l9u8mk3mmPMXWcKGgsb3qQq
         ad2h1NiFxhRtvL1QU4KTLmxfSAStXDNkiPVNXPzxamGebgZ9/NMyZ0eEgcmrG0HzSxGA
         WB7GcMuBQq6H6rzD339tnq8ARfPxAMrYzQb28WZRy13I4rNRFZ4jrjfhSZNzQVaLOaGf
         VrFw==
X-Forwarded-Encrypted: i=1; AJvYcCWQi3pEmvRvEDXj6jZbLK8iahzl5dvP/7O9QM+WGaKCq7cPbcc3KLwbeLbbFc2ZJ8MsLAZwmNI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBmiKR+jDkKUuYU0gxsk0Y7syosLzSs5KmLMEqXfC8AOP40iBf
	p0ic0wjZFIH2Xv+Hzmbjzhecl3W/z5FqnQurm9zI04sMpVoUKrI/w6Vg
X-Gm-Gg: ASbGnctwOgxYP+9zz6L6xqkNzpGlm++1/+hu0hPb5gycCaNl2IPePRtBRrOpdrgVvCx
	pDklKagybBHJt8CjDfQL2F9yOymgiUezSBZoyr1f/sYGZcgI+kxaiuPzdWNhrj+H+GVakA09VlV
	Eqsl114fsv2rTtkK/uUMfdLmWOWkUYTnW/rs/qIU9mMtue6ChxjwYh0vVpRFk3c/4kZVwEgWpDh
	3GVXqTFFpGg7UYtOfD2OZrGmYwFywUkc045ukGlE57J6RoTrDkXEyOMRTTq880tJEC3UUgE6Me4
	dnYKFA835GoUv0zNgCRNr4fe2Ide/ozvxJvOvfDW94CD4ZOkVGg06WEpbWVpMxRSdwg1502e0xZ
	oW+6hmrfGK9olkFtWURJgFxVt1CRe/qvKJsIOO8JesrqaHs86xkEcSOIJtn42GzIXsqR9evlwQw
	FzQXR3KH1RSfyswxOTQKRO
X-Google-Smtp-Source: AGHT+IF5ghXu9jBruY6ziKGQyMSMM4oq3ugUChPGlRqBf0309+0SovNGzWf+rJoqR49uQlRPUDRaYw==
X-Received: by 2002:a17:902:c402:b0:290:b14c:4f36 with SMTP id d9443c01a7336-294cb52db11mr21604075ad.31.1761611947142;
        Mon, 27 Oct 2025 17:39:07 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm94353925ad.12.2025.10.27.17.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 17:39:06 -0700 (PDT)
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
Subject: [PATCH v4 0/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Tue, 28 Oct 2025 08:38:55 +0800
Message-ID: <20251028003858.267040-1-inochiama@gmail.com>
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
2.51.1

