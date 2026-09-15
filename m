Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC513DAAD0
	for <sophgo@lists.linux.dev>; Tue, 15 Sep 2026 07:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456671; cv=none; b=egXPXMaVQh6JaJ3Adq93qM0xrRN91qPb5dc9rp05aZdvTNbdzsioMsKOBj6lW5b8O7FUam4iuJo8nsPUdaLmoL3ZnegBTLkrf1VCsjk0om7vCXUgbJGo7f+D9L0XPVnP3a7w9pu42jLPag3xkeKQhui7gLMBAPBdyp0nBkbxtFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456671; c=relaxed/simple;
	bh=hAXGf3fwKFEiB3f4/YXlhsIaiotd9AUAeVeNMwuOMCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RWpMVCQD2E0hs+664QNBya5z+Dj1tdQ0WGNXfR3Tf/OgUWpUYuXvxzGHMYAVWKhj2U3Qa9CtkYXxO6EIwyzlGapLQtM0jtgZJJgH1CmVJpDhatcE48EWnmbpuSwx7CFE6PKJAQ/mOLmLksnhxCLUhaGTcdAf1geC7Fl5tKoUsNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UIhqtdmh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahTJCc5E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UIhqtdmh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahTJCc5E"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZOWQ1661445
	for <sophgo@lists.linux.dev>; Tue, 15 Sep 2026 07:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xlfk++XyU1ksGb867DX9M/DYidhT/J3K0XN0SWFOlDU=; b=UIhqtdmhYfZGZQJA
	FBERNDICmZ+DiCoaE9/9Ba+de1bRnGJNuXWg2e80AqWSEGjWYed7uG00K43AAi3c
	f5VZ9xpVDpLt6q4bBxqCA6b6mM2rKD/rC3SY4qVqqoHU6AuSraDcAVinEykwFpSH
	PsUdmTwe+dW/tGfuInRYMtebxkJCy6ErmQwc1yX1lQlFtkOuZmwlJR1BJecyv75l
	TMAYbg2dmQP39DS9KpeeNgIGHoTlgEF05UC1HAmh1gmvio/PLtODyk95lK++O9XJ
	P5K9yzTaDX8zvpgkfGQBT4QdNNiHmBHXybD9Yx37U21U2R4yN2V+MRXZi6A/JNjo
	imPlwA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpergcg6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Tue, 15 Sep 2026 07:17:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso8473735a91.3
        for <sophgo@lists.linux.dev>; Tue, 15 Sep 2026 00:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456669; x=1790061469; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlfk++XyU1ksGb867DX9M/DYidhT/J3K0XN0SWFOlDU=;
        b=ahTJCc5ESAmVmH6L3g/PbIWsWR9jRxDfT/koqe1mUM/mFXDMD4aQ0X9ohgx9Pqm6yZ
         V2huZNiTyksZ5xxq11HYmGL9vAzw40k2PXs73lvk8DrY5u3mvvsFPeC0sJvqjuL1Njbj
         W3JEiRBLNmXDiKqxJHNeZoFzE+3Jv1pP/ifLGa1Ok68K6FXNaS0cMZrTZGVCCEToAUge
         JpeGXvOxXfKiCfwFbBSu/Va+NqzLmC4due/PrKkYFs1Ya6lud1NoYfVYk5LUEMzc2Bed
         DLfOcrn0ZpG4sDKCxKKGMlRGjaSAvlEo3Y1TpCnqQs5CCudUhT7dWFu4PLSo9o1dzv4f
         ONDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456669; x=1790061469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlfk++XyU1ksGb867DX9M/DYidhT/J3K0XN0SWFOlDU=;
        b=Vi316ExiW4VKo1QGbj5bqaYSySDYVE4HfrSSJx5EG4AGs3D1OeuCKcpOURRiptTYSu
         A14umRsZrKuNDf8mVbtpjfC745Crg1j2kRIw07ANp07mwIVnmv7qeClHfyqPGMzp8hQa
         MkJ1mmW3p7TIBPrr0fxCvxhY5FZ8EhCJrHPVWH//F2wL4TMPruO3y7y+qh+j+MOv8Vz2
         e6IYHXxpHb5jxvPC1Blzz31Vrs4uNWZ98DZRRHalAn3x9uQAlfbneImeqVpK0QPQ/afM
         /scMx/7Af2gSHsWQOn39sXxSAS9xKblFpwb4vK8dT4CriBzrz7R+s5o+IMDcWEBnomD2
         Yo8w==
X-Forwarded-Encrypted: i=1; AKwUvBxLm+7281o4TmAeIMWDA3QUWi7RwBbYkBKQRqf2Xrvjwowizf0GV9aNicMFWbeEL4NYN+yldwY=@lists.linux.dev
X-Gm-Message-State: AFuF++kenxFDkdfatNlocETn/pxNaJJljLDM7TpTLAVUr5PgdYTFY5YE
	xM+NsLmj9nzz1gr97desNOMhxkXdvFU1F5lBRWxVjI4zDpRdX7RwkuiV0qtxazWchcyloSFEAft
	Ph8/yOUiarsa9vrAxTEbaZ1vJsc5tNS7ltZu7XCfPBog5J+2ftFC1suoefMQ=
X-Gm-Gg: AYBFou2AmoJvCNw5o2kSQVsfwYSpYZ5k157QoGZAEtgCI37FUC4iYRp9ssyfviCU3s9
	qL0jhVJs71aX3ZKT7W3Pub4jyWXHag30AG2remo+rfparfff7sC2g0hCLDuc48QLgtH6yE/mxmh
	hOdVxvuVf+YgJm6e9+MQR0Icx3Ea92T6BiBU5yOGJwvBSVyJQb/zXT2JQi47TjskL1zgtmjS4f9
	FG1UhtrmFt8L1He0+OnYz448awRncexdagJXGyUzilhL2eQhh4z3OTua6Ec7ybJIysFAKgtV+ox
	nYSjKexfKl1B0086pkXPdnqhHgmnSejhW6fK4qqTcEw84QWQ+JlIjGZBmWJ1
