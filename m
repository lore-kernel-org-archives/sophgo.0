Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEFE480335
	for <sophgo@lists.linux.dev>; Wed, 12 Aug 2026 23:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577776; cv=none; b=MQq+mf0KoJKmzijW1OQyBOz/ZrINc86kULykjWIPPhpJBtVpd+BhW7+6bKX9SEoXrG8AjpUWhRdMH6i5fXP/j3aWY6o/wb8VFwJlMgVjo4E/5e8yBMFPq1+zzE66bumRWYGsWOVZIN9NuPmyXNllyor7ONpatFU1VlQtfQXBjhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577776; c=relaxed/simple;
	bh=DiWwiEx9V6F5N4m+1J76YOkAHoc6sfST7Sl1jsmaxE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BArAt8uomKE+fZWMskXyKPV0qWMfR2hCJO1jz2/qH9cc/lQZ79pub+OsYSDXtDhrITaY3CcrdahcRUgwM95Ovkboe6zu03MVJ8rENPygi1QCPMXBeTmXSfUraYToK3+GuJjhRO9hY/eX3SmeaYIuwvEowFKwsk9n1umGpyWfSJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HcEYqNs4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OcTPxcC9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcEYqNs4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OcTPxcC9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLRJE1058191
	for <sophgo@lists.linux.dev>; Wed, 12 Aug 2026 23:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhUu0uSzo3AfsrNzm/Bks16Jnk8npDCjKZIoNK46y9A=; b=HcEYqNs4ECci+xC1
	Gik3L6KmLJ7Qx5QtsCNKawHOJhDsK1/P1WSCu+5KxvKJ5ckLHHTm1TcKejGNXcFk
	z60tjy9QCZn9e2yP8sKEe21/F7DDMQjJ3UrRNKjOhugw1gACTu0wbN3XQFPbLCKD
	2IlIoO+FBnhlWBYNO/YZ0yR13W1QXcdjye8+a7zI3jhgL+S022vpbPMZmQ0tbdrH
	qqyiEZ4zdDoXjurmV8yx9poIQhZxPWk40gCTcx/+kf9rwpJSn4dk9sR0wXojuMDc
	j5mKAyX0pHSjnBCRF1eI8MsGQfZkl1MQ08kw4jwJuzXpbCoRmYPwDXlkOOOWRK32
	pOo4HQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g11asg8k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Wed, 12 Aug 2026 23:36:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa55c9430so18091315ad.0
        for <sophgo@lists.linux.dev>; Wed, 12 Aug 2026 16:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577772; x=1787182572; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhUu0uSzo3AfsrNzm/Bks16Jnk8npDCjKZIoNK46y9A=;
        b=OcTPxcC9PJYq9I2C/SnKASisuCoir9hUoCEuUCxUNlkQGGhdqnZIXgAkcoT6CG4ZkC
         e6pykzH9f3Y5Hoz5YyVfglr9EhqAu+FO7BKB+NKh8MJv+elk92cpnT8GJSqxgAT7gst4
         rkC4ZC603Ml6adq1OAEINpwixhQf+uFE73aODdEoRn/DA4Kj4a3rMFwQPfqEIMCfXkq3
         ZGKxkOydsvkMcQvTcH1lPHbQEPRAbhs1d+HskbJxpiYycEjDiFrcisCx88UMC9zXuGr9
         3OVTmzvXtqzFa3LV84jaNbcPblv+UNc+k5G5P7SZsTKAFBJuYvdCuchlb5vpf7kwoEhN
         geeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577772; x=1787182572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhUu0uSzo3AfsrNzm/Bks16Jnk8npDCjKZIoNK46y9A=;
        b=J3rzKmbFnQ2bIVKQ5ea38mpFvYn6arLQMDYfhzygXh9gSvXOtv0Y/mIdNdn2/bjMo9
         tUsQRAEBf+jiQ+Q4nN4BjioABqfyX67JDmHAiOPfC71DiwRaMH+Lxi31aSSTmWq9sFWY
         fcpy33pJxZ+tpKEkLXnukfcSPsV1sHZ7jgkludR2u0QNEAH7IiJeDTstcUoUa+gUJY6F
         Z7+IRuI8VAKclRlaAh723carjEbqBo+irtV0smHxbUBcCnptrV3KzDGcSo4yGWLurzJb
         kdm6lzYMC2Rok256EzuGGVLB7KHWcQ+MG3yC6+x8/zyI1eVGYEsrITfe77x2/dGfdm9l
         G1qQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnURM/tzqmz9s86DfWX6IdM3de4ROsvCsRor1pw7zfyKPGWeG2zU7o81O8GkzmAsWCgtla7wk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr77ec+5AurN1mFHC88Bt0fPaAQksdDbdPYnOEfes2HZ5lviUN
	Jg0e8W8PJ+b8PH0nEVae5i11FfUqW4s+HYIGA7ffYscGhkO4dyCeJ6tlIibpS24X3LQM/WIQqOq
	0ehYgcdck9Rs98wTZ+GfCsOwUpxBSbR5XRhpDe61s9AfN3W/P9qDmQO+90Zw=
