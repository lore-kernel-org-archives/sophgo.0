Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AFF3009C7
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759814; cv=none; b=m6jEWfI1c7obAA0SoQlriOYU07NDlykudkj4RXoAdNTqJcu7wrzeToM0kdMzV+TWooDyEZQmF4RwLAwHOmfIjeA7w7F4D/EYNyGkAlXniZ+0HE9KhcfMpI1oU06kWsc0ztGsI/Zl16ZWQ0/6qtaYKdlvDKNRE7ZXyVe0YWil/og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759814; c=relaxed/simple;
	bh=KS2A41254/IzptP8+yKUiwH8wnfKT/gY+cirH/V2Wao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6++tdWuKrBMRrws1sK8OE4+jAm1Hslp6vktTv0+RsH+pU7lG4v6GfLtZnrje/qQ0+glZ6wbVk1L3TkCCsc6/BcxrBpSP8vlZaGnUErN/uItF2zoylCKbuF5n6epEK6ygQ3whHJofVDucL8uTPhJI/7gAuqbgvaJ6KiPMrujjAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKd0XTCH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9XPSdnw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKd0XTCH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9XPSdnw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ICOR7E3135119
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=; b=EKd0XTCH2anl67j7
	+xoS3zAwyuw5gexTX4UDZDbMLnC5kc49ZKBvo/PRSfX8H9/mojr8PFpvgc3ME88b
	6axcSF5oETo3Ez0pN8KFbvoEFyhPrF7c+uSatRaUEvMLzXAK644V1AGsZn56bvQS
	bCZLsjvXGEqpYS3LnoXqvUCuqUI7H7Y11WJLUaxSPHHwguRGZ4Q7IimJmipOt+50
	Q6aw2Gwamt/7NCO5mbtrghH/O7wwME0l9ThG+ASTltN1oWwT7WSEvV1+2j1EvAR2
	nzqjOBiZ1kktZ82XgQPuWYmITvwpCe163Q9AwYzYfAfXeJQ2iw890FeCl+fRz5AT
	mTlM1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2guju1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a291e7faso309784085a.3
        for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 10:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759811; x=1769364611; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
        b=Y9XPSdnwX543XMMgYpUr67EX96NXvmo56Yw0M1udTA3rxOL2YyPX8qJM1GMZmVlAww
         iI6DuRCQ8SOedj7pZZVC2kdtUszuVxRHiwVYCMNzx8w/8d2lBQ7dzsJq3PcHftPDrZm/
         9+dkykMJ43xWoh7gahe3nZqIjxgDvR/D3HhDqCCENSAHa1J4Vwa6wqdfY3aUoOAkb6Ed
         RPsIFh5JazgzRwBUyOqs+hQitr5QkjX8tsoMr5AqQJU/v4veeLMehn/DoEDolTCofZle
         s5wFlg7ZRaR1FrFubRvjuu9D0rlyhCs6tAMGQKu9xM9W01PTS0nzTPh+VNpcj65gHRo7
         08fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759811; x=1769364611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
        b=cDeTLLs1IQrRN3kJjcA8tPeXONKbxB0m4nxQO44NJKr9smpccAz1KKJQJqbLmPekmN
         8IO/R1QCqzczC7Gub8XV2z2FkkUup6Yh6IORs0jEK1+wxyRBRgdr2ApDcPRzWKawdZpf
         1J2SHGpPZVStoHPqu9Ojx9IHo0G8tGWyXKpXypQt54uC1N2AqS9CWrjk8zSn+NGp+1wV
         QzUTFM5sNvUL+Xz0e9eAhCGfWvGySWZTfMzOiZHAS4wZBHEC4UY8Git3uhVLo6GbyE5u
         YeUHBKKnn+mJBR7LHagOrm/ja56hL3xuDg0jRC4xhJRxDk2ehpXusaPBtr1P0TB+khqn
         TaDg==
X-Forwarded-Encrypted: i=1; AJvYcCVJKS87jhKOLSd+nAxfUYqsQzdAP6q1P/dg8nTC0Bum0smmVWmLYSvfCm6ILZ9dONVzAAdDdEc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9Pzsag1NBt8KMrtKcuFpXm6wS5IkE+u/ck402FUBPlR+zB+HF
	8g1HCLrARgHUeUV7yZ4PnFpkgLiL4sYNsn2cUjJCtXIJ+RfCXZJEySdoG2s/ki+az3MDuaSiBQo
	P6J537XIfFfe/yUcNvqTA/qJ/rfZOTMqSt4l30JX6+NX3QRmn1LpMQ2g10tU=
