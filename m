Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E064944E046
	for <sophgo@lists.linux.dev>; Fri,  2 Oct 2026 09:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932972; cv=none; b=tLC/KMnLFPpXrb8xg/vew8kY9TM3iaXZFFmxAiilzHsGR1jBXkva6YNc+cYrcn16kNmklnaEIikJxuOnnDGA00Zg9j3E3CxcjJH5ktQep2xyKjaShQXmKs6Nls4z6hqmdBNPmcJ6ZSUb42vHXlHtfLqB+Ov+VeNSW2wJpJiO7gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932972; c=relaxed/simple;
	bh=4SJLPX+kwQBXDmR7raZp5aqQUkMqAt7w1SUMljxgVVQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j38hPZ1ODT24sz4CT7K7eze5RjEiqd/e7/faqbbSNnD/l39mc+6KTszLMVNcvkQGTi5f1w0B0YHCQRGDmF4+WDGmfLkak3AK60pb7IgBuy6062wkgAsNfc1RnumfA5OW77N0rqMn2s+pIqo1m0EXeIESLAI0d9MMpc6VROBF/s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZchkmoI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4nddEaT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZchkmoI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4nddEaT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925j9Kh911574
	for <sophgo@lists.linux.dev>; Fri, 2 Oct 2026 09:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iqJLw5FjSYIhQ1eY3WdJE1c1w6PX4NxQm6ZY7VQdn4=; b=WZchkmoIHU+qjvdF
	/Z4KPTEmCXryerWgvQ5fMse1US/iYI3wSkEpZRyO9WGoPqieh/8rC8ZVWMQR53lr
	vVUFk2iL9fQeVLXDEmpuSo2Js7cVYiLeHQqNpb43C20c5ZUmXn2YarQfNNEkG68t
	+7SQlclilqHXNy9DFUlBTX1FjK5EJXg4SQcaCzFuK26QOVxPZ0AbXZP7oWjPQD0T
	01n7maRnfDajUkzt6JUfyhrzIJ+C0DdXjqnhRFMAOXFoHjGtujKRYPlcgJxlaRpz
	HFuP6osAGmZzvF542wWwco6DJXMEycU3I/dZwr3M6huYJgtvbMSyVIwZTtx1OfDV
	dEaXfA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20sh1pv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Fri, 02 Oct 2026 09:22:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a6f6af95beso281068a91.2
        for <sophgo@lists.linux.dev>; Fri, 02 Oct 2026 02:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790932967; x=1791537767; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/iqJLw5FjSYIhQ1eY3WdJE1c1w6PX4NxQm6ZY7VQdn4=;
        b=R4nddEaT5Q/Wn3xjLSAmFLo3koONdpOHqkLG+JahwSKRFQOf/er145uhdtnry65m9O
         MGhg/6RRiFDULI3YA7o1T2hTnCN1kjBfNAHZpcjiwmu4c9ibjO6kQLexUDn9IOzGX4z8
         buRyCGNn6UckcrHEi+2IUjjoxSX0ar1zfpv3G3gEE1kECUIDNqu5ZQl2H3EfpBaiSduP
         6M8aCoVUizAf7/B8HW3cxYi72fYz7qvzTq11EByfP9S52V/YvblaWpy00XNQ5p4wVe7/
         kNhKO/iptvPJ5urhh/f/d2Uo1uia0KszD/t1XqPwRejT50h4AhumD5CJ0eMEoljsdc4z
         J1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932967; x=1791537767;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/iqJLw5FjSYIhQ1eY3WdJE1c1w6PX4NxQm6ZY7VQdn4=;
        b=k0P/eEzCrLcffm6lQpHwQRmQ9fHP62KzkXH/+gSD1ow7zfjQ85V1ByAjSzWWe2mE9m
         3/7AyJ8U1UJYch/lBuUBLwKMACLum6+5fqyfhn9M897UyIGSsOxHJT8NgQQzcR14yuYG
         97vPUaxuyr31a2EVdVd9oFrIHijWr8kKhjqZIMj5unE232EZ6l26SJ/ciD+m9GpviIZX
         uhISB0bdptbMAAEXnUWXzdNAdkuHlHqsRlYAy76dYty2AlLSBUqCgI9zlsfX0K4EuAkz
         FAIhIi5MqpyWliGWRejYpFD2xmPSAxsGpC9/mpGINJDvP9exjG0g2nppTgVHKQRgmDG2
         gVDg==
X-Forwarded-Encrypted: i=1; AKwUvBwG+Anqr1z6nTcOgIs8uWhRBiHDPvOMI+UosHk2N4zT21es3B4/k+QbwkAFOp04TrHEubhC4jI=@lists.linux.dev
X-Gm-Message-State: AFq9FYK6LxDm/e0zYM5xuaUTMP0RVY0CteUabiPxN9hzL/A4/1TFPaJM
	byKShtIYkGnw7Rgjc/RBF+bI9cTPhc6b3nw0ydSypNkb3TUxn5qXOr3H4IpbVh2NBDTD0mKRkQr
	ezchYDlz8gaaMoeEcO9wcV/QJbtE9Q9K0GWhyBK63YGqrgwxaRd28Poy2oyI=
