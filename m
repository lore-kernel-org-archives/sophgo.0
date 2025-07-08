Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244A0221F26
	for <sophgo@lists.linux.dev>; Tue,  8 Jul 2025 06:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751956865; cv=none; b=nge61qwKTR79m+m7sOyAT0f4/52zXUQqr07Uk6y5ezQ2mA66t8WzZ6CbQor9wpTa7MLXm6QCMEqLoBRIpv5Nu4BeAtMJgzE+Na5ICT6cIu0HONrs5LMGmHsXsq9e/VNUw2lLJiQdXmA6zZ6rhipI4CcUnkVjhLHPIe/V7QLPcCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751956865; c=relaxed/simple;
	bh=IMJpd0GjuVn2WZZRRSA1sr85+Wk8S8n20D6MuGdpS3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X3hzRG71viy+yikKmZ4MnQJls4quSfAe0tmo4bWQIzs7KZMzj1wEDu42WqNjUVDMcOouHKRiSRvv7VF5VD2wscslo6qkLX9NEQsk5fJggPZm5wTP2fy9e2+Qhp3iz4yZSbyqm+/7G8+hWEMD8JkWkJSxCJAn6+JODIbELoKWbbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NvExhzvp; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvExhzvp"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235d6de331fso51560755ad.3
        for <sophgo@lists.linux.dev>; Mon, 07 Jul 2025 23:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751956863; x=1752561663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NYG4DorpfLLHRrZb8LcTYUGaXr911+Bv8Mdy1JA60DE=;
        b=NvExhzvpowf3gHBRye10kBlx4V9T3WHkcfhfH+8crzJSBVC0zQc2/MSuqZmoUln7Zf
         c6S486dCQHEsZww5FRWH+D3CHW2JyrfGTKN/eHeYmd2m54lZKQvtKAHaInOKETnTSmqC
         qyb65KBDxrM3YRQNTi1BitVbdDu7QcSIoi2fWt71yWXE6emJ+VzURz7V9NncXPqgDiKB
         gGofUCNqNcFPOPloYTJ/5yvUPlJKL1fdHKeQTko2o64pHhcJ8ujHpXONNZNYfETjH3lo
         kpokv48DBbGYbTtwJd8ki8x8NtffbM12hICBOwiOHEAji9MXyeMCwUVFOXjar5uRzHhq
         YdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956863; x=1752561663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYG4DorpfLLHRrZb8LcTYUGaXr911+Bv8Mdy1JA60DE=;
        b=qoZNG/0m1ECm4Wz+FbCkEqnXBPHvpVU8DlUwAon/2LZVZMVAt+t1YLkzsra+CV7M+n
         KpLIyRsKzGwomE2n5ZunSAFQ7UD86+OX8n0bf1TkyinbVBe3697nluu9alGEubg2wn+K
         3Pqg7Qxc26B7b0E6aTtzKkbL/m+0ycsimfpZLYu75BXmoXnXA0Ys443ZZmCL3zILgNyp
         5YJh9IxsA1UcEL/J3a75SW1mDYGY305Y6azwPqxvRaud5x+J5Mu9n5czlsALxmJcj48H
         i9epIdRDjzL6YaTv4XGJpAQigaQBtZHJxv8VhVqtBCzl2GyUnGa8fYnBQPVuJ6BJYTfD
         cjPw==
X-Forwarded-Encrypted: i=1; AJvYcCVDch7le3Ob3U76C/BMw0euV4br2C1ksVtc4UeQ//8+TGVU3Dp+wDGrWKrmIpGIt0gSYlxtbuM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+Ct+uOv3tIRBb3mwHd7s9as3f+Jg8fW4VI1L4OAAtmpfSSC40
	SQXH0SxGSNMDDKKExAuUwqUpTbcsK3fQfZScW3qrIpaEIe04nHs3sXMi
X-Gm-Gg: ASbGncsrKMk1zru6T5FLMi7wb9hsYrzd/TRUwzUfSqyF95+n3ULKys8/o25XNQqfncM
	xRytTmcl15Us/KADbGW/XITKH0KNzCD9ikgYw0RVtR3TZkEj0a6Ie83a9tVhZWLmpN87uQQo9WR
	OuwDAyvjTCGpJLg4MtDR2U87hAp/5TAZ8Dwmv7XhH1g+YR3Hur5vUoe9YRlWuq2rspeOZ81dYGq
	IznkE+WIshdF/0A+Jspr0S+7t1DwI+3EdB6XGvVg8FEUWCEnQf5ZX4IHbGk45XvQN4lvsBnw7b2
	cBfogLUEOHQ7n4761Rma8ybQC/nLivDVqgehamyXlz1cO3YgjSjt1dEopAk8vg==
X-Google-Smtp-Source: AGHT+IE8dNh/94h7PP9qu+pz6QETQuEDR3G8DOsyx27YTdMrR6Zstgx9PwNjmLqJHYn8N5lM6qUYiw==
X-Received: by 2002:a17:903:286:b0:235:ecf2:397 with SMTP id d9443c01a7336-23c85e7671emr225145495ad.33.1751956863291;
        Mon, 07 Jul 2025 23:41:03 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23c84597371sm108407375ad.207.2025.07.07.23.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:41:02 -0700 (PDT)
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v2 0/3] riscv: sophgo: Add ethernet support for SG2042
Date: Tue,  8 Jul 2025 14:40:48 +0800
Message-ID: <20250708064052.507094-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ethernet controller of SG2042 is Synopsys DesignWare IP with
tx clock. Add device id for it.

This patch can only be tested on a SG2042 evb board, as pioneer
does not expose this device.

The user dts patch link:
https://lore.kernel.org/linux-riscv/cover.1751700954.git.rabenda.cn@gmail.com

Change form v1:
1. add user link at cover
2. separate the devicetree patch as a standalone series
3. patch 1: Apply Conor's tag

Inochi Amaoto (3):
  dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042
    dwmac
  net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC
  net: stmmac: platform: Add snps,dwmac-5.00a IP compatible string

 Documentation/devicetree/bindings/net/snps,dwmac.yaml |  4 ++++
 .../devicetree/bindings/net/sophgo,sg2044-dwmac.yaml  | 11 ++++++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c    |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c |  1 +
 4 files changed, 14 insertions(+), 3 deletions(-)

--
2.50.0

