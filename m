Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1968015DBBA
	for <sophgo@lists.linux.dev>; Thu, 13 Feb 2025 02:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739412564; cv=none; b=IfuuvE6aj56v/1IZhTjStnSz8D3Nqho6r3qqbJ/V2l7IbyQNOQt3C+6gCsLdYnmRdX54yJE7V81y8s2lN3jpLZpEHK5QH6xtJDIFpa2RmiwpD0/vcMXCfHDNYeCkNNHiPd92VJCbDQkm4heV4Fxcfbp+zfxLqW/iA1BgyKLccfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739412564; c=relaxed/simple;
	bh=qIy1cDnQXvi+9+0BBCLDI5rv7uu/H5O44c+G8u1SoVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qbkGhGbWGCSe3IdNsQFmK4/4/lv4egLDTA4Uc50FVIoiZWZLDI9j4tqpR7sxa3xMt4LTD56Q/cfvjRiO7IXlgyQVGbublSnZoC64DUqTGfHTTYi5We5zcowGjKU7kPpXfUj5qhvgWmAJQI4/u+/iCgetRaCwnXIYF8RUQGws2Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxuHJ+95; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxuHJ+95"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7be8f28172dso22756785a.3
        for <sophgo@lists.linux.dev>; Wed, 12 Feb 2025 18:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739412562; x=1740017362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXFO5ZwHUw8wT3cUYBSdFuMkicgvLRpCU0vV1fZ6GT4=;
        b=hxuHJ+958++ra1qZcmhGyQ4ur0F6R51IXlHk9pfAT8PrbC1Eb+2B8embSHbdeca9/N
         D+4e6OvaU5QthS8OxRYbJYB1DW+u+WRpzYULZ3QsiJPztvQq/WUzCIZIr0YCAmCTZ6Cc
         HWGb5FKcMmXgkSkK/+r/It7pEvaLAhbbwHthyUOPsZDlOBKNphOAi3kC8/QDAxyBub3a
         HMGuagFEt0OPstK90JNL39Z+kXHatPp2eRu+qrnJ4nb/3mGtXX2ByiC62m9Dinq16vbB
         I3c77onLZsTICwBxrk5bobeewbjC0UaLCnnXASYG2Uy02c+gtH0eW0wvkl7tKmVAu6F1
         2nEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739412562; x=1740017362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXFO5ZwHUw8wT3cUYBSdFuMkicgvLRpCU0vV1fZ6GT4=;
        b=l194ykOU8eAcT/zryEhPwKKpIJLqvoBQatcg9ZYPBW1VHANiyqeypVvCwef1Ld8T2C
         fqMFas1HfrlA+sb9/DW8kaEUtRbkOVBCEUARpVStx2pYr4x2lujonWNoVbyy2qtYG73O
         WND3X8LbvQTn3Je6r2dUUPbsh9cFto2eU1svCZ2Kapx1FzK/tr0lanihnA4jLM5NDpqn
         TySay+eP/WIVRYXCZaPyigW0DT51pQKgXyvkRd97lyT93Tm4Fidg8ZJ/lwX496ZCIgV1
         CDk++KrgzrFMbq/F8xYw32DMv35W2ahz/4CwbCUVPuPMJHg7SqH6/idW+fnRbseaYzVR
         mdRA==
X-Forwarded-Encrypted: i=1; AJvYcCXwcfbtakd4flIT4UVJCkmpqLeUb176fm2t2Yx28t9uFPa1hRjZZSawmmJkIbEuT+k3wyXbERM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOmizREP9+HedCK5OIWZ0R+qfJusDmdLRKgWDQD4raQDTPMYiX
	a36ebwEcZ9+rEoJO3JPPg/TjJ5HSXlasQYLf+d1wx03ZUMxhwTaL
X-Gm-Gg: ASbGncvs+xGUKu61ssREf8Jb8P6ykDqfowxphY595vwyq9wOJi7lgDF0UZEoAZ9nNZw
	g8PnsqiX957iiAyTBOSvhGDY3vNzy9QLSKfp0KXZRMqpfwgGzG+Fi9/duahpQwoc+n2rEeVOGRW
	fxsEM5prgCdhvX4P5kDyh805/Y01FpkWQ59BlVIYoH+s1Vsni+ucWx85WnXogrik3Eh9tNmCnfO
	dpyZmGCWgCrA8lXzL7tjO6C+nQJ1Js6PyJbmG4iAlaJt7c3j57vuRaaH9xMjdRLmLM=
X-Google-Smtp-Source: AGHT+IGffmi8fZ+IosqTR1SjXnCtscNOZQQHfesnJihozSoHKlGaGPOVdWX9TagyMdQaTU4+9bkRdQ==
X-Received: by 2002:a05:6214:4013:b0:6d8:850a:4d77 with SMTP id 6a1803df08f44-6e46ed77f20mr108840476d6.7.1739412561911;
        Wed, 12 Feb 2025 18:09:21 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65dcece5esm2389976d6.115.2025.02.12.18.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 18:09:21 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/4] dt-bindings: reset: simple: migrate sophgo sg2042 reset controller
Date: Thu, 13 Feb 2025 10:08:56 +0800
Message-ID: <20250213020900.745551-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213020900.745551-1-inochiama@gmail.com>
References: <20250213020900.745551-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Migrate SG2042 reset controller to reuse the simple device binding.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/reset/reset-simple.yaml          | 10 ++++--
 .../bindings/reset/sophgo,sg2042-reset.yaml   | 35 -------------------
 2 files changed, 7 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/reset-simple.yaml b/Documentation/devicetree/bindings/reset/reset-simple.yaml
index 77584e23e8e8..1c86b67ae190 100644
--- a/Documentation/devicetree/bindings/reset/reset-simple.yaml
+++ b/Documentation/devicetree/bindings/reset/reset-simple.yaml
@@ -16,9 +16,13 @@ description:
 
 properties:
   compatible:
-    enum:
-      - reset-simple-high
-      - reset-simple-low
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,sg2042-reset
+          - const: reset-simple-low
+      - const: reset-simple-high
+      - const: reset-simple-low
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
deleted file mode 100644
index 76e1931f0908..000000000000
--- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
+++ /dev/null
@@ -1,35 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/reset/sophgo,sg2042-reset.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Sophgo SG2042 SoC Reset Controller
-
-maintainers:
-  - Chen Wang <unicorn_wang@outlook.com>
-
-properties:
-  compatible:
-    const: sophgo,sg2042-reset
-
-  reg:
-    maxItems: 1
-
-  "#reset-cells":
-    const: 1
-
-required:
-  - compatible
-  - reg
-  - "#reset-cells"
-
-additionalProperties: false
-
-examples:
-  - |
-    rstgen: reset-controller@c00 {
-        compatible = "sophgo,sg2042-reset";
-        reg = <0xc00 0xc>;
-        #reset-cells = <1>;
-    };
-- 
2.48.1

