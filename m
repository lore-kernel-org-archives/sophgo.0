Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68AF431E6B
	for <sophgo@lists.linux.dev>; Wed, 12 Aug 2026 23:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577715; cv=none; b=pABBnPYrb9ONDqOsy87Fb8190QCHHQn7Zwjyk/CG7m0k8+acS5MVXwtZ6TVvsILA39OqYfHnEWbOIzJe61PaJhr7ajTyzcPIjE5XN8T4y/UTTlxVvXHKl6+EwH+VryVWOhdwh6W/I1N4h7beBqpqcG6AWaKVoqzFgOaQfjqrjF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577715; c=relaxed/simple;
	bh=pMTIzY1h407OmP6ZGR17M43SvczEQJjzPSrXyQZ3aK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FfBw34hEmtwZz+C6Tz3G68wwbSSQ09eyIGiDf0W1Tq8I8kCzbfIIdfyVp5k1Ru8ME5a4jQfi+sse+7il+rZL6dXPK9Pd/kz3Nju98IUjHQiEHvdE/sS4/affdpW9fecAtB6SktHva61FYyd55SMUUzMF0q2non4k4LR4fUhU2WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEe3HAd2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TmuQyL2g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEe3HAd2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TmuQyL2g"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNMYYY944237
	for <sophgo@lists.linux.dev>; Wed, 12 Aug 2026 23:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1LjGLBPhCkN6fNBzzMLJks+FhS/j60EJGyFCmImsGY=; b=KEe3HAd2iRmogojt
	qIG7t5EjJHoNXMfBlQfiN4Ma/G/JdIrIsfLB13rA1AGcwrxLwVIkUbovqK9CPFSR
	kO0K1rGAPRUKcfjZw8RiRN6PGXzFaXGWft0LD8VMXRNjp2g3gYtLIZENckhuegF8
	WHkxOeRMNDV9EjymqBjnBNRH7goLXoL6UJhbHEdcti1et5+clqUU9hrJaw44UrwT
	swX+wiPjdc1RdIrq1BRdUFDXvPjJqjonmjeMBivSFOsEshgbL1xbrK5IIyfbEuyd
	3T6EKxUS53QDFUim7o8Rtt79HhUHPMZlftVQaLZ53mwnB4a4S+6T+2Vjk6yOP7My
	Xb8sOA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0xx1rtqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Wed, 12 Aug 2026 23:35:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so3223705ad.3
        for <sophgo@lists.linux.dev>; Wed, 12 Aug 2026 16:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577712; x=1787182512; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R1LjGLBPhCkN6fNBzzMLJks+FhS/j60EJGyFCmImsGY=;
        b=TmuQyL2g10tBggr/xtDBWA56B31V4hac5Dy4ht/9yl3GAJtDETghmQbrUYMjUODdrd
         RIN3KQ2iUb1ZCvKs41IPf/a0rRX+2Y6NCkI5hJY4ULxVnHotLZvI9SpcDOIqAwmXb12B
         6bD2mxcPa/iqnDQowEagfahd6nO1t2tfbDPDFKoA9ql8wZG1ldvy0eEXJYOgTl8YPKqX
         LWsk+LW1cbUrJqDJP9Q7L5SP4JPVr7U4ixiqpWf3To5cdjZ6cvAjyGT0f/NfxtIHUWR8
         U4flLT9I8JulnS9NmNXO9mXaMJ/QML7nrAt6PSox9X9EMbXZkbGp4lI29kNViYUHPtH/
         tI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577712; x=1787182512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R1LjGLBPhCkN6fNBzzMLJks+FhS/j60EJGyFCmImsGY=;
        b=qof+ndyYswizqw2YAP6Kh3yYkmTwwPORKpHaUsHMcu/kjRffkN5AeSvQn/81Wd/cKU
         IrdtvPtMSG/878zgsSr/wshuJ4dJXbFcM+abuTMD6Xom4A1RKu0+AWc267jqeRKjqDtC
         WDmxfw3WlFZJrN01vR+s8LYtLJQU6EpMZY4yr01O9iSH3LCCIVsjKAZyvKcMl9bWU8PI
         Myjtnc6uPtpamLst0OoHdq/dZjQKlmjOaHm0uR9z3JWZhZ7xNPVbKrco/rKnndTLkyIS
         9fYT+k//MKbkMJBDPAZxIMDuRPIGav0j4gUEXWiHUj/VZm/wwSqhX8OIfZ3PxeaXUkrJ
         YLKw==
X-Forwarded-Encrypted: i=1; AHgh+RpG79eUWUcBKEGUUKCQb31Lz8aq5JRZGfjgWZgKRC5Ve2F7ZUWK20bIBrlswdrwGUE1moTjr7Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdcNetoJGsvtB8FqUy8HfoEpHfVT/jZOzRFGPboax4YonD+Drm
	zk0LCqbTi0CuPaYlgLiBzJQ2btQScHuUF/8TcaqaySGhIXscNGXJR1kVKr2utDU6vkxMvKOQNOc
	NSu56ENkkadnwYYUkNh23bhzQIkZ7NbhSGcpv1j5rhTUwtlXo3THS5VnwZpM=
