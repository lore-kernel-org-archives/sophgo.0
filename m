Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C182238A2B4
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 23:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768432779; cv=none; b=XXJ4r76bnoqY9re6EMA6c3VhCS1o6t/4rTEPqfwmzeW2C7lOU/x9gjOZ57tJ0Fh7yi/+FNxbPzT2pZG2WeVShHsP4yfem2q5bnRcAlpwfSyMWRkpfrUbDIVayajNRYGFjl4PPItZa7Jc3Z55MtieWGjXGaOLL3KZMPfjJ6qAYO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768432779; c=relaxed/simple;
	bh=GRHGbaEYkH2p07zeMPE0HCGLxwMkACKAV9BrwqSf0AQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c0iWrTO1FMfHtC4YdUVychpnEQ5xmv0gL0atLOKPkB08DFFHqIskrsgQlxgH1TaDihiyczktMTkrMIV8nTlNa7PAJCol84lbix3960nir7cdpWURcSeTr3jPtyPQfI8M4gcKFlhM3MIFgppRUZ31pCKUtsi4e/sxgDwrLVW3IP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=XnMLWN9H; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="XnMLWN9H"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a12ebe4b74so3709975ad.0
        for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768432770; x=1769037570; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBQmYJu+bnNuEEfQl+C2DO8NqnbkFmiGMm0xwrIIJJA=;
        b=XnMLWN9Hom4d8sxtgmaupdiDxRYTdLSPO4Mrct2xQI8+fGkUFaYokey6F3FjvC/dUR
         BH/hupY+RAi8lhs6jdpAH4IX8KCByZfzXBusxj7yMn+ZLkG64C0mp/70TpxNtyDIXfW0
         FFsC42jno0oKejwrFj0h3uSuLa8fO9UOhJ/LaWy4ahbW0SIFCAcrj6MN+rcQDDTMnT9r
         epq8AHESWXL7t+5Y7zE8I2g7y7teVPVfqS8HT5+O1dtr2jrGCG/IxjQKpVh66FaVdAGP
         TEvpjM7JtsWeGvSunwnT6fjCfjI+L0jjuOrZ0VWjSbd1vvL5ZxbZnv7CjJL7eJR4Ibgq
         wbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768432770; x=1769037570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fBQmYJu+bnNuEEfQl+C2DO8NqnbkFmiGMm0xwrIIJJA=;
        b=gSUpTOqqpAwFBfnC1FwAuY/2rEP4KcT3LS+5uZQxqjpl216H5WhWhh2C06WwX42/fI
         Rvf/sr32444RaibDVpBY9oTy5w0iclz1IpfaHbCFSbDRofVzoSAkUyT35fLxVVHp4zqf
         Ok+HFhcYMX5H1hjY2JbL9mKth3RAiPsyEj9IMf6GZ8eU/UCiATicE+ZLvgQ1sF4JCzS0
         v25Lj9Ya0B8jj7CR+VOFieWreSnTxc9J0DXpBgDPQL7YZ1Z1Dq+GUb5xxCuSAjxjPaqV
         48IN5BfYMfpwExvTiF1kgO9cXO6WK2ZKYc5jBTP7vMIYB7EfeVXUe9PFHAocjc/tDRMQ
         XLEA==
X-Forwarded-Encrypted: i=1; AJvYcCUUOMw2QGRwh8ROyjDTvVWqqokrKaTeIjaQS/10LrC1RGwjJztF/joAOd0qX1SfX8MB4QRLR/E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJx8RngAuV/fnsSnuPNTa0JN8E0ZUEe65R7fQQWSzYtWeb3hnw
	5KRHyF0bVPeXoUmm3HP9SyC6Pt90JbOUi2dbmq5B2vb/HQlwQ5qy5c1hq2e/lGfFsyEa7EKd+oA
	AJa8sP9I=
X-Gm-Gg: AY/fxX5dz4O00Im2HQJ9Ax8r/wN3un3aXiYf/JWKsB9Ls1i2Su6daj4FYu4lJp2u01s
	mGZGpNJcmpkuh7rhlowOpeKJPETJfG1qu7twRNbF2s3SaDwLzNNSEpVFCqfN6MeLyr0U+hBfLN6
	viTjflbYZR1JHwwU01CRWzDUhdObIgMkTWtG3oonujBujLKv3zWCJMgXQTpi7Do7cl49lOR0xrF
	+hCtqiwTFUrEzjtvLXhk42jF3rv0+CzaVl1tm1e+eYU6IVep/n6+qbx3xU1ozx/5zyyLGBvCJRT
	pdV0VLm+6PgLmLTHijW0V9eA+mHUbukatoXr5irXcXShXcu0YOtuuLh5hu7+tT0q17ebcgjCq6Q
	bLWoZhjSbWrstX+xpUNe644jAZXN+NjrSzwfBNQ8AWJCKr/Ak4K6RqbDfaETz49PerKNxlHasrR
	WbyOtsUhpSjkGQcLlT8KdVydNF8725HgUUksEvJ4HE2Hh7Ms3iGQ9U0w==
X-Received: by 2002:a17:902:ea08:b0:298:344:1229 with SMTP id d9443c01a7336-2a599e75d6dmr42928975ad.55.1768432769725;
        Wed, 14 Jan 2026 15:19:29 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d6csm238591755ad.64.2026.01.14.15.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 15:19:29 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 07:18:59 +0800
Subject: [PATCH v2 3/4] riscv: dts: sophgo: sg2044: Add "b" ISA extension
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-adding-b-dtsi-v2-3-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3

