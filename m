Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE183EFD12
	for <sophgo@lists.linux.dev>; Fri,  6 Mar 2026 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812053; cv=none; b=WA8VJHtjwWHmwV5baJMVEPErVK6X4MzFVHNMhbJ07cuy8UjPkqrO5YRAB1I1GfTTyRIUNVpoavYs7OlDaUhDpZ6Emcg+nnJefW+xdhBnjSDThJ0LTYnZRK4lh3UL5FKeooKXbPRUoirElOaAPSh5Bag/PAJU6x0svcqRN4BjsgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812053; c=relaxed/simple;
	bh=MJO0KbZvnHEzc2bbeB0JHSyxyZrgjCnwMBp9LPnkU84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0JCKRXaHaENj9/daKMGWJTQnXHWaoM4oe8FNPVHgnx7a8HwEugZttxeoztNhA+DdH4M8jPJJRcgVom++JV0DXllqlI/iXv7oY0jO9cRKDluLO/Gv9h8js30lhN2994sZYfwRFzRyPt0KwnG0ODJCi0CgtuUCqofJveIUgj9HzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcDqzWER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJcCZLJF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcDqzWER";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJcCZLJF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FTCFd1953925
	for <sophgo@lists.linux.dev>; Fri, 6 Mar 2026 15:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/t0LAapdaxFDy802rA0EzwSzk/87/UWs/UoU9fhqHw=; b=hcDqzWERh1YwUlSX
	0mLHqLb0FBgNbAXJzPPEEEsVRDvMJRoeS3eKlpjKMjt0R9278gFh0jv84RrI+NwW
	SkGonXiI6BZTbT4a8NQffujPwc50phY+tos5pI1aDCv2bXiRpZ54+Q5MR8hNyl1P
	8bO4fo08icbC8OV4s1n0KdjTGfp3OhZrBCk89P66q9aehmev514RekhETO0QAgbg
	roqrTRRoJdDHbYO/zzXM3xFgftaHtm7kEE9DzQqQk3bdkKB0mNd2juPZzEoAQbuf
	bC+hErkC3/3+3fSP9nkMFwIIyrKpzKI9SZSbdXhc2X83/8dfNMSFZXULkUTAfX92
	47pzgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ah6dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Fri, 06 Mar 2026 15:47:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4e37a796so5188433785a.2
        for <sophgo@lists.linux.dev>; Fri, 06 Mar 2026 07:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812049; x=1773416849; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/t0LAapdaxFDy802rA0EzwSzk/87/UWs/UoU9fhqHw=;
        b=OJcCZLJFcgWyA+yLB1auu82iEau8o3PhRk1Tu5jS5Qo4SvjKmJrLajg9nglr3PLqbW
         51mHmeN0T5jmyuns+tZwPU51HhKBEIt+C7jgOwnF8a+8uMUSjKtWcM/xt2o0ozn5hVKw
         RM6IreYEn1ex0BhQ7y6F21LHuUh26MkAVd7U+ybzIBI0pAHr4pElRmo+99tx8L3i3tKI
         x1gDgOTe9bMHAVPvlHJcozGUCwbEK0elt/9EONFuwPC9H0wEmUSSW+ac2w7b02ByeodU
         u2lsr8HNvrlLU17VQ0wBQJcuQDeRZsSKNh9X9IT6lseXdPq2UvxiU7egHWP5by2VJmHL
         Jq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812049; x=1773416849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y/t0LAapdaxFDy802rA0EzwSzk/87/UWs/UoU9fhqHw=;
        b=bqTP+sl9nMQhfY/PiHQ3ifgYhv/6q6aus9wuTd4femj5Oaghkw/jRumZwCARDAJQV8
         OV8KTOOWz29p2KZFWu1Inpxgb0WNd8VXd7cv8vNiOuKt9cSCUxvNoV2eQ4SieemdlbsV
         hFNpMId7PbdGqFE8QEJGGlQlFnVwTZA1OjHDKfmpNTcsHdXXV8JU73N9OjeH6RxwIemk
         dwADOAV93irZIUIId9fg2/vApLoTP3+goHLqmamGvg1YC1hvifUVGWSpZRnxnoIPuZ4D
         BUjqzQsO4N/bqC9TaRMOivPX7FEMTT1T5Ifjxw5pJXvCSZexla2Bkp7QsLysvyWqoA0h
         xAqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT01rXeK5HK/o5NAloo9h6QnfH97bQ8rsfJiO0tO/4D+DKa5sHsWScSeXJV4INeatYNqOg5N0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx039StrCBHcZ7ZrXnaniseCrcI5LaOQoMFFzO1idMXXnEvGwre
	Mj28AET2qYaywiZC5pL/qooYTym+V/D2ygk9mD/eFCyjI7vZ8SRQLywzjY13jJVUS5o4jF9W3iN
	RpmvqIQ6nRJlGD2wxc3wTpqDNPvr8sKtQmh9TsawRAyFqv9De80BHGp3Up70=
