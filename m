Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AEC39E6C0
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404632; cv=none; b=dqfK1lGb8llTrICUmQsXocnxkIwhdgHApvgSjOX2qXu7JKEJZ/jETuikD5wpdmsbNCq+8QujehRhjw7cuP/2MJPpR4wv2/07G4An4S8jT/ADgTSuJZBjB8Kchvt7sWgj07w62j1hT0NuX899ZdcXP0kt8ls+6f4Rm+8o27fKmk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404632; c=relaxed/simple;
	bh=KS2A41254/IzptP8+yKUiwH8wnfKT/gY+cirH/V2Wao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgZ/bFdEOyMsWL1RL3IpyaDY/vRlTEeaXN1sbRlvSV1cmDSaLvu9MDO5sXeK7/NL8pXwr9Ziz0VAbuQZEMZolVlFeXaex8RKwlflRgXbGpGoYGj4b8Gxw4XR6IjKbxvzvlNOSeX36/1EEKlBcGGIPvUgOOrGsVm2nP7V5DhPf2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ja6yf+55; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLDmKglw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ja6yf+55";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JLDmKglw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EFKC7c1942998
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=; b=Ja6yf+55fHq9cr9+
	3BmQxbt5bpN7SHtBWVenCY2tSp/rN7yEiuQCqdkiBXi67+06a/9pLEqUAeXLTdNc
	a1grs8LrblCreo1vw7SXp2xl5M9w4EIMROi0sTqscq5x2HqimEYP+t9LG7NSfIN0
	oW0mJSmKZfsrffOl10LCS9I+c68oIPg6PMdbu9NWlAbfYeIljtZ5LwgkSSYHwo0I
	3JOnKWXYOoVsAlspcsRJg5tELpY5u/wJniUo+jZfwG6wj8mYx63YcXGrOMDwboK7
	SOhO1+6gPKgS8ghvVXEQWk1ZVwZqbf1Hap0Q/5oJrgreJR5QtLCL1pFJaKpiTSIP
	2G8J/Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp7b6sjq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8887c0d3074so233945876d6.2
        for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 07:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404628; x=1769009428; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
        b=JLDmKglwTvT6L7yhWl673IlO+h6luL7z5TAROUAG4Bz8BFQHcj5btITghb0h7nkyJT
         6yqUq4dF9Qre/f6fjHHV00Z5b6fD+vhBHnsXXyGY0R3t+MLYepMUxoloMBfUp6RAY8CD
         gizbwsmylOpab9mXblF4VeiGztTSuwc+rjiZaIyGElw3GtKcQhQ96aBss46i1DT0rddS
         TBluLAIQVH8eA2OwObY+pUjLkWSc0Ezf2RhdOkM6uxTyFeyzb8IRmPSIjlKOboLV+7J6
         4C+VkL9lvUSnUHCXr97E1j9QsxW4XC5lWfo3tMyX77cScYLTMvcTt8VUea8W+/VjZ0Dj
         Hazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404628; x=1769009428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
        b=ko6r1iMsCxDzC5jlqauxKgDsJLy7IVxp7QjZArXMqaN7MjmVYSi9QTc5umo1dB6RH4
         y94bCRFFMRez1ZDFJCE7MqquCyygbQJC4o+cLdp2uJ13qxia4BiE2fW2SMTnUDGM9xxX
         /LO2MwcK5ICHZ7oVrTDiUeKx4uNaIzLJ3k6QXFfXJcgSq/hyhAlp1RzibE78RZsVipJ2
         2sosuoXDJYM3BI6Pp8mALh0WR1XghMM6MCJ4xyXA0f86UUunidyuh8KYqkaKxUDBCJhN
         zBVLmHO1rIwv5990eSzW9pJQrTGJdAZsE/5YRRoCRLbowS6oMcbyJKINB2PWaPuaa/I+
         8b2A==
X-Forwarded-Encrypted: i=1; AJvYcCVduF0kFZzknuVE6FIru1DVMZJVOqQylx1C7+SsVsB+HjGcOZqT8ptPVu0IP9hElf8UC10FXwU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDJ0I3QhCoicBQCCOpExTxsS7ntfXZGS/sXyt4NGY8i28zO0cO
	iK1mlUU86mnSOTUE4J840/uJvsEA9F6UWIXS4pt5GQ/hgbp52eBU8qeVHAJRlh8L290QlxYJtVr
	3SuiPGnRm4po0SYXlI8yqgc2qggK8Inrceoh/BuSLU0hFPD8u858JGNhG9aE=
