Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57C73D952E
	for <sophgo@lists.linux.dev>; Sun, 20 Sep 2026 07:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888751; cv=none; b=OkQ+Wp79dzILnggZOKz64MwQPLBeV/++SoE8d6by6u96J6lUXjHhrgJfezXmyZhBOc6U17vKHgD0xTWbPYEgK6kArD2ikk0/LNsVk7+S+Bczahh1o+ySMkZptk5YNOZwK7DgAiDRqXpvGoM1OFUz/EobbwOp8hEsvrvjmI5RXfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888751; c=relaxed/simple;
	bh=YtizxNhzSjBCt9sQnYHFkLSFuB+kE8v57Hh6K2S5Rxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YGwCumgX3Nf9v94hTqJ7kWeYIhxmhU3XKm0qa4UbnSjXNv4vfARD4AJFjy5+KSXlkLHeRBAp0xn4r8C3IZ0ODT5Ufk4oyLJQO1ikVnec8tn/bDIvGUQCmp3ZLNZaCyehef3kFsOc2+Ik4fcHMyY73c0hfFyB4SFbWpnI+8KdFt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NsswISVR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J9gV/srW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NsswISVR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J9gV/srW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K55XPQ1477021
	for <sophgo@lists.linux.dev>; Sun, 20 Sep 2026 07:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bC+2yuEEK8/OFJUbDMNad6VAaCQB5BaPqGUNGwsKKRc=; b=NsswISVRApcxNnWd
	q9I7ebIEijYBgNSzK53NvxYK6vfDmnBchXTGFnd87W43g4i/ZCnmvh8ERfITtzrC
	Q4yrhbhZvaz2cc+4afmKS3BoDvSsKa4X0n13/qMnrPluqkmcP/5V9QXQadq/AJIr
	/MukywDiwsY7CYzgQN8fReDdaE+PFwMkYDsZZlpShm1LQpJHhNs8XWVDZFZ8LIrn
	G/eMZJYlavH2jybYjYA5rSMgWF24ZBpEVDnm+FlLaJ2zRx7bI1lFmbkMw26zzhEV
	8aqB+7otClsf3bOiAkhIIqRAeH1JR/QBiD1weknie4Ekou1ovUtNuF55PHwuUDdx
	7CBebQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrntu7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Sun, 20 Sep 2026 07:19:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1a439db36so1840975a12.2
        for <sophgo@lists.linux.dev>; Sun, 20 Sep 2026 00:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888748; x=1790493548; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bC+2yuEEK8/OFJUbDMNad6VAaCQB5BaPqGUNGwsKKRc=;
        b=J9gV/srWfpwKc3XDiwToMJdBlmAp44J9NY76qqmNkGGfYhFbZ0bg1lC86uUfPVCOpQ
         npARxhTUz2Zmmge4gywiJbcyusb3KBlCUxgaPTR5vNAiQi3MPTWZ3A3142hMkxh165de
         IPVKmLBOjnB6+yHr6djsNlslBfPJQ8bePduxIYvDTZLx8nZ+MNqfRoev1smLTMJ2jcE5
         /EKvo2O2D8eU5pNs5uLIjYFelsczEiseyZfH4NzunbwPrbV+tvrEhqtRO4MpToyo2opm
         2AZIItY+00YaG/vzkciFEZnlCus0IzhrjiEzS7uLHDheqgwMFBdvi1Zb0ur2W1SIt0XU
         vI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888748; x=1790493548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bC+2yuEEK8/OFJUbDMNad6VAaCQB5BaPqGUNGwsKKRc=;
        b=1e1ME4zrg+AunzI6MS6xWWRnHfidJQO/i15BpHU1YEl8ZzFWMyVWbByDRmwgyIsTnl
         Ab8vouEAiTlyZSQmkoVKk7ca/ZUNnpQzANFEYmmfmLXK0Ad3Bn3KDQNzeVMlHjGd4hbZ
         GNwujscdFyKj5GbstfWdP3uFA1lzOq+9yYZuNJjFOnHx4Jl37W/U6i/42e116hxw0FgQ
         0Gd+x5/cvEC1HFAM6r4KuaUAziqzl68ssEk4an8+8g1+4awe5as6sVfYDkizxgBxeha/
         75y+SY/4gBmWRy8zD5z2qimaZsI7T4Emv8yd84R3X5/P2am0VXG+IW644RDDq22CaoWT
         R37w==
X-Forwarded-Encrypted: i=1; AKwUvByfMcjdrkd5O4Ev9zIA5ALG1VXex7fFf+EQGn5bEJzPg32UhbUOnl2kjuXOg9a/w79r0H0D74A=@lists.linux.dev
X-Gm-Message-State: AFuF++lJ8gVxoPKIKpfICf1SKLE0DGIgzKNVcEfCMMdIfaIk2bMahjEy
	j2W+PQH95K31NIKkv0t9Ah4Yc8Cv/k+fkcp19Z8f98AhhFuqx1rRCZ966VzZEfKedUQYvvvrNh6
	Ru9+bEKxZUzVRMc2Qh9we6a4UyrehYbJL5LxifONNFoC98iu3zCAJd2ALqvQ=