X-Gm-Gg: AY/fxX7HWEeA6DATSsSofIhHJDWf6f0C8By/qY1Td539YdqcOLRg8awPZO7jKZqSYmV
	UeBP2pHpdCFJdjpjbd+5FVEO7wM0to1sgfNW5F3W29y5QPdWv0nISzjoBkT+xi1QFg4Ge9G2/zu
	FZY3PcqoaaCw3rHwQ0Oa0JXnNx6JoqK9n350VYBLqy8Fb0koYz2FbxfpMZ5k1sWdJcwxVwmZkKU
	Gr89qcq0PmCXZfuWhAh9uJTPCEnRU1FyiPgNvt/vOHNuWQA4Zbc5nhTBz5vgo85eLBGDFQPG1TP
	uSWthLtEPYQS8JPqxY7wh2ADPZ5POU4el6nxWWI1DdqSNqZYLzqfwQZASAChmmUglULPEVs+XsP
	3izTamox+4SM5M7Ha9Ij+Irdn4UZhK9hKAA==
X-Received: by 2002:a05:620a:1924:b0:8b2:f269:f899 with SMTP id af79cd13be357-8c6a6956472mr1391333785a.56.1768759811439;
        Sun, 18 Jan 2026 10:10:11 -0800 (PST)
X-Received: by 2002:a05:620a:1924:b0:8b2:f269:f899 with SMTP id af79cd13be357-8c6a6956472mr1391327885a.56.1768759810821;
        Sun, 18 Jan 2026 10:10:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:27 +0100
Subject: [PATCH v2 04/11] pinctrl: amd: Cleanup header includes
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-4-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KS2A41254/IzptP8+yKUiwH8wnfKT/gY+cirH/V2Wao=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHxcMweZ49Q5Nba1wrVt3CAmG8iWHmyaxcHb
 TNtiusHLMCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h8QAKCRDBN2bmhouD
 10MfD/9Y8BgVbkm6bl+36BXzMgv1xbm7JsRk164MPz0v27NRR9/A7MTJxMXT6LNgShVq1djSxge
 6g8uCxUY/9zNFfEZbrbUevJi5cHtHc5/YUTCSNnot/lyVENX5O2KSCx3dYOpUdjrHDF8VX8ybHW
 wzM/tjZOoVQ7+gYxMukxqt3s8XLQOVct9PlD6qtPZmiFE1vab6GQQgLNVgM1lOYylEfR2ldNJXs
 jXDMtydYwc+g2dbP9e5rnGzbL2XkzK9qGia8zw1O8+ri8yvQ/U9eaHS+WXwTO7Vlr1QAxEc4oUC
 zKbv4wtZ1zeayUoWUv1YYDBGknxgFxwVQ+bjAyyLW+9wq3v6aKLX2CCdb7vhkv9IIbgJ0ieuMw0
 xixdCHOWfKQ+OYzmelQ7pXLN7RTHkKO8loGnPsXOAVHqo6wdt1FOQH1bb4xGl9Pd1K011ZOn4sP
 piveUlRUfW37nPiHBDROLc5yASzQBPjKA06V8RpaHwfC7I/9bVbiBuGyvVHdGhk6LBSFFKEjrBX
 UljGUMx3HN/A8uksjr0su24ucX5chRlqNVyncRJqPaYjbJAJ0zFKM64X1r9AnLRwEVfas7sruYn
 VGBFODgVsHuDAOcu5XDZBnuzDmqv88C04tW2Pve5Yakzf9c11d3W7hQUeI1nroie7c8OQHhI2ca
 a6OcgYeqNAjKKjQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfXxAZl+OKXF7sQ
 C2u9Wj/mP5s+roIO8CXg2hMjOLnTBVUmwP3FSYaSVUabvDctXLbgG8Ti609cSi51C7uSqvBBJjH
 5bHKK8i19PIo2EIGSuVbDsfb4NTlFe4ocnxiYM1SB37CgbIOnNKOfK3fVVqNBjzDyVLtdPHxYbR
 2EnZGJgJX0SyqpvKd682iqtMTvLVGbSN/5QcDDH3lUoshXQG2HqsYCgOKl7xVQJzQGIq4NUljNR
 uykOLH2ZM7uiniEh5tMJSuqwb9qblhIWYXX9L+so7aSDfn94I2holMezOmomczguMYt3YadOzs7
 MP7t0gRaag7bKjs9SRWv/eYDpSXu2u0q10d1ZORTt7lhrGTJHF4dzX62JuVS6N0Ni01je58qkh0
 dW+QKvJs8lWHgVEU34MdLMUpdFHKRyxCvKqb8r5rCW3H+QN4W5jOfHKdA2jibEaMLS6k9L+19sn
 OQyKP44fDsYI7nEHOkQ==
X-Authority-Analysis: v=2.4 cv=Sev6t/Ru c=1 sm=1 tr=0 ts=696d2203 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tMXyHTyi87mTYQFNLaMA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 05_DVA6Xw7DnQ-zhGv_VNMEX96_nUI2w
X-Proofpoint-ORIG-GUID: 05_DVA6Xw7DnQ-zhGv_VNMEX96_nUI2w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601180159

Remove unused includes: no lists and mutexes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-amd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 2dac5c71eb00..2af94ef56434 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -21,11 +21,9 @@
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
-#include <linux/mutex.h>
 #include <linux/acpi.h>
 #include <linux/seq_file.h>
 #include <linux/interrupt.h>
-#include <linux/list.h>
 #include <linux/bitops.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>

-- 
2.51.0

