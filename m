Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB3D24A047
	for <sophgo@lists.linux.dev>; Mon, 24 Feb 2025 10:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391979; cv=none; b=gTf9e5Tyju1tuaHCIuaLTM8u3pDdpvLXezNG17gGRBtr9wpWq1nZqC3QDwO88+KkHARS5R6TRIGkz/+TA9D+PIKxyF+VXpdloiXMPi7S1oqrjf3Piq5hXfpe4PC2r4lC5lqmsWE4Remcpdl1qVQ1a3XgA3hUen6NXWMy1yZHQPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391979; c=relaxed/simple;
	bh=KGeJRad60cuqCHJZvLMv/sE5CXRM5iHWHfq4M41kVqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JEJDeSzaVuyOLWEkEAXHpvPLOfxDQhdpqvTg04e33e2jQutHs7hZXG1Fqze/CaqndHtLL5LRB1SG+WJrOHQuuOabgY0UYeibScqeyj0rtY51pcqRvqiMEOdCy9VfKJsllG6ZMRfh0cCG5weg74KKX3+D2SGef5QGjNibgLPJ7sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edMHjhrQ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edMHjhrQ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2211cd4463cso79435935ad.2
        for <sophgo@lists.linux.dev>; Mon, 24 Feb 2025 02:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740391977; x=1740996777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfgdDU3dHCgHvLuyG46NLXGA1z+1QvVU4idXkiLTeYg=;
        b=edMHjhrQCg3sFwSWX1Z7r9/WHX+SZ3pHJbazlnLn3pvIhweGzHVQB+1CxymuiRgH/+
         BfWRyCn11hElFF0fp7DRvBmWUAs82MRs6/fYhtTZ4E//JMUVyK01o5OGu94XElxS8z+A
         dEtrh9rXt9KlKbQzxeIg6zhoTgyRVbBL6a3ZXs7o5a+hTPkhgeZZfFW9vc8BLN8eCMpL
         K+SCCMxLvvAViZ29FXBLmdmr8Pde1CmKEx4Yagkg3ktOR0kq0YVmb8xF8PpK0ndFiuQs
         Jw+NAaztwduPp+fMNDLqEkvsDGb8sCotimIJ2KYQdoeR3hLyYCLir4lWPhfeycfxnTf6
         zlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740391977; x=1740996777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfgdDU3dHCgHvLuyG46NLXGA1z+1QvVU4idXkiLTeYg=;
        b=j26x5Nhk8UEECGi/vLD8TMPhK2vYCUT/yr4jmxDIj/roYnsZt4iGTVSFNixUZnNk7Q
         NAeiJcdzNSEXVD+evPsg7tAyLkJtDCrCkLcHQwpA31/0n8mId28IBAkzKze9dpQDhBJP
         B3x9w9AhUChF+LDe5sTfpmmhM2rTU/Mjiihpx0qynFU+H+YfzFo2kT9hVw03hIEGCgey
         CH+25s/UuS4XoqQ5ZHrogWYefyuvcq6vPaJ4Z3XG7ItJenyrLU83FJFjLWgotnkT4hVE
         /vlPg/wF2x4nTk8wPGeqcw6Wtlrph6BJq8y/lWhxJABncRrr6Vkmda/4x/KQQH3Nta3V
         7rmA==
X-Forwarded-Encrypted: i=1; AJvYcCUuQZT53aeRfil01o8HnNw914ahY6I8EMUA8yxBbVgrabGGUit+QKLemfth+Yrwfw98hcnShys=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMZP6xuN+/j4qo3yvrUSFwt76sRt6YwZVmFuhBY/r1bY47YHw/
	Lv6F8sTZzZTtbe/CUZslg2eH1RDyjA30TBDLXR5Xs09ZCiHaz+B0
X-Gm-Gg: ASbGncuvEk6TI6dKHZFb7y7dM+TU+OfGZN2h69x6BMG5HzQnnJt9X7bDNejl66s3RhL
	1qBxfmqr93JAlV3sAicqzha7wgI5NZC71iQVnmAsz532HSPMXUf7z73F2r5/tLyeJtR229lR58c
	aM0A4Yj6UdywO0u0k6/nOMcdntRUIVrkJw2KceC5F4TmkdZ6R05GLCZARiJ895AowxXkU/mNMbK
	zb4v/PzWEOfoVKluQgsYfBYlrnuOjkh0/nNwuqXZf+YZS7DQ6KcGA9v++gDWI2tYRNn+cHmQPfr
	JgM6aPnTSJZRiPqWONFa
X-Google-Smtp-Source: AGHT+IF04L64yddkAFq03o8LvF25Xq5MWdPj2nGFRbtcPd0hUWOcQ6Di7Lct9JFSZGV4Unfn5iL97Q==
X-Received: by 2002:a17:902:fc4e:b0:21f:7964:e989 with SMTP id d9443c01a7336-2219fffb650mr207806035ad.52.1740391977163;
        Mon, 24 Feb 2025 02:12:57 -0800 (PST)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d7a464f1sm173274365ad.206.2025.02.24.02.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 02:12:56 -0800 (PST)
From: Longbin Li <looong.bin@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: spi: add Sophgo SPI NOR controller driver
Date: Mon, 24 Feb 2025 18:12:00 +0800
Message-ID: <20250224101213.26003-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224101213.26003-1-looong.bin@gmail.com>
References: <20250224101213.26003-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SPI NOR driver for Sophgo, including read, write operations.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 .../bindings/spi/spi-sophgo-nor.yaml          | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-sophgo-nor.yaml

diff --git a/Documentation/devicetree/bindings/spi/spi-sophgo-nor.yaml b/Documentation/devicetree/bindings/spi/spi-sophgo-nor.yaml
new file mode 100644
index 000000000000..0b54946c649f
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-sophgo-nor.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/spi-sophgo-nor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SPI NOR controller
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
