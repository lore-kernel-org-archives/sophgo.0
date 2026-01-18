Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE6923EAB4
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759810; cv=none; b=Cd/FBIMku29dflTnRWbrdLmOauBe6Bjo9KDbU2ZAkfaz6x90bawTbH0BC+3bHb7Ts0sDflz2KJ18RHAaD/kRFrq1JyqsyGfILqlYe+O+DeEQiN3kjOz4nCTluEq8HRVW+5/NSqydW1COXSOtkGWrb4phnT05+zTpId8ayvr/T4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759810; c=relaxed/simple;
	bh=baKkcqSJ65hc0ts9jVcHMZU7FH4i9Uox6/iD2KuATX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XNBhcxphk46hJ8DRHk/kkJYik+5HJu6fHbL73jAwnqsne2Ky3qPupwAyU3dyYnjJHp/JSjzypbGTsv/j9SgAV6IeNl5vu5uYeTcN+vW2a0cCKeXM7DO0w8YkNnhVfR4DZ2Zk8zeDzN/Y8R0NcfLLSttGklB3mse1lU1QOryIYh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4oQQsBN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZUP913Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4oQQsBN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZUP913Z"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IDi78W2859451
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cvBXEQRwk0vB9MxtistlWfSV6Vaus6aoeJvtQZzjTG8=; b=K4oQQsBNqYVZw4QH
	PjC93dzL+Hz3LWNfTQn9Viz2RAWjfWaMdQn+XQT1jUJQ1eVTll4XbPiZYIT+fVmi
	x3jDEAb3C1dOVGQjURrLEAeFU8nBZnO9SpeOqanXZAbvzSZge+gZufuN9ZeyAeUt
	VTjwhd8Lcu6dok0QAc6B8iEhMhncREgFSCjkTR1s5IkSFJpOF19qirc4gu2x20/U
	O2ZBSKiSBzFkmb0qaoaO299bc02LShw2HQovLbVbnGpCKtuxd2fbUYTRAF2El+rS
	Ox8De3k7GnXYCb/Sv2uTpimVD4QuaJ32BAyW4oXQvIexvZJU1c/dARph3HFIPOb0
	risUjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2n2tufc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c538971a16so824012685a.1
        for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 10:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759805; x=1769364605; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvBXEQRwk0vB9MxtistlWfSV6Vaus6aoeJvtQZzjTG8=;
        b=IZUP913ZbNfB/Oze1dgjqo82fjkMUt/wAPt8Xv3ir4aiX8Jq8gU7UF2ZOHe2GXSp3e
         gNGFlZgwFxGEVycuLDwAFUI30H+eSu2pxG2Gx2QF/03DDFqQLy92eu1cu70F/hBwpepu
         NgwAIvpNa+43LlTCe01sR9v7jXg5kbCJKnLys2mUBSYRXh1NV+Kqdtlrq6qiqlTuWWeu
         ZXxRgoEzYOmhyuPnR6dBNYxcDm64joh2wPJlXCb7SqI4XCgFUwlr8BAOef48JQkI+M2x
         wdHzByJD94WsYSpDtTBSGWU8rqH1vRRC3SiTaTqMTmCYaFvHWFMJHiD5GhmlSXlZ3YuC
         bebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759805; x=1769364605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cvBXEQRwk0vB9MxtistlWfSV6Vaus6aoeJvtQZzjTG8=;
        b=tH0KuQySCj6nNC4HIidYE1VDEOJTn6ZMJcsKzvUgR1GClnCZbTpBwuT4nAg3xLiqnz
         kNV1gftDBX63mw//hq6tY1/uEoni+cozrwPWM+uFaMbYVc3M++1+GpnbcGBqEiaQIw9l
         AwtbyAQu3bg5pP5EFovWJbzoSlD1Fkftwtu531vYv/V1AJDgnTRhVbw8qXJ7gXFPlITW
         Wk6M4gaSJ1YFfNMMJka93jtfhXoQpuqkyxMkh7LLL2UyzPhiaHIyqMT5CDvopmYmx+95
         Yf8zkVaYqTU2/kFNly5Z/x2FpFD9uDDffz1rcsPgQIPj0IXHj22AxdlOj2foEiZfQNJA
         sXrg==
X-Forwarded-Encrypted: i=1; AJvYcCW1ncJcgHD4C+zFh/ZfvcmNpn9Kx/oF1ZMwA5PPlX1C3h6E1e7EPMUKRcYvLXGJzXph2XqSLSo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYAbqe2OslZx1EFUSk1qblY+ZUWaBuNraymflOr7QNKMM6H6T2
	dR251Wa1+QxCwSWF9Wc7IQBGyncYHWYi8EUXjQyFuq5kmhIkefrmE0bnvvaIgrdRy+pL9CrKg9a
	XQ7vBeLoleBg9t/e5X248EKT3UAjJZM1FYQ625EplwetwzZOEMEko+Jl1s/A=
X-Gm-Gg: AY/fxX6etVxcVNCVd68D5ABkpq1+XDM5UxqngFr3c+yfb796XPdVzlgU/vKR3hDJOeE
	aBwlXNhkBNfM5JEbF/izs31L8lTocQjisOvD+p4CFNhpIDKwHeqtkKhdFsv8lYC9zyS2Yn9Qlk8
	w7I2ZWL9k+1/26Jj6+pWY5zAJMg5R2aLF5V4q7PeF7Mh1kKgPglVcy+2ns2ElAsCWO4V4+Skl5n
	vBA7oZSRZFq20e1hJi9CgWCb/mPk4/bZg6WPbWb3osYFyEJdPoNDo1WQodZn1Ouv6G5rj04Y2CJ
	PzwgeVaNMknDfhxlnuK3locdUvd0qghXpU0cGW9nGZu8w0y3BPPBHvhCxfrdBv9qjhm69O1TUPE
	nz68kh1t0xeWuYEsrNHdIs0k1c7aBM/p0MQ==
