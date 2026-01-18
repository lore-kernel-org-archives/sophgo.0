Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564CB2FFFA6
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759814; cv=none; b=n6XixhIvRTqmchPqzOfOHnuWjzmty+EXHonSDdY+1Z4eHD2rpZlZCiEvCm+A2lQ6v6YIavpWxJPl9eoRvREqqXCC0c1T0JTSECA9Qx987r5pVF+NaaTdLJhnlQw4LHoBlcGzu/yRJRThCGiFMeHp01flAzSUN6DqahxKVkkOSRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759814; c=relaxed/simple;
	bh=K3uQDGZFV9ixSLMAp+XTCn6w6PMJReQbBttCFQN0F/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YpyxZLUggWXoD9TXDbfANvGwV3WyDFZ2fnMiU9RsR2eTEl0Uf1wPjtfwspxSklMA/GB8VF/YVWJ5Nlr1MwFtHSy/OsdRcRiaesnhXQ4TWn6poFCmO76c5ejNWHw5sYo4e5kGtYWZhUnusVXoDVF7E6G6VpsvRihQWNGmo8Oxc+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XM0kU0IO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUJdCyU7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XM0kU0IO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUJdCyU7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60I0F2Rd1402621
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nw/X4tXH2dJCM6CqOW5hG9dFyviCyY63+ly6mDS998w=; b=XM0kU0IOuobH+dzF
	6qVL0KuB91DXq8pk+r1qmhwUkydjBo9HyCAY1LKdpuGih0pp9iKU6HVfW9HWLFxz
	R3IvKRlSB4lkLTBq6Pbr+wtIL33Q2GypI40wf1+SQn+5VlMc+q/3g2J/WUeCGB97
	1dnPHYWjD5O3T1uXciWGtbVV3Wo7snw+1aYn8bU56XpkaX0IxdQtyK/Gfzq2EqHd
	49dgs7MxLA2i7SGKCaYTRZEYUpviIKBf427BxsincA+Rj5kL4djRYs1NICEOqLuo
	Xf2CJ7rrUcH9mKV8D8qc8HG7eIjsQBCiUZGE8GGMvx+q81KgwIcWKIef2/ofx/2C
	kdePBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br04e34xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a87029b6so583496785a.1
        for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 10:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759809; x=1769364609; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nw/X4tXH2dJCM6CqOW5hG9dFyviCyY63+ly6mDS998w=;
        b=UUJdCyU7YfkJOd+pqtl/Mvs9SjXagr0NkLGTJMzdGzDuW+jyzTAtA3lPQgVE3QfJfr
         yu92DEA7zc+Xw8K4h9XJFTgnwGNTTqPxDEtz/LkZcZaFprKNEmTc6cBxoz9awdLnbQ32
         zAaXfdqOmyr8xdn9f2seZpo/MxMzqJqGDJ61wcQvr/qsO4RXlRjKzugDQMVCG5OWeyT9
         Pd5Pwn9O8YddJZ0bedW141/9SwKPn0rkJP/iMlp7tAKmjzAueag12SQm1udjQTHp4PQk
         Wc9uI7bbhUelQtxzr99cat5zgc2QdB/3dz+mfReDpHNFrLgjI810oQzhKRYQfiPotn6U
         pzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759809; x=1769364609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nw/X4tXH2dJCM6CqOW5hG9dFyviCyY63+ly6mDS998w=;
        b=TGCOhQ1eP5FT3a3N8arz0Cc0GNg12BgyFlb2eD7gvOv0RI+GgHvAY1sAfO5hmnqjaO
         +x1JOquu4k4L20N0KXPvKKpdfb3jT0XPgKN8BqNwBTvTDrsPiMkKlfm7OqvMFo0Z5Nae
         OebyciEkeOqKdI/GGrkOER8ZTW4PB8QCDaDfr561ZyM9zSuKpMsrOQHRXenojLdVyU77
         mgSiAPmbGglqg3aSqsE7EELJcJdT66FDuspNAzLdLkGgVlvj6nuA1ujO6e2I+SVCkgRb
         O1TpywqUobFQd0IcChKcjLNrrbL4rwDssfTyslvxZyYHCnfWFlw7pKHloWLDsHJ8Qi95
         R7Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXEgOtm4hMSFS+0KobdTWEfXXMHlPlmlc8nQ5uAWKghfa4SaNFPMLbsevZsizrXA1gOUVYyvU8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv64G6oR5TXr2TXN+tbOHX7pCi2RVQL9+eK7C31/y2fpCOGYV2
	dtQKROixhy42qFJ0uBJPpnYZ5gFina/s0YYzfVILlzgIxVX3ejMarcRi1ujEDiv9EekV9xQKIEM
	acEboVOLa10IoqXMgIHzS28u39D/U3sxLgBCaH20GEcbvHo0KPaWPH7fKBfA=
X-Gm-Gg: AY/fxX7c+124w4qwvXieQfajVjptqo9S7Z4rY+AdsBCNO50H6rdFQ2h9jy73nGVaE+L
	OSEtay8hLt5Dk7NEKZl3oVajrFv566qyPFkXvG+BtrkR+JW5JfHISXRjXKl9QhkTeeYmnvw7lsq
	RrejDS7lxWfTTlWk98ytK4NSotoHwqDJttsxffspUOe07qDLk6gusv+lAVkTi4AVUGSz7rxeCax
	kZTHsjtrovedoftib1IvIosDBC/UDEfsWdRHKsf69Ku5us1MaHEJn7hLF1NYgH0QxUd4Fd/MMW1
	fQhFg2RGFaVf4STofCNnz56vFlMhaeFWl29SCdux002sh8IAnmCqPnwXg0HCXy27CHBmQUhXMRI
	ypRsWZVBjIRoU/u48G9kXwlICM6EGb9QdPg==
