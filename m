Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB4F2FF153
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759816; cv=none; b=QWbFKWQRFuMxkcN9BwIm5q8/4uVG7aWq6AflINc0kZsGnLk+2BHvBOz5O3lJ4FMIDeYHcWrl6tQobZFA7e4fxgdKCB6RKQaS4bO59hk7oUmH8HqWK+pKYcEh+hZcdZRk8YRYww5XvsPNmispHQalkhEVhqi9SiLWj5+u+7uMDNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759816; c=relaxed/simple;
	bh=Y+FQmd4rABqYPyTPKLcnkK9CTadziXSgsQ+69hWhimA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=scMO6rWkRka19wb604GrJ/kNgB4i4vToRY+1SSnu+HTQ6Ba5b0zZ/exKVJVkXh8eSzirYJVBwvcZJVVA6m/QOGHhyFIJjc56A3vl8k4tqz6gkdHIcte9qpmD6Ru4M1OtKYRg+sYKFG9YRG6VfaSevub0NealF8agg9NsDzun7do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXHpX1m8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CBjAT2xz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXHpX1m8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CBjAT2xz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60I5rXFR2375519
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LXncEA4jW+AgdDM8Dn/nTshgL+Kv2q2dFOJVpt182v4=; b=KXHpX1m8m3rn36Jg
	XAOXwYt+u9K3TjPostd/Ga+OJGx79TdYs516hJ7Uuj1DP0pic1AGnEgszDSbZwne
	PlDfhwKpRxALzLVi9/aOTpk6UditMnDm/26xLFGDtbrHEDQ8D8GdH0lLQR4Svsqo
	pnP7iEh9mMwx8zLBM9tlTFKD5OpkE0j97kbRdyVpYBq944m/m/NN6wbfgx+b0Do/
	6FHtL3IJp+oK9lZqxZHck0q7vU3B3O9QpoRqSvP9CfcaD0RXSV07ytsg3tCUjcGe
	ow5J9jBBcx1u5RbtkPZs81+1yN/7xDoG6TjVaRHXngafujCzRFemL8NSl76wwWQ1
	/MK8Jw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2guju1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b4058909so290609185a.3
        for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 10:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759814; x=1769364614; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXncEA4jW+AgdDM8Dn/nTshgL+Kv2q2dFOJVpt182v4=;
        b=CBjAT2xzpgqQM34NgaHCJYF0SygTfTHW4D33ZjLo4NkmA1zg6bQkKCHgTD6Un/AAQf
         Q6HDN6092rKuxwQW3yMMKYq7ChbrdfCLXwBfFsxJidhpsR/ToL1SrrhSjrJsYF/cUQc/
         CJLoU1G+JbqZ7Mtshbgg14sN6N2H0dqLpSgtM0uznDGJ5x/vW07LwmqIk6FLbvff4G4x
         moPIlTstRp2UYOI2x2aDhF3gNyMo8lgjTW0BQKY4+Y55dQBu8RU2vUKyNZKRHqq5ZXg1
         /n94dX8BVpPOg9mbBHfTWISpDZitOkOVy2yl4upZ3eadoKMxGmfnNUY0KyuFfe4AdtTc
         n77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759814; x=1769364614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LXncEA4jW+AgdDM8Dn/nTshgL+Kv2q2dFOJVpt182v4=;
        b=JdIwU7UhxzPq7VrJO7/zeXllZzRIosQW5O7gpwxYRKXUzfdyL+kmYOqAaJ44ajmLQ2
         U3VKU2ju5uIQG8r0YdZwGWK2fpiyR2ToJS/tYdCLmtjZwVioSlqjY1pZy6SSO/yN1QCA
         8vqvCvxkkojfft3+RHAMZ6/QCWzjbMauep0kXB2uwuTKueOFC3542yeLXDu2fL8r1fsh
         W8gN4QiWYUbs5Dw/Mu6yNh3+/jVP4BPzaT89J1U0hI/gVliqFLnct9JVDGNU3J/TNIVa
         WupHX1pxDTDKTR2NpImZRS3vsRuwpAZIijzYQsky5sAI9Y0VIGLCPsklxcG/4qTiXCSs
         Udsw==
X-Forwarded-Encrypted: i=1; AJvYcCVgQb+M2SJkySGC2HFbqPjY4SrenBcYzp5HNQniEI68rgmL3JFlBMzDGI4FfE3UsCYdTwZ0cVE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl17gyZQx16Thiu9TpYwuMw6CTybYuQ03EpUI4dLBIZnsnec/x
	/uHMBfidKeCVJANOHNp+RWe9LOabd7kZ0EC4DRLi8VSc6pJkpTPDKMceFy9Jo/kQsBozUdzc2bG
	N8Qd4dEG3U9+F6cUOlzpTlLNAHr8HBGneRSRoTVe9Zbq+hAPRrEaTkJBwZkY=
