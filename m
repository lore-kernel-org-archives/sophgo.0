Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695D4463B6A
	for <sophgo@lists.linux.dev>; Tue, 15 Sep 2026 07:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456664; cv=none; b=vCBBLFYzVWMJbTewQ0xQ9yyFvARZpTUDispFd5VZsnRbfN/xV7Bt0zjCYFtaNzLpaMbil4kWqwGW3Vxauls2fKDDnbomQTzSZ8LqmRsJTOBYlsLrp+B3HAt0QR3gfTQB2cl0/L+6QsJ4qhNEO0NAemtuLASDhmCm8jxbdxDieHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456664; c=relaxed/simple;
	bh=MFEXerAp8YkUeh1632oAcakBkgoa+iIvn8OYQFJJq/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gi4Q6C6X1jeQijYx5BC+69vUqOQRv3j8IOY0g2uoO81bZJbz0/GFSaXy4R5VKPe2e1tNHOWwFZFmyI+qWajGEGR35/Ev/wjIqXbbZd5UVvnnCvoH22WgW+w1l1MSWt0aTa6O/L9splHL9kbDbdXijSjI6l7khIqc05o4Mxl5/Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljcbxh5g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjM7Jb8z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljcbxh5g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjM7Jb8z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z8lX2415190
	for <sophgo@lists.linux.dev>; Tue, 15 Sep 2026 07:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bl9v/AgdP0OwD+z9bA97aQ99CJ8kyJB54LPdNFAL3Tc=; b=ljcbxh5gBgC5LYEh
	mseWdzdISqshcJZLWNVvf9ju2i3w8FWfDrKb9DcuIPRj0u1JpTht2dqfbYnJVnlP
	7qKI7IE/NicBdV5NDBMtIb9jvQLz7vncAQmsc/GuhP/KM+i+wLk9/uBpeoDX9OCg
	KbsTLB1GKVEz4ViTD/wgCd4ojrjxl5Mqgxf7echK7ORomS52oGF44xZhBKQF88zK
	74sR56TwfOf/6yEydMj1N4dWUqYZ3caGzi7s8+MP/6YNaB2niqaPzco24wRrFeiU
	9Ku+z2kFa8Lxc7BhlRJQt7UpQHR91n4i/h37wTuh9lwwn7g57S7wOtik8vCSuQR5
	WY7m7w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxyd8m7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Tue, 15 Sep 2026 07:17:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39d8646b10eso4223793a91.1
        for <sophgo@lists.linux.dev>; Tue, 15 Sep 2026 00:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456660; x=1790061460; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bl9v/AgdP0OwD+z9bA97aQ99CJ8kyJB54LPdNFAL3Tc=;
        b=hjM7Jb8zHmcixeOrEQprKeXdZN67Xt0wXa21qdk8wJ49njY0rmr4GgObE39LT14m8x
         Pp4YRLeAvgNfx914sj2eUDOddmEi1Gz7cfot9opmSlaXYlbH9pGH3IqY0GgZO2VlDSNR
         8UMO3wrBoEcACe6N8bc0zwsis7wkTDNHhZKVtT7CZGNP104aaXobJdKQuFuwvvYClK1K
         5akXByAUAjPV8zHG7Ho55ONQ12JXCa3GeLzpbmNVWdpzLIwh7qLFC4ILFriMUb8ffmCu
         TTE12IU+Qle/qxthbsRpkjJ+itCtR8In5B7MDFSR2M/sI9hJcMOMEH2UjSD8kl+lTdr3
         B5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456660; x=1790061460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bl9v/AgdP0OwD+z9bA97aQ99CJ8kyJB54LPdNFAL3Tc=;
        b=OwgkvhMRLK0u7ryHElfLIGnrpa9EFnKgUH2geldXRe0TB0j0Ak+j9RGvTjGQeXa3g9
         7DzgoeZsyik17mdcbqB10i/9LLF4BGgpcti+oCz33pbFi6caoEjLhAK2g0zQXbiVSil/
         De3DFKx/IGZHkvXx8B0MpZPTs71ERl8mu9EYbw87DHWdDpvf+QUsQSJ6H56BTDcT8F5y
         +h17ZcPlg+HmIcebHAU2CcyKDbu49ZrQiq9HGkWX8h+S/Qyxb4YrshT+qFn8Qjwbnp3a
         XqcRrMu4nwivJDJjdVe7E0ZYe0WJyjh5Go2ZoxehZQhZGQuoqEeeUrIKnDQz2zv0YXAF
         1sIA==
