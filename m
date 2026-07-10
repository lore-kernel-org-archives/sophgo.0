Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9823E2767
	for <sophgo@lists.linux.dev>; Fri, 10 Jul 2026 07:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670376; cv=none; b=OLaFxMBnGjjPNHAUs8m/85pbHTUQ9lYnelCAjMm/KXEc/QX9h21tRFMpOif3yenXZzu9/AcuXFI4MfsfE1fTN8uGmZcB6zpasZkwUmoH6A8GojzxvxJ8aJ0S/EM5sCnU9RQvo/Y2xgBwwbs/FaJhEsGYn9ifT32E5E01yMH1b+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670376; c=relaxed/simple;
	bh=st8y4T5YN6SqtZtFwtiBYLCoyPi/Wo5ON08Qei/HluI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OvEHwwWn9OdGV2j1uRYO/aDlRp+2sjFAnZzeor03C7J32NaRBE60vDnBmIdmC4LIBQkcgo3mpCeNpOcNvo5JAc1S9gKsLuuSGkocMBPtMpaoEpTd+pgU4uI/5DqQWEpU9rIWgpIRsNDCx6icOcaa4kLdHnx+n0SGuaA5tDYv7mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=El7FM8oR; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="El7FM8oR"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c988e16bb3so2153155ad.0
        for <sophgo@lists.linux.dev>; Fri, 10 Jul 2026 00:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783670375; x=1784275175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvjNxqwnoH3kM1IlyzkqqQUMkDcovkXPiLWFB1jUKmE=;
        b=El7FM8oRm9tOuDG+2OPHfxidsQw0Mi2dhs2z83YLm0Gf6CQk9QpH720MpgV51S+zXv
         57iXRttB7hcER/LOhPMIs2XjX1xCtpwk6UyMRGk/JLm43c0IDCs0N0Tw7sJ11icgKk5s
         hrlW78lQVonDFWDbGAt1JgXffe/iAgBjG3dd33NXAE8c2PnnMw5q5ALEKha8bQ8hg0RW
         JQIpJ863xdmjpE6oWAsSGCbRnJ8GHCl4iOlCvcpebwQ9OMLqbsg1lVX0MZxPBUrZeKOR
         WZI8FdWbkK15qAf7STzbi2B756s77QBCRHDxmTjSfBX2EMeRYFZAAPSxPjOtPZnv6Z7c
         kZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670375; x=1784275175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvjNxqwnoH3kM1IlyzkqqQUMkDcovkXPiLWFB1jUKmE=;
        b=Es3UI1V6EXlv8jyPkjofeUpvbsz1XDdXVa9XNe6tFpRFxspPFsjvACehH7BFeEVM+7
         sjicSudYzUXRWpb+vsA4b0cLromF6fzTsuONInI6izJZH1SpmWBr6W9fLcWnZD0CwrGi
         WcvcPjLdjb+L6xJbRHkngVUM+IzyvGQHfrF8d/qPtgXV7Tn8Gb4tWZDNB3zv7gew2c9k
         TOy2vbHLdzC4eE9MbzSbs0l0hoxfmAczR3/gF31CRrjT5M9JrUmiXWLz4a0HqYGMC+zg
         gKSR0rsTlMCWZBJHkuhQNMDid7X1cLcujRDZcAdoLPA0SXdbb9zzOoOFAA7FThPkLCNs
         rKmw==
X-Forwarded-Encrypted: i=1; AHgh+RrUQcPHsA1WgeQVP7d2MTRsqRi6CWOZvY/IdjePPOajUoxTauUZOwBG0MiXQYyzNtHZZXNcLG8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0YSek9llFL4Pea2DRflP7yj6L9O+mK4XdjwGbW6wmUvJfUkB2
	VaDiAsB8mIPCx4dE9gmyNBhQKbuN7O959ZL8HNBEp66aH2KHIlvitxI+K+TX4/Zc
X-Gm-Gg: AfdE7ckQu2y5HtIsN4I4NUokd9i3co8x1TLs5/j8g6TkD6HMiBrf+xTz26A9rvlu6JN
	5JfoZgxcBaHGcoQT96Y1jMs2fniGemcQ5YojD5TlBiJT5sDWbVdRdtM7+9L0aS0gbzACCOKEn9v
	kAeBhVdi0GyFZ0wmLJZTNjT3zOaJ5j+grBpzX5oLBMJaHXRWp/Dd9HwuT5t0NL5L3ZFrDJ2eYhQ
	vx4QfYuUit2zhReTr2SdMSbpaJJ3FaZIaAYLFGLqU6ak8TtsHQxo0TGlAsCrFUvc86HbgW6v1hM
	E9Ug7W6ajwMT3PiLjrHB2yk3ovmtjAuF2Hi8MlApy5zhRhw5MFE0709pacj9NymH1ZXtLnDNvNa
	QLRdNQBbZTQPITaWQ5boQhGrPRWEP3289vKcpJI3VEn/ORH/ccRcQrKIV8bjURgg3MG0Hf/9avC
	zNCMBzjVu3R1/ABEE=
X-Received: by 2002:a17:90b:3881:b0:37d:f70f:fbf8 with SMTP id 98e67ed59e1d1-38a1c1b0a81mr5870558a91.0.1783670374731;
        Fri, 10 Jul 2026 00:59:34 -0700 (PDT)
Received: from chenyou.. ([140.116.78.205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm19044999eec.26.2026.07.10.00.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:59:33 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: soc: sophgo: add Milk-V Duo 256M board
Date: Fri, 10 Jul 2026 15:59:15 +0800
Message-ID: <20260710075917.159969-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710075917.159969-1-chenyou910331@gmail.com>
References: <20260710075917.159969-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for the Milk-V Duo 256M board.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51..fcb1d905da7d 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -31,6 +31,10 @@ properties:
               - milkv,duo-module-01-evb
           - const: milkv,duo-module-01
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

