Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60342EC09D
	for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 19:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768504689; cv=none; b=WmGLluNsHxEAnEz5e7b/b6Y3NmP60YZH9DkVkflGVp23YzD276dDOoFxZurptZiqalKNUFq75gWskAD5hN4ThO3NIBNAfq5KwA12sI3aufSvAC9QO9rfJoANuczd9D/IpVQZv/CWJ7NQDNAX8SeQZeJSjczSP2m+Qyl/f24JvDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768504689; c=relaxed/simple;
	bh=aL79ku9woK+lFHsaZx7h1/Un3D0nb/Y6kULQfvJwXrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sD5+Qp/mG8MG0tKGAaaFHB6VJAh9dQTAs45RedDF8tw7oDoYu3YoZ4xc6iOmb6RKr0XcyfnCXvJJxVdWAjkDW774Qb0WrZZAgu1SSTeyuWmaorEkInrhIjq0bG1GialI8Wav0id/YQUIFUtLiJeJR/1vtkt+4B5Sm4cqGQyGC8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mr6jUiYz; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mr6jUiYz"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so663664f8f.3
        for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 11:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504684; x=1769109484; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcLpMVd1uoMRkrBJra0Sqn/oCunudMeXpwg5cYzBxgE=;
        b=Mr6jUiYzhxBL0DYXJz6fm2msak1PZnDo8B7rPUGE3T7gE4X+LVWh2zeEwYvHzgkOdQ
         IhKbKQTI5h9RBLlq1+RoyQE3YqZ9+NWI2xo4ltutikIIO7/YGkOm/Yb7QaLz3TgB8sl/
         8O+t4Dxw8Emdq4iDYQSbBZhu/gaDmsKk/9U1fXz59tQbfg/j2LLcllpCtslOqI651B7O
         H4qaJzjbsREVhWWztcbfTLxHY+faeWWfqbdoXwULPV7rXX6YrdxxRumdIXw/8XCn9zZS
         Ii6kc20nzWgziApU7DVdd3GVvl1M1ciAi5IpFZwlCdzEU5BYWEqubc+1yRUYn5YDurQX
         EqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504684; x=1769109484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DcLpMVd1uoMRkrBJra0Sqn/oCunudMeXpwg5cYzBxgE=;
        b=CoYJUV/rjhssr14IuqWMdpZbOhJxkqoEkP5dXYoKxc4XsjdW0msVvPHHxo9zYGkaaw
         eR/ucu5jiQeqPPQEj9uc/8ob3ouAsCTKdZb3l0C37+ivBAi8h9IB+NsCxg8WQO7/xSVY
         /eNZWCBKwHXLz8cE8Vsmxp1DrNAOXyCTM8kTKA78siuJLvai+4AIpw9ftQGfBHjalnkM
         dnS5/nHwrtWnq4fu6lyNomcZAKFtP3NqssaR2LQRA3K0mr2w6PSo1IhGGx+DeJ01GKxI
         ncpxF9YhZIyqthQtYrhVeIK7571w1W43AeTFhbVkELYAhdOf9Ath8ACGIF43ICAbxPOv
         4HZw==
X-Forwarded-Encrypted: i=1; AJvYcCXHNfMFDCDeTyZApUsVyULbrDDaFAXjqebvF5SDP+1GOnsNtSpRbcP7sQjLNXARqVi5k2M5jks=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGkF1ys4Pf3kjndf5pBRAmF0oNwwi2nnH4LJ5/Ku6+MeSxiq5+
	n60zJS86ERvPJJAzQ+wd+NiIl7IAT/A73DMdaiRzu8oPV+CtH2h+ypG9
X-Gm-Gg: AY/fxX5/sexfc5+guV2wD3tXjqFXWm6F+/Kxa8G3gMyGHDpGoWa7VAKR0t0To/uUFkh
	UYxXOh4CJwK7fZk3O20wJi7BZAftqus6Xr6wtKt1vI+ckrPNgElR2AmOPuik7tJQDkpCw1Dm4kB
	+mJ2MBm42x2biD0EgaRjCBuCsjCayQ/z908fj074QuWVDxIoBi/NTniq1dCOxSm5l80NEa+GGI9
	AIio/DA4aA/93jmLItnZET1WGLqYp0qsCxtR19A/R++NiUEgUdARsyMJxKTh/Im2GKTClMykaoV
	o3o+dEpmRMuQ6m+U3asjyURK+AFTdxhvoV6IXOzb2OS6yAMXW8WKpyLlPmIHU+y8ck7zwj0ROad
	sFzm8RLzGcB2GMCvwyVgU/BtM82dLtAbU/j3X52/ZGZeXqAfxLETD/ibSXex26WB3xejzPENxud
	gLRxwMtmcCqSUyYdQnhiE90eWFUuCQsYnI8uYH8+/2/UAM
X-Received: by 2002:a05:6000:2c01:b0:42b:2fb5:73c9 with SMTP id ffacd0b85a97d-4356a0662efmr421160f8f.58.1768504683920;
        Thu, 15 Jan 2026 11:18:03 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm692734f8f.9.2026.01.15.11.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:18:03 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Thu, 15 Jan 2026 23:17:38 +0400
Subject: [PATCH 1/8] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-cv1800b-i2s-driver-v1-1-e8b22b8578ab@gmail.com>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768504677; l=2155;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=aL79ku9woK+lFHsaZx7h1/Un3D0nb/Y6kULQfvJwXrM=;
 b=4AI//Dc4zB0LAW6t0lpzfgX5E/8bFJpEz7eva9PnikVe7DJg6MMIcs3jHP05P9nsmAecK/IYd
 loHA2q9vDIbDxJcS0fEHU3K9RMuF17S/aYb71J7Go359nwtOe2HnXK6
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Purpose: introduce DT schema for the CPU driver

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-i2s.yaml         | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
new file mode 100644
index 000000000000..cf30880a62da
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B I2S/TDM controller
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description: |
+  I2S/TDM controller found in CV1800B / Sophgo SG2002/SG2000 SoCs.
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-i2s
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: i2s
+      - const: mclk
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    description: |
+      Names of DMA channels. May be omitted. If present, one entry
+      selects a single direction, while two entries select RX and TX.
+    minItems: 1
+    maxItems: 2
+    items:
+      enum: [rx, tx]
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+
+    i2s1: i2s@4110000 {
+        compatible = "sophgo,cv1800b-i2s";
+        reg = <0x04110000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&clk CLK_APB_I2S1>,  <&clk CLK_SDMA_AUD1>;
+        clock-names = "i2s", "mclk";
+        dmas = <&dmamux 2 1>, <&dmamux 3 1>;
+        dma-names = "rx", "tx";
+    };
+...

-- 
2.43.0

