Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9937546EC7C
	for <sophgo@lists.linux.dev>; Thu, 24 Sep 2026 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246306; cv=none; b=FKkUF09xNACa6IJrw03bT1nQBkfbE2K2JlYZDgPUL6/lv2b8rReR5wpgHES5VUQ7nmA3vqu6opvD3LqynOCN8pJNO6NwTkZrDIQ4YNTxmddkJCzK5Z8tK9uPFxsJSyMjs7hlRzhZ1y1Jb01kRw78SwpB+J9Oai0P6JJtXEF52CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246306; c=relaxed/simple;
	bh=iRYgEa0QAMnnHBbeXblwmyNrfIIZOdOkl2Cx5CFRM0I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kHzoHwPZRt/jqPlFh0TjQ5Cn7jkNHkmWP+8l1XhWiGRQsn5SnYwLfShyLT1PXZkt96fKp4DkOR3rfulhgIrGJEXF4T+eHP5tbRWbVn0dB9RD4oBJqc23Idr4cZHUkn5c8oL/CRnDRxANo38njIM+6tbcYHIrYAn21Tc3eMBrAec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jvz+aEYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SxYb7cIh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jvz+aEYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SxYb7cIh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA64MT2332988
	for <sophgo@lists.linux.dev>; Thu, 24 Sep 2026 10:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=; b=Jvz+aEYXV7Apcmn+
	vkfNaEKwF0eu+xAlptFyaL/dkXTPeYDhmrqrZLuhpNAXELbL/lJgXsqlOi8zFTa4
	Q6/qou+pPsUxkWlb1zrNHBtOg+IZKhPqsTr7VgozrgFjRGOebms+0BhhUy3EFOcD
	yYT9yO/vd14VNxVoyZ0uJkkF0f2bI6CYtsPH8KlghzAhoqXbmC581JoG4aLU1M/S
	GZ28uDcLPkDcBh7SMfUxZQ84V4H5EzqkU0kSwH2kU+XWqGxTYsYLrf7FzoUDIwFE
	9ev5oRCIecUoWpi20Z0tcSHyDifoPLgy1JWCOUhmbTLN7ebQueJtmCus/XUcgyQK
	R6lILg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjg3pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Thu, 24 Sep 2026 10:38:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-862a0aa7d2aso1631916b3a.1
        for <sophgo@lists.linux.dev>; Thu, 24 Sep 2026 03:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246302; x=1790851102; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=;
        b=SxYb7cIhpTbyAF85GFxiBQ1mS/og9Sh2aUAPSIBSY6EQR5SuBScCm12ex7rs4JbcrZ
         YZ3Z3UrlwfyM3lKKLJ4c/+SE344nTN0SBCkc1v+soOpdtG4U88miDmY3P52Dq06/MNpu
         ZeJfCaldPZliEZ7YojQPzWhBhIhubDjtOJZ/x4VKf3vINFz6yInp7u51ZgxnniuJfeet
         FJ66a0tDZj5Rvi9aRe39KfKB3IIs2K1DzYhFhPjU2yWgO/nHK0lAwWcqfUQCsOArBfVQ
         Ccl9Ufr7u7P9f7Zb/iQjNAm90YgH1zfol9aMFl4RVyoYW4UHH83YXmYmR3KrSDcEBBcE
         c2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246302; x=1790851102;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=;
        b=ysvVgdKf/P2W2vmkjMSpO0MxSIj83bxBmOd8gOmrcaxEZyysAiSwyQFL9GDKddg2li
         Rw5Qulw2A77SHeun0nuwSjKNnivElglRNxrlwFcbb/6moDeigaYxQt4H8oD0rb+mT9pw
         N7xefCRfNJeERQjasNneQzWCct0PhHyqe8ae0yVN445/hp/iEqbMl1TwWxRIDwGK6wcD
         Tz/IRO5VByQ5RVhlUh0LxzhAEsbXWOdMdFTrCGCGuGtQYDQ1GthG3sIoRmTtqt4G9Bq2
         9yG/biFoaESo+tszeHKxeQk+LdE6oUfx5tIEUCoe68oou9Bbo+8OpwRCPZU7k8ljpPMZ
         DXNg==
X-Forwarded-Encrypted: i=1; AKwUvBxedxoncstKXLibPYbLAzy0ny30RGHivAE4jF+BTBib1f409OlRNTfCxnEUerzww8HfcuRVqcE=@lists.linux.dev
X-Gm-Message-State: AFuF++l1HCc7llUPAKRXcnECVBBcql03UraBE+GL8Z7pE5rYJ5KdHIK2
	rYSGC+u3pZD6RPvKIpreC/HxmqzCvLn1qsqUdMWVJwTuEPfitZ6GxvZrj1IHIrJQ8RcjsxT8Oi6
	bEeprzocXN2B6UK95pm7v8yfSKTYdTalPP4TfHSF4+TGKRcHe4w1vthu7k4o=
