Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA670339705
	for <sophgo@lists.linux.dev>; Sun, 20 Sep 2026 07:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888729; cv=none; b=kPH6ewE3WfPQZF2u0vv762ZLJ+V9YPcCjWMqN6in4f8WBSQLdBbxouoQAhnzzP+hSas57R8YgIFyii8V+6L+yr6WEg79EIuRQ0pUFq9ajPZwGdZBIjA9VZieTdDULtEnbe9sZJTqhxjBh2ARiXK5qfTY1ZcwohBlkPZu8/O2+44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888729; c=relaxed/simple;
	bh=q+v5z2ZHY+dLT8pX5VQLPmJS9sZvJA0/5oSu5VcFUjs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IpntPXCd9YivkczrWzRbxvq5xGTU23ztxw0hZesTlsTkk0V6B9OfMNMaX9dck2OJVMK/J4PoRZZAmDXqN22qwvg0vmszO9Pt+8Pwqr/yFSE5SKC1k5GMGvOzHik1VX+2SAuOzDHkmsJCYYL3gHHiBAOBK/vrJNi8e9dt/9vIdsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cz7eRwMs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fIeKz0SR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cz7eRwMs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fIeKz0SR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K56CZd2098772
	for <sophgo@lists.linux.dev>; Sun, 20 Sep 2026 07:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jqM0RovfiDvzJezKxW5/YL
	BkYTx4fja7sD9vYRhlE5M=; b=cz7eRwMskLcek4pXCVrptYZ3tGEPU9Auy69OxK
	LrflO+KZmEMC1Xgj3QgZBXYSYSozjTJSsUsU9TQC3ufRaL0L98sem10eGKmffCyF
	iOfQyfIjMH56I8gmakiCZ4TuBXIrDl375bQtaB1CQshNIESTt5UNTrk1G2aaTc4Z
	Myeo+jf8Tog9v/e1crtOyxvJpPBE/Frzu3cQqhVq32adO2Rkska52CYKFsKEbhT2
	BmjDw5RdfbTbp48ejFGo5SeluTvbvHaXp0GzG6gdTTqCySNAMYdUGD8CsxUBK6Zw
	hcq+HrpOMoQWdZVY+fCK8a7PlnTXIlmqMRNmuyUD08VQIYag==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshyxthk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Sun, 20 Sep 2026 07:18:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so1957844a12.3
        for <sophgo@lists.linux.dev>; Sun, 20 Sep 2026 00:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888725; x=1790493525; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jqM0RovfiDvzJezKxW5/YLBkYTx4fja7sD9vYRhlE5M=;
        b=fIeKz0SRWc+S9PKnHcwopHKypjOFXat30YmAwrJ1qadCNj32y9+k8mQsQQPIJpj5SI
         uxS50Sr82jbp1iRSRbydbG00yZ7EwzDUvsI38TJE+VbgIp7scCcQTn2B7hFBWT/S4ebI
         P2dSIDYlSZV1LUxDP4NWUZx0OcQ0u5aKZtLWrzXtv1Lq+a7dgG5ry0mE7P6vMasdcF3N
         yqBPIWg1OzjjiedCLMixfAoVA6JqNHxRasM0CzMHhNbs+aC5XiosvEEbf9LqSd5MKb0g
         8EKhIAptDTqbiVjfzvoO7fIC10vjITTXwS0COTCIJmCiUmCnxkzp1XtbArpS4cdbgdbh
         pYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888725; x=1790493525;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jqM0RovfiDvzJezKxW5/YLBkYTx4fja7sD9vYRhlE5M=;
        b=jtGKbcaQ+/lWBs4h0skr2Z4NYYlYMJEfRzejwq6DrwFmGc4dN7gatDIXy9UyW5gGiz
         49ipIvSBvEvsxj4wnzrslRyT5pZ1+5ORlcgwaOAGjivU114m/A5T18W55mIsKxlyJn/Z
         WTJ/MsY+gR++i1z5cz2nrizQblnF8gAwF2kCTKNYVTFOtad5st+uKvrDTD3Yh4nbWfcU
         JgSBY7U/Wn9KahJho9UBKamnSXwi+bWxYL4A88v+j6uVEFdmkQ9qoS/kYJliE5Inojjz
         9mRZ1fYz9xp34higzE5JBMeTxvDcUkk3pTHlINHkPFPh8rq/EG6memNffYyLKF+UQruh
         R33w==
