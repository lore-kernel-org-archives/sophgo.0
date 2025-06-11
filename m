Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E28A23645F
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629476; cv=none; b=Cjt6BHpX0Xkw7fezy80v8kHwUTbv/9Z703E7rLg2Jf5zpasYwm0Gv35NKhtYFX7Ieoa3YEyThs3agGKNZH2RCtdsvxfQJ5jhbIC/wZLPE9C7dw1sRqrRbdcZbyjH5y9Y7Hw052vJNQHD3OnUZgVCYZdQY6ddmh4tYBqgp3eSbGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629476; c=relaxed/simple;
	bh=l6XeT3LXyFrlrCtT9xgFGVmCHaNUCX0eKWZGqDdqJ9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sYu1xR7yeWODkHF/RTsYCwK/uGA7rEAfEFrluJRkR1dREYt/t5ZZPETnPE0JTTZ6iDV1I6LsNDe4kQ3M/aREwdDldXc7SxW9bzoa4dmy+FESa8pdECqjUrgi2nzovFOeSURhWC3vFeaZk5cifJfVkNJgiSqfNWQCG3bFaVVPmpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWH8yhNA; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWH8yhNA"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a5840ec53dso76512301cf.0
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 01:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629473; x=1750234273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00Y+C1NgJK+RcRNEHyqDxW/VXT0REGuVvjiQNS/nXxY=;
        b=UWH8yhNAGfRJnwlL30gUY1ZWGOgC9GdmqBSie20/R9Z/GRoYcxlXsgf3GoZ7rVY8m6
         ANM42xSkalGJfiwWRaIPqm0jbchWuuaoK9h88nwLJog+xNoXhAE8tSyXRcSWjyDBNst1
         H+HkN50eDJ8iVCO7eb/5xPZB4hH8oBf6026IIGYys/TNJA5WXQ6q2y1P9DOWlrv7CpoD
         yWD2thTr3OKwkM+4umH9lSFwGMfEE00RDw9KHdAoIVTA6I+W46htUsAknxYo2J3v6i1N
         uVjLau8wddH9P6AkaWBFp4cMeEVJGpqIlyh0yN0jvPVZG/RG/21RYmISDDZLLMWlXQl8
         JJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629473; x=1750234273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00Y+C1NgJK+RcRNEHyqDxW/VXT0REGuVvjiQNS/nXxY=;
        b=WzN2XK/fCaue00G166iNJ5KLvM+frFJ+W3l32T2pU3H3zoK+M28//K2DT/6/c17nTm
         xZRgSJddOVXpdh0nSc59QDIU3dfiehtv0GChU12T9YSGwGEPH4llPcwCt0UUVII9jFsJ
         JWoHkmBEUAbQLU/HOVZl+gBB6i6fbJWge2mkpYeCqyEjRP7tqzE6DbRFPR0+fBuvVBDX
         wbbsd0hqJwwhaMsXQrWfeqwZpjvQ2jixu0m8fNB9IoDRAt+eevV47QSwmnpI7Avtpr1p
         xA+i/7ghJC1CaGF6OeYOV+bSygZ3m464VxbBiabgvo07Q6BrqRsD6Z60VgWkwELyahwP
         +RIw==
X-Forwarded-Encrypted: i=1; AJvYcCXzsK5RD43RiTyeaDbeYXhXBvhHaLyFnWhdY8gGdLIxvvn7GAudKQ9WeEGwAzesxTGXO5351n8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz46mklxNh/NwR8+lmGzY58R9RaM88NCn9OPCHFChRg37N9PMKV
	Ubvn5uiIkLW+P3OQ1cKamEHQt0wVvtdsrs0uNcMzlSszPLU2HInDMQlt
X-Gm-Gg: ASbGncsGCeadCT8iXNyM1ykS5jPXop6kDtrDaCjI+dzM8xdK5VfOBVgPAdpRvGPA1S2
	bVfRhBquWPuj0SjSBD8/lC4ZgxgXZC4vePvCgkxO3/HSF3OWuuEmI1Gm3VfTU0QoxpQsSrI9jli
	UOMWW5aIAETXXGsa/+zb+0208fsVS5oavPyi5XjtWYTOMqSuWFIsLdS0+IEiKC8vaVcVyuWhDG0
	rZ29dp/sq0yYvlwXY8y0NJ9uQ0qQ2ljw5s1VaUqBMtLipjaP85SDZYv1gtdTh6mNXVeHTAfNdj/
	2fCvPtKSvLLpGJAOMYaORUS7UOc/lN4SlE+w+J0eUstgcTU/
X-Google-Smtp-Source: AGHT+IH/A2dN7aEwFSvK+XOGHnNd1Ms/qTqK5FFtVoR1qjX6O4PJ9oh2Gq1zA0E/mBczJM+1ZkNyHQ==
X-Received: by 2002:a05:622a:4249:b0:4a5:a96d:6068 with SMTP id d75a77b69052e-4a713c5871dmr48328971cf.37.1749629473419;
        Wed, 11 Jun 2025 01:11:13 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a611150018sm85377551cf.8.2025.06.11.01.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:11:13 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v14 1/2] dt-bindings: dmaengine: Add dma multiplexer for CV18XX/SG200X series SoC
Date: Wed, 11 Jun 2025 16:09:58 +0800
Message-ID: <20250611081000.1187374-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611081000.1187374-1-inochiama@gmail.com>
References: <20250611081000.1187374-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA IP of Sophgo CV18XX/SG200X is based on a DW AXI CORE, with
an additional channel remap register located in the top system control
area. The DMA channel is exclusive to each core.

In addition, the DMA multiplexer is a subdevice of system controller,
so this binding only contains necessary properties for the multiplexer
itself.

Add the dmamux binding for CV18XX/SG200X series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/dma/sophgo,cv1800b-dmamux.yaml   | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/sophgo,cv1800b-dmamux.yaml

diff --git a/Documentation/devicetree/bindings/dma/sophgo,cv1800b-dmamux.yaml b/Documentation/devicetree/bindings/dma/sophgo,cv1800b-dmamux.yaml
new file mode 100644
index 000000000000..011002942235
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/sophgo,cv1800b-dmamux.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/sophgo,cv1800b-dmamux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800/SG200 Series DMA multiplexer
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+description:
+  The DMA multiplexer of CV1800 is a subdevice of the system
+  controller. It support mapping 8 channels, but each channel
+  can be mapped only once.
+
+allOf:
+  - $ref: dma-router.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-dmamux
+
+  reg:
+    items:
+      - description: DMA channal remapping register
+      - description: DMA channel interrupt mapping register
+
+  '#dma-cells':
+    const: 2
+    description:
+      The first cells is device id. The second one is the cpu id.
+
+  dma-masters:
+    maxItems: 1
+
+required:
+  - reg
+  - '#dma-cells'
+  - dma-masters
+
+additionalProperties: false
+
+examples:
+  - |
+    dma-router@154 {
+      compatible = "sophgo,cv1800b-dmamux";
+      reg = <0x154 0x8>, <0x298 0x4>;
+      #dma-cells = <2>;
+      dma-masters = <&dmac>;
+    };
-- 
2.49.0

