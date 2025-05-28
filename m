Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AFA2798EA
	for <sophgo@lists.linux.dev>; Wed, 28 May 2025 10:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748427133; cv=none; b=Vj81mum8cPZBwpd3FrJR608er2L6LN8sb6TxEFmVojbGhuYln+7QO6AIhEXVwRiWRHdxpj+BkxtH/LNI8XLJH3eZRYhEh+pdDvHlwoUrwCDqAqexuMy1iwQhXCbkVIeVR0Dc1S+ufuFhhB3g8+6MmMxioYE32m09P3mGcAFnOec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748427133; c=relaxed/simple;
	bh=t1QahdLTkbggHPkd85bqDjxlEjBR+yVNZ2AkbAlaWf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RqYqTUXXSM9cQTY1qq59JMjppoASUvl92kaXsb19aND1n/Wn46QG7pqBFtjdD5y6RRmiyT44Qw1N195DjYgrc/0MyESRF6eDnkRFK8BxJSXZ1SAZNPZTuln44Ytp5DnKCPlrlF1TCp41YraOD4V/OQ0oPFLCogWqN/b4iApF4t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbslWosU; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbslWosU"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0ad74483fso39341266d6.1
        for <sophgo@lists.linux.dev>; Wed, 28 May 2025 03:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748427129; x=1749031929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHBvgY1YVP5MIQkksIw+XJJlNkG/WcVVicP7k946nis=;
        b=jbslWosUP/yvt5rn/vX7fY99Q2EHXppF2O+RzpPwoshLjUxIKkKxbkMtMGqycnjKUX
         kgLDybctWJ9sUdSmtmlXPv4OqDyMDCVoFiASD56ex9ig41spCfifxY+M16+kZGr/E9mZ
         p88Y8b+vY5EGNgC1Y7xlNC4g0yKpY/1ngByMejL3ndg/dxoO8vbIfvvORwMA2HzNILx7
         nBCruwAzfiJIf92bkAJ5VvNEKnCdSTKt7rbYsCy13yufOcYf9RmPSxPH93PQcCIewfAe
         OsQgMwdHFHLTu0XfdkMeXkkIouDsAXgSwLbblAqLbWISkVGFudGCCeHp/i9cmgm/L/bd
         dRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748427129; x=1749031929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHBvgY1YVP5MIQkksIw+XJJlNkG/WcVVicP7k946nis=;
        b=Mytwif5plL2huVvCZDCdU6PzHArHPHlSLQ8anqje/PSunx+U+iSgo5/jhGfXv6VTlo
         DI0H2k7+u2mGDG+ITMa1FI45tcodAOPuokWz2zISN24cBTxO4QarL9z7VB/15Wj6JhBg
         Gnj78Cu1+TlBdM8pV3E94lCB82O45iWyEqGEtqmuQSccBdq5UK3IPuFeLPBJ4Px+VMD0
         nn4a7oPztlkqe57ENDAP9YEYoThXo+SSAiFARqC/4q6nPLQMLmXKu6F2jMqwhJ4JMtXw
         2+JtzkLIQnilLbbT4BdAVrm/5dA86HeHdCZu4D2deFxWFe/6fYRmgv+D2LvE5bxCQ829
         MyLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbP4k1RUJtrwmFPS0iQ5rKr/MhKxtrUBGmOMK2u1BfwGHFpOj2LF+QjnNQooPZGTQ2Wge9zzA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcTFAYWh7hxRNQuo9Jxp2GNob/yx+uD4upZI+HagtTMk6W7xFa
	i6dnsq6H5Q1VbwSIzar4hQj+KIOWaE1ipYPosdVXKuEQGmelOCOUBq5MqwV3bw==
X-Gm-Gg: ASbGnctJ7q63AkzMIzAhB358R+aRIUApNAi1TQGUVLh2SHw9PPdQ0nk9IRzxxSQ//L/
	gs4x/hZzT/sFniqHrBXkfvVpcWry0HZVhls0j7e3KmN/c/JS6rAunsSHrIX3KYZB37w9An+yekh
	5huTRi358GPOrUVXyktXx0gQ0r4CoHX3V6GPxN4P3UOnyqYdCOjTaF/xHwh3VXWaLveoAJwm4ox
	VVR9Q92ehpC4BcvHtHoG4dBze+W8WO/HHJlLy5hj6y7aqkdo/EQScFM5dthDBotkTR8iyTEtW1F
	Rj7rcIdV+IkwlnIxrTF1ABq7vUcCXVPgq3DQs6pTEKm5pw==
X-Google-Smtp-Source: AGHT+IFtudEecNzRLHvC5Zt8E0tk2TyAeIGxp30jdo8UAfABBjjMtWvXU6go6Qz89iGaprdGhLkqmQ==
X-Received: by 2002:a17:903:2f92:b0:234:d7b2:2aab with SMTP id d9443c01a7336-234d7b22ba9mr17655095ad.14.1748427118714;
        Wed, 28 May 2025 03:11:58 -0700 (PDT)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f118sm8453595ad.138.2025.05.28.03.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:11:58 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: pwm: sophgo: add pwm controller for SG2044
Date: Wed, 28 May 2025 18:11:36 +0800
Message-ID: <20250528101139.28702-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528101139.28702-1-looong.bin@gmail.com>
References: <20250528101139.28702-1-looong.bin@gmail.com>
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
