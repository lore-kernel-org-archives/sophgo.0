Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB51548571
	for <sophgo@lists.linux.dev>; Tue,  8 Sep 2026 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879526; cv=none; b=eBNg/8SNTzQV1Qwos5HPLXTuBh986jYEWeHo4a2sG+XKB/WsiMNiyQZlL/j4005VjsOnDAeSP8lMzdBo6+9NqAbmMsJB+guBpLis25errrXEFK40wdeSl6n9wbmThHCfdB3PF3/lFsFC+4ENuCjUuezOMDpY46bKldMkHUKggYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879526; c=relaxed/simple;
	bh=t8otp0UprQhPEc27ImF7K2VwOwzg/wYCq64pw1qmrCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmNxg8MI/mUSuK5OKBEANElUTlk5KCSfGcwPTt/t/Y99xYF/YBBuMg6qF7sTB048Qaqx4tWKPSD77pH22KuPr1c/eKwjUucdcx7atIlDEqHmIdVgM2Il03Qx99Iy5QK79m1I365o3QRTsBK9frLHAUMDl5pUEIJC/VL3v0DEGSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4z/o2yJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ll1VCVZ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4z/o2yJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ll1VCVZ3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EjBkO3835560
	for <sophgo@lists.linux.dev>; Tue, 8 Sep 2026 14:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37soDkv7vOtc95esEyY4ccUtIDMgJqrjFnjzotH9yLs=; b=H4z/o2yJC8UxZGCR
	xFEzscQSudfM9SE2UJKDj33hKZAhPS4KJN5C7jSDj0KE2WH9bTteqK1WehXS555c
	NV5XBETqwu0m9nxq7N9I/i4w+6XBrFHHVv1zb4aSmgT9+VdhVg371doikM1t9ekE
	gJQRLT9SCDJnIAEaTaIpbbqL0g91IXLFJuqpERHD90LTo8c/ATGEedbgWYCkAqpz
	sag4MwP9RCWlT75VK4ztVYFsEKEKACz6+8wTfVjq9ZIzCAFKfPcZRV706mvaHUIb
	TfbweBveylWP1sVjsRKPXB/4eDrAVscj1upzAlq7YDP6M4TDtyD8UC9glf4E2pvb
	CSwhRA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjfp49ccn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Tue, 08 Sep 2026 14:58:23 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e9e1dd7fbso3474952241.0
        for <sophgo@lists.linux.dev>; Tue, 08 Sep 2026 07:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879503; x=1789484303; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37soDkv7vOtc95esEyY4ccUtIDMgJqrjFnjzotH9yLs=;
        b=Ll1VCVZ3wXhSUjXQRGeQt2pRGUA8U4ZVpx29X+ht3RNhI8FWzRV7iJBo2HOAYmNCUv
         l/3w4fRSX9DC9YXWyAq2pTRch2Xbg1DR77Tm19BsXYtoPYA7mUR0NUJeCo5XgxQ+AymT
         JX6Q1p/wVV+J21m8SKazpkhFL3Qzmt2ZqhPoGwVxqNRZtWBY9fAbltTvwiZaH+yKOrzU
         HleZHxkhJna5a01i//TPUrJsRxicIkvheZCJWLReUmEBGnyPbixtIRQDrUx5g6FjO4My
         NgbvNkSSNea8Mt11bIk0HZqKjKeLJxxlhZ/s2m+vGeBg9CwisINvypLJFPU9pmmY75+6
         bk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879503; x=1789484303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37soDkv7vOtc95esEyY4ccUtIDMgJqrjFnjzotH9yLs=;
        b=KntKaA+WpZVRl/QdMVXGWyIvNLYB6e/W+qe1MSXiK6DDqiSQiMgjUKWH4SzNLpImr4
         DAh9a36WZnVd537+FLF+QGAecrWpRz8OtEhE0h4xNL2i3PyeEBZl2Ahq/KZUBgUHdjWK
         1I5qFxMS3Ige+4jDeBpdB28m6z9hYdwQV0are+fNnhffTuzTxfFUyP3u3NvUS1FpSIVA
         rbO6aozfbQ70kVEDTtqDhVxln/RXo7dQvisHXLcyTBZN4nljjapoaXdRnmhS7egXlZxl
         mfqhAdUZEeuXpEmRCNsCurbVuv5E/R+SdOoA/36WwxSMLj76doq3R4iFH4jzCZ92KNzy
         FVoA==
X-Forwarded-Encrypted: i=1; AKwUvBz4iwADrrfIPxWGLlgkQHtGrO0AlFhgajkurRjotbaYc1dZhz2H0N9M0MvjyoAmNS/tshKm/8Y=@lists.linux.dev
X-Gm-Message-State: AFuF++kc/h39Sk4mqCj/6EoQLlFFv+ZMgNLjCBX/FB2ujDdkRGpe/dKl
	dgrRRKWI8Hn+woflb9dlk87zGeAer/bq71M35lPKY4GoCyQ0uZdob49OMD7Dlq4HmppIS9LJsKA
	kVEQQ+MwCCzEZfT0TupEK3cXYfdXBdyKhESGZT8qk+vGZn0DzwUwH6+n9PXg=
