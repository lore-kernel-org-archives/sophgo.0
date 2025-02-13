Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EB21547D2
	for <sophgo@lists.linux.dev>; Thu, 13 Feb 2025 02:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739412557; cv=none; b=LcVuw/Iz1fXz84C6+0tK2AIgKYib19DQTRh7X4ehAMvnJt9e1YBoINuVQxFM05L3Y30TXRN6opTF0YG/5u0JpW8MyjuxO08sDpdhyUNl8dB7xvCP98G77KCnmvKMCJXklmcSW1sopchl5qJ32Vvp2Lkufm2aWQZYSx7xVb15zDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739412557; c=relaxed/simple;
	bh=3qPF0chiHK722rfk75RnUIuKB10cPDIrLgoIBvfCQgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPtoafTzVtbnqtGdnJB7MK0UytGUGmUWXNgcdOlONmdd4iiT8QbtHwhpu3LuAn9+NR6jqzvtNEvtO7KsiMWOtHWmEk7Au5G8TN8Bi7Ufjuefqrp2zYYPg5Caq1bK+yTtOMyOdrD4Fd2SPLM+dEh+47vhGm4SRQEJg0aAQoC1Cn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIPO5YdL; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIPO5YdL"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7be3d681e74so30067185a.0
        for <sophgo@lists.linux.dev>; Wed, 12 Feb 2025 18:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739412555; x=1740017355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMzBCZUxKjxBjINW4Q8NZwZbLLoL9o1dpVjVjazylMA=;
        b=XIPO5YdLWqO08uQW5wwswTIjbPWx8FLfsOfbmuTS1hs/IT/mNzq9s4AnrO1C3WL82B
         78Vl9tpUSflevx4s9pcz9A7zTAtXq0XATBDxkfsX0AHq9Xi5RFMDMQd/I8l+hxto2Gs2
         C/mmqazndS6r0tJeKIfOTvOxlYi3aUdQQQyUgI88b+Zkjl9XY24yIc1zv6VLZHzJPSp4
         GlNzkWz6ljHnIcDAwdxAXV904Vv6j1grNlioAiBbgMtKcf2zf7f2GkKerENwLoiWN9B2
         ENO7ttGKupNqSn1wZhyYF+4bT+IY+vzad/ZYmGP6FbG5PsO+oJiQx0NhS3cO3fic/+rp
         /q1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739412555; x=1740017355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMzBCZUxKjxBjINW4Q8NZwZbLLoL9o1dpVjVjazylMA=;
        b=hNw514lxZ82zRVHh6O0JJ3EnZywql67fINGIYCFn06vx8m7jqzT+ylUM2O2qzK/K33
         +giaAmigGi33gOb1G9l8otvt8iy0O3hg786s/FNv+bR/fqcjYcCIBsG4eBfzcX5TV5mh
         c2SrEDrmhk0TcQSNTcbl150Q0r+6Li1AyBXLlxQknU5vQ6uRyVxZTNzw2PBwA3yITc7z
         8GyGRx49KBX9ip4RcthZzplW5JsjQQvcx8CbQDj7Flf1ILtnHHkOL7SZ7mMkDWwbyEVf
         hmHeiYLT4W4REchkTyEzdNeVZdIeyIzp1exVqwTR1d2+hwFAj370s0nPDcsxTlWWSxhr
         loSw==
X-Forwarded-Encrypted: i=1; AJvYcCUGpU21m898s7UKme8DgeCS5Wv2vtLQdIwmTi5+Qlf0hhSAhH42070pSpHk1fAkhci2Wkvy9Gk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqoz9Ahyi1g8az3uxLpqMjJkNjLkG2Q1qkUm78czqmwmWTOgkj
	MW/uPw1EFfOa8lJXlnv8wa+TOHCqPWZzwcwDnT8n17GDCRDcSp5j
X-Gm-Gg: ASbGncs4KfSw55xBlKY4J3hxwZKvsCqQ7ZniM9oi34D//YbH1GRD9CeT37K/l0Nlifb
	Lzs+qMJjx+CvAiM/NAMwwubTc/nYlSN1kd9TZMOpwWa2HOuJtdlPzU9mDb3T1/tQ/uWa1usXPYa
	+onrNejKRU7adYljjCTzQrUjryd03z/d7mWVTFfeE2PHWY1VQxpYbYFSh6sHZxx9gPE4sFbgEQW
	hBEEWqrVDpMb5TY1tVFsNbtsgVi/6Cp1To0a4OMGJPS9WuRXsdQe2JhFZ9dck7s/yg=
X-Google-Smtp-Source: AGHT+IFzSpeYmkmhYNfuU0USr4lEMhOa2fMmDdTe/rH8ObQkGxuUEDVUfTkUCRajwBoAp/WW8kS3Xw==
X-Received: by 2002:a05:620a:2a06:b0:7c0:7c49:a435 with SMTP id af79cd13be357-7c07c49a614mr89674885a.52.1739412554676;
        Wed, 12 Feb 2025 18:09:14 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07c86e4e0sm20092685a.91.2025.02.12.18.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 18:09:13 -0800 (PST)
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
Subject: [PATCH 1/4] dt-bindings: reset: add generic bit reset controller
Date: Thu, 13 Feb 2025 10:08:54 +0800
Message-ID: <20250213020900.745551-2-inochiama@gmail.com>
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

Some SoCs from Aspeed, Allwinner, Sophgo and Synopsys have
a simple reset controller by toggling bit. It is a hard time
for each device to add its own compatible to the driver.
Since this device share a common design, it is possible to
add a common device to reduce these unnecessary change.

Add common binding for these kind generic reset controller.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/reset/reset-simple.yaml          | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/reset-simple.yaml

diff --git a/Documentation/devicetree/bindings/reset/reset-simple.yaml b/Documentation/devicetree/bindings/reset/reset-simple.yaml
new file mode 100644
index 000000000000..77584e23e8e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/reset-simple.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/reset-simple.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic BIT Reset Controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+description:
+  Some reset controller devices uses a simple method to perform
+  assert/deassert by toggling bit. Some SoCs from Aspeed, Allwinner,
+  Sophgo and Synopsys have this kind of reset controller instances.
+
+properties:
+  compatible:
+    enum:
+      - reset-simple-high
+      - reset-simple-low
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller@1000000 {
+        compatible = "reset-simple-high";
+        reg = <0x1000000 0x1000>;
+        #reset-cells = <1>;
+    };
-- 
2.48.1

