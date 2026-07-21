Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3880445AC4
	for <sophgo@lists.linux.dev>; Tue, 21 Jul 2026 23:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784676915; cv=none; b=GPqqgv6Dou/g9qyrkWsjdZLEaKw34u/eAcji1pUCfbLVZNFQj51yT+Zs5dzHudyc/Rk9AkEqZz5Vn5nn32TvarSjLomNrl/UEehtDIGYhlpRWjojHiRqDBPYoyi8ugt2ckySkxxf3JBhpsba/rb4iut5MTFkHbr6RBnrbZpLy/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784676915; c=relaxed/simple;
	bh=bnvvqsRWp/bLKK/Yo50qBp98JuVsOPyd5em3lmpqY5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RUT4as9Iur9uL1zdRdcPHd/QwFwd94aYFzuD9SHaTIIQj5Rl4m4UOxL1+HFEBmiSKn4f1r1AO6zATqtdehJ9BjWDAkChIde/MGS0Hhhslmg6pFnf2Hp+9kU+f+KHVFg3zkhkuFG1K4vLT9ilZYqXeRAGUgg99HlxEBXlv0RMzxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RcSNMvuP; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcSNMvuP"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf49dc28ccso6573845ad.0
        for <sophgo@lists.linux.dev>; Tue, 21 Jul 2026 16:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784676913; x=1785281713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4cXmnlu6jiskgBAJ4hnLEFeaRkSGLWSy66NeKTndVA=;
        b=RcSNMvuPUGOr0BnmvBQgZOtJKskhN5HcRk1lJ/zEQ/o+kCJKMWrd6V0zASp5AMGszh
         8KJpr71MK0xaeTmis1I1H6ULzhKvC9Q5QcYoD9ASHAv9aIcL/7D4TufqhlDHCw6PffYr
         BrGmegmSPkZAM4qdZXW7KA7A7mcHEQGdiT/aWBvwGiFD93sQZ8LZjVubM6CgqXMX0Oyn
         KRvoPWHKs3VSI8t4BOajXJyNDjknvIa8+KaRdqLPcD5HgbZSDJYK60gyHf4d6SCTfUgw
         U8e0Z8Qm+NVCwgGBbL0C5emoofTaR+to52DS54PJcFRRZ8G8gI0HPop2KyTdSGqAFcXr
         IDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676913; x=1785281713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a4cXmnlu6jiskgBAJ4hnLEFeaRkSGLWSy66NeKTndVA=;
        b=jR+AmWhGTYwX8TIch0AfXEOaDyrxw6sLBN6//IRQHZomOMGsDzsYiCDtQTeitjuBRj
         kBulMNqOWe+ltIn5HDKYJFVUDUIiqo5FaGmZ/bbRYqmfFEpSSKRJWYHhN+iqgQC6XEjU
         p3zbe4gBS5bbBA7G2pcRbmQdoBK5v/PQLuUVWY1KQFAFZxv5ZnPK/gHgZYLv/mJvWQ+m
         rZ3xi7o6Wy+LJtR9NRk5e/BsteTTfaeTflauX3IrHPTzE3vQENC08gI72tqeECkolGTQ
         qzMtzUa9SrWXb3RDW16Kq8Nw4b/w8j4yptf9IqKMfAnLzoqXgGK9S1DLFVGocuNqE9oX
         112A==
X-Forwarded-Encrypted: i=1; AHgh+Rqy/Ou3B8OVYaXchyCAyU1fUqSWuTByRHLFCpm0XdIHfP/Fbzjf8xr80T4YMcaMH4h5aIEcoQk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ0ieCArqaUlzDLK/JjCc/XOeedjWMXuuG3CDJADcr6HiSzb7q
	dq8Hdud8SjG/vqetFpPb7CTBxZ1m1Nzdw/hONBPooHN+BbqpKG38aFNr
X-Gm-Gg: AR+sD1305SAfbfID2JzLwL7tSDL2ugsapVusExtXhZmIEd5xdh3tvPi//XwhEyfSa2+
	4GUaIckde2AR9McgrkHD2BnqPYThZC4OMZg9ir1sJdaevfjHWaar+Kd6jkC1hm4mpwvbsgGWaXd
	v3cDVMV21vGK0ORiXffo2Ie9xpDFPR2I8mC9sQSeUTbmt9JEZQMV/YFO9/r4E2nyRnvnE9FRgD2
	Emx8ohkTFcvg3S6MiAvQl1YBBtxKu8ArgqrF1/Pn3uDAtwBCjm6mTGgXfSS8DFmsl4CU1FaovvF
	jaDSfMIXlT6EBuSlpY9E7idniWOxbsrdAcEuxDqztztjvCB73yrumlBnzJ3FxrWHZNEdXU19c79
	2wxw7GqFZNZvzgkKFYRrTRYDacpQhi+G+GdnZZV/yPDcJqFu1bvq+qkhWAX15vj6iIYHzZqgdC1
	8Zl6l0nCc7Hxkgs1ry76nlJf6gcXz72OaCWNZw+j18oaI++t9HGnBgnX5R7enUM3gw3ht8fpaBX
	oXsr5jecPrDZAVnlPykFM0OnpUebAAQMEhrsGhOFV1VLAN/9G0=
X-Received: by 2002:a05:6a20:2588:b0:3bf:b625:5bbb with SMTP id adf61e73a8af0-3c40fa49621mr4335934637.6.1784676912974;
        Tue, 21 Jul 2026 16:35:12 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ebfcesm245353a12.11.2026.07.21.16.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:35:11 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: chen.wang@linux.dev,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Han Gao <rabenda.cn@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/3] dt-bindings: soc: sophgo: add Milk-V Duo 256M board
Date: Wed, 22 Jul 2026 07:34:42 +0800
Message-ID: <20260721233452.112204-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721233452.112204-1-chenyou910331@gmail.com>
References: <20260721233452.112204-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for the Milk-V Duo 256M board.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 0b6fbab48b74..99194d8721ef 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -35,6 +35,10 @@ properties:
           - enum:
               - milkv,duo-s
           - const: sophgo,sg2000
+      - items:
+          - enum:
+              - milkv,duo256m
+          - const: sophgo,sg2002
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.43.0