X-Gm-Gg: AYBFou12ugei9wvriU8YS0RX8sxnXdDEzyzZGxs5snpHA+6ElIuxacc0AmJ3sNWAeQ/
	dqmUJlMUBOxTyWlEQCT+CWqMr/Zd5KEoexW/0crYPfy0WIW2AEhaTT6fq3Q3X9erRqTFhTOo8oX
	NY3SA324GaN8Hvy9wqRsBtdJraxQI9ur+ygNU92DIAczSHapqNIaXrGC8UuhukUq6YoTgHt1Rer
	yh8dZnhHdtR5dLIJXh9SNzdFSKMBFkxOsAgKKpNqRPcZZwPyQ2vqKJAryhj0oT6T9Cz4+DQ8HwS
	5F6es4gBIXisq45K4huN+zeTE973MsQJ0s/CasN+Oz7SwzwP5gyZZCb8+8rkDJxziTZBvgEthWG
	ipjlJ3l5KhNpiHifBhBisXhfd2oMG
X-Received: by 2002:a05:6102:f8a:b0:786:c86c:8fe4 with SMTP id ada2fe7eead31-78a4ab73095mr13389867137.13.1788879502543;
        Tue, 08 Sep 2026 07:58:22 -0700 (PDT)
X-Received: by 2002:a05:6102:f8a:b0:786:c86c:8fe4 with SMTP id ada2fe7eead31-78a4ab73095mr13389825137.13.1788879502058;
        Tue, 08 Sep 2026 07:58:22 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:58:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 16:57:27 +0200
Subject: [PATCH net-next v14 08/10] net: stmmac: qcom-ethqos: reuse the
 address of ethqos_emac_driver_data
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-qcom-sa8255p-emac-v14-8-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5580;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=t8otp0UprQhPEc27ImF7K2VwOwzg/wYCq64pw1qmrCM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJuBKnVHFtZhqYV5cvtIg87432RnUOnGpPR4
 KNi1esqCMiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAibgAKCRAFnS7L/zaE
 w+RKD/9nKk4RbOiPwu72iSEC6P5rVRbk4NCQNHhGDOO/pS3t52XnDZN53QDIv1Te628qJngsc57
 8PqQrDbGBZ3drp18j/Wf4d4bPE/VOmL9/7pTMWUFPo4eCSdN+E/VaVdFYNFaC5j5aKR60wufH5H
 poMkZterOA+riDCRpuGSE7SUnuk+leapL6jTXZyGky7LJwXjf9RrKoxeDvIEc2AdaQpSTb3TkT2
 zfdBXskiwa0IFdoZ/lhafp/RkG3Ivoj/SiQ6VqFKhlX7ntU0YX+K5Uey3cewN7CvtnPBfNHfnBW
 n1M5YzUjl0EjGS3IwQ61I+WWA+nr0yklYcOn2jm9wkfwzqtLtkXPsDiLUY+PfQjl/6NQtZc2Ocx
 fMIg+4lLrycfuNyPtx/s2N+lrG+hp8/m+ntdhT/rplaS8oQ5G9M3CkneokV+QgH0jYhVmtSiaxB
 X7s63o7FbfBmlD4J3KzfUOCVsxtKCvOZb77Fk2eY+SMPfGNr3Cgr4q/9bF8FAGdRFRW4W/7KDlr
 JIYdwN0ucOfYIjAX5RK7OxN1LLAjm1nmmj4Z5yS0yunSjfYR4XXAkm7FQIhnjuv7lpDNFQdXQDY
 dG4QEyZZ4SpWKwKzofroNl18WCUG22Q9CxmdEmNzLTGfcVpTG204fH0bUweOl3FFpkr2tc3EQdT
 mn3+xDJLA5yTXSQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Qu9uG1yd c=1 sm=1 tr=0 ts=6aa0228f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=7cvh1xCDNGPN4v1KGpUA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: qVRWDZib4j0ZYFZo8mjSKcdboYWO4ebY
X-Proofpoint-GUID: qVRWDZib4j0ZYFZo8mjSKcdboYWO4ebY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfXwJ7r6U6IAQaH
 cl8ufeOmwN/tm8+SNjaUJuIg2Gv6J5uzrpdvbfMYqbRnAVfWSiihqEStK4vqbRTHHaaeG9jmFB7
 vd4F5jusqu0gOGHlvMNtDxd1icj1EUjASyDW3HaBJcbfZqv3LjYAzU38XEb6HOyK5xe4aGE+s9I
 BaRlGNwOqgnrgtp+P3c1u2Ft4bX8f1wghpXRgdgyRGRB4CLdQCaQWMyrd/DvGB0+RrCSiCV4Mfc
 ZSJMkJQlMxNGKmv70LCg5phAnj0vRaJsr4s2U3odtvlRYOyB1WTwl9KdrXpGM7XP5eWkRzpKJV9
 xwJqBqofnhoiymTBso7VJDRB/6OYsuvh7DjSE5JNeDanNSgiBzgqTJ5lRCJ2dq8jHZn9tu05sO9
 mA6WfEqLjvjnwlmUb7KAIG8a4Xw0BmFNhcuS4/a6c9GG3ZQOtjcfNbpJ5KPwHGutIq974zZlM85
 fNMj/PD/HwzCJ43cNDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX7WFVGGqVLh8w
 +wBce1a+NTM0dtsSDjbceqX1acuab/ZL2d9bmfqa3ZCIt2yixYZ/uP/tSDk6VsGIpb8n2ezA8B/
 IaE++eHPqjR4UypRiWfXZIMOrcJJm4c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080161