X-Forwarded-Encrypted: i=1; AKwUvByAYi4a4AAm4yQqfVi4PU7oL4WQsohvof9UbD7Liy455tD6CnZ+Igo7yfD3KMka3OoKp47sgiQ=@lists.linux.dev
X-Gm-Message-State: AFuF++lrQiFfE5hfb4nGoD3WAFVZL6wBpKO2Hx6UfnsC4MsDjMaMbA1b
	ukCXIUXwzQaInIW0RF/23rJNYngJeCJc8Id5kE9JFtu0BswQ9aa1ElOZwvduCJ1dJkYcgoLOCQl
	+R1AvVMGdsJ4PhNzFexGYYwJVIOvcF0bzQMSXv3sWQ2dK/xpqI2/5MtjZuPY=
X-Gm-Gg: AYBFou3O2teDkIzCw6KnlRtOi0cpissxcoqSTrC7fVsAXVLNgxlfTnOdyjaCpwgshFe
	t6lcAwnU2Xs/21Q2P0VmGkUPmYsTgx2CsXW0O3SFPkkVuMAWsmEaJJNOcgZgji1Wmq3VpVodgTv
	Iw34XBrx64fNB3lZXwWvaK12gqNPNTwGKe2Sbmd96QetF1wVk6Ar9B1VF760nmwNpXSf2sPZKY5
	fOVAOBpnoZqynTSO2Pn3BQjeH1P/ZhFzBzRlEKvhODa7LkGV/G2cntUQCNyplpIgSrEiaSXperH
	fVbukLsrrYUZXJlX3mHjv4cTG6gZNzOs7q0IuR72DKcDwHsLmcde/6Dc3RNt
X-Received: by 2002:a17:90a:f16:b0:39e:b7:cbe8 with SMTP id 98e67ed59e1d1-39e00b7d278mr3590020a91.5.1789456659726;
        Tue, 15 Sep 2026 00:17:39 -0700 (PDT)
X-Received: by 2002:a17:90a:f16:b0:39e:b7:cbe8 with SMTP id 98e67ed59e1d1-39e00b7d278mr3589957a91.5.1789456659306;
        Tue, 15 Sep 2026 00:17:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:17:38 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:36 -0400
