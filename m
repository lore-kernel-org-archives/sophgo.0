Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9322113D521
	for <sophgo@lists.linux.dev>; Mon, 28 Apr 2025 01:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745804158; cv=none; b=VECZ4cdhEJLwpjucTdP/PuLgriXcatznq5Vjs3/W6BUCJSxwlhmcAk5caa85DJPp4lxcByiAhX1rCZcCW2DLzzTKCqylzXsJXSVU3gt7QvdC07jqwv+t1J2qDd05V8vr2vCp1qOAh0mUa4ZQJfF+4BXVkOqm+u7FRzpBmwjVx1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745804158; c=relaxed/simple;
	bh=t1QahdLTkbggHPkd85bqDjxlEjBR+yVNZ2AkbAlaWf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CrFuViPr+4STQyAYuBuOarRIpRmSbwK10fOI6eN66hodHt6jPxpWvJuNP2qxCz6lsORo6B8sgDgHkJj4zENF+nDTeUxYIeQ9OHQclpjAfxhJqIq7UsfDzUAU7Glyjl5qUtw+nHv324dxIMdG3hZDRSsNFZW8UOohsQbrS2i5hrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4+lh60y; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4+lh60y"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30863b48553so4805006a91.0
        for <sophgo@lists.linux.dev>; Sun, 27 Apr 2025 18:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745804157; x=1746408957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHBvgY1YVP5MIQkksIw+XJJlNkG/WcVVicP7k946nis=;
        b=a4+lh60yIaMDMf7FqsqWVF204c8CLAAC8Z1MR9j6VevGk5OUwbyTxVvcF7AmG84M3f
         0/PelKIdsOxIRzgzC32LVqtRZjnAqG0o9XouXBH7ehP7Wz9aS5JOzUtUzQmRE5Jt0P77
         /YDagLm+JWOUgdYUBS9N8fLBcCBUktwwGw/ZdcJZJXP1LeXhMAdqYYBV/VexV5fACtVp
         9qLFO02nFQ+1f0NrA+jyxxIWyWtq3fHAhBGF21LmQx1SLkUjS+d1OVh+34NB/al0mygE
         DfDgP/VaHP43sICxTRtEn81k7/+EUzHSijVca4GiVTvHteXgFz5qRkImgl5q3d33+A5Q
         saLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745804157; x=1746408957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHBvgY1YVP5MIQkksIw+XJJlNkG/WcVVicP7k946nis=;
        b=eEexo38J64SXxd8qeTv1L8z5GNH89vY+J/2H0ipImap4NuVA+lfgortVxFYsZk86ds
         bweZeayOdIRxUtjLdDJMiYWydCSCw1FMq4wo6ahzKZmL1qtpKDQ89T+VXC7PL/nnsHrn
         NZNeR97PAXk2UjiYTAuH4B94gSZrdiEZ531g5+qEi5oxZV3Pk/qBKUNAZJ/NiyyO6PqA
         UxrV5SInQL/otKsI1g4CoQOvlzwcyHQnXdcOB0LDOOMF71rgJ6xo8i38YRzTO7Xd5iog
         jys36wUr1u17+gouSHr6iIs5wDxGrQ3bCIMYGCjowZb0OPMYSIkaQ42iRmVi/iHJYUyV
         KTig==
X-Forwarded-Encrypted: i=1; AJvYcCXYdF/RY9Yn2Ri9HKUP1WhORjs8sgZXl1LccRVELP5FDP85+sktpWT/c8FlaLckGfgDh6lEAkA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwV0d3ZoKLqh/rAxninP2x3CjOP1mHuREV5os0a5D4f47uK9iK8
	pF+jXJthtOQRSlp51eQDa9kB57+mFUhyJBCLe5radvilbOp8JWd9
X-Gm-Gg: ASbGnctpg/SvanvIWVnuQqynXmfADomib422XHxnx2L8QhxWWd+I40dQ9mbKhAeooUu
	rJS4mGOEcM5R5OT4Sx/xGDOSXvBBk5SeSQqPHNbLsZMMMK/FFukiy5VoZEIEJyMKcVU3TXye6C5
	jK8d+lEzwVe9pOVciQR05QLqcBEvdqQohuUDpqiOHAXAc38Ma8k/pi0hCdJ8/5TO7vjJC49yE/r
	YyKNJsKyTAZmJJ8AGB7sBwjwky2KEQc+PMyykpNtRbXpc8NJGR485swdDdOfbXLdnHUyxeoeFi2
	GIpUjL1cmm4F
X-Google-Smtp-Source: AGHT+IFqoBqa1cKvvhGBCQiK2llHcQRAb6wNABgaxcrqM57k4VTCHHFQ9C6HjSqiASDd5djKAcaSlA==
X-Received: by 2002:a17:90b:5870:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-309f8a076f5mr14749294a91.14.1745804156600;
        Sun, 27 Apr 2025 18:35:56 -0700 (PDT)
Received: from cu.. ([2001:da8:7001:11::460])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb26sm8508671a91.6.2025.04.27.18.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 18:35:56 -0700 (PDT)
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
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/3] dt-bindings: pwm: sophgo: add pwm controller for SG2044
Date: Mon, 28 Apr 2025 09:34:48 +0800
Message-ID: <20250428013501.6354-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428013501.6354-1-looong.bin@gmail.com>
References: <20250428013501.6354-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for PWM controller on SG2044.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
Tested-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
