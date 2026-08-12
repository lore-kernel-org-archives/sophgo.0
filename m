Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EC647012A
	for <sophgo@lists.linux.dev>; Wed, 12 Aug 2026 23:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577754; cv=none; b=TkoLlvbvuSpqWef4tbf9MUvMQfAYsykBmRNYKJFJM2GyaMbRK3L48h0GM/EGSiuTeqzwf4fjVrl0drHumsc/bqS/jz+mxoMoekRdFqLHgIRhZFbTl15oAOxrV2vSBVxuP/vNjuw0i/ua0VszjidQoH3PrueRXh+7z9XGmN0r8UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577754; c=relaxed/simple;
	bh=JFJH7C//XX+nXTj8WKFXkj5oheShheYfYJbVuEVStc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BoOjLcSGeNKgE7XycIPdki99QUGfoGmv+ybxjbRfXs3s+IqEEI+x18RTWIqRofHhfQ0K0vwjN+9FOvM7vyqb/3W6bW5z9x7AdSUCiSTuk6PyKLs4PLkjCqWfA4uvH2jMH1nsuHg6NBenV/tqv+ZXxoJvnhJD2/fZ8SeClxoJHzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OW2ozcwl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4SvvFFI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OW2ozcwl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4SvvFFI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLpvj1590759
	for <sophgo@lists.linux.dev>; Wed, 12 Aug 2026 23:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HHhkTSzGg8fGZeR2nysWtybyTGBSA6cLC5v47/KVEQE=; b=OW2ozcwlKq2+QVOP
	Mn4NeszFGx3NVqgpUEBtFOV0yeEPmjfBNzlvOBwz9N5O+dgM9x67vspSda9BzzZc
	0PzepfyaEQ4B9Yyut2Egn5tMriAH8cMR+2eUFhFoW5aL3qD/98vnYRPIgRvhA/gw
	lqbJ4klDB5m2mLQ+xiYw5MKosM3SBkAlZUsnY68F6kYYURoSPR0sgBlCsKtYc2Zp
	h0SG/UIrXgY2mXdfUBuhoIs2s12IoAHoEOOLnWcTgqub8asgxV3x0sdw9vRuylND
	WsCWuDj9puefl1TzpABPwOVuiZD4NlU4cHyd2Dq5CWEbDXwAox7F6H10LU4MgVSW
	p/wQeQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0sk42ncj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Wed, 12 Aug 2026 23:35:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d04908139bso20454775ad.2
        for <sophgo@lists.linux.dev>; Wed, 12 Aug 2026 16:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577749; x=1787182549; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHhkTSzGg8fGZeR2nysWtybyTGBSA6cLC5v47/KVEQE=;
        b=h4SvvFFI+SyTNNnl3FUi6sU/3XonOmlxhKWUXZgLE4qfujz8UL9qkvHxdXzMx3ds51
         N6eVmv+0u6qtqNwGJ8aY7MjWz48WlBADPMKm+3H8PO9MJX3Ki/qw2b3DrDatU1qFYKHJ
         fC45xjepMxWqxMhKIQwZBIFYv4DMkosxf7YsqvEdWGV9FTyeKOLlpMVwxycQ3I+HEJcN
         pKOzbrLF3Oz0RkUKSSiOYb4xYn7HOcQUVywM0PwpVrFyk5GtzTKVEzeFrIq0oKVQ9AUi
         gHRDyZb8vFsdA4e3NTBU/VwMyhJ0gzm/nJDFFaSMIeOYCy3lh1LDA1vg7Tauur2uY0dA
         RJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577749; x=1787182549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHhkTSzGg8fGZeR2nysWtybyTGBSA6cLC5v47/KVEQE=;
        b=joq75jVVwKaNJaIAJU8r09fVgmNaRkHC0i0G0i+tiHe9KeuD/ZaI6bWnE19X5dww+M
         F3Cw6H3vo4PxPjissfgNsdJ2QUqV5OhnJLV/4mMoiASzsZKozxbX0wjqjCzNFDbz4Qj9
         LttE1AeGa7T5hfeCNMlcSF3K3vSYbnq1KKCEWy4VM3dfNBGNPuFq9sERxfhMO8FG9+sl
         D4abnvytTuvi6iW1fNSEFU2qVnSQdi1Ltz6frsAqK4ZSSaKE1XRvifvzxOkvb+mzKIPO
         Vesd7jFijM4EJp5Us5ANV6GjtF+Lz2KMsV9pTTdp52kEFmoqQ3T3RrYl/g7nOS/0Gf2d
         tGnA==
