Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7CE28CF7E
	for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 07:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750143790; cv=none; b=g73cZwZjgIRLLop20cPG21qwJTYSEwLh1t9c+AUvKUHpKmv6/xo4isz1Q4dgzwoJUeC/WlhPwwynlLNdpKHBdnqlzSaFKMFyN17IKZtKLpjBPl8heGQSt4+N6JfojQfuCcoWckhyIf5TLeZFItc3rL2c8A7MrgSPvfBG3b6KSdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750143790; c=relaxed/simple;
	bh=WcoDewO9FlS2NbBymjhWkclV9EvlotZFPJSbv3ynplM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AV9LaKplLEFsX7BGYf1qPHhD/DP7XL2pdlJyeNE6Xk7jmwEGeZPXSbb5K3zcdLnd686lH5P49lEcvufsuZL609KItgI8pdSkVGE7IWDWzDlNWSuBXMz94xU5nHw80iFnAMDcpbBlZofNNg0g1/2waMf/JiyiFQrhu3rqydgKCIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgVuH7zk; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgVuH7zk"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22c33677183so45175055ad.2
        for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 00:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750143789; x=1750748589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUSaq5iVGlG0zdfVbYa1qB2wB2qIwASCB+SMQsH2sLk=;
        b=AgVuH7zkw6kyqEWuJAbf7qn/Bo/DQaV6pDMDCMwuN9kTcFDRnRSAg3sBUn2870NSkd
         Mi5o3lMY+g7ox1SHC+x2rfdFm33BzcWncVatMdXAO1eahCZFHtVUP1/cApXzZ/6MI32I
         xRFy19DoRl36qP2NTfEQKPDoRnaAVHzB03nkcJrTsa17wNV5uAI4T8gUlNNgwe3DbXox
         nkKxHXqISmfTjvn5/JkqOi8mC+FRKI6mgbTgX92lO9/qxHHtqLiOT7Nbt5nJ62UniG4/
         U5lKHu7guqNs2IwLIxZUpiy022TNqbr4PDSB3MT5ckoSEShqaQ9GfH490uIEOjpvutyw
         uy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143789; x=1750748589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUSaq5iVGlG0zdfVbYa1qB2wB2qIwASCB+SMQsH2sLk=;
        b=ZG/oknFkrnq/FjXNE7tYY4eppTj7GKz5v+62gbyWKSRH4gOMIWw5wZ7Zvl8wZnZ7mM
         8uF8ig+66jTVisNEEwSePPNiKgs4+/dVqs4qqz+hXrRccePahnCHAzl4lWpnjbIDO5m3
         QikK0ouTYTL6e5EkSmFunCygg/vw/a94CJrZfZg8mozVWtttGeKrIcLlj8k07ODWWX9C
         jjlsQXieunxP0q9z5BLjbGNjXrnZftTVF9cQ0z2LW+Jj/eBFpPYdKxzhNvVgYjGYGld1
         M/SRT1CbrQq2pwtrj1NJ/Lg/yINeoBmq3cV5d/zLwyc5NlNNVJfIpMTzvrz4DNJgoF6L
         b1PA==
X-Forwarded-Encrypted: i=1; AJvYcCUNEYw+UCvcTTXrLoLvwzKd3LZ0HeKKeHeFlmXsF8twCyrMNQK37WdhSyiOytUnV/Kwz+E6fC0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz54SZHsy+9XxbkSJEttSTYnHwMD86kMFF3CxAn3IYby8TZS96
	eeI7mGpb5mP8q7wymd/jkMO+TaxZ0Oun0Z9It8bZWxVVWwaCNnCjEeI/
X-Gm-Gg: ASbGncuzbzK5uc5FYe3JL+1e9gntiABV4OMv7VWd5t6N8DJmycgR+uX8qiXnC7bKzia
	af9xwGhBD+Pojo6d7+pMCmEOBwZfvQbtmOHQLaE0soli0DRAmhxkFGtnKwO4BGGOgDlJuhzXNOw
	+gfq9QmmIO+99UxN1e0WNe0qvZ6ZxGis+hEEnEuPXvKEHShNxkiSn2080Zf6aSlK3/o/X8ihYzB
	TlfIukzEUmR+Yc3DfMDlNg7VBr6w+xlBYIrfVB19vmrjCtQH0SZfjZyJ6wZjCO5AyDdW78NONLy
	BWx4yHEL6gugfr1J36exN8LoElku/A9E8tlYlBORCjXCnxi8XxvyytiozxoWmbdNogPUhVnP
X-Google-Smtp-Source: AGHT+IHcjeI1Rw+SykS8rTbHJZlwn3uGXgj/MA4H+sRjd8G3JU1s3lnpobaJkSb+cj1Dicl+oIhqlg==
X-Received: by 2002:a17:903:3d8d:b0:22f:c19c:810c with SMTP id d9443c01a7336-2366b19ec24mr124060485ad.51.1750143788808;
        Tue, 17 Jun 2025 00:03:08 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d88bf6dsm73043555ad.4.2025.06.17.00.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:03:08 -0700 (PDT)
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
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 2/4] reset: simple: add support for Sophgo CV1800B
Date: Tue, 17 Jun 2025 15:01:40 +0800
Message-ID: <20250617070144.1149926-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>
References: <20250617070144.1149926-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reuse reset-simple driver for the Sophgo CV1800B reset generator.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 drivers/reset/reset-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 276067839830..79e94ecfe4f5 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "snps,dw-high-reset" },
 	{ .compatible = "snps,dw-low-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "sophgo,cv1800b-reset",
+		.data = &reset_simple_active_low },
 	{ .compatible = "sophgo,sg2042-reset",
 		.data = &reset_simple_active_low },
 	{ /* sentinel */ },
-- 
2.49.0

