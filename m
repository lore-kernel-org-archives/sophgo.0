Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6884241A77C
	for <sophgo@lists.linux.dev>; Mon,  6 Jul 2026 13:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344062; cv=none; b=JsTLJtf09Pr/l8BdR4JgGkKq+cD83nzSxgPpEnBmYJuZ2smijxGUC/BBSPjt4BSga8DcyOId5qXGyDRfM3X7vCPExpeTFXCulsAXCPjPoj7PuAQ460b4SA3C1Up9No/gXbvXqI7Q0/neKpz/nYaAnGJS/r0LOWA45qcS8r+FwyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344062; c=relaxed/simple;
	bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vEF0QYn4bVUlpHSm6pfRK1U6BCf492GOLJ2A/WvgwThXMbyYbDjZC4fdkHgckiZXue8lZtntDmp6tCtV67WwD4MUpgaVcuGeeecuZ4WtilupbzLtROo2wVxdAYNHIGYLAVBq1Vzss4seLY49MkT2xse/99Kl+H+007xIcGDSsdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fOxq+7SI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCc/xaK0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fOxq+7SI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCc/xaK0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxR5w402161
	for <sophgo@lists.linux.dev>; Mon, 6 Jul 2026 13:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=fOxq+7SIXv5TAgp+
	3LhNERn5LTVoVpsJSWbou+OhJo7ZPhM68du15CUsbeYhDP1hDtmE5fsEssdy7A4A
	LQdOp9g7rc1wqNg6bAwqx6XeV1bISNfWRVcPN+cn0G7KI4hh+iln1RcWr74AOYBX
	vpTWpBfMRXMYiG/OmstFA4Iiu5+3JA8SF32Mzad2tcatFqPmB+ySf+Lvc06tWzUh
	9Eu/+yeFDSBSpQDc/c4MyGQVcoRu+aFF9mAZiSeT4LSd8AjA9VdnJ0BR8RZQcKyp
	+a842pp2cuRnyHbSrT+RfzGrotV/cUhyXVsRgnTVIlzDHeZTUsqTi8CKa+Wh9NxP
	ZTiSrg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grs8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Mon, 06 Jul 2026 13:20:51 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bda012e304so770500e0c.2
        for <sophgo@lists.linux.dev>; Mon, 06 Jul 2026 06:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344051; x=1783948851; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=ZCc/xaK0flhU6BGG0DiZ5pWei209N3//qWOyIBp+FagD9cOTaCtfBdIhFdKMM4WyFd
         lbGWTSbuH0OxdyyJaJy5yOtpXp79+/EImFTSzNk2ldjDcBAtqiFPXg/mzwf5yCoyYroo
         hyQRnV70WupO8mJjzOI/2xVfBcvmMQuoWwZj+ZqOgXDkaF5g8QG3oxpMgpqgoGZc6ixy
         VaKiZZ+Ol6/f8PuoJYzE38ZpQIQ3AVxFzZlI2vlS/QzncFSxwS9aMhSZJBio8gaJfT3L
         jMcZKWlW+vz3yytmrXVyW4sury5268WzC53fJliM1KIuGfO4KRX61O6ywW7LDJdLFh0k
         o/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344051; x=1783948851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=UPaiiDdPG/NXQo27gxvCIDqZdFhgoLfSf2AB/pbHBVoos+9xGy9/I/gFazlz0fxUUX
         UgZjfGTNqVar0/TqOzaOWEY3kPlXDEn38J+uSEPW7k+ooNWJV0sHSWQhCd9y7Tiwl5pY
         PZAJcHAZ7Gi57+GzxvkJDlGWgE4rPGC7gaW/i5h4UgpIYXgztk8U7eiuAu5ZP5TPbAg9
         QLO5S1ds+BJr/9GUPGw9n7bPeaRbDszsFBq7W9T7j+d3PEpvxD4nUro5kxt4FqMPvZwq
         o+0wruvDvLmaju9km2Z1NBubn1i8FOiFxcXkICuTTQX2Pg5pL8Asgd9AKkyNAUIZ4+7N
         ErXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEEx3g0mHRBwvfow/QagwTKfINqTSCyOkCc3KJPFc+7C8H0bhWsc6hvLzqcxxzbrvVWTiYNk8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLqolDBRma0i+hEih+UfjjV9Czw5YIHicEJ8C/uRmbPZL8bKU0
	MMQeOYe9dA+to9ctlemxpZtbfIOrXRkVnOMTfcw/G/oO8Qw3stGgxldI1nDrqssm9DDUAW5UF5H
	XaYwcxXg2pVE2F1kFM39PnJjTrhUp/moOwn3t1nnIF2BUGNZ01SC0AGgpLe4=