X-Forwarded-Encrypted: i=1; AHgh+RpF7byLUwhJh8LXKRUdW8yJbAx+GfkvY5uML3cydzfqkC7gDiqt/tIsBvDvasx0XH/VIc5Ax98=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4DgvoYS206olE7p3+zjULh7CbZ9X3gspVeZ0Ohjze1YgfiOqB
	HvN76l5ZcuIqB80cDgWG/d7OgLshJq1M7tpOJXuvp8ariV1wN8JH7yaKAMVkd8bmk5/cHFnaS/D
	+jQw0ImtSJxCXmOeBTLwWhgyB1jV1dcSikj7MeD+CLM7Q0LNUTShxvmRw0ao=
X-Gm-Gg: AR+sD11YR6z76eZNE4Kurf47GheH4Bzh3RrwljmEZ7VSLOPTZi/AjvOyrYiMtMl3ILp
	6f5uDCkK+/PX9uWoK6dqeCDYpsKyogzHG2Spf4Q3+iBLU7DZLTUpDEkuGzWb6Dq/r8Ezo/mdPEi
	C6bzhDrfMjQABMVLZ+k02VZ+BRWnAP6gP6qi6OLNxCMeiflaFkJKMXMNiJb0gb1CIeZRVWWqMMN
	b9+PS19+g38guciS+Vpv6iXre0qQtFuuPDBjZ+iVbbZRpnNsxk39DDOq1ACAQ7+DPjQl2XbmVeL
	eotFK+RQgbTekqE6whtmb0MiDl6EgqAio86/h3I/YrUKYMKjZ3Wj4GDi5+RacQ==
X-Received: by 2002:a17:902:d584:b0:2cc:9179:335 with SMTP id d9443c01a7336-2d37d88c170mr18814635ad.8.1786577749166;
        Wed, 12 Aug 2026 16:35:49 -0700 (PDT)
X-Received: by 2002:a17:902:d584:b0:2cc:9179:335 with SMTP id d9443c01a7336-2d37d88c170mr18813985ad.8.1786577748593;
        Wed, 12 Aug 2026 16:35:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:48 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:53 -0400
Subject: [PATCH v6 07/11] riscv: dts: sophgo: sg2044: Add Zic64b ISA
 extension
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-7-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=28782;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=JFJH7C//XX+nXTj8WKFXkj5oheShheYfYJbVuEVStc4=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZlGP5gTjxNOfHzSk+P5WzXm9QepN1SWFGF7DhX8WT
 6tfd3x3RykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAEyk/TnD/4JQGa+lj81MZCpC
 Jn+4E9jdeKfgmpuxygTRFbWbdERMrjEydK5N2dYmcNHFo1vz7ML4bR17J/92ve2y+FznlwUT3s1
 N5AMA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: kIty3JXdGw5f7g7cX484OPda7qBoB-Rn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX5PrWTv2Q8Hhh
 xTEqpxp7e8efmzhNv9KXarN6l7Gpe9rAbVF+oxWqsRv6xw5/Qcl7wfTaNYsjtpD6rjV6avlQ+yY
 bqOm3n27T2RZHtKlzoex3S6hbUNaC8ruQLukJCloW2bu16q0atDkWoX5W4YbPbtoh0MIq7iEz+5
 swr0W8zvxWog2Zs1avThKcQ35eeJRB8XcWE+Tmwi2e7d4SIdTCBUHW3JnnfyTIKo5/7aLzDTFxY
 OelCS/NXIXXMrBvf5AL3usN/PiEpJbZ3nLCsnc229A1kPhA7srJEIMwUeKbH3pM7q1ykLWT3tk6
 rU23w0hRjJh4mpu3slf99NsodCC9W9aCuZuKF9SNwAlpaRz4nepfz083PQMuxkLJMNEx+m8KEAl
 4KI0I4sRVZARAYcRJQm4HcO62g78DB4vHfZjvbw6anHQ7mtcT8aVLvzOgvlMQoBFiYyjCjEiDG5
 uLv9xtSn2E/Km/qXWSw==
X-Authority-Analysis: v=2.4 cv=E8n9Y6dl c=1 sm=1 tr=0 ts=6a7d0356 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=WzeAf3B23z0EryTBMFwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX5GXEjsJcTWde
 9MQkjaGs6qrlc2ZS58cEMwqmXaZ9r2/jo/3ibbgh6Sr0oYYPaP8EWfjaPCE3RNEdcwsyKe9w7qI
 CoeMwdQM64p6c3nejl6r8g6/SqtLcfA=
X-Proofpoint-ORIG-GUID: kIty3JXdGw5f7g7cX484OPda7qBoB-Rn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190