Instead of needlessly copying the fields of ethqos_emac_driver_data into
struct qcom_ethqos, just use the address of the former as a reference.
It's .rodata after all. This is done in order to avoid having either two
calls to of_device_get_match_data() or having to extend the latter with
another field when adding support for SCMI.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 37 ++++++++--------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e067ceee016217c49d3b3d572fd9f33e562d1a75..ab1bcb7eb18e22f01556c190f7d8cd8eeba4d0c9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -103,12 +103,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
-
-	const struct ethqos_emac_por *rgmii_por;
-	unsigned int num_rgmii_por;
-	bool rgmii_config_loopback_en;
-	bool has_emac_ge_3;
-	bool needs_sgmii_loopback;
+	const struct ethqos_emac_driver_data *data;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -189,7 +184,7 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 static void
 qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 {
-	if (!ethqos->needs_sgmii_loopback ||
+	if (!ethqos->data->needs_sgmii_loopback ||
 	    (ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX &&
 	     ethqos->phy_mode != PHY_INTERFACE_MODE_SGMII))
 		return;
@@ -323,7 +318,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	/* Set DLL_EN */
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_MCLK_GATING_EN,
 			      SDCC_HC_REG_DLL_CONFIG);
 
@@ -353,7 +348,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG2_DDR_CAL_EN,
 		      SDCC_HC_REG_DLL_CONFIG2);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_CONFIG2_DLL_CLOCK_DIS,
 			      SDCC_HC_REG_DLL_CONFIG2);
 
@@ -433,7 +428,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 		      RGMII_IO_MACRO_CONFIG2);
 
-	if (speed == SPEED_1000 || ethqos->has_emac_ge_3)
+	if (speed == SPEED_1000 || ethqos->data->has_emac_ge_3)
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
 	else
@@ -457,7 +452,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 /
 		 *  (2 * RX delay ns)
 		 */
-		if (ethqos->has_emac_ge_3) {
+		if (ethqos->data->has_emac_ge_3) {
 			/* 0.9 ns */
 			prg_rclk_dly = 115;
 		} else {
@@ -473,7 +468,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 			      SDCC_HC_REG_DDR_CONFIG);
 	}
 
-	if (ethqos->rgmii_config_loopback_en)
+	if (ethqos->data->rgmii_config_loopback_en)
 		loopback = RGMII_CONFIG_LOOPBACK_EN;
 	else
 		loopback = 0;
@@ -496,9 +491,9 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	dev = &ethqos->pdev->dev;
 
 	/* Reset to POR values and enable clk */
-	for (i = 0; i < ethqos->num_rgmii_por; i++)
-		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
-			     ethqos->rgmii_por[i].offset);
+	for (i = 0; i < ethqos->data->num_rgmii_por; i++)
+		rgmii_writel(ethqos, ethqos->data->rgmii_por[i].value,
+			     ethqos->data->rgmii_por[i].offset);
 
 	ethqos_set_func_clk_en(ethqos);
 
@@ -512,7 +507,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN,
 		      SDCC_HC_REG_DLL_CONFIG);
 
-	if (ethqos->has_emac_ge_3) {
+	if (ethqos->data->has_emac_ge_3) {
 		if (speed == SPEED_1000) {
 			rgmii_writel(ethqos, 0x1800000, SDCC_TEST_CTL);
 			rgmii_writel(ethqos, 0x2C010800, SDCC_USR_CTL);
@@ -539,7 +534,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 			      SDCC_HC_REG_DLL_CONFIG);
 
 		/* Set USR_CTL bit 26 with mask of 3 bits */
-		if (!ethqos->has_emac_ge_3)
+		if (!ethqos->data->has_emac_ge_3)
 			rgmii_updatel(ethqos, GENMASK(26, 24), BIT(26),
 				      SDCC_USR_CTL);
 
@@ -750,11 +745,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = of_device_get_match_data(dev);
-	ethqos->rgmii_por = data->rgmii_por;
-	ethqos->num_rgmii_por = data->num_rgmii_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	ethqos->data = data;
 
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
@@ -791,7 +782,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-	if (ethqos->has_emac_ge_3)
+	if (data->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))

-- 
2.47.3