X-Gm-Gg: AYBFou2Mj28PgLGmQVYw6B17m7lRHkwT64M0w+6x1pBMPgE9qgvkbZnoDswBPNobbk7
	l2DQelnIyyOs9eQJGri5i33CKr0RgJfSTzw77oVRCm6Pv2o02We/Uq5W8Po2nI9BPssorp6cAP6
	0NOkgNCriUzfVeb5qryFsVTRhHBDU08o7S06Me9nyzYbTWJ6Df7BqSxYjao/7yg8oAeaU7gkNWN
	83lcBFEDcaiNgFGwWRvhX+jUW9Bien5q7YuK1cUH0AKJjCs0vOBWXd/S6fjbDBc1EqHsQoa0UyY
	p65NbVWV2nyzUlTVqPrLKO9BuFrCGE035/a31kloKXjFWKjw80TA38qq
X-Received: by 2002:a05:6a21:6f06:b0:3d3:ae40:51e2 with SMTP id adf61e73a8af0-3de0e75067amr1904807637.22.1790246302089;
        Thu, 24 Sep 2026 03:38:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f06:b0:3d3:ae40:51e2 with SMTP id adf61e73a8af0-3de0e75067amr1904783637.22.1790246301600;
        Thu, 24 Sep 2026 03:38:21 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dadae09sm2691132b3a.38.2026.09.24.03.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:38:21 -0700 (PDT)
Date: Thu, 24 Sep 2026 06:38:17 -0400
Message-ID: <15151b8ab012ca7444d4117e393cf999.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
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
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
In-Reply-To: <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
 <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: KzbFrnR3XqnFswX6IFna2-GL5ZIS2Lx9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXzfnr5Z5aL93/
 796sADZeao4AGe5qImYr1iylEZq95arsj6CO64OKJz0x32zSQNvD1ALkMMcakd8G7XrS7/nOHse
 G0Qaf3eji6Z3YG1nBkhwOwoFslCihy1k5wmySdeu3TYjd349P87tSCEx+QneTq4tfeWQ0D5drbP
 LRtax14PcdLdKauuxwhraEjcGJMHKWWTXjIQf6Cxe1FyfHGb2TJfGE6PdrUEyIaWUbHWWVqzaRQ
 C1DRXlT74PimjpcttA6lPaRhzpYIyFx+KfFxLIipydX2L67Qd9G+nUwmOus6UyvkfWd/7cN99f/
 QnHp/IY7Z9Y+W3jQWgbm2emFW6Le55523+s265nQWtBf8l+hDimtLfz0UlTqhg/VMCa+7abR1fx
 dO1Sqv1Dyioy688hsxVi6mwRsdrFWRlnqD/amkl8qkjZfM5JOFKXe6BeDudxi9rOd3/4oiK6QR3
 xgBaYe4jErLSoJFyAjg==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab4fd9f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=TMGBcqugHITK_y5VCRUA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: KzbFrnR3XqnFswX6IFna2-GL5ZIS2Lx9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+M7F+vIHVe0L
 yLhJpfQ3vHSNp4fO1MLGNQ1mXMRCcX8KtdWlVVg7l6wf6qP7S2kUwvZP+qAGSQmI0ZZ7o0tcqRQ
 puCyJINk9qLNDATuKTZmcWbj7PlaftU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Hi Heinrich,

On Mon, 21 Sep 2026 16:24:53 +0200, Heinrich Schuchardt wrote:
> On 9/20/26 09:18, Guodong Xu wrote:
>> [ ... ]
>>   	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
>>   	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
>> +	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
>
> Hello Guodong,
>
> The RISC-V Unpriviledged ISA specification has this description of 
> extension B:
>
> "The B standard extension comprises instructions provided by the Zba, 
> Zbb, and Zbs extensions."
>
> __RISCV_ISA_EXT_SUPERSET would imply that something else but 
> riscv_b_exts is in B. But such an extra seems not to exist.
>
> So shouldn't __RISCV_ISA_EXT_BUNDLE be used here? Some code further 
> change may be needed to set extension B if riscv_b_exts is fulfilled.

Thanks for the review. Intentional, and the difference between the two
macros is whether the extension gets a bit of its own.

__RISCV_ISA_EXT_BUNDLE carries RISCV_ISA_EXT_INVALID as its id: parsing
the name only sets the bits of its parts. That fits zk, zkn names, which
are shorthands with no identity of their own beyond the ISA string.

B is different: it is a single-letter standard extension with its own
misa bit (in the same way as A), and AT_HWCAP on RISC-V is the bitmask
of exactly those single letters, so the kernel needs a bit for B itself.

A is declared the same way; with the spec defines A in the same words as
B. If I can take that as a precedence.

IMHO, "superset" in this table means "also sets these subset bits", not
"contains something extra".

Guodong
