Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E592230275E
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759825; cv=none; b=HJhy1fH8ziYdM73Xx3yjW6zdB3ZEtkmVVwOqhaYL/VvLCPnBj2wBfabvPVjARk/T7s+viARUembKmUfhgQNbmPP/QEl0tfU4QvZ8vzHv7OIY5NKP1Cg8TSB6VDL7r9MLlsUhXxx/ayZEqdiZFmYSwzGqhmCiQWWQ3xlKoCe96Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759825; c=relaxed/simple;
	bh=zwqMNlVzyh5eJuxel4QxILb1w1jSHcI3ic8DyOkYYFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l+wG6M9/ZEJZwpnx7J7tPg1Nt1riizWIZGXC9E9VVBLiex/D8DkINB6iCTDW2rHykZciE8K3q92/YES5M3Unf7DzHXdDsOK5Ci8j9el/8EGU3UbBKaqYtHF1etYIomD423QxEWw/yQKtdbCChb5PR7su3bnlenXF/POeDcWUEqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgxM7ktr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AyAuZ+0V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgxM7ktr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AyAuZ+0V"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ICOR7F3135119
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bq3v2rgJLKiDEOsLmXv7bz0bBd5gBl7Lr8FAESkXElU=; b=pgxM7ktrM3C6JNHs
	m+dptkkX0Qv+/1wvRYYLqNk06hFxp42qnRNeX85OydKUK3DfNxmAU/+bhQnSiBE9
	5jFqrFFliVJbtloeqx2ulbLwmsj6LGPdxK8mJ+AOtKFLJ7/FTvUM3lulmSMjMd7z
	jWAXVmGvZ0nJaOhf9+EEzpdpwW0K7ncgLn6+kabCTPUEQ0HRjC4remHm5WAf3orp
	HTpFcUGejLERS01PkijD3DH0btzRlLQ3/O0KkA2D5XV3RZav6SLqyQ/JX39LEy2v
	IApUg/r+kFOm+p4BLIsQHdC+oVN2T7Q62++87p+3q1J62nfSHmj2FUGeDuinLNoy
	mEignw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2guju2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb9f029f31so1124131085a.2
        for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 10:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759820; x=1769364620; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bq3v2rgJLKiDEOsLmXv7bz0bBd5gBl7Lr8FAESkXElU=;
        b=AyAuZ+0VpyDePf22X6zZM15iFUGAecY6cqqlATFegkBXb2FV5mIC5kSvwwTU9xT0rW
         1jJ2lAtPHNnjVXejNw8+1PlHIKE6theAIvrA3Mqwp3AsInt5NPjgKbFQecwAHd9gqdDr
         +zYUUrCTglwfZJdjifRw/X5TDz2kTQ5XzMHXnHrjQRaU2zWvuAWNNe6upJg+dslfkgYS
         RunTaiGyp60ByTnDPOObBeSjqGjYw/lC8QKHSLpdYV0iCkfMx2vpXdTzNCIYyOcvUuMb
         1iwrgkFVzHXj0Ab7RutuWyH6hbStUDGo53FeXVrlQA/QwbNfxsuWkmuxR/6mcRoEB7Sk
         G2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759820; x=1769364620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bq3v2rgJLKiDEOsLmXv7bz0bBd5gBl7Lr8FAESkXElU=;
        b=nCFVv+B2+HvU7nUhXxlAsc0gnH00q3+w2kPGBDJ3dd8G6JWZwC1TJaCVDjcMwBZ7zI
         i+Jr5tSizvRpkJbGvpu5v5x/Ry5KnHl9tJRgxsPbbil9DZq1MoFpjW7HNuRwVcGj4FQk
         qRmaxKIcGksxFMUAS4eDiOvtJCHZSbSsk3sewfDgaRgAohmk6fPbTe6PXtJNV56CXBXD
         PHOvQfXEzDHdABRlyTqqKBwn6cXGEhEBBM9PDXkjja5QTaKu9n2/k3XHUriQT5U2ylbf
         WlyOamK+tZY6g0M6mMcQGb7tTlxvqeHDPhFSkDw36KklKtB7Dg8w0yJA0uAN49tlH36j
         xppA==
X-Forwarded-Encrypted: i=1; AJvYcCW0h0F+sZjnV9b7F/sZtK28AxgjFBUI4fVuqIakA/nuNBusSICG75ub1I3F5XUxnbcGzsSQn5k=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywqit+PWUhFWsbF2YRuoZ3SEnfFB9sftrhNoyWCPaRLtq0OnRDx
	hlIcCUPJzGL3hUkI6bxkw9PWfLbj0fijRNJghOBLEZVA0KWHwc4thcA1WEhKDb3JWatwOBCTTzs
	MUMPQmXXfQ5neN3diI+igFLARdf6UNRRzKXr3pSehroMogVI7VrnhJnRyfdE=
X-Gm-Gg: AY/fxX6DaatBik3aeooc3SUnfH56YfhEJSBP9WIe9yiYXjyqyFKLgKCgyDO7N1Z3cLn
	g+50+GpXsuEyffft5mfDb3jZJdZEhg6zQWbroxBvIdJgsupB1j8ovb6xezoUyYozh/4SahrMVT8
	GwYctZVl+Sdj/7vQOidfdyPN15SJEAVvXmzc9shEdRzLVqD3ES8nsYl7tCUm4/6uEfmpzZEYxGT
	qXhIG8WsDeWV9EdH+YncjWIvYWbsUvibt0ggkI6R44MVMegL1v9lPvW2Sho277f7//rDU6udJy4
	S3JvuGAWq1Y48V0C9Jmz+8JKUbJt5G1wLdKiRZvvAcPcrmB6UpC5paVM5ZJp0Zh6hkhSEO71t8z
	fVyx1H6qMYsbGw90YUvUn9ZjtdnBiD1gFQw==
