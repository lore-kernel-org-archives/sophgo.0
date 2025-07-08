Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE46D224234
	for <sophgo@lists.linux.dev>; Tue,  8 Jul 2025 06:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751956869; cv=none; b=NdCoKUdSbKoeJvFsPfjKv5mcqb7kgxjGc3r6/2FzO48J0/sAWslwV0BOEyDoIHmtSRZq4/cS5LdwbnHwj344QLr+IL6OhGAUmuuVZHD6U63tC15cpEruBsVGGG05d+VMfqa9Y2CpTW/SJSprjYRF0OFuDyBgiGQTRIYi4lz86FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751956869; c=relaxed/simple;
	bh=75xX/EXc4PVXHWWW71cCo19H/tMvd1VYPGknOwQ/RCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POxbmzRIcS8oNMYANMBLAXGGV59JjnUsRyX5jJH780ibSipxtfgpiVahg6uW41vj1hyy6Jk/i8g6rmX5/deX+Zu4acsS2VQxTaoKeKDI4rygvgi47xrIARD87hvTj/NkxdZgsmAm+mb731BPkfFQaT706F1DpxzfvfoHQMEoZiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yyz9sr7Y; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yyz9sr7Y"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso3572105a91.3
        for <sophgo@lists.linux.dev>; Mon, 07 Jul 2025 23:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751956867; x=1752561667; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3j/1wK63BWsGUKsDNrpQgGtCBr1VsAlvbOLyb+XR7k=;
        b=Yyz9sr7Yv6ZQVNB9LT9BdRFiD5NYOhjPxnkQixzg0+h+S7L8r9oOS3lB0NGNMOBEpx
         n9gn2a/3hoQMvbaGgRjrLUbPWLj/UBjEjN3pf9UJIXwrydmUfnbw/QnfbaJNo2UwlXOl
         OA56MhPRjhbACSvxc1T7E+lVofH6/jbXr1OidgBoxQNaOuiJnHyDleGGR55NqUqcPAyz
         MpA2uvujvCtITf2FIZKDM5oAii5gQnadBhrmazjVPsDr7Q7+nz99xBSMr2yNioJMYL5T
         oCiUKRmCNZpe/3q8DbIn/EEqGzY3g3invFovjbt9nNIUFnBocAHqvZyFn5QH8/twWJ3E
         fLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956867; x=1752561667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3j/1wK63BWsGUKsDNrpQgGtCBr1VsAlvbOLyb+XR7k=;
        b=kmw8DG8A2fQoSilD6jOxX9hKYY9rbzqX5yuWSBipAQXTzn9QCQ18D37kqpiv1RmZJx
         VX5/xKLeNep3eM/JQDl6OdOivmy3e1jD/uWCLagqxslyDzY4lmReRJDb5IV+DHVAWpW8
         dVpLONqttrRwb5vYlLk9P8nyXa2rb0VxXMitr3Q2tXNGuCfjSLZwoZTW6dRs/LinFpgy
         bEFRQn+t4REg9/V8fARb3oR6Yc3ctnRvjNLzZeiocvl/feGcaWtY7U09Spz9mZvaI0aB
         nkMU9QCWalX/VXwtXBlz1B8d0D++q7REZvDg5vUkoQ7SsTy1dXC+TOzRzSsasbboOUL7
         jlDg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ0YvQTG8n3RH5jWh7BCqQrZIkyD+t0H+Jv/bpMUl/3mnASEA1T0BQ/RFJXSvLtOOGFZq1IDc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnYYox3ZDTo2RyIzaPV7eFKMC+W3sud83j3j6sVA8Y+XSVq3zl
	GO2bIMlCScn7gWB6qNq/mR87lfWpyxxnZbjsMWDt5Wp/urydCpJ3Rm78
X-Gm-Gg: ASbGncsK4ZC7nqbQRUCkAlxlIrT7iW4hfrBG0OBKw+YmfgSIe1m4AC5KwC5rBkhPYNe
	Kg/0Tc0GKKx3GQobknhQnCZqF0nlQ1g37+zpkVJrZdxnR/NLkDF2oQ1B7AVmOMajNpDp78metKi
	fWsQHMynHz1ATdk/nBFLmx55oNI02dutQV7oGHxqhpZfMZ2PnZu+c40/wHgb9ctxO4PubsZavp1
	Z/im+qvfhy+okwjO8M4oIcve+i62OJ3tKXiSjVDrVN2Ui724psQb+PSXLmj71oixfbgL313LEcP
	eoFQBjibUxjJQvKUq3QqB7VHbvk6nNHdFYsOtI2IyxOBqOMYKnhF6Klc8qW5C9ukC4jPW9Qs
X-Google-Smtp-Source: AGHT+IFucR+T9yvI79HtHogx0QhFDSYy7llkys4A780hO83hxrf2HV5i0axwF+kJgvPkACEuBN1BIw==
X-Received: by 2002:a17:90a:d00f:b0:31c:15d9:8a5 with SMTP id 98e67ed59e1d1-31c21d8adbfmr2332382a91.19.1751956866836;
        Mon, 07 Jul 2025 23:41:06 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31c21d2e948sm1323277a91.5.2025.07.07.23.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:41:06 -0700 (PDT)
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
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH net-next v2 1/3] dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac
Date: Tue,  8 Jul 2025 14:40:49 +0800
Message-ID: <20250708064052.507094-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708064052.507094-1-inochiama@gmail.com>
References: <20250708064052.507094-1-inochiama@gmail.com>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml |  4 ++++
 .../devicetree/bindings/net/sophgo,sg2044-dwmac.yaml  | 11 ++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 90b79283e228..4e3cbaa06229 100644
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
@@ -98,11 +99,13 @@ properties:
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
@@ -641,6 +644,7 @@ allOf:
                 - snps,dwmac-4.00
                 - snps,dwmac-4.10a
                 - snps,dwmac-4.20a
+                - snps,dwmac-5.00a
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index 8afbd9ebd73f..ce21979a2d9a 100644
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
2.50.0

