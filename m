Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505375;
	b=WNZxUrCildG99WEpfoodAsFqx7i2VrvMS4PpeXaBbrtWNKitHdEw9Tk5gFZA8AZ4z+/T
	 YTgQayo7ZHdrXZQf0XznXXagEnIZc8EE1F8FLRkYaCEaJC1kgzEq5QtnsJ8zLkPOCe6Ut
	 2IZRS/EcW/8UJhZ7DAndiwrVld/uvTh2klV5TDTYzmqDQlrk51/DqZwj5OrURizsJBuXv
	 Mn//cVdS5H3Ecu258LL8jF0T09uau9Enth+E5Y0X6qATomLI9kZUiRh3TPCeKzXa3KH5c
	 HnwI5G3RBqu71Eql7vhgAUSq/w1f+xUDfaKHrN2xE7U7CRUL30636SUv4Cbxrb7U2cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+ZuDPiNOEfTjl2w559867HRmVev7pbLSM2ATwOtUNZA=;
	b=swqQ13eDW8/QYByuQ5Ylp5ITriaZMMljdQkVj47gm86gpohvXAj0NOu+HnVZOU2IoOgH
	 G9ZmOZqPO3Txmm8eIZAYCgsv/247RLm3s/fElKYHnsB4W35HBOBnU1Z1roupdmGqk5NfX
	 +4yWWay5ZRJtsL5Xjrs/WVW+k1RoaKhipUf16mZcs9xNvGg9XOYlwbm+RQGL5d/nS7McP
	 rzZnG6URxy8o7BLCLMTbZa1wJm8J6wJbp8D4R6LM1C/vGVHVxM/qqz9iO64vWS8jZcn3u
	 TXCR+OlAJLzopOuzdd2mFvU3/EYg1zEb6eyb0xKCB0+x37c901w+LRENjQnfgySwTow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TzQjKGd7;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18516606A32D
	for <sophgo@lists.linux.dev>; Tue, 24 Nov 2026 07:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18516606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TzQjKGd7
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cde4b4e936fso2310833a12.1
        for <sophgo@lists.linux.dev>; Mon, 23 Nov 2026 23:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505374; x=1796110174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZuDPiNOEfTjl2w559867HRmVev7pbLSM2ATwOtUNZA=;
        b=TzQjKGd7qLgudIAlp1oxWn591WjXcLit1wkD45FHHtfypoT0ElHTX+hK6WNLWWximz
         iZWPjxBKnm6D8I5UxQ+B5hjIp4AUkJmpJ4LHmor3xAPCynnZUN/64ywIzAtznA5zAEN/
         6dVxjieArlhE+7dnvrcNfGyOhqI9GCHLoVkIKnYM4VMSJc+1B11RaiC2oUWum8/yKSoL
         4YP6hssa/3cCa+gBA6krqPwfULKJW14YT6jY/ptSmJgy84ByRaLcozS3mKBCXWIaNTit
         8cOppTKkh1zQX17qXUWncmvv0ZO6Ae4Sxx3ZUInMe9H7lVWdTMXIfq/HFhez8vgpkaYQ
         8VjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505374; x=1796110174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZuDPiNOEfTjl2w559867HRmVev7pbLSM2ATwOtUNZA=;
        b=M+TymJBs8YbMg4TIULg8FwshiKEIECIVp0GvZIXnVVIiwdk0y5zFvlvCPPmrKijRIo
         F0eoe9BhU1ooUtuB+Y3VUQ6DF/rWvOb8Y7wFov5Lclo8nkV2CygkRqlVxmi98F0Pvzt/
         nEEgby1R2FHLoSlJF+JBIOTJULZK/89aQCmg7pHswR2N5rTfeH8iy6qdSHqQdjTK1Qq1
         g1capdd9Wb7U7AMzI/qYzvd1+FGhQGAKeNHDJr5jMfDu7XoG8QIxT53XV/QEDsv73Lzk
         1RoiJ2yeKlxqFVfeQbppTwS4mIQsjZ2TPCkZu2F8KQGAldzUyitIG0SbKLn6W/Y6Nj9Y
         WDvA==
X-Forwarded-Encrypted: i=1; AL+hErFP4EVtnfqREp+d9rcyo9XUbs/QqvAXN4pZUuJJ+J7aCBgu6EHZIU3y/7sj/L4RZfNoMX44D4A=@lists.linux.dev
X-Gm-Message-State: APuU4Z+5B9koz57UayY7yvzkLiel/YCoeRfqHXTUFse5UNPna5dL+eko
	0qIVtrG35V+Pc5sCsIa8BaVg2BSX3oiO8X+V+bY1gh6yvLdmkByfehUs
X-Gm-Gg: AZFdTZfZRG7euCHx7KIQPv+JLTASELU0T3IVktZpqjGiUGNz1Z+V3/iTEYOvg0UJFXO
	braGaa3bEC8l/CaSEJ/67YJC99Zrhb+ApBHFXhMHcJa0MnA1f3LOUPmjBwPZJLx6TjbSz1tXB6w
	QX3RgvokkSQ0QFeFEA5rcTLkOkLA2zBi5Rk6hYc7wprw6XdEX1XISq9phxknFh3edhzrVSnhwIV
	jASLtMiYHZ+zFmhzN8DjDLkfrn3oJBr83dG/rPuNvIgCbj9ylDqW4if4FpjGX68bXg8fLh5R47W
	km+nqv2Qwqgjl2GRpH9Y77/52vqC/LBmaPyjMCPYI19wqXDtmZIIgNaDLfDS6Dk9T9CihQ94a8e
	hZEhY0Ixk89/Eg7SkcPV8Rsh/b56Wm2ne+FYlqVegE27etOZTdUg1BzDS3ZxwPFAP6RHTwLPQvM
	Nh8lThTaMqSPdQxkF1a5q+dTMqmMf6BKqBLfjdIHuhEIgmEfEVtofFV5zwha3Ssx48byruitLjK
	aE2+48eKtI0/FGq8YJncRWkuEzk98Dwr1vpdDA7NPnXqn/aNcYceldcuoh6zMNaHIGbYELLjzLU
	GLQEaLZSkrNFNC2upeBfPe8HFrg=
X-Received: by 2002:a17:90b:3f8e:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3b41c7bc85emr8885243a91.5.1795505374392;
        Mon, 23 Nov 2026 23:29:34 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm8759683a91.0.2026.11.23.23.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:29:34 -0800 (PST)
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
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>,
	Hangfan Li <lihangfan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: nvmem: Add SG2044 eFuse controller
Date: Tue, 24 Nov 2026 15:29:21 +0800
Message-ID: <20261124072924.556678-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124072924.556678-1-inochiama@gmail.com>
References: <20261124072924.556678-1-inochiama@gmail.com>
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo SG2044 uses eFuses used to store factory-programmed data
such as ROM patch, public keys and other factory information.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/nvmem/sophgo,sg2044-efuse.yaml   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml b/Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml
new file mode 100644
index 000000000000..c87e028dc557
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/sophgo,sg2044-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2044 SoC eFuse-based NVMEM
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
+    items:
+      - description: Core clock
+      - description: APB clock
+
+  clock-names:
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
2.56.1

