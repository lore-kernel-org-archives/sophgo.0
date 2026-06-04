Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E186A4218B6
	for <sophgo@lists.linux.dev>; Thu,  4 Jun 2026 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780588915; cv=none; b=LRrsOE0b+17OAs/fFDkWkVV4/deNL4ULl3gy9p0HQMV2Rtpu8KbGTnXUd+7CXEZQBEyCP/pEt9130jJ0Wt7T9LxNm/KXokRxzZgGae19tozkZZON3+YKB5JXVgx+xqSb/LYfmiuOeMRL1FGvuNaPI9OmHVuLd7SfbsLSOK62X5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780588915; c=relaxed/simple;
	bh=Bb5mTrgyt2h5wH9/ID4zexvhJBt+QMk4O3GE6dK3YOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7goMcFoCRNOhGkGerlUwwg9VWodrLGMjbIl+Id4lNlIhISM8yePVC/vSTbMw7YWqwoHnJqEGE6ngtnUpBoYBKgt3QXddkNXHvkzA61cvxmVZofjCDWeQr1lVuUzadIvJQTEyQv5UAutLcJ1hkTZzdOtNHtdr8CK0PlkGjt649o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OF+XSvRY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRGfOmCC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OF+XSvRY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRGfOmCC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654Epftj528942
	for <sophgo@lists.linux.dev>; Thu, 4 Jun 2026 16:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yt4gW85Y9LMlMB5+VVL9pvf/
	wye7kF75DN7q+ptOBr4=; b=OF+XSvRYiLrTH54S9+jd0MNLNy21hVd6XdRt8wwZ
	0pjMiHCqOMO+rMsINhJw6L7neH6unjvY+9GUSK/2X88fKg9XOTBb19AnBXn1LSoG
	ou19z3e2t6MIjiBwOFCbQ3TSgGV8rxh1DVzmFwuS66BCG915tom3yAXcjdtUTsgW
	j80safQqLSn+NuNnDb8Sltf82fX8mRFpErJcWSRgngpurvuc0LmzRv0Qe/vY1qzt
	hhHsiPH/x2iTyAkULmj29aMqSZuAm05syng1M0Oit8Mgkp+PF4oHJ72dZ9KVspxZ
	tGNduT1zRurOxBDDs2NtuTwW61/n5BBkmdLzzpBVW31+mQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekbgdrb74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Thu, 04 Jun 2026 16:01:52 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137dd516985so1281258c88.1
        for <sophgo@lists.linux.dev>; Thu, 04 Jun 2026 09:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780588912; x=1781193712; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yt4gW85Y9LMlMB5+VVL9pvf/wye7kF75DN7q+ptOBr4=;
        b=hRGfOmCCgNFshSFTyvYDR7PGmP4T6ZiGUFyfyaSExtTVnbAvafhICgGJCcFssMaqet
         Z6ObdPFNkaCp01bn364RQggi2pL/2YmlW7+3mgbqNgoyU2BG1glKc99L8O4QrJlAFOBt
         qBTXQWoQouL5EqpaeudvjOFK0q+VSughznx5+aJ9wW2808ij/JWu4brpJJDZLFrzb9V1
         1hSas/LrSlayNhJruRr9KbVV887fKbwVe1/DdseYgrswQv0niYKEU9qpt8FsDn9ybjNA
         1x9d173DPVcYY1n/gyQErx2VutOdaI6Tppg+7Lu6GyyPfvlfzVcJip51fiIjXgmXd5gL
         69CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780588912; x=1781193712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yt4gW85Y9LMlMB5+VVL9pvf/wye7kF75DN7q+ptOBr4=;
        b=Dg/BvRpX8+WaapyBDZtK66InUs9G75gDFKMlhL95dmiD/H6e1GojQp37/HwvO46qfQ
         v0kwzVYsn/clP3I7A2q0YIRklm286g87rC10mlBD++vy2pMJETaBXW2k6HJl69bmMyo3
         mMRgN8Ws/TA1Ue2JIx5yUkV7VxTZc3vfd4PWZw9mJcTLH2/0ehzU4jq/B82S/BpYdP2G
         Oj3nxCwpIVCl+7nCYjOsfZIfmJmM8DHdBZxq+RuluUo0AtijXnY4Hxc2cpVbXjhDEj1H
         LbPA2s5Cc/4FZYJRp+wjmR8611RGo+RidhYVKf+v/7R2H0CZeh22JZx8QSQzJQq+D38N
         ashg==
X-Forwarded-Encrypted: i=1; AFNElJ81RDRluNPHtx4h0I4pOzVQ+1jzE9gtgY/hD6NR9Bao9Rxp9j5h/4EC0OOOBQ5893HRHb94w0Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4Fs4qabQwumpaf2HB7vRWJDxDuVbpWBv6treFhGmSU1eoUnCH
	fA7k/fhoKwwiIXdgrs74kax46xVWcoG9kbmu/o7q3XepXQtPmqN62TuMYMdBXVjT5rchesTE3HP
	PNra1YtdZcWn39nUjl7c4+1LTEpC5yl69xpBuOsICwHEYnS5dI+8ZPEhRS+c=
