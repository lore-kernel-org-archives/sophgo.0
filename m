Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2247A3E3C58
	for <sophgo@lists.linux.dev>; Wed, 11 Mar 2026 17:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773248652; cv=none; b=bl87UnyjsShTvZldw1DbZIafz+OEs+q58g2XqGxmzB2DCnb+ncKNaFTEPW0Dp6D+2mWLWL5EKRVpqYjrqIDxPaVoukjexs04XIOytJBQPXvyuyos21fF3OpLd0kxR0IaH+EVYBSgH+rfhpSSRjUmEza8ZdNXMyd/XqDSvNhxUIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773248652; c=relaxed/simple;
	bh=XQTa6KufrKePUx/Uu/qM+rFcQNF6NZDePeNkUKq8Ik4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZFaNdpR1z3fRv5oQxZufXlXPCDk8IRpbHBMgs/WrNZUs7PAiadBDWhyYMmCt5gulgLDYkqP+y9zEv8OcolJR1xjl996QmcSFpOkPLAROK3b0n6uXZ7wj6+5kNCb3jnDWGIl2NC5NT1iATCkyT7nXRD9mMRExawJQ9SiVhTRP6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vag1znOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBeH2Q4A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vag1znOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBeH2Q4A"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BFpCGY3602146
	for <sophgo@lists.linux.dev>; Wed, 11 Mar 2026 17:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NW+6C/YlptYPDKfGIe3lKXnCrt4PCKobOVQcU827DkQ=; b=Vag1znOofy4KWeNa
	XHK7Gkan+Utz2ctuBY82nlWXcZ11ZO0aeZ0FpQDuqwGaJmNrUmNyBx4KxcoEed36
	t/aoDUd2bNLTA8o53HE6JNMVXLRNsFmWjEXQB0zL+eqBL8bcFb6Goy8TK+XAoocF
	wPiFGWlNIOdhz6wpsMO3k807HQNaVFwYwdO/2cJnS05XCmrqaRaNU3RES55sKcIh
	6ORMweOkApSxIXoTztGXGFzYNBQpr8+F2Oi9GvCfsQbydTY3/zAhApn6jXz0GZRx
	vBp5Widhy8YWU0BzngmC9zYgS+fervDaedSjWCPdKX3GQVCBWSrFM+6rNG14suH+
	vJ3zGA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cubd4r9n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Wed, 11 Mar 2026 17:04:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5092033798eso9072641cf.1
        for <sophgo@lists.linux.dev>; Wed, 11 Mar 2026 10:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773248649; x=1773853449; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NW+6C/YlptYPDKfGIe3lKXnCrt4PCKobOVQcU827DkQ=;
        b=BBeH2Q4Arummb5m1rIKu/DopI7mKj52FweDNQX5z711xvL749B1OTrUhKhjuEJGwNA
         FKEBJpAzJKgnKnLZs8CRBs9MupjUGEsgdA30ZoqujImx6ZQ5RVsNEi1jJTjcyp7GoP41
         Kjd44ndcm27S9Yf6cMtnhKIkyLTKKxZootI+2VBDqEb+DCZW/VQ7b49CsxgZporDksdc
         4MOPiE/943rHfiKHnWSPWVZVkar2HvZAwuqFf9rNpwNxTYxjTvdLOLDx1i4SHDeVEqgn
         pkrUFaVqSKHqNbIHkxqJ9pm3VWl3KuJne7uhrGkKK5AB5cDkEH3WHs1ukMznnpDkV5F5
         rvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248649; x=1773853449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NW+6C/YlptYPDKfGIe3lKXnCrt4PCKobOVQcU827DkQ=;
        b=uemlXAifFeK/g1rW68NNTw5awl1btkgheMMS5pzRXaNWWkAO+47kLJ0XhYq156DBBf
         0EONY9HL25WdFlES0flAUTsVWjltMhzh+cbghQ+OwGWsmtOFBQjRseCL+QqV0tL4UiXt
         EBu8lxV/eN98Ok69VMGYH6ZCHmlpAlmRa+Z0D57LqOKmw3oVP6MxWpjHx3XFW/VXJ+Zi
         zoNNc4PWNRAS7builLVBjRyPqdPT4JgvGJL6GcAjt70S8toOKm0a6zYyn6SJZCfdvW8x
         s6pMy8jyqxl1xzoeikjhvsS4JKGDeP1zemOCiD6v5dpToQg3rTJPFj01OPBWpESM4MSA
         GOOg==
