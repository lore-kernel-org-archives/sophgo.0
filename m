Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09E923BD1B
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630368; cv=none; b=FmdhhwWJEXnGhIAYl7/uFWqgUV8v6Uz6y/gdmy5gY3V4T/WO8qLzvGH6ldbMoiM67smrYdEHJXSn1EO8XJY59n8BDNUPWf+BRaqyynB7dJHlaWclB0mJ4PM0miZXqIfth/tsxvHPVrWn6IWIkXC247qmOC+Dq39vTTDq3Q/DLQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630368; c=relaxed/simple;
	bh=petEES/Z+au0Ki6jNUYdO7rS7mfcTqHdfaHqLrnu2xI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNVTzrW4h+0jBLHF8XVQumF34U6TfLqyN18gi8X2wu2L0GgY7DljLTY64uOrcENqKq+Y4T2KtoSJL8oDIJ6M3ydkjgCV3bF9Yf54nzYmy+YD0yIf+/jGPVLy2t2FkLk6V1J8R3heXDYikcSBNUkPxKaA1/GiO8YgfzdpLPhT0Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+Q1rxy+; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+Q1rxy+"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d09f11657cso596279285a.0
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 01:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749630366; x=1750235166; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgBBlgf2A0kFvnU+OMHuSn1vM73oxJmf1nlExlQ6RqI=;
        b=X+Q1rxy+flB/xu3f2V5xdLAS8KTXIk7thbzo99hA1C+78d1a7THMDt2/foYhvFQEM0
         ZV9HSxrFE0pTcnQQO3o8fjBjjxalU4/jurxGqikdxIu9AHgPbWMbcP8BUFY+zexCJiHm
         QJM1h9QWdcInjjWM+5OyZj5j1MXasickeSwQf1KpNk2PuYT0W6CvqJ8OzgB4pf3rKH5+
         ZYEUZXpejSbSuD91MNcKZMR6/6V9hgPEq+DzcMlMjq7AJE8g4WyIOqDpRVYQ9Usot3ht
         V+ZRo4vU4R36EkPBWes6nFlWsO16xOepsAwXBV5lg71ZJR+T+2Ssz8yvpZD4b/Gha1yH
         hDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630366; x=1750235166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgBBlgf2A0kFvnU+OMHuSn1vM73oxJmf1nlExlQ6RqI=;
        b=tudUEFVw5Mnhfbf5hC/Em/KEON/G4lsPM0fpfrxREkl6QZed0tKy9ewtynQAeAcYWw
         jC9DqtO4J88wNPFzudj1g0jCtrSjFWLt5rQt6QmJgroqxc/SVktV0+3ER7IEDKwnrPPB
         SqGMh0FKU+cho+MSQQBEsRJLEuWkTPQgBs7JtCLXNBQIMrBok3vE4PoArqWfMLdQVa/3
         P/9SvAMoJtJ3u/8+M1msjT2JrCA3DUasdMiM25lGNVPWXQ4T08naqeRZsCgX+qM2hf9R
         qilKkiuN/hFgw4tFJe8FXtD4eXhGMaZNn6ukDcMJWpsakjj60I1/H0aypRhhTLOfw+zh
         xCnw==
X-Forwarded-Encrypted: i=1; AJvYcCVBfEysy8z5wCPfQQrZdPCo0DIecd8jRFaScp37tzUqFws4c/KTZV96kc/DdzPSlKFMLYW/nPA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEpdqcvqyndEWL2fSB0TW7Gsx8AfXq7fwwdntikng+bIGKljiu
	jtNaZcL3IUo9TuVgW04JUb1qc3tj0JGdX8dsB9VLcQJ0tFNqf3y9wCRF
X-Gm-Gg: ASbGncvHj2/Yje/5es17wZJoSpZ/swM3OVEcNwtyt4UyXenkrKyk5vpgLKQ/hpFzgaF
	qlC9N+tRlYZ9BxdY5jKmkIW2PebcQ5ASZdf0c3UdxTSy8ZS6Xg3w4+IcG2vZrn4Ww6Fy6HflArV
	Rdt5oBSLHljrlpSl6F/s9gewp5ekHdYD3bNoO0jyO6OJYx660K1k+ZwWCrMPzhUxjsL9GJCVDNq
	zfOSQI1iQzRuTKGEir3TqHpnt4YR/0kC3co0DgWN4amI7B2e6tscro1w63KUnbAgNPjb/x7o3BE
	QZAX7bBZjhuxUO2kHnT5FYtbf4/hGLMj/iSRtg==
X-Google-Smtp-Source: AGHT+IG7wxcIgsJM1bVKh08YV2G5x6CsGODd+WUWOe41/FWpBrES04p7hjkIFnpAjS6EYVZdpYt5CQ==
X-Received: by 2002:a05:620a:4014:b0:7d3:8a6b:d24d with SMTP id af79cd13be357-7d3a883473dmr332522985a.24.1749630365571;
        Wed, 11 Jun 2025 01:26:05 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a5948f8sm838959685a.49.2025.06.11.01.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:26:05 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH RFC 1/3] dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
Date: Wed, 11 Jun 2025 16:24:49 +0800
Message-ID: <20250611082452.1218817-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611082452.1218817-1-inochiama@gmail.com>
References: <20250611082452.1218817-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sophgo CV1800/SG2000 SoC top misc system controller provides register
access to configure related modules. It includes a usb2 phy and a dma
multiplexer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
new file mode 100644
index 000000000000..e8093a558c4e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV18XX/SG200X SoC top system controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+description:
+  The Sophgo CV18XX/SG200X SoC top misc system controller provides
+  register access to configure related modules.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: sophgo,cv1800b-top-syscon
+          - const: syscon
+          - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "dma-router@[0-9a-f]+$":
+    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
+
+  "phy@[0-9a-f]+$":
+    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@3000000 {
+      compatible = "sophgo,cv1800b-top-syscon", "syscon", "simple-mfd";
+      reg = <0x03000000 0x1000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+    };
+
+...
-- 
2.49.0

