Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39E2399899
	for <sophgo@lists.linux.dev>; Thu,  4 Jun 2026 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589015; cv=none; b=khNP6O4ZzH6zka1toUgrxjr++NrwidJRSjIU9EvKj6pi1zSLWbPRrh2I2x6RMxB0ngFd3yLvnM/OqcA1FyojaWoQBBrzF/WcUaS2mZZxncQn/WsZlpGAa9b2IGd2PXIGJwFxbosyliLKwwYQi8BDn59uUz1BZoVQ8F2POINISBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589015; c=relaxed/simple;
	bh=Mpc15BTxXFPLS7siOrt94DVTxzgWbPGCx4J/ojX1QSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVJNZuxTGRhIZ+43m6vSsktmx/8ioRzhhQ8tGz+KDbbVyA6ET7uAomPfkippSsBX4D9Sfhl8nizo8qDnvxFvdw5OJfl8CniEqFRcHNS0EE6BMQkCfBaIt/mq3QqWr1+9C/yugj1qGobvR7Q7bT5eKhe6Ie3VJd1yAExS9MSIc0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R57WYhlK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CPoQ9XWj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R57WYhlK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CPoQ9XWj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654D0lkD2477944
	for <sophgo@lists.linux.dev>; Thu, 4 Jun 2026 16:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8T3I1JSi6bPzTWMglkCJmeKM
	pAKkFgJd3nlCAFBxxjI=; b=R57WYhlKJl3K8bFUdl58ZqjkhTtCV46ZT5QO6j0A
	Kddjcmp6YEGcd8WIruVAt0ZMvC+hOWwkGsLEYz7Yb32W3tRSjhQMXgZc94DdG/6u
	YU3sFnnQtRqKdtqQjus9VHxy5Ee7e1r+jsPLX0pbfzq5ydcL/dpmaF0z9cdGphrJ
	/WYa44pwTb1IiQegKIZ9sqhZSST8w2Iiz/tW0BAkpcmqQsPp61iSH/YrPG4o0pxF
	PHXOOSiUGCCBEuyEbblKvDPdgi5d/iDCJwe1OMDiZjxZ7Cg1LrZfd6m3m8FpJylJ
	7poDjZlZipbJF3WIo4ECfDqr2LrUdd2XCKi/I3p96YyXYw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek4hvj8hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Thu, 04 Jun 2026 16:03:34 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-137eff27f36so1007905c88.1
        for <sophgo@lists.linux.dev>; Thu, 04 Jun 2026 09:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780589013; x=1781193813; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8T3I1JSi6bPzTWMglkCJmeKMpAKkFgJd3nlCAFBxxjI=;
        b=CPoQ9XWjF0bxd5XoWtXvxJ+mV6eCpLz0/LW+lmLSTik9AQpj/V42a7N/YLJmdgIvQH
         n6/LiTSFIKjW2ANsqmeSPpNOWIP9TdogcHC7vlyWSujX/71UGgE9dE5m75HiBAgEi0c9
         hED00BBFKOW/o/y8t7EbK/+LzDqMNaqLD5iOZUgvB6+nvs/duMlx6m3PpGSN9GYFhNkC
         Pu/bMpEfsXrl1J0ruToqQZ+XC4546fYS825RJ3yjWhRnetrTSG7DWvnnnwbgUut3KEiV
         8l9eabMVqPKsCCCTkATszy9AX/kRQ2OqsRrXT2BCQMyypjBXGvCDTtVETWFMFPzS7lLh
         bmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780589013; x=1781193813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T3I1JSi6bPzTWMglkCJmeKMpAKkFgJd3nlCAFBxxjI=;
        b=pivTtvfErLab4WGnJXAhjMZ6YsQrFN/cHYWEMB9J8fCLYtflD6tuzHIY/gHRktP3+r
         FP8rQindAfsf8QTKaSU/awIBDBMbo9Sk/RkDlqA+mGpBDAlmOT7mRiy3RnJ2H/KwjK/x
         +MetT7kqgxsiO437efniOS0TeyuddumAhkViXCZ0p3OljRyNuFk1j6pzPmkx05PgzV4p
         h6ZaPjnQ//jKAWjTBOMxk3BOLyUhfKeE79hzD2RHgG38afIvcFO0vqftE8cFkv54IdIL
         OBJizlg2Cvl4gJ9GXjRf6q57rvnDGFTRoyrtR3Vutqs7gHqGwEnPGXGbVkjI3kZwAhpz
         c/Pg==