X-Forwarded-Encrypted: i=1; AJvYcCXoMfdw4mxfkMPu2dIKtlceDZF5OSz1j2ULZw2CM1/0sJ7bzM4SS92os0tRxXA1ci7wXSmEtf8=@lists.linux.dev
X-Gm-Message-State: AOJu0YynyMzEzylKSbaJhosqdUe89W5Icjo4L043czj0IdVOOJ7ZlQND
	QTddIN0ZRfMRea4cQnHQ9Bc/I3FIkqWmW7rJnztg+AW53MOp0sh6pVrLumEuxkWynj/LPtiy17S
	mST9GGG3/Lrj+fOvFUU26H2GL4TCOxBZnXVhOU4QHmRi7SQLBa/MVjUx//iw=
X-Gm-Gg: ATEYQzxjJmKJ7cSXHJpsH52x5of1IwMw204+ieyDfjpOmW/ex8TNQUxLOKIivVgAqLl
	QqzVL9LwiQUiaMaffwwDsmqBuSfFWPEBbrjgeJcJCgmOP1fGU+rk1S1y5Y1F7guGvniLi6lgcTD
	iX/t8HyXKgCuLVQ5vOLXDcwJ/pjHnKm6JBJQYTeAaqFCtv/pwtwdg+lWxFSmG/m3hnmy8qyV/Vp
	XXzQ/D9pRIxWROphwFbwfNVmpnS7xfb44V+/rfmTSe6jxsxXiedUSOFF8Gtg7xhWMCn6UArj32q
	2BIe/3XZpkB5Lk2/RkK6X4WesldiAAlY3oh/oFQrInXhhNe/kv7CV8JGTgl4dUpmmogn0Ssb5fo
	w8UB7Y2ZzFwEBzMA958qeVBpA8ngQxPgrFTiSBR34GW7ILXcGrUR8
X-Received: by 2002:a05:622a:1b09:b0:509:3f5d:4fa8 with SMTP id d75a77b69052e-5093f5d61ddmr27706841cf.18.1773248648569;
        Wed, 11 Mar 2026 10:04:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1b09:b0:509:3f5d:4fa8 with SMTP id d75a77b69052e-5093f5d61ddmr27705771cf.18.1773248647821;
        Wed, 11 Mar 2026 10:04:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3a92:6740:d71b:5056])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ad1e4esm167993075e9.8.2026.03.11.10.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:04:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 18:03:38 +0100
Subject: [PATCH net-next v8 3/6] net: stmmac: qcom-ethqos: wrap emac driver
 data in additional structure
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-qcom-sa8255p-emac-v8-3-58227bcf1018@oss.qualcomm.com>
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
In-Reply-To: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
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
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5837;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2zf7cV5niFr/Qb4QPMTi/HX8ZYjENRtU1oQDGJyGl9Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsaB1mmZQXuEu4bbth9QU3xYhh2Qxxy9q7oUg1
 FY+D5MHkQqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabGgdQAKCRAFnS7L/zaE
 w74lEACEFJaarSoABJQFbSYeHV538sFoYbOryEnz5EU7iqj4R99lrHSfM5x3UoB1t11n9UkjvEp
 0o0yKon/m/Ew7ECqYZApQU9dlzDzicEm4tQx2TQ2L2BzWDuby+0p36nN5vUIqy9eg911C37FMCZ
 DddDlQhgP1x3xSehAID8j5ZQlvA3A3m0UXJ8w+GJg/v3EWN9c9TXv8jN/33/8wRAHw8TBLpfGLq
 QKykQ4IZorCOHDTxdDtMoBXfonN6czGW8xXyZbD7FOes71ciYkNnuW+xZAp+it888J1z1tGyft/
 5OLDslcDd7D4Vwu2kpk/IDMrRxt+v1fQSZgajOQJAxQ8DPwb1n4qop4x0maZaxaNmSMG3qKNMe2
 450PcXH9+3xYbMm/Lg+WegGJlVbYjAHmu7ALXvWDBQXQRPvZO5DEOg0LJwZ/YfZwK1P3F07iPq/
 Wx46v79ZEm2rADaWCOz6Eg8g+kMBkOSlv1+UaxIhGRj5sdzvj/tdzZ65uDWFOIE10WTcFaZH3Io
 jzuFVfWB92HDkH4EdopgtWZUjulJmhNmHULbJHwOkEUk2rUbpJmBupPKue5IEG+I/XUF0XFhwY6
 iO2n2U/+l2qBqtLpEb3MQaDKQsw7G92GCnSu1dayjTLq4Wfu1ufs5HeS5x0aeRU99gD6WVWgto/
 BK45EqfiyCx5hMg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: qxCcbd4zhQ47mQim92lucL9cCZ4wSBMJ
