Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FEF14E2F2
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 02:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745978996; cv=none; b=UiJX4invXlisCbLAQx3XrvDk30m/Fnly2QkCGYkmpc4aq/8nQ0TVqjuqC7Xr5AeANPzxBAYVKRxF49AVn4yWm8MAxY5aRf+ewI6Hw82vgS5BalPTvb+mxtt9OwW3Jbv6aqB5ItncYTfxboh5pJG6eNsBkTW0cTrZbL7NJkG8OsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745978996; c=relaxed/simple;
	bh=UJwi8S2oSOPUAClcHP/ida1jA2kT2gCpm9OIeZ8USW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bT8yR/I4W7VoKcdllVYrN8OefjBVeXai0Z099msrQ2gQwVpXiw9Z6MbFivroWHLI549DaHUBtyfogtuoCLLfKeIk8ZYzXBu9jmIXVZNnUU/pE1StlKSYBrMrT3Y4JFYn5QYW0foBxDM9aVF2k/X79cJoKy/+OufrSzqzSX3Aniw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ew8JxK1d; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ew8JxK1d"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0ad744811so50643676d6.1
        for <sophgo@lists.linux.dev>; Tue, 29 Apr 2025 19:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745978993; x=1746583793; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4Oe7PG99/AZHHENXUgxt/svqannmrv3ouX9muUCFhc=;
        b=Ew8JxK1dPC5WKMxN4ZuEIz7d8Lh3s7a7MIQWS3+/hvYBfZDFPUgBZ7KPCvrIcbRXr0
         HT5pKPz98a0ahTLSKLa54sDoLOYrtXMWFxtAQkokpUR7K1KS+To3tu1V9wtFPERSUmjR
         w77jdyIeqtwZfnhLSSyavZBGvkgG1UaNCWANOExiG3sUfcQvbtgyfkSuNn/CGcxsmEox
         gNNJO/3DumUFDBi5rVGlvsh51qXOLpZtxiJgPxfpTMsGi6A7cmy3ykRr2/I6Lw9JJMwA
         iR6GhN1etFtc3xs7wpKtD3W7ERJVaimcKaNQTqCggJIKQxk1MnguZ/ntgZjD+B3man0q
         6ZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745978993; x=1746583793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4Oe7PG99/AZHHENXUgxt/svqannmrv3ouX9muUCFhc=;
        b=DKmkmnnrFIV9AFjAd/lajr5+rLneZFIOtNi1aMxs3UCthiOFRdM3RbMCWft33NHRYX
         0HsV0xEeCiPX/Xc0xPugvkYA61q5ngtBUzd1Sz6ySIYBGxlGgc/crb41SliToigOsfct
         OpTJZyesAuKACNjrzIq/H8Fec6ypS++/XS9Oc1IOF+cXb2hSokhVGOMRXz7ouyTmEWV0
         sDs9xc1WUnKbKbdSIEFohYk0tg76zjqFuH/G+3d4BekPcmaWjbcv77P/RgmU/sg3TKKR
         r8IDdPLi+0gKSr9n8vuKM4tiq+DPq6Iv5RTYvPu9ORuv9lAMGXRqiATLoxTcU0FUYNQy
         7CIw==
X-Forwarded-Encrypted: i=1; AJvYcCXrls+W6hNswfZOe/42R7JzR+fukF+Re/4+RLNpMZsungrpox1G61P2ooWPNhud3M0Pn5jSbWg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdDNzq7dsxEULblHr2762S1U+CMQJ/GlvwjbDDP9J7mTlmAiOp
	9twjENB4kwe1QoYekG9LWdbpeBXR28ZW+9LmyN014aED7KOlVU9H
X-Gm-Gg: ASbGncu6kyEn1662bdvaedXr3jEna59Tx679L9ORuWynHR+s3Dem7IFcfkaIVH+lZOS
	YvVXlPRO6AVbIQ0uHTmXowqEVGu4A42Ib2ddM8GODDoaA3tSPWQ8B5kvrRe4p2ndE9Z14qSjphG
	QZHr95GgiNB454VFptETgzWGSEutVBaQffy9rZt6u0EyGG/2S3+73rXjXaSvz7ls/D0HQq7+h0i
	qd0B+fCsuLHX9hOLS8Xu6puWSN/WlxlawyubY5EyZ08LFzeSUtWqRyhiDBZSeODx98dPrdvFuAC
	Fj0Mo7hImoQn4FCJ
X-Google-Smtp-Source: AGHT+IFl/15L7e190rP7iw7nPmXMdXFhJpjehDYpux7CYj2PcXkTXFwv+NJEHvRt1t5lmdRnXR6OJA==
X-Received: by 2002:ad4:594d:0:b0:6e8:fe16:4d4f with SMTP id 6a1803df08f44-6f4fcee0e3emr26949656d6.26.1745978993602;
        Tue, 29 Apr 2025 19:09:53 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe835410sm2791136d6.71.2025.04.29.19.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:09:53 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/3] dt-bindings: clock: sophgo: Use precise compatible for CV1800 series SoC
Date: Wed, 30 Apr 2025 10:09:29 +0800
Message-ID: <20250430020932.307198-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430020932.307198-1-inochiama@gmail.com>
References: <20250430020932.307198-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As previous binding uses a wildcard compatible for existed clock device
of CV1800 series SoC, it is not suitable for existed requirement.

Add new precise compatible for existed clock devices of CV1800 series
SoCs.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/clock/sophgo,cv1800-clk.yaml           | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
index 59ef41adb539..c52e130db887 100644
--- a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
@@ -11,10 +11,15 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - sophgo,cv1800-clk
-      - sophgo,cv1810-clk
-      - sophgo,sg2000-clk
+    oneOf:
+      - const: sophgo,cv1800-clk
+        deprecated: true
+      - const: sophgo,cv1800b-clk
+      - const: sophgo,cv1810-clk
+        deprecated: true
+      - const: sophgo,cv1812h-clk
+      - const: sophgo,sg2000-clk
+      - const: sophgo,sg2002-clk
 
   reg:
     maxItems: 1
-- 
2.49.0

