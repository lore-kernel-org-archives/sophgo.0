Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D302039C63B
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404638; cv=none; b=se2VlLugRBQ7cd/7ewZ0iphCG9CnuFgVuEsxz+Us0dCvyrlR5LLIuuUBD0RuxPa+nGY8dyRQmWLeafF+vqtMyHK9BydX4V6kvDFz+3BlvNZ7FNqpB/gE4/I0xcSVFR2xHOsnToU6JWJ43qPU26FYso4nWn9hIUatjDPpx5mAw7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404638; c=relaxed/simple;
	bh=adtV57CgOwnY60Si6YEP4k65ve4WmCO5x4rzf1ZqeaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hb3PFhRIe87f74RBsL7BX9SOfebD1F+++CS/Yl3PmiKCZMcMCSqAjrAuxrSUvhmZClRd1cqbr9ZTq2R1DH28cXqoCRthVEcscOk3ELJAwvc+IKqLSGrblJ+hgJ5/IiLubynA99hRqTJ6Qoyq0am9XQGTvRQt7xczFy5aoJMAPKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6kkEHcw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfbKumc1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6kkEHcw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfbKumc1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EB31TG3279777
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=; b=I6kkEHcwYHnmLqcC
	bCog3zsSNQt83q1g15rqSXMAHoCS6ayKBCuK/od57mJZRARRmEKWePBZ++KRDRFf
	nA/wQ3gmm9OmhEdA75fhn5wCblufkPBQS4FPjA1MLG8XjHUW5rpj3ThuLbR54inW
	ZC5Wo+bUgahzHKYqqo6mScjg1mnK/iL0PhMHXVhGcvGY9zbAELUEeRa23OKCvh3x
	urMzRY5AmgIdBLrvSeX0LZzwdcJr7L2+2n1AHSumMEuqSkZsHx4g6FgrUQB+0/FM
	xIJf0EElVUNgq68df0rWEdMcPXSuVq5wvOXdMLZwdMvExgqGYam5JXWk6HI6mWVO
	XotTrg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x8rvcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52af6855fso201594085a.1
        for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 07:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404635; x=1769009435; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=;
        b=hfbKumc1m4LN7ukODYC+WKVF0yLOgV7Yi7byYZMVPjoz3y5ZTixBVeQz8GQ3vH7sOs
         Q/lNaMCBqJbzXPk70/aPAGZoeb/XIC6A3L4yFk01xHz3tNwbe+44yn03SyoJc95QPm0R
         xsNpacifWR5MTNsOQPvmxuN7n3Q4zeeogQNRNdi0RqtqwYxk74PX7Ij/dFP8puJ2LnhK
         OvUc7D4pYw5AkqNmSEs+MxsKeOFt7DfI6buNj+kMBEeGwamvncbtR4/5gpvN2LY3GcVD
         Rdb7ZdVEMqHssCljEPZUlywizEpBriDO2BzOSwkcX6I7PZ/AsPBb2+QesvuDlFP6fikX
         3T/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404635; x=1769009435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=;
        b=BF8W8PfhnmSXzyRAOi6jRKIbeMc0yKEksLWcK2J4k/UFBrV+M3iZ7xQJPlABGBMnnp
         7RVjtlU8VVjczlvqRY8gwWRxfmk5qwg2dpY4ASefx8/Hlscu1OVewmvOL09P4dzR/7Sk
         g+ydGcWfV6/4G4u/nkSvYNl79o0X6+JbQidG6O75gyK4BctSRAjfiHWNj0tp/aazUVsL
         ab/P/KJXmCDt9NEU2I9TKHlhp83GVoJH6gj43G4XZPtUyokokOUySt98syMyPWmVSKVL
         jNCVqaLBuqEI0IC4ei+iFF8FXXwrczLO1jUcjYdrGuESBqg7OQoL1CifJLxP2DnOTIEf
         6NpA==