X-Gm-Gg: ATEYQzyikB5Vf28euKsYBqrCpa5UR2vWa2PkcME27hDMK7UBXT+xB34gp4ZfdasW+7f
	Mk3vICTcmObU4cKHDF9pS4Oh6WRo3ArNdfQb7ZB7qXmRqrGPfjqqzpn8McZ6zASXJdXFjx20zci
	uoXUFtNt/Lhl9lMoKLlOtTEHrQcDd8DkwDNaWG4XQK59L9qY3ulFgMNa1zrpmWxrR43Bql3jpAa
	Ubr8nkjJugtQ9q21D+E3QkgWNFFkjooOv0UBondE2G3Ab/C/m8N2EgFckiHqaZ+JHJbM+zuZuPK
	NnjXmtSDRKR1O2sb88FfAF9GjN+zXBHnZ+qFSbH0vFK/uJfVgyLX2Jit3SANRruNxk3kE971Sz0
	TPCgKTaGZyqXUPT4g6OddSyo0pTZFDiEsz1LYfXG3E8nYBGWRH9tp
X-Received: by 2002:a05:620a:4589:b0:8cb:4ad6:6aa0 with SMTP id af79cd13be357-8cd6d514b2dmr337844285a.68.1772812049332;
        Fri, 06 Mar 2026 07:47:29 -0800 (PST)
X-Received: by 2002:a05:620a:4589:b0:8cb:4ad6:6aa0 with SMTP id af79cd13be357-8cd6d514b2dmr337832385a.68.1772812048763;
        Fri, 06 Mar 2026 07:47:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm5122767f8f.26.2026.03.06.07.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:47:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:46:44 +0100
Subject: [PATCH net-next v7 6/7] net: stmmac: qcom-ethqos: define a
 callback for setting the serdes speed
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-qcom-sa8255p-emac-v7-6-d6a3013094b7@oss.qualcomm.com>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
In-Reply-To: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Bz6/Hr6N/rEPerZKq1+bTvk1x+ewErg9P0amGNZT72Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqvbwFVICzo2tr1z/2IvJF2RamjaFEbJ3iPkje
 6PT7sJJVXOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaar28AAKCRAFnS7L/zaE
 w+txD/9F2WX4OEqjZx/mkaQtwCJT4URVHThB5tZh3U96w9/QhL0ahuE54CXTnRio9xqzuW3TOz/
 DB5lVS7sPFVkaZyTgnT4UcCQMbeD2iDkSF/03/ldFyWCMSbZW++hxfJTsuF+sl5S1eSfz3rdfjR
 7PLeDU599Hf7K05uypwdjdMknTkGJIxKcYFyIJBH612vq8bD369ugOwR4c7Jv5ZtFbyBohzNAlK
 3oVTiJL1X85OykK67R5QreXZ2PgAm1UFP7lO29HttbssnGmHeOCIo2oESCahiQf1juZaHaz56fr
 xVz7Nz2a2lDElolZZR94K3sPRtNhN/8fPbpaVqZbSkgncrxQkl1Jtkmx93k1kAsyVeYFIGTrvZU
 7hdo1O7lYOlziI1POq6TsG4Na7irnbcnQSS9E3nK/dwPAlPkJIj87UIkkINTZou48tczQHIlulM
 KkgMje1xw06xe3zzl81sRKeKTmYQcrRgf9CPA6vUS7yliVZ84k6xaOrCMoTljmo3uw5wQn9SxA4
 ZZSHoV84qrni0piZgFEPrnBfQyiGf89U+7Xue/83jlkVgiU2jBrfb+aKtrhXql2V1JdK6mtztb6
 Zx9NpawD0TXPpx1ym3Vsre2lCLAZ+oI+78jFhKtA8J45ESShZbFG0RCvrrJ/6I9dYYCszuMYNNm
 Tn7kOYWiciMO1PA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: w05ZhH4ft1iNoNRndedp1jaUT4bIBZM_
X-Proofpoint-ORIG-GUID: w05ZhH4ft1iNoNRndedp1jaUT4bIBZM_
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69aaf712 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=0aI5G4bYpHrJQa0XwroA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfXxoGrnAfJqp6l
 Q3yl2MQ3+V9ggqykTgv0Y8mfD/qWBlc0/PlisFdj6f5U2HyY3NT37t8/uJ0o27HjlQTtnoWZvjr
 rznSw86xDTJeSr7QhZUo2nz3wruqhHblUZGv7khuEeS/GjW9eMTSBiY0SHdFIN4fsYBk8UAxMsm
 c/NDbWUcAyfDgJ4At+6HjF3gDyF+Uxaqykf6bebZcTeBQwNT8mBjw6QdVDx3YiFBtXPfI4OT4Xi
 uIEN0UnELZengszgzR9/meejkAX7nRs0kHatOGIZcdBwjkPnLdp8R8idsKP+YVsORNTk48BiuOj
 erCaBicGCfLvy2dan+C01lfaV4D3CxoWAngGVdGv+a8r3GaQTPI0vcKmcaIxEg0sexpPP5foCTj
 asGIJu0b/t4Q2BgU/hSgZjl+YTVHj2g2IpJ4uqgL2RfAQxlwFsMWTZAZAM94JzdE2gEDyR0QD2A
 41NdfnaYi/wflw+9Idg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ahead of adding support for firmware driven power management, let's
allow different ways of setting the PHY speed. To that end create a
callback with a single implementation for now, that will be extended
later.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index b88de56d372c370aaf4929d05138f3744c54b1f1..038ca4da3cff4eaac1d1255573f32e0c87701e78 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -119,6 +119,7 @@ struct qcom_ethqos {
 	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 	int serdes_speed;
+	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -616,11 +617,16 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
+{
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
+		ethqos->set_serdes_speed(ethqos);
 	}
 }
 
@@ -843,6 +849,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
+	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.47.3