Subject: [PATCH v7 10/11] riscv: cpu: Output isa bases lines in cpuinfo
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-10-aa35ebd9ae96@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2779;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=MFEXerAp8YkUeh1632oAcakBkgoa+iIvn8OYQFJJq/g=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7bZ1ogEmMSfY9Oy1bh0rMZyYUpccPK+Cxpmlw4ec
 vA5ZXS1o5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACai1sjIcHHTx/Qdf29cUxGf
 ub15s/LP7Vcnhl451Wpyr6pCXqNSeA0jQ1c54/Xc1X+3zqv7LLRrbsfJd0tXmJUKx3aq7blcoqT
 8mxsA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX04On5XoySZUC
 MF+9CxE+EYeaa5T5y/48usvlV5XlPU3X7yuLhOgKljvvvRf7+FJpBdb8iZvfCy7n7NHKTYWTYAX
 rgVd2/ZkILlB0i31v5qqGAWi2DwH838=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX3nlGbxd+NYqc
 jir+X7+QO8hR7odAUfe6EyeUtzimnCZRYO+1XKQCT67/Wu36SGTrVnJpwqfptkvs237Env+Ks7i
 pnaOy03N61f5vosO/XxVABklePK0wUD8i+DrrvpizY/sJHMs1jFFYRE/Uf0F1qK3gkWqwpxfJlU
 /lNdxp7xnIs6/dPKtNi/Bwc0vLkVUcN+4GE6OthGh2kav/vycH9r1tU1WK60xvaR+4fUIbhJKAp
 Lh//G2ROuIbfz5Mf7Zxd2hE6TtCXX6kYvX1mg4ZHO/Qmly+GK66eAzmrTOGaeRFOjo3IZuHvuFY
 VRdojZ1LI5uIHR5i3h2zGlKKuimK4lxL2KiOUcSEZRoFd+4r26wa1Q7V5P9jXD8EYKWZXmSZzxx
 8LUbx2MCfxFV6XKGao4Vj3+Ac77p8ZM2i2Z/65mHMHuUrnywNhFL7uny2201Cf6QEHTi4IiTcuQ
 U103CusKBwd1XqD6F6Q==
X-Proofpoint-ORIG-GUID: -dH4tU5Br7F3hyJ1n0MCzK0nzeRr8mlT
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa8f114 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=iQKFDb15jVzJNXG1q_sA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: -dH4tU5Br7F3hyJ1n0MCzK0nzeRr8mlT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102

The "isa" line in /proc/cpuinfo lists a hart's extensions as
concatenated string, but not which profile base it satisfies. Add two
lines that report them directly:

  isa bases       : <bases that all harts conform to>
  hart isa bases  : <bases that this specific hart conforms to>

Example output on qemu booted with -cpu rva23s64,sv39=on,pmp=on:

  processor       : 0
  hart            : 4
  isa bases       : rv64ima rva23u64
  isa             : rv64imafdcbvh_zicbom_zicbop_...
  ...
  hart isa bases  : rv64ima rva23u64
  hart isa        : rv64imafdcbvh_zicbom_zicbop_...

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: Use riscv_isa_base_available().
v6: No change.
v5: Simplified the commit message.
v4: No change.
v3: No change.
v2:
- Read from the cached riscv_isa_bases and hart_isa[cpu_id].isa_bases
  bitmaps populated by riscv_init_isa_bases() at init time.
---
 arch/riscv/kernel/cpu.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd1..d06824048aa25 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -305,6 +305,26 @@ static void print_mmu(struct seq_file *f)
 	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }
 
+static const char * const riscv_isa_base_names[] = {
+#ifdef CONFIG_32BIT
+	[RISCV_ISA_BASE_IMA] = "rv32ima",
+#else
+	[RISCV_ISA_BASE_IMA] = "rv64ima",
+#endif
+	[RISCV_ISA_BASE_RVA23U64] = "rva23u64",
+};
+
+static void print_isa_bases(struct seq_file *m, const unsigned long *isa_bases)
+{
+	unsigned int i;
+
+	for (i = 0; i < RISCV_NR_ISA_BASES; i++) {
+		if (riscv_isa_base_available(isa_bases, i))
+			seq_printf(m, " %s", riscv_isa_base_names[i]);
+	}
+	seq_puts(m, "\n");
+}
+
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
 	if (*pos == nr_cpu_ids)
@@ -336,6 +356,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 
+	seq_puts(m, "isa bases\t:");
+	print_isa_bases(m, NULL);
+
 	/*
 	 * For historical raisins, the isa: line is limited to the lowest common
 	 * denominator of extensions supported across all harts. A true list of
@@ -360,6 +383,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 
+	seq_puts(m, "hart isa bases\t:");
+	print_isa_bases(m, hart_isa[cpu_id].isa_bases);
+
 	/*
 	 * Print the ISA extensions specific to this hart, which may show
 	 * additional extensions not present across all harts.

-- 
2.43.0

