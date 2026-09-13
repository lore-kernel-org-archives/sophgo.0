Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2C7390C8A
	for <sophgo@lists.linux.dev>; Sun, 13 Sep 2026 14:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310616; cv=none; b=R/Z17YwTVAJiZX53jBKeOdKjCh9ZsKr50V+612b01agjbiRE89nSPF0gMZ0BPREHKCvhjmf4rHqKvMMAynv2rDQOL1RiAjtMQapF9RsPkjD/niO4r4c3iKEBd5c3Fm2y56UbQw2CjEdC357sxNREYdvjOkZpAUR3+KrHoaNrNVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310616; c=relaxed/simple;
	bh=XT8FfD4NmF6lYMpg9hBHkdINnzuuQPwagoPHTRzOL2A=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=noRe/GEWm+oIgWFpZQOwcNWBq9lv4x4Xv7efYADYF+zsjL9hXZtjlpazoxQcbZ3VCnX58amL0FNHGaTTXlpgVeX53jnZJX2ANT6gEBzY86fuse/tQy7swg3cEY8X1aYgGF1fPj3ZsYoHCr3NUmeiBswmdAPO84/EQhyqQE9U6vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSL789gO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2RjS3jf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSL789gO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2RjS3jf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DE0ov42790115
	for <sophgo@lists.linux.dev>; Sun, 13 Sep 2026 14:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ug9C98lp7dxvXE0xHoDWZuW7wCnDxbIOXSGXdFquQ9U=; b=TSL789gOq5pq0OEL
	mPpWLg8wu0wB4YS2uFYCegeGt0/9p97h9+jSfsJdXCmgTPtJ7eYDLz/ZGByhHbrV
	fyeKvqNV5vVfi4biBdAR/LD9wAHgaGvrnWkWgsOVKxqRM2ARUf9O8zXiKyIDDILu
	D3alpKxJrW2fK/eOL9u8U1V4b2/fNsKx3LCmMeN+kGGUi0HvZlWdH3uAJa/JuMBi
	lxcTi2+svJcxw4glr+yBX2XKAF+qMeR9NpMwwDoLrI9llReJY3vxfzP3vSTBGsZL
	QwOL8mO7Etmg6A4jHUjI8UxmTIwnuR6iyAQtNlWgd2gmdXEVhMnkngiAoEBoHNXW
	LU9cGg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cbhfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Sun, 13 Sep 2026 14:43:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so6176496a91.0
        for <sophgo@lists.linux.dev>; Sun, 13 Sep 2026 07:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789310613; x=1789915413; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ug9C98lp7dxvXE0xHoDWZuW7wCnDxbIOXSGXdFquQ9U=;
        b=S2RjS3jfnIpHmXnMwo7dhWrInLCKxVUZUR5rMwa/yIgNZjrysSMmEJcqGjFbA7tfBc
         zhFUnOFavbNmeb9re4jP0tIkOelcCz+EpOnhq1ukVaCfyIvBfRRR0aTW3CS64+HepOIx
         2bitzwYbkla0aREBZalNghYL2pokiLDLVuTxc3SdA1LYjvV/OGLhXrVmjTc/n+fqECeM
         GJeq+MEp+tfXjVcwh3/JYopYA84n5Q7OacCvhpy15vsMscNleLqU/5Fi2U6m2OYd5iJ1
         bxsnyrfJHbcH8eYLYDW0VyyYygnnCz/7AFyNzyS8OUHMRV021rY45Cjyj1475LfCMpwD
         rs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310613; x=1789915413;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ug9C98lp7dxvXE0xHoDWZuW7wCnDxbIOXSGXdFquQ9U=;
        b=sRt/NzGECKIw6tJlNoRFDEtGMwh4lQbRsoRUBm0y/8yxUDlas+D85E6lWHED8Tp4pX
         vacVd5/jNIzmbxG5Yl3GZo0W/NurT7MzbrNm9dgRnS3Vo2HzEm8vmz3AV38G4biyk+vN
         wVGtNtf4HW7+f80oF1Du4RQ7QIuT/qEakKypNVidlgONW0A4nI+D4PsZEcV3ZiB2Luir
         SyySJ6x5cNfK+pJTHDQMprQeToiNeUz3LcT9JOBgnFoHflSvAyeS1KkhPd57OnbcSe4q
         uF+Kxi3eNhrcb/HO0edOSI0XXrOBtQ0YoUvCd4vzTgzLDX1mDo/4jSu6qXrNJ1eLNSRb
         8X+A==
X-Forwarded-Encrypted: i=1; AKwUvBzmlcNfUiltOO5SWgs41dkyBSNktPywbO5k8fAFB/DIM31FtoCohv4KvPmgsdyYowS54VOVG2A=@lists.linux.dev
X-Gm-Message-State: AFuF++mFrzASpZXq2mzup7P9rw4UEpKk2U6714wumUT7Vb0Q5GwcpUFn
	dQ6Dlvf0/8jVusTxDkLsc9v5mnqWLEaYNI9ej35ZwiGZDgpIk5VekTpMEEifzfAdQzfUWVG8Iwb
	f612NKWI+MGwfZopwTEDl/Vot+pFlqBDH/tPy8uisPeAb65+0XtVc8QQuX9w=
