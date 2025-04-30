Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EE31885B8
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 02:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745978999; cv=none; b=I5edAeSyyY9T70MTiNy+HdAtvVV/wvYOPuxzopyRzIUNoaPD8yOQM0ahHiKBWSFwwCYkCm9KvsGGaLPZfxbeva3IQvw4+gY/6i3ftim+05OJNjBJMQV7tZ8vw7rozWOkdTU/HseBhBHilpWjc9dDnRd0PlB/B6sYzhqFc4KcFcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745978999; c=relaxed/simple;
	bh=rHZyAGawD256Mc7OhUC5e3SWZv5HoHrgkWORlP1eX8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pML6J7DKQvMT5nBGmL2ILy9DPfCUKYhgKGscBrY4FcD4kue7LYU1Mro1hoK1obc70Q2idN+/IDCORbOfprW7mvkwCp9vkzqAQBj0jU7D+Be5upPNuFcCqhqKuJfI3hIi8y3NIb0xiaYCt4YUAYTdlRik4PrflGI49jP0HQWQbM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faEYbTHF; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faEYbTHF"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f0ad74483fso76305516d6.1
        for <sophgo@lists.linux.dev>; Tue, 29 Apr 2025 19:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745978997; x=1746583797; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGoCd7OSsBB4HtUz1a10Keba+9sPV43ld/cxoPbEVBw=;
        b=faEYbTHF9S320y4/TeorP/Oc4r3ZftP2lgV8YoPf6SZ424N/1T2VPM7GFE/A7Bwy2N
         5PJVxN4/WNuZTABUrsbslDPjCPcIMWHHi1L3qM0DPCS1mRE/e572jUJESr8tzK2vBgrv
         pi+HqGoD+sQ4Z/DuC4oc6Q88qssgTxU0sfzdQ7Pt+9SQMdkU/N9/B4+J5ZBrLMtg2C20
         AjoP6/tb5sBsvI5H65KzH1obcXWA8w47TNFqXLa4ONDY0EAZtVMdK+2/nxxMf4EXqG83
         R6dYzTS570O6snVhCxjMsMP99cdJeSyfTqMpRLgiEcxCNawlZsGIMsiMIg0aVX4eyrnF
         1b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745978997; x=1746583797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGoCd7OSsBB4HtUz1a10Keba+9sPV43ld/cxoPbEVBw=;
        b=bLxUJT5jOivDdkRTkwcnkFcHTZS9pLHuIygBtSAd5ZTqeRpiW9+EvFu47GXRzyX+M6
         aoOCmVSaL0fg6ViTMq7XTe1UY9vOQq8jFziSBAxqaOokHJ2tCERCvgSEHoJQax/axwzu
         kidOJWS9sTAs1hbXzRb+qW+UmfpinTMhB+32R/YUuA1twTRlgAszw1Bjj4em5X42zBaT
         UgHnF7dFrw0WEJFH5uvbQprPoEwkapAnjpcFFa/HL02e409Feem7vJEYry+hWqLVbYnv
         43IEI9jC1AMIBQlc1INjzJM8ft3pekKWtl4qHHyi1mD3AfKtEtH0k7Mr4FNGJ1KlLsRr
         I1sw==
X-Forwarded-Encrypted: i=1; AJvYcCVtXkJBTFBXbRkyzME2FVeEWu2fb6mz8XXZRcmxr/DMUPWhFOAPNBDSCjFXOBFA0TtZSJd8rzU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1TBOKlJ5kPLCQ7IQTge8zRudrgSGWMaawMi7UJ0Snz7uytSey
	Oc6pv6SWhR9MP2qsIkyLx3F7p9HwAfxr6ZUv0mFFXEBzwAPxq/yQ3WkptA==
X-Gm-Gg: ASbGnct0x8kzpZl9W5AC8MmzFc6abH2rx1fdev2Eh/NmEk4HXMkrJv9F1LUY9M6UrrL
	ZM8eYHWkp2DvwUbGbPfe3oxjerfd32yBEL0DOKgOmy1EbkTwnk1WjwMOB3NxkB8Tk4l5bZQAWZl
	jdw2qh776+YLQkFumHib1EWDHR4PHQXxxtjUzm+kJmsbKgX7SBNehhH1CIBnGEPRgq0eFmjHPp4
	cvBbjZTd2SsKoXE2WNYts1UHi5Sb1Gt7LMpLnZcdLNCCYP5srYKt1iULLTKm6hNTplxLCYpdctP
	r6B93pDxLmciUp5e
X-Google-Smtp-Source: AGHT+IHQemqa+wENz6ss6VRn1kahd8zYA9nlmzIMb5bTDRj/D2NDvM3mr37ZArAISihcQ9zANLGDdw==
X-Received: by 2002:a05:6214:5096:b0:6e8:f8ef:d659 with SMTP id 6a1803df08f44-6f4fce5d21dmr30912426d6.10.1745978996814;
        Tue, 29 Apr 2025 19:09:56 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe87df48sm2764316d6.120.2025.04.29.19.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:09:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/3] clk: sophgo: Add support for newly added precise compatible
Date: Wed, 30 Apr 2025 10:09:30 +0800
Message-ID: <20250430020932.307198-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430020932.307198-1-inochiama@gmail.com>
References: <20250430020932.307198-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add of device id definition for newly added precise compatible.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/clk/sophgo/clk-cv1800.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
index e0c4dc347579..e10221df6385 100644
--- a/drivers/clk/sophgo/clk-cv1800.c
+++ b/drivers/clk/sophgo/clk-cv1800.c
@@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device *pdev)
 
 static const struct of_device_id cv1800_clk_ids[] = {
 	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
+	{ .compatible = "sophgo,cv1800b-clk", .data = &cv1800_desc },
 	{ .compatible = "sophgo,cv1810-clk", .data = &cv1810_desc },
+	{ .compatible = "sophgo,cv1812h-clk", .data = &cv1800_desc },
 	{ .compatible = "sophgo,sg2000-clk", .data = &sg2000_desc },
+	{ .compatible = "sophgo,sg2002-clk", .data = &sg2000_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, cv1800_clk_ids);
-- 
2.49.0

