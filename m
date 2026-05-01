Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CEF3F0A94
	for <sophgo@lists.linux.dev>; Fri,  1 May 2026 16:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777654199; cv=none; b=DKNOqlQixMDBW2YkBwRC5/IzbTE/F7xOrl1VfvU0PXeUZfOZTY0s0Ed5Ig5y30YekI0jhAijSJ8w/k0VrqWk8eunwisypeWQ7hKLmdX3bekcZDpOgcsIJjU8nzb45Ki3/disecI1YAZVW/lgwbUsm8uTIcey/w1xLni0jHbCOJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777654199; c=relaxed/simple;
	bh=AeFj9RlfcVtNzkLfxECuvl65xXkTuveJF7S801IXsoM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ep/TTYlcP0cD3A8B2RuZMcufrwfk8T2rnnxuxyJfPhhAeagyPThKLkRb6+NsO6Uvnhd3XP5VSK0jIPOjsNj+udkmAiQk1EIzkGhN4vgJjlS3YOAefm7f31p9SHCCm9SeNw5I7u1Q7UDcJvhlVM1b4A1D5VJc43TwvWCM/sg8BNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E4Lm8/SK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PmcT4TRb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E4Lm8/SK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PmcT4TRb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLfMf2661234
	for <sophgo@lists.linux.dev>; Fri, 1 May 2026 16:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feFL0BYgyPheoYTLYTI9tk0q8RVVFngbLeFU5p1oZJE=; b=E4Lm8/SKwdvLwwUO
	R14AGeyRZT3l4cApH32rC5V17GsWufgh8yroUBXezusJNnmOg1FQ41yUCPvTgXM9
	NsKEFQ/kIfgPHK1eEjAEkKQzPhIqs6QFmLM7kfiA1cg2Dua1VdfUKfsftft53Z3e
	pgIAiBoljAiTJOpike+ssSj7akRC+lDgSLg8/Urv5J1T2wrDRPo57JpvUxT+o/j7
	7phFoVywUDNIo6wY9n8L2WdmK/AOUbmBQUX+1qWU24b0CSv3sm+knXBZdGp3+ni6
	kHj0JzQsAyA3aBnJ9PKH2r813YKZ2JVYlB0yWadj/zIOd++SAiWFHqqVup+OybTO
	jfDq+Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvhbtj784-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Fri, 01 May 2026 16:49:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35e56ed5d5bso3502255a91.0
        for <sophgo@lists.linux.dev>; Fri, 01 May 2026 09:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777654192; x=1778258992; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feFL0BYgyPheoYTLYTI9tk0q8RVVFngbLeFU5p1oZJE=;
        b=PmcT4TRbuAZqJdypXfB57grrvGitJLgY6DoSiat8ogV0y6U8TYEprZYEyC/3TYypjp
         3lZ+2ZhbHm/YxSZEr8v2YTrHfhNzvJE8AeJ55lXb1K9l4qrByDmcY+c4E7V/ASN5OjfS
         EUH7Lpkox7x8nb5kKJth3lS8ut4C7qdfNIGmcQQaB30+lZx0XxNlNTqSZJ3fCIsXvv0q
         xAyUllbTrz/nDAWkEW6Ipf3FRWYFB2lODTv2oQCD+cDbesyPYXRAI8E1RJZVy9K88YAU
         QQBM5aGN2j8X+22xGA3N+QEboGYGE++bExEHm97eCU8HUrZL+VGBO3Ex2DAiaKxPFxUX
         b7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777654192; x=1778258992;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=feFL0BYgyPheoYTLYTI9tk0q8RVVFngbLeFU5p1oZJE=;
        b=I4QmorISnE4SjOeglgUAyIaAeiNY8rC5vpWZ+kogXZ9U6CNi3Iimb17agsmfVRWlmm
         mq2iW4AtCc8kWZR2l8zgE/YM+o4yoFpmqt4qW6oCbXgJGtjvqvwXFmA2oh7r0tQUlhg6
         0rGh++kBkMSlv78rTS513iLnIAk9IN91dZm6q4WlPQCWkuyEVMNmf4BPZZL5gV1xuDye
         QKnx8Ydod6Nn3xJdRmmWYS3SQW2XD+0r8DQvsnEXUMIYqm/dh0NnQMYapyahcqIDUtiU
         BdAK25WQzktpm6FTiDXjz2AArp59iKl7jxpSCoPkU3fIyCccxzUsSLUAf8Go/kjFQsl2
         603w==
