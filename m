Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE3C1E3762
	for <sophgo@lists.linux.dev>; Wed, 29 Oct 2025 00:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761696709; cv=none; b=Mr4mwJFfGfS4RjbR1cW/A1ylML434QeebPSonLIYxWHRqZ+s98ngOQaBWTevYIl/auW/p+9Fj38xueADVKoGh4D5Whm/UiW6xJyJRZerD47cnAv6AsMhmvEKnAfclkx9ekxHRgSRbn+ynxATILzt76Dt9CAigcsrhlOPfiMcEv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761696709; c=relaxed/simple;
	bh=Set66TJZ9yyv6JkRLCo5kR4WnKp3a5s++BjmP6dVSE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DGdvXzkcNOnz7LhdIc2Ox0Cl4nMg6zRdq8a2AJLMs6Xp3l6M09nDOdBV2R+BG356E0giA/WhuaFJ9VMNnN5ON1sJjDFnpp7xrRE7Y5T5dEr118v8aLyM2IKzi24t6XVaF/HzTM3Nx6kX61KraQSf1wJBb5riGwr8GOG6KIZC+tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jI7VLIcn; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jI7VLIcn"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-87c1f607e72so4858676d6.0
        for <sophgo@lists.linux.dev>; Tue, 28 Oct 2025 17:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761696706; x=1762301506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tq2p1V6khYqdwj7axqsIU1Jb8x290oJDm2pwh+Ywad8=;
        b=jI7VLIcnXNK1IDI5asG0fGXGSb2fkCengD3FRgdXvckWhMrSW2O2B1tCSbRUfek/HP
         WyMQkM889gvYGOuUdRxZt1GUjzwHozJssc6Q5yymsqeygTpYijvmIJm9q6qMZgFcEI5o
         vEsBdMgmMDCnTzjjp/oP6IAkkMkRZ5YGWzF+NBqN09V0+4WJcaQqGLBQi1ZeiryIYwka
         gVDkn9b8HijOVyU6awCVy+uDv40ZNQE1Ts7avmQJyxkLofqOJgZ60mueO2fDvl7eQAPe
         HMevc2znOwISKAeuw+6cfM0tk5A62CEApMVxXI6qAW3D6qANvFZ9EYZZ4+gE32jcWOIA
         eguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696706; x=1762301506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tq2p1V6khYqdwj7axqsIU1Jb8x290oJDm2pwh+Ywad8=;
        b=B0ODgDXMxipiOPq/NyMM8iMF8J8v3OD2yiuQxxtjLP3WphhOQ6d+xMbhqjWje1Bks6
         JLK5LTmu+H6bk90XM9853NBw4ThwkYAo7qS4oGgDfZtsvZl8M9PWrLLWFEGfEiVeJCR6
         Mt3aTtVPC/LMMWvqSFvB+9linasFXd9vpN1+6+ly+4b0bIgECLcHVTQlfEtpVyPKrPch
         OZq0v13DMDjsB6kx6rHrCmZ1gDkLFXEVZaa3Vcm2nABnB2Ol2anwpGMavhgY4tgcHt0G
         v08jxfRZ59r/yoD0ueViNOMFjTgVDbyRzoOv4nZ7l5cdJSZ8MWa28O1hyjQxGZf4ml9+
         zrOw==
X-Forwarded-Encrypted: i=1; AJvYcCX0ojTWZuD3r+L9qgfsUvPOpzvKNbPyMj1zaAZX/snGvMniCB7bg+KaG4sS5ibhxGRHE7slPFs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7uNnFWWR/KpTE4k8X8kajMytES5R8swUzdYz6NbXXtY/qV9TX
	5ssw1e+I3KR6nGcbLIplB6HsC159moSNPFB97Jtvep4eBZggiFNIryrK
X-Gm-Gg: ASbGncsGK2R4C5pk6gEM2CLRUB32W8aOAuLuVnXxKmTFpPixLZ/WimliT0u4pZu19CA
	/v2ZERCDuz6ttAy4eyZ5NfW8Q5geLgTGxxzrJI4Nw/Vz8QvN5X4Gs7egOnvlwBUdwD7egPSpsoK
	S8Or0rXNppo+THvjsKxx0flXUzfyuq1YxdQDEA+JPb7bi+AvjP1RhSRGc5wO0vgbG1QLri7q7NK
	Z60FZQG9JCRu1p++53Da2OTK/dUIxQXWyrgPHj/SW0ZtS7YrWheTHy6IEtKsxk5sCsVjGgkVCT9
	Ffve7zQnQgPphzeFfVlF3oLr8a2w8z8qzO2ye4zGHp/1Qg+qCwZF4e5oo50PPYu8dLUgDfDhdj7
	8zEkCbFwk4D8WaIUSod5r8OpfZCvCCKhraOwcqpDwUs47S2n7kPsuWBZ/elQYm8DO37DQKn9wdP
	u9PCf2C9P6001L3W3Mw/WLrNehCvn1Bz5+QCbcqackvqS2
X-Google-Smtp-Source: AGHT+IFhZd8hjXUHUkgWb5j59kFDmvYlbS3no4lghYJO/biRsJA71NeXCb5OP8OCzXDNjXkj1j2Y4Q==
X-Received: by 2002:a05:6214:234b:b0:77e:aba2:c8b1 with SMTP id 6a1803df08f44-87ffb49eae6mr67532066d6.22.1761696706418;
        Tue, 28 Oct 2025 17:11:46 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48dee2esm87255906d6.23.2025.10.28.17.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:11:46 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/5] dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
Date: Tue, 28 Oct 2025 20:10:50 -0400
Message-ID: <20251029001052.36774-4-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251029001052.36774-1-josh.milas@gmail.com>
References: <20251029001052.36774-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible strings for the sg2000 [1] interrupt
controller and timer.

Link: https://en.sophgo.com/sophon-u/product/introduce/sg200x.html [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 Documentation/devicetree/bindings/timer/sifive,clint.yaml        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 5b827bc243011..122d622d20a57 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -69,6 +69,7 @@ properties:
               - allwinner,sun20i-d1-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic
+              - sophgo,sg2000-plic
               - sophgo,sg2002-plic
               - sophgo,sg2042-plic
               - sophgo,sg2044-plic
diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index d85a1a088b35d..42cbfb4d46a17 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -48,6 +48,7 @@ properties:
               - allwinner,sun20i-d1-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint
+              - sophgo,sg2000-clint
               - sophgo,sg2002-clint
               - thead,th1520-clint
           - const: thead,c900-clint
-- 
2.51.1

