Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B273E3142
	for <sophgo@lists.linux.dev>; Wed, 11 Mar 2026 17:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773248650; cv=none; b=qMgiGddR2aZ568G5yYJ1VXXTHmlkWL5MnpHg+E7IJZlrBx86FHKzdTMqi/A001lUknc3h4pggetVNvpIXpQzeIvLSUjywUrxIJ3ZkKY9Af5fR7LHPJENQHOOvq/GkMs5HpMACVQ2U0uvENlzI3N+7pd+Vn1Ur9207kxTtpEt8U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773248650; c=relaxed/simple;
	bh=jarMP2kx4omN4KmFez4/RzYUXczgrQKSOEW4KJFpBFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NiYRSt0PL+Yr4fD1ni7pDVaq6BL3BZibmn0eolAo0c3XRdrOX1UbPu/P9D3N+h8JBV8wo739yZv6+Kw9f687caS8iA7Q3o3s5ODGSJy1BF7mSCUnH7m+kjJJYCcESCIX1tzJqEUIluzGILTYiGzBzWe40+UwNUcfocGLfy39HMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bv83wDQy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bqHUttBn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bv83wDQy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bqHUttBn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BAvAEB2621964
	for <sophgo@lists.linux.dev>; Wed, 11 Mar 2026 17:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gdxx6+E9Nzo1SIEzhKmedbjW3ho5UzPgZIwDTMk23Hk=; b=bv83wDQy2b/EsaRU
	eJyfDUe27dHZSKDxXetxfX6xMwAnt4QbesB4mvz+7iHrdwV1rvKptFYh6B1krTjR
	ICyvXoN67ke/klwfb1MvrYNu6wLFzqLBF4Cc74CqjSdJf8TNVUwc4A76ywj0JFj6
	fD1eXV9P42pNfMu9GoKWgcnjfkMXw61dpW8ggeyyMJ5FSJF5mXTRQmXS6iggjwiI
	DwS1jKyz2hHSGa/xLJqyW3/WQxBXvW7hgdGZxpl1qvXByMxQOO+/wew+3VtWM+C3
	t5dvguiGQLTrmYnth6uLCo1Vs/ynkR6dpc36U4b36pMRUl11mwog7Ee1chminHMz
	KFriPA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu73h1cj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Wed, 11 Mar 2026 17:04:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffd5dd4c75so164500137.3
        for <sophgo@lists.linux.dev>; Wed, 11 Mar 2026 10:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773248645; x=1773853445; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdxx6+E9Nzo1SIEzhKmedbjW3ho5UzPgZIwDTMk23Hk=;
        b=bqHUttBnm+qL7M5rSgJaGgn6OG6KwQGQ/hzDSIWwCz+HAgLKp9QhhnZ6JUsISqIJJL
         vWzemkLCe15U2+2qcx9QwPSSCpQ41jDx22cCYrRnfuoY7pu4RHoOa0aF6Gf/xfJ6bqjb
         kgRrRlwUQaFFi7gPFrPRrrmSyDGIf4ZyOEvV3j12vzDEFOwQz8G6U+OYIghyiFBvdUH2
         eXbUpkJ18wFjkUHysV6yUL0SHtsM6kF76g2sMVkO450hXDs0+c9sP9nhXW9tSPdHd0a3
         ZWtI4NsnNUTxLeTf+fXs7nb/Wpm5aYGw4us+/EjTQE4xKRlVIaLVt+KqGBdWSc6A5zk6
         sf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248645; x=1773853445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gdxx6+E9Nzo1SIEzhKmedbjW3ho5UzPgZIwDTMk23Hk=;
        b=jsrEL7rrT0e2hxpTuJh2kawTuv6k7NB7eDxzPVDEGXVcCSK8j9FcK5IIu9XG8Ty9eu
         RapES2iks6i1hzT13ppmN4CmzSwLetAq/oSfm1QrpBHH4lvHGiBFUnb0OBUYAPjjOhkr
         +03i2TGqv5wkFQDeXlN1rIy/pCC6cazbeoL6/A5U7d5xh9qhGr4wWLC1LDOZ18D5FDF5
         tFymsk/cvTde36/4wwlGwNQTwNDlvogM4b7JWAg2Y0ei8CWxTaZo3bGBUc5uAwO/R38S
         0cPElMr+8pKjKDqNTWswxbOqlknxpHe0KDl10eptukCBpb2kHLz7VE4IA668FbZlwmoe
         y3Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUlLhRh380GhRSwLG1v8gX+0R5TPfyBy02nZmuexRSt2Bi8tLfB6U56gSkzE65JOc/5ckqFgJA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1p95ZvkTXCrEnh3av1dXlcg7RDqP4qq6d/qxHUMzeZEZWHEw2
	YbY4cVke6DhDfu0w0+wkcNDME8nW46zBzMQ+KBHUo29UrEKE850tywTJQacc6BoG4V1BaIimDVL
	g2bhGHwhcH67lQAiAXuNbdugBwa8SeW3AQAB7BAnayls8u/xNCrb5wbqBYXs=
