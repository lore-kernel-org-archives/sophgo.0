Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3ED559C9B
	for <sophgo@lists.linux.dev>; Tue,  8 Sep 2026 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879505; cv=none; b=QTpMQ2QNV2ifyGZY1EgVQevw1AHZN0GoSXq2JqkJI4BCQC5gVK2ev1SDT/o/tYFoJQ6yv5sTpPZMZRYKAmTb0jzN+TX/WEq64iSWxdFyz5RpimEL8L9kRaswcmno9Yhsd2/hXish6oD/Kxxz9gFAXKEBEyqtx8qCueX0qnXkI0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879505; c=relaxed/simple;
	bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ACo7eWx+5+6Xa7gyQ4xb7HS2p2RX+GA2gu0lDInaZSca8TOfII5nxyN7ZJvIeJb9dgGUwaW8VGWD78fn+szBlhnsR+gb+7apGN8mSG1xeMNr/DPDph/oGi1cuNlN/8msMafyfRT6vrt93Mov7EYKOYtPDD+ZGoI6rXbR/BsXffI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlfY/+70; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGAcWg1+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlfY/+70";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGAcWg1+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ej1nI2770471
	for <sophgo@lists.linux.dev>; Tue, 8 Sep 2026 14:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=TlfY/+70lYPBwKfG
	8C+dPQvcTQV5IWcBhMbPO3VQCQZbx9FGQlPPtyxXFmZ2ZPNkrjBxPpSwG8FxPQRX
	IkPviXWaBMs5F7rOTPVAklbcam91LZ5oLtPhuhV27it6Ai6880PRcG6CqxGaf9Ix
	kCawijrWOm5I+qk/2ewAvYYCZd175r699olAl6bWXKgp102LwYvOsdFY31olu5SZ
	Ug6q/2vRt+a5KBrUdSgr02i9M5w5Vbe13ToeJ2JPg2U2XESm5HdG5WY7tLgMbfgt
	hIgwfGrq5kBar8GOh6Be2mUM+m5MDsCFQGeVHzke756Waxuz8EejSIJxKkwieNvq
	qIa3sw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvuj6n9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Tue, 08 Sep 2026 14:58:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78f2fe53829so221125137.2
        for <sophgo@lists.linux.dev>; Tue, 08 Sep 2026 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879495; x=1789484295; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=dGAcWg1+u5fa4Hc/YpkRR3tYdLfi1Y18uDZzJn2PT+UlpgHYS+jW51N1FAvIoq1Vsp
         0hUn3Ckkdlp/JNvdb0eqPoQwTFOpF1/yHNYeJbUMnoB4qm/npdtEyx3XLUtZub+8rTXN
         cKlphQ7beVF5OzgYkKIhtIxKXDBVYisXFGvgUXGEo8O946g1tvS3fdiCanXu1RA6fNCm
         8iWDF37lKhpLcuv0JEMEO9xSrOGeAyxIlDtaVufFfZuGnsc1VYtRkAIAsUTlTzWHMq55
         eAoNVdIyxpQ9LIAmRuqOH/pPIHqkXP81uvb9vTjhz6h88f8E0TkmM++Jm01ymE6Cqqhm
         Hqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879495; x=1789484295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=Y2mQTAh9+fu3tOOUydpvwEhEwCigeZn62TiMY2rOLx3nWX/j5KvEsxmYshvd0NDlaK
         cCR0eXSwKMhIN8nrHKW44Lti6dC5SFSgiWZVbCoK6dAQyDyRSwouYHvd83oMvcQkhKKl
         wDrSK235Chk2VypakYSyhaKh2OmHpsXSIIIiS4MeKaGeSpQ4TX+unvRvCKJvccKRqzm3
         7YgU0yZuOQQJBJhwKne3tAtinXVNlSDyYYoBf00R3Mbm5nnVSwc8Q/I1bpEIa4RBjR2q
         rTYAOiW6L5g3lQqmFsdQPwqQmbVbt1FpMarqJpZfXPiUwm/B9fnxTNjnnxecHAcaLtWH
         iRQg==
X-Forwarded-Encrypted: i=1; AKwUvBxCuCF+l/yu/kgPGz0qPQC2sy82mHI1vuhe1k4KJ9UZVsriZaB+1cZxAsaeCp0HaEL72jXpqFU=@lists.linux.dev
X-Gm-Message-State: AFuF++m96PagsPhc0LUWM/FHeglOTJKaYa/CPBejgrhqs2n+r31z5rEU
	ycpm4XoDeDPGz+Sq5e3UjSWtCkUdMc+PzRFlCwWkGNEuE4CM15RDUBVR3GldwAS+fXcz7SZKuNL
	pqOn3YA3CqiS+pLObytu/PBGBfEd+BuVGgbUK79FcnckokUljUz0QR8gQ4hU=
X-Gm-Gg: AYBFou29UPDiLEU0OGxxclbyJui/43NDQFbOLOwOeHZDkuQeoTVDfCPtRQHBXJALYaX
	vdnPNtQyzxhCcD+zPStjOGoHC9pN4gFbb3OVdHU8yFwBRrbyr7lVsxZcdnHo9xu9bHBY/3KP5Va
	lSycYm8rflZVMhGZ6YoAaPnTtp5J6DIC83AQYG53fgyZqRAIU0kGqqBpb2ApjsieHb8A4gtnc67
	71AMmSZFtISw1Ixr1lCtvK0vJe1kZSu2EHERn8cRdjYKgFfVvmriNSouIc8BgfsOR4aleAnhB0j
	tFojRotlwnFPonG7bjG8k1v1B5T7gLLp+uxcVa0Klb8twKXcLpJ9wAp2i5e305ggBlH0r6EPNWw
	/SypVA9t8QhThx02cD9Cxwn86eAHQ