X-Gm-Gg: AR+sD13KWMkHka9byRp/TcVCt8UrP4lkicOcIKMzyU3Fc/CB2RDxFHdOCxuFb1duwfB
	o+G6/BVpCIt9JWtUQbrcS6hcapi5v3NzHPMqzEcl3V1QRuKDDmhQHBF6GtD7lY0dCWeBrY4oLJu
	/woEUQvYRuYs0YhHczAxG1nHmXsQtJwEVVUtPztysbF9IQjuj8gWXGAP5GUIdJ8jBSmiv8NV9Kt
	BkEO7xZh/pc+GX8FBhS4+PBSiGD1iq4s042UxxGgSZLapjCfD/nnWoiLT0l5ggCe93ImHodyUEq
	ayF+NZsgfBiwsVbBAvEdDBtL6ktTGzvaG3/tZmJD5CM5z6Fm/w9W0lp/BNBeTw==
X-Received: by 2002:a17:903:2385:b0:2d1:134:b86e with SMTP id d9443c01a7336-2d37d53f429mr18845375ad.2.1786577711583;
        Wed, 12 Aug 2026 16:35:11 -0700 (PDT)
X-Received: by 2002:a17:903:2385:b0:2d1:134:b86e with SMTP id d9443c01a7336-2d37d53f429mr18844905ad.2.1786577711165;
        Wed, 12 Aug 2026 16:35:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:10 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:48 -0400
Subject: [PATCH v6 02/11] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-2-c985af3256b8@oss.qualcomm.com>
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
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2047;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=pMTIzY1h407OmP6ZGR17M43SvczEQJjzPSrXyQZ3aK0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZpH1uwQlz9uxSeza7rMy9PFM3dxHFy4XvwgKXPBy2
 ZwJd+ojOkpZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAiirsZ/hdwLbU2Dz0960NX
 0rypGXdvxPuUKj4u+tpZHrO+jOOhRTHDP8PFEu7mwprWDAtOnj+1sm3V3QSnELbJDo25viGWegU
 tHAA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: PMQTSFf1TTvJPbv3S2AeBtBR-QFtGTOn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX1QQaGLdc+M+v
 EVDzednWZXrzw4nVhQbVc7O1y49Y8gRCJPkBXaZZtD/RGxAG6n+TRYOewJUHsoFogrZN3GMsY1+
 tZeTLVAEu3tdsgms28xPqLDXt2PkmmEXxCgu7o1iqiGmPEIo6hbQ8q7Ogk0fHygFW7eWPrEEE5R
 saaDl6MM+DaDa4inRO0E7G1oSF4BEwdECFQ80Wrwy1qkzCPo67FA6A+MCOBdinq7eJt11kraG2G
 TfCG298K6GSjoGQ04rz3LbhJ4bY76cYset8xPszxq1ox1/4gjn4qFyJvc4rdlniaO1kKdn43xNd
 GBMpDyUukVSdqFvBup/NJDYtdWzNiLwHJ2GlArCurPzEoZy7Pi3sMVHuK3OO9REEyzcNPlw2QwG
 o5vbqQ7OUdOi1+skhrnQBADk944FJMFx/D34JfLJqqyBK/H1C+pEPDQMn84xyCn4IVW1BqEPTKA
 EtPcGwYS1PBPbqxMsdQ==
X-Authority-Analysis: v=2.4 cv=J6KaKgnS c=1 sm=1 tr=0 ts=6a7d0330 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=7qHV-DMWNrx828xCWhIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX0yKMLsTj5DCF
 aeVgtM5Qp9fe148yWf6tEHfqSykl23CE7Nu82INud7pXoLq33vHJ+gV4rzaf7019Avan0yMlFGN
 gbM8cw9ffcsnogsqIAgjU7u/1mGFU7g=
X-Proofpoint-ORIG-GUID: PMQTSFf1TTvJPbv3S2AeBtBR-QFtGTOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190

Zicbom, Zicbop, and Zicboz have no default cache block size, so a
devicetree that declares one must also provide the matching
riscv,cbom/cbop/cboz-block-size property. Make it required so a
missing block-size property can be caught by dtbs_check.

Match only nodes that use riscv,isa-extensions, so nodes carrying just
the deprecated riscv,isa string are not affected.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: Only match nodes that have riscv,isa-extensions, fixing
    dt_binding_check errors on legacy riscv,isa-only nodes (fix
    suggested by Conor, breakage reported by Rob's bot).
v5: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 577d7ae5576b..d4cde2a7b8b2 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -1211,6 +1211,38 @@ allOf:
           not:
             contains:
               const: zilsd
+  # All three Zicbo* extensions require their block size property as there's no
+  # default.
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbom
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cbom-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbop
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cbop-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicboz
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cboz-block-size
 
 additionalProperties: true
 ...

-- 
2.43.0

