Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9357B3FD134
	for <sophgo@lists.linux.dev>; Mon, 29 Jun 2026 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732562; cv=none; b=SzYSR92fJhv6WmKozHi+kDQCZ/p7sUGn7ut1LaHrtmEudzrmtBb75r/Kjrsst7781X/X3omg7K/pWhWsh+QPWE+Gl1EuXp7VNMEls8yg4sA8bU2vnXaHPTzo5NmV7dpeqokirG9r0NHOndPeCDGqSF9mbsUnSjPde2IEm8bajME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732562; c=relaxed/simple;
	bh=WJjrPTVJEHMSIv6hVMo9hI0jASipWSJTfNP46iEy4PE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X12uTFIVwn0MYjhrKP6PlycskrnzmJY59vtAsXVzW1q8ZhqVic2Q+YPFU3EGxawhn5p2lJHgKMG+8VSeZ6HzBiRLzGAR5jWJ7HCzfNkvJFFRWPSdb5Ilod/HjzA0U5+D1u2/xACuUshEZvrciipdWrQ+kQ7Cl16iLG7Gn05A8IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ms2BaOrt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aeyZhmsH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ms2BaOrt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aeyZhmsH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATRAb2592780
	for <sophgo@lists.linux.dev>; Mon, 29 Jun 2026 11:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dn94XK/gkhjzkpHhKvvDz8xdTIbBqtXbB1tLNjGugAw=; b=Ms2BaOrtjy68olMU
	9yzq/lDEX4r8PwDMooV7VA2KCYk48UdCtbvyeB/qVKf5W+nEZgqMZNZD7CdKlO8b
	qI/VIpchRv4Sxz0fsfb0YfpiS9vCosefN3p2bHk1aUvDct9EJhpJlDSGq1BNAzUq
	U4WLMagIK+rnXuBHVddkLTjhcpVoWB4W5kGQBT/yivJQvZw2Ca1xfB6yINtMjEaS
	UBxLkG3j7dCu9hMR2K5gUfPpXjnJmfXAO4p/Qb2u3Zg5dyiv6cqhKPwmbjmsVmP8
	05IDLn9ATb8wFW3rxnCspX6gxrLvFLxhS+Rh/aZqS3FJ8q7DNACY51ZwMRvR1d7o
	URGHRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vhddr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Mon, 29 Jun 2026 11:29:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ac0a54110so512283385a.2
        for <sophgo@lists.linux.dev>; Mon, 29 Jun 2026 04:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732559; x=1783337359; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dn94XK/gkhjzkpHhKvvDz8xdTIbBqtXbB1tLNjGugAw=;
        b=aeyZhmsHu8N59jmTsxAVOK2JEkIbCicN4J/vs+PMP5tSEqnEYDUdsDoqBBGpNH0W0z
         e6/j+aXWhxsYWO5mDYOGrjPCPvnnIQryLvnjRx6LNbSfEuW+z4wXEGn2gSGm2uRH27PW
         JOEmlxrxOTjWtjT2sfrSi46cHMknzDwQw/4lI2OwxxZUT25oeXoJ8nYoiU3pkh8WQHBd
         sVvQJIcYsx7VWl7Lnyx0KnS3pQO+yB4A2tT7tbSFiO284CKDl1vXsA5LRUWjn6n15AAJ
         hCz1AF8CcTkHW3a/90w1lyPOPLmDTDfbQccHICp+/5MoiKj+4Nq+k0z6q34dBAvkMqzd
         zuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732559; x=1783337359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dn94XK/gkhjzkpHhKvvDz8xdTIbBqtXbB1tLNjGugAw=;
        b=oye7lDJ04eGW/g4G0elZ6MItoDq4ssP0uKRZ8Ri1RLEBfcaMxx3RxFYN+1HT7Akhz9
         vBhdOzwmH5rxAqUV3r4rUWE1jSq1+ttgMnq6Usi9x59oSWZBoAHaCCQLlRnP/MugKihR
         TNvCpfvI3xYjtdlGa19oANUyklJSZxJZ28O7OQ8s7PA9/97VgceLCt9+qlVcveDqk8o7
         KiAlwrc+ytpGmnw4k+zUUazZFh47B3shnd/ucatPkcQQLCuUANgmPfQcbYr7oTxIp03v
         nXwP3NDRneOCSTkPWUqI5xXeZm8Ilfv6sLK6OmmgYnVaii4PlUmXQn79/2z6VfXEAafw
         +Iyg==