X-Received: by 2002:a05:6102:54a8:b0:785:c960:ff85 with SMTP id ada2fe7eead31-78a4a8e5299mr12862098137.7.1788879494521;
        Tue, 08 Sep 2026 07:58:14 -0700 (PDT)
X-Received: by 2002:a05:6102:54a8:b0:785:c960:ff85 with SMTP id ada2fe7eead31-78a4a8e5299mr12862044137.7.1788879494031;
        Tue, 08 Sep 2026 07:58:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:58:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 16:57:24 +0200
Subject: [PATCH net-next v14 05/10] net: stmmac: qcom-ethqos: set serdes
 mode before powerup
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-qcom-sa8255p-emac-v14-5-ec212b747a7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJr2HJy3rNOohKIofZRC/HrZwZ9P0zZOWRXQ
 S51BxunZFiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAiawAKCRAFnS7L/zaE
 w1OnEAC2YRnquSZ8wqTHNjfW4N3WzbgI3U5rbMQqt5bXxKUwgjLXrFzhBTY8uZA1Uu0+YoP08u1
 hQ46nB7p89WKc1VrhJY1U3TBBxcnlyLqIkl2hqgHtf1fSMUN4qgDtlqVocrwtLo2m5B+ZkA+SNW
 BABXgXrQBkl+InavpYsVxDOsCYpsIkjcfcmemRkzzDrsydaAUlT8Ov9GJ2BYIOGg7WDuD4Rz+ik
 d+Y690KTRpYoKbThlgXcMVH24nuDtDCJNvpc1ldLVtyFga2uu6MbHTKv/6UbAFvDX+QPpMGFrAe
 Oy6Toa8Mi0W/hKPw3y8okYWSFMnIFgjaM4kxHqbSwGsaNVS0b+9EVcOCZtCExYoaUn9Pimgu3fT
 RtbsIwGW0KLpbisASrL4SCIbir8WO67kRTu+ghSfBbEDc6lZbBQ3rj1O2Of6YuerpwjRD3KvuGL
 ipmpqBLUgXTallF0viP/60sN8lmlCHK/P40dgJmAQqQDeJ8FPkbVhTaFywQtHpXvZqHlH8Z4PAu
 vYOZLTFTPtfeOKLdmOcry2ULa5ykPNwawmv9hfmoKv37Jms7ueFEvSgx6/1ZJOGmzQQ7BGMKch5
 F+tv2Ty8o6jwM4rTrDx8+PYus1TZZCr5JRunxR90WQ1+tThTC+LYar9fGlOy+BPfOTWZf4VN7WF
 5ZP/X8M2ZwFQnFg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6aa02287 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: ZQ740e_f45AjnvaF2lPfuIRuCKjkuTfA
X-Proofpoint-ORIG-GUID: ZQ740e_f45AjnvaF2lPfuIRuCKjkuTfA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfXy0wPqYprLjqg
 F/Iuws9Y0gDX+2v87v3X9lw3i1yBWCmmwIFybKMhbtWoVFVr6VzH4npdGRuSC6S7yDN/Tp1dVYa
 LHvUoZurR1fJxlie30FbXPZvrgAUThi3pCB7W8c3DWe7wybiInZwY/PsmX1BJlJLnMBxGt5eOCR
 2IR/VFdRnIXtxEJG+PNVXjrk5fJDYprtbwneRVdA5Rbe1omBzsrqNJ4lGo2DYuQTy+96JRqAwL9
 Wy8EHrgT1kcZzHv0j+UtshS7VxNIKOr+IVzUl4pp0pqvu7MCh/LZ7uosNLWhLaRRtnOVrSRxvco
 hHJLwTfuEr0Rpv9rYDDsK9YKdzZGWOc1newJYyeL3UXkxYtSyS42NzdZVFBUANVliq/6bGnl/uc
 TfXNFdYiIRz6WlG38PmPmGBQPJOaW3Ww8za86StcQSV85+Hy0wBdc2dW7v55vPrhyHDiDnAhAIj
 FP6OghAvrp/9eSpQ+3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX0KbdhyTNONU1
 tbB1WsfB2BfJYBv2VPU2y69dJT+5RSLISI/ULMiQa0r6V+WpNrvSXjlRC8EuNlasBZAbFbWe1p1
 GeVH4f+FsZGTFXcyUdK56ATQzHNfPyI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080161

Call phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
SCMI systems this is required for the PHY driver to select the right
performance level - which translates to the link speed. This is done
ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..47b70b5e706f221c01f1c0ae3b1acafae6641165 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -601,10 +601,19 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
+	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+			       ethqos->phy_mode);
+	if (ret)
+		goto err_out;
+
 	ret = phy_power_on(ethqos->serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		goto err_out;
 
+	return 0;
+
+err_out:
+	phy_exit(ethqos->serdes_phy);
 	return ret;
 }
 

-- 
2.47.3

