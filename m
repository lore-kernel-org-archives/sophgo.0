Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB272204F73
	for <sophgo@lists.linux.dev>; Sun,  8 Jun 2025 23:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425009; cv=none; b=U9+f/pQOU2D4O58Jp4ZQXHIBlnDJ4GBo/N2zPbCzhxewTQIQmzce7+KOIfxKLQA2Ewei5vtEQXce6r/czfdAa4LTMK6l4XvzkIwCfkOnxMDkQWVcjTwxt6xvSYeWaP4nRv9gSPzDU/O8wM3xnW3+tXMyQ0qwcSLkCrIuk+DBXQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425009; c=relaxed/simple;
	bh=8nyJl2VTV7GMu2rxJX2z1GOD9jD0hX3cPo2UqJPGUSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rN7Zqqc1XG9Bycv9EhwslTy3oiMFAxGC7XPaD7sHS+xXJkzQtIx4Z22CzhBB9Yb5od/2Ws7Jj1FtQzjgic0wGO5eQoyyfAl4fneMhjZPNmcSDYV7eGPC7/lZRq0nu8Ll3bZj7krFhXqw4N90/NKR+kW0BqVJywLTcqNIm0rzKQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYCOtACO; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYCOtACO"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6facf4d8ea8so40894706d6.0
        for <sophgo@lists.linux.dev>; Sun, 08 Jun 2025 16:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425007; x=1750029807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B4ztGDayPcphCzpFWNN1YhJ9kz12KF6Ra5BCbScpRJE=;
        b=iYCOtACOzScfR7iWbzfg2lsJpN4EMlNxwTSfWb1ES30mbLncsi6+LcfOU2BtlpJy8u
         h9kC4g4W+iPTyVrt7f3BEtKDp1kBh0hrbSakZln6kbSDXmIAz37lX8t2yB9pdKCvzMeg
         xHBtjDXAte8ti4EUn75KuY2EZyBpO7bkHzBr2CMhJ1z136bp+XK1YupOoFuLqdqP9kKM
         /R+RH5CymIySGs7PepMCFoKYDUc+hHv9R+qNKgOpCQ2VnkB59dUOSrn+3Nic6bC299Cr
         ixguMBC3ThCfLxj0CgOkJLMijtp2CWKsikEUT3kHoO7s3bCRbuAjwaHgKVeba9Ko9s56
         RFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425007; x=1750029807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4ztGDayPcphCzpFWNN1YhJ9kz12KF6Ra5BCbScpRJE=;
        b=S2cgMqJEL7Rs/ywYbN+Bo6YRrNtyFfhseQGp6qSuy1KYLlJhH+dM+pnvuFdy3eEqiw
         TtFypvWsb/VDNA/SmP4w8/S5BwsaSwZGW9gcwEuFTsJSRh9OCU9r4ZHq/0p72ffAlle7
         opa15+G49DEF8U4MrjrVOPNDdcGR2OnhrYaH9xxwvX6XM2suLd9wbhUdNma1I8N/vrMm
         /zXmYYf+7a1t5Q+sOkj8mYSF//T+te+/iXFXQo7ujwgNLDT2NpWXca0DgHYumoSScpWb
         NjwjRP9OlW4+iuDmPp6mSe1pRAXPhyQuCH7zuzlcEl/V3l4+eqDeuHZNVX2Wphs6RSh1
         Xufg==
X-Forwarded-Encrypted: i=1; AJvYcCVFRCfpppUuILAWQZBKGNy75ZJYdMcxXKMrW+eGpmTRrkrcCfklYB+YehEhizPXaY20oHG/kso=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiFj5uC5+JC4SpnVnwrntBoEeEmu21FsDrdpckI5ZG7ysPhC6O
	Ji3Rtp5WVyh8Z7t1HCAurVyOL/YqgXzcgx12NzzMTUa7xmjR6EDZ/jFg
X-Gm-Gg: ASbGncvY2Rh+YoGG7r1IdktuRGy9OwUygmLMZdNHljioLDxoHvU9IhxGE/CI3e2Iz4Y
	KDluEJGRZoOHo2e/G5wUjEO2728LMO/pKkv513Bm1p7IaKJDYiiyXIaVR/31ZFdZELPWKc57AK7
	M+sjrDxYL02y8eJOmHn+AWaaR/IXDTigxlUTq1TU4HGyLunHI330nJEdyoZ/5Woe7/CvTkirkTS
	sbE4Ca7HKEgO86XTAqAH9C4eJLkOtiEkmdfbYoFOBzUtGhxCj3h9GEmlhERiMeC7xDIrz/cBJU4
	zqtcOukRRLbWN6SORwNbDcy2Pqc=
X-Google-Smtp-Source: AGHT+IHtUJpvNl5aNUZVpUdg2XqDfl4bs/f4Qypy9pWtukoC9Rh8xegAclLHRNalOR8QtthxDIY2QA==
X-Received: by 2002:ad4:4ee6:0:b0:6fa:ff79:2cfe with SMTP id 6a1803df08f44-6fb08f6d9bcmr168703316d6.12.1749425006716;
        Sun, 08 Jun 2025 16:23:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ab8a25sm44213946d6.13.2025.06.08.16.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:23:26 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/4] riscv: sophgo: cv18xx: Add reset generator support
Date: Mon,  9 Jun 2025 07:22:06 +0800
Message-ID: <20250608232214.771855-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
Add necessary code and bindings for it.

Changes from v1:
1. rebase to v6.16-rc1
2. patch 1: apply Rob's tag
2. patch 4: fix wrong reset ID

Inochi Amaoto (4):
  dt-bindings: reset: sophgo: Add CV1800B support
  reset: simple: add support for Sophgo CV1800B
  riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
  riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series
    SoC

 .../bindings/reset/sophgo,sg2042-reset.yaml   |  1 +
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 25 +++++
 arch/riscv/boot/dts/sophgo/cv18xx-reset.h     | 98 +++++++++++++++++++
 drivers/reset/reset-simple.c                  |  2 +
 4 files changed, 126 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

--
2.49.0