X-Forwarded-Encrypted: i=1; AKwUvByxNKwF6ZOXk7MR4DWXyFvANM4Y9AwxztL6npj1LsubmP66MoOd3gthvmihFsKOAGKfvtsjx3Q=@lists.linux.dev
X-Gm-Message-State: AFuF++nopC4bBpT5s5UK4is9gsQD6K09lyOM14Y89juOTcN6c117ILt4
	oGjVJBtTTeZBOHHoXxzK/sc2DghT9/LdmXM2tiSRBe9OlpHn0Pqf924nk75gbvcsmjh+MxS5mnM
	Wb+Xw64gKsCENaXwcJVgtpzoXk+JSDUgzHflnmYiELFkVE1q9BI/a+tJFeEE=
X-Gm-Gg: AYBFou1tXKx6EfOJ4pPJ61oAk9WQCgly30gU0zqnZ5TBJC6FByQTKyMAhT9wjVkyKv3
	RHAx7yZUlxJEaeTp3+cRKbPYaui7XreW2q7Gp+en6wMGZ+CMqGvR8tLd4VVKhW67AS6c/Cm3S4g
	o3Ul4rsi6OdcNuabpcRXjbodO96OKq9JqA3H7HIAV+BAaFm98HZd4i+JXQ67tpQCTSP61T1m5tF
	bqk9j5f2xQuODWZXushRxNP7QiStA+4oZ33IEef1IfSBBFV5V0jJLUQC70n/4UG0EJdNWfPVKv1
	TID1aBN1QJRoFixYaErEbJmSxZxZBbIrctqrAwT1k1B8OjcDZ3XtvMLbqMM=
X-Received: by 2002:a17:902:ce0a:b0:2dd:c100:80b3 with SMTP id d9443c01a7336-2ddc10081f3mr52961635ad.46.1789888725018;
        Sun, 20 Sep 2026 00:18:45 -0700 (PDT)
X-Received: by 2002:a17:902:ce0a:b0:2dd:c100:80b3 with SMTP id d9443c01a7336-2ddc10081f3mr52961405ad.46.1789888724448;
        Sun, 20 Sep 2026 00:18:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:18:43 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Subject: [PATCH v8 00/11] riscv: hwprobe: Expose RVA23U64 base behavior
Date: Sun, 20 Sep 2026 03:18:20 -0400
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALyIr2oC/3XPTW7DIBAF4KtErOuIv8GQle9RdTFgHFMlcQq22
 yry3YvTSlSRI83mScP3hhtJPgafyGF3I9HPIYXhkoN+2RHX4+Xoq9DmTDjligLVVZyRi0nJqv+
 8xsH6auYVazmthXHWak/yy2v0Xfi6q69vvzlN9t27caXWjT6kcYjf99qZr3t/DYxtNuShFWcOE
 KTsWOuaGJJLI8a9G85kLZlFYRQV24zIDAA3WFuuhZbN8YzhVAz5z3h2isyG6ChDLqWRWj8aUIy
 aPjFg/Y5TrDMSlQF8NFQxNOPbhsqGMxqwExyU1c2Q0v5jwlNWzoWqC2UYbFN1phAFeNsa9EZtU
 Muy/AAquVu4LQIAAA==