X-Gm-Gg: Acq92OHVjWPx6JixUh0psRmjlkeHtIOXVaZpzZrYfaZ+A9e93TW+NR3hQdqD3Jzsshf
	++VNMHOmo9pK9xK8ZS11oV3/Gp8kTjiRqgZFvdeQzbIk6mOlukImm+w/L3F5RonB90OZ2vQ3J/g
	zeJvdU6f6AkefW8uCGzlBzN28qEByBXtj4bmxEoAx5kziynSxdIBV1PimzaMi9s7rb3urgXJuvK
	tASgz7YUCkfjknN6S+9DXp2sgUrc8b1MHN22GJFxeQaA/EWvI3hToSotFa4aFbx/WG2CVJiivFr
	iuMHox8mh7u4cwKX+FCXSkjLIxrGiZcej8SfCAlW8BSYE8POEySSAUjUloG+UcX2y0QC9lW2+my
	Vk2sypDpU4A==
X-Received: by 2002:a05:7022:206:b0:137:ea56:358 with SMTP id a92af1059eb24-137f6bd030emr3478930c88.30.1780588910498;
        Thu, 04 Jun 2026 09:01:50 -0700 (PDT)
X-Received: by 2002:a05:7022:206:b0:137:ea56:358 with SMTP id a92af1059eb24-137f6bd030emr3478562c88.30.1780588909024;
        Thu, 04 Jun 2026 09:01:49 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f716017esm5199221c88.15.2026.06.04.09.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:01:48 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:01:47 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
        devicetree@vger.kernel.org, spacemit@lists.linux.dev,
        sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org,
        Charles Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 02/15] riscv: hwprobe.rst: Document EXT_ZICFISS and
 EXT_ZICFILP
Message-ID: <vazr6kop3pbga22p5wbn3oursuic4thh4aeogkndyuskrncgta@cpk6igb7cr6a>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
 <20260603-rva23u64-hwprobe-v2-v3-2-5529a7b28384@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-2-5529a7b28384@gmail.com>
X-Proofpoint-GUID: 8c5LE1pz7TJI0Lu-LXf0eY62xg6GzzEZ
X-Proofpoint-ORIG-GUID: 8c5LE1pz7TJI0Lu-LXf0eY62xg6GzzEZ
X-Authority-Analysis: v=2.4 cv=a8cAM0SF c=1 sm=1 tr=0 ts=6a21a170 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MiYv3HnXQXVWDUVKjRcA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1NyBTYWx0ZWRfX323YD0yXumQb
 Ze+uEqUmfyTILNwTVnFOH2KtiMZfcWrCbdo5OMe4uniyby4UYWm8WveR0hBl+UcdNxgi1G4tvIs
 1QU3o+QlEBU8QG3pZLh6TO2jrZYbkUscWp5VmGwaVi0hcJiQX7dtduydLJjua62rjT8Qf92WjJC
 jzmQDiE6zc0kBTNkt789zabyTDK+kGtPr2vQK92ApM9p132KdQVHnKT1yuZtSPyp0GugxOKX+ZJ
 3Z0J/2M1n9IchZO/oH6YlemlnGOWqr+RLz/1YPZamutBj1APTCNVoKzR+C+Z7xPMLRxjlKIiTb0
 rJnx+1iFSUgq7yVVJGROtaLGDOQLUMv0BhtV6RJH0pUgOMzbOZwgDQRr/gNQlUrQz53DeqNvW/o
 YPjqZlPd6iNrzOHkoYMGSdr8Ub9mWS79qR943KM2N+gxZIIXiNFSC1D8en87CekddizLfdMggld
 Fbyj5FKBf6Hr1mbwg0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040157

On Wed, Jun 03, 2026 at 07:11:57AM -0400, Guodong Xu wrote:
> Commit 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss
> enumeration in hwprobe") added RISCV_HWPROBE_EXT_ZICFISS and
> RISCV_HWPROBE_EXT_ZICFILP, but did not add matching entries to
> Documentation/arch/riscv/hwprobe.rst.  Add them now.
> 
> Fixes: 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss enumeration in hwprobe")
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> ---
> v3:
> - Also document RISCV_HWPROBE_EXT_ZICFILP (bit 63 of IMA_EXT_0), the
>   sibling enumeration added by the same commit (Andrew).
> v2: New patch.
> ---
>  Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index a09a8f16bd16f..3cedaaa53f331 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -289,6 +289,11 @@ The following keys are defined:
>      defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
>      load/store pair for RV32 with the main manual") of the riscv-isa-manual.
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICFILP`: The Zicfilp extension is supported,
> +    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
> +    extensions specification, ratified in commit ff03d8485a04 ("Update to

Can we use commit 302a2d45c243 instead since that one has the v1.0 tag?

> +    ratified state") of riscv-cfi.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
>    :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
>    mistakenly classified as a bitmask rather than a value.
> @@ -391,3 +396,8 @@ The following keys are defined:
>  * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
>    extensions that are compatible with the
>    :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICFISS`: The Zicfiss extension is supported,
> +    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
> +    extensions specification, ratified in commit ff03d8485a04 ("Update to
> +    ratified state") of riscv-cfi.
> 
> -- 
> 2.43.0
>

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
