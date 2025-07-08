Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99202264CF
	for <sophgo@lists.linux.dev>; Tue,  8 Jul 2025 06:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751956872; cv=none; b=BrhYWm69LUnwEFJIkifNO2TTZ5bE/LLl5aC/e/XJbwywXrovEl1n5LnetO8oGe8SId4Q9Hu239nqt8zHKVG8Xnlw8G9ouEVB7bY4flOmEiKazAU1lHHHMXEKyk/uUixcCPno4xpyitmh7zcP0eC5Ii5j/pLMgOBb3N8WS9U07aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751956872; c=relaxed/simple;
	bh=oahrj+cAhI+XuKeAaCx2jkbVB+ACE3JA0NODR/XArhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FeQBP6YAz0QVCm8/riGxiIArPlz8fuxTid6qhcBQw94W0IXHaIicS6akGDCq/axJkiEXOdUx+vqiw4cCmMYk+kVmleghLLn7jaEZAA+MW8k7folmVCIHDy5AMB4cBX2zN4iFgLAhxwsmUYR281gBbaPOFK6STBj9EwQsdYaoj9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8ewmWfr; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8ewmWfr"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b1fd59851baso2804807a12.0
        for <sophgo@lists.linux.dev>; Mon, 07 Jul 2025 23:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751956870; x=1752561670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLiBq2WXDjQXd+fjZ92LJ4ai9vU68aXWw+t+C2oy52I=;
        b=O8ewmWfrY+5SWZZStWLAmaUgaH/bPaWcu9PUCT7TG29eHG6g4tKYKA++zmj+ykOsFH
         pgaaWY+DU+Rkp+Iv2Dv0A6Hn/czxmCKPxyz6rgv6ZFImjJOUu/tTG0VFGS25plu8c2X2
         WbQoPF9wKRVMMY5l/T/oonSEnErXUjhxujFnTyAJ7gqsehzkTsnSp7JuMsmrD2mqpRWM
         wzqpFncxLLI/eAuKjmkVY8StGssOBZ9UGH59aDsz6PJMF6+xETc1XvYZ3x2zHKbisd80
         E/sPZvRQaQSQyhfPSeoM8qCfP4Z6iJom9h7RMH8r60ua/SxwEaW05nTm/p+7W6YKR1fh
         4/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956870; x=1752561670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLiBq2WXDjQXd+fjZ92LJ4ai9vU68aXWw+t+C2oy52I=;
        b=gs+5g/edO0sORU1RD6f5QvfuEjAXX6UL9mVPchnBDdxl0msk2Fo0o7lcj4Ckylsm38
         3GWw/3saTQw1y86MeI2MNtxUk48ycPR7FjHrji6mdsIDINfExqnD4I8tfFCI7vCuHI6h
         1Rw1QYQQjEAcKO1BELIe9xj5+ioXYvP0MN33LbgDIyV+oSrNP2l8/NjFU+pixpbyZ+e8
         lNKX/Y+rxRHpZYyoISfz91mJNDQ1Am8x+8WOzmkeYg41yhcvjXRgRuUjqtTGMjmhXnys
         H3bhUkMCRk2QXQrKu2vsq4XignoydWs1XWG0q5agN+QSy0R4ngFggRj9oZ9ZPcwhPBlP
         e80g==
X-Forwarded-Encrypted: i=1; AJvYcCWqpsRbVWQJLPt2wyJtZErmz7Jx26abvmGNohETnaktqsardb14S0uDHimMzh5SJA8G1+aPD3k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAuzbx80e6QJ6q7PQGRa2gC7imR0xYn/sOF301Dzw34yDWIQvd
	cHN+5y1etuN8hg/zgkn7DwBc25eU/ClI359kjU8FIJFoC8nIpXC2zq4g
X-Gm-Gg: ASbGncufOOyIE2s7khrdiN+ETed4OokCEQSg+8BcVh13NWUTtqrR/UVWY3JFQDOKrB4
	zLYAXrFlja/TFw2YcQVoJAAqpthT235R04drxIZfohQ5IdrEnlDCNAUnRe0v1hYkvh47KtX2GqX
	HhaBB5+BuOL8NGyIi6AIzrhbO5/vUrHc+Nw0upEI4xtIy5l0jxpkhIIaBF355xkBNq5TtM6fgXX
	ufxHYFg4dZntYvuNxGEvc3yLw7Sd/ZQq6sas+ixNgOG1K48v+Zhbzmnxl4yLjyqmyt9tyj1MUwM
	pcsa6Nq0YzvxoJoFZBQHFREF/yt74r8i6PVnaiazKv4zWOtg3vsfG18i3lFGKg==
X-Google-Smtp-Source: AGHT+IGLMBKLkTLMuH2Vb0CDrC1iseBxe/ZnNx75ISOJrVgy0Sw4kB2z+b7qCz4DGT+64Y7TlWzLGA==
X-Received: by 2002:a17:90b:1d52:b0:315:f140:91a8 with SMTP id 98e67ed59e1d1-31aac4ba08dmr25723943a91.16.1751956870099;
        Mon, 07 Jul 2025 23:41:10 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31c21d27f09sm1203410a91.2.2025.07.07.23.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:41:09 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH net-next v2 2/3] net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC
Date: Tue,  8 Jul 2025 14:40:50 +0800
Message-ID: <20250708064052.507094-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708064052.507094-1-inochiama@gmail.com>
References: <20250708064052.507094-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds device id of the ethernet controller on the Sophgo SG2042 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index 3303784cbbf8..3b7947a7a7ba 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -54,6 +54,7 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id sophgo_dwmac_match[] = {
+	{ .compatible = "sophgo,sg2042-dwmac" },
 	{ .compatible = "sophgo,sg2044-dwmac" },
 	{ /* sentinel */ }
 };
-- 
2.50.0