X-Change-ID: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e
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
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Qingwei Hu <qingwei.hu@bytedance.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9252;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=q+v5z2ZHY+dLT8pX5VQLPmJS9sZvJA0/5oSu5VcFUjs=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HQfdbzJuuZMW/va+wrNPsrGVGiohMyqLKyYGzguuC
 vLQsIztKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgInY7GT4n8DQ4tB0kTnAiWP2
 vcwz24ovCqQtuq2Ul3v8dx7v9z1r3jMyNFfyuzxf/uPrjG3LPWPPOjA+nbesjyX8Wvecg67LvHl
 vsQEA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=PaRqFShd c=1 sm=1 tr=0 ts=6aaf88d6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=ee_2aqc6AAAA:8 a=PlMrqp6MWOWACOo6-tkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfX/N0S+96H7U5C
 I9Gk43yrywott+JYvyl2nlOzpNHpB2Fey8YsnWIG5vJQiqgbhJafU8xF5PBjMpviz9uM8eobe22
 Rt2YpCktIUmTK9TWd55M3DLIe9sCFvI=
X-Proofpoint-GUID: jCE-D8DsFIYlAT7NoLmD7TU6IDdC7LtC
X-Proofpoint-ORIG-GUID: jCE-D8DsFIYlAT7NoLmD7TU6IDdC7LtC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfXxgitvnYZsQVq
 ro+ycTh//XqN9+2bodtN1Oj9nwr2ZWh8Q3TrcwY+knqZopEpVXW88YKVtrAIO7yTNzARon2rvym
 2YhUgod4vucqYI2k6W3g3owAchoLlwyXPp8jpp70cDSoIr38PSttuGhGnN7GeYbcbguspR8/gPJ
 vkkCqihMzLWP5wRQcRIDbwjWeVoUF3g1Nxrt5biz2ad5WhKq8ZWaTNcvwGC0qbq6kosgGaJ1WKR
 WLlRDvHYRx/k5XusM4L2pSrpDyp1oVZLWm6oLp7IKU4iQeRKCsKQ5nMi9mbMyOqBZue3Way9vRY
 B9SIAEz3oM3Mg16HLx43tipeGp4ZKgcyIL7zvlMzrRY9l+Zx4l0XEcBhLCw2lzHD1Wv04cBHoXP
 daGMC9QaZi2jHXx0mg5UScrN5qsGQL/0JYRXJK2xpaEWZRMVran07QX1bRB7dsVU/IaOUnMMrH1
 2qsP/kbgxLm5hwgT30g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200103

This series builds on Andrew Jones's earlier RFC [1]. It lets userspace
check for RVA23U64 conformance in one call, instead of walking hwprobe +
prctl across every mandatory extension.

The series adds a small framework that resolves profile-class bases (IMA
and RVA23U64) from the kernel's ISA extension bitmap at init time, and
surfaces the result through both /proc/cpuinfo and hwprobe. Later patches
can add RVA23S64, and backward RVA22 / RVA20 detection, to
riscv_set_isa_bases() without changes to the surrounding code.

v8 corrects the authorship trailers on patches 9-11 after Conor's review
of v7, and is rebased onto riscv/for-next. The only code change is one
line in patch 11 made redundant by commit d0fc6fab2046 ("riscv: hwprobe:
initialize pair->value in hwprobe_one_pair()"), now in for-next. Patch
11's commit message also explains that the BASE_BEHAVIOR_IMA bit is
derived from the cached bases instead of being hardcoded.

Series outline (v8):

  Per-extension cpufeature parsing + hwprobe export:
   1.  B (the Zba/Zbb/Zbs set).

  Zic64b (new first-class extension):
   2.  dt-bindings: require a cbom/cbop/cboz block-size property whenever
       the matching Zicbom/Zicbop/Zicboz is present.
   3.  Zic64b dt-binding, with a schema check.
   4.  Zic64b cpufeature parsing + hwprobe export.
   5-7. dts: declare zic64b in the SpacemiT K3, SpacemiT K1, and Sophgo
        SG2044 device trees.

  RVA23U64 base detection and exposure:
   8.  riscv_have_user_pmlen(): accessor for user pointer-masking PMLEN
       support.
   9.  cpufeature: per-hart and host-wide isa_bases bitmaps; IMA and
       RVA23U64 detection lives here.
  10.  /proc/cpuinfo: print "isa bases:" and "hart isa bases:", e.g.
       rva23u64.
  11.  hwprobe: expose RVA23U64. The IMA bit is derived from the same
       cached bases instead of being hardcoded, so it agrees with
       AT_HWCAP and the cpuinfo lines; on any system this kernel can run
       on it stays set.

A follow-up series exposing these extensions to KVM guests (extending
the KVM ISA extension ONE_REG interface) will be prepared on top of
this one and will be posted separately.

Tested on QEMU with '-cpu rva23s64,sv39=on':
1) /proc/cpuinfo reports
     "isa bases : rv64ima rva23u64"
   on both the aggregated and per-hart lines.