X-Received: by 2002:a05:620a:404d:b0:892:ca0f:fc21 with SMTP id af79cd13be357-8c6a671c788mr1272748085a.40.1768759820200;
        Sun, 18 Jan 2026 10:10:20 -0800 (PST)
X-Received: by 2002:a05:620a:404d:b0:892:ca0f:fc21 with SMTP id af79cd13be357-8c6a671c788mr1272743485a.40.1768759819810;
        Sun, 18 Jan 2026 10:10:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:31 +0100
Subject: [PATCH v2 08/11] pinctrl: tegra-xusb: Return void in padctl
 enable/disable functions
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-8-bd36f681bdc0@oss.qualcomm.com>
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
        Thierry Reding <treding@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1984;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zwqMNlVzyh5eJuxel4QxILb1w1jSHcI3ic8DyOkYYFI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSH023tp+pR8RcdVkgtrXrXPyyvJCiTJRQMKg
 Lvm/TsQPiKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h9AAKCRDBN2bmhouD
 1wwNEACGkGa4R5iPxfciaNNGa26cpFVFOKNoQQ/zlFKjd9KdLdP3tK0fWadkQ6Hzg8vIuOQ0s/N
 v7S9aLNuDw74JQ3Y+27cgzgg2n/5allaBhi7p504JFNtRp9VuczJS9/aQzkHBhMBYb4qHa0hbMF
 5B40sNT0sLeOazx6g5oH7IJuwLknyQHZ5fbOnNm3S+Rhbjt4X0zszXGk6S5rQ6TaJx8wStEz2hJ
 +lC51VjrnH7jRwQZzX+zzilyHJ/l+HI120tg6qO3suf4O0SY/DtDfqx147BUPRdV/wmxLJ57ggf
 0TgH/14e1z7TwcuN6zs0miiAII0m2HYe/etu+gBd8fiBtv+uEcW1fdvtFo6xpRvM0cB+ToJ3epW
 J+WAhktebIvSeAt0KWbj0CP31V40a5j9h7uHmWaU7Hev8XkKhQb4BD1OrE9+7qS2Y9ZWqEa/b5O
 IHPpVLfe7pkjnOiOiy8BEgRkXThCYu6o3CyTClOaQRKzaR+YtzAPb+KL5GNuyB0Sj6wmRyqlRj0
 1cOaOus9EEY6i/l6k7smRdmdWfEuQRoG9OOvnXlrwxjA+kZXKGddz4ythESHN77jK5FCbFlL9gl
 yc4UG9zGjHjhRMHycAqi6bFpO7IHu1HO61URwtcZ3WxZe89GryobQ4tMqNi6WqrOhlLfDy6NcCX
 iSdKZI6W2hyvuow==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX7wICbZ/1XWRM
 GPctNso+MR4r2VWe+pGZNkBtVpu7Ajozht6eA3L1rWgeOsXwjDzw3cRHNIYgqn6oI3TvpGRGhmb
 1AsZzc5Acx1Lvhl1SRdXkiGu63ywUGn/5aolMsfBzS/ka3rvs9ep01VSj8My1v6f/vz+9Vf2ztw
 uEQsp+aN7Kh+dwwfNo1/ZDZKLCJPP641Pck86HvEQ1KQgUbDq4RBu8nyG5kLyuLt0POrf/sFD0m
 rzHqsrBp8md7fXUh7P8YZP+ggSXyhmdne1J5LUhvIsU49+a7Y7bFwghViIPUNGE03wdICPk3+pX
 RjKuHfoYGIf02ge0KB/L4fgorjlGpALMRClN8jL8EOv6vgmllwyenbvYPGkhno24JuRkOuqnVBV
 Fian0Pdp2Eev4q2AUbxv0pkOlq8y6AF1BrVdOxSMkuco9lhSHoRY/MaTw2FBziX4pE6S/kUEZcl
 DkV4irEWMqEy5ctErNA==
X-Authority-Analysis: v=2.4 cv=Sev6t/Ru c=1 sm=1 tr=0 ts=696d220c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8
 a=Ed5BEzkqmhObfCaRRI0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 2a3USxO6mdZ5vVIN6rg1w1IOaouRiHtz
X-Proofpoint-ORIG-GUID: 2a3USxO6mdZ5vVIN6rg1w1IOaouRiHtz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601180159

Make the padctl functions a bit simpler by returning void instead of
always '0'.  The callers - phy init/exit - still need to return 0, but
these are smaller function without if/branching.

Acked-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index 49c5edeba87f..34a373f7e04d 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -474,7 +474,7 @@ static const struct pinconf_ops tegra_xusb_padctl_pinconf_ops = {
 #endif
 };
 
-static int tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
+static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
@@ -501,10 +501,9 @@ static int tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 
 out:
 	mutex_unlock(&padctl->lock);
-	return 0;
 }
 
-static int tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
+static void tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
@@ -534,21 +533,24 @@ static int tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 
 out:
 	mutex_unlock(&padctl->lock);
-	return 0;
 }
 
 static int tegra_xusb_phy_init(struct phy *phy)
 {
 	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
 
-	return tegra_xusb_padctl_enable(padctl);
+	tegra_xusb_padctl_enable(padctl);
+
+	return 0;
 }
 
 static int tegra_xusb_phy_exit(struct phy *phy)
 {
 	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
 
-	return tegra_xusb_padctl_disable(padctl);
+	tegra_xusb_padctl_disable(padctl);
+
+	return 0;
 }
 
 static int pcie_phy_power_on(struct phy *phy)

-- 
2.51.0

