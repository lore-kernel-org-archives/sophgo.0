Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C38214A81
	for <sophgo@lists.linux.dev>; Wed, 14 May 2025 15:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235798; cv=none; b=bVGb1D83t+9aNGpJURNpULidlv7DvC4/o57jCyiJt9QTgsFust9gNpMGGNcLpQGc3ydlKxl3Zhvj/O9/9l83U+hYlJWkyFEBmj5RXNhKbpP6AyNfFDsvMdzBkDtQGlExiLJktUo4l9C58+Y766BY2OY2JsqG9ONuCCMxwDNb1yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235798; c=relaxed/simple;
	bh=kQjQhE4o9s/LfOXlkmeinIXWtrbNV/gAXLMomZ6/PG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzNpojQx8Ay2/20G1ZQfV0ZZ2ayq08Il6gAS1rbF3WUwh+x7fsehEs6EQa3ryX7GIABUz7mNPtvBkxDP5t07PAHkBcAF0XF1PwUNpXLo0lkZ3VNFyOJ5J3Wdv9bSvFh+zkXGAspzU8H/XhS00+igRaG2GDtJIWkS1nXaC4tuMqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qc8GxsvP; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qc8GxsvP"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af908bb32fdso769267a12.1
        for <sophgo@lists.linux.dev>; Wed, 14 May 2025 08:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747235795; x=1747840595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSNshIEpt+vTNZ0iI7OJc3q9DGe0ixa+1zHMIDR3V6c=;
        b=Qc8GxsvPx3TWeOcsXYWpe6EU5QQ8YBopu0YdMBzGV7b+MPyXysXZ3ioyqt+uHdu2Uo
         +yuGt0R+i1xK/tZxJ5IljW/rfJAFcm6tUx1Toe6cEz7gn7z7rit0kcEJwvWqUqGXiDWk
         w8LSXpoaiOAEhjIP486ELIwKCESXyX8NFJmGI3jSVAeEiRwkSdqJr5OkAOhQPUJCebyD
         /wAqaIxOMpAjBoNvkvthp/f2FQwGYDqudEzLaBKkJyEOmaNy4yBFbQbsqhuqc2pzg9q6
         3DTLNYwftEtG9G7nzhMudyn8jFlhuIfunq1fGxSs99xuEXn6ATWEAHBjNg50N1HDQljY
         L1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235795; x=1747840595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSNshIEpt+vTNZ0iI7OJc3q9DGe0ixa+1zHMIDR3V6c=;
        b=gTrKjIrFKLxXCbEAiKEmJ17ufQu5F+7enUXyZpr3YoZkB21NRHjJh11/0yH0M8khyE
         ZunHtZB5oRSj+IJQrkSk85hIybfcn7+emskN1lAxH38n5Xgym0d/Cg9M/LpSc0O+YooW
         toA2GTZY4UKanbDgaaBcBYN9YpScTR6e26EQnTBgnp9vT3Iofg9bz8eYpIo8RDFeSBoV
         0Y26oVxsUOT30979Qkc8P26DLQwA1Zhai9X+BNw+VeeRab0raAE9aUH7LqfE2YUkAde0
         1h96fo1QxQH1UzTNxk+xKR2+fM4nAfIpQA71HoKkQoBJi8+AnOAxToYEVG9s9DOYgRrQ
         8RAg==
X-Forwarded-Encrypted: i=1; AJvYcCV3qbcay3o1UXgC6Cwi3NG6AInBl9ybbGKBKAAh9WCoRRy8KnWBjeocT8e3O36vzW4uUOCpoFQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7VqVD70iXh+7qdUFB0L/UW76Iybqivlnw5GRtsNARXmJy2atX
	y2SWEc3uAlMDr/Zs0ish188plcBI0gknv6zZH0BIakYWEsn0v8CZ
X-Gm-Gg: ASbGnctpzgt1ovamVwrNF9kDFBAEP/QHe/m2GM3Zq8VLacN1CfZhDfEHtm2Mgv5sV9V
	DYWr+uL/h3ioOrt7n2bLO9/t4Q7WCPdMqRbiqIT1pwsIfyPEx5fuGWr0wVNAAd72I2ReCSmlciM
	aGroPCAr+h4yzurjekcOGnm0/kJ3LCOrhFKeEFHGq30xMLF2P40lRDjy3VCOernMBJCK7V2pjSU
	NwEspn/TW+T6WQhjYcmZLZy5rIAIOeCB1he2tVwwUUpFEoYBWvfTdV7jFIMAK+iPPBk9Nlvnil0
	WQXHxJMuq0q9SDrhXbWrw8ZXWjU1ZtP7utwscARy2JuT3dmF9L4AwUms8V5hyA==