X-Proofpoint-GUID: qxCcbd4zhQ47mQim92lucL9cCZ4wSBMJ
X-Authority-Analysis: v=2.4 cv=QLBlhwLL c=1 sm=1 tr=0 ts=69b1a089 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fYgtqwV50X64hY7jBhMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE0NCBTYWx0ZWRfX/2YuSgUoc+fZ
 5WS5iomyV1FpZkDAs8syIMsGzpAHLJM1+tpTU4S8Zvd9ChaZjuH6x9ewhVq/1K4K1R+9ign1l5c
 tnEdhhxsFHyotn6lmQu+LJziysjYjgSKPM3+6iRit4i6qdsUS61/at1O8wwAIKUIN9kvu6leN4e
 ZbvuL50Z2EivD9OeUgVHkF8zbBll3cLF5Qu76Zc/2fUpBQyZ2Eg92tep3OerlJjzfGzR/DQZKbK
 QPbvQJ060AbkOeDk/X2YOuXgezgfNU0wMDcKAO2I1UeZisQuzbeLP8G5G30lTTV/Boi6GBC+u4i
 gaxAonv8HZUjs265XKE7D5dWoMCNvOItNXvAjpZHzdfhNeRy42f8M6JrR+LMHJ2T355UZOIEJLF
 AMki7O4QlJ0vmqBCXPNum9XUY1ubkMbCvwvyxnMvv8e5KDadsi6Hl//V+PnCyH/IH+HMPSolSHz
 JB1bMsfTn8j+z9uOsjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110144

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in enabling power domain support in the driver, we'll
split the device match data and runtime data structures into their
general and power-management-specific parts. To allow that: first wrap
the emac driver data in another layer which will later be expanded.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 52 +++++++++++++++-------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index fb4ffd0d5360d091bf0192740b8a4a8d2c66e09e..92fc1fd0b4a1f85fdca7ee6f2c78b88415ce440d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -97,6 +97,10 @@ struct ethqos_emac_driver_data {
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_match_data {
+	const struct ethqos_emac_driver_data *drv_data;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
@@ -223,6 +227,10 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_qcs404_data = {
+	.drv_data = &emac_v2_3_0_data,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -239,6 +247,10 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_sm8150_data = {
+	.drv_data = &emac_v2_1_0_data,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -271,6 +283,10 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sc8280xp_data = {
+	.drv_data = &emac_v3_0_0_data,
+};
+
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -306,6 +322,10 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sa8775p_data = {
+	.drv_data = &emac_v4_0_0_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -728,7 +748,8 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	const struct ethqos_emac_driver_data *data;
+	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -778,13 +799,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = device_get_match_data(dev);
-	ethqos->rgmii_por = data->rgmii_por;
-	ethqos->num_rgmii_por = data->num_rgmii_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
-
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
+	drv_data = data->drv_data;
+	ethqos->rgmii_por = drv_data->rgmii_por;
+	ethqos->num_rgmii_por = drv_data->num_rgmii_por;
+	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
+	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
+	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
+
+	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");
@@ -815,14 +837,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
 	plat_dat->pmt = 1;
 	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
-	if (data->dma_addr_width)
-		plat_dat->host_dma_width = data->dma_addr_width;
+	if (drv_data->dma_addr_width)
+		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
@@ -837,10 +859,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
-	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
-	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
-	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
-	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
+	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
+	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
+	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);

-- 
2.47.3