X-Received: by 2002:a17:90b:3e50:b0:39e:2f2:214b with SMTP id 98e67ed59e1d1-39e02f221afmr4277486a91.16.1789456668468;
        Tue, 15 Sep 2026 00:17:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3e50:b0:39e:2f2:214b with SMTP id 98e67ed59e1d1-39e02f221afmr4277428a91.16.1789456667863;
        Tue, 15 Sep 2026 00:17:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:17:47 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:37 -0400
Subject: [PATCH v7 11/11] riscv: hwprobe: Introduce rva23u64 base behavior
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-11-aa35ebd9ae96@oss.qualcomm.com>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
In-Reply-To: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
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
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5107;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=hAXGf3fwKFEiB3f4/YXlhsIaiotd9AUAeVeNMwuOMCQ=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7YpVSuJte9Zvqye67H+4vxXO2sv8DXe11vvPKvAz
 K5jldmljlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZjI9yBGhifdP94cOHHwtdIF
 NvV1l00OBU1YXDvX8duRD6KLxEN1krgZGR7811SWUZ3wqXElB7PmRZ5JE2Yy20bnNv1eNPOccrF
 8GBMA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa8f11d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=jBCMAwuHs6T3S2td1yAA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 45s_d8lITmbOA2fWWWhvFPcfxKyJWGlm
X-Proofpoint-ORIG-GUID: 45s_d8lITmbOA2fWWWhvFPcfxKyJWGlm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX3/4HnQ3QHLo9
 VhBBqEU9uQjUFeaoHmUes+r8l8oRHP+dNdC87tRBcMoLQ7f3SYKaKq+tIr4pEmOleWhkaqwHACd
 +NU6PPgM8IUYoPc3HB4RohtLwOwsZBD+KDEEmoTujZVujRpYwWM97YLH1zi4HlVJzVeEZjZa6gj
 dG8axfzYZ1GCYKAh/V0zLt5n4bUPK4M8r2BRhXbKizDyxQSB0o92HjEZsOVhuOOzVzp8uPQRTfn
 Nd3Bt7bgJ/ONH/nYOAMM3xrVOMlquU3pNW7bohaduY91/KRgG3doO7116j457hgKlt5qDfJCz0F
 wV72oNHo0XizfJZL8DjrB8GXt13krBtEM/w4MMc7kL5VldY7+20Xuus2vzsIbszspy2o2u8KWoh
 3SpnGxlj7ENitxSZ3YR0Z0XstAae7RqX9UJjiWNcfIV4UK2dJ31WONgpY+k7GIRAbePeWbEkMcz
 Eypzix9LeikwaR3bkwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfXyCBRbPsDBt1g
 noEX9qdktag/ZOG7alR//FzPrcpIEA6H6zCGhnC0Y1i92lwvGHPNp8WKf50O81OPRfO2/SKep2Q
 Lc3Bu7bD1O+8BRWQ+7esMyFJOJX2fcc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150102

Provide a hwprobe base-behavior bit so userspace can check RVA23U64
support in one call.  Without it, a consumer needs five hwprobe
calls and four prctl calls, which is error-prone to require of every
caller.  Most software treats RVA23U64 as a new base anyway, so
expose it directly.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: Use riscv_isa_base_available().
v6: Rebase onto riscv/for-next: define
    RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64 in the _BITULL() style of
    commit 8da45c93dfa9.
v5: No change.
v4: No change.
v3: No change.
v2:
- Detect RVA23U64 by reading from the cached hart_isa[].isa_bases
  bitmap populated by riscv_init_isa_bases() at init time, sharing
  one source of truth with /proc/cpuinfo.
---
 Documentation/arch/riscv/hwprobe.rst               |  8 ++++++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 ++-
 arch/riscv/kernel/sys_hwprobe.c                    | 23 +++++++++++++++-------
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 32a14331eb9de..dc70470093b1b 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ * :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the base
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64`: Support for all mandatory
+    extensions of RVA23U64, as defined in the RISC-V Profiles specification
+    starting from commit 0273f3c921b6 ("rva23/rvb23 ratified").
+
+    The RVA23U64 base is based upon the IMA base and therefore IMA extension
+    keys (e.g. :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`:) may be used to probe
+    optional extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9a121ee3b4369..4f5d51788c416 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -22,7 +22,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA		_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64	_BITULL(1)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		_BITULL(0)
 #define		RISCV_HWPROBE_IMA_C		_BITULL(1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 656cb100ac489..51a85e61088bf 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -223,6 +223,17 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 	return (pair.value & ext);
 }
 
+static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
+{
+	int cpu;
+
+	for_each_cpu(cpu, cpus) {
+		if (!riscv_isa_base_available(hart_isa[cpu].isa_bases, base))
+			return false;
+	}
+	return true;
+}
+
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
@@ -305,14 +316,12 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	case RISCV_HWPROBE_KEY_MIMPID:
 		hwprobe_arch_id(pair, cpus);
 		break;
-	/*
-	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
-	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
-		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		pair->value = 0;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_IMA))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 587feb198c049..f8c797b1d0fd9 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -105,7 +105,7 @@ int main(int argc, char **argv)
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
 	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR &&
-	       pairs[0].value == RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+	       (pairs[0].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA));
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);

-- 
2.43.0