X-Forwarded-Encrypted: i=1; AFNElJ+yjX9eH6xojrkh8S9X/isK+yWSW+kDsjyq36ddBQFeRiDKyUiFNWhoCC6CrAIBJhWS8lzRufI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxow45DaMh+NinK72ASmIES4FG8InF/MyhjU4j/MaiFLhtQpXgR
	SzFdnuErTfPcfNUgdGtAAgtaTzs+tCFvTZ99ECwsQRtzK+KzDqU12UB8MRc8i6ge/hSRGiKWyoU
	w6XvOsdkTNusUw3r5YIhoBlOEd6MbL2hmrF01juvrOxlGCumNJMxXtmzVlrk=
X-Gm-Gg: AeBDieuwcKUCtjbyElQtAYSRlwhAp6oE6uRPHQpSCQnjGUzy2mV7blcRLwmx+/Ts3oJ
	mi5Hmpm0WEP/w8gH6o3nIdaHvJ43wIrtE5UTo6y4eDKw2SM4ysnKGUdj3BhbUdAo+QnwlX69wzg
	1JrMpKAZX3t4wORS21VfrbSjGxMyTGzxhmiT240Rm8Xzw0JwWENPN1ilLHbD9GXrlT1lpFgwrp/
	lqk5hvhe3ZRV72jI0R8tUf+/hnOIfTdsRl+vST31TPjd1JRtsBvO5RAm8hxChREk8mpM1fY19Oy
	6skIQgXtUUyeGoWX9K3XTimiqaBOa0+s/ngWT0FViSeF6TgX0DuapzX3efZZrCYq547j5zqN7IB
	AV1MX1yMT2IgM569VytNNVnYKV0huLZw=
X-Received: by 2002:a17:90b:3a83:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-364c49df0c5mr7425646a91.14.1777654191475;
        Fri, 01 May 2026 09:49:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3a83:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-364c49df0c5mr7425620a91.14.1777654190849;
        Fri, 01 May 2026 09:49:50 -0700 (PDT)
Received: from [192.168.1.102] ([120.60.59.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364dbeb2db0sm4926163a91.10.2026.05.01.09.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 09:49:49 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Zixian Zeng <sycamoremoon376@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>
In-Reply-To: <20260331171248.973014-1-gaohan@iscas.ac.cn>
References: <20260331171248.973014-1-gaohan@iscas.ac.cn>
Subject: Re: (subset) [PATCH 0/2] riscv: sophgo: sg2042: Enable PCIe DMA
 coherence
Message-Id: <177765418359.12199.18149733582970959715.b4-ty@b4>
Date: Fri, 01 May 2026 22:19:43 +0530
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=cP7QdFeN c=1 sm=1 tr=0 ts=69f4d9b0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=VvXziC1WMG9Np/cC0Lm1wA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=J_SPmUf-aNex6p-r11IA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: VRd07lz18cG0FyRs5roi7_jSZi7M0G9n
X-Proofpoint-GUID: VRd07lz18cG0FyRs5roi7_jSZi7M0G9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2NCBTYWx0ZWRfXydnOu36xsZGP
 HEosePUigCCAzaxg8NWIVQo8HCdcWM/UayUvaopn5p8AWILN2pS/g23Fy3MO5+GYwTKL0kfjyX3
 6W8I/2EE9X2ZYwuQzX4/U+4IcvWD6ZYcs8PVNBe/R5AiDDLCb5ozfw6MPDTH8S3U4ImdK7PFdi2
 BKJLShGWaT1vOOyrqROKFTv+oM0tYm48R9E3RIgMD/KmUbPsFM1TdGqwEybC+jNfxfYnmoRmWsA
 mRWS8/2XchciJOGkZQpmyk7qNybfqu1rtvHkfDudVap1tVIiiI5QxFoaUhtt+8uHErvQKqmNR6D
 DulyVgulISXPjr6Ap0/5RrhoYeYjj2SfkUATz6a3HeYJZkm+UCaEc0GATu6HZ5TtKJMjq3HRk2t
 uBuhH7+vp+6rm0JuyGgoTD2wbQROzJOl0uTf1QtqgMeN5hAYJyr7HNCa15HjTNZ7Slwl3+xdcPz
 Z7JfqPoJOdYi8c/gtbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010164


On Wed, 01 Apr 2026 01:12:46 +0800, Han Gao wrote:
> The SG2042 hardware design supports cache-coherent PCIe.
> 
> With recent firmware updates [1], it allows to use DMA coherent.
> 
> [1] https://github.com/sophgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7893937183165af36
> 
> Han Gao (2):
>   dt-bindings: pci: sophgo: Add dma-coherent property for SG2042
>   riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pci: sophgo: Add dma-coherent property for SG2042
      commit: 50c94a2351458ee6cb6e52c5678f099534366830

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

