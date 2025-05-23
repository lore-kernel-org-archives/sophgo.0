Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E3A22A4DA
	for <sophgo@lists.linux.dev>; Fri, 23 May 2025 10:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997706; cv=none; b=lOIJ9tcJLjNXPxrsfq+jqK7By6CSYljD1PsggoXDqHsDlO80Zi42YGupCRzK/VxvKxSBiOWGOZ3AlX+ntFGATVqaFt7Tt86ds89Bl7IQYPMROSfPv2SWqU0A5DdTEbx3EeY7agkUsmQpooxAdxYCdKG9J1vEaSMADAGLVjoVR1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997706; c=relaxed/simple;
	bh=B1L+ns3J9BEA46JOnVmHJRQ+0e4FHF2prsHtqzS74ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S4c2sX2crHWjqZR8LxPIYtTXb1sLBrD06qVd0FV1kNLwt64tgwns8vPyOBlBluE2sO8J0NwJaGihH91OOpKb0ipgZPXVijNcM22b5EJ1okawvzVNNmameaM84X7foV2PbghlSesFYJ7pDQ3efBvGpQdrm7FVm8NUbyzfFRZt4G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i38TZDb2; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i38TZDb2"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so7922723b3a.1
        for <sophgo@lists.linux.dev>; Fri, 23 May 2025 03:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747997704; x=1748602504; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jn/O3K1DYv29m3uWPUXSAZ2bq2VSrL80s8QgFG0aSI0=;
        b=i38TZDb2fTKLtdnIy6Dv0fd3BykolLh0f4i4OsBtPxQsGKJtLMIkPT+lMSBcdcKLwC
         jF7sVt34ygvYI1EgiCJn1gyK31RiAmwEAGCELmhnDlA8JSDaJlR1Yihiga7A+jF9B8KP
         yjwYmxL/rIv3uy1qUb33OCv17TrHLiqSxlrG5XKqllj4mLqVemM7vM/EwrVH5KGsVKM7
         Q4OT77yz9pL7y0G9Y0QX5IjbBAtqo57n1VLRZPE1KKf2tRohSKh6r9/f8tsjdMZnYpKl
         j9w/0sYC1MCQLHJbzE4sTUEALyZ1juThkpY7w3S96I/BU0IppJETE4vgLaukeWnAkFxT
         UC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997704; x=1748602504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jn/O3K1DYv29m3uWPUXSAZ2bq2VSrL80s8QgFG0aSI0=;
        b=vruTXRFYw+vMvQZh4Apo2UE/jIFxSFgba+c93FjwWKR10tER2tDDqw6V+OV9pChmEY
         pWuX5TTlK3KVGuus8PX8GPpPT4rgAGh8A/mXmjKcMeBFFcSDa5q/BEe7lsXo4rv0Pb4s
         3UsWc5O7O2m+UuC0favNLT3FPTdkWKL/pDBRt7I20F3ORJaggRHUVeH/Ggn/lmV300AY
         t8g0PU0/IzzTuweMgAap1PU5sNa4Dw3fPXvlZHmFJ2WHmSHnFKUhuWg571UYHg+1aU69
         dpF9SvDgF7NM5KQxokHloBwhZjSvlJjaXsjP56Nm1IY33HloOJmyauc1RJpzxUIhScSt
         lZBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmmcQHbDQLzomH6jHLIN6pHDywUjkKl4NSY7Qo0TeMAjZ8xku+AolT/GU3EdsRGBmZGqgfJxs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHcyRIg0fZlwaEUq5kDRk5rjTbOSI8VXO9Al10FJciUK5LcLKe
	MICRAu9ZDcvrbuemx69ufdzLql12zqt/WdVpkNdl/qnA7YCTyoRcp9HZ
X-Gm-Gg: ASbGncucPD/kNSJasK/D9bC6wSLgmbtOM+GJUK5Z838Su/ZGiHqt4FvNas+FSRhupAN
	EhmlO4OOOyS2S1pYN+5qORhWx9hmjG84bC0BgXhirdbfefUwYAK09kYzpHaDXl7ST/CfuHS0VYC
	csPeYFP4lQz2laYRvKmIA8Pom9utThkWZFRAwZzufT7z6/35culemIqCMJVeg2O0hIiRYxZF5bd
	9W8uWazGVSD7KsxNfdOrGxDGRV9Z7X5ZX/hYPYpTq0kh33l6I+IiB/diJZDT0bdBD6c/K2KHzvX
	7+f+k59Y+8dGO+EBhQXg89Ulm2Frho++ChmttUAfAOg=
X-Google-Smtp-Source: AGHT+IGb/whdK5OVcrGLs3cyAdkZSpq6Qu930wT4pSb23mGATkPV/R5AcFIK2e65lJrScVQ63J616A==
X-Received: by 2002:a05:6a00:4648:b0:742:a0cf:7753 with SMTP id d2e1a72fcca58-745ed842a10mr3899729b3a.3.1747997703789;
        Fri, 23 May 2025 03:55:03 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9739cdesm12623687b3a.82.2025.05.23.03.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:55:03 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Fri, 23 May 2025 18:54:49 +0800
Subject: [PATCH 1/3] dt-bindings: spi: Add bindings for SOPHGO SG2042
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-sfg-spifmc-v1-1-4cf16cf3fd2a@gmail.com>
References: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
In-Reply-To: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
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
 dlan@gentoo.org, ziyao@disroot.org, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747997691; l=966;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=B1L+ns3J9BEA46JOnVmHJRQ+0e4FHF2prsHtqzS74ao=;
 b=5V4GegDuuILrVGuFqa9Oq5IP1YPnTcqKDhaZEcKM4DPE7MLjCwzBI7L8guAOu8jPUW7VeG0A6
 DYYBa4K4hzZBp+BBJVsdr7nXYCILxF0QkTqDrfu3c77sijBT/HVcNQp
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add bindings for the SOPHGO SG2042 SPI-NOR flash controller,
which is compatible with SOPHGO SG2044.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
index 948ff7a096433a8c3c64cba13fc1339d18f6c19d..e083362e8f76f7a7582fd7b98c0b7a36f61577cc 100644
--- a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
@@ -14,7 +14,11 @@ allOf:
 
 properties:
   compatible:
-    const: sophgo,sg2044-spifmc-nor
+    description: Compatible strings for SOPHGO SPI NOR controller
+    items:
+      - enum:
+        - sophgo,sg2042-spifmc-nor
+      - const: sophgo,sg2044-spifmc-nor
 
   reg:
     maxItems: 1

-- 
2.49.0

