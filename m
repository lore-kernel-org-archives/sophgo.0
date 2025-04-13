Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748C4199385
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744584611; cv=none; b=dAgq76WXhNLqmExuzwpNlLXKjGtTj9Cu5lbLH73oXZZuonIlemuJbsA4+0Un6WcFOP8IqChNm3HqGLiVc0eqsyJayxQRq8ECxqiMdkyTl6sX7v50oASGpw1Ufh3lNxKxLsD8RUY1/zL87nFYtA1n3E62uE+8UwuuVXhf7EIJaTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744584611; c=relaxed/simple;
	bh=HiaULOJIVEBkYuXBrKiSwazeXPqvXbbNxBqzni9Lgfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CC1A1226UKyzkgFva5YNfvCCRNphcjnrhayYSbpf0PZAZsgG2zuPxxwgnCUX5yYacOQSLgU5ha5Rc6Y5qRBN/MKCrb9fRAIts8eJ1j7b64McZBUsI9LG+Qj8opFkqf4eyJOwhSulh+ZanOYkMLmaU3EkNAX1qPxGDaOGoe1SXG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lddjc5D7; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lddjc5D7"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e900a7ce55so57478866d6.3
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744584608; x=1745189408; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrNfyuaiNE80NUtIgfuYRzdtYhSSrWKGHiXSGsvIXV0=;
        b=Lddjc5D7NxKa30/aAa7cAp9nsWwbnjSwj1uKRD3XlvUbnyKde9wdYRJrJ0BaR9A1Wk
         pC96TEMH+RVyymYCMRANOYgqLW2FfdyYcoQeFxpoifecSwIN9bVlE6ttG+sLUuDMV0P3
         rBBi2MRoY2sRVZ22+SCfHWuL+Vv4w4zZpkfAJf7UWuWuW4OW4Z1fTTiLr0cRL4NxnFhA
         +HzkqDg6VBIdIV3kJz9+TDwDSocqssh3EqatFSnks8s7PNJ0xtU+y/bko2hwdIFFXVka
         FXE/YMjBCAJEyY9O/42XwF2waSampG59dub474R/DOgk4rFvOCgKrq1bnSMm7qODqCig
         UG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744584608; x=1745189408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrNfyuaiNE80NUtIgfuYRzdtYhSSrWKGHiXSGsvIXV0=;
        b=iHr3Y464sbueZ/W6T0c5NRtP5OKTZkVcLwhgBO+BlP/aAgR6wCmqtzzLqNW6tkyk7H
         tUl7Q8lhMuiaWl419fzogttha4aXj4gmkGF9EzsYq4LzGhHJhXp9pBraAPvLMT6ZZIVA
         uylPXwCtcZMjFOUIp0QlZQMTBMkVUse81xeT9COVtNtyP9Oks+tERBjEb1tN/2/mk0el
         OtsFrgGj6i4p9TvjeV2gHBYe8/q63ORdXA/yKscQnPsrsv2JC8DI4h1fmCNP9T/0vNVF
         WZ3+LetJBnN/CJDv45bU+2ygXo50o4VEmzpXgvtzT/U1vUMwoc4o/1y5O5WAeAZIoA0H
         Fdkw==
X-Forwarded-Encrypted: i=1; AJvYcCWodddj0iCdBKzf8sQBsQcgWaR0EqxJlRozboDE2VjnsfrE5/Af5u7AwT2Ur82FHskLGzJJCLk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqRSqz7QGgtP8v8Ix1M8gVpYIXK6oxWCJF1cHbU825WixlbAKJ
	RLVw+LBk+aScBiqlro5vIhwZ1wKX/q0wJ/bgloQXTVxjiuL2/mQk
X-Gm-Gg: ASbGncuBjZRR9X6l5ynLaCwqVAKh9SaNUJJHir6m/s0YhN5KFaQ8m4i1QbtX33bXGXf
	n2ZDVLArWGBNr8iCdeEKuiQL882DrencL1OfSVQ/wNX70AQdamTxy5V0YMsXVrSQxU6hvR/5elx
	KjG04oI1t+I83jEb3HvwHlXcieSx15nAjrUH+g/KK3KRPkbZyol0K9XXqar298uXZ2RnHJQhu/w
	61sZcmJosIvEArQKwJQ5vtRWOrzkwNUnFLFKSt5XN+XIckLnON5bj0q8xeegr6N7bYdlu/EfSiG
	kCIjXSLVrYrZKHMI
X-Google-Smtp-Source: AGHT+IGezSlcB3D+9Dctk909BXGBm8lYrlvVcv4JvNqDMNQxGcSzqabUhgzaiLOybe0xMXTrDj6gQw==
X-Received: by 2002:a05:6214:230f:b0:6e8:f99c:7939 with SMTP id 6a1803df08f44-6f23f186798mr127407696d6.44.1744584608252;
        Sun, 13 Apr 2025 15:50:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0dea2186csm71294766d6.123.2025.04.13.15.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:50:07 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v4 1/4] dt-bindings: interrupt-controller: Add Sophgo SG2044 MSI controller
Date: Mon, 14 Apr 2025 06:49:12 +0800
Message-ID: <20250413224922.69719-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413224922.69719-1-inochiama@gmail.com>
References: <20250413224922.69719-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like SG2042, SG2044 also uses an external msi controller to provide
MSI interrupt for PCIe controllers. The difference between these
two msi controlling are summary as follows:

1. SG2044 acks the interrupt by writing 0, as on SG2042 by setting
   related bit.
2. SG2044 uses interrupt number mod 32 as msi message data, but
   SG2042 uses setting related bit.

Add support for the SG2044 msi controller.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Tested-by: Chen Wang <wangchen20@iscas.ac.cn> # SG2042
---
 .../bindings/interrupt-controller/sophgo,sg2042-msi.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
index e1ffd55fa7bf..f6b8b1d92f79 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
@@ -18,7 +18,9 @@ allOf:
 
 properties:
   compatible:
-    const: sophgo,sg2042-msi
+    enum:
+      - sophgo,sg2042-msi
+      - sophgo,sg2044-msi
 
   reg:
     items:
-- 
2.49.0