X-Gm-Gg: AYBFou3kE9awmyxtvAWuL/4k9U+8GFbr6gCrD7cDzs+1POZwV6IGBgdmmuVzFHqAzNi
	4bvAF4TkiDKVt1anr5Nm9XIxtoHIGsS/o6WQU8M7rZsOVZ/aCrectg+xz+PydVoa1gdKrY1f4oa
	++a6ObMH1g+WK1cRrRF1qx4ETZEhg1zszgpuz6i/+TNWMtVTgxZKzEZueRsACYQkrDn6k+4SaDF
	MbxglcAx5MbVeQp3BRf/m2ipsxGMD6oOY/QLrka/P7uvUoaK8sPNYQf8AGlHvT1s3qFxwz9tMZH
	BBag7ocIkkfKUlVGZ8Ry+oRwFhp+Ou+c757m6P+MXTL2+2iv/yPV02G5Ps79rQck+PcKkE5Jf1h
	cGVqrfjS+KfuI
X-Received: by 2002:a17:90b:1e42:b0:39e:6c69:f47e with SMTP id 98e67ed59e1d1-3a6cec7cd2fmr1834297a91.61.1790932966365;
        Fri, 02 Oct 2026 02:22:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1e42:b0:39e:6c69:f47e with SMTP id 98e67ed59e1d1-3a6cec7cd2fmr1834240a91.61.1790932965653;
        Fri, 02 Oct 2026 02:22:45 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6ee4bc6d7sm616096a91.3.2026.10.02.02.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:22:44 -0700 (PDT)
Date: Fri, 02 Oct 2026 05:22:41 -0400
Message-ID: <2f143e2e0698daa43191ff3463e604d2.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: "rkrcmar@qti.qualcomm.com" <rkrcmar@qti.qualcomm.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
        "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
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
In-Reply-To: <DLRWB8R7P6SF.1XIL0OXLZ2F23@qti.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
 <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
 <15151b8ab012ca7444d4117e393cf999.guodong.xu@oss.qualcomm.com>
 <DLRWB8R7P6SF.1XIL0OXLZ2F23@qti.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfXxo2Rp1LC6uov
 RjTePgQIP0R0apZEo5kyYBtg/YmCLuFGpzV+xgHNHUtrKTwHFFblxyFzyT7sQAxpVwo0gaJ2vcf
 TLsNqd3xvSQtsHny1gT1IcOB6rvJ4l8=
X-Authority-Analysis: v=2.4 cv=IpmL47/g c=1 sm=1 tr=0 ts=6abf77e9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=xvfqbYfxAAAA:20
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=iwpyHwDBbu1AC0YlxIwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX2Ogtx+Orkf5q
 je2XUW7474qpPmmFZ0lOtnkZsmSkPLS1znzKDwZO7Joy+uupqDUKNrG5gpQfySYKNCGKBM8eggk
 ED9uqCS8JCoha4b4pX+fsPP2NoYIAftsvdECRwkWQ7dnJxp613cCvQHbFmZZg/XdYL7BS0UF2hP
 9UZtgOPd/F2dAceypb7sECuaJx1TFG1TVp+Vmk0yTqeYSHR54KeYNQmONNHD4RxkraodObCH/ON
 lYCjewT3zTkpqeFEbDtJgWQUvXELKjA3zLG4N5w9WX6sc7AkprJ130tfFVdI4b4sqFS5hRcCZff
 Q5K+GcYFeIRVhVDPBo0iIKWXXEy0z6S6vI9ylWhiiuA5Y1hqGMQGdzgIdqQ5gqvTGwLrJwPOBDE
 MVkUm/MxtXvZUSMJa7izQTo4l4WTLiI5LUWxbIoZNOkbROOdOYNhCK934tPh+zB2Y2kJ02TzeiA
 /RlA6hR/Z4WpSdJB9tw==
X-Proofpoint-GUID: JGLblx0bLIrI9E2Sm8Pob8-bJoNwCZFY
X-Proofpoint-ORIG-GUID: JGLblx0bLIrI9E2Sm8Pob8-bJoNwCZFY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020037

Hi Radim,

On Tue, 29 Sep 2026 15:12:36 +0000, Radim Krcmar wrote:
> Are we sure that B will always be listed in the ISA string when Zba,
> Zbb, and Zbs are present?

For DT, yes. The binding requires b whenever zba, zbb and zbs are
listed, since commit 0cdb7fc1879b ("dt-bindings: riscv: Add B ISA
extension description").

For ACPI there is no such check. But B is a ratified RVI extension
and RVA23U64 lists it as mandatory [1], so any serious hardware vendor
should respect it. Right?

If the firmware does not advertise B, why should the kernel correct that
for them? This came up in v2 [2], and maybe here I should quote what Conor
said in [3], which I agree with:

" Part of me wants to know why we should be going to a bunch of effort
  to cover up for inaccurate devicetrees etc. Garbage in -> garbage out
  and let them keep the pieces."

[1] https://github.com/riscv/riscv-profiles/releases/tag/rva23-rvb23-ratified
[2] https://lore.kernel.org/linux-riscv/CAH1PCMa-5W9PsX8cDLUk6-MkcM53HOz2QtaxCHd+XOr7DgH5+w@mail.gmail.com/
[3] https://lore.kernel.org/all/20260604-decency-salaried-4cb69e1c9fa9@spud/

Guodong
