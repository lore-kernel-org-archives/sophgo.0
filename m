Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69771B0434
	for <sophgo@lists.linux.dev>; Thu, 24 Apr 2025 01:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745457909; cv=none; b=YmYMftOXs32IiVPJHX3IpXjlfflzvfux8Vj5S45CKzJrCgienmYcBvdZxucQ0GrJ9RndiBXPgamyGo4+JSDPIqaxU3PnWtlBVVe2pHBZH4P+vq988h8RqXRWbb+jJ1CyrFbxpHA+AyOMpY7WrM1ED+mCY4xx6RUF3Nbgdud5OcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745457909; c=relaxed/simple;
	bh=g7lN4EvhlvjQ1Rm8b3dvcMl1VivNZiQ0MNwUbg3dnNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=giF2uvalQSuHGGggs89blyH3Y/bq90H40GDE+uwzfohKLNGt4fCXGsEriE9uSEhFu32176I3y7CT8tVnaw3LyI+zQwAk9fZYpiaWOy0AvgLb6ym2spWREO4Lcqd13Q5nDUefi7BjAId7sJtT7mYQww5Jl0QIbveEw/lF3n5eop4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RV5pU8DC; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RV5pU8DC"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736c1138ae5so384943b3a.3
        for <sophgo@lists.linux.dev>; Wed, 23 Apr 2025 18:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745457907; x=1746062707; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvD2JS9X5Qd8+7z6kHFhYE/eJ+K8DjqF4BtDR2kwdgg=;
        b=RV5pU8DCwHsXiRzKnHgl08F5auhFrw60mhRn4wUcgNCIfkOemEGi17u265CWMfsxPp
         vIz2SWo8I8oiPM0Z5d9FDbVeKnRn6U68fU31gHh6V83ltcHCXZc6TyKTcg42SOpwFEPs
         EFA/yNeL6c9GlQBfqituEpSCFXxw28iI/V6DR4841rqcvtSf5KFraLWxqpF2+EVBdpKx
         HCZtWjq2ZkliHsEdiBuQGbtOndXQmwIJjVO6PClBKjXo0j2kFGWFpLjkiTszpmpNnF2C
         Au8KtWNYtXIcuCCZvYe46Mf4cRFCFG53NGjWsIzB7tgSpEQMt3mgjHBBi5SELRdfFrqJ
         +mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745457907; x=1746062707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvD2JS9X5Qd8+7z6kHFhYE/eJ+K8DjqF4BtDR2kwdgg=;
        b=btyuuoySpalQ8tfyWbIjoueXdxBptseyvtodg1KrI48FgWrV5EuqvUNBuZwaq7FGDn
         ylrE7+zMiYyOq5YzRCRYivUHMYcATuru5ShLyJt5SU/jFyYocEdBUYzgWLOrZsjKuPzC
         3XuIzh8rdjD4NhwsL1DNQ76GBtvIW2Z4bwVDYr/HLP7hnzR2pZ15LFb+vZXPGvBrPoNL
         x0Fe62RUfbzBlr3XAzY1lRf0KqfMaZfV2EzeBRzpcLIIdPKidAqf8i1rfpgndD3Avr+z
         xTvw3vzYQXHudj2t9pLxdfTbdGrgJWN/uAXT/S8wsafQGHiDqxRdrFBBzL6eA0cXINCt
         6cKg==
X-Forwarded-Encrypted: i=1; AJvYcCV1YUTORL9cBYtpaYZqEMhvKz5joz9OIBoUK6V3upwcMmPKvAKX8ILKibGjeoM/KWC3mfMDozU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzcf3XjBrhURsnDY7JMsqSv5BYF13MEtFFU6JoXL8HPNcopQIDP
	Zs7PE4zYGdbH5zvarp6gpANLbBNGtNx+Rb6y6DwIIWNB3U/8rlgw
X-Gm-Gg: ASbGnctD3Br0yTQVY9M3lyNsvl2tduMLc02VEq4dVoUr/BVV0BNUcu60eKGHW267RbS
	4zSHeirUA1JAhmgn+biChat4vK37vxQxvkgA/cjL85kwKjj0Z7brBhesr+RQYaa5EwaBjEkhvOJ
	jghZ0XrzX+5mRlxtd08bXc/42qg2SzrbFN8S+mSsnxz21mRxAvyjvTGJW3jz03BsHt9CglPvmNa
	ERSgnzVJgoIOp3p04yVDHj/bge2AYrbFgi1iLcFRYte2C/0D0Yn887tmJUhM30q0zwn32PY5oEN
	tPRVUoSynqpYTko0aXvRE2klVdJ7VPM=
X-Google-Smtp-Source: AGHT+IFz2drTt6QGmwxnYsh9wLssCL62JZqszhXN41V07+NUcllcYb/Qxu2Szo0lKTrVh+hW53QcFA==
X-Received: by 2002:a05:6a00:35c7:b0:736:5545:5b84 with SMTP id d2e1a72fcca58-73e243c5fe5mr1286649b3a.3.1745457907000;
        Wed, 23 Apr 2025 18:25:07 -0700 (PDT)
Received: from cu.. ([111.34.70.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a8cdsm231049b3a.115.2025.04.23.18.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 18:25:06 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: pwm: sophgo: add pwm controller for SG2044
Date: Thu, 24 Apr 2025 09:23:26 +0800
Message-ID: <20250424012335.6246-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424012335.6246-1-looong.bin@gmail.com>
References: <20250424012335.6246-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for PWM controller on SG2044.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
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
