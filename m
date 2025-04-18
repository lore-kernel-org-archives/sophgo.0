Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CC924B26
	for <sophgo@lists.linux.dev>; Fri, 18 Apr 2025 02:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744943422; cv=none; b=Js5jCaHdIyFjsEGCDg8UqaT3/CVLE1tO2M8PlLSqCxk8LWY/4/h2nZ+yg6LtjaSGRCyqig40ryktjI/N+2OH58oye1cBAWWad0j72Ocx+Ojdul2ADEvF2DfVvZr5AD2Hp8PvwS4XJ0v83eq8ogZgwPfIBCVbdn/GOdWLRQr4Ymg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744943422; c=relaxed/simple;
	bh=EF/mLJTv6gNbHMAQsAe4x40aedzcnFG52dclCJs95zI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RWimksGegiC2h1xJxQ0YXpCkXTkdnd7v82eG9OhEOQkwutTO55S0Rz0dY/Eiusad7GyCbjTfEBft++ZZzwN9LsYsD4CAn3caxtDqIX66+OSSZmhpzbl8VqrAO/zttblOVRHQ/Q+bwsDx7yTiT7SNu//Wdssy0peCZjZ9PrGPrQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2h/tDdX; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2h/tDdX"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3085f827538so1866877a91.0
        for <sophgo@lists.linux.dev>; Thu, 17 Apr 2025 19:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744943420; x=1745548220; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Di4XiSgh+BQAH0MOm1AlDsADVyTkQM6H/o91uhBRMnI=;
        b=M2h/tDdXqHAm18KmErqXg7CZhPtg/OJaNGqYqKQXbvL8HhRgtgSSrG+7Aj/jfZa2A0
         BALx7RLVulS15nrZEnGJShwMfDqlDAg6iIcBNDb/hgeLW2iNYY6tCXZS/eqUCA3gd8IA
         nhpsKK7tRW93VNecdrIc8H+3n5piqBodATCX2dYuTvaploNlKznmXINGtpDeRnSHELff
         XHco/n/G4YXXaTeQrqVzCfVkoRaICGCu5TEWwJF4dLoG0jOWaajg6uoCET2kcRZM3Z1w
         W3Tx2d1bkZGL6pWsaz2/i+pmvIMiEwkYjLMj6n6d5o6C2nKJoNccEgZEW0dd0fahu6dZ
         frKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744943420; x=1745548220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Di4XiSgh+BQAH0MOm1AlDsADVyTkQM6H/o91uhBRMnI=;
        b=bHyjYNHGN2GSDvJ0ohqwfRXE9owaR9nUj3bf9zoXOfDM5vCQYYP1t22OTxzVdD4iw5
         3yHtD3Kte3Hbn2lk8RSbw9krsXpUqdm7jMV4aJs9hmAEzXcxVh9Hkst6LUiut7wmf6Ek
         UANB1AN/N0DhNTPrBoao0IFMiPGxzUhCFsMEYlD+TBCBmtehgi2ZBf2sT6mMsRATH2R+
         amdV23AUo943IR41/6MAm3qZwvBc0z/f6oF05AHk8KjadSQT4tVsmtXc6kNrTugEsi6D
         f7JfPwkaHoELrlfnC87euekFmtOL/y4faT/z7qG/5+AvMdO9HqO3YIxjeLpxdPcfoiy4
         d9lw==
X-Forwarded-Encrypted: i=1; AJvYcCVRpVK7SLgEeSuRJdCRPX+wrzwoYw44wCvzGBEENg/z5DuS9UAEiwtxvRr5tW81V1Oeo80flms=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRP1p4Hp3jumhkLcXeI3jOnwpwMWKlWQBJVlWSiYi3S3+yI+XV
	MXnSoU3BbdGLCLYDTSZ6Klxy7IhTwy33CJtepZ7FpyuNIIZjcyqX
X-Gm-Gg: ASbGncuYpewSYH4AiPwRzQriTfPwSnraX0fA1TQbnlf2LnZw89JxDhN2YkuIICdNypu
	jC20xLNV0VZbIK6Y54khFFSp2AIzldZwoxKrkyonbuwpb9ZfBCINcogOwTmeF5mnLoHAIvTpMlK
	G27x2Dk9MXSBVpS8/aCxAPBrwjX61jCHL7d9Ju5cm6kvS6pwtS63DtmkxgC2HzBry/x51sw828S
	ningwXThJLrU351tFogYmDQqHY29cP1CYwVn/37nIZojAiE/Iwga18q+QOpLnx07ZhFfq6gCBeu
	Kk+XRSm9X+yr2DIDuvv7BG1pTYuzinirKsQ=
X-Google-Smtp-Source: AGHT+IHfuBCji2IgYL4qWKeIl+Mf4ci+4eN0PNXn0HQ2ZC/Ai+XLtuBn5UkQyieYdRDC8QxP4CcQ/Q==
X-Received: by 2002:a17:90b:51c7:b0:301:1c11:aa83 with SMTP id 98e67ed59e1d1-3087bbad714mr1651155a91.28.1744943420171;
        Thu, 17 Apr 2025 19:30:20 -0700 (PDT)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df0c14esm182185a91.19.2025.04.17.19.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 19:30:19 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: pwm: sophgo: add pwm controller for SG2044
Date: Fri, 18 Apr 2025 10:29:44 +0800
Message-ID: <20250418022948.22853-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418022948.22853-1-looong.bin@gmail.com>
References: <20250418022948.22853-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for PWM controller on SG2044.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
index bbb6326d47d7..e0e91aa237ec 100644
--- a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
@@ -17,7 +17,9 @@ allOf:

 properties:
   compatible:
-    const: sophgo,sg2042-pwm
+    enum:
+      - sophgo,sg2042-pwm
+      - sophgo,sg2044-pwm

   reg:
     maxItems: 1
--
2.49.0
