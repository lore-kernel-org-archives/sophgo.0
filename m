Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30DA3AA4EE
	for <sophgo@lists.linux.dev>; Mon, 23 Mar 2026 13:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272090; cv=none; b=D3j8uOP7Itr6X8hRyf+VPdMyVrNgW8SvkiVr1SblUaR7s+Ov9gEfBGBTcSs+xPxPHip3qG1Ue6LP2lVp3CwReggfMV3Ea0bpKc3iMf+IGXTzH2u7xMNCW3sWwKP/qGHY8JPlGKckddP0CuX1+mK36+iqf1aMnHTnwAmaqFoxmao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272090; c=relaxed/simple;
	bh=373Wu0YOdghkenYYccAVdovRXQAOXyo4mcHxeQKE/m4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gvb+OD7du0thv1qF9t6ygD2nn5kv4kI7yhIcXxH5p1QXAzC0U5j7vXlFEWEEd9NnBcCW0FPQl5B5dZEiCdtQ9R+qhwZm7G7+pU4pfCfg4EunsgP16PlgnYV08wkyzxHNMurKwWul74C183pows74FiAm6iRB6fvTCfjGb45ZmpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DNyUHVHV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CN/XEQmN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DNyUHVHV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CN/XEQmN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NCehZn2476030
	for <sophgo@lists.linux.dev>; Mon, 23 Mar 2026 13:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yle54aasT0KAyqE+c56KG4QyZSQeSkBHtORNvORo1pE=; b=DNyUHVHVyPrHUr38
	Xak8Gq5GJ3zIqN8aI5S8N5ng4jsCxFEFQa+hG7ZyeZjAsKwCD4PMZjatk3vs0iiM
	+qMhA+XP8aDgi1rxxICX2A2N5CsexJj1YEh0US24LYYu8RKuQXybtLbQ4CVbUCUK
	fEwQ0123+8dSSgYwfj8FKP3sFJfC74sCdDhpGDNlWlr3iiRdxksTb3nDHB6VUl4W
	FX7yzZwoeggxFMDFrVwtfNJgTkC4QUSSLO7TtRBQQTs0LmvFAVV/79N8aD6zNPvz
	UB1KL1PvUWfr21GW9AVav7bnkME/0fNYb5xW1HRE+XNjO4PiSYBEryZNdV6OtX63
	d1FzIQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r2045k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Mon, 23 Mar 2026 13:21:27 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94e9c0edfcfso616001241.0
        for <sophgo@lists.linux.dev>; Mon, 23 Mar 2026 06:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272087; x=1774876887; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yle54aasT0KAyqE+c56KG4QyZSQeSkBHtORNvORo1pE=;
        b=CN/XEQmN+K3wlFxg1uX1G7iwRHdtXXybwYnR0/YIaf2yeiyza3i/t4QN3GdLi26SFH
         secm0vasyTbbmzw4mVOUw2dDGLjGbVvHsn2qrDLQ5oKLaj3oNYHpSj0+MLM7YImbQQ2d
         DwGcxK2crp868GsopU8GJpheP/SRBA6UOysNbM1LXOVhZkQtq88FQwnfnr6iOFAqWLkl
         dTwUC+tn2j4HWJoWnPBeG2aELILY20qHDLabEMxigJY6GpdgeWg9Dzuyc5OdWElrOr4X
         B4xsztRmbEHBuKoIh2IjccuNZiHdtNeqL/dqjkwa6sUPEGdekRHRnx15jsDrnZSXALoy
         rKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272087; x=1774876887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yle54aasT0KAyqE+c56KG4QyZSQeSkBHtORNvORo1pE=;
        b=o/4IK6r2b+kdfAk+fyUZhvSAeE8/PD5sAAmRXjppbL4PF6jVvzEPw4SxEEi7yPu8kL
         4ss8BcgicfOct8jxGF+iP5A8D+RYET/mndEEKWd1AyxANH+ZntC0xCEUIzaxdXVM+p77
         /qqBKiFY5zfqIuHx6uN/1EkUICKaT0pERoReUXC1dgbZSWJOqiLO45Dd1wdgUI6Kvr9W
         YPE84Pv776CLxa5GPxNtJ2lraI5lF8079xYU4lQrFzWcdSg1OKEnRW04JFzod5G/AOxi
         z+2e77J2GCenYlbvYZonfQcgdTNnMlkKo0OFNd9FNLBalFUlSEQRgooB/ZtekHWk/NPn
         bG/g==
X-Forwarded-Encrypted: i=1; AJvYcCXqNggi1rmAROHJ3i+qGv9TQ8NY6UuP3oLsbxB/tJgtkAZ6jujIGIaVvGOvVhUIjVVqerSGQzs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyv/DNkuDX4s1wR+rpw3/1K6CrrCpSjbRriV2S0CMaarkKIn3dX
	QKi6NqG1iftGdkW+4+pVPMDvpF7uQmAZG2GsZmit1LC292yLDFjSADycamNHC3OO9Y0zvBChVM6
	vgQvqYazVYImfUWtBBpMe4zMbTtogHcoiB5++NwIAvLhmNR563n6i2KhC+Wc=
