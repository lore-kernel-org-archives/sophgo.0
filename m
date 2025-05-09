Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68D02620EE
	for <sophgo@lists.linux.dev>; Fri,  9 May 2025 22:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828718; cv=none; b=DcAvWu2i/9La/OuwjoJiYRICAnJXTyZvrBuPIh+b3esEM3semUK4mbxdIF0UtaFPLZ+SIatRW0FPWx+nvukuIavE4fwI6YbtnjCQrlid0in+eDfXAPXAkNoW/QaA9EAy4/pZO8HxI6vOVm6B1NGZ8FmtjKXD33zV/LC3WsJRAHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828718; c=relaxed/simple;
	bh=13ZMRinSaGZUoz2zdP2/0v7JmWvtu+M1b4IF09cyBHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CsBNO3xaypthHWL8Nfmt+tyIT7hEKE4li/IrwslGWEXFGmLm5LUqwMSxVVmu03CuZcUrL1AMsrcaf09mXis1IMBl0JA+2b9fO7zAQz8gWJf9diX59gSSH0wlth9XWoQU9PpfkkEZm85eDtnl57zYBnxp+FAElbv7iTv0WJyfrdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cl9Kf8AA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cl9Kf8AA"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22fa414c478so14475085ad.0
        for <sophgo@lists.linux.dev>; Fri, 09 May 2025 15:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746828716; x=1747433516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUS1YFvJ6hvPCXrtWui4UHsx4De15MSF+RQ56vxVSFo=;
        b=Cl9Kf8AAW+RHN3Z0o4cVmxO4L5IIB+b5Y0qMMVBvP3rkBPODbeAZMqODuZZibNS9mg
         alVfxsP14GWLclCt0lk/otTl4QjDdcvnc0B9LMAwmam9a8gVP9z2oOW1d+7HabLeJpf4
         IGcu4Zc3Cq059WK3jGXDebYjliPsEt84c3GqNkjqBc8kKMvxuX+4YMFqT7HzN6olWFbB
         oNhk3bjb3P+3HqKB2Ece0Wa2Hih1leqQyaZh/uRFj1uvhtgR4q56/LYSmRo1+Rf1Tqt8
         aAS2cZerDk8Ug386gu+/KJV5l+FhCkuwOIKRNlf8LOW/GQAmzmixju4vM5HnC2SZP85T
         h5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746828716; x=1747433516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUS1YFvJ6hvPCXrtWui4UHsx4De15MSF+RQ56vxVSFo=;
        b=oyTT2avqnhhz/wvQrDj71irBHt7WMZ3ROfoRSdI6ADEKejMgy1WP1hWOIi/D1k8XV0
         cSGhVAKfF7tYbK8oxJuENLuMO8eHk11YIEo0f8JJC3s0ZkMUOKbUa7uFZ1GF1fibQVYO
         AIbRiHVo2tHLkunkVQuD23mlnUeg5yMhQVZU3g6tyo0Y92Wmv6Z4Pu2W0B4Qmikkup21
         r88UsgNp4LLEfyGeKW7r6KXqDxszTsJ3A1DB/uuVwa4klADFeeeoyM+RfU0zBVETNXKi
         YYPwb4yIbl6KLmWv5UHj+R5Zd2/fb42WApD0Exf9PFjUdba936YKYnr8JNb6XxkZyOcN
         ssOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXofnYT7V3L2UKV1mNfju9C/mWBBuUpdoqSJ5uusPbXfIU1j4W3pkKFNgplrSK6jYyUSFjQ5gM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzAMcBNXRR3Ebx8GY2uincprUksPYEp3veja4+QDsgr10Hu6vP
	Ync5bnVqu1GNUwojxV022QHZZw9Lla2ozY8SVqOChojXzUuZeX/q
X-Gm-Gg: ASbGnctzEI3a6+cdWwOaSbLNNve9dudZtz0EabqSwuJg5NPpXn12go5tEjmudnjuiMP
	kDyJ7IHgmo8MPE376hNSlnvknIPVNn608UnE4CNPZpoqShy1j5Yal5lvG7eSAw/zAkBL4G0BaBl
	bH8OUDuIMu8Dy6Lz4yLvvP0YSMCc6ZTrEnA1FUXGdf+2Y239NZw7DGoXBWaTKTlRySmf8QMJj10
	pGqfDV8O1a+0Iv4mG2nnFT9CS75fP5TF47xbMMq5hM5jadbqRStiTkDwe7wI2BLNPm957z6+45z
	iogHKl07un68tVtkk0STEinQulNTZYLcT18ehAcBiVJ6bhnsIIxZDgW4cIObSg==
X-Google-Smtp-Source: AGHT+IHmod3QsMuA+oW7NBamoMGQXZj88PaaD66TsH6K3kv5QFMyvfzpRvA8C0b9qoKOgZoBPCu6kg==
X-Received: by 2002:a17:902:e492:b0:22e:39f8:61fa with SMTP id d9443c01a7336-22fc918875dmr61388185ad.34.1746828715320;
        Fri, 09 May 2025 15:11:55 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7b2a004sm22510225ad.106.2025.05.09.15.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:11:54 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
