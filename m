Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED86137C37
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 01:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745976441; cv=none; b=Zz+3JfUSiEmB1Wk1ZiMh9jSuzWMQzc8Na8NuNl9u/tfOy+jfs+enJRRuv+DUuhkPtGJQThNaQgBzNOmdnIpqtmHp0pCimHVEyiq3TEzsB76AidGlcSIhlxKyUzYvSiGPE5R4XJghO6QnBnHpwU8652hgh5WM09m2X90/uSN1YTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745976441; c=relaxed/simple;
	bh=2b6fezA0gilfiSeHncEqwYlp53zZMto5w/gMbbLyOGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dKQ2a5RXm3Nliu/T/ghXtzVszvyakqigfry/yq7nFqoEjW5sTYyBrajYmrOTAf5m6oWT6kRTiO84Qg+1rCQa9aN68W0g8bbCceNSPEocmHqTSxMlUREz7Mm7B3bltBlGkfQ+R3y+smE8HATe1KGLZKS87n26xOw+mH/vX8E4c2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOeskVsn; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOeskVsn"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e8f43c1fa0so92632006d6.3
        for <sophgo@lists.linux.dev>; Tue, 29 Apr 2025 18:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745976438; x=1746581238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orpHQEMmNk+tEK2xMIKeEAE44ZnWvB5Dmosx1GmhpwY=;
        b=mOeskVsn8iHfdyNwBfreVaDhrdbbZo25+s8j+DjoyqNi7jo8Z5U5ecMHyjtjOXUGlk
         3ANLS3bwmywIgH9ayhgKNbrQH3M3MZBwWGS/tOswym8dupsnU/4gsNp4Fm8/oOV3+3rx
         rC4p5o0V3hB7RIfo73AZRFPQFh0+y72xpmQod71G5xaEZ57SY7dTiuVZgSU+2DiEz0Q+
         anA+Yk2cuCVrtAoEMwNo2evPku1QZ6wFGYivJZ6j1CHSG1RqWbsbSsnBG0mKzXD7oN9q
         wHVU6LpLT/L7eMRTjsFX8P/ooeAirXkoTxVQCIqbNjitHq1GIoDhj1o/7GccMf3PC/Vq
         yh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745976438; x=1746581238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orpHQEMmNk+tEK2xMIKeEAE44ZnWvB5Dmosx1GmhpwY=;
        b=bUHvGK8nam6FNnfrqLthsbyBswW8n8M6/4OkpQz9gtx+UtW7idFGz846t6DEPCWet9
         GJWKKYck2RxrHgpxCu44LkYu+tyeEhx1nth21qQL2V6IjRFD2QdS+ZliSG8wUhTBAZsD
         eL32QxIrvisp4zzikFYfGxprbLQuiBL2euPRI558jSL641JojwlMdgGPfZ+p5G6s45v4
         +H9dAp7XZPMf1t2hPCp7PYMCgTWxUeJJXZsR3i4yfW/ZCD9MsgbJinRrxDHLXBo9qZDD
         BXFEKYKrSAsm7P8pihZJCtwSfx9IkoXoy3pWRET/LeviNmn4lvs3KmUvMtQt7QWgY0w6
         guyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaed99S7YYDeeB4pbITH8/o+WEXmgE70+UV+010naIlO4YIn6LqR4l1OUd+CYedHYm6TJzckA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+eCuXlJ5oIYRYTSlm+SqaBHPMTRHsPzqb2VywKbrf0DvCRr3A
	BmK4oXMA87HO4m7KqWz9YchhSkMy4jmCz3YWgf4vxL5nULHIxt2o
X-Gm-Gg: ASbGncv7A0ZBPjSr5tFzS+jQgLH6J7sROUHIJ/uPxGdvkqAqEUMNt9rEMOodUyBmcWQ
	b+q/59rrpRbTT4VxOEuws6B8bo+0lB+MJlQg5VMZ5apShGhfAxNek1arnjFdNjnj7TXlL0KStKV
	LbLTv6rjd6UtSdAZqayXoVEJSmfyXABLplPpgfJ1gh1B2ibEs20UPr6dQNag5O0wwQ+2WrtVquX
	jv6T6b2Fi+Ab9mfAPkdIrRMml5Owm0y7xAcEivf1nyeFOYLBg2/E2Gvcuxc1DYgwXl7q1RUnqlE
	JDeh43yYPqSz/wwK
X-Google-Smtp-Source: AGHT+IG5DRNOVSoHk6dnbQr8qugQsnAj2sLbMuWUDrmOn3IKUQ4BY0+JJwN+xKvvekVcatvxNq51sQ==
X-Received: by 2002:a05:6214:21ea:b0:6f2:c88a:50c5 with SMTP id 6a1803df08f44-6f4fe116d0fmr17281516d6.32.1745976438475;
        Tue, 29 Apr 2025 18:27:18 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe85d875sm2414586d6.107.2025.04.29.18.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 18:27:18 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/4] riscv: dts: sophgo: Move riscv cpu definition to a separate file
Date: Wed, 30 Apr 2025 09:26:51 +0800
Message-ID: <20250430012654.235830-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430012654.235830-1-inochiama@gmail.com>
References: <20250430012654.235830-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As sg2000 and sg2002 can boot from an arm a53 core, it is not
suitable to left the riscv cpu definition in the common peripheral
header.

Move the riscv related device into a separate header file, so the
arm subsystem can reuse the common peripheral header.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi     |  1 +
 arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi | 36 +++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi     |  1 +
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi      | 29 -----------------
 arch/riscv/boot/dts/sophgo/sg2002.dtsi      |  1 +
 5 files changed, 39 insertions(+), 29 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index fc9e6b56790f..91bf4563e1f9 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
+#include "cv180x-cpus.dtsi"
 #include "cv18xx.dtsi"
 
 / {
diff --git a/arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi b/arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi
new file mode 100644
index 000000000000..93fd9e47a195
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+/ {
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <25000000>;
+
+		cpu0: cpu@0 {
+			compatible = "thead,c906", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <65536>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index fcea4376fb79..cc094b3f585f 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
+#include "cv180x-cpus.dtsi"
 #include "cv18xx.dtsi"
 #include "cv181x.dtsi"
 
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 805b694aa814..a4f957302094 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -12,35 +12,6 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	cpus: cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		timebase-frequency = <25000000>;
-
-		cpu0: cpu@0 {
-			compatible = "thead,c906", "riscv";
-			device_type = "cpu";
-			reg = <0>;
-			d-cache-block-size = <64>;
-			d-cache-sets = <512>;
-			d-cache-size = <65536>;
-			i-cache-block-size = <64>;
-			i-cache-sets = <128>;
-			i-cache-size = <32768>;
-			mmu-type = "riscv,sv39";
-			riscv,isa = "rv64imafdc";
-			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
-
-			cpu0_intc: interrupt-controller {
-				compatible = "riscv,cpu-intc";
-				interrupt-controller;
-				#interrupt-cells = <1>;
-			};
-		};
-	};
-
 	osc: oscillator {
 		compatible = "fixed-clock";
 		clock-output-names = "osc_25m";
diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
index df133831bd3e..6f02de9b0982 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-sg2002.h>
+#include "cv180x-cpus.dtsi"
 #include "cv18xx.dtsi"
 #include "cv181x.dtsi"
 
-- 
2.49.0

