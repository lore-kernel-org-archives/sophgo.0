Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FC14A4410
	for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 07:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963960; cv=none; b=Ub5WqESxBqx+9RnXaRpxWj/opMFw+G+JMJNa2Ie4r1N0BlXXqJfG0PRYiw6dUZTgyOVudIVMcP6hnTXps0fwmj01lvX6w90et7grRED7fwErp2UJN3k+B1b1kKrWVxnRmknJTefWBCQ56Glt5g41BVvj3BSLBObU8MacLndvLXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963960; c=relaxed/simple;
	bh=k1r41giEFofExMQ2e6Ka53lnCCUSRqj2gUqcvshC6U0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJxai5TKY79cgNgpozkRt+gEXpNIQj7jGxrBaR3YBCbj2fZygobZsmlX1bTGMEasBekKxzvLbXYpuqpmJv8bIcnVTlWj1wGF+vPc66LbtnW7JRKm36p2K16fkPLVLn23wp6f7P0kvh3X3GerOjFxPXky/GubuF81HHYjQWy/waw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3Tk098R; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3Tk098R"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-868b3248b2cso2907218b3a.1
        for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 00:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791963956; x=1792568756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/Mwahr2z9hW7MyIWREn6uWQ3XJrmLHNA2tUduWF5gQ=;
        b=k3Tk098RrqS67dMaczJoZLwjK6DnznznFTP9384JUdWFOdMfVO3Znec1bI5FezfUUW
         ged7qJH30wWrrw3k0JEm0uUQsZs70xPqx3jfqhJe7UECzZstczbhoF0qWJto4akUQhfl
         hyS2yumVlUzqsC2bVX2RboLmwhnYoiH645WfekYU9peBls0O1AmHhFaR+roqQ6CmNqy1
         TRsrzjy7NCEwItAuldxt3mcAa8UskVg2OW2DkEW37C3BRLLrnlL/mk1Tn39KR+Iy7s1y
         6LG+QurwYq0lyMW5qx8c7az/cmIQ5Gbdcdx4hzfKZSbv9uJLbiEEUHDZxXBFBvVeabib
         Vb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963956; x=1792568756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p/Mwahr2z9hW7MyIWREn6uWQ3XJrmLHNA2tUduWF5gQ=;
        b=PiYOXQf2eq5WhdgFEfnuIuU7o1QAfbXoorDPWz6RFdCarKVph78h1A2XT0llhm5Dm0
         dj5nUe8jTm8ZJ+r8Wmqm73ACUHAFjFccB4S9HReFFt+Z5lK+Lqz3mLu/iLteNlLDhLQ5
         fnq8tVs+XcPOuA4a8o8XpnsDdTFHggL1M4OpEa1X9Xt3BC5KtAuukaWmS6QjOQRRRuTV
         odo3UUSpO2PMZmDawKEWBowuth9OQ5clYHC+sOFEFCAx/rNZEFh2F8SLcsaxSmIxkPG9
         TIsesWl/b//5YEqiUN1WxZ4JDx9T2zCvFwluf1m8SD2rIGOTPAthqfHG5viN6VU6FwTy
         nz2g==
X-Forwarded-Encrypted: i=1; AKwUvBxRvgx63Cst6jxPHQk5AGNgTXUc6PBhwn/zh6dlTByYZhhCZ/gTDjd7S1DIR7EQ14vqroLPKWg=@lists.linux.dev
X-Gm-Message-State: AFq9FYKMnuLgAyutU1sKL3gJFLOsPox3doefsfna5pkSiodzkpFT/0ti
	bChr7M9NaeCwRi4Kr1Mb8wumY5duVarIwL5I56d79zhc+sBEXOHVHbMR
X-Gm-Gg: AYBFou0/dQM2yeQV2RbReuXgkeHzJCZ0/8of4Zyf1BdE0+QLnChn7JLPaU6FG52rX8s
	XE5ePBp3BIM8Q0SdNPL0020wiRgqYPJZwXFiwbtxd5E67oAvhXc7iu+dbN4RXubFgriExeThoXf
	af1Jupg5Ye/tMyPX1mraAcLGrw98ui2lVMfkQ2ClLNCHlK+JSN4kD0fVoDXbyGZsI9gzQLXa/KR
	0uZI2X8EW5Y0iH6nB3C13Ch4eAOJ/7t6gsbxoyL/4rUwpM7mKeeOCENhWCB7Sw0Zd+CEEmBee4H
	AHeyXedPV5ZuqYQlb+emIOdQW+sMWVjJ/cyysY9M7MVmROCz3FpJb9/W7/bHKBg0egLXMfuz+P9
	Fxe5sJTXE58u/tzkoraZrlOXfu5vPVMGtiumP2ve0ZX+EqanfV7mQrlsP+wCUkMd365YD0npZOz
	QljclVqrZH1m0Z7VTOZWFc6f1SRnzvaoSv8ER/vsnDyadjFfsZ5pT84bOOVrql2OgDeu8k
X-Received: by 2002:a05:6a00:3d4b:b0:89d:e946:8c64 with SMTP id d2e1a72fcca58-89de9468d0cmr338050b3a.57.1791963955830;
        Wed, 14 Oct 2026 00:45:55 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f518b74sm797660b3a.4.2026.10.14.00.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:45:55 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/3] dt-bindings: nvmem: Add SG2044 eFuse controller
Date: Wed, 14 Oct 2026 15:45:13 +0800
Message-ID: <20261014074516.240247-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014074516.240247-1-inochiama@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo SG2044 uses eFuses used to store factory-programmed data
such as ROM patch, public keys and other factory information.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/nvmem/sophgo,efuse.yaml          | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
new file mode 100644
index 000000000000..d4bffe2724ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/sophgo,efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SoC eFuse-based NVMEM
+
+description:
+  Sophgo SoCs contain factory-programmed eFuses used to store ROM patch,
+  public key and other factory information.
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - sophgo,sg2044-efuse
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Core clock
+      - description: APB clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: apb
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    efuse@40000000 {
+        compatible = "sophgo,sg2044-efuse";
+        reg = <0x40000000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        clocks = <&clk 0>,
+                 <&clk 1>;
+        clock-names = "core", "apb";
+    };
+
+...
-- 
2.56.0