X-Forwarded-Encrypted: i=1; AFNElJ+sp5L2YIQ4n99saTaWzBqGkVW7C/kNFY9YNWRf+ALSPte7XiTHdL0p0Kn+VT7jVPHij0VULXE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu4NxEojbRx6G0fYOuFVd2nv/Xqry2ZdLSZldTZxlOet7RJjgG
	xGrDEulGBTIBe22L+wF09vKzJv4e4iKFQw9LuDTSljgJNyFMkcFC0KVukk7y64jb9VPAO/gLQor
	1hkIeOGjquK6DmdnI1ASIbCZ6fhUo54Yp15CxknyHKd21vH5xvx6k+svtmFef7Ie0hyI=
X-Gm-Gg: Acq92OGejHhqFSs2WxtEy1zADKFni2TRPEVSGpGMu1EYzvmB5gpBl6T0MRt8cHn0AT2
	1is4VNf2B9D8+Ej7NfwU7wn9R3ZsPne9AgFz6qGDxq0Objo/bWkhlSfzPCjGS9cZ4wcU1EZjOZ9
	zThxPxTJOD1jNCq8mR3ZfPmHkv/mHA0hpE7XjYelZMs3GgHOo5sgX5axPzj6NSEOwptq5gID/NL
	BRWXQFWYJ9EZ8Qc4vQxb2JgzlQnnAr5TLnQHyorUQAg4RLg7fo9fJsw52pRDx6VQHX3+DolQXun
	lxB2AozjTc6pK09FYiov0kSzQqCeP4jEB1yk5F5jAJMq6+6nRjKlPGa/0Ynh2XkFg4u9dN7rlOF
	BGyhTweB5HHdQatfJJUGs3C/+VtlFmLLmlxbx8dKJsw==
X-Received: by 2002:a05:7022:6089:b0:12d:de3f:d84e with SMTP id a92af1059eb24-137f6c47322mr3331493c88.39.1780589013264;
        Thu, 04 Jun 2026 09:03:33 -0700 (PDT)
X-Received: by 2002:a05:7301:100c:b0:304:4f23:4466 with SMTP id 5a478bee46e88-3074faa488dmr4046204eec.15.1780589001468;
        Thu, 04 Jun 2026 09:03:21 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db55f60sm6911110eec.6.2026.06.04.09.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:03:20 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:03:19 -0500
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
        Samuel Holland <samuel.holland@sifive.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
Subject: Re: [PATCH v3 00/15] riscv: hwprobe: Expose RVA23U64 base behavior
Message-ID: <dyafwgy6wgahizpld2vfuk56nzhueh727u6vzblmasmw24vb23@uw46cc5sxpb2>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
X-Proofpoint-GUID: 2N1JhA722ONSv1CNeG_QCpcLXWp7HNNj
X-Proofpoint-ORIG-GUID: 2N1JhA722ONSv1CNeG_QCpcLXWp7HNNj
X-Authority-Analysis: v=2.4 cv=Zp/d7d7G c=1 sm=1 tr=0 ts=6a21a1d6 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bmEhWVV90QwrJAxICpMA:9 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1NyBTYWx0ZWRfX10C25aM9VtoR
 yWulcqtoSgBM4tQ8UksvL+IkpSPoucuC4y6yTm/BSExb93j/21kp4y4sX+HxvCu/oPGjn0ub/Yl
 HxYzBSirjVEhBh0k/eCalx1yG6HwzlI/WKgi202wb2v+lrIPBl95uYzVHBB/CPJDB1kE3oufCBA
 i3CdWZyJR7XFxGNPaFuo47kr2yxr225g8oWzg4edeFJsJDOxFbVZ1OfDqYoHgB6uN/3uxtpEugK
 qEiM22tpjt8YqBN7M9hXI/9vS5KmDC3QrlnpaPL8RvQvr96kX2DclVWBIZKhPXpHGLfv4IPrYAE
 fFKcEsc1BASQ5ctCmgxFR7BXP4WxJ1kLaNvEj7xEYq84pBwKrwXVAnwNyWZWF4N3C48bIBozIYr
 FzNTmGH34FX4aQsvU2abSZpYovczuUVgtbTHTFMAfjobjHnXaTHcMClkb+WNfgjVAM2VFjglAKp
 b79QzFhMaMsALfzO5pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040157

On Wed, Jun 03, 2026 at 07:11:55AM -0400, Guodong Xu wrote:
> This series builds on Andrew Jones's earlier RFC [1]. It lets
> userspace check for RVA23U64 conformance in one call, instead of
> walking hwprobe + prctl across every mandatory extension.
> 
> The series adds a small framework that resolves profile-class
> bases (IMA and RVA23U64) from the kernel's ISA extension bitmap at
> init time, and surfaces the result through both /proc/cpuinfo and
> hwprobe. Later patches can add RVA23S64, and backward RVA22 / RVA20
> detection, to riscv_set_isa_bases() without changes to the
> surrounding code.
>

Hi Guodong,

The series looks good to me. Thanks a lot for picking up this work!

drew
