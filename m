Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F0239E191
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404631; cv=none; b=SC/vTy/erlnhsGZnhrMNtfHwPCi118xvx06W0GjnDHCpqR4492mHltZ+hrd97Uc6P60m5aaMpMLEOz9UTEEPcAL74AtZMf2RxloM5RP39ft7w6XZnWp2W4ymeUneFOeQW0uK1rmankN4n1BXn8yKi3kKVerrGGCJO7Ukqwfws/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404631; c=relaxed/simple;
	bh=vQTc4Cx1cuzPah8LLXL26kybe/0nRvPEYAbDNlVXaL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cEIBlY2HGQoW16JHgEbW4nFJNtt80Z7/qT46eAIGhyfpFfAFAwN1ZwygHx82QDynlKTjMFg3GhV+KbVtkexDW/TzdEaT+VNV7psE4PFdj4A7NLJnPPXjYS1zunMrJF86ytxnrOFhjbQqPREcxExTht7yuzUwgDr1nb1P0bPIpbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nd+c0nG/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQ13Fuws; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nd+c0nG/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PQ13Fuws"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EDV2BS3551506
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TQOWmZ4i8qr9JpAuK61Y9RoWdOmJcEUPWfdU+wHADeY=; b=Nd+c0nG/FDs7XoIV
	szExDaUVSYkyrbiaHalQ7Ap9+Ae6UJ/LuHmENsYmw2Y917XAkpOSA5PDn/ucsIXw
	RLjTwBfwp+vw9JlBmnZtHYYPA+nuxAqdd1pB4mQdMxi8gLqJiqMqFue9dtxzWhhw
	z2Mh4kP3YONo/VwuqMbCWqIdg2ZulAZiBjr4/v+VsHOzRPeea0BMSLLBuepXEfaK
	4TcnFo8VnR36XVqUEY+VzZlVDB5GSRQreJSVMoii0SAdOXRljAxbNb1718WPAMnT
	H1EH+vCGRqzwWc6iLgCOM8ppr/Cv0FkS9cCCOv2YBPPewR6rimIDRchIvZsKHfwn
	UwREZQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpc3jrd3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb9f029f31so2434645485a.2
        for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 07:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404627; x=1769009427; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQOWmZ4i8qr9JpAuK61Y9RoWdOmJcEUPWfdU+wHADeY=;
        b=PQ13FuwsfRYq+B6oPUlE5PuQdTbPvsUSpwZ8NgEeCHIx2y/mjkvtc9hiHQcPVnbxqF
         s8c3+7Q4fspXStXanZDkEqyxmBVhP7/b1acVhpFxHWiVUVKfT8AnkrDzbzvyTXbC4lGz
         OC0jGSKUX/jqBPfxuJWoTEQ5SVEJkvjsOaoP8tEUXhp0h8yuVF5KwhWAILljyrlwXGE/
         iN0/6i1cGKP6OUr1A7pzTysu96M/t2fD1CaHBY6rVAGatxPRsjeYmxGt+3FBAm2PJ3qL
         I9RbGTviolEhHAA52qNUvorg45OY6su0vqy2y/CURq6xnKV98zyd6vsOrd1Bct5+hJLT
         4O4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404627; x=1769009427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TQOWmZ4i8qr9JpAuK61Y9RoWdOmJcEUPWfdU+wHADeY=;
        b=xOWT/kSyfRCUms/cIB/CgxBMg39ILCezkCJXDrVxwN3Dpn28MqoxbITOTPfmIR1CGb
         gRLSQ/mT4P3uXg5VPCIYBiUSSotKEsyyfw+2V3Ox3F4zxGqvJRE1IxoCPkW/mFH3mGTg
         M7WfGDtM7c1rfsb2DwK+kYh5021HBPGOfWYDy2MY4q4QdYAf3n6sorT7cw5byMgK4qkT
         D56Ac/WbhiQCCowaus5OZV0kbG8qIni5eBfouWUAbiS0xuJUajSeadVc6R9RnPqfNDr5
         PLHONYKvdGqHyRyrhoq7iLIg1qMR16E/oZioLSXyJXMIZ5gB6WA+0Els+gx+yYvqyH0x
         Lxxw==
X-Forwarded-Encrypted: i=1; AJvYcCWmgfC7bc20VCGnO7vdb3EnxNcpw7qlV+KDFfa/qtq6NgHxPuhBVNGBkjjZlkw1rm+U8C1MjOQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgSoaNViOxPwVJuzlCub3c9lMl9xtIto/ZoUMfq0WjG9hCLDuj
	K5ZVSsl2LG48HbSDrKdTQvWf4pGvmRZgkGwqa0QOH4vxyX3kmvb5d+2tiBVRASCG/Vpk7DZD/gh
	XkNL2FuTcqYEgQaEdxLMKmKDcZPC/c0D3xMqsPpl2UfN541Y3hKLyGfiSVXg=