X-Forwarded-Encrypted: i=1; AFNElJ8LXgr9QFlr2aLei1Sr3YyIM+oUePzUhhEixos/dJLCx8Tb/bEs9io9f1XDriGazG2SF0mrlcA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/9GloAfgE3lp+rNDePOvKqvbKgKm3GZS1lPXgdgCkFuIMfHoY
	h5d3OX+3FnJpCNSYkdGndU6sIiPebxOmEbOsUq5WfpnCjAKTNROdjZhl4BKDJ5uoqJGbPxUbesN
	+10pJVejecsncEc7318JuyX4UZt46do7tKb/q2PWrhtHDcOdIKOJCIqRYEro=
X-Gm-Gg: AfdE7cmxOCpYHe8hvvrtzn7UgJiW+mBfTCzej/5s8TyO0RBBkqnU19HlbWg3v5fLsb8
	ZmrbUA09fJCS/OsOI+ebGb4gqxVPB89BwR0SHS5xqgZ3Cj/wvm88a6FZTLiy7TUJaRl419OxFnF
	0s800G9tTsgeoZ7bwA4Az8YozXs3Qs5b5RipK9tkILYiVquKtTypuIJoVNSUe4FkmWPfwgeLET1
	djGPTwbS7NSTeTHCh9XENR7u8Azf044yPPcAoPTZBTD6oGMOLFP964RpiuLj/oeKb5knpYWNFEa
	vfjofyq1AxQukJ71c9DuBBxQoRRA+2vA1hg1P4RIuanK3QEVCTomp5sXmI5t7SQ2pGSg4TRkatP
	j3D9FfZChB9HZazbfk4Ir77M7mr07l+QQQAIKyug3
X-Received: by 2002:a05:620a:4056:b0:915:8f76:8005 with SMTP id af79cd13be357-9293cadf811mr2614015485a.47.1782732558709;
        Mon, 29 Jun 2026 04:29:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4056:b0:915:8f76:8005 with SMTP id af79cd13be357-9293cadf811mr2614004385a.47.1782732557882;
        Mon, 29 Jun 2026 04:29:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46d86960983sm41936351f8f.4.2026.06.29.04.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:29:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:28:48 +0200
