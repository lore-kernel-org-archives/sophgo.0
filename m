Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C946B2367DA
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629971; cv=none; b=QhoNEtD0xtCj+xVS11SOhz29YBYVcMCduNibcFZCLhNz6MKSt0HtmYsHG2VMsPYfYfSf4l2Ms9NBtnKj7TuTzkjjsNXmC2M/hHm6p/0j6sgnv9DI6TO055TVoIHjOSByBqJNlVEw+kZfw6Rlzxt5JOKb2UWmemoxWm2kjJRuUjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629971; c=relaxed/simple;
	bh=/Pz+BCMnqum9DQrrlTbtUCM1X78hr/mJFmbdv3ay6cI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nv+9PFR07pFb0mbnBVPn+5oZEJuY7C7pBvVxD2uuowH14o0rWrJTYPQgImciB1m1gYEJZJU4EpHWHiQ1JXPjyXKPdUsto1kMe5PVYB7ZRWMcj5I3ugWTHBFSEem7B/TnJx3ETY3Z40Cx77z6hwj9E0WA2ATW99aiZYRJkNVjTE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOzrTCJ4; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOzrTCJ4"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7caeeef95d4so622795485a.2
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 01:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629969; x=1750234769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTihKaJdX7lICF61Unmn/1qC+7hZZfgUEsDAi37Fi1o=;
        b=DOzrTCJ47BmtKawlJcqIriORWoWyR1Z4pgmEcHFxrobg/68VW3wU9HJ90Znmk0hv51
         hzc0LTf4Eid0ZuRNSVSt9jbUHgZ4fyPx9orQASl9M291JOx9Ep8/+fewb9zoWhk92SC/
         4fFwY0a21diR7mUBNSnfF3Yz0myImWaJq7By/nY50Q2XRGLEk5TaHL6eK2LeoqpHKGm7
         BcfqyqUQfa7qLOhkU8bPRbh5Vf+NtDuPp8fwUgYxvCMIRyu0nHduyYwO9m6PpTP70q8U
         E3dLp3Oj3igDFiJzZj3rn1q21DGBvl3Bcrfn5Y7D2mQuoZwNJtxARdOMi6WwdPq2DRIq
         FOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629969; x=1750234769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTihKaJdX7lICF61Unmn/1qC+7hZZfgUEsDAi37Fi1o=;
        b=NdtHaDfjyxQvmgk7bDxsFzKJIXwAhuonUdU0dgIFa5KqJkO8iBUDOpjIihrP1FcSKt
         2IcmmfXwEKia2CAJADMzuDio+f/7dfhEZkx/KHqYw2Kc8dFx4f9DJLXZyLeEWLbUp0SS
         mPHROq1/DGLRu7iMsdoi/O9mwxDPw1/HQ/+0tnZWsK9LUgGM7uDAWN4vkEVyE6OBRUjc
         kUdL1ikc+vOlk8Cxw+Quup0uj7bTcz2l4ihCoO4GvUMW7hnRuM7qJLiSCSdQIkCD5FYK
         8TRKKyxTw95HHKfpRV1OC1ekOu3UnwiulXAgkKxliTmtP2uesbPbzE63qbv2KyjS9hOI
         va0w==
X-Forwarded-Encrypted: i=1; AJvYcCV8o7vloB82a+j0fbXLGirF8RcD6guMfWw8KjT3RAqVBWY89bdq6WVaq69RMogXHVvcbeJ/yq4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxffzDJscX0MpuzdW7KVDOdb+BgRkk5PXY909GXoDzp8GhyRMui
	v0iv6Tkcr6hAfhwgmNBYWZJEmF7U6m3NDQBJ98zr34I3ulPa3xsOkWFg1dBQ06Gu
X-Gm-Gg: ASbGnct5nFCHs5hBZmbj9BaQgU17RE8lRVRDTzkwesrkccAXO9kG69QOfmjsL6fs3cW
	XdxRtKYmPKnZb4HMkIngV9h0l/OM7Jil+QUHXoNKeeBFLgFdn2kWmnH4rKbob8RXyi7xYZlUn86
	wf7jRC4xRvWlF0mwac2T7CSCpQUF2lPfIXCHC0AUM+8aI8kjgVjMdNRB4dks0iK2LiGLYNBCgfG
	Ilti+oZ/TUUV2eN8SrTfDYoh6eHdqc7W3fK/U3nzV/t7xAHEUPV+gzuQxjv+rMpJzJuqrG7GqGV
	eQXUD+g7bVL4ggLYFvpBxwMsra6FdOFcbcaL30STLD6bPx1C
X-Google-Smtp-Source: AGHT+IE2k0Y0Y3XpkqJoreGwvkWiu0A5c1I9LUjGwUIsU+Yx8pfb5KDzmXaWEDQQc73dwOMzOri2PA==
X-Received: by 2002:a05:620a:298c:b0:7ce:e010:88b9 with SMTP id af79cd13be357-7d3a8820ef4mr372285385a.13.1749629968697;
        Wed, 11 Jun 2025 01:19:28 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ac84cbsm79224076d6.32.2025.06.11.01.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:19:28 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Date: Wed, 11 Jun 2025 16:18:02 +0800
Message-ID: <20250611081804.1196397-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611081804.1196397-1-inochiama@gmail.com>
References: <20250611081804.1196397-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
"VBUS_DET" to get the right operation mode. If this pin is not
connected, it only supports setting the mode manually.

Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
new file mode 100644
index 000000000000..2ff8f85d0282
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV18XX/SG200X USB 2.0 PHY
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-usb2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: PHY app clock
+      - description: PHY stb clock
+      - description: PHY lpm clock
+
+  clock-names:
+    items:
+      - const: app
+      - const: stb
+      - const: lpm
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#phy-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@48 {
+      compatible = "sophgo,cv1800b-usb2-phy";
+      reg = <0x48 0x4>;
+      #phy-cells = <0>;
+      clocks = <&clk 93>, <&clk 94>, <&clk 95>;
+      clock-names = "app", "stb", "lpm";
+      resets = <&rst 58>;
+    };
-- 
2.49.0

