Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB4D1FBC89
	for <sophgo@lists.linux.dev>; Tue,  4 Mar 2025 08:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077395; cv=none; b=K1DWj7OgMMkEUmy1hQ9QgRJc8yd6ZP4AUGB3WIfqKVpODAY5ia+qP/4PbRcyoFb4LZULKYWfK2q2pKx5CyXY1H/yO1cCE465h1JxuXTLw9e1YCUq6FyWoiOAC0Ztv705noUKGeSLEGRHydu9ptu2Y+NrNcenO4hXxo2l1HDF0w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077395; c=relaxed/simple;
	bh=wjM73AwUJLNRKdAYXqbBkjiFzYpEkJtIU5MGBsLYikY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NDDAEJ/ledDmv43yI3jVdCVXsTRqKB3fh2d5Syh1EneBn3MIc8Id0FJqd9WWc8ftpXhC2CzgqsePEQUy5KziMVbC7pWkCKpUjIFK5XYMgeSHKZl+KgPYnovU5JxTaqHr1G6IrE4hFQOwIJGM5/0yT1a1XSwoT20PMo7VNX8fGfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=md9zbwRG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="md9zbwRG"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223785beedfso61900635ad.1
        for <sophgo@lists.linux.dev>; Tue, 04 Mar 2025 00:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741077393; x=1741682193; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzuLSIrLaXf7CXwEltqloxoRU7OJxMBLJdraw/sviOc=;
        b=md9zbwRGFwmHfb+7wSVx1dKKIjAEFUPn8M4BTpnu1qAEwG+qOzAeUAYLdLw2QKe9Zz
         e5hfz+6oWVmO8g9I1+pkfOjNYddw+ny6G5SdWUQzR16aFNj+aRuImXDmGjYgNo8sKaUs
         1jU0BOy5YbK/rjLrTwmB20mUX4dVqmYg5DuDoTig/sKmRZpsr7X64uU9G0Nbc9FA5w/L
         OCaowrcKwehO9DpszOKEAgKQNhG7k7zNJXIBGpSbErDZdZ+cNAX1A0cIKD4NX2ML6jzP
         Svc+/yyeFGSY4Q7Pk/qPzF7fs3DXBYbZ9bEl7AcQ4VGiynd+uTReuj6fOcqBmna+r09w
         qwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077393; x=1741682193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzuLSIrLaXf7CXwEltqloxoRU7OJxMBLJdraw/sviOc=;
        b=tOX4ewAoTsunqPHGB/gfqwhuwTRST+JV+nXzgL4xgEUF6vUC8DpauCz+frISblrXJv
         loCxaLoWsUKGA+CLrN/azo5juPC+B2BG9Z/K3OchSpIpwivpWvL1u9PeK56sIZfEezid
         XHHaXSpfsVGcUd13+5RGdr6qT6s1uObo9PsiS3vxOlkUSCNaMN/uoM36FCeZXoF//qf7
         iNXWnXlesHpAnccrIZg86RKxSw2oL94D9g9sfRL8GCfN2y8BVnQfOdreeKSx3vQotMB1
         FOd6XuE5seCUAM1Ora7vuqifMbVE3T3r4RkECJ4lMfc5X6EJyLV0yeelP1vgCaXa5d39
         LlnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYtaQXwtwrd9z/XTG4T1SiSJyJ7iSlEzqiV4N47xtJLywri8cU7JEk9g0CUmCZw9DolvIV55c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpXmrWBqoz9FSZBDlW16/YTenxIT33uLF+Ubg7nCqOaIur9+0t
	+ZySgG2zSrifZSpbbOSu7okWfdIJXEzVcK2DBHi165ZkbbMz7HKh
X-Gm-Gg: ASbGncujkLWEamCFUJEWah36YISdtCD3RluYoKe68hJdTqKWwD+nbN1pCFbJ8/Ez3XG
	ayh1GkMfMbNGJHpoM/+tDubD5xzS99NzKPLDnqufo63KblkDaBrlgr3kL4xLOmli4lrIPpqY6Uv
	ftd9BgxnFnp0avJn5eWDMjOTnozHo5edpQO0WTA/HCj+wF/LGVTnFSMcGr5U44QMKhhiyxeT1L2
	WU0L1GlS66Y/xD1u+OlIJHFYK+drdJMU2UhaGjtI1PpMflQpxxhfVrUI314Wb3wCp9HQUa4iwJS
	osHDrvVXfi76P8d2UrNC0ihSnWAuTdG/rlhve5o=
X-Google-Smtp-Source: AGHT+IGr55HKPhNfScKm1lRs9LWFrAQAez2uJvzKffhcY65WHUgtIevtYlWDNcERpJS4FEIFQDm5ZQ==
X-Received: by 2002:a17:902:e844:b0:220:c2a8:6fbc with SMTP id d9443c01a7336-2236924e46amr249478745ad.34.1741077393052;
        Tue, 04 Mar 2025 00:36:33 -0800 (PST)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504dc3b7sm90597735ad.173.2025.03.04.00.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:36:32 -0800 (PST)
From: Longbin Li <looong.bin@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH v2 1/2] dt-bindings: spi: add SG2044 SPI NOR controller driver
Date: Tue,  4 Mar 2025 16:35:42 +0800
Message-ID: <20250304083548.10101-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304083548.10101-1-looong.bin@gmail.com>
References: <20250304083548.10101-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SPI NOR driver for SG2044, including read, write operations.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 .../bindings/spi/spi-sg2044-nor.yaml          | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml

diff --git a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
new file mode 100644
index 000000000000..948ff7a09643
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/spi-sg2044-nor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SG2044 SPI NOR controller
+
+maintainers:
+  - Longbin Li <looong.bin@gmail.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: sophgo,sg2044-spifmc-nor
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi@1000000 {
+      compatible = "sophgo,sg2044-spifmc-nor";
+      reg = <0x1000000 0x4000000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      clocks = <&clk 0>;
+      interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
+      resets = <&rst 0>;
+    };
--
2.48.1