X-Received: by 2002:a05:620a:2592:b0:8c3:7016:1d8c with SMTP id af79cd13be357-8c6a67bf39bmr1240338585a.88.1768759805362;
        Sun, 18 Jan 2026 10:10:05 -0800 (PST)
X-Received: by 2002:a05:620a:2592:b0:8c3:7016:1d8c with SMTP id af79cd13be357-8c6a67bf39bmr1240334885a.88.1768759804930;
        Sun, 18 Jan 2026 10:10:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:24 +0100
Subject: [PATCH v2 01/11] pinctrl: aspeed: Cleanup header includes
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-1-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2575;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=baKkcqSJ65hc0ts9jVcHMZU7FH4i9Uox6/iD2KuATX8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHuEhmtjxve35yyh5CVKYE/OjzBr9jYAtTm2
 cuacE/vqP6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h7gAKCRDBN2bmhouD
 1+Z+D/9vnrXlH3u/GiXeOxQWIyZXbZQDkyEdActKpj2rvX7bL507HlztUm4KVnLg35wNcK5pjlI
 AB27rCgLeJSaUUY/Z1tYqFhPj5AMpwXMcHuMxxSsOZw4TZaGs8C74Tux+ZKoLxIjPHKBuGxhVTG
 xRvrIRns0lwCv3l1Vt61RY2eQWZ3cRzuTG70D1VNUCafSZyqBMfrseeOIJTQUka5DMx6p0OSCNh
 Pbide0KGADmwPF108KMVzyfXXSC7q3IhmoeLbX7y7tiru/iIGv623GQl0c3JCGE7E8wjQ+M8lDB
 CvSyDGn7tL9cDEbOm+G0FPZ9RXouXBE6EckA0eRvoQJGjFjdDAIc1Qai40rB+bydAmeDpHes8FD
 b9gsxIQnnhRFlHMwVSUB4QQ6Ue+xko4RD9aEy62jqjnnGbobSLUbADUwz+9ljllkjUsJo3MAwG6
 fwyIWtfhX9Hm0aMzMd3+d52ZQvzknxii2yMiTgrMsN/mDi0PAy647DljHlE2xCa85qCqU47Tff4
 V7uA0WcXPa4O0fVCDzDd4Eq5NRHKTtMDSMyx95WwGIp3uxnub4mphQkFe+0KnI/aXUX4PRJXLz3
 RiAGGtePI2G/UzMvmMhFoRFIFDBUBZVOoiZB1ZQ+re/oz01WEe6LXPUmCBORP+EAN2EtF3Ah6kL
 TBkAdeCK1+yugAg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=TvvrRTXh c=1 sm=1 tr=0 ts=696d21fe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7KBfExy5AAAA:8 a=EUspDBNiAAAA:8
 a=GlqkQvVaQCEososwM9MA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=eL7OMsOqQ-6kYQPn45L1:22
X-Proofpoint-ORIG-GUID: edMzDdi8DZhsGZNpEUqDC-wuKNl3DO-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX3dPWSlv5HGWL
 re4di3+7K5y8gheMGpzGIZe3Ws6ni6ad26/RtY7oY2JipyjF9hp4foL3376G9BISbTIpklxxTxF
 ys9h1YRcQZXVYW2JYzKqAKPTT78ndQ0dSM4L1Kf7X68C+0cIWA3X6RzHDkJ74Ob+7ag+0gvfeWC
 iGodF51qElBch4IJ7jIgrGrdpSmaAgl0xJ9OA1AsdYSNmhVslFNwsCkvgMt2wCZeUcTT/nLzVQp
 RCDkcqrJ9JlTUfarjkT0nDmFGTZDj9f92ExzOk9ORxlKDWatV3bjtGhjpU4b1dP+SfvdSlWBS4z
 u37L1f3Ktpkq6dHzmYYVvIUs8uUBEDP23kmFvboHMw910CNADivgdwjjq2ZX5FAgqDd8aBiWDyq
 HTo6B0OqMdtdvXue1SWbiklvA3JDzQ073Xe9HIJY4ABNcX0/TBJP9KjS/1+6aUxHnqXgujfGAwi
 t8gfAcyysQHcXlc4Ktw==
X-Proofpoint-GUID: edMzDdi8DZhsGZNpEUqDC-wuKNl3DO-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601180159

Remove unused includes (no mutexes, string functions, no OF functions)
and bring directly used mod_devicetable.h (previously pulled via of.h).

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 4 +---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 3 +--
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 5 +----
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index cb295856dda1..f9d8fb1ab1ec 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -6,14 +6,12 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
-#include <linux/mutex.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
-#include <linux/string.h>
 #include <linux/types.h>
 
 #include "../core.h"
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 792089628362..9934ef6205d6 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -7,14 +7,13 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
-#include <linux/mutex.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
-#include <linux/string.h>
 #include <linux/types.h>
 
 #include "../core.h"
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index b0c7e4f6df9c..8cf61aab81b1 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -4,13 +4,10 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
-#include <linux/mfd/syscon.h>
-#include <linux/mutex.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
-#include <linux/string.h>
 #include <linux/types.h>
 
 #include "../core.h"

-- 
2.51.0

