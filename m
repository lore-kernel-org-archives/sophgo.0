Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B712620ED
	for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 23:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740613383; cv=none; b=sxiy7z52TzSmuW8R5vr7OJnAkYeGppvMQp9QzZok9eSC4PXPmX6KJhC5lLF8G2RUC9aTownloZ3HaMLFPbzztfG85/qGx0ttTZhm1EAfYH2mOIesHq0vofUYk5kfscQAuH67bu5M69Vqfq3zkzQBfEkEAMR6OGYjU1S3BTJe/8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740613383; c=relaxed/simple;
	bh=yB4+HY8mRrtS+9q//3dQ5/10SMQ6N0Qm4zJtdHlCn+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SgnIclWWFMJbb59T9RIPAMfA700EwbeVpwcR9fNR/4bFkabsrgSKNoGJUEFZlp3ngWVtWj/Bbb2d2OOIwWK4aKNbxtgzBYHMtfQh/te/olB7OJSNP2hYJ1MyI7c+OK7Outss22eV8/pCrhBzRvIRrDznPsrvsqjcZJ9YEkYWL0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPu+DY/d; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPu+DY/d"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4721bfdb565so4583161cf.1
        for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 15:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740613380; x=1741218180; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1+lP/WIL+F/rv1NC/9PUv+dZq+2rnJ1+5/Qq+1dd3M=;
        b=SPu+DY/dJfTlUlU1szx/XrrpbL3mfNrztoaHT3PSpDAG6uNljtfhGYcEqMQktpDGxb
         2ni9qAiymwE+aT+rAmt+3tV3Tbf6qjJxuvcQZ1xu2gq0OByRNqN7FpeoATWxOYBUTThP
         gKyqzbZIDovks2/V8xuwhgiDIKe/uq7VHcVh0j6Lfv1sFBxxWQ5SiBXM5HYTbyIG/i0s
         Tf7IQXTqMnewholIQ4foqfRbW/tV9nTgCo2Dls56UT3s4/J1zmWCB9SjMOGNH6Xr0e5e
         sR5htYjJ+uMjgqlPLbB33tI1g6IL+/kg1vRyr5p5iCZT4bWBgf3Nf2s2Q6hZUmgJBa+D
         K7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740613380; x=1741218180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1+lP/WIL+F/rv1NC/9PUv+dZq+2rnJ1+5/Qq+1dd3M=;
        b=QBoF7g+0RdpSU3bNu2x8lRCUzjJqxc1WQXJ8eA0oPmyH0BhNYkji7WetHAnZ73/GmQ
         2CXjOOSeWDr9yZuvRDOIb/046K6ogY7cIxl0SgB+HAaC46KCE09Ift90RjHfLlFDQ0c+
         uWcc2pY/jDrsFl6hrCYIyR2J8f13+sbXGYAnR9SSqT3KyHwyqqlhpjznVwBzptrau6kI
         wBrL9j2DOiUaZiHzVAv8RKjH57YM+0b9El38LH3xTCXQTYZOGFhun+wv1RwjLAqpoZxt
         fGBqL1SSs22wWklYXWdw6ArKErt4KXJmT+wyW8o7Pkb3rVIVmrNsBIzfFJGWpLxuZOtZ
         5A6w==
X-Forwarded-Encrypted: i=1; AJvYcCVpDu+KePrRNKfXA8PXaHVNOIQV2/zFgEzXuSY/rDEmJ2fu30EOOgW9xrBydAL4LCYrku0juX8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgdQgoPNGedRu10TexLH5STAJw3THL/YvPlshIxAPAAfhkYle8
	c0QMZ9lqndnD57yHS4N1xVqsTdxMvYqvoKm4qsVz1G4VgIOflkp+
X-Gm-Gg: ASbGncuedOwIDHI4fe8VrOhLg5o0EbZkeA4kWdVr0nfre7nPYSqcMRGjWH61NkNuOd+
	8HvIgMnWkNxvHRweJeg7S959AZNys5ACAT0MtqAqMoDhLrFu2K6ElnsEX4/NZTNW6xKSSGcRwdc
	d6nZ9q0lm+/smnQbbWodm/ghsjRWryftAuxi5esAqI4Bsg+9Nhq4LML1Iz20cPvM1kGEZznFtDk
	IxKT+Q70UzqEKows1SOolk2IRvX6nNFwadSNmOVS97coE6+rDwV9kgiejv901IdACqoEemF8i59
	QA==
X-Google-Smtp-Source: AGHT+IE44ZeBH/IrSFQFlBWBOeEM9K3xucoChT7wDAEvDlnvzZniYENcKpDmeUtZGqquKBj12bm2Iw==
X-Received: by 2002:ac8:7c41:0:b0:472:1de:c912 with SMTP id d75a77b69052e-473772722edmr140400091cf.50.1740613380578;
        Wed, 26 Feb 2025 15:43:00 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47472430d89sm2637701cf.68.2025.02.26.15.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:43:00 -0800 (PST)
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
Subject: [PATCH v2 1/5] dt-bindings: reset: add generic bit reset controller
Date: Thu, 27 Feb 2025 07:42:29 +0800
Message-ID: <20250226234234.125305-2-inochiama@gmail.com>
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

Some SoCs from Aspeed, Allwinner, Sophgo and Synopsys have
a simple reset controller by toggling bit. It is a hard time
for each device to add its own compatible to the driver.
Since these devices share a common design, it is possible to
add a common device to reduce these unnecessary change for
the driver.

Add common binding for these kind generic reset controller.
Check the binding description for its requirement and
suitable scenarios.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/reset/reset-simple.yaml          | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/reset-simple.yaml

diff --git a/Documentation/devicetree/bindings/reset/reset-simple.yaml b/Documentation/devicetree/bindings/reset/reset-simple.yaml
new file mode 100644
index 000000000000..86c33a608148
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/reset-simple.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/reset-simple.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Bit Reset Controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+description: |
+  This document defines device tree properties common to reset
+  controller devices that perform assert/deassert by simply
+  toggling bit.
+
+  All devices in this binding should satisfy the following requirement:
+  - There is a single, contiguous range of 32-bit registers.
+  - All bits in each register directly control a reset line.
+     - There are no self-deasserting resets.
+     - There are no timing requirements.
+     - The bits are exclusively resets, nothing else.
+  - All bits behave the same, so all reset bits are either
+    active-high or all are active-low.
+  - The bits can be read back, but the read status may
+    be active-low independently from the writes.
+
+  If the device is not meet the requirement, it should use its
+  own binding to describe the device.
+
+properties:
+  compatible:
+    const: reset-simple
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+  active-low:
+    type: boolean
+    description:
+      If true, bits are cleared to assert the reset. Otherwise,
+      bits are set to assert the reset. This also applies to
+      read back.
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
+        compatible = "reset-simple";
+        reg = <0x1000000 0x1000>;
+        #reset-cells = <1>;
+    };
-- 
2.48.1

