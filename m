Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F55277026
	for <sophgo@lists.linux.dev>; Tue,  6 May 2025 09:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746524008; cv=none; b=Y5PdEb5VOkIR5tmy2z/grMNVS6/K2ZM61gFlrmwyZMLRvOSYPHX/mOp3Hi9OoC9gQUoaAtZWfSQL5wTRYt7pO6+paI1B0Z4HrnFskAxLF97VMWcZa5trRxHVPy0LYIzfsgZdGlW2N51nvezdj7uQMhYiGS3MVCQlCNsxr+QhV18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746524008; c=relaxed/simple;
	bh=NwVarQpNhav3l63GqAKBYjS6ppSh2Wig+n2alcg5C8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTMG5hJ8PMxMmd5E03SKVE39sC+NNwuECasp23BssFF8NCEcmWGggh3icGMVX+MeMbYEZFvLoYXIzsQT15+coA/SwE1RrDAouKKaX7U8Q/IJdv80zR/2IssPnwHUudaQu7wsg7WtO7IOutdlwUVDVnEka41xvDZ1WAHmmKzx9JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDVYtO3V; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDVYtO3V"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecfbf1c7cbso100679296d6.2
        for <sophgo@lists.linux.dev>; Tue, 06 May 2025 02:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746524005; x=1747128805; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aI4dRXqiKm6pX3kcqhFfwk5EZQ1NNLsZ7AEY1QlzP5o=;
        b=HDVYtO3Vdyy9MrEJnUpPGAfqVXIfDTzPWkzzGDgBSCL3xLsMjowZsbYHZZLVTYO9YN
         SCuQ1gDq31FDx4geLVT5K4j8H0IOS4s2x64eZEmRq9oOgfQHWrnNcZ74rgActb5ZrxwH
         0bL86LLkEco6wBnKOhPorEnRiANliBM07LVfXNK0wvY5lahRHZw210feZDkm4xPMK7OH
         xq251HtgnNUB0P0bhv4ZYHeg2Yl4xn1gEwOFCZGZOWIFj0Hue6b7EAbrsVlKHDzneXm3
         gZQRiUqTnLNMcRRi9ScTeBPmMDesp3+yq0UhaATp8lNtrQyas6jsAgis4Q4QKnner88J
         ji5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746524005; x=1747128805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aI4dRXqiKm6pX3kcqhFfwk5EZQ1NNLsZ7AEY1QlzP5o=;
        b=bnkPGloxde/gleyzuhHPLUWJVeMX0Qk4IArP5mywClNZ7n4k71FiRsxyO3X0GPQyXQ
         PejrkI8BBKbM8SgXw+v3esRRDIS0cU3ArIh4AaZs16Of39Il7OuVmxprgWWjcBSHrhug
         KZCU0n7Ffaw7/syE7Pqd8a2GOrb0QEmWhKckviHlEa3y5uo7u1mG1kZuxzju/8Nxwy9E
         qpLmr6d7WXBVq9pfmPczvWt26nY7mpojYRgDbbaAwRVg/LdNC9WW/4xb9E4IByI8zfIb
         k6OpLGnhfG3KS8ZD6uuIij9oHJdYJS53SkzIdh99B8NB62ckOhSEQgcyUF+zBZewQokA
         2sEw==
X-Forwarded-Encrypted: i=1; AJvYcCWw0AzVR3LHrXU1THY2vqfDABKTbdkAgGp1uFjmaUV9pnyas9uVJ6Ide97Itz1T1pOU5bOVeM0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaMkDhXNMtYUW5YofGSIzGNWm7RjRHPCf9BtW9AewhZfs5eoe/
	+T7Ff1L8tQclb0IIEZI4IBcKYeYVTJce3Kv5Pkhw0eP4hKvNQZ0e
X-Gm-Gg: ASbGncvwor0eMh3yAsx8S5h2pWGgL5Dzuz6yLlR64UAW/wV2jl0Fv/0edn9CReXCRrz
	R50hZm7WCgdbg9sJ+YjWXVFUc+PndOmAPKCFZAfphpQZfmDSfG9SYN7819phJJFARFYJNjgcNp4
	RdHiXFg3h3BufWJSOVIGx8QRFo/+UKyMYuhcxvCFQFwoG9RJEHn8EDX+WyTZhrePU+7wrDRfft3
	Bgz3XobwBOU+94naVxgLMNH88jZpguLmBmsLtqrlfZrKbDJuFudZwnalDNuBNXxPgBmaWFAWdgG
	oZSokpLiQ76fE25L
X-Google-Smtp-Source: AGHT+IHQ/VCvHq3Ers+/VvDGnzDvxmpNMck0lZ3995KP7lY9UpCWzOawDdcIMSjGwrUnb0SUUaU/qg==
X-Received: by 2002:a0c:d6c8:0:b0:6f5:3b8b:8d0d with SMTP id 6a1803df08f44-6f53b8b8e44mr12554866d6.20.1746524004730;
        Tue, 06 May 2025 02:33:24 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f50f3b1fbbsm67539166d6.15.2025.05.06.02.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:33:24 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH net-next 1/4] dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac
Date: Tue,  6 May 2025 17:32:51 +0800
Message-ID: <20250506093256.1107770-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506093256.1107770-1-inochiama@gmail.com>
References: <20250506093256.1107770-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GMAC IP on SG2042 is a standard Synopsys DesignWare MAC
(version 5.00a) with tx clock.

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml |  4 ++++
 .../devicetree/bindings/net/sophgo,sg2044-dwmac.yaml  | 11 ++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 78b3030dc56d..f16b49da6dbf 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -30,6 +30,7 @@ select:
           - snps,dwmac-4.00
           - snps,dwmac-4.10a
           - snps,dwmac-4.20a
+          - snps,dwmac-5.00a
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
           - snps,dwmac-5.30a
@@ -97,11 +98,13 @@ properties:
         - snps,dwmac-4.00
         - snps,dwmac-4.10a
         - snps,dwmac-4.20a
+        - snps,dwmac-5.00a
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
         - snps,dwmac-5.30a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
+        - sophgo,sg2042-dwmac
         - sophgo,sg2044-dwmac
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
@@ -634,6 +637,7 @@ allOf:
                 - snps,dwmac-4.00
                 - snps,dwmac-4.10a
                 - snps,dwmac-4.20a
+                - snps,dwmac-5.00a
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index 4dd2dc9c678b..112b0b2a1524 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -15,14 +15,19 @@ select:
       contains:
         enum:
           - sophgo,sg2044-dwmac
+          - sophgo,sg2042-dwmac
   required:
     - compatible
 
 properties:
   compatible:
-    items:
-      - const: sophgo,sg2044-dwmac
-      - const: snps,dwmac-5.30a
+    oneOf:
+      - items:
+          - const: sophgo,sg2042-dwmac
+          - const: snps,dwmac-5.00a
+      - items:
+          - const: sophgo,sg2044-dwmac
+          - const: snps,dwmac-5.30a
 
   reg:
     maxItems: 1
-- 
2.49.0