X-Gm-Gg: AY/fxX4T82lwHz4FiCyNHnMcfr+mvS53IDkMDAMCG+gjBYEZBrszhOm7esbsLHiV6Ly
	X5vCmDkTGzMOIaMpFBarn0cMucRK2FQJq1+Pq/dMPYqUSk2sMLiVsT5SbLqdiHS93LLwbCuW7Oh
	E+Ll5gJP8ne8Ul56lAzPoGqftAgbExOSEQ6QkBxoNbcOtWec0IbqXL4WbaijH1WxIRPXzXhv2VO
	5NjgTpS6WlmSjOWYvizwFqR0F6Gbu2ToHCWzjOyGGKUuAkw7GETukQbBDVUdad6aNCXCxyetMai
	tahZJbLM49mqwlDccppedCEK5izDGU/EOVZ6FY5c0U3uT4aHsKlsCigGp8sbBw9AhkzN8clChU7
	A6UOE2e/cHtoS29H9iEwYNrD7WLznc6zdGQ==
X-Received: by 2002:a05:620a:4801:b0:89e:67a9:fced with SMTP id af79cd13be357-8c6a6789e6bmr1223537985a.66.1768759813371;
        Sun, 18 Jan 2026 10:10:13 -0800 (PST)
X-Received: by 2002:a05:620a:4801:b0:89e:67a9:fced with SMTP id af79cd13be357-8c6a6789e6bmr1223533585a.66.1768759812755;
        Sun, 18 Jan 2026 10:10:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:28 +0100
Subject: [PATCH v2 05/11] pinctrl: aw9523: Simplify locking with guard()
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-5-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4481;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y+FQmd4rABqYPyTPKLcnkK9CTadziXSgsQ+69hWhimA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHyayuoBeIp9CFs/To0KGzg5wtCKMQchY4rd
 ZTVsgBVTRyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h8gAKCRDBN2bmhouD
 18jKD/0Q73dFNHHnrM5068MUNMPnIOmN7objobVATcjCxeNYoQiN8W7ivD4SWKVqA/DdX1R5St3
 0/tCDBGqXO12+uj40UIZE4ljdgKCD+fsn+WSOyeGFeJIxnFDyd8A6kCV+M957Av09NHGOuZzCz1
 n84LPH3ZRBC3uEP8gG7lVsIgTJ7Wd71Udx4I6Tf07bk7F2r+44NHCHKRtu55X8WAjRvLmynm86Z
 YOKnbZ2UCIUPJ62n3gMymM0/Ir+JkYjini6adzG92nXecsMf8J7ulbe3ZCqT5uJ5jTnZRR3KKGb
 psXi0oNg+Osb0wrW5nqR6O2Im3Oqs44dXVV3i/kbow6pNJeKSmmU5W+l68bvNbT281ghjvLIslY
 vvnRwxod3eZUawpDeP6T//3MNuKK2Gg8x9Lq9ey+ddE7nCFUTBA3ypX1ErFjwFg0DHDk12c8WII
 gi08BdhYaU8LtIxZzranwWhmvK3EgkrmYF+5lIoiIaY0e8XcmSW8WsiZCwrGUt/cBly3O7IY92Y
 FNoDXLaqmlFiFgTiMN2tVA1DpqquhFr/7fQp130j1BwOiRjF1OVqoVodqNKRPARHoBOIEmZMpIC
 PcI+/h6wyzJPyYXnC1UAQaCuoEGdkdUU7RcbXCWBfUmrFfqNlwHm1DgkCLMLdyMmi3GmnFcSM1m
 fHjfP614CxYOwQA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfXxfYY1NFaaYxf
 /6p0MM6a9ReGoe8dRxH0Du8oKjt7vOlJUimlT9HVEp3kVe/x6rKS85R4B6dGZ6rSM33hEk+zI/G
 ISiSeka1JQMpXA54u0GI5Yu1EAmcZ6HsED1e2aymDVEwz0v4WcImJNae0B7lNH85l3OX738qubF
 dtUBO0dBjk0E5N2AVGyQ/tZmlCjUzWob8izDAOVlGuBEJdYHn59FlbEHHnSzjHpQJhSQO4rmoLS
 gXyLbueN8MrpAjbGsPbi2WcPPwTkNN0PO4idAOdxxKrcojWOi3Sn+Aj2PRGej9M3YpkF5d0mktI
 A8jM25hOahY6zf8+qVKUjVNma3PuMweW/CpeHIJg3AYHV+wg9YmeWE3OggaW4EapRNweb80wFww
 xyIY43y9/QC4xGONUTUIU597tjE1qbuJ7+KYYMVqdqGYWzRr+02hThEbYKQI5H9azlPADKIw1mq
 0JxBH3DMpVkfAYmMZLg==
X-Authority-Analysis: v=2.4 cv=Sev6t/Ru c=1 sm=1 tr=0 ts=696d2206 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sJPWbbE6un6nfY-uGV8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: nguc3JCLyQjWp2pA3Rgjymynt0n1-dO1
X-Proofpoint-ORIG-GUID: nguc3JCLyQjWp2pA3Rgjymynt0n1-dO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601180159

