Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E012926E95E
	for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 23:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740613394; cv=none; b=MpS88bixesPEDoeLBgXv+cYz4ziSDKPPaJWDg2sGnEfkNP4Jqfl+OFJUMLub06ECDklyM4vIkNnZOfbIBUcMgyGihOrKX7fbRKaDTB2wPPJscC/RrRZMZUiO9Y1FHsTG+GL5Pepi4hsKTWJF0GYRJssPWPS4jlXTiTMf9lzQI/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740613394; c=relaxed/simple;
	bh=5nbeFijLVWrUw6n6eqsPUa2kdXZ1lvYEM/TXnSUP7jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQCIt3sTivvM8mbKnuPhnPteEy3yGIAwPomku16q158a0/RUQPySIyrX9hXVrEU1mT/flPfnO4lE4MLWTbOaw8pWIZLCi9Uu7QavdbgccJpoZ0t5xsDnBngnC25vtIZBnU4DvWA4Gp17/tvwy40+fsUf/j8iJlglbiwZVxk7deI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNQqUWkp; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNQqUWkp"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4720cfc35e9so5334081cf.2
        for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 15:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740613392; x=1741218192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3n4HDnuj7FUu1RXcHOZBNiyA5B87LpLpCZ3UB1bnbY=;
        b=HNQqUWkpJNvcwJ5LrTeC6cTfxNvsdchH8bC5fT9iBH+Qp7VUtm592HYw2GVlcsU0/O
         mdXj4q9qnTPkIzWHSEpPQXNZFsnMvMjUBvsdc3MHQA6u7EtB91lijaUgmAj8wY3SlUzk
         Ssj1ZQiM77ARQA9AFTGzbZmjaHlOslcq1OG/f2/3U4jJAus0Offgg/LlVeJsdXzuCLa9
         vgitMM75/VlCmCF2ZbMwxhgjiaY8/WFk48eOPRDoRwKJ0tuiSa6lGa1ODevh6lChvnhO
         jFDPHp37ch1Cp4uALnv7u8i3HHlhyxB5Hbs/KnnrWtfMmi91wqavm+lNQtDN1heos7Gl
         yi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740613392; x=1741218192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3n4HDnuj7FUu1RXcHOZBNiyA5B87LpLpCZ3UB1bnbY=;
        b=voW6N8NbwQKJ35n6RDxBWgSo2k5Y6XFjOi4Mqt3PK0ZoYXxOWocM/oiZp64kPwZBW+
         pwgUvugka09rtiQHUR9CL9OfngewNcsJy9H80YNDsQbXZxqxOrtT+F8N29A0hdIygKje
         NDcvXkfwqX0NKAEBNeyMdNqTg0vWyNt7vLbZEEE/T+oiIvaPvoweNzem2eXRswQPG7p4
         /tIOUfOUoW1Zxil08R93sSB2RTLb1Gbrs2nJQIT1oSIoz9wjZNKwyvCLsghB52Dz2MSA
         5bf0AiIoDf3sYLQ/w6lFOGpziF/lxz0GfYxbsVQ8WogZjglo8F32AwHPJbqORKIfVwLF
         23iw==
X-Forwarded-Encrypted: i=1; AJvYcCUUC5sICRZ/uj+sCkBuEgGTw/Xrf+YLyO3sZ9s+zCJ7mrzDEgUrmnvgtjid3IX94zFvkIvzS5U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwI95ATJZqvncgumx35fqGhHMQUqfCzLfJ7fIdLSguc6/ebn0WS
	6E+ETW2rGxMF6mN8OmEDBNOQQ0GdWs2bAmc5wSbwwCJc8/RF+L+9
X-Gm-Gg: ASbGncs/lMXRUXrfpvE5q0THn9P0oH4yHQuWD1VqOuOCuhntWlDpLd1wHnso2GgmTnP
	VQ3j3H9Wlpk7zjdAc51j+Sg5fpq4VcJcGgy7oh0v/3/qMbWpe1eatLYjqqyBThDzuw/fFl80H48
	5Q/thWMT3uRokiCN06qPzridV5z/LuU3I6vJ7S5zRvrY2TokSdo8LJAqUJtjGz75MrIWJS2TO5B
	gu/DYFwABMRtODiFbaD8iMDt1tIQJ+t+UBvYgVTfVOEUGg1TpQDxQr1QmswaEEF1jAT3atm2t5H
	VQ==
X-Google-Smtp-Source: AGHT+IFeqficLsjiBxpez3bq2ZeY469OujQH1LvDOLIZDbUA8CBYXJPaq31DTHUVw5/VEbpfwo/VkQ==
X-Received: by 2002:ac8:7d55:0:b0:472:182d:8b4e with SMTP id d75a77b69052e-47377118710mr156337051cf.1.1740613391750;
        Wed, 26 Feb 2025 15:43:11 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-474691a1f78sm2822421cf.14.2025.02.26.15.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:43:11 -0800 (PST)
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Guo Ren <guoren@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 4/5] dt-bindings: reset: simple: migrate sophgo sg2042 reset controller
Date: Thu, 27 Feb 2025 07:42:32 +0800
Message-ID: <20250226234234.125305-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226234234.125305-1-inochiama@gmail.com>
References: <20250226234234.125305-1-inochiama@gmail.com>
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
 .../bindings/reset/reset-simple.yaml          |  7 +++-
 .../bindings/reset/sophgo,sg2042-reset.yaml   | 35 -------------------
 2 files changed, 6 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/reset-simple.yaml b/Documentation/devicetree/bindings/reset/reset-simple.yaml
index 86c33a608148..644884206ee4 100644
--- a/Documentation/devicetree/bindings/reset/reset-simple.yaml
+++ b/Documentation/devicetree/bindings/reset/reset-simple.yaml
@@ -30,7 +30,12 @@ description: |
 
 properties:
   compatible:
-    const: reset-simple
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,sg2042-reset
+          - const: reset-simple
+      - const: reset-simple
 
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

