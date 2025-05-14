Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535951A08BC
	for <sophgo@lists.linux.dev>; Wed, 14 May 2025 14:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747231793; cv=none; b=E+nZmM8P5SGET433Ty+QJfJoEngZ7N4oFxXdot4/dWmwU13R77VVbMAfIN7KObilMxYMmtU/qZjPQCc3YxYE+X1upnncTxz7tD75Tba7prduyApeWGriyQuE/lxrH3JwmRCQiS2F4Oh9BMXFlKc5/ojF0HGlZ7AWDGSiN+TG+Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747231793; c=relaxed/simple;
	bh=4dl5+OZfqhFPLJo/Up9uXG6VoEqoKSsmkzSEs9Y5fSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sj7Ku4AZmyFgDXVRvzYC5qUMCxf1GCOoBZI4P8xsYKG768/LFencYC+uaOpBcreIt2/Imu15Y3KT5kkDHRZPlXtyyj31BFkJ7pHrVaYRf/vnOwn3X5D2XrVGMYVpR3cwNHDJXZHOetAalrnDD6M1Cghu/xdZgfo4fNRwhArG7FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CU/nlifW; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CU/nlifW"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22e70a9c6bdso95252685ad.3
        for <sophgo@lists.linux.dev>; Wed, 14 May 2025 07:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747231791; x=1747836591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/YcSt7LXpLFIToFcWwcO2jaJLtudxyRIp4lpPUkGAE=;
        b=CU/nlifWcEAv5Mfog5itdu2PooOMWhECOZVprEBCo1rFk1DXvsW2qrVhw8kWyvmTPE
         V7KQQcQUZ7wpvGqPDwR4UKJLELt3y8q2xWCEql9LUQLhfyN8+JBr82S82pezTR6IkzQT
         MWLSUkoZxVQ6wSdS/ZHK43BQQZu0F+Olv46KxfCHD37qTHt9bc5bPspJHdIwtn9WOZd1
         fCnsJ3rNPJYhTEub47Ql+XmvMJNIe1jhLKQU4OyGrpz32thYXrEid4yJA5N7pRWMzv/v
         +AgAKJaBJiVg4/lEw3vzBX0u+kk7J7xODiCvvQ7H1YUX9f8CjFvD8VSfcdh9QB7/gtT2
         +lRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747231791; x=1747836591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/YcSt7LXpLFIToFcWwcO2jaJLtudxyRIp4lpPUkGAE=;
        b=TqaiM0I5+pvBoXMDIA/EpSnVWnfhwcfvv2xzp6OmhW6FVyMP+OtRg4uqXiV77ErJjt
         n8Az/vPHQMXafu+yyaH8Fdq/ljmAZgBq/6Vckxkk5KcyTbe6Qappz8Cu4vIfcTN4npHS
         5plIsq/fV6r4C7LOXl242h3L88X1oP56xxy7EnAOCcpA/zq0HqNDGTelxQBQJ80kYGgz
         +XM1swBRhQMKm2oJFhGFlIsv22EkAJc20hqrRieb1Fn+jvsXxIkjAvgVysPppd8oA8h/
         YqArTxDa1ONKHt2dRLlB88yspKHW8+hiNnQCPnD65bLV75zY2FBBQ1C5JNPMD+pt4r9q
         WcwA==
X-Forwarded-Encrypted: i=1; AJvYcCWABuHgyGiSsmJZyUptC2bwv4IgZaDhrwmfJjAg6DsUjGVcLFo4sHGdKHeRAFsnxjx+he4o/RM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmnsSyy2KImfRBgdmH9lPtOyoHGU96zD3UFUxRosE+H+bXhqRV
	sDUT9n1024aX/vSj2c3lQZqYDhnNFADKBaD5RNBVeuPnytyEb697
X-Gm-Gg: ASbGncsfxYzJXmvoEOgtZUu230ak1fFa4B8ia3K6utdPorq5+91HKbpbjmnhfWe7NPb
	5hjPix0D6sfukQzKU+7PCTzLjSZctzMF+CcI9DrRHuxdSFJXftkjtpuw5d/YKPkkZSQVTw15sij
	xSbq+uk3eW9NRjN4CLv1WLWx/Jhq555xTMxmWV30V97RdviNPH/S75r36cd4YlEqmsuPaqBQEwt
	OQW4RRj5BECoh+Th0aeqDeYz3urAkHu8Oga/0p8pLDLDZBxpnm82OHCZrpiI0Wnade3f7/EmMV+
	Yyu6JC81C87R2w6WCCtzZ5rjEGs3IW9LdQoSwom0DCTocS8Gw+tswAc+Z/TiYBarM9iSIoXB
X-Google-Smtp-Source: AGHT+IGE6zR+71PFZJvXrrGxXGU1Je58bhDIMNTpwJKTTEpQE/rNBSGSw+vM8hybiqYQ87lEF5ZG3g==
X-Received: by 2002:a17:902:fc8e:b0:220:c067:7be0 with SMTP id d9443c01a7336-231980bbed9mr43762735ad.6.1747231790969;
        Wed, 14 May 2025 07:09:50 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271ae0sm100407975ad.128.2025.05.14.07.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:09:50 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: riscv: add Sophgo SG2042_EVB_V2.0 bindings
Date: Wed, 14 May 2025 22:09:01 +0800
Message-ID: <dddabd3bb2c718a506d2b6669a8252cfe3872fa9.1747231254.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1747231254.git.rabenda.cn@gmail.com>
References: <cover.1747231254.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding documentation for the Sophgo SG2042_EVB_V2.0 board [1].

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index 6c82f89b56ca..cbfd07cc053d 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -35,6 +35,7 @@ properties:
           - enum:
               - milkv,pioneer
               - sophgo,sg2042-evb-v1
+              - sophgo,sg2042-evb-v2
           - const: sophgo,sg2042
 
 additionalProperties: true
-- 
2.47.2