The SG2044 cores have 64-byte cache blocks, described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b.  Declare it in
each core's riscv,isa-extensions.

Acked-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: No change.
v5: No change.
v4: Add Inochi Amaoto's Acked-by.
v3: New patch.
---
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 128 ++++++++++++++--------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
index f66a382c95bd..5943407020e3 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
@@ -31,7 +31,7 @@ cpu0: cpu@0 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -67,7 +67,7 @@ cpu1: cpu@1 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -103,7 +103,7 @@ cpu2: cpu@2 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -139,7 +139,7 @@ cpu3: cpu@3 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -175,7 +175,7 @@ cpu4: cpu@4 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -211,7 +211,7 @@ cpu5: cpu@5 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -247,7 +247,7 @@ cpu6: cpu@6 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -283,7 +283,7 @@ cpu7: cpu@7 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -319,7 +319,7 @@ cpu8: cpu@8 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -355,7 +355,7 @@ cpu9: cpu@9 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -391,7 +391,7 @@ cpu10: cpu@a {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -427,7 +427,7 @@ cpu11: cpu@b {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -463,7 +463,7 @@ cpu12: cpu@c {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -499,7 +499,7 @@ cpu13: cpu@d {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -535,7 +535,7 @@ cpu14: cpu@e {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -571,7 +571,7 @@ cpu15: cpu@f {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -607,7 +607,7 @@ cpu16: cpu@10 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -643,7 +643,7 @@ cpu17: cpu@11 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -679,7 +679,7 @@ cpu18: cpu@12 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -715,7 +715,7 @@ cpu19: cpu@13 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -751,7 +751,7 @@ cpu20: cpu@14 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -787,7 +787,7 @@ cpu21: cpu@15 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -823,7 +823,7 @@ cpu22: cpu@16 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -859,7 +859,7 @@ cpu23: cpu@17 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -895,7 +895,7 @@ cpu24: cpu@18 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -931,7 +931,7 @@ cpu25: cpu@19 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -967,7 +967,7 @@ cpu26: cpu@1a {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1003,7 +1003,7 @@ cpu27: cpu@1b {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1039,7 +1039,7 @@ cpu28: cpu@1c {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1075,7 +1075,7 @@ cpu29: cpu@1d {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1111,7 +1111,7 @@ cpu30: cpu@1e {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1147,7 +1147,7 @@ cpu31: cpu@1f {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1183,7 +1183,7 @@ cpu32: cpu@20 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1219,7 +1219,7 @@ cpu33: cpu@21 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1255,7 +1255,7 @@ cpu34: cpu@22 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1291,7 +1291,7 @@ cpu35: cpu@23 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1327,7 +1327,7 @@ cpu36: cpu@24 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1363,7 +1363,7 @@ cpu37: cpu@25 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1399,7 +1399,7 @@ cpu38: cpu@26 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1435,7 +1435,7 @@ cpu39: cpu@27 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1471,7 +1471,7 @@ cpu40: cpu@28 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1507,7 +1507,7 @@ cpu41: cpu@29 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1543,7 +1543,7 @@ cpu42: cpu@2a {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1579,7 +1579,7 @@ cpu43: cpu@2b {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1615,7 +1615,7 @@ cpu44: cpu@2c {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1651,7 +1651,7 @@ cpu45: cpu@2d {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1687,7 +1687,7 @@ cpu46: cpu@2e {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1723,7 +1723,7 @@ cpu47: cpu@2f {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1759,7 +1759,7 @@ cpu48: cpu@30 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1795,7 +1795,7 @@ cpu49: cpu@31 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1831,7 +1831,7 @@ cpu50: cpu@32 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1867,7 +1867,7 @@ cpu51: cpu@33 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1903,7 +1903,7 @@ cpu52: cpu@34 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1939,7 +1939,7 @@ cpu53: cpu@35 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1975,7 +1975,7 @@ cpu54: cpu@36 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2011,7 +2011,7 @@ cpu55: cpu@37 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2047,7 +2047,7 @@ cpu56: cpu@38 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2083,7 +2083,7 @@ cpu57: cpu@39 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2119,7 +2119,7 @@ cpu58: cpu@3a {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2155,7 +2155,7 @@ cpu59: cpu@3b {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2191,7 +2191,7 @@ cpu60: cpu@3c {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2227,7 +2227,7 @@ cpu61: cpu@3d {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2263,7 +2263,7 @@ cpu62: cpu@3e {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2299,7 +2299,7 @@ cpu63: cpu@3f {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",

-- 
2.43.0

