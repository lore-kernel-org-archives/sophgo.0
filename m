Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7B62222D7
	for <sophgo@lists.linux.dev>; Tue,  8 Jul 2025 06:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751956255; cv=none; b=crl1RmpM41yEoRWUxGssUBL5ASjwstGstkxOoKpzypxC+V8L5H53qp4QXjRoT/91hnhDCb3qN7uEadOyApKXuk7soWvmm0Ii9XAuQEHkkmDlwKGY8gtBBKRefqH2d+9saj37VR0KZgFc39ScNRWrsFZqVhfLDhGO5CVCWDa76yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751956255; c=relaxed/simple;
	bh=IaR2RbEG4ZcQaRpRSYYiIkWTJKxFi3GcMHaGNFX68A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G6cVdS8Ho7UZDBdh86yfVZ1eYD+YLXi7DDSU7/nXrAZ3mMnGAsaA8Qvhslp8cgyAXkmSobeuM6NKdmkWKEWxKQKnfN79pTeMvnWAiN8ZSkRLou2VCEQGqh456+4dWnxzxYpyYfRxrs54QG2oBShfUhl44w9QCJf1ZjgelhNeTJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mwec0dk6; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mwec0dk6"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso3462056a91.0
        for <sophgo@lists.linux.dev>; Mon, 07 Jul 2025 23:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751956253; x=1752561053; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unrCE2h+xEs5THla5g6JIss9SJiJCc2wnfnjeuDD2ZM=;
        b=Mwec0dk6pTMs+GfnwYbbkVqlVsdtf1GCI+jCIhpaswygtWrYSGkGtjpEUWtiYbF0H0
         3sB0XzA6fIwpWGPNzCqJjRPKRJE5bHmSWS8VPFmA2xv+zjUqgA4qKgHIisW6TJm2YpJ5
         dqMEmBWJczIhrzxXRGymMNE0cM0uM9+RQboZ5Nnpk4Q8IrMFqT+daxQb55oSG2bB/rKm
         sZ6xFD9et3CsfSDIco0uOewkTiahQ4gqzQxLmaPVTJqhhXmpyUAIJumkIkD79DW6jzZN
         fm6yaAQah6ETt8txiWuRPydPLwUtdunB+iZrvhReqoJ/1sA+dT+jPsvkwi8q4Uv5KzvZ
         Cm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956253; x=1752561053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unrCE2h+xEs5THla5g6JIss9SJiJCc2wnfnjeuDD2ZM=;
        b=geuZMK8sODjSAmeBMaELfwaSynLpKFwCVM5+w35xgUmZpLWkxeK6CXFq9YhUGtvyIf
         YYOnLdidtGtDbVSUaQZlAU4P+uDUXj26cQ2NJQ2JkBHGdIZU+j1jR8sYnw7R+mRX65Pf
         UO9R9O5ws7rfC0gjpsLecvx6LJ+DFd3znNWFASI8kbhkwwxQi0iWy6OYfpLWVzvkJ2ke
         Gsi7cq6ZIHG6CuZ1+zvJGb35Xd/rm/520hTToI0ym/5N4QonnZ3+28WlaRzUvj+O/1RH
         E5BcTg23K16zV6j0nKW+UXpdiQPDumY8vXr3N8l1N1ELVCf56Xd1TJl8IBXgmdTP0ikf
         whNw==
X-Forwarded-Encrypted: i=1; AJvYcCWgzYKGRmElqyyhmld5BYDEDLL1kxgZJMwtVGf3/+MQyBLNqqHzBrGpOEC80pIqBHGsJtOwlrI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuQG1XYLqCEdLHZFOAsqpAQ440qXzb1SFUdafPX3tR+Do6n7nW
	u+8+JtovQKtXB8u74i64u2aFxJ0tPIluzZouHsaqSaF0de3iA2ws5Ams
X-Gm-Gg: ASbGncut9Xr2dmsaYgcUX2R38gH89CEA+jWZSDkubk4GxhotzwbGk2m095wHCwr1xVY
	SV1FE7oHqFXQF4lGWXscNJeYBuvpj3MI5CmtSOOgk5nUXHlYXsU6gqeIg0GQlYDk+VE65K26Hkx
	Keg8ksnH8Uxc/T2f333OIx6vH9vfZBIWZJCW2zcL6FeAZ2WarfsuBjBgI6akWCqRhJyo4tm28zY
	4QK6uQ3Ss9J5zLksv9ZdmuqP2bGZOI4k6NNT23lujzIgqeUcyifWrDOWYJEyohQGaMSAomaQgH8
	xFAvOGC0U6AsYPCDcSLO7onJonJHg4rQ2TAEl/ay7EOfJ7grej4CP/WDIbAJtA==
X-Google-Smtp-Source: AGHT+IG4k/cpRNSq91pRjiax3XUAglPeQQH9aGEgVn+1cSS8PugFjOb1sRvbj+Lujs1yMSOUO9eU6Q==
X-Received: by 2002:a17:90b:2588:b0:311:baa0:89ca with SMTP id 98e67ed59e1d1-31c21e31fcdmr2286947a91.34.1751956252818;
        Mon, 07 Jul 2025 23:30:52 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31c21e8b48fsm1207893a91.33.2025.07.07.23.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:30:52 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Date: Tue,  8 Jul 2025 14:30:36 +0800
Message-ID: <20250708063038.497473-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708063038.497473-1-inochiama@gmail.com>
References: <20250708063038.497473-1-inochiama@gmail.com>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
2.50.0