Subject: [PATCH net-next v11 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-sa8255p-emac-v11-2-1b7fb95b51f9@oss.qualcomm.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6713;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WJjrPTVJEHMSIv6hVMo9hI0jASipWSJTfNP46iEy4PE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQlb+g2w9Y9bz3nnFuqU3U87XMNnUPjRO5CRNW
 CsioPTs5WiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJW/gAKCRAFnS7L/zaE
 w2VzD/9KzrrA2R5Gsx+IYq48eCMrXk2oU6WPyOrCaaNDh9wDXUSCqq0kRbyG0bnzoDziRnrLqmu
 iHuDsOBS/mSwfy97bnk5OwxqiU34NmnDB26nHA6RZuDthlVPSt+ceQ4mCkZWA94QqY2x5Lisd/y
 UAiz737p9FXjK109dSf/f0r6WMOPMVMVhgOi7wD1ioQ0VeYMfSg+4Bv1ReJOX9qE6xtRPXpgXiZ
 8Amfc8vt6kb200UKU33ypDHLvCyMHBYb4WEZAiiqeFOmjtg0aAeLISOjIAzclnRYXpvIFdB93oN
 xDW3vDh9xVkoQA3kS0+mVOw9m4aBRYTNGSKX6aRn4kJIDS4w1YmNH5RT0Y+mPXdvp9WDP9g9yu/
 8g0KBPLOGrJPr6OXdOvSH+SthKxgnLjDmPQ6Xp7QmaaYE/tlkgWuaDEGUsIEbKtUE8VsKMp8QKN
 wMcYWmay3EQD96ue5Ysdw/p/wycaej37PrQjiBnxLYnrhObjWtrKj8h1FBn+Z/H/UwLut7O73o6
 GgaztSVgp3mr/1zLuKi6VHMFdxQ1PjiTcAR5/g3UgO8tpro/mGcpoRwRLBrYIYNlNgh+u6LdTOk
 R/NoTzr/QTkTnKop9WSYNVScVySdl6G/+pPDdJjyvSjqSLqwPTTl6SpLY5gJzGBOtzizTRh0Rku
 U4xAY6/UIUgV0TQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: pCRsgJPjDMPPdSat3mJnUeCHtv_4Mb6Y
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a42570f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=3JCFraiX-5spO6125rwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX1E1h1y5XHJ6f
 /pSkplSGM1aS4p+6cu82aZEC2Vb1L/DUiAg2W5jjDsKX91f8k/YdRrWJBDRfXWQ/yfyTsGmDEV3
 rtxP7WNW+HPd8WjrCzuIYq3wMpSn+m8=
X-Proofpoint-ORIG-GUID: pCRsgJPjDMPPdSat3mJnUeCHtv_4Mb6Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX+lVf0hCIHK2N
 xEPk+eczV1W8L2vKP6DD8e2SGNlbORZhCe1XkWNSwzr/a9oe8qnLs3OE8VdkhVSn98WTbBO86i1
 mhfkoXnOcBiLOeTMs7XQtQBjGcXLxVVQNE4kquVLbKa6UIAAlR5L8ff+7unLJjS1N8vKr3azSK0
 BK/pOPNJbL2Ktdrlq4CIXXpVaOPghYLYvyNedUwnwYhMZ2FqvK590HOqMAfANfkobAiJ47u2LXk
 cF3NOil1Sl1OtNEjErd/zAsPDXSA4bwl2RpRj6WREewGs+k5vYPd8RD27MOAimWKTk8iF65HOSz
 vbwuH5NZvaJEURg+ZEJfvKVa455kccux2QVWy8gHBTgXgKCzn5CgNDq6NgzZPQmbGmUyvauY3XT
 X/RdwFGUqNJ7F8EBEbdL5bzKjyRGjy736tNwxu9wYA8vhTJPatB1FbzqrRvenT8beMyeWGOsENv
 3ZeHJZq1h5yI6FW2NdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290094

Implement support for the firmware-managed SGMII/SerDes PHY present on
Qualcomm platforms. Do this as a separate driver from the HLOS-managed
variant as they don't share almost any code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig                   |  10 ++
 drivers/phy/qualcomm/Makefile                  |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c | 161 +++++++++++++++++++++++++
 3 files changed, 172 insertions(+)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 60a0ead127fa9f08749e1bc686e15cc5eb341c28..bd7d3fe411d7f3ea333e9e32e54f926a3bdead01 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -232,3 +232,13 @@ config PHY_QCOM_SGMII_ETH
 	help
 	  Enable this to support the internal SerDes/SGMII PHY on various
 	  Qualcomm chipsets.
+
+config PHY_QCOM_SGMII_ETH_SCMI
+	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver (firmware managed)"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select GENERIC_PHY
+	select PM_GENERIC_DOMAINS
+	help
+	  Enable this to support the internal SerDes/SGMII PHY on Qualcomm
+	  chipsets where the SerDes hardware (clocks and registers) is owned
+	  by the firmware.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index b71a6a0bed3f1489b1d07664ecd728f1db145986..032e582f2e1af96687484ce28aaba0c2ef73e754 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -25,3 +25,4 @@ obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
 obj-$(CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2)+= phy-qcom-snps-femto-v2.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)	+= phy-qcom-ipq806x-usb.o
 obj-$(CONFIG_PHY_QCOM_SGMII_ETH)	+= phy-qcom-sgmii-eth.o