X-Gm-Gg: AYBFou2aWwp347RvS2Ta2XFD99Tt2FvUYh6oLLfynUTukiNmyRtPjKOLxVVivC7pEcu
	riZzGWNfITNrniW01DBEdpZAGjSXxxJ/49frx/+akcrXm/J6/3rr8wM21Er8edf2PKsRzcA/CjO
	I7WdjBQ1sf/plsjaCzFFT611APO49TNYito6WQh+jCpZkkpmhpI9Ue6AkC/rLBS1OUH+SmnqyZl
	nfXWIYi0hnDKOuReHCZGXmgotj71UCzrUbN2tnnoaUiolfuf1GVPc6e419hQzrUaQWpy1fpIJxB
	zu7r6N5P9N/XW2yadFbGDKvihdov1G05ZVCLqqw+YOjzl67UZuI7ax5uzks=
X-Received: by 2002:a17:902:db0f:b0:2dd:b52d:e83e with SMTP id d9443c01a7336-2ddb52debe3mr111653795ad.19.1789888747509;
        Sun, 20 Sep 2026 00:19:07 -0700 (PDT)
X-Received: by 2002:a17:902:db0f:b0:2dd:b52d:e83e with SMTP id d9443c01a7336-2ddb52debe3mr111653405ad.19.1789888747065;
        Sun, 20 Sep 2026 00:19:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:19:06 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:23 -0400
Subject: [PATCH v8 03/11] dt-bindings: riscv: Add Zic64b extension
 description
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-3-5f14bc5c23d3@oss.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2839;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=YtizxNhzSjBCt9sQnYHFkLSFuB+kE8v57Hh6K2S5Rxg=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HSeumV0wYZYK+vLtRbLJ6lylrDY+nTvdCdoiixkD1
 2Stu8fdUcrCIMbFICumyHL4aEv21lc+0b7POX/AzGFlAhnCwMUpABN51srIMCsoe/lpzy/vhKV/
 S/9pkJ3Hkm6TZL9H7rLShfSXAZXnHRkZpk2ZoRiwsild9cBTqV0XDt58dW+J2Rrfme+LpTJ+MRx
 M5QIA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aaf88ec cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=B0juqsJzrbe9EOqzv1oA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfXyEMbidxZkrOk
 dV8+dW5IXG5kFe0qC89iELp8483Vwpv6md07T3SAQDZEljQZUHG10e0KkRI6Eeo6rwPDyxrMd0R
 d3grkoRTyz4ulHL+DoMjW02KJOP3DNk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX34rZQmECW9IC
 LQCRv/iwWhMoWlsPm4eMmssiUwuCREFbKYuVXjilJw+UNhmtfeKqpHbQNx/rRDbEu55PCKj88KE
 o2n+ozryiHpW2MzCLrVov3FS0yWCP3M/hcxq6X/d2AyVO2fkhWKIwEOC6PA+8bUmSCq9lEV4xNt
 +7Gf1+QMpOBj1Q2YNCReA32EKw3YBmx8QiYOotnzoBCGtxudbFX8/XnqfqKzhiH5lLHl3MmYrR+
 JH1VSSNbUAMX0oZngr7Z8Ueng8VFpXIl/+TSZKHh7LPfQhHR2W9aU8scnoC/2YlPbwhQ5VW/XL/
 h4mC64gcMbn9jWC+We2jna9+B5+k5NMAJMDplGUH1yFtDuN9mBADKT+tK0zB56m5RVkB1JIqkC0
 DMJI4Xvs0PnLMRcLmd8cYzxBdxlLA76peOlU9nLVBAtGmZXEzX3rPqG/98FrPRxHGAm+GoZrlzX
 FLwgLBZyxD7CW6AIylQ==
X-Proofpoint-ORIG-GUID: fLbt8QbYZSibr6AWk1Qmuun5mya0fd7Q
X-Proofpoint-GUID: fLbt8QbYZSibr6AWk1Qmuun5mya0fd7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104

Zic64b mandates that cache blocks are 64 bytes in size and naturally
aligned in the address space. It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions. Since
Zic64b fixes the cache block size at 64 bytes, also add a schema check
requiring any present cbom/cbop/cboz block size to be 64. The check
matches only nodes that use riscv,isa-extensions, so nodes carrying
just the deprecated riscv,isa string are not affected.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8: No change.
v7: Collected Acked-by from Conor Dooley.
v6: Guard the zic64b rule with required: riscv,isa-extensions so it
    cannot match nodes using only the deprecated riscv,isa string
    (same defect class as Rob's bot reported against the Zicbo*
    block-size patch).
v5: Commit message clean up, fix a double space (Conor).
v4: Insert zic64b at its sorted position (before zicbom).
    Update the commit message.
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index d4cde2a7b8b2..79491ef8f86a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -537,6 +537,12 @@   riscv,isa-extensions:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: zic64b
+          description:
+            The standard Zic64b extension for 64-byte naturally aligned cache
+            blocks, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zicbom
           description:
             The standard Zicbom extension for base cache management operations as
@@ -1211,6 +1217,22 @@   - if:
           not:
             contains:
               const: zilsd
+  # Zic64b mandates 64-byte naturally aligned cache blocks
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zic64b
+      required:
+        - riscv,isa-extensions
+    then:
+      properties:
+        riscv,cbom-block-size:
+          const: 64
+        riscv,cbop-block-size:
+          const: 64
+        riscv,cboz-block-size:
+          const: 64
   # All three Zicbo* extensions require their block size property as there's no
   # default.
   - if:

-- 
2.43.0

