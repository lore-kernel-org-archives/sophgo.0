Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A40143C69
	for <sophgo@lists.linux.dev>; Sun, 12 Oct 2025 02:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760235980; cv=none; b=OOCDj58VFohr4sk6YgLm/OYvYtc2hv9jKE8JqNTwwABqHk6Uv568MrcozmkMautJb/Ku16257OjSg5xOmgtIV+ILlHWx5tKGRMfc92Dwk48j1wCMmRWUUGr2WrssBZXgZ56jkaOGF+eLJIPfi5QhcQJ85da8KZE4U1tRuYj7Gnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760235980; c=relaxed/simple;
	bh=Eqt79fSlOJq/HqDwqQJC4lZ1h3nSfxXHoYjtimE2BTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6Rksy49rHfg0328teXCDHhfesfwxZ6WkFt/qoaV+0ju4t8GF3UqX/64mEiJD2ynA/Tv27xvAm55RkkEHPUQKUifKCx7vyrlPoOC4H2Uj2BHwwWO3l4pi56DaKscUAaxR8/NqRL4JxXO6jzJjylZyxdNzoze3fIfQRyPy0Q34LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRTyMQPl; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRTyMQPl"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-781251eec51so2663103b3a.3
        for <sophgo@lists.linux.dev>; Sat, 11 Oct 2025 19:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760235978; x=1760840778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYj9BHj7cwVf87n8ZMWQnat/cLLuDjVQjaIpUr5Z/nc=;
        b=FRTyMQPlce6EVqjXRU8DJ1RVsBeCf3sU3ZJAyj/4C8dJIvbxWlXwtZGKtsklrRsOYU
         QQ2y0IvSP5lgv+RrtFgLhBjq4Fev7GLR9KVHYeN5ybi9SQcJo01PSaBytTQcjuPITp29
         jHj21Ylpba4XdgeZzYYACsySUg3sa3cPiM8iI4ZJe3qzD7QfAzXqyolNa3+2AOVD5e5a
         aBSFYXXKw5c/ZTQ/tjT6smbLEtDdEkGw4tZLdHhP/sJykQiFbDDsR0ki7ITFFSxR/Tpj
         gQ/iJRBfOHJY7QW56CAWDBuyUZZQx/Teg3Dz6rz2hz1muS0r7ewkIP+s5byF4daczTLC
         Iltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760235978; x=1760840778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYj9BHj7cwVf87n8ZMWQnat/cLLuDjVQjaIpUr5Z/nc=;
        b=GCCChOMUzhYRZk/jEZldvKSPM4+Ug7auqxZMrNGs3x3oYRbEqr/HBEcMx2Y9nhxbL6
         6/UwCMtSHqFNspSjMTNdo6YoIdRdEQDxGCohX1sNtGYtupEmzvGAoVEVT3Hgm3GLGGOW
         ZkVLORc3WWLeTaevj6t/g4NsmzvEQAYagwRVejjqsML0Ltn7JmbkWIZfOLYincwajgwK
         X+Xs6B0RNjPfYdubodHTFdrVfj8AURR8RAga6ZdIvdGfh7VKSJUdrLRNUoXmnB/L9PcK
         UQsksR2pkC8aKPlPWgk9s2y1ko5AI2Ao+3i4WJLHO9XUCOyW96kRug3GOz6DV+mckT3K
         g41Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxpmEkSMeifgHHKJmSBiFiKIlNmowdGYW/4fK9a0aR7DNA6qBRrsIKstzl5nK7CHiGTu7ZMH8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcTiJATJogoOT5jN3g5ff5ezzbKwCbhxhHfcP/zZE84YtcvJLX
	3e9HbOa8b0c8A2EQbuO/M81fRTTJ72vHXNMgPR7LR+FxNsp4Kc5/nhtJ
X-Gm-Gg: ASbGncvQiTDxBuunaGSiO7UP2sC9k9E0Et2aSeVcU4oWBoyK4otWvimgo8NTn68cDU9
	LgUGRnhi/UwA69FrqCVGS+eAIbc0F6sjuAg41PxItJbg/e0FSR0lT5MwhBNLBmdSvL8zZcdTNDt
	nHO9jNOn9x0YmWm5Po9AkiX+1x+gsYM+JTGUx61B3AchlZXv1f8g/BSNHm6Vuje5bGbH1l3+g/m
	ScMHze2attUZs2Lm9UbyZXUFpKm1TeWnHM/gl5Z/IZbMOhshB13xbcbHWeLSkdv4s0U+9MfF/zn
	Jrv7Sqv68TFDWy0DAoeAD6LPP9a8QnlqnlqEFDrlLnmQjOXkGho08sX4WvwySR6R8+SJPCcLHA1
	abpnuappJCOhhTlsbFsZDGbp5y/40jbgUlyAaZMko6x0CLr+YXVY00WDGyi6bnRA9PIhd
X-Google-Smtp-Source: AGHT+IHkPmQUQfunFHahd09uFFipzQG8nUYJ4jLN6bvERJ5STyPU28/LTOdCiOsyRzsvL6DNxvTF7A==
X-Received: by 2002:a05:6a00:1394:b0:792:574d:b1d with SMTP id d2e1a72fcca58-79385703ba7mr22526012b3a.14.1760235978345;
        Sat, 11 Oct 2025 19:26:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9992ddsm7180489b3a.80.2025.10.11.19.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 19:26:17 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 1/3] dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
Date: Sun, 12 Oct 2025 10:25:52 +0800
Message-ID: <20251012022555.6240-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012022555.6240-1-looong.bin@gmail.com>
References: <20251012022555.6240-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sophgo CV1800/SG2000 SoC top misc system controller provides register
access to configure related modules. It includes a usb2 phy and a dma
multiplexer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
new file mode 100644
index 000000000000..d1993f2156b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV18XX/SG200X SoC top system controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+description:
+  The Sophgo CV18XX/SG200X SoC top misc system controller provides
+  register access to configure related modules.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: sophgo,cv1800b-top-syscon
+          - const: syscon
+          - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "dma-router@154":
+    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
+    unevaluatedProperties: false
+
+  "phy@48":
+    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@3000000 {
+      compatible = "sophgo,cv1800b-top-syscon", "syscon", "simple-mfd";
+      reg = <0x03000000 0x1000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+    };
+
+...
--
2.51.0