X-Gm-Gg: AfdE7clY1AUyfRk/WsKIVgkUryiWXYeUKmkmOoH09wu+ngpO7HDABfHU9uXeAS4IWgP
	MhN85IZVBYDJJAyQfsf/rcLE57ADAzcCU+rl5Q0MuzjNecf6ZjG5qeeW2Xk57cIyJ8WwA4TOXRb
	9UxWEAk9ns5D0uYRP5YtBl1+A/aFOk70150dqpo/FNxyFLUT4cyhRfd8RGzfQYaf8pU7iGm4TGL
	s2mNZcAH5KzHvIXMHzgiTVWlGavQ2qhmQgmOr8ydx7GvOUtdLNMI4HMqpktz3UKtMTsphgRtCXr
	mpkSunok6SnbQGdnjW4HYqP2JnPW8RM/sQP/5h84z0MrzQPXPDjK6/KcLRu+VZoLosicyMsOF5O
	bXBKoQERQnxzy7jnOLqbfUio62wNir6LeW132Jl6n
X-Received: by 2002:a05:6122:46aa:b0:5bd:b0de:a736 with SMTP id 71dfb90a1353d-5be907a7dd5mr257989e0c.8.1783344050529;
        Mon, 06 Jul 2026 06:20:50 -0700 (PDT)
X-Received: by 2002:a05:6122:46aa:b0:5bd:b0de:a736 with SMTP id 71dfb90a1353d-5be907a7dd5mr257980e0c.8.1783344050114;
        Mon, 06 Jul 2026 06:20:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:19 +0200
Subject: [PATCH net-next v12 4/7] net: stmmac: qcom-ethqos: set serdes mode
 before powerup
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-sa8255p-emac-v12-4-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6uetN8tQ35/MLf6WrNwnnyMDIulOdtwR7ChU
 fVGHHk3r0yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurngAKCRAFnS7L/zaE
 w8OHEACRZI6ADieQbUC6leO3XRgj+gxRGg9lhMPexr8/DmUnblo/bE9rhFIw9azo7F31pSedXgU
 S2ZoMQph7d2IdVgsEFK68vmpeM7kbfHOmOspoTr9OTFAFVAYFLbvrdnvg31npbXMuipX44t9wMC
 z0+KpQSH7EuJRWn/0SdKx0hpl2F0NLAZBBYm/mOkxDC6oQ98L9KSVeAiZMTA2QN2e7RN3b8i5Y8
 +Tb/X2ZVbZ8KzjhAlymhR0hTk9QVAqHuFn+v0A4lMylebluozCzeMmS0lnaJoUAtkKBVoSGEZWp
 f7eVuChzu8R/i7CFuQ1d1uEjd4nCrXvk9N59kEJBCfVqIMUpcEzqt5Ud3i+1EvxEdD/9I6kTWIP
 Y1lgCr4T+O1AWH+b73x4EX8ls/BOq9lu0fO7MKzfbtfBIooYGgt9QUdToMMAQo4UTIIi/ceTYVu
 v72RM+zndt/2RWOsztsZXIsL3al5/9bCuw6E5b/HCWspMa0wbY00BI4wjanae9j4xJOKn5rLcx6
 kIEAGq+V0wVSxA//bEl3l+PDVS4jmieG559Qag5yL91dx6yD2+rHPj2gZCqzne+G1SYGWadfHDF
 676mCUJMBbrWaoAvNa6yFRi/PFlYGtxv+3Y/FSRc92uis4NqvNkI1J7u6XwuXAnF0UEbshJlPNV
 Cr51n3bq9Qj1y7g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 6aUZv1xqA0nHAVsirFr3rd0_XH3ax9OK
X-Proofpoint-ORIG-GUID: 6aUZv1xqA0nHAVsirFr3rd0_XH3ax9OK
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4babb3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX9FcjwiQOlNai
 bDI0jP9NXvAq7fV0X+hzpBW6ywRTafYkW65Dau3hwTRiO3MD9ufChR07n1Yxc0a7myUyX2sKtjq
 HxX9fi0UUGIJV89xclIzOJw5OwIlD/tnYgXuuhsvB9rNPfUZuVgNAyBqsWh5/FPxHlRbEaDlviK
 xtnSXP2LUHHUseWoKgTBOgSNRXcG00vLo+laQzsxrW6s6ahDh52k5j5rWlQfek2QuuvWGEMQF2e
 MqNGACQvaTMVDVjDsmQTQMXvc2yjv7nVt7TZUrFdbZe8wkq+qAMbiM0/dpDawb0hrX1LnyDXTGX
 tAH8VP61rkpFAp5eYlQwrcCfoVAFs6C6Y5FWSm9ollyMIS+u1YkxhQUzcpmQvznTZc1rXGzcqLg
 ak2CRSiY1Rl7gv3xdZd5QtakxvvzErqDUbBcebjFmlQoN+OvwSkkKJ0T/TzPBJONtCBzevX6D+W
 z+gZDUGTOmQhBJvC5+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX6M7GYWHmEKoS
 Xx+a098xwf+fgeeiNbAOIhcok9enewf+Ir7fydoVGIUWeqAoePd4N6M68b+/grRvtrv3lQoPuPz
 OcnDGMgRtMRthDRPJD68MsKbOktuPUk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136

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

