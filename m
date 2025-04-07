Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A76E227B8C
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 07:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010523; cv=none; b=kMz70gRXc9QQHfKaM2IG3YMRlpsjYetbGL+kg4pTOlLKNzl1Nur8Eqcia801+Odd9uFzzqbn+jfAnojyU/U5t8ziQHRz3y1UxL7cbBK46P6J5NC2ECgipAANBqSFA7JcBe8jhuD8RcKuE3lI8ACCcz5GQOwQo2kyiyaXAzhRSRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010523; c=relaxed/simple;
	bh=H7PXJ3/q1jpmKUwO0QleLbE/GXOAF3rDGeIPInU9/p4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQ7GnRo2LROhHgaVcdkYJd+djPgKYAf1JF6zFV65oez/ZW9lHhF3GNXwVCM1kPXF1Ybkq6Lp1rv48ijIOQ5FW8fQ9Wk+nZLKeInf6rlf6K3OXr1vYVBzV4+1Pa9q8/4D1tw9n5LK9qQf+XQzG5KBn2z8MjpdKHJlpoSCS39Wh9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQsCd63t; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQsCd63t"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-730517040a9so4552932b3a.0
        for <sophgo@lists.linux.dev>; Mon, 07 Apr 2025 00:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744010521; x=1744615321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI7qKUSOHtPbHCZyNOWzBNGKwtih9GNqbp0jjFV0joA=;
        b=QQsCd63tTai6dIkFSHtMywcj/rU341pgWKMZveJ71IJjTtvCAuZYKWCBDOhhR5W/zW
         JCwQ9oRUlWl+HICFBXrkggGiYPvSjbQ5VzRt2pRDndNVu8R+DfRZrVJtV9gS+YGOM6Ev
         OU8+lYjltFsfXOD1N3fyCrTk2TPx6kiccLtE4eYs9Y6QnzfJpsqTlRc6XUtoEQP7pV7n
         9RGxJB4vTptz0f9QemZftr314tIPwQyBByvQlkbH4hvgW3sDymk26AwikLjwWgtSAEmH
         uztH+zkvuflKsUQ6y17pPz6rvNlF5Oy4NiDLKqvvu3uiJXIyUk/8tbmxgCPedC5WzxzU
         i68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010521; x=1744615321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CI7qKUSOHtPbHCZyNOWzBNGKwtih9GNqbp0jjFV0joA=;
        b=LHcx9TIt05bLAoyXYaMJnI4kLp6NUbF5k+YR/EJsOem05GTucRpeXd3YB5UDBMjddn
         /a3lJdM9HBfIayOCWAJqov0SoRpil66/anxGlfRNbyCdMDXBvkf3g+B7MScrP4KPSyqi
         OqupHviI1BbAYO/yYS9kv24ZnGbME4dGo6hMPFHL0D8yJIXb+nZ9jL5tgIjjVTKosPof
         WucHzKq+qQ5o+UAWbvQ32xobyFS/ZGV1aUCAS9MeUv56+EL+PCsKJHPonOCdOYbDUg+O
         95nXwy17s+1VycSnovuXkf0mAPVXVaNJiFeUv4j0A6Rx/SYAQ3aX50pfV8iFNlpo0EGY
         vYgg==
X-Forwarded-Encrypted: i=1; AJvYcCW3hqADnMTGV8YStgSMV7vxsnzWtaagDZlQVWQQ5dP3yrAQYSp97APpGzusT5uA7QsH5i9k9W8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfBfrCBqg1ocrLX1UMfw2iXtr7qRK3Ljeki05+c1sMi4Mxdkh4
	orFHIOrE9i1XRQuoIoeu1i371vVqX0L/mLjFn0liKWe/E6TiTbBf
X-Gm-Gg: ASbGncuv7UigahewjdFt++E0iqpLnwZ8e/xcTZVVSShcW5hwgw9mdjgKP+OsVGtXD8j
	YcdWZ6Vd8a88Gu/DcLLvsWdt1BdBDu8cpYKwo0FXgSGs6fM/QCxZqpRcYy18FmvvOjDKryHDtg6
	/RmDwilW3vXteLH41E5Ebtz5/GHhdYqek+9gHNYt0wjTqSTYM3ITNcas/N92ST8vVXC1NnLwUzF
	QVQ0zehgK8XDzfdq3t0JXWDZOcy3IIrdRI+9AjzNumZTSS/JHQRqd9ockAlYjCptXEUC2gIJjN1
	fy9t1ARqG05BuOwWyB8+5sF4QnmJ7A==
X-Google-Smtp-Source: AGHT+IHLMd65M2VZ4ZmW5RpiMvZX6zeOTv2NQAJx+Mj6d7lV/vM3+ZpmsTrMsyJbYOIWBOCs5g33dQ==
X-Received: by 2002:a05:6a00:2442:b0:736:6ac4:d204 with SMTP id d2e1a72fcca58-739e4855dd7mr13523289b3a.11.1744010521317;
        Mon, 07 Apr 2025 00:22:01 -0700 (PDT)
Received: from cu.. ([199.182.234.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee60dsm7787598b3a.40.2025.04.07.00.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:22:00 -0700 (PDT)
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
Cc: ghost <2990955050@qq.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/2] dt-bindings: pwm: sophgo: add pwm controller for SG2044
Date: Mon,  7 Apr 2025 15:20:38 +0800
Message-ID: <20250407072056.8629-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407072056.8629-1-looong.bin@gmail.com>
References: <20250407072056.8629-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: ghost <2990955050@qq.com>

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
2.48.1