X-Gm-Gg: AR+sD103tQFgCqEIe38BK//vlw8JIpoUgvedE+lAGHirK6fxkrVuufCoMzVVuVuLx5S
	Jk9RiKKODWh7yIhG3/8TMrjZkQV91TEvyaALF+MsI3hXmkOpW2S2/J3Q5755qrN+qGb6Rlz/Zy0
	zrUJ1qmFFDsCkjEmWRFn0PdjW+cm1k6NDwOmI729b/2tM8eFiH2bdQw4hXUCpujVq2GQcQdfmfy
	a9zkZLgsx8N02/1cPlB1l8XlOXI3FhYjaZkLhysdojpd0oRaXsXY2VWQDUpaqIxy8VfNRrIbZaW
	eWZaC0pDuALM0uBjOgIuyLt38QJs0XBBm1rZIX0PoJjoZSnbXGlbDViYUywKiA==
X-Received: by 2002:a17:903:3bc5:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2d37ebb2bc1mr21037425ad.17.1786577772124;
        Wed, 12 Aug 2026 16:36:12 -0700 (PDT)
X-Received: by 2002:a17:903:3bc5:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2d37ebb2bc1mr21037045ad.17.1786577771667;
        Wed, 12 Aug 2026 16:36:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:36:10 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:56 -0400
Subject: [PATCH v6 10/11] riscv: cpu: Output isa bases lines in cpuinfo
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-10-c985af3256b8@oss.qualcomm.com>
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
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2735;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=DiWwiEx9V6F5N4m+1J76YOkAHoc6sfST7Sl1jsmaxE0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZrFi3zn2DQpK0zelWy2YsPdA3W7WIxqsX13WTbqex
 3Rw9tzEjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZjIzRhGhjX3nrnVT/5T8WJW
 8drt/96v5Ju384TRVZkeMZnamgbR3b4M/8vEi6bKRhc0n+m2r3p0x0b39WoJo6z0KWEH/XY3n75
 YyAMA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=EujiaycA c=1 sm=1 tr=0 ts=6a7d036d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=iQKFDb15jVzJNXG1q_sA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfXxcjtUwa8H1V1
 rs1Lowwm4DVLW8Z+itHZ1Ab9WQLIbE903KRespUlxQdk2zZsuJYB10EHpfqeZg1q45v+CVsjOHb
 pPGdwj73SGhgJwzrrVAImt+WY+b4UCt+TOINwfvuScgnPpAyhtpxkMonAiOiNxqPF1E4MNWc2uR
 YPtzYvDiMQo06FW9mBDGq8Sun92TUi5s3++N+xIk1ILz0WYD0HSVfLS8NhPIYpq/7gJRbHpd27w
 LMSa27pxRGB0Zz81HQk2O+OQSMVdiONdwSM4qiPluYfcI6XIV4o00LMinW8DRTprSv8uLjFwYPw
 ARqDZbV2RbVlBgupuQXmxMvrNB81dh6NwWBp7r2kP6kDm9IbbV9BZFCzWRMKGRZHFMwfqzAYd5N
 3W2BjTxJhXxPcBD+qhboE/T6yIuSvV0CYMJb5JkPeF0cCK3n6tSRrPmoMlNESxfJ+KnwwCuwL40
 5Sp9YOCib52ju6GcasA==
X-Proofpoint-GUID: vCtZpVRQGAfp2jnKsn_Vu6hzJAQRYoKJ
X-Proofpoint-ORIG-GUID: vCtZpVRQGAfp2jnKsn_Vu6hzJAQRYoKJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX2QrhpiJ6Inob
 CyYHTiTqa2Lt8YhMaO8kMCMEflDVTeV0ynygy7kv9JWDvQ0GIfPvuzVbvkXHCAN1E5lnU4GufRn
 OJvuHrmURvgzdhF8CZKQbUkTImC7x60=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190

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
index 3dbc8cc557dd..31e2857dcdcf 100644
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
+		if (test_bit(i, isa_bases))
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
+	print_isa_bases(m, riscv_isa_bases);
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