X-Forwarded-Encrypted: i=1; AJvYcCVfjh/CNVH/plSa8zRO8lmNtPvROyujq1eB0Buhu1aLYMoZXjQUjqJA1R956NFqNh965YwGVkQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfSPaYNYewcmtgLnC5K8aUU0SNRU0dT76bjyq6PtsSVq+wcEHZ
	MJBIlToba+zBURhzCyzGvfaJ9+nN9E+JTe7mOEqSsxYYR5+PqGbZAOcuHmpmDerBRKGn02pjI3M
	TeX8ZPd+2rCJtn/MNweutmAYNJXnGasm/LSc7aiwjJe1S5w0g+j5BWAx61Gs=
X-Gm-Gg: AY/fxX5NDgMlyWAv/7NcgG1lgxlmX9HaT8YUF5R9HpOknpxBCIdkfS1yo9fDn56eyDW
	FCi09fg0cB8tqU/d0PUFcXHl1fwf97gwPDHD+PqbIaiQjdJ60bqZKNaQPTt5IIcUdOzYSS90LFa
	UT0TyXSLrC6bHWxfUeL5IZ7/ci7A0cXEI8mzeUy9JgJqSwwsovvDAnlul4dPtoyXFx3vITczkHe
	jxUBKHWjOSbA/VQ4xUknr7gzCdFq22Z6B/SG9zLgUClSvJwiEbVuR6zw4YpSl0Dz7R2XIv145sX
	zZu7Wi0X+5Hpa2aZL00XgFgAF4JroUwFaZm0nJYIEQmsXt/ccoZ+ZrEWSYZ0jy6c07iJ94svHxu
	L+r7pCcGgOh5sGEgQeNTZFBoMtnF6GZaj0Q==
X-Received: by 2002:a05:620a:4101:b0:8b2:d56a:f301 with SMTP id af79cd13be357-8c52fb32b67mr343233685a.14.1768404634235;
        Wed, 14 Jan 2026 07:30:34 -0800 (PST)
X-Received: by 2002:a05:620a:4101:b0:8b2:d56a:f301 with SMTP id af79cd13be357-8c52fb32b67mr343223385a.14.1768404633459;
        Wed, 14 Jan 2026 07:30:33 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:08 +0100
Subject: [PATCH 07/11] pinctrl: tb10x: Simplify locking with guard()
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-7-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=adtV57CgOwnY60Si6YEP4k65ve4WmCO5x4rzf1ZqeaM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aFRdTPwiFL/h2YLFk/n9wL4n9QTdVBj0L6r
 8aUJ0hOsNiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2hQAKCRDBN2bmhouD
 15BvD/4sSskWeqqie+QnWNfV5njoEI/Dxm+OQU6hvQfAn6W+mFLEoVNCYY1DYciSU2Abpt2R3nR
 +qvBID4STILG6i8SyHTuaGcand6oW9yUTQpRJAmZLQwTU6t5Txha1TR6xku+5Oy8NyzMaHRuJTv
 +q5GGceQij71KHq+iN7y+f2Kh47ZLjY4bh5UEgUQ2UIoWQOKsKGVqFMR4D+URpgUMijJNLMK1eY
 OiA7jL0EBA0jRXolicdtAQTBVHk5WKJIlq2dKAIVzHYv12gvTtggiJd6gKyNR8t5tX+yOxZqM0D
 Jd4RwOyuhKazwxCfXv+bUlaqLfNnifpec2mksBSbNjseAfzxvkqxCt+VMZHZVoZ9mzpRmAppP30
 i9SP4gbwW16v6PBBhPIiLG0HrWfQ9XJ2JH7MYWKjn2JypFxHEA9Db766OZxcFqNRKVlsMAtIK06
 ZKalbIjY3hmQO2RLFsbhmE9qgNQm5n6vPYCORIFGTSFmcIKyeFghhXkkuZqhqTORTVXwOoPyhnb
 rrCyYVw4Twlq3ASI88CvQgLBkMD2dmqaPlhTZ37MJzVXVgufCKwBDhrq6xhuAlBI1vufryly9SE
 iw2aWK83dO7QfgeR/uYrjPKYMLwUfoTt6nq5Ph8Apc8jGok5zHX7/Xej2gYuXZnBbrTOGD48Hiy
 LRCCfd8e1rw2F9w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: nw9eR8EbbsrDEL4MFJztug0-3IxFy5fH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyOSBTYWx0ZWRfX37OS2uGOjyM3
 wSLT1D5yCqO5LV1ur8MknQrYe9Jt8DKySn8p0c3hCMYSMZ6pNSwPO3FkffMoKZaL+5sbgC1mA7B
 P6v9GI2PnWFCK4mqN+E7RleVbfbyN0/KtUJAnCWeiYhMCHyHm/kD3/yujBsDQUAHJHZ5qO2wIwy
 LD63SPLabjNgk13SrGPGJV/lgsmy3rGBmb+EaXs2Dfr0VTw7XzdpIuuYCFm6xiplM707gOMXbmg
 IE+0lfGykoy6jYfpuTKp7OG8PW07jQ35kWpo1Q7Mq5ZdZ7+7ANhx5DQxmPaHlDmVPwTuz3MqERP
 WqqxSYe+yiTnlzj78t62oNeULVDuXbP0gjIzsl37/+HMJke+nF/e5czE8bkREAnWr3XljfCmKB7
 qyWXAICqZVfs8hZofgtklq/K4qYmasazmueWD5YIohSUYkZIboNLkjlDPCFoI7MNatwp0FYBG2q
 OST2Dqd1tCxOAYZDHUw==
