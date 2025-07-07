Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F514230D1E
	for <sophgo@lists.linux.dev>; Mon,  7 Jul 2025 03:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751858136; cv=none; b=UaU3lm+Pf1M6lUhWmcArqK0myHY/e7Y3RTAFp8XfC1iAmppb7UkdVSEZiVckcltifJtXMkkJ20gUy85HXsOg7KrF3Aa3jWtc5tyJWuInWTqvU7H0dRb3geDrBW3+TXu51yvanv/Yw7S/VyNEB4eAI89T563vxUaFhj04qPWWoZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751858136; c=relaxed/simple;
	bh=ten3rYhvI2OuGI5f1aO64u6cScpV7aDNY3UW44unFtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZQjZF54nh3bxqGwMbyx9Dws7l6tbl+pfk4OcpYBRFR0KtxKJHQldydArQXxiQrUMlUOg9aHh50HRR4CDfmoHv9/NSDm8ywgsKUBRSGQE1nZiZGEcUkL6K6dyLjWSkEWh7e/YHEz9MpT3iBN8fyRSxlhOVEeArZnlaZ0jWYJfmH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRyl4b7Z; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRyl4b7Z"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso2347466a91.3
        for <sophgo@lists.linux.dev>; Sun, 06 Jul 2025 20:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751858133; x=1752462933; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JgHuIQzRjbIGIw97Rf0Y5kwsfcFv4NN7YtxkMOdOJDQ=;
        b=NRyl4b7ZgBLYyEy86yTFQruanGtvajejgmJRl+fOq1+BMkBPMCoZ2olXeTsg2Vdh0p
         9WLNNKQkhXPO6vb2M5VbZ2Znc176xGiU4Pjlf/CM4mGTD7ioAL9MftipEv0BxGuvuDLf
         QsmCDUy2LHVl93y71YmH1ND0gk+gblF3HVTA90a43YNBaHSL0Z4GgpkUox2GX8dNT4Qn
         VhFUGqieR8e8woHBqgxjpG/nfRphON1qVHoqAKZrQiI68fLwntFVScyGscu4Z6NURNs+
         8JLBWc+CKJ5gyJP3K+FQ7EDalvstgZSRfoliycS6YYpad6IdVOn7FBwthUgoRzUW6M0O
         vYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751858133; x=1752462933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgHuIQzRjbIGIw97Rf0Y5kwsfcFv4NN7YtxkMOdOJDQ=;
        b=Z4oenKF1ExWC+FVQPFpnW9wLjRrbbyFKH+QpcTH1XRvn0hPBLi68Rfl65kUpG2SYdS
         XV05/CauHyFbIShcgh7hdaFekVlyqHdyqzsBMlRX1TrOcvq5u6kqUktlZtBZfWOZSBaF
         95qcebxe1aKfV6VUoQ1NxCIscm4l7ahq+a6MQfcI8nX6ZmGeSSTThyEWo+vho3jgsHrn
         rROde9bHIHYGprLEZECL+rCyLKmZ69BsEY7NRoWXFN80fovifUCW4R4YV49Es6Knc+6D
         uFkLGaIrBYlKv/TRnhAXDX25VK51yQavCUfBFTnWnvG9B84cHQgiGlq4ZnHL5ByQd+Qy
         nVdA==
X-Forwarded-Encrypted: i=1; AJvYcCVXPBspheLbdqKdY2FoaTeZUBFmojwP9z2Fx6R4gWZIvsMF6d0PT4bkW4WMkrs369yEUe2Tg6g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoBODaJnp9vxgk5rGlFuMS7l5fNS5FoT72UVe4y2XrYhvyU6Oq
	dHuJPfMfAwFsNO1utzepPmLOImnm0fTVJGtJYLcbJ44HIkpkMduIEaNV
X-Gm-Gg: ASbGncu5fjjaYYotbc/ZGjWblNCHO8SiWNbFdfoyRLJVpOMj3zkg/I49j6w9nzlP44F
	ePkNOSrAPUH1Cx1uqjqnUBSsfiL4IdPHLQA/mWUfECYTW3jVpTMErX3kU4LUHvijR1xTyGc9Evc
	n+1IdFOUP9nSBElBtSX3aS6e94Ea52A+e8m77YQm2Q/b9C/lGqGUYkuJquj7ui7u56OQuscG58g
	hOFbGLdRQKcjXWeithktaCRXpHLWHisp71Wu8BYkdq+0sUNn090z0fQZ0cVdkVvYeg/BJUHSSBy
	TC7odTk/qdlYC6VxZUChDvuXLYvjxH3Nr5tKJRKFs7mDMKufEaaygjVNmZqeXHw12RDZjm4M