"b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
(Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
checking rule is now enforced, which requires that when zba, zbb, and zbs
are all specified, "b" must be added as well. Failing to do this will
cause dtbs_check schema check warnings.

According to uabi.rst, as a single-letter extension, "b" should be added
after "c" in canonical order.

Update sg2044-cpus.dtsi to conform to this rule.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: New patch, a split from the Patch 2 in v1. This patch is for
    Sophgo sg2044.
---
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++--------------
 1 file changed, 128 insertions(+), 128 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
index 523799a1a8b8..3135409c2149 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
@@ -24,10 +24,10 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache0>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -60,10 +60,10 @@ cpu1: cpu@1 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache0>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -96,10 +96,10 @@ cpu2: cpu@2 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache0>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -132,10 +132,10 @@ cpu3: cpu@3 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache0>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -168,10 +168,10 @@ cpu4: cpu@4 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache1>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -204,10 +204,10 @@ cpu5: cpu@5 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache1>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -240,10 +240,10 @@ cpu6: cpu@6 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache1>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -276,10 +276,10 @@ cpu7: cpu@7 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache1>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -312,10 +312,10 @@ cpu8: cpu@8 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache2>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -348,10 +348,10 @@ cpu9: cpu@9 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache2>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -384,10 +384,10 @@ cpu10: cpu@10 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache2>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -420,10 +420,10 @@ cpu11: cpu@11 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache2>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -456,10 +456,10 @@ cpu12: cpu@12 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache3>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -492,10 +492,10 @@ cpu13: cpu@13 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache3>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -528,10 +528,10 @@ cpu14: cpu@14 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache3>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -564,10 +564,10 @@ cpu15: cpu@15 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache3>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -600,10 +600,10 @@ cpu16: cpu@16 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache4>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -636,10 +636,10 @@ cpu17: cpu@17 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache4>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -672,10 +672,10 @@ cpu18: cpu@18 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache4>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -708,10 +708,10 @@ cpu19: cpu@19 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache4>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -744,10 +744,10 @@ cpu20: cpu@20 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache5>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -780,10 +780,10 @@ cpu21: cpu@21 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache5>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -816,10 +816,10 @@ cpu22: cpu@22 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache5>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -852,10 +852,10 @@ cpu23: cpu@23 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache5>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -888,10 +888,10 @@ cpu24: cpu@24 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache6>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -924,10 +924,10 @@ cpu25: cpu@25 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache6>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -960,10 +960,10 @@ cpu26: cpu@26 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache6>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -996,10 +996,10 @@ cpu27: cpu@27 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache6>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1032,10 +1032,10 @@ cpu28: cpu@28 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache7>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1068,10 +1068,10 @@ cpu29: cpu@29 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache7>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1104,10 +1104,10 @@ cpu30: cpu@30 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache7>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1140,10 +1140,10 @@ cpu31: cpu@31 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache7>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1176,10 +1176,10 @@ cpu32: cpu@32 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache8>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1212,10 +1212,10 @@ cpu33: cpu@33 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache8>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1248,10 +1248,10 @@ cpu34: cpu@34 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache8>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1284,10 +1284,10 @@ cpu35: cpu@35 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache8>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1320,10 +1320,10 @@ cpu36: cpu@36 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache9>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1356,10 +1356,10 @@ cpu37: cpu@37 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache9>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1392,10 +1392,10 @@ cpu38: cpu@38 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache9>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1428,10 +1428,10 @@ cpu39: cpu@39 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache9>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1464,10 +1464,10 @@ cpu40: cpu@40 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache10>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1500,10 +1500,10 @@ cpu41: cpu@41 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache10>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1536,10 +1536,10 @@ cpu42: cpu@42 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache10>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1572,10 +1572,10 @@ cpu43: cpu@43 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache10>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1608,10 +1608,10 @@ cpu44: cpu@44 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache11>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1644,10 +1644,10 @@ cpu45: cpu@45 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache11>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1680,10 +1680,10 @@ cpu46: cpu@46 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache11>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1716,10 +1716,10 @@ cpu47: cpu@47 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache11>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1752,10 +1752,10 @@ cpu48: cpu@48 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache12>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1788,10 +1788,10 @@ cpu49: cpu@49 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache12>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1824,10 +1824,10 @@ cpu50: cpu@50 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache12>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1860,10 +1860,10 @@ cpu51: cpu@51 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache12>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1896,10 +1896,10 @@ cpu52: cpu@52 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache13>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1932,10 +1932,10 @@ cpu53: cpu@53 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache13>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1968,10 +1968,10 @@ cpu54: cpu@54 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache13>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2004,10 +2004,10 @@ cpu55: cpu@55 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache13>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2040,10 +2040,10 @@ cpu56: cpu@56 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache14>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2076,10 +2076,10 @@ cpu57: cpu@57 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache14>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2112,10 +2112,10 @@ cpu58: cpu@58 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache14>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2148,10 +2148,10 @@ cpu59: cpu@59 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache14>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2184,10 +2184,10 @@ cpu60: cpu@60 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache15>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2220,10 +2220,10 @@ cpu61: cpu@61 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache15>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2256,10 +2256,10 @@ cpu62: cpu@62 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache15>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2292,10 +2292,10 @@ cpu63: cpu@63 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache15>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",

-- 
2.43.0