+obj-$(CONFIG_PHY_QCOM_SGMII_ETH_SCMI)	+= phy-qcom-sgmii-eth-scmi.o
diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
new file mode 100644
index 0000000000000000000000000000000000000000..8ee62189556fe4ff0d8aa2f8b105175e08000b7c
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Firmware-managed variant of the Qualcomm DWMAC SGMII SerDes/PHY driver.
+ */
+
+#include <linux/delay.h>
+#include <linux/ethtool.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+struct qcom_dwmac_sgmii_phy_scmi {
+	unsigned int perf_state;
+};
+
+static int qcom_dwmac_sgmii_phy_scmi_power_on(struct phy *phy)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv = phy_get_drvdata(phy);
+	struct device *dev = phy->dev.parent;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = dev_pm_genpd_set_performance_state(dev, priv->perf_state);
+	if (ret) {
+		pm_runtime_put(dev);
+		return ret;
+	}
+
+	usleep_range(5000, 10000);
+
+	return 0;
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_power_off(struct phy *phy)
+{
+	struct device *dev = phy->dev.parent;
+
+	dev_pm_genpd_set_performance_state(dev, 0);
+	pm_runtime_put(dev);
+
+	return 0;
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_validate(struct phy *phy, enum phy_mode mode,
+					      int submode,
+					      union phy_configure_opts *opts)
+{
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
+	switch (submode) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_set_mode(struct phy *phy, enum phy_mode mode,
+					      int submode)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = qcom_dwmac_sgmii_phy_scmi_validate(phy, mode, submode, NULL);
+	if (ret)
+		return ret;
+
+	priv->perf_state = (submode == PHY_INTERFACE_MODE_2500BASEX) ?
+			   SPEED_2500 : SPEED_1000;
+
+	return 0;
+}
+
+static const struct phy_ops qcom_dwmac_sgmii_phy_scmi_ops = {
+	.power_on	= qcom_dwmac_sgmii_phy_scmi_power_on,
+	.power_off	= qcom_dwmac_sgmii_phy_scmi_power_off,
+	.set_mode	= qcom_dwmac_sgmii_phy_scmi_set_mode,
+	.validate	= qcom_dwmac_sgmii_phy_scmi_validate,
+	.owner		= THIS_MODULE,
+};
+
+static void qcom_dwmac_sgmii_phy_scmi_runtime_disable(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_disable(dev);
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_probe(struct platform_device *pdev)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv;
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct phy *phy;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->perf_state = SPEED_1000;
+
+	/*
+	 * Enable runtime PM on the provider before creating the PHY so that the
+	 * PHY core enables runtime PM on the PHY device too. The single SCMI
+	 * power domain has already been attached to this device by the driver
+	 * core, so runtime PM votes propagate to firmware through the genpd
+	 * device link. No register or clock access is done here - firmware owns
+	 * the SerDes.
+	 */
+	pm_runtime_enable(dev);
+
+	ret = devm_add_action_or_reset(dev, qcom_dwmac_sgmii_phy_scmi_runtime_disable, dev);
+	if (ret)
+		return ret;
+
+	phy = devm_phy_create(dev, NULL, &qcom_dwmac_sgmii_phy_scmi_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "failed to create the phy\n");
+
+	phy_set_drvdata(phy, priv);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "failed to register the PHY provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id qcom_dwmac_sgmii_phy_scmi_of_match[] = {
+	{ .compatible = "qcom,sa8255p-dwmac-sgmii-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_dwmac_sgmii_phy_scmi_of_match);
+
+static struct platform_driver qcom_dwmac_sgmii_phy_scmi_driver = {
+	.probe	= qcom_dwmac_sgmii_phy_scmi_probe,
+	.driver = {
+		.name = "qcom-dwmac-sgmii-phy-scmi",
+		.of_match_table = qcom_dwmac_sgmii_phy_scmi_of_match,
+	},
+};
+module_platform_driver(qcom_dwmac_sgmii_phy_scmi_driver);
+
+MODULE_DESCRIPTION("Qualcomm DWMAC SGMII PHY driver (firmware managed)");
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3