X-Gm-Gg: ATEYQzwsJ/MJjcJnzeePg+6Z6v9Y3QG1yGztODy4nblScE4byvj+8e58z704e4lOgsT
	MknJMPDObyNm2TKhBkmPaVpkCPvoxeDOT3C7O0J2iNc4CSxuDqKYxmKiHicqZn5J6Y26akZyObA
	9YdHpBTNWuFfgMJ/EMqO3ffvRD/SVaoMJ4HTn/SdC2Qg36OyJk5fNCJUp+C2bVzqPc/ONe9fWJO
	IHB0fxIdqqp+TEhQ1BCb/R0GY9a3Bz2FGmhQxR1uLnwGb0iwFG5DckgjlKO+/+zwAfgxjNbRzqk
	I3+q+YntuZhS6q6VGAtu9jIC3McRW5mbwgUkOeINM5LAuvAz/4Unq/jPM2yE+VdOg8+fRdx+Suk
	TLW8Sus5KZKDMyCfhCYXSTR0pSFRYSwUDGTEfEBzZ60JX2CmyCmQv
X-Received: by 2002:a05:6102:cc6:b0:5ff:cb2c:a013 with SMTP id ada2fe7eead31-601def2ae84mr1132892137.29.1773248645233;
        Wed, 11 Mar 2026 10:04:05 -0700 (PDT)
X-Received: by 2002:a05:6102:cc6:b0:5ff:cb2c:a013 with SMTP id ada2fe7eead31-601def2ae84mr1132877137.29.1773248644707;
        Wed, 11 Mar 2026 10:04:04 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3a92:6740:d71b:5056])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ad1e4esm167993075e9.8.2026.03.11.10.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:04:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 18:03:37 +0100
Subject: [PATCH net-next v8 2/6] net: stmmac: qcom-ethqos: use generic
 device properties
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-qcom-sa8255p-emac-v8-2-58227bcf1018@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3058;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N+dHjWXfvXJHTEYUAiwtkC+XoS225MOcRMNA92C/Jpw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsaB0v3Sl4/sp56iDGfrn63MUk6MjZIiJTzfXf
 w26BYwssyCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabGgdAAKCRAFnS7L/zaE
 w7sdEACZsFXM7p//CfitX5UqpB/btkY4zsW5EXkhS9yfGCgabSgfoTX9DsKhv6sX1pJTctxW2Jj
 WdJ4s1IX9/7vW+acevWWapCmtarWxZ+FS9/DUks7wrNii8FysLTpAIkKe0yb5Vqb4aazorFJepZ
 QMklj/TPR9rnPTjYCcYpO3JXPhxHVcWSGGj1T008VYY+H1g7HC3FLiYH6OztIN8m28UXC2wXXjm
 jjH4O2G4j9lQU6G0SgnnRbMSc5bzei51WxJdkBgnWXq6cFPr/qoGF+qKHbhvXfX8uR1zt6xjh7E
 rK3dnLYpwERUGOXR3HeSSv94sEOlLLtSb4ASnlh5jiCiXX/7RsM6KJkqmVNBo9jNfKUBNTFEc2E
 Rk5QW+Q6QSiC8UUdHRgwzNOArdNWh7pg26eWfgQ/vMR8QPG57IiUS6TCQS79ajOAwN2OR3aEsAy
 4xwbeUPCe6I7NV3ncRMyuLsaW9Jx02+kDJTSurrKERfV9cqSnWxe8/3veaJ6cZIoqd/BwOgrRyp
 bPAoDz1Bk3cC3oqL5IKaxnXwFO/vosOgfVJsMn49Mio14B/mDN3if30VdgPxYKQzrF26XeCHPTe
 StSJ5KHRTqpETm5niQmB6XFjjOYPG1MCZFbE57IaXGvRChr4mErCe6uLSs6x3CR+iLYfB2jRfnB
 5p7afV75hsIVjkA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: Id9Jk6R8Lj0x9er8SnHPelOWc_JuuGjR
X-Authority-Analysis: v=2.4 cv=T7uBjvKQ c=1 sm=1 tr=0 ts=69b1a086 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=AGkLNbZTeN-MX8W9OO4A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Id9Jk6R8Lj0x9er8SnHPelOWc_JuuGjR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE0NCBTYWx0ZWRfX7Hd5mFh1phyr
 CEFg7M0K7tz8l5sMpTEuoaGo+LW01vaRTPuNvy7PHnKsNDMdlv510x2BBjT9kb8vgZBIutNahAu
 bOYKxdMSK8wux0QpdH5CE7k1qpo2miwud4C3zbsCTTEnyUhON8dWIHoANk53oBYjzNxkC8sSKN4
 I8nLAx4owmVPE35HtvUmakTV+4Usj9Az5+y5YXTtYhQSts4x3+9j5sZ7/ePB94QELDCxfre0fCR
 2mJKqlPXjiCEFB8QR5+7JPE3XOj3p2stybgAWyGlUyIcuGvqZIp/TRuIgy5j9n1r48CdsyhAI5+
 pGl7hki3Y4Poy+rpACkwfIbKVQnKeBOjXdhzVv1vKejv2cXDgjfCVjKk2Kn2ALyfRz5xDxNG9iw
 aG8Qnf5KVz9hS7tCWrX4FYbKMB9i5ypD66yIIEPx7hSuRyF6vwlBq92tbm0UsH0GA1o9SQyY9YP
 qKSyrA8KwybqcmFc3Ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110144

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 07088d03dbab5bd1abf66e9460613b839c1d565e..e2af4fdd654340d618477ed87d3889dbb9aab456 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -135,7 +135,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index cb1c074c205307bca556192584fb0a4a10eecd47..fb4ffd0d5360d091bf0192740b8a4a8d2c66e09e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -728,7 +728,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -778,7 +777,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
 				     "Failed to map rgmii resource\n");
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->rgmii_por = data->rgmii_por;
 	ethqos->num_rgmii_por = data->num_rgmii_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -818,9 +817,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;

-- 
2.47.3

