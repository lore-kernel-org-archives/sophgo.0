Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6F93A1A4A
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404646; cv=none; b=LFmM7ERpliEFPWgT+nTf8ax3C4PwEuYofk5Oi6tNysw7mG/OcbhFexPY8ll79XtiALmwe/MENu1GYWARxfVjneo9fsMAqBXSBnieHVLeiXyMQmzJekE+1y9WSh/rOsAmH0BAGX8gdIGx1pMlKA6WZF7u6kp9n/hz1Fu6kwttbzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404646; c=relaxed/simple;
	bh=SjKuvqUidPJ5fm3b34nm9zaMItl1NLBQXfR5LWGDZIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oTIjSfFM/4W8LTHnJTTuwEsxJh3USMxSzVG3lLnhXcxWS61FXB4O7mEZpyjsj2FTFoGMa0qf/GOai/HjppfLRjbPajI8Ajn10dZxzDSacHscq9+6zvR6yji1RC/xolksmmBVsrfFxQhphVaPPfIQAQrkgyvxvZBlUtP+Ih2IDAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CymxLC2N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DoNDt1Io; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CymxLC2N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DoNDt1Io"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EB31SA3279778
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YA3VmuPxJ2L3DtrIn8wKabMcttC/MOL2mTB3zxLU6Gg=; b=CymxLC2Nh+Yhitd8
	i2VCkipA2Jvgf58dNARhSsT8C3NBVFuhB0in5/s3k2byqbKN2anrEGds2yvZ0cT3
	HsKWrN1azY5/EbZtPj1RgkYGi7uNgFYsmUNZvbzqrQF1UBcNuIOhSJoSKpPFum/u
	QjvnNThfwoYjH1wOtZj1emLDqD3KisvQGrK3TjABDHrH8oCkwD7M3Cq2ycUIUVLo
	EyImefGOULzlqVV38fX0afy7dTmZn9JKe32HxRjrZxhMeDK6l9+WPDORB5pf1SjK
	8mf1eqt4rMwywhewmr9BDmuYFEvSD8GHa8Z4iL0KPBcfA91OEd6GMxp5lCqwlV7t
	kPXvzw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x8rvdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52dcf85b2so461876185a.0
        for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 07:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404643; x=1769009443; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YA3VmuPxJ2L3DtrIn8wKabMcttC/MOL2mTB3zxLU6Gg=;
        b=DoNDt1Io/LrS9SPu6l3jSVShZo4xXbGvuVRZmI1RWSalBN6a4psNlQQK7yDgnTKIgf
         HK47a+d2UqToE2DPvXrUifyCvI3q9LNIN6nl7vVK2S/dPZuW2FI+X4eVLVOHf+X+pKrW
         Tu65WYB+dXot7BscRqyeIhPk3jhEqJbrvK8/ZgVAYMSXDYMmRHI0D8F5tDkfCeoxrcx4
         Ge6flYXD9pxPAgGNMf+f/Hy1tzUzNDbn+yTbgH+JSUubizVN2HYLtKDNZXgYW6m7aCM3
         L64ILvQkGtsN9s1DxtmGV+bjVvGfKbQWDqRBaXkHPjgOHUJIVrCR+gmVhBpAfYMsPl8D
         u/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404643; x=1769009443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YA3VmuPxJ2L3DtrIn8wKabMcttC/MOL2mTB3zxLU6Gg=;
        b=CMMf2385F5wI9fnEVZyL1yu7xB3XVyrmN3lNOoHRCRM2S45wpBOyGuj6kfsMJ6kACL
         mubO+pBWRSLjBG2CEWVlH3/vN5zOxeA5YtsDO4zjjpz2FqtrC+0r4kvCYjXKFCKQbGJV
         Ild8OEjKq+KXz7OkGfJ4Z4gWv3SvMXoyhBPaE9dv0AHGX1im1qOLN5dMyrD3pPE3vv5z
         uuc4O3lKDF0tZwnNSz2ZvY4I6RVktg3jXezZHxyjJWdweciiosgI1ShqXj+OIEW/l5OS
         TkkW8Hz8HL2HeoP2tvgKNMM+RtM6jtd07NkKKgL9E8L5FdsS2TrHmUy3Ts9TsMdjG23/
         bPhA==
X-Forwarded-Encrypted: i=1; AJvYcCXV67tt9q0UBqVC+KZ8N2NUWNlQVNZNvJRPlffJndWdgMyWJgvP7hoknBpVOapvzABGOS/Inzw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWE+PCouzmqJSVcnpOFDTr1H/BiRXtczdzv+20s6Ud5Z3/uuUV
	pS3w6CZmZ0IoNgfeDNa1/dbgjLR2eAFBXdb2CHuMdm06w1l+5W+KKeqNLk+171PxKbF6P6aSvg0
	U4z/7+SwnG0LjshkOKlOKotxDshqgnk9RafisuzTTw9P//FEzZI66NHnbzEc=
X-Gm-Gg: AY/fxX69eHDJuDV8mu16rryxk5v1gXKfZbIwPnYos7wUlAutgSlccdhej7Kur8cFrLe
	3aujrHXH40jAA/EU2oav5do1Oft4JlAAisVzTuKGco9073SyE9UU0fzZcmpH8ZsaHrzLacXL9Dq
	AeI8trCbxJcc+kr2WsMhPD5O5QMShKZDzIqdXZdOFUNwlUzLKyyNaUanjgKOqkYLJengPh8x/dV
	qYSl4I2lm5ccAwsTAEs2Jm45gezPgnXvNRAqvtnLLkf7T2utZU2nx0sCPffri8MFR4A2GKgbElD
	3d3cePZlMFZqU6NLe+WC02IaYKv+jTSo0tLeO1A2Rs4wDuAeEYWXNYvzt/5mNelMSNZJ5wOafEz
	1i2CbwxcgkHCmOkzIn61MEtjOpJtfcnqQNA==
