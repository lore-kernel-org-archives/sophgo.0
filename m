Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FE9288502
	for <sophgo@lists.linux.dev>; Mon,  3 Nov 2025 03:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762139149; cv=none; b=NIES69g7nAdQswWl8r9nrlmwLBCjpQLOiLfdSLzSnMjqF5z5e63Uk8VwGGqGoDjAXIZbLhJvS+y2336pnka2kAd8NvQKT15JNLjlCOVUH3/rvukT+c7JV1Xju5jvVoDezhzXIjcqm9aTf7eEre7XIfbToE/Z7ZpQ9pEQ/4rJkL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762139149; c=relaxed/simple;
	bh=/s3k3gaQa5vELRzkRL0kZbmW5//OLC8cCCrARdlhhI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxyX2/i0cQ5cClDCAODfHb+Ie5N4gj/ct3/eJNUnyD0KHXuAdsp9ft75gJhnTYYA4A0QTuiyF5nzm5bqSenyFBGAwlXbh8cVB06zCwmMztmKBpctmIuz4vlA6Rf+8ZTNEKOLy+HLRDBrARtgH3fPFwQ5QqugX3/u3PC4+ovw8/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifodlphs; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifodlphs"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b9a6ff216faso685587a12.3
        for <sophgo@lists.linux.dev>; Sun, 02 Nov 2025 19:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762139146; x=1762743946; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DZ/Hzt/Z4dyeSpA3JZAv4iA86Nxbb9HIqSS2XvFzQ8=;
        b=ifodlphsxWA/zys+z9XM3KwsZUgcEn0YvVgsh0l4pA/hrtTghYKhAsp0N+QFa+HfEd
         5xyQ3nFVT+DnANXBp1zP2IqmhPV4OfJ+vfXGTkrs4+BbGjGm0buITFyzrXH/09aIxjKz
         bfJgS730BG4XQTrvWT3qlb72GayCk2ar0tJo5TaQZ91FAs0w/+J5XY6wbaJgJFJ15GSC
         DU8BMJL6oxCW25uXT1FzK202fIk3Ke1SjLoUoysOM3W0yNVU54jhQtAb1qGI5O/j5Liu
         chW3OJ9haqwYMz3ty0mfi0ZFq9TqtlUVpRtcoXFVnl0iyMSDVzqg25KkJYYXKZ5xO20W
         NUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762139146; x=1762743946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DZ/Hzt/Z4dyeSpA3JZAv4iA86Nxbb9HIqSS2XvFzQ8=;
        b=O7R3NBNHtdaKY6KrLhO0xjk8uWm1HhpgPbC3sqJiInZyPb7gZlZ8EOqGeavTl5gbpp
         dCisNfqDe8Ye+BbEI/v1Zu7ooPOLTy+24oIO5HToz/gc28LpfveurITXVvJPmhVedh8M
         thwF9vgagslO1nDr9N2H71gl9tkYHGKBFx8QPE3oHz7SQhXYEjJbjtrljYjH0AftDDwP
         fiWEplkWaHV59jGqfnsdi+WiPg7aGwmhMa1hh0pETNotCPUv1NyJWWKXi88FB6n80vEu
         R3nKQwAyLqMOIsR/jEdW+Hb9B06zbkly3+izJWqInRQSt6s9949bW3A5ZENhn20aSD5i
         r2Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVqWsuDqqmDo3PAbFxR7jX0TJbAE+nBgQuiQLUCgbLCL1yQ18HC8lZZIwHVu+cSpHDZRV05BGc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5hL0VCCPDoRjy5wytZT9KvHOzHlsYrptoc9rYcwBohHb+NyJk
	ZoMv1Ygqy9aZM5jZfBYf/UWRruZr//5OOJzN+BAlh6VyWz/fJDYthG1G
X-Gm-Gg: ASbGncvuFNTgEuhN/HqSykgQe9wooKtOeVwmHajBu0V17R/etf0XmIwHxWsbiVMlcGk
	Oq/dcSGe27L2Mor64z6vSvpDO9lZPDDymEti1iSA4I9BdgQ9kFJz88+4eqLBzyzgyj6w9DId2Nm
	d8b5HMba2KaWrWlVnn/vmxb8kZw6C71NpI8Ez8T7jhAxTvt2KBr+4ZMOs3BhsaTcr75tPDfL2G5
	q/gQMDDjPuySyvF7GF0zWj1Z2noPZzgh+2ljFSxp18LYtrRTM4HLaQhmVTBCla2uwckh2axfdNL
	FQMsPMWwyo2b13r/gH3TAyyWw9JQ1AIC7j9CB5PGM6q9ray2rVTcC6h962IiAPgAw1chrD1Fgw9
	iCY/7nc3Xg4U+DlZC+uQ32vEObjfzoEmMJF82e4jdAq439Bc5cF8Z9w4lwKBJTavxcnCvAtrsrQ
	B4ChbSQAaWnA==
X-Google-Smtp-Source: AGHT+IG+udK6Bhw4W8KPlkD75NTM1WqC0W+OR++Yhtjf/iYFIJkPzmpXbccgIuGWio8g01Hhjhz5ug==
X-Received: by 2002:a17:90b:4a43:b0:340:c64d:38d3 with SMTP id 98e67ed59e1d1-340c64d3b78mr7086982a91.12.1762139146285;
        Sun, 02 Nov 2025 19:05:46 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340d1a4a587sm5157684a91.3.2025.11.02.19.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 19:05:46 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
Date: Mon,  3 Nov 2025 11:05:24 +0800
Message-ID: <20251103030526.1092365-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251103030526.1092365-1-inochiama@gmail.com>
References: <20251103030526.1092365-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the ethernet controller of SG2044 and SG2042 only supports
RGMII phy. Add phy-mode property to restrict the value.

Also, since SG2042 has internal rx delay in its mac, make
only "rgmii-txid" and "rgmii-id" valid for phy-mode.

Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index ce21979a2d9a..ce6fc458be61 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -70,6 +70,25 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sophgo,sg2042-dwmac
+    then:
+      properties:
+        phy-mode:
+          enum:
+            - rgmii-txid
+            - rgmii-id
+    else:
+      properties:
+        phy-mode:
+          enum:
+            - rgmii
+            - rgmii-rxid
+            - rgmii-txid
+            - rgmii-id
 
 unevaluatedProperties: false
 
-- 
2.51.2