X-Gm-Gg: AYBFou3aA1EF3kIjNh9NnFdH4wKErC42gtuu2Xheqe3+kJv0AgSbLAVeQxOg7Vs6PQe
	QDwV84rdkZ3h0UJMATaGYsiYFGGXp/C8yEI2wQaY2JDayZgofJ79g+flflDjUf65DClrXKAzf5q
	VXlzKPdai+14giW/dj8xV6yNgrcJ0VckkwRo+J36w9gud8Ymz3j+fg4VZXtZMUY8G3wV/SVkY5X
	BQ47JcvpyBxkAajRT8ejSh9x64FN1ZfzKqYeiZmCh6aDEcxhxXLUSZJQHQ8aMyLEuzHNs3CFHWO
	U/vfp8bUlvXbDngsxzGruv8cqVkriSecZWfr5CJPC8YZWIf2gW0UirEXqQ==
X-Received: by 2002:a17:90b:586f:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39d9c374d49mr21935978a91.25.1789310613413;
        Sun, 13 Sep 2026 07:43:33 -0700 (PDT)
X-Received: by 2002:a17:90b:586f:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39d9c374d49mr21935918a91.25.1789310613011;
        Sun, 13 Sep 2026 07:43:33 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm16780590a91.14.2026.09.13.07.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:43:32 -0700 (PDT)
Date: Sun, 13 Sep 2026 10:43:28 -0400
Message-ID: <c24e720e279fed0296f1f78630b6a471.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
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
        Andrew Jones <andrew.jones@oss.qualcomm.com>
Subject: Re: [PATCH v6 11/11] riscv: hwprobe: Introduce rva23u64 base behavior
In-Reply-To:
 <20260812-rva23u64-hwprobe-v2-v6-11-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
 <20260812-rva23u64-hwprobe-v2-v6-11-c985af3256b8@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfX8ebLsmoq2NWQ
 XJZH7jzq4B1TKyEev9RSDLZDLu/jvl8cAVnd04oV1F3xO5A0ZE7LSHflncUMxJEwr458xuiLArI
 0/cGRH5PieHRMhOGfaYEfjazd0BJbnc=
X-Proofpoint-GUID: Zds3t8ENVO6eb5eD2cST3VPBuTPmYLOQ
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa6b696 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=0YUHzDklBslsgzCo5oAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Zds3t8ENVO6eb5eD2cST3VPBuTPmYLOQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfX1AehjilqZIfz
 mJp/nqiDcMs1PXXIHeqFur7FL2NlvnQZOxR4dPqEgdDfNRfQkPQlSGCSwVt/H9lkJre+n5ONkj2
 0zq5+Abkfpcna5jS0BMxyoMXq0K7BpSUxIg7HYe3RLrT/SwkljQxqLkvf2pTurVo9OyuOnXtHSx
 qbEJaSl1rrtA/haKa5GU6h7eElHVh6kY0k/r6riOBIyvITicw3lzdAFQBgA8CW/T+3jNuh8qra3
 7QBchfT6SJMamii1P9GpDJQjaCiZQK7dnsVSsC9vVLY49FS8AC8BCPgHUBCMBQ5NQzHzib3M0Bm
 0Oc/XZDAsNvqlUUEYiA69H8wtQvjGlRY9uSpFyRWTo8/0T+eOpfdhPVsMEpzMGTK3liUSYfhYGo
 55L1qQ2IY+9N1kDJB6bXgcPDlK7TZPodwSgkTBIYMj47oS6eHZ1wB0l6uYwwSN3Uyn7CuHQIU+D
 0dpJqyN/4wVCwj1GHew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130210

On Wed, 12 Aug 2026 19:33:57 -0400, Guodong Xu wrote:
> [...]
>
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 656cb100ac48..a18465e734b5 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
>
> [...]
>
>  	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
> -		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
> +		pair->value = 0;

Today while testing this series with glibc's glibc IFUNC resolver on QEMU
(-cpu rva23s64), I found that this hunk introduces an initialization
ordering bug, which affects the KEY_BASE_BEHAVIOR valude in vDSO.

> +		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_IMA))
> +			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
> +		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
> +			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
>  		break;

Both bits are now derived from hart_isa[cpu].isa_bases, which patch v6
09/11 populates in riscv_init_isa_bases() at subsys_initcall. The vDSO
snapshot of all hwprobe values, init_hwprobe_vdso_data(), runs at
arch_initcall_sync, which is earlier. So the vDSO copy of
RISCV_HWPROBE_KEY_BASE_BEHAVIOR is taken from empty bitmaps and reads 0:

  raw syscall            : key=3 value=0x3  (IMA | RVA23U64)
  __riscv_hwprobe (vDSO) : key=3 value=0x0

Mainline returns 0x1 on both paths, so this also regresses the IMA bit
for every vDSO user of key 3. The selftests did not catch it because
they call the system call directly (sys_hwprobe.S); glibc's
__riscv_hwprobe() takes the vDSO fast path and did.

The fix is to register riscv_init_isa_bases() at arch_initcall instead
of subsys_initcall. That is still after core_initcall(tagged_addr_init),
which it depends on, and before arch_initcall_sync. It belongs in patch
09/11 and I will fold it in there in v7. With it both paths return 0x3,
and the hwprobe, cbo and which-cpus selftests pass on rva23s64,
rva22s64 and on mainline.

I will send v7. Thanks for your patience.

BR,
Guodong