2) hwprobe RISCV_HWPROBE_KEY_BASE_BEHAVIOR returns
     BASE_BEHAVIOR_IMA | BASE_BEHAVIOR_RVA23U64
   through both the vDSO and the raw syscall (v6 returned 0 through the
   vDSO, see [3]).
3) With '-cpu rva22s64', /proc/cpuinfo reports "isa bases : rv64ima"
   and both hwprobe paths return BASE_BEHAVIOR_IMA only, as expected.

A branch is available for all patches in the series: [2].

Link: https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/ [1]
Link: https://github.com/docularxu/linux/commits/b4/rva23u64-hwprobe-v8/ [2]
Link: https://lore.kernel.org/all/c24e720e279fed0296f1f78630b6a471.guodong.xu@oss.qualcomm.com/ [3]

Changes in v8:
- Patch 10: Andrew Jones is the author; most of the code is still his
  from the RFC. Added my Co-developed-by (Conor).
- Patches 09 and 11: added Co-developed-by for Andrew Jones ahead of
  his Signed-off-by; the RVA23U64 bit, the hwprobe.rst text and the
  mandate list came from his RFC (Conor).
- Rebased onto riscv/for-next at e11160948333. Patch 11 drops its own
  pair->value = 0 in the BASE_BEHAVIOR case, since commit d0fc6fab2046
  ("riscv: hwprobe: initialize pair->value in hwprobe_one_pair()") now
  zeroes it for every key. No other code change since v7.
- Link to v7: https://patch.msgid.link/20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com

Changes in v7:
- Patch 09: register riscv_init_isa_bases() at arch_initcall so the vDSO
  hwprobe snapshot (arch_initcall_sync) sees the ISA bases; v6 returned 0
  for RISCV_HWPROBE_KEY_BASE_BEHAVIOR through the vDSO, IMA bit included,
  while the syscall path was correct [3].
- Patch 09: keep riscv_isa_bases static and add riscv_isa_base_available(),
  mirroring the extension accessor; patches 10 and 11 use it.
- Collected Acked-by from Conor Dooley on patches 02 and 03.
- Rebased onto riscv/for-next at 77ae27fd98f3 (post 7.3 merge window);
  no code adaptation needed.
- Link to v6: https://patch.msgid.link/20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com

Changes in v6:
- Rebased onto riscv/for-next; dropped patches 1-6 of v5, which have been
  applied by Paul.