X-Gm-Gg: ATEYQzxAgC3ot35U4wyZ4rmf4bQQ3uVvPGtvwL5Ygv0qEi216lOYFPQ9lO7+1oXvFOR
	kHMREr8TQs2Mm5Y5MhEjmhZR3BDeRLho+Y0NWGSokAaQ4M3X4mgLT6Lk26XFO5qfJFe4l/81OJV
	8Ziu3ggfPaIYbjVh5gzAesaeWvYuapGx31cRjIK3AXxju9BaaARFxIkX0BrzjyN8vAUkSC/iv4w
	wRdFHi+za2tExj74urNNer3zjD6G8BlToW5RFIl91T9Gj4xSZoCe1e+9fqrwUvV5V3tmd/icQ/o
	/qpOAOAFLg83lZOaUI+TiANt/SouGEEl6531mNDP6vHgowh7EE7ILNNIjb5FWJct8G0OlWbpZO7
	6kA1QCvOZDvuBI7Ynug1kLDvu2qSmrvzWdwarUkkc4+yLjTFC0Wvm
X-Received: by 2002:a05:6102:304c:b0:5ff:fbe4:8a8 with SMTP id ada2fe7eead31-602aed054camr5615947137.25.1774272087263;
        Mon, 23 Mar 2026 06:21:27 -0700 (PDT)
X-Received: by 2002:a05:6102:304c:b0:5ff:fbe4:8a8 with SMTP id ada2fe7eead31-602aed054camr5615916137.25.1774272086743;
        Mon, 23 Mar 2026 06:21:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm503102066b.4.2026.03.23.06.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:21:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:20:54 +0100
Subject: [PATCH net-next v10 2/6] net: stmmac: qcom-ethqos: use generic
 device properties
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-sa8255p-emac-v10-2-79302b238a16@oss.qualcomm.com>
References: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3061;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zcR0RnjcSI1SgFgu/C5UbX/pxDqfJ6EHZAvAye3xmuI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwT5HySyt+qzXu07TEj5NXpUEZpB9c2m0vaFfT
 E1nGa2TGUqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacE+RwAKCRAFnS7L/zaE
 w0wgEACygEU9p++p9rMQwhvugYB8IPaUzeQ7GkVztEIF9mqKAZo0I+UG9krsT5B2LLN1vr1Fd5S
 x35kFvAKbLN2/iPJKOHafYlD1GNfuQbTdSSzHbsh3TmrpCaBg2AK3hSIHCMjgKnfiw78fce6mSj
 6MoQpIT9wWxXKMzk02wwTU5Q9lfJG3f6EP79Srfo7laossl1waDXZ5tLMKVHyLAm5AL3erk27TV
 zwTBzl2tiB2bO4s33mHw+G8d9ygwWUT4xu9ZYTTTMHViiOoy6C5jh0DzLJZs8t+8d0twIu/Rbbo
 F2RCLFH0SyGp8WD/O83ulomlWSTdeuUIbkDn1KxjogRyCGa+bPK42XlN53N6PkyQZyQK92mBc09
 EgHwBByqDFMrLFS/cgLeHbvRp84htOOlMTeztfR8o2TlaCQcOgV5xc7VXcoRp6l0xUVk0x2pWwE
 xZKX2U6Lfa9zreopc0z/HIva9mlvHWWzr3dgOmUN/7LQSLzOonWwfPhT08De7wGSXNPG+UkIyKW
 SZLHlDqcF/DtWnwp2IUbYHx9SG9ZU+/Jaqx517wqcB6l5xLEqu2hUl1CSkYjrjtXjAQfxSMnSXK
 lq6JhO0zY66r93m165VwOSOVxdtPFTMiaFr1SGBvyKxvReFi2r19OotOw/37HUw11K//83UGgul
 xzQTM+ZNlEtnpHw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c13e57 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=AGkLNbZTeN-MX8W9OO4A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2QQQY5Xk_JZk4N2G5Z1icntS6Gyb5Js-
X-Proofpoint-ORIG-GUID: 2QQQY5Xk_JZk4N2G5Z1icntS6Gyb5Js-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfX9G5yQ+Qet1TX
 GhioebsEkf53NgMbWv5A5yW8hb5WKQ20sbCREuRAMXyeKIGo48Cby9CMY6B3uJtUUOEzIy7/w5U
 crLRrUxk6xjOlJ2Ns+DyZYbSsM7Lu98XtNt/c/UTyuwR08A3GcMnh5FYlCfPtq79Ymf7Q3i1w7C
 UDmQwVrdNAWyZvOKttp1J2K4pY4Blw4/rrrvIGdV5lviT77YQsbp56gK+NwTTwX00+bMZOplPPI
 t6OEBoQ4fdSTSG9kqY0uVUFgtcVuUaPX/ooDiqSRx1tBjKR19CbK0aRkTNzYcQEvau64fdyNIwA
 O8h/Cpx672k+UzkUv+XdSuANIlrucMHsx4eS9I39uLvf2+QUEZmXu5cIOq+YEIckvLnHpm3yJ5s
 q+59ELSR1CaCYVRtuDJLjvAM7png9Sm97LdCcm3E+D/rZFUmAei7jmjFSqHJoSBR5jB7lbNmOjT
 dc6zxKR1EotrAfIhmDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230103

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
index d3a6ab7383fc1e1b2e4b12c670b12a8ad1606e6c..4148805a82b106471a25f9496b60be5bb9ce5c00 100644
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
index 3ccf20fdf52a8ec4649b43ade8ee7b85d613e1c5..66fd2ed2c2c8428694c07d89220d0e1608546791 100644
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
 	plat_dat->pmt = true;
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

