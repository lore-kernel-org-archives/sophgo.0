Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8657410E9
	for <sophgo@lists.linux.dev>; Sun, 20 Jul 2025 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753000379; cv=none; b=iQn8jbmXzxvmg8Tm3WBgJWDtg+AqPWzVhxMwBeLivqgBU0cKOHOhY6cNYnKEeY5PKIxaFSSVBiwmHfYxGCFo5ajS8WU4YJG1Es8hy/d/McJabDGGPeK10yaJe9jVcN0JK2EZsiifrlSvt+mrCZu9L2+qXdBJ9qZ3bR/O4hDfukI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753000379; c=relaxed/simple;
	bh=vXVFaJbRIh2MrD1GhRV05+9e2Sip1lBqq2iHYXA3CvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lEaa0cQ5MogHc5P7hMEg8snFKTvyzlyhVcgoVTT27MQt+UTvApS/bO3LjeSCZpPXvvJ49qcWh42DyIvsAmJOUSKvSiJfUva5cEwJKdZYPIIAI9lbDdJPiO6mbeNS6CX3S67r25fFzPMQU4T7+jH1nBpajF7SCRMv+UPLfzB9bAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gf7d2/xi; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gf7d2/xi"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b34a8f69862so2624868a12.2
        for <sophgo@lists.linux.dev>; Sun, 20 Jul 2025 01:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753000377; x=1753605177; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4FB/4XgRToAosI3f28efm3RMFKFbeCd/sui2PSXsGM=;
        b=Gf7d2/xi7mUKI6Mu9lumN/36biUZMULjmgZbXwhzdm+8thN49e/7RigL2pDsRzdLTi
         dFpMYx3DJQhcxYp0mKe+WCSsm7UOaDScXWlHQb12ucF1Nrn+LUGVRSac3s2KCYNdbCw7
         bCMh+ONpMHzIWfDHkf9Lsaa7iGMQpKTb80yCUZc2rkPcYAul18d38db0E1xipf24u1XK
         yrOeCV69BiHGvP8jfllWj/lbqpkVrojVsZd/Ye+MJ3ZJ3TQNCDe5y/hn9oGYZ5StPi25
         cYLXCZGXZEKe/oAvc5/0QrLbL2m+Oe8AZqHhcW8S0ZK5d2/CHUkgOh4uM0xm85ziN99u
         61iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753000377; x=1753605177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4FB/4XgRToAosI3f28efm3RMFKFbeCd/sui2PSXsGM=;
        b=w3yNHtUOXBgnrMnvjss5uUcidgd5OCkp3k68DRrTrTWiE0nQgDNm5mblGxysTEt8ks
         2mRh3ttY8lnXtsi25QyKojFm2aBbtLxP79/0/gnmXc9U9DIonFVVqnkDOqFAK1kmbz+C
         fYWuMsmFvQSmUhX24U5SKDS3c2YH96/UrUm5CxlZe2nLsEPW2lgsDDmLX2vB5mLrJ3Jr
         4gEjHSItHdZTjhm3Ew7sr+ntJw7tRg6Gfgi6B/g6IWlyvFUnjp4EVqlOrpH6KhZgv0eK
         wMD6JcByXlw0/rwUUobpbCHftuEumqN+fMbmHuZ+ubYJxLdCsTD33yXghv7F8o0c/Ugj
         I3vg==
X-Forwarded-Encrypted: i=1; AJvYcCVbjPKYVqBW1ExQPottX6xYXuV8bw/hshVQXmVkLRDvE7++LYAoUcOEUpM/PxBU7q4RE6nxx78=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpOk6IG4gHcAOE6QLdzPsIXZDMB/tJSQ1+1fD3lyg+1z+Fal/T
	S21WfCTEytknpIfmbjiwiRmjUwLZ9wtvJ1vLHUL1TZxcBJvCLlNniC60
X-Gm-Gg: ASbGncutjVz8xwYroGxBmCxGcOTHHzto52ya6umx+ZYRYZSGc3DSFj6rUr7JgSEwwQb
	N360cGfI0elua6mxbEHCeD0ODrTglMEgapcOs9N3VfmzoiM/kxnV5+IsYLwJMNkI0g4NDNHC2yk
	Mw6c2cBUPUYkwSkVbg7jA94UpU1/s0bYOkB/SkXBH3VxIze3iwXxKDC8Xb/1UwCmDRplOGRpz4Z
	SDHxzImw1UgJDkVsxKi+zzQ5RJEjW3SDQlTRz9uXkJrfWsHY6YkWe1mZjYAPyWBrxeiOnSfmpH8
	n2pfHJyJLAxQUXbZ8rtfGnH8+YRTQfWMNSuMI2ubdC7fIo3TQlhR1lETym+YaG3zaMnQdTnoMVk
	7DqMInPuR2xz2Gg==
X-Google-Smtp-Source: AGHT+IGc2/z5P087dO/qIeMpZJTqXF9gedh8hHC8SAN7DoJxqGInUWHeRnUabLfomatBcIrBDZkwDw==
X-Received: by 2002:a17:90b:3b90:b0:311:e358:c4af with SMTP id 98e67ed59e1d1-31c9f4c4604mr24803623a91.16.1753000376153;
        Sun, 20 Jul 2025 01:32:56 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1002::1d55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3f46b97sm4079721a91.41.2025.07.20.01.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 01:32:55 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 20 Jul 2025 16:31:43 +0800
Subject: [PATCH v4 1/4] spi: dt-bindings: spi-sg2044-nor: Change SOPHGO
 SG2042
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-sfg-spifmc-v4-1-033188ad801e@gmail.com>
References: <20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com>
In-Reply-To: <20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753000358; l=1309;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=vXVFaJbRIh2MrD1GhRV05+9e2Sip1lBqq2iHYXA3CvA=;
 b=3o2MOgX78qIjiz9F1HO7Wk7wo7kw8ovqc2mY18T8AXZYgNczjEjwHyyr+V7WsmvJ027qnTQcb
 S/Q02IqrdGZBWMqDtI+mbWQYu+cRWtZQ3o2yDzWGKWUJ9L8qO50qZte
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

With further testing, directly using the spi-sg2044-nor driver on SG2042
does not work. SG2042 is found to lack full compatibility with SG2044.
SG2044 has OPT register and it's necessary to write but SG2042 does not.
Due to other possible hardware detail differences, it is better
to bind SG2042 independently.

Fixes: 8450f1e0d3d0 ("spi: dt-bindings: spi-sg2044-nor: Add SOPHGO SG2042")
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
index 66e54dedab140a167ad84c43f312f93af2bfa06a..0e7ead7637052a008c64b82477d060d180c43acf 100644
--- a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
@@ -14,12 +14,9 @@ allOf:
 
 properties:
   compatible:
-    oneOf:
-      - const: sophgo,sg2044-spifmc-nor
-      - items:
-          - enum:
-              - sophgo,sg2042-spifmc-nor
-          - const: sophgo,sg2044-spifmc-nor
+    enum:
+      - sophgo,sg2042-spifmc-nor
+      - sophgo,sg2044-spifmc-nor
 
   reg:
     maxItems: 1

-- 
2.49.0