- dt-bindings block-size: only match nodes that have
  riscv,isa-extensions (fix suggested by Conor, breakage reported by
  Rob's bot).
- Zic64b dt-binding: guard the zic64b rule the same way (same defect
  class, found while fixing the above).
- Follow the _BITULL() style of commit 8da45c93dfa9 ("RISC-V: hwprobe:
  Use BIT macro to avoid warnings") for the new hwprobe bits (EXT_B,
  EXT_ZIC64B, BASE_BEHAVIOR_RVA23U64).
- Zic64b: RISCV_ISA_EXT_ZIC64B renumbered 110 to 116 after upstream
  additions took 106-111.
- Link to v5: https://patch.msgid.link/20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com

Changes in v5:
- Rebased onto v7.2-rc1.
- New patch: make riscv,cbom/cbop/cboz-block-size required whenever the
  matching Zicbom/Zicbop/Zicboz extension is present (Conor).
- Ziccamoa/Za64rs: drop the Zaamo/Zalrsc validate callbacks (Conor).
- Zic64b dt-binding: fix a double space in the commit message (Conor).
- Collected Reviewed-by and Acked-by tags in v4.
- Link to v4: https://patch.msgid.link/20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com

Changes in v4:
- New patch: sort the multi-letter Z extensions alphanumerically in the
  dt-binding (Conor), and place zic64b at its sorted position.
- Zic64b cpufeature: validate only the CBO block sizes that are present;
  overlaps Qingwei Hu's earlier patch, so it is now authored by Qingwei.
- Document EXT_ZICFISS / EXT_ZICFILP: cite the riscv-cfi v1.0 tag commit.
- Picked up Inochi Amaoto's Acked-by (SG2044 dts) and Andrew Jones's
  Reviewed-by (documentation patch).
- Link to v3: https://patch.msgid.link/20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com

Changes in v3:
- Add Zic64b as a first-class ISA extension: dt-binding, cpufeature
  parsing with a validate check, hwprobe export, and device-tree
  declarations for K3/K1/SG2044.
- Patch 1 is now a clean up of hwprobe.rst indentation.
- Document RISCV_HWPROBE_EXT_ZICFILP alongside ZICFISS.
- Move the Zicclsm hwprobe.rst entry to the IMA_EXT_1 section to match
  its bit allocation.
- Collect Anup Patel's Acked-by/Reviewed-by on Patch 3, the capitalization.
- In cpufeature.c, set the local ext_mask with __set_bit().
- Update Guodong Xu's email to docular.xu@gmail.com.
- Link to v2: https://patch.msgid.link/20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com

Changes in v2 (since Andrew's RFC v1):
- Rebased onto v7.1-rc2.
- Reworked rva23u64 detection into per-hart and host isa_bases bitmaps,
  shared by /proc/cpuinfo and hwprobe.
- Scoped to IMA and RVA23U64 (RVA23S64, RVA20/RVA22 cpuinfo output deferred).
- Link to v1:  https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
Andrew Jones (3):
      riscv: Add B to hwcap and hwprobe
      riscv: Add a getter for user PMLEN support
      riscv: cpu: Output isa bases lines in cpuinfo

Guodong Xu (7):
      dt-bindings: riscv: Require block-size for Zicbom, Zicbop, and Zicboz
      dt-bindings: riscv: Add Zic64b extension description
      riscv: dts: spacemit: k3: Add Zic64b ISA extension
      riscv: dts: spacemit: k1: Add Zic64b ISA extension
      riscv: dts: sophgo: sg2044: Add Zic64b ISA extension
      riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
      riscv: hwprobe: Introduce rva23u64 base behavior

Qingwei Hu (1):
      riscv: Add Zic64b to cpufeature and hwprobe

 Documentation/arch/riscv/hwprobe.rst               |  16 +++
 .../devicetree/bindings/riscv/extensions.yaml      |  54 ++++++++
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        | 128 +++++++++----------
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  80 ++++++------
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  48 +++----
 arch/riscv/include/asm/cpufeature.h                |  13 ++
 arch/riscv/include/asm/hwcap.h                     |   2 +
 arch/riscv/include/asm/processor.h                 |   4 +
 arch/riscv/include/uapi/asm/hwcap.h                |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h              |   5 +-
 arch/riscv/kernel/cpu.c                            |  26 ++++
 arch/riscv/kernel/cpufeature.c                     | 140 +++++++++++++++++++++
 arch/riscv/kernel/process.c                        |  12 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  24 ++--
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |   2 +-
 15 files changed, 418 insertions(+), 137 deletions(-)
---
base-commit: e1116094833337fe9480fb9527a59c7637b96118
change-id: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e

Best regards,
--  
Guodong Xu <guodong.xu@oss.qualcomm.com>

