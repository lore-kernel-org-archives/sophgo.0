Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3C938F927
	for <sophgo@lists.linux.dev>; Sat, 25 Jul 2026 17:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002047; cv=none; b=YYys4V+rHIdDQL348AyoCogBqdmIyqurfWWt/G5I62/8m80Ukp4aQIbq0x5yUmDJH+nMVvWDx8UelbQPMv8cBZscwNEoGgTBfbIZh5kFNCsBz5K3l2q2gsb2PlCmcbtwHQzH8edRrG8XXXaCb8bcLDN8JOeUVhnPlx8AzHS141U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002047; c=relaxed/simple;
	bh=bnvvqsRWp/bLKK/Yo50qBp98JuVsOPyd5em3lmpqY5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRjPS17oE2pJ7H5awu2SwjwqbrOJyqarK4FUg0VfZcZB0g2cDYSGi2wIQ6WgV3MO1W3Jz8KCPjZqjHu3XeGNm5VRzFyME4NN9qmv9g22BBoR+EBGttg/XrLl1vwux/d8lRjSEHXZTAgLpV+n1k0lDYlvweyNvBYpo7qQc3pwIps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3+ZZBWP; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3+ZZBWP"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8423f52cd57so107493b3a.2
        for <sophgo@lists.linux.dev>; Sat, 25 Jul 2026 10:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785002046; x=1785606846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4cXmnlu6jiskgBAJ4hnLEFeaRkSGLWSy66NeKTndVA=;
        b=P3+ZZBWPTv5Sz/FgMmzQ+Jx6X+XhduYNn6EFYO7sWCKC4I1Q7qR0ISeAOt1StdJo7t
         h9nV1WxvRpGsEys26UcunHp0ANB5zewHBDKOYV1ySBVd5P2Z1qyT0UbZnARPM8845q8J
         Ksp9tFtbOoI13mlz7QOOO+uiuMmlgjcH7WPxT86khRRgzvR1DH0tRYG4sHq5QXsyOssg
         Pct5jJb/+auwIYTRD/YbwiJM+6bP4YgsOKgpDVnPtyBGpQrK6J42S35RuiyY81kqYijG
         c1sOBhaGGP0MoHejAK86GLKan8b6sYaZbwANAXJtdb09TAx/uVnYgJXVzWXFXRoJpMaD
         wMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785002046; x=1785606846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a4cXmnlu6jiskgBAJ4hnLEFeaRkSGLWSy66NeKTndVA=;
        b=mzfKhK4J2AKD2KwPpMW/YxAu2+Ozz5sKlpv5z4/KLaMajXITsnoY6zPF/u29kn0O1M
         6JW5/HsFIxkI5SkZW+JrOJ3ukRyWyQkGRauEzpg3NOQ2VMoByiLtL9sA7o1O/ozzHklk
         KKwD4W4PrNNCjpMjEbk6SUqhUG78YCO0yisOnAuDd25DPGrNwwzOLR6NzxgDcOwyGAo/
         iV/zBKpAJPlXZfGIk8oLmqOIG49CzQ1Cay3VEwwiYLj5Y0PntTmcr6Uvbcsj4lFoYIUw
         fFzC+g1z7ppW4FUOJ0RB4O3OIMILwEG6qvDtnBqxwpXy+cfmJc4scH6W3cnnKWgxQAKI
         BwYg==
X-Forwarded-Encrypted: i=1; AHgh+RqjK+LBFPqQJyhrsd4qpwkXETbOcyuTf3ejuRWYxJMsckjbtECSq8wN4TKFQBZ7gWqJDwhOE/c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBcmJYI2N7uSmOYFb6J413epF1db1/yQKvOWkQF3De95qQmY5U
	Koe+chjFUwA9jEIKUYjB9eZmA2VFY1sWuX5FiSGTdeCHYCYMFIsyBD2oCgWZ6Q==
X-Gm-Gg: AR+sD11lm73jcM1w+isV0k7bWmr+pkzBe5SJffZQLHErBeZ3CknoGDcozqvuxSEPhca
	R3Pop2H6n+4Jbr8ypYGyrr/5dX2G4b61a7GrSGT2tNKeqwMVRqTbb/RRDca4/SKcWUJo4X54yPq
	pQfDrME4mZa536oipY8eTn3F35AjqPek0uGHUlrUieOJ4AQhLO8NNmJHZ7p/yzNLZZbS7io81gt
	X5gkzJoi/m0/tFOXemD99U2rjkFJRadM/YftktVNWDgR6WKXOVFARQwHapPuugh22hBesDbOQL1
	sZEmRrUBcfHoSlci0tFxrMhUmO/L8zMEsJAPHMj8xL0aOV2SBVMMs8Iv85u/H0A6LwBHoNnwQxr
	R1z0ePDtYw0EJKdAgvu8yLDMM/ICMZgSKkNrvT73COxuaCrqdGizNXA7abguOtkxvdAjPthtLyR
	KR3kPiuXWsxJuaYX5ah2SARgzE5U9zd7PXp/rIpQFi0xLSS475s36UyCUnHUuk3hHsUfTj6aM+g
	oYfy1N2Vg==
X-Received: by 2002:a17:90b:584f:b0:37f:fc3a:382d with SMTP id 98e67ed59e1d1-38f2963fcdcmr1858338a91.6.1785002045724;
        Sat, 25 Jul 2026 10:54:05 -0700 (PDT)
Received: from chenyou.hitronhub.home ([2407:4d00:cc10:114a:3b0:934a:d409:94fe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f031d1d6csm3005276a91.0.2026.07.25.10.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 10:54:05 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: soc: sophgo: add Milk-V Duo 256M board
Date: Sun, 26 Jul 2026 01:53:43 +0800
Message-ID: <20260725175346.139173-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725175346.139173-1-chenyou910331@gmail.com>
References: <20260725175346.139173-1-chenyou910331@gmail.com>
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

