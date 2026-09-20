Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698391A0BF1
	for <sophgo@lists.linux.dev>; Sun, 20 Sep 2026 07:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888766; cv=none; b=EdQvymo/Ycun/1XERurG0OYwXZG3VrDFbydw3rUXZ3h2Pe/2I6+HnTF9Khb+8A+/D9tjAUAsRDeHQ8RUHy/fj3TWrqFo/gpsAj+gO2sfemyyrYwlK0yg2kudgXEimU9shfwarT/QjeQhEZSWhXfEY4BS6tveC4guOlOp0ILpY/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888766; c=relaxed/simple;
	bh=0AqniGQU8cTXS1MhWWTaCnZ2cP21y39x+o6P4wCFwjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMJh558rNXLfHLqgszCm/gJn/Dts+BtnAz6/8OI04SKMHSrqPtRsONAaqpFcopI1F3ZDoax5Agsi/ozVJuUnnuCx9lyRe5yRNIwhd5XOZTUNG1xqpLJZ4QTjWNAHK6aOfcLqPAXBBn1TuwdqRLlGrEoAI50H4EyQeOLwJv4TgVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWMBRIDx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jb31GxDS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWMBRIDx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jb31GxDS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K555eH1610093
	for <sophgo@lists.linux.dev>; Sun, 20 Sep 2026 07:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zBkLhviN2smtRvzpD23/LACWcR8x1x/ZnjkuF+1FbWw=; b=XWMBRIDxc63hFYaX
	JfocXmOiccOAbTg5JNpQzC63Eg9Zf2WArmcVOki8CYx34e6RBlrNxlzffCcqU332
	cNB/igk+Hng4GZkhG04/r8m0CqI+XK8vvlYYxtSkuMkDObxMErLbqYxm/aNMelru
	9N/Aaj2XDZpirGYDRmowcI/SwONhw8cjZBkJP4PmERFn786M0BgfhS4U/i5gAykK
	MiHx5MwWJoq5KUxx0RycoJ8FhwLfR4I2jK3fZwVO+j3UgVMxl3aI96QUJXFFSCsB
	ds0yVVCdRzcFjY6by6srP/vXQuTSsvkn7AAX+uJHSl/VB+COqs3mFzoKC73N7bBm
	WRPCRA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjm32fmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Sun, 20 Sep 2026 07:19:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d001671a54so41830685ad.2
        for <sophgo@lists.linux.dev>; Sun, 20 Sep 2026 00:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888764; x=1790493564; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBkLhviN2smtRvzpD23/LACWcR8x1x/ZnjkuF+1FbWw=;
        b=Jb31GxDSMt+ifgjTtHCCiBV3Wv9Xr05lECnQiAQI10xNqDCPJfeupOsWouBNakFB/N
         ZaC8Ngl+NZYrPe0aI5pt+yAmqsmwCT+DIo4bxg43GtUd9/QiYTL7/2OEEi9KmYTlyaOT
         SlhLG/ZzJyDPAVxdLdLLaL57MJmlhlwY/As+YOQhYzNv0nGwDZElK/gQAaRXnFVB2ye5
         lxlBgLjTCw+tudwi4kR/Q2mTzdELDUUbcX7pRP7Ft31cv4FDlbwV2izdIWoJh9oiWeZz
         CwtjKcMlueX3zdCTIq7Y0ud9GjC0y0suZmUZqISWJj4J/XQf5xHzQ6qJx4xi1uI8ef++
         FYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888764; x=1790493564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zBkLhviN2smtRvzpD23/LACWcR8x1x/ZnjkuF+1FbWw=;
        b=CYmFA+C7Cz/YgzJDGKTW1fnID2nP8du9DV/QR76gEG90Echo4JV3vqysJOxIN8F+wf
         z8WlT7T2uv5tx8LLG3NiaCVtDHDxwP52+zJz/3E0gY2lk748pPFO097LTKRFElU/DyGN
         byStYyClMyXde0AECmvAIitSfjKomd/rgTfu6HG6M2IRj5YOy01QlXXomt6+tfvjR+vi
         dy8m1TeNltnjn5bWx3Mq+QobnI9Zk14Qsb9dwlKmozJv6+ERL95fLhzuDnnaqnByUgCL
         Zokk1TPFrouRVDX9qs8EMTDHFxDbA3L+sFlcz13H8euplPMOPfSSKMi7alQlhomddn+I
         ZBdA==
X-Forwarded-Encrypted: i=1; AKwUvByfO1SAI3J3C85HPheWz4cM7HDNxgIUIb1s31lFuir386YSFeaS+FzSEOlT5MvfD4kDwqAa4Zs=@lists.linux.dev
X-Gm-Message-State: AFuF++lhqpHB5bj4YNMikvLpsmmmlh5qamoE0yO5b25Fe9UyDNfvl5H5
	Mxr7KcZxhIfewGpJmlAbq41wBZk/HOHpVc2Za3CIj17qgFjELYBZefOG+MTXb4crCnVQZTBphtU
	47v56+n8+t/OOWpN0puErUmOGKaEywFA5H9cUfql4aNaqtdkQzgFphH6MPVI=
