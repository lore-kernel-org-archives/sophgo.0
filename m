Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2C139E191
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404634; cv=none; b=aZCsLF/v/FPpuRXVgplQEf6bZyiZyfwNd2a7KZkZX+dZL3/kfUPHH4svW4qr/lpP+4tPZ/zV81tR4FPqizWCgn2Pi/qLUGPPk+lWtloiwzxqdXBp1Xy0CJ9Zv0oHXn8tx/WU90pzZkG0d+ATqYyTmYoxvVVpoMm8R18BSbMlM98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404634; c=relaxed/simple;
	bh=Y+FQmd4rABqYPyTPKLcnkK9CTadziXSgsQ+69hWhimA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uwgl02QpDH1sfL2Q6UzMcyOM5SCHWolVZfAnO3GEIvZzE2YfUifH2YWJqamPdGQadGpqMK3oZiKGJhQ1k/yrjz0J65F0Q3sZ8jy5DTkFiYoKMHIhS0N7LCNOmKYORdhqjQB4PijwxOue/lkfjM4AOY9aJnFbjq4Yn9ZT1LbSUkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L1bLn2gb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekWAZYoa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L1bLn2gb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekWAZYoa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EA51462902834
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LXncEA4jW+AgdDM8Dn/nTshgL+Kv2q2dFOJVpt182v4=; b=L1bLn2gbhX1VQr5S
	DBrqZ854pXa6x0jHP6ADw0uJYdtEFgDvE4gD9u6gpzd62HMPmU14Zz2Yz+ffZGY8
	VY/nvssh6dZj5GnrLthMKJcVupO8HTQMojR7ZkiDkKR0XFxxqvBJUeKWNMxYJry8
	NwvqTbbKWLT75tdRH/42GO0jHIG6tsYxJZYxIt3+vwRt9jLFxqCKxsZvqH+nzhSP
	P37BGhyoY19MnsR0mwirGBB8vtCkN84A5wrbld369kXozOtYajjOcHWpNhrbOtSR
	u9dn/SmYXI+2ecIuTkyBKquonCEcC6bun8mA6WiUKZcz7VQzS0X7Qy1Zb+WncMs5
	/6FpjQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp931h2av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52fd47227so191415485a.2
        for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 07:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404630; x=1769009430; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXncEA4jW+AgdDM8Dn/nTshgL+Kv2q2dFOJVpt182v4=;
        b=ekWAZYoayeOsZ2mnaO5U+yYWe/3ZDHk7juAIIG+gNpNDqmxBjGXjABHRxuwhU58x5W
         FKdxSGmiCDGQxmAPvlBat1S7won5A3UdlO1QfmUNxZkDKTGKf2TWHjqYr+0ArjlM1fp/
         DR7eHP6Lm3wGkelK16PSm9yEgmYKzipfFiqj5nHtr4h/q86hCEBg4HZIH1e5BqJzay47
         +wNth8X60xBbDcGB/5xsgQw8uWULpxtj01kjOb5m2LqqbPWU/kNjyte3M9VjddgrShNp
         XDdLqeT7hQiUALZlYIw93d6lUzv97guZ6IX397qN/2rr3zgVWcxuoF264MRaRkdcsy0t
         xC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404630; x=1769009430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LXncEA4jW+AgdDM8Dn/nTshgL+Kv2q2dFOJVpt182v4=;
        b=dtnDwR1TEYfn0Tl0KRgmhtiSALe5rPFzuA0YAi1atuWNAy2EJGqB0eT0WPFEol7vHC
         Ef4Lvgyis0f/4Xy3kntc8l4BqbZunnoDy1RJRRqtQMqknHVKkvYklWwY9IiOHhIg/2w7
         qvsUdEgUoddbUKWnL59kSmW1+rRKIdXpxs03CPhIy2LvrJ2iWkXx63An5sFK4GuBoWhA
         wJ6gXsDCmC8BxmHvNpRj3GGUQ2YZZ/Piiq8DFsRViPWdX9JX3dx3Dbt8YQ7g1s1Z/Czx
         buwFcTXXgrqFG2oXjcowIiTSIR2Ks/6F+U968WKHX64o8bOO4ZIMt8fQMkVPmZJZIb3m
         iayA==
X-Forwarded-Encrypted: i=1; AJvYcCVnkRjzS3Kbb6pjwZlkwnFCGEDgCspZUnpAp0t62f8TET0s7qJICXGCJ480ZYg5zMHr0le5sYk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwirkaxZTway0WVBJ/D39e7BHSlKDFLW008xuDHDuJ72ZsHXaBV
	eCfmwsnDO+fqDehrohc73xtIyoB+XKIFiC45LZy5KL9QGKeOUfgT843T0qQhaBM1mf3yTfWtPUN
	/DMVOmizfvCWLsmX0QXbN93ppuOdUShlp8lFN0s7yHpuA/Uxt4prG6oUTvVI=