X-Gm-Gg: AY/fxX783AR4ycETxeZTInqZVxvwoGro+aAJIT2HztsHUB9aVJ/lr4AyUhNiuejvb2H
	FyiOSD0fQbu3gXYpR2jnvAJbe5NJ+skzfs5c/aXMC+0Ca9fXqA7n6JjgE9rvskZ1VTvV22XaXto
	j+5SbYD6pCPDoj2LRVcFMWdJXpnjT7WQSnYa5G9EWc292DOw3ijFcx2GxxWEYSvQ5FpVEyWSPpP
	l1bjYxcYp+b9tP7m0HfcBaGUX/lKxdm834tab70Zb32sQg+H90f3L3TV6NUCZrWekqohpreMO9z
	4aeHYORjlIrNBzsVYnDFnJcISTz1CVre5n5V22kftu9BO7DGz1qesNGLTbCFPSdZ7odLX6H136a
	Adybk37X1iL8vYmR5lLT/hBeyg1XI65HyEw==
X-Received: by 2002:a05:620a:4443:b0:8c5:2dbc:6244 with SMTP id af79cd13be357-8c52fbcf013mr422898185a.47.1768404628292;
        Wed, 14 Jan 2026 07:30:28 -0800 (PST)
X-Received: by 2002:a05:620a:4443:b0:8c5:2dbc:6244 with SMTP id af79cd13be357-8c52fbcf013mr422891285a.47.1768404627841;
        Wed, 14 Jan 2026 07:30:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:05 +0100
Subject: [PATCH 04/11] pinctrl: amd: Cleanup header includes
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-4-a14572685cd3@oss.qualcomm.com>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aDV+noj7ZcYLzGFw85urth6DKCl65+zERGB
 6whzCjLMW2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2gwAKCRDBN2bmhouD
 13ELD/9w2SYmYalYA5vFc6Rf1PTVYZ4B1dYRonz1b2DQNyOu2VbPve8mcP3qP5S8Lunlmu9pnM9
 XxA6ShVzZzR8X9u1+aHI18FkeFftaZO1X/ipHiRgWYmwxHee50F43GoRYkUKtL5EeGs+pgVFtvS
 N35v5ZOaS4dRcJ97oRggrrqF3+rewugdNfcOjABy9z+5McTb/al3fNFk7obz1H3xjL77Jo3RQcb
 jKwvKaJYn+puhraiSHisoI1Q8H0GnWywr6Yq12zvOzY10VAU828u15UF1rvvfdSZBMNoDaZN8YR
 MY/C4aYFC0Y84PtJu62kmJ4n4v4JBd/PrIYVnOSEvIoAZkqMo4it79WoNtuEoNx+OhSQ0P0+FTw
 ncPMJVQ0RwPTjUhmgU+Siqc1uuFokQOIgc8sWxA187rXXifisB8e0Qz8cofr4vT2YdFLTDQlTtb
 DsVJhtQvL20afD8ktEE3e9SBn/kC2U5XBha9yUQiLszF7/SkefUvWkoLphBJoHJQesPlcSGwLES
 8ZjODkLNTik+YIzT+y6r9oBPDa+Ft1z/sPRZtZpjZCeGeSqLeOkBl2iH5kgzmgSjGANsVseb/1k
 xn+gb1RtR8rDo4/67L+lt6mr4ki4euFWZMFfg8c6VM8c7ZQonmBPCX9sGdbGnfFG3z8Loh8tgWe
 NlXvgC6SiJVTR6A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: Vxayd_TOWCbO3miHDrK3I8yM3UcObqZI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyOSBTYWx0ZWRfXx/KK6EEiDR/J
 FYkLXRcc+5N2UaQT6+4xPNKGkzf+/rZ80Hwotbbxe7oXyhMP4nBpXn8AZW6HB5scPKzd4h8M+uN
 sM97/1N6mPpOwI1I3Ymz1u3n+mEjVxwKKdrFN77vgT6bjXICI1RzK8v4Jr+r46UD2PNTXfLLOr3
 WQqCQBdZu/C+Y/dTMFFq00/rUiVy2eoM9dqDrxaBEG9rAD75IlW8eWcdPblWdjC7KnjpnMtu/Fp
 X6WD9Ny2pFDWh6NO+2+XM/I9bbMWgKDdOiq0RQ/TPVN9SFBOJOTsCnhc6DBBLKTqvFbJsG3DJh+
 Npg1matRRSWRkKfhDbhlBdv+xYgqg1fCJmJSh9H0vmkUe9hr1bUz5OFIOE39UVS2i2QishjWsXe
 O3gBRyTr29vC+uW8Xj6vCFt8Tuy2QamRVBBwjJyNwE2yYNRPEFeRSo0TaR6gW2C/F7q696xOXdh
 jmODGXOntwkYPb9/wbQ==
X-Authority-Analysis: v=2.4 cv=W+w1lBWk c=1 sm=1 tr=0 ts=6967b695 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tMXyHTyi87mTYQFNLaMA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Vxayd_TOWCbO3miHDrK3I8yM3UcObqZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140129

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