X-Received: by 2002:a05:620a:489:b0:8c5:305e:e9f1 with SMTP id af79cd13be357-8c5305eed0fmr269948885a.35.1768404642840;
        Wed, 14 Jan 2026 07:30:42 -0800 (PST)
X-Received: by 2002:a05:620a:489:b0:8c5:305e:e9f1 with SMTP id af79cd13be357-8c5305eed0fmr269941485a.35.1768404641970;
        Wed, 14 Jan 2026 07:30:41 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:12 +0100
Subject: [PATCH 11/11] pinctrl: st: Annotate st_pinconf_dbg_show() as
 holding mutex
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-11-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SjKuvqUidPJ5fm3b34nm9zaMItl1NLBQXfR5LWGDZIg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aJM3IeY1gDdJ/me5IBtT+aPwzcq14pNkWtM
 OPOQAst1h+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2iQAKCRDBN2bmhouD
 157+D/46tj+ZWnUE7RsMD2CztKOGVGuOYzCPiW602Pq4QhElA9PrVOh9VIyCLBB4SAqk59lZVYO
 MlOwyygoSEozBQN91oQ75iEXnJ2aFkB8b20ULI/EMUFnyX6NdIMSpVnIDtcXgX1RxtvmdcYlupv
 d08RjFjuwR7LM07n725h6qKS9ZYbGJXlWsH7hlmPWz9uaBnMvZzlvEiGRcxJvRoIWynscL9CB/e
 eFLs1++3wid48u19QEMpcRMV1MeZTv9QEZFnOFzKRAoK1CYtDEfXVYfNebfDK7IZVx8Zqe5vmF1
 thvHVTfdbWtXtejVJI80z4+iO3us+I+e5+NIqhB1sFl/hejmicbZHh7MTevMq6l7Dx61o72dT3b
 BhdNFYKwza+3RNldEDuAhvQRBjg2Osn6flZIO1CR3aOlo144cLI4IOzTKuAabhDB5TNFikqrvrL
 0xDWRzt5IGOfkrJc8g9H+D5W9i+gkNFuirIpoXQ5tVjSuxdX3YHfj3OMC8Y6n7eAVVx6cqYfgR6
 nkcpzSTEOenPtMlHZzvr6whjmpwnN8lLQtvA85ZpjgGBavOqUfo3Q+2StXsTFS59+ZZMsU481OL
 hkwcnNi21sXwyD/y/MMq0KvbGR+S3+SbDRux5b96048SW88pN3twiCfZ3TKPRiPTnwc8noN8qv/
 lE5bKl/wMPXzUNw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: VCHuym5Epg5jJJ65f8vRK5NZ3XYp-WdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfX/IhyUpabddAj
 lJKiJ9xHPqaovRGllI/jQzCzReYQkF3qLJGJ2dI95n8eVnpVuWI2Tw+tYAiiJITukwFWwTSiaYO
 /KjHtmi7bxSZ2fgI7QxAnDyrfDun8mAl8Pp2nra0bW8Zd+si/Odcv/4md+8htfzp9E09WtQCxCX
 6PbbYnLeHbD2Mvxx+2p9hiBKFeq6C2lr1tJfG1JMgD5ySMrRV3+ikeYIw2myqDGZvy/p3DLBYuE
 oKC08Agv7W3TahKrUEFtLowGHrLFXUmKVZqu3l0QYMXCwQVZeUIDGNqyhL3Vp9+l0oOBvS2kzny
 b83642HCBxZAY6uqaHncmWB1DwXnrFafVTcg4ABUDBXFJoZDfD/qBEjjxI+vqRhSkm2X0h3+NWL
 MXXdo3+HyhckHIh7mcPDsy2Q+pNl6S9vjMFbePd29PLB7A+0zclFv8HKGB+L/ULnnVFrqHzY9G5
 hv2o05eoGPPMj/9M++A==
X-Authority-Analysis: v=2.4 cv=HY4ZjyE8 c=1 sm=1 tr=0 ts=6967b6a3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RIxbnQC35JVfspY8PfAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: VCHuym5Epg5jJJ65f8vRK5NZ3XYp-WdZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140130

st_pinconf_dbg_show() unlocks and locks the pinctrl_dev mutex, so it
must be called by the pinctrl core with the mutex hold.  Annotate the
function with sparse __must_hold, so any changes in pinctrl locking will
be statically detected.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I think this is still useful, although maybe a bit pointless if core
explicitly always locks every pin_config_dbg_show() call? Anyway,
pattern of unlock+lock feels to me like something worth annotating.

I left the patch at the end of the set so it can be nicely discarded.
---
 drivers/pinctrl/pinctrl-st.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index d3cea3437d7f..8ce88e591f47 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -987,6 +987,7 @@ static int st_pinconf_get(struct pinctrl_dev *pctldev,
 
 static void st_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 				   struct seq_file *s, unsigned pin_id)
+	__must_hold(&pctldev->mutex)
 {
 	struct st_pio_control *pc;
 	unsigned long config;

-- 
2.51.0