X-Google-Smtp-Source: AGHT+IF1o8jBmrhnpa1/qEJx34l0Eeelr8gGTDl0Wl9z0XMZh2PZTHOtD360cJa9S7hmGWNdbhjaSw==
X-Received: by 2002:a17:903:3c26:b0:215:58be:334e with SMTP id d9443c01a7336-23197f3877emr60300035ad.10.1747235794425;
        Wed, 14 May 2025 08:16:34 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc75468besm100576155ad.3.2025.05.14.08.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:16:34 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] riscv: dts: sophgo: add ziccrse for sg2042
Date: Wed, 14 May 2025 23:15:51 +0800
Message-ID: <158b561a96e12c1d45a6b96d2039e03448ebea62.1747235487.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1747235487.git.rabenda.cn@gmail.com>
References: <cover.1747235487.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sg2042 support Ziccrse ISA extension [1].

Link: https://lore.kernel.org/all/20241103145153.105097-12-alexghiti@rivosinc.com/ [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 320 ++++++++++++--------
 1 file changed, 192 insertions(+), 128 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
index dcc984965b6b..f483f62ab0c4 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
@@ -259,8 +259,9 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <0>;
 			i-cache-block-size = <64>;
@@ -285,8 +286,9 @@ cpu1: cpu@1 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <1>;
 			i-cache-block-size = <64>;
@@ -311,8 +313,9 @@ cpu2: cpu@2 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <2>;
 			i-cache-block-size = <64>;
@@ -337,8 +340,9 @@ cpu3: cpu@3 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <3>;
 			i-cache-block-size = <64>;
@@ -363,8 +367,9 @@ cpu4: cpu@4 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <4>;
 			i-cache-block-size = <64>;
@@ -389,8 +394,9 @@ cpu5: cpu@5 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <5>;
 			i-cache-block-size = <64>;
@@ -415,8 +421,9 @@ cpu6: cpu@6 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <6>;
 			i-cache-block-size = <64>;
@@ -441,8 +448,9 @@ cpu7: cpu@7 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <7>;
 			i-cache-block-size = <64>;
@@ -467,8 +475,9 @@ cpu8: cpu@8 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <8>;
 			i-cache-block-size = <64>;
@@ -493,8 +502,9 @@ cpu9: cpu@9 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <9>;
 			i-cache-block-size = <64>;
@@ -519,8 +529,9 @@ cpu10: cpu@10 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <10>;
 			i-cache-block-size = <64>;
@@ -545,8 +556,9 @@ cpu11: cpu@11 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <11>;
 			i-cache-block-size = <64>;
@@ -571,8 +583,9 @@ cpu12: cpu@12 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <12>;
 			i-cache-block-size = <64>;
@@ -597,8 +610,9 @@ cpu13: cpu@13 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <13>;
 			i-cache-block-size = <64>;
@@ -623,8 +637,9 @@ cpu14: cpu@14 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <14>;
 			i-cache-block-size = <64>;
@@ -649,8 +664,9 @@ cpu15: cpu@15 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <15>;
 			i-cache-block-size = <64>;
@@ -675,8 +691,9 @@ cpu16: cpu@16 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <16>;
 			i-cache-block-size = <64>;
@@ -701,8 +718,9 @@ cpu17: cpu@17 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <17>;
 			i-cache-block-size = <64>;
@@ -727,8 +745,9 @@ cpu18: cpu@18 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <18>;
 			i-cache-block-size = <64>;
@@ -753,8 +772,9 @@ cpu19: cpu@19 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <19>;
 			i-cache-block-size = <64>;
@@ -779,8 +799,9 @@ cpu20: cpu@20 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <20>;
 			i-cache-block-size = <64>;
@@ -805,8 +826,9 @@ cpu21: cpu@21 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <21>;
 			i-cache-block-size = <64>;
@@ -831,8 +853,9 @@ cpu22: cpu@22 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <22>;
 			i-cache-block-size = <64>;
@@ -857,8 +880,9 @@ cpu23: cpu@23 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <23>;
 			i-cache-block-size = <64>;
@@ -883,8 +907,9 @@ cpu24: cpu@24 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <24>;
 			i-cache-block-size = <64>;
@@ -909,8 +934,9 @@ cpu25: cpu@25 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <25>;
 			i-cache-block-size = <64>;
@@ -935,8 +961,9 @@ cpu26: cpu@26 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <26>;
 			i-cache-block-size = <64>;
@@ -961,8 +988,9 @@ cpu27: cpu@27 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <27>;
 			i-cache-block-size = <64>;