X-Gm-Gg: AY/fxX5LMEoEQAU9L0paAvy0G/r7ihin94tATf/KBB2dmkwChKUkPusvp1isxdgVmUR
	X6k6XhU9dHL14rQo2My+gqpv9eV5fKf9VppOkVXhv6hX5nk4fmf2NcPTgeEzVZuXmCQD2aU0TqU
	mEkE+1PkIiV1b7P/yEzP/lEDczqQU0+Pn1SeLU7FI5moQYxFZ4px1XgzKHqhCY81QMJP/0H60KG
	ophX+qgpL/wg4JJbdH2TsRWQ1n+vfvXMBO8PTU3x5Q3rflH3xC35f9MTmULQ5YBVzGrozaUiC9/
	9WQpPc1B3/SsEyy4suGPviHZjZnwABT7xPgTjzaHQYk4yCiDTH1EhmWN53rUkZlob4A/94TTNmr
	mw2T4WTs4r5E/qObuqJKPl/XhEo3V43sWqA==
X-Received: by 2002:a05:620a:44c4:b0:8ba:5255:107 with SMTP id af79cd13be357-8c52fb2406emr386805585a.18.1768404625672;
        Wed, 14 Jan 2026 07:30:25 -0800 (PST)
X-Received: by 2002:a05:620a:44c4:b0:8ba:5255:107 with SMTP id af79cd13be357-8c52fb2406emr386788385a.18.1768404624120;
        Wed, 14 Jan 2026 07:30:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:03 +0100
Subject: [PATCH 02/11] pinctrl: starfive: jh7110-sys: Cleanup header
 includes
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-2-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=906;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vQTc4Cx1cuzPah8LLXL26kybe/0nRvPEYAbDNlVXaL0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aBbIM2DWPBQNuBnGlAmRqfublmk+ABnSOCP
 +eX7CJ/kqCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2gQAKCRDBN2bmhouD
 13B7D/9HNpUgwKflmRiVEQKiqAHJlihytGsm6xhqvuPk0OXM6g4wK8KWJ7AoXqklkhVGJfLYvjS
 EVoKICEkLULEFDlMFEFKdNqN/uGc1TUwNp5gMcRJRrlIE+ZYvRo4LIknCsvHV1jT9i+Y2L23c3p
 +uDVB8dH2uwJv3IuhJUnA1gGMQM4xpw4ac7NB+UCOk2LnfcACtKncHKQ7jr4vbc3O0f3pfTQpJp
 dZkWVtWxp4BQm+5d1XuZwVzvgj4b/xAJcvhU0BzFKw41RORAakfzsVxAkTHHtP62LHFxnKZSwKi
 E8XvqOwq5O+74OFdv+vHFLcG/6f+rPsNDMLHCxupzCLkx6Pwqg6qJp9qYbsQJCEuj1EJyrotryy
 ANOtROt7QabL1HCVBOeWE7/I1c/PzdUslygkZyhowuMmtTrgMAsawR3fzOXHuQOQhjeKsN9lt/M
 fx0zuszc+shjokj+huAOTlufmrLlWzFxqM4Hu67hEma3ScG2iv485ncOEg87MQQpuFfjrtb+vDK
 ICaUVJAoHNSRifaTDmw6lMDG1ZAAU7vvujZpio8eHVdgOh3jPCnAMmeTePFgqI8N3JIJ+bkQyuz
 2wHidhJCNQckjPlFZ10HKxqor1PXsDvliPHX6i68yW1W61YZ+wIbn5bOmZ0GIDO6/jOlooNoy63
 tkrtX+1GbUIJE4Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfX2ezCEUi2mKNL
 VmoLEWoSw4NzRWkiVRi6KQQs6X5OZxqPtyMTfHoZNwaHoSKDBfKPAihqr+zVeZUMFkDMfItSwoK
 BfQhWf3WyicqtDybGtaYmOxefRAVygyXeWR87YrjbpZCs4UOADGaoXRCBT/vO1pjNYwV8pRK43A
 6vHB78kj3VTzKTzYcqwgZLm9ct+adN4qtg23ICK1FbVTyec008845fzJrx8Wr/+iyQNtdgZZByV
 wbDATtTXuvxAUDgQZ9x5jn3VoP+9LPHlhl3rP1k4uKQ4oP+i//srWrVhxyofKnPA7ygYr5mSVZK
 FUPR/5fSUQzCBoRORfQHW4Vlie2qj86Kr+1chEZ13S0QZsvAqWP53zbPbXf32YzYnvmnokqdFxT
 vVIhBJDDpyV6b96VgdjIkXwVMMC8bGLg6vBAdZWlz4fhoExRYGuv8DkEr7Q701T+IV5wEQBy+O3
 fB5Q2/Mikus8lmpbJzg==
X-Authority-Analysis: v=2.4 cv=RLO+3oi+ c=1 sm=1 tr=0 ts=6967b693 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=b-TtO4hhcUHcL_E8iecA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: OGVrLyCtN_yJTg30cQlK_OQHUFCZBDka
X-Proofpoint-ORIG-GUID: OGVrLyCtN_yJTg30cQlK_OQHUFCZBDka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140130

Remove unused includes: no clocks, mutexes and resets.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
index 9b67063a0b0b..44f84e4c29bf 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
@@ -7,14 +7,11 @@
  */
 
 #include <linux/bits.h>
-#include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include <linux/reset.h>
 #include <linux/spinlock.h>
 
 #include <linux/pinctrl/pinctrl.h>

-- 
2.51.0