Simplify error handling (less gotos) over locks with guard() which also
removes possibility (at least by reading the code) of returning
uninitialized rc/ret value in aw9523_pconf_set() and
aw9523_gpio_get_multiple() functions.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-aw9523.c | 53 +++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 479553a79216..02a24ac87ea4 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -291,14 +291,14 @@ static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	unsigned int mask, val;
 	int i, rc;
 
-	mutex_lock(&awi->i2c_lock);
+	guard(mutex)(&awi->i2c_lock);
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
 		arg = pinconf_to_config_argument(configs[i]);
 
 		rc = aw9523_pcfg_param_to_reg(param, pin, &reg);
 		if (rc)
-			goto end;
+			return rc;
 
 		switch (param) {
 		case PIN_CONFIG_LEVEL:
@@ -307,7 +307,7 @@ static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 						AW9523_REG_CONF_STATE(pin),
 						BIT(regbit), 0);
 			if (rc)
-				goto end;
+				return rc;
 
 			/* Then, fall through to config output level */
 			fallthrough;
@@ -323,10 +323,9 @@ static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
 			/* Open-Drain is supported only on port 0 */
-			if (pin >= AW9523_PINS_PER_PORT) {
-				rc = -ENOTSUPP;
-				goto end;
-			}
+			if (pin >= AW9523_PINS_PER_PORT)
+				return -ENOTSUPP;
+
 			mask = AW9523_GCR_GPOMD_MASK;
 			val = 0;
 			break;
@@ -341,17 +340,15 @@ static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			val = AW9523_GCR_GPOMD_MASK;
 			break;
 		default:
-			rc = -ENOTSUPP;
-			goto end;
+			return -ENOTSUPP;
 		}
 
 		rc = regmap_update_bits(awi->regmap, reg, mask, val);
 		if (rc)
-			goto end;
+			return rc;
 	}
-end:
-	mutex_unlock(&awi->i2c_lock);
-	return rc;
+
+	return 0;
 }
 
 static const struct pinconf_ops aw9523_pinconf_ops = {
@@ -599,14 +596,14 @@ static int aw9523_gpio_get_multiple(struct gpio_chip *chip,
 	u8 m, state = 0;
 	int ret;
 
-	mutex_lock(&awi->i2c_lock);
+	guard(mutex)(&awi->i2c_lock);
 
 	/* Port 0 (gpio 0-7) */
 	m = *mask;
 	if (m) {
 		ret = _aw9523_gpio_get_multiple(awi, 0, &state, m);
 		if (ret)
-			goto out;
+			return ret;
 	}
 	*bits = state;
 
@@ -616,13 +613,12 @@ static int aw9523_gpio_get_multiple(struct gpio_chip *chip,
 		ret = _aw9523_gpio_get_multiple(awi, AW9523_PINS_PER_PORT,
 						&state, m);
 		if (ret)
-			goto out;
+			return ret;
 
 		*bits |= (state << 8);
 	}
-out:
-	mutex_unlock(&awi->i2c_lock);
-	return ret;
+
+	return 0;
 }
 
 static int aw9523_gpio_set_multiple(struct gpio_chip *chip,
@@ -632,30 +628,28 @@ static int aw9523_gpio_set_multiple(struct gpio_chip *chip,
 	struct aw9523 *awi = gpiochip_get_data(chip);
 	u8 mask_lo, mask_hi, bits_lo, bits_hi;
 	unsigned int reg;
-	int ret = 0;
+	int ret;
 
 	mask_lo = *mask;
 	mask_hi = *mask >> 8;
 	bits_lo = *bits;
 	bits_hi = *bits >> 8;
 
-	mutex_lock(&awi->i2c_lock);
+	guard(mutex)(&awi->i2c_lock);
 	if (mask_hi) {
 		reg = AW9523_REG_OUT_STATE(AW9523_PINS_PER_PORT);
 		ret = regmap_write_bits(awi->regmap, reg, mask_hi, bits_hi);
 		if (ret)
-			goto out;
+			return ret;
 	}
 	if (mask_lo) {
 		reg = AW9523_REG_OUT_STATE(0);
 		ret = regmap_write_bits(awi->regmap, reg, mask_lo, bits_lo);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
-out:
-	mutex_unlock(&awi->i2c_lock);
-	return ret;
+	return 0;
 }
 
 static int aw9523_gpio_set(struct gpio_chip *chip, unsigned int offset,
@@ -695,16 +689,15 @@ static int aw9523_direction_output(struct gpio_chip *chip,
 	u8 regbit = offset % AW9523_PINS_PER_PORT;
 	int ret;
 
-	mutex_lock(&awi->i2c_lock);
+	guard(mutex)(&awi->i2c_lock);
 	ret = regmap_update_bits(awi->regmap, AW9523_REG_OUT_STATE(offset),
 				 BIT(regbit), value ? BIT(regbit) : 0);
 	if (ret)
-		goto end;
+		return ret;
 
 	ret = regmap_update_bits(awi->regmap, AW9523_REG_CONF_STATE(offset),
 				 BIT(regbit), 0);
-end:
-	mutex_unlock(&awi->i2c_lock);
+
 	return ret;
 }
 

-- 
2.51.0