X-Gm-Gg: AYBFou2aFAPS85u3bWvdeVuAMiN4hMUXy9GDQdlM9Vg4kLlgvDMcTAXkSpiHsKbJxE0
	7MSlTHBBI/jdZmdE9FKtoRa/wjqMewga+npOoNW7jRMyqyHALUIVhty1hbG12Xc/UFiZ2g8sWKk
	f71RPxsSr79v8fPokUAhwPUVxCvyp9+wQeuHT8WwKW4pd4XaZm4OrYUm8UVuE5AvcIknVxaPfFq
	vYlON9yeTiPnksZWdKftoTqYJiY1nzm4OALlBFFQ+R1DEcshK2SRQ0MF3TdVmcWxGyVyFSQALoB
	hT/OAHMx8gk0S+d58DtyZVB5AVaEsRCXYip5AL/B7woGXPVY39z5HIOXG+M=
X-Received: by 2002:a17:902:f641:b0:2dd:c100:b2cc with SMTP id d9443c01a7336-2ddc100b379mr57625565ad.55.1789888763436;
        Sun, 20 Sep 2026 00:19:23 -0700 (PDT)
X-Received: by 2002:a17:902:f641:b0:2dd:c100:b2cc with SMTP id d9443c01a7336-2ddc100b379mr57625295ad.55.1789888762980;
        Sun, 20 Sep 2026 00:19:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:19:22 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:25 -0400
Subject: [PATCH v8 05/11] riscv: dts: spacemit: k3: Add Zic64b ISA
 extension
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-5-5f14bc5c23d3@oss.qualcomm.com>
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
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6915;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=0AqniGQU8cTXS1MhWWTaCnZ2cP21y39x+o6P4wCFwjg=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HSejbp8OLZ+SctWE4f55wbbOB/93pb3dmDT1POuEi
 lqvg587OkpZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAiP74xMmxXXC1kf4kt3ZTH
 RdR0icTa9ubyNX//iNhWX7p0PTwswoqR4fLHy2eF5658cK5srcz79D93rOb7v9b0/amxn0ffN6R
 vFzsA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: kZ8Spk3Tq7Jf1mEEv6MUzfac6yTzoYKI
X-Proofpoint-GUID: kZ8Spk3Tq7Jf1mEEv6MUzfac6yTzoYKI
X-Authority-Analysis: v=2.4 cv=DtfDa2/+ c=1 sm=1 tr=0 ts=6aaf88fc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UGsqu9ZSYe-JSgDVrOUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX84ZvTtH40icy
 8f9ho3jMew2/HvaP5bcn46mwf94czhJyHkjXq9U66muE8+XVmZ4E/ciY8yRYceoBi9RQzvNdkJE
 yCYauJux88JNlU4WpDrhXXzQj/Nx1UioBCG6qQC78HfKlOSwLuMXzcP1Emp2uIjy3f1Z/8GMqKB
 yjQmRyi2QadU3LxwTLKRuItl0G7eO/eQYSGLLrnhQZWSrwHO12f4t8L8kRzi4+cHAxg2/MtL0ZY
 MTXWYIfF9T2wo5Fzf6oYkrZpPcCtWYXNopUmfGc2CpmQmVH+lL6zfgpgAoXT28ia0HIlWkPcc8o
 KHAnjQ/U5/Im0ySyAZBQT7bFNyy6uAWhXCfIufGZj9EFTCd3Zp4WLjML6D7Ka5BKEfDnATLLDo4
 S+TQqhyozf5H0fYUr+nSHiwr9kBXVCbrLBtwkyiQFzY9P3dCP+bCk+TRmlTIZPovcI7InaQ6GIM
 6/Dl+8ZBkXiMZsCtQng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfXy8Mi4Ywbg7rS
 uNfe0FRf2GO4PG3JdRCy9iiAX46pjDz8crUhYO6ycxFQIQVlHNiuaoe4+Oyomu2vuWC0WVGxA+t
 N+vSze8Se4lKrwr/bNqLANbfZJigXDw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104

The K3 X100 cores have 64-byte cache blocks, already described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b, a mandatory
RVA23 extension.  Declare it in each core's riscv,isa-extensions.

Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8: No change.
v7: No change.
v6: No change.
v5: Collected Reviewed-by from Yixun Lan.
v4: No change.
v3: New patch.
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 48 ++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c..799f0f00288c 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -38,9 +38,9 @@ cpu_0: cpu@0 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -79,9 +79,9 @@ cpu_1: cpu@1 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -120,9 +120,9 @@ cpu_2: cpu@2 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -161,9 +161,9 @@ cpu_3: cpu@3 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -202,9 +202,9 @@ cpu_4: cpu@4 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -243,9 +243,9 @@ cpu_5: cpu@5 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -284,9 +284,9 @@ cpu_6: cpu@6 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -325,9 +325,9 @@ cpu_7: cpu@7 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",

-- 
2.43.0

