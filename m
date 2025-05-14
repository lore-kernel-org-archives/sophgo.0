Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E696C19993D
	for <sophgo@lists.linux.dev>; Wed, 14 May 2025 14:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747231783; cv=none; b=Oicf/wCTP0FVuvPVbvF/tUO2paClbyjvgI1jtxyNe5IsgPdpit9iw0hnYAUE5/E1HGQuaq+EjT1glXNIsGMBTQDvzLa+1cnSKoAUbkO0qtwDltTKCUhh7uJo8x35kBHKZEZZ6THu050z6stXg5C0TXK1CUyZxv5LRjuLw7Du5So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747231783; c=relaxed/simple;
	bh=jtuwUHlX3+iG8Fi9cbmKTqWekKcTfZy7Iw99rXtY8Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vpd1lcNj2oV4yjOi95gKSMcDJjdaSB7ytv79Z+TFgZed7bTZu4VGMMh23XJA8PuHDg8aGIGSQaQUv8tYJ+sg/05c0UFJkd45y74hYtisnYQaXvr1iLRT5stL3CMaggnEw2qkmkWQwqGPdArJcder9B7VBrX0syGsWkBKVdZsNCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQOyuXoq; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQOyuXoq"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so794268b3a.0
        for <sophgo@lists.linux.dev>; Wed, 14 May 2025 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747231781; x=1747836581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mi4Jjo5G3GnzckLRIAYTmEBkSD8of8vYNq8Vo6cNBQo=;
        b=HQOyuXoqSw6PCGxPXjLGiNWvwbGZQp4NuLF1SK5tI8CaVT0WlzIFiuSWTyizb9sMHb
         RlsdTibfQtatDQ95U2D9M7F+dn6TtKJVgivIvfEEcdBYzqSeGYUbsgU8/nqYZqbni8Cx
         Jf1GHS1tWRRfeL6aOZTD06/hvJhNUf46iArA4xVFyyI2qcVfCqZCWj6HpFZBH5iPonvK
         U+Ek1nNmnZ7keOV6bN5SYahWnDABRFyMaufyLbVdZ7YMD2BiJNUjSIE5Re6JBS1iGO8x
         giXUbM+6VKZDlVTbYLEu12a3tR26dSFzfvWrrED4dcCvzMPydFr6MbYrLBZtJgN1gWj/
         6Q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747231781; x=1747836581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mi4Jjo5G3GnzckLRIAYTmEBkSD8of8vYNq8Vo6cNBQo=;
        b=C4SbxAAjtDKYmc2sC9+YHcpRgf8DoHOWO4gxW0dShkuGjrRdBu9LOT4HED9le8yiKz
         tRl7eisFCi7liKJs4OiCQRQJ/dYJZxmWOKnLeuruTdde2egt5hUQOYXLfey/2YhxN5TD
         e/KvreLewNp2tGMCIg0xoqWAgm0aByUZg75+Yg4jAaLem72NtKDbwRMSAgdqoaOFUmem
         J2sXOGoenPR5j8Ip6cMqpDHc2V9pOkHjwrtp8y8KC5yTT2+v/ApenP6pbxEVM/I6s/M7
         DsdPCJrbB6WQhBcW/vTbQSzdA2K4JGQYazxS/pQbVnUfPm65SuMXarcQeo+joOzRXJnH
         mMQw==
X-Forwarded-Encrypted: i=1; AJvYcCU5Kj2tf/WRVZHhaus0q5/9cl1DsOGAgJKlMrwsCgQ5sWTbS5R7cVy58SfYc0Pyr2ezLzcYjLY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEBjlqwFzgIF6vr+bwCzMO/94ZyUasR0b6PC8vso7s00yjuTC4
	OF8x5NpBSNm7wSmTqewKV3KGBA1XktZztbdUa3G9t1aZs5SSO1ob
X-Gm-Gg: ASbGncvIn+65IBKf6KOheBRaTPHHStOSaNjWo1oy350NXPEgAwcQq93zep5LXmoAFFX
	/0ulsQPc7efHarIy8ETZ1HmJrs+B1wrTEnRqTSUbXNTvnmCMu4ZNk7DJ7mbdwaEkLimdC5g+Eh3
	vRVALWiBEG0ru2M1HLBZeYf2azSrT4GWe4h3PtXYZs5FLC9H2QdXNwkoiGeNrEr1DqQh01n7NX8
	HqLx9QVfC1tC7C1aM7QOtdPnx1Y62quZc8Gt1JugBFbm8sTlSOuGP4H6+GVX35nfXqH9nGm2LEQ
	kxz6EsCZJWA6ZC/l1w4QmrMN+ftEEmmUmQ8RqNw5oi1/gtSYZUHmpVRhEM8J+A==
X-Google-Smtp-Source: AGHT+IFeGj2HFjh76QOSi0Fc/JuAVTbh4RgUmkQMbFSYupsEYoo5O+6KS/6gkrMF6eL36ZIM3Ny6dQ==
X-Received: by 2002:a17:903:2f88:b0:215:a56f:1e50 with SMTP id d9443c01a7336-23197f346d8mr58402225ad.8.1747231780498;
        Wed, 14 May 2025 07:09:40 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271ae0sm100407975ad.128.2025.05.14.07.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:09:40 -0700 (PDT)
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
Subject: [PATCH v2 1/4] dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X bindings
Date: Wed, 14 May 2025 22:08:59 +0800
Message-ID: <b538e2b24eab8b740091d80ca76b20ef6014a4e5.1747231254.git.rabenda.cn@gmail.com>
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

Add DT binding documentation for the Sophgo SG2042_EVB_V1.X board [1].

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index a14cb10ff3f0..6c82f89b56ca 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -34,6 +34,7 @@ properties:
       - items:
           - enum:
               - milkv,pioneer
+              - sophgo,sg2042-evb-v1
           - const: sophgo,sg2042
 
 additionalProperties: true
-- 
2.47.2