X-Gm-Gg: AY/fxX7SrjybbB1oHsCteDkUz6LOeelT6Vdp6fy+8jr94N3bTJx810cat/6nrZrDz5j
	sK3iPQ3U/cAEkfBUZ3Zq8L/AjaeHqfvMHBBAb+yhXsXp8Nm7S43QLqB9bkUvT0MWdO4nc/SeCIC
	testDbMKi3wvvSnw9B4Zl0/6Xwq5TuMBxHk7thuIl+BkyHl8wtTS6m4fXcvXx5uVHsOmGT1mMII
	ioeruRlYoDOPpw7KjDKDKfDSxfBOYHozoAYsZbQJtlmIbbHQ+E0slm414RiGQBEFoQcgo7RKRjY
	8ogN8hR6CoSm7+E5VZ3Ty96oTzhCl11FoAbM1pEDjRpjD5PfpxDDYo5OmsUDjNrhPUQtF6RTrhP
	0YTd05W0Zg5H3zjPOM+ahlTisrKUVHJmOkQ==
X-Received: by 2002:a05:620a:4804:b0:8c5:1fb5:1631 with SMTP id af79cd13be357-8c52fbcf18fmr431955885a.76.1768404630191;
        Wed, 14 Jan 2026 07:30:30 -0800 (PST)
X-Received: by 2002:a05:620a:4804:b0:8c5:1fb5:1631 with SMTP id af79cd13be357-8c52fbcf18fmr431947685a.76.1768404629608;
        Wed, 14 Jan 2026 07:30:29 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:06 +0100
Subject: [PATCH 05/11] pinctrl: aw9523: Simplify locking with guard()
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-5-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4481;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y+FQmd4rABqYPyTPKLcnkK9CTadziXSgsQ+69hWhimA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aELAglkIA71S9aDHg8tY0ki5ruKpcTIipIp
 9RdX4NrwWOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2hAAKCRDBN2bmhouD
 1/igD/9PwYlGol1XFHKqtfTdSYI+oQLSjl0z2sqJC/KrK4RW/0UQiErzillTKszLs1fzun100dI
 EhV3/cNFb7EkGAiUv0DOTJm2rLXXXAEKq4sfHj2AvOo4AOdm1Vhzaxohnqhz8lbieU5tgItO8kM
 CikX6JY0DNIPuK8tFa3jeDEczOXlluE7E41BjdvQjxbKKo8CAfks/3wwtIsxd1meu0Uh7pDT24v
 aYd+vgDxKOiXkiRG+CUevINMLknU969di7fKX4meZYuzU3R9984ZwT3wKVcWI1thioeP3d0iKIZ
 BLsydRVePUf0VtejFOq22/8mIaGexs7h91zpasohVsgWexuKGuKJNsUuVOnAKfAxsGZjauTVDrL
 18hpyd0FGakefMHY330a0Z2lqwnCW9k43rDquioM3Bdk17JEYl8zl6Ke/SDgqPsWJjHmhjt99ld
 hGunGrieUUrlWbMED9RW+3E0q0mHN8hMeN8k3fFjaBxIE0ScSmF/3Ln/vbtAuQF19W3wAWGZaJY
 GtZjFlirhF09jNZdVRAU8jaxTE4Y1Xh+h4BXysH0im9u+xRCGpdGx49RemYsLFWX5SsXtSUWzJE
 4DUYUyd6Czhj6ON/2GFFww6B8ToMmkk78qjK6kFM6DwCDfpPDItQEKm0PHRqNap0/QZwJwiIuvB
 W8opp7AXG42HEmA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=BOW+bVQG c=1 sm=1 tr=0 ts=6967b697 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sJPWbbE6un6nfY-uGV8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: SkKO0zGL2evAp0G7gYpDPO7aQ6ygsZyw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyOSBTYWx0ZWRfX6ZhafepUBjns
 PIXplwjYO9vA3tIXei5wEKtwFF/LkOJDrpLR35JbnHqGk8qRDDzQLtOuwb7UDsenrUMEdMT4zcL
 9USoHa2K/345RUGiTipY77dvk5R+hLtTjoZwce21Mgupk29OyZOT7Hy4hWad/fZBiqbgjS4HBRQ
 vzNaUBH0oiKsrgz0BHChb3tztTF+Wjg9g2yXYxorMXD5fQvRiCRT2jQR1hbF7LzzzWHnkDH/VU9
 8+1vqOX09Qn+sAslXQIy8Hd+AEjY9cll2i5DA3xiL1jHrbcIZhce30OjT58YzU5z6iKZY6ZGNqu
 T/t59Ch1+xrjBvk+n1Mih0JzdNZ3T2HhFHalXY27QkLZ8wypvmRlWPU+H4Fwbe5nu1OHwY0O3z7
 ESauUIs9hTtAxBakvO8RYteyo3I5Y2B401CK2QZVO33Afar13rHsmdcZ6Qet83UoTmH10eZKZNF
 OvKNbrL4DoOESsnwr5g==
X-Proofpoint-GUID: SkKO0zGL2evAp0G7gYpDPO7aQ6ygsZyw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140129

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

