Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81882253FE
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 06:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007726; cv=none; b=EShkvQcaw+bACjtwHnwAV1tjOXBXNf2T1+/ruGgpJ3cvwzdJwr2WUG4vIQ16PcsxZhGmefeLHNo/ORezBpeMB9cSmnYj97Mw80oUXzGV0vNeIGc1Ru1WSDE3jc2mXbcouCGNZrui1fOBTGH+BZKq2G3wgKeSF1oiY54J1Fg62Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007726; c=relaxed/simple;
	bh=Ocz7+gcKVvx9JS7ROJOowK4HkGeQFJNuw93TvrjIVTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mVjgR3G6p8eZUK7ue8BwqF//kV4HuMXI9oBIjUqFqMf6Io/vIb41PQ8ncE7MWm93O3mpYA4ZD7ooYKJpEZyMDg3AUzbBEcJ4ufkw8BBmT258A+41tNv6xGoH4gKSaW0Vi+LDZwOctsfw3QfdRLZJUpqIfozPM6xHM4dN6PXHjXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8VRFcKp; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8VRFcKp"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so4153865a91.0
        for <sophgo@lists.linux.dev>; Sun, 06 Apr 2025 23:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744007724; x=1744612524; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGIQTeSUJ/msyOcBGgyCOEy8RB/Vu85gn7KiLYCFQmg=;
        b=M8VRFcKpSBCVLUZiKPWzz7PWGHYomT6Z/xKdaW64mpLH7i/E/crfDOrlirrDi/54Yf
         pevwbH568aUrbHm6Nn98Cj9oGPXvj2DCWkAQsgfWz2QkODQJiUCrGt0YaAhCNUfVdTjV
         79uFYwpePWsDhc6gHFGQ+1OFbfEhrdAYXIEm+lb1whubiiuHOEMklOA/O9LQQFV1UMK+
         OKa/YHkAcwd0ueZNeMMUJ8SkR5Qv9YfcBYxM1W5tej/31TnVAW+pliXf9+PlJKSvKBM0
         8qKo5R75PTKVDhHTccxGdNv17Ob7289llshBKTHk8vfeMjYt5WE+OG0j9D8l9Yx8r81T
         Po5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744007724; x=1744612524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGIQTeSUJ/msyOcBGgyCOEy8RB/Vu85gn7KiLYCFQmg=;
        b=du7E9gAdkkryziV9vSAB69a6Obz1MwGoBrLNJMW/bF7LyqvNt1gW04lh/SW/PQ6JGY
         FNVAHnkdVygqM5Utrzv6q0MrDuFwtBu+0h1K8h+vRuHsFxI13HHsZgLIetGEMf4sPMsR
         s4itdS1SYdxr/I3mhr5Y7vHjkkYTlmK86HBbYfzbRI0n43DUo+JkPXKyE1aCm8OE6eMv
         GeYMHaxYV55BWu1VxrtuMVxzXxESbpUt9M+5o1t5D6OeU5wzeezrhu+Z8755Eyh9+Tt8
         dYUexOs0/d/IjKr+Tq+5iWrARVsA6J4CFdgwUbFnvGLjdGvFOdcP9FOp17y9bpWMYHmc
         yN5w==
X-Forwarded-Encrypted: i=1; AJvYcCVMebzcxg3FLukA3U5Z5u9msdbJRUyKcNVv/fm3oqf3wnw7h4jSefCdvE113/x6rbZF+Oi99bg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzuX8QEWcdfCgGBTNqXBTG8HRjWQdP3ruF7DrAGiE07BD2wylr/
	rT7L6YNPRfgdhf1oxZ0fYGeTqPsGrZo9ccgkvkSyVUomDeM1sxvPcLwJQ9dtMhQSBA==
X-Gm-Gg: ASbGncuFqwtIY2MopGwVvFeeV9KL0cyik7fQvwOPXytQN2GCDCIJ4oc3m/g7hHvdIMW
	k/FgWXU5WVxrU//cb0VuiABgCE681p08qujiuwzbLhCet91P2WgREZEudXKLTOjPoGpWqHceH81
	e8jd2tSlhAKLtVBZUh94GuIJSbMRPDo0Ha/MMp98v9JwBnIvJXGSqf7Y1mRNdv/8fksqRkphf4N
	4CNDbcivxZ9QeZKekSbKK/YOXVvIAuid+doDNilNnAhIyW9HMuPV94Mr4wonHvZwQhpX2pL2Gu2
	azx+BGTPVEJoDKu3mAd6DWp4NAAC8riokgVC
X-Google-Smtp-Source: AGHT+IHBFpIgTbEaMnBWm5RVBjeYevVuixu+5yTWxBRjJdtCoVEVF/pCoi2mcsaK29zligKIYWm+4w==
X-Received: by 2002:a17:90b:1f8c:b0:2ff:52e1:c49f with SMTP id 98e67ed59e1d1-306a4892fafmr14203035a91.26.1744007723635;
        Sun, 06 Apr 2025 23:35:23 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::610c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983da691sm8048044a91.47.2025.04.06.23.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 23:35:23 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Mon, 07 Apr 2025 14:35:12 +0800
Subject: [PATCH v4 1/2] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for SOPHGO SG2042 SoC
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-sfg-spi-v4-1-30ac949a1e35@gmail.com>
References: <20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com>
In-Reply-To: <20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
 dlan@gentoo.org, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744007713; l=1084;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=Ocz7+gcKVvx9JS7ROJOowK4HkGeQFJNuw93TvrjIVTM=;
 b=Uxcj0G45ieTZvKKQjyJrxTtDAyr9bek1RVrok389pH1B68f9abGhumzllp68p4QUAXIPiL0cU
 w83qtuBizUND2pqbvQGlxfR9NsMTPYVLoZS9AoWD/VKGhB/9V9nGlcB
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

add compatible property to include "sophgo,sg2042-spi" for
the SOPHGO SG2042 SoC SPI Controller.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index bccd00a1ddd0ad92b437eed5b525a6ea1963db57..94102d94ed5dffe889a8a11c1c637d466713c208 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -88,6 +88,10 @@ properties:
               - renesas,r9a06g032-spi # RZ/N1D
               - renesas,r9a06g033-spi # RZ/N1S
           - const: renesas,rzn1-spi   # RZ/N1
+      - description: SOPHGO SG2042 SoC SPI Controller
+        items:
+          - const: sophgo,sg2042-spi
+          - const: snps,dw-apb-ssi
       - description: T-HEAD TH1520 SoC SPI Controller
         items:
           - const: thead,th1520-spi

-- 
2.49.0