Date: Sat, 10 May 2025 06:11:22 +0800
Message-ID: <af839bc200637e4eae1cb327c95ac98c82bccd52.1746828006.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746828006.git.rabenda.cn@gmail.com>
References: <cover.1746828006.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sg2042 SoCs support xtheadvector so it can be included in the
devicetree. Also include vlenb for the cpu.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 192 +++++++++++++-------
 1 file changed, 128 insertions(+), 64 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
index b136b6c4128c..927e0260acbd 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
@@ -260,7 +260,8 @@ cpu0: cpu@0 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <0>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -285,7 +286,8 @@ cpu1: cpu@1 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <1>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -310,7 +312,8 @@ cpu2: cpu@2 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <2>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -335,7 +338,8 @@ cpu3: cpu@3 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <3>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -360,7 +364,8 @@ cpu4: cpu@4 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <4>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -385,7 +390,8 @@ cpu5: cpu@5 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <5>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -410,7 +416,8 @@ cpu6: cpu@6 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <6>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -435,7 +442,8 @@ cpu7: cpu@7 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <7>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -460,7 +468,8 @@ cpu8: cpu@8 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <8>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -485,7 +494,8 @@ cpu9: cpu@9 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <9>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -510,7 +520,8 @@ cpu10: cpu@10 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <10>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -535,7 +546,8 @@ cpu11: cpu@11 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <11>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -560,7 +572,8 @@ cpu12: cpu@12 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <12>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -585,7 +598,8 @@ cpu13: cpu@13 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <13>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -610,7 +624,8 @@ cpu14: cpu@14 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <14>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -635,7 +650,8 @@ cpu15: cpu@15 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <15>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -660,7 +676,8 @@ cpu16: cpu@16 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <16>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -685,7 +702,8 @@ cpu17: cpu@17 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <17>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -710,7 +728,8 @@ cpu18: cpu@18 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <18>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -735,7 +754,8 @@ cpu19: cpu@19 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <19>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -760,7 +780,8 @@ cpu20: cpu@20 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <20>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -785,7 +806,8 @@ cpu21: cpu@21 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <21>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -810,7 +832,8 @@ cpu22: cpu@22 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <22>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -835,7 +858,8 @@ cpu23: cpu@23 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <23>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -860,7 +884,8 @@ cpu24: cpu@24 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <24>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -885,7 +910,8 @@ cpu25: cpu@25 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <25>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -910,7 +936,8 @@ cpu26: cpu@26 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <26>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -935,7 +962,8 @@ cpu27: cpu@27 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <27>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -960,7 +988,8 @@ cpu28: cpu@28 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <28>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -985,7 +1014,8 @@ cpu29: cpu@29 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <29>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1010,7 +1040,8 @@ cpu30: cpu@30 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <30>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1035,7 +1066,8 @@ cpu31: cpu@31 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <31>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1060,7 +1092,8 @@ cpu32: cpu@32 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <32>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1085,7 +1118,8 @@ cpu33: cpu@33 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <33>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1110,7 +1144,8 @@ cpu34: cpu@34 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <34>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1135,7 +1170,8 @@ cpu35: cpu@35 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <35>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1160,7 +1196,8 @@ cpu36: cpu@36 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <36>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1185,7 +1222,8 @@ cpu37: cpu@37 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <37>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1210,7 +1248,8 @@ cpu38: cpu@38 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <38>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1235,7 +1274,8 @@ cpu39: cpu@39 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <39>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1260,7 +1300,8 @@ cpu40: cpu@40 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <40>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1285,7 +1326,8 @@ cpu41: cpu@41 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <41>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1310,7 +1352,8 @@ cpu42: cpu@42 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <42>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1335,7 +1378,8 @@ cpu43: cpu@43 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <43>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1360,7 +1404,8 @@ cpu44: cpu@44 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <44>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1385,7 +1430,8 @@ cpu45: cpu@45 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <45>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1410,7 +1456,8 @@ cpu46: cpu@46 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <46>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1435,7 +1482,8 @@ cpu47: cpu@47 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <47>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1460,7 +1508,8 @@ cpu48: cpu@48 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <48>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1485,7 +1534,8 @@ cpu49: cpu@49 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <49>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1510,7 +1560,8 @@ cpu50: cpu@50 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <50>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1535,7 +1586,8 @@ cpu51: cpu@51 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <51>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1560,7 +1612,8 @@ cpu52: cpu@52 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <52>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1585,7 +1638,8 @@ cpu53: cpu@53 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <53>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1610,7 +1664,8 @@ cpu54: cpu@54 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <54>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1635,7 +1690,8 @@ cpu55: cpu@55 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <55>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1660,7 +1716,8 @@ cpu56: cpu@56 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <56>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1685,7 +1742,8 @@ cpu57: cpu@57 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <57>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1710,7 +1768,8 @@ cpu58: cpu@58 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <58>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1735,7 +1794,8 @@ cpu59: cpu@59 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <59>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1760,7 +1820,8 @@ cpu60: cpu@60 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <60>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1785,7 +1846,8 @@ cpu61: cpu@61 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <61>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1810,7 +1872,8 @@ cpu62: cpu@62 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <62>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1835,7 +1898,8 @@ cpu63: cpu@63 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			reg = <63>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
-- 
2.47.2