@@ -987,8 +1015,9 @@ cpu28: cpu@28 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <28>;
 			i-cache-block-size = <64>;
@@ -1013,8 +1042,9 @@ cpu29: cpu@29 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <29>;
 			i-cache-block-size = <64>;
@@ -1039,8 +1069,9 @@ cpu30: cpu@30 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <30>;
 			i-cache-block-size = <64>;
@@ -1065,8 +1096,9 @@ cpu31: cpu@31 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <31>;
 			i-cache-block-size = <64>;
@@ -1091,8 +1123,9 @@ cpu32: cpu@32 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <32>;
 			i-cache-block-size = <64>;
@@ -1117,8 +1150,9 @@ cpu33: cpu@33 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <33>;
 			i-cache-block-size = <64>;
@@ -1143,8 +1177,9 @@ cpu34: cpu@34 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <34>;
 			i-cache-block-size = <64>;
@@ -1169,8 +1204,9 @@ cpu35: cpu@35 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <35>;
 			i-cache-block-size = <64>;
@@ -1195,8 +1231,9 @@ cpu36: cpu@36 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <36>;
 			i-cache-block-size = <64>;
@@ -1221,8 +1258,9 @@ cpu37: cpu@37 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <37>;
 			i-cache-block-size = <64>;
@@ -1247,8 +1285,9 @@ cpu38: cpu@38 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <38>;
 			i-cache-block-size = <64>;
@@ -1273,8 +1312,9 @@ cpu39: cpu@39 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <39>;
 			i-cache-block-size = <64>;
@@ -1299,8 +1339,9 @@ cpu40: cpu@40 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <40>;
 			i-cache-block-size = <64>;
@@ -1325,8 +1366,9 @@ cpu41: cpu@41 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <41>;
 			i-cache-block-size = <64>;
@@ -1351,8 +1393,9 @@ cpu42: cpu@42 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <42>;
 			i-cache-block-size = <64>;
@@ -1377,8 +1420,9 @@ cpu43: cpu@43 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <43>;
 			i-cache-block-size = <64>;
@@ -1403,8 +1447,9 @@ cpu44: cpu@44 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <44>;
 			i-cache-block-size = <64>;
@@ -1429,8 +1474,9 @@ cpu45: cpu@45 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <45>;
 			i-cache-block-size = <64>;
@@ -1455,8 +1501,9 @@ cpu46: cpu@46 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <46>;
 			i-cache-block-size = <64>;
@@ -1481,8 +1528,9 @@ cpu47: cpu@47 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <47>;
 			i-cache-block-size = <64>;
@@ -1507,8 +1555,9 @@ cpu48: cpu@48 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <48>;
 			i-cache-block-size = <64>;
@@ -1533,8 +1582,9 @@ cpu49: cpu@49 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <49>;
 			i-cache-block-size = <64>;
@@ -1559,8 +1609,9 @@ cpu50: cpu@50 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <50>;
 			i-cache-block-size = <64>;
@@ -1585,8 +1636,9 @@ cpu51: cpu@51 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <51>;
 			i-cache-block-size = <64>;
@@ -1611,8 +1663,9 @@ cpu52: cpu@52 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <52>;
 			i-cache-block-size = <64>;
@@ -1637,8 +1690,9 @@ cpu53: cpu@53 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <53>;
 			i-cache-block-size = <64>;
@@ -1663,8 +1717,9 @@ cpu54: cpu@54 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <54>;
 			i-cache-block-size = <64>;
@@ -1689,8 +1744,9 @@ cpu55: cpu@55 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <55>;
 			i-cache-block-size = <64>;
@@ -1715,8 +1771,9 @@ cpu56: cpu@56 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <56>;
 			i-cache-block-size = <64>;
@@ -1741,8 +1798,9 @@ cpu57: cpu@57 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <57>;
 			i-cache-block-size = <64>;
@@ -1767,8 +1825,9 @@ cpu58: cpu@58 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <58>;
 			i-cache-block-size = <64>;
@@ -1793,8 +1852,9 @@ cpu59: cpu@59 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <59>;
 			i-cache-block-size = <64>;
@@ -1819,8 +1879,9 @@ cpu60: cpu@60 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <60>;
 			i-cache-block-size = <64>;
@@ -1845,8 +1906,9 @@ cpu61: cpu@61 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <61>;
 			i-cache-block-size = <64>;
@@ -1871,8 +1933,9 @@ cpu62: cpu@62 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <62>;
 			i-cache-block-size = <64>;
@@ -1897,8 +1960,9 @@ cpu63: cpu@63 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <63>;
 			i-cache-block-size = <64>;
-- 
2.47.2