X-Received: by 2002:a05:620a:2550:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8c6a67cc5c8mr1321765685a.87.1768759809375;
        Sun, 18 Jan 2026 10:10:09 -0800 (PST)
X-Received: by 2002:a05:620a:2550:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8c6a67cc5c8mr1321761985a.87.1768759808928;
        Sun, 18 Jan 2026 10:10:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:26 +0100
Subject: [PATCH v2 03/11] pinctrl: sophgo: Cleanup header includes
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-3-bd36f681bdc0@oss.qualcomm.com>
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=K3uQDGZFV9ixSLMAp+XTCn6w6PMJReQbBttCFQN0F/U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHwFh1ny8ZUBi7E3yd3ZVK3fp/JTPumZY3DF
 DMrk8Bsjp+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h8AAKCRDBN2bmhouD
 1xP9D/wKpjBpf0B5lT15hZHuDhBlqt/XMr+dL2IoW+gDe82hyBNbi9Mssn20GVc1WxaEnqmnq4V
 p4+swUeTdryZjhbgxuKOPrnBZ5Vk+8vlzjCsvDVQ2ReBaqMpORafXuxkCKFgclmPhchYQRR6b/9
 /6l9s0yU2jXLJ/19u2o6w1PYH9z2E0bXHvYkcbKNeJFQHEKOlKZO49UNYTddgFA6Glzh2kmdWa4
 iVPwqzZEAbi33uzkLpefoBgD2iQyRwmyLJSxN0ZlVWdPPd6cxYvfPMWlr/a4ZUDTTfEYRZzlkEz
 nxG+54c1yU+jxM5okvGMdms9h6U5n3xWwKQoHYLNd8q0xZXrjBesvQB1Z49IkKfDBFLbkNGgWTN
 tlOUZlfxVOe5kEK6DwJlPpG7xVCf1ey6yUYxBCnqM+1HYMFULN3Q1/C+0jxj9XJZ4mKG4AC63n9
 dYUqyGyPrLP8dKvvV619YhkgqwYnCKINxgT5jTECPev4nLqZjQxG2jWTZtVcGitKwo6aaZAPm4N
 nxmYst0BFODDdlwnUAIbEeTzcSbEfm1xCuURbI7/ir0a83enDBdVx7FY/SLEB55rhRpN63dJLgx
 Vciq6wWoExc3WoBaH3dwBm0ST1MNbLbF6lHxQqvEKQELGhE9JzTjOytPYUjW7UbvNKOMmRQ5Grw
 4tuQ43AnItwMaTA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=J5OnLQnS c=1 sm=1 tr=0 ts=696d2202 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=XMepgddcWT0EFqeyVMQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfXy37CajdSHNym
 E6M/chGD7NWIe8TuH/GbeNkS3OgTNaVWhyFJncCo2a/YOVYYAqPQxCRbTKFYUOjuDRFCakmTtDm
 XCmN7ie5y/1K40ABo0FWGZN7FLq50PGIB34pbCzMGTIgSo6KPsCb6h/ii1eeI6fDAtuvlTF8u5q
 /iGVX9AReI3OwV7Ncwmg+rlsQbsx91xd6lX53NCirtIrnT5Jdp2UbKcFbLwuPDO26wihVQw3tzu
 Q2N3y5oP3C823JNCQaE+UPN4kOv1SsFa7ftttMvwJaBs+l1X/pdD3TRvdE1Sa6qxexOFC7yfut0
 DSA7Z3nrM0n8uWuiDWrBdDzsS29hZY+Qmql7Wk4oKDhXVB2HPUh0chq0Br6EURy72WJlMwiKjIv
 bIs3SxUwOZ1kcLC0CNWixSmEAYP6mXyOTcL+9r4q2rPcy47bWVHy3TAzB3SEZ71ZsWGdk0XIoxq
 LXU8pImBoIE1fghiggg==
X-Proofpoint-GUID: N7japsJzgRU30-e3t158GHMgpibElS_k
X-Proofpoint-ORIG-GUID: N7japsJzgRU30-e3t158GHMgpibElS_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159

Remove unused includes from internal headers, because they do not have
following: bit manipulations, mutexes, spinlocks and struct devices.
These headers are included by actual C files, which seem to have all
necessary includes.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h | 4 ----
 drivers/pinctrl/sophgo/pinctrl-sg2042.h | 6 ------
 2 files changed, 10 deletions(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
index 759c0e604acf..973ab9a38fcf 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
@@ -6,11 +6,7 @@
 #ifndef _PINCTRL_SOPHGO_CV18XX_H
 #define _PINCTRL_SOPHGO_CV18XX_H
 
-#include <linux/bits.h>
 #include <linux/bitfield.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
-#include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
 
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.h b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
index d481973fcf97..1a2b00dde1fa 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sg2042.h
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
@@ -6,12 +6,6 @@
 #ifndef _PINCTRL_SOPHGO_SG2042_H
 #define _PINCTRL_SOPHGO_SG2042_H
 
-#include <linux/bits.h>
-#include <linux/bitfield.h>
-#include <linux/device.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
-#include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
 

-- 
2.51.0