X-Authority-Analysis: v=2.4 cv=HY4ZjyE8 c=1 sm=1 tr=0 ts=6967b69b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fB2tTgKqvhDdEbG57mcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: nw9eR8EbbsrDEL4MFJztug0-3IxFy5fH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140129

Simplify error handling (less code in error case) over locks with
guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-tb10x.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index 129fa51d13b1..3f581404a9b9 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -607,7 +607,7 @@ static int tb10x_gpio_request_enable(struct pinctrl_dev *pctl,
 	int muxmode = -1;
 	int i;
 
-	mutex_lock(&state->mutex);
+	guard(mutex)(&state->mutex);
 
 	/*
 	 * Figure out to which port the requested GPIO belongs and how to
@@ -642,7 +642,6 @@ static int tb10x_gpio_request_enable(struct pinctrl_dev *pctl,
 					 * Error: The requested pin is already
 					 * used for something else.
 					 */
-					mutex_unlock(&state->mutex);
 					return -EBUSY;
 				}
 				break;
@@ -667,8 +666,6 @@ static int tb10x_gpio_request_enable(struct pinctrl_dev *pctl,
 	if (muxport >= 0)
 		tb10x_pinctrl_set_config(state, muxport, muxmode);
 
-	mutex_unlock(&state->mutex);
-
 	return 0;
 }
 
@@ -695,34 +692,28 @@ static int tb10x_pctl_set_mux(struct pinctrl_dev *pctl,
 	if (grp->port < 0)
 		return 0;
 
-	mutex_lock(&state->mutex);
+	guard(mutex)(&state->mutex);
 
 	/*
 	 * Check if the requested function is compatible with previously
 	 * requested functions.
 	 */
 	if (state->ports[grp->port].count
-			&& (state->ports[grp->port].mode != grp->mode)) {
-		mutex_unlock(&state->mutex);
+			&& (state->ports[grp->port].mode != grp->mode))
 		return -EBUSY;
-	}
 
 	/*
 	 * Check if the requested function is compatible with previously
 	 * requested GPIOs.
 	 */
 	for (i = 0; i < grp->pincnt; i++)
-		if (test_bit(grp->pins[i], state->gpios)) {
-			mutex_unlock(&state->mutex);
+		if (test_bit(grp->pins[i], state->gpios))
 			return -EBUSY;
-		}
 
 	tb10x_pinctrl_set_config(state, grp->port, grp->mode);
 
 	state->ports[grp->port].count++;
 
-	mutex_unlock(&state->mutex);
-
 	return 0;
 }
 

-- 
2.51.0