X-Google-Smtp-Source: AGHT+IGXz4bB9fC0ERMdWP3sqXc37lcw/itXqrImuUxIiatFHgAm22uKTwWtbMW3rqXMQWhe16XmGg==
X-Received: by 2002:a17:90b:2e84:b0:313:279d:665c with SMTP id 98e67ed59e1d1-31aba822176mr11446220a91.7.1751858132780;
        Sun, 06 Jul 2025 20:15:32 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaaf5ac85sm7579800a91.40.2025.07.06.20.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 20:15:32 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: sophgo: sg2044: add ziccrse extension
Date: Mon,  7 Jul 2025 11:15:18 +0800
Message-ID: <0889174f2e013e095b94940614f4a0a6e614b09c.1751858054.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sg2044 support ziccrse extension.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 128 ++++++++++----------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
index 2a4267078ce6..1f31bec58a93 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
@@ -32,7 +32,7 @@ cpu0: cpu@0 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -67,7 +67,7 @@ cpu1: cpu@1 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -102,7 +102,7 @@ cpu2: cpu@2 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -137,7 +137,7 @@ cpu3: cpu@3 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -172,7 +172,7 @@ cpu4: cpu@4 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -207,7 +207,7 @@ cpu5: cpu@5 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -242,7 +242,7 @@ cpu6: cpu@6 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -277,7 +277,7 @@ cpu7: cpu@7 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -312,7 +312,7 @@ cpu8: cpu@8 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -347,7 +347,7 @@ cpu9: cpu@9 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -382,7 +382,7 @@ cpu10: cpu@10 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -417,7 +417,7 @@ cpu11: cpu@11 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -452,7 +452,7 @@ cpu12: cpu@12 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -487,7 +487,7 @@ cpu13: cpu@13 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -522,7 +522,7 @@ cpu14: cpu@14 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -557,7 +557,7 @@ cpu15: cpu@15 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -592,7 +592,7 @@ cpu16: cpu@16 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -627,7 +627,7 @@ cpu17: cpu@17 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -662,7 +662,7 @@ cpu18: cpu@18 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -697,7 +697,7 @@ cpu19: cpu@19 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -732,7 +732,7 @@ cpu20: cpu@20 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -767,7 +767,7 @@ cpu21: cpu@21 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -802,7 +802,7 @@ cpu22: cpu@22 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -837,7 +837,7 @@ cpu23: cpu@23 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -872,7 +872,7 @@ cpu24: cpu@24 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -907,7 +907,7 @@ cpu25: cpu@25 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -942,7 +942,7 @@ cpu26: cpu@26 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -977,7 +977,7 @@ cpu27: cpu@27 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1012,7 +1012,7 @@ cpu28: cpu@28 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1047,7 +1047,7 @@ cpu29: cpu@29 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1082,7 +1082,7 @@ cpu30: cpu@30 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1117,7 +1117,7 @@ cpu31: cpu@31 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1152,7 +1152,7 @@ cpu32: cpu@32 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1187,7 +1187,7 @@ cpu33: cpu@33 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1222,7 +1222,7 @@ cpu34: cpu@34 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1257,7 +1257,7 @@ cpu35: cpu@35 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1292,7 +1292,7 @@ cpu36: cpu@36 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1327,7 +1327,7 @@ cpu37: cpu@37 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1362,7 +1362,7 @@ cpu38: cpu@38 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1397,7 +1397,7 @@ cpu39: cpu@39 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1432,7 +1432,7 @@ cpu40: cpu@40 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1467,7 +1467,7 @@ cpu41: cpu@41 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1502,7 +1502,7 @@ cpu42: cpu@42 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1537,7 +1537,7 @@ cpu43: cpu@43 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1572,7 +1572,7 @@ cpu44: cpu@44 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1607,7 +1607,7 @@ cpu45: cpu@45 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1642,7 +1642,7 @@ cpu46: cpu@46 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1677,7 +1677,7 @@ cpu47: cpu@47 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1712,7 +1712,7 @@ cpu48: cpu@48 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1747,7 +1747,7 @@ cpu49: cpu@49 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1782,7 +1782,7 @@ cpu50: cpu@50 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1817,7 +1817,7 @@ cpu51: cpu@51 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1852,7 +1852,7 @@ cpu52: cpu@52 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1887,7 +1887,7 @@ cpu53: cpu@53 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1922,7 +1922,7 @@ cpu54: cpu@54 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1957,7 +1957,7 @@ cpu55: cpu@55 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1992,7 +1992,7 @@ cpu56: cpu@56 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -2027,7 +2027,7 @@ cpu57: cpu@57 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -2062,7 +2062,7 @@ cpu58: cpu@58 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -2097,7 +2097,7 @@ cpu59: cpu@59 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -2132,7 +2132,7 @@ cpu60: cpu@60 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -2167,7 +2167,7 @@ cpu61: cpu@61 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -2202,7 +2202,7 @@ cpu62: cpu@62 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -2237,7 +2237,7 @@ cpu63: cpu@63 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
-- 
2.47.2

