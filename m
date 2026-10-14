Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228B84EC671
	for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981441; cv=none; b=sIzHW2Cy2IPi6G9uCvX4m03wm16/po3U2pAnQ+XxUpbj1gJ3B9GeuyUjkQjN4BG9K0w2c9Gw1qd3qvfqfoJdVveSxJ4ghjnGTPBO4DjfaYC2Ec0hLarGZcW/zgYgyDZnFjmjGJWSCEwFI97qP2GYXSe/0V7ytPRixvS7AdWAXms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981441; c=relaxed/simple;
	bh=J9yeJClaAz5Pqb+CQAyiL1LQKIlwch/5HMt+VwNv+30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C0HbwTstSoTMnvvK8rx1ElJQi5BMH7qWWOPiBu2OoSsjW5ZJ9LSGMGGnxSGME8bXs/uN101PAEJdDTbAxDJ4c0ZVHFE8G6thdcIHsM03zoEsp5RocJlajBYOLr6yrGJtTG9Glr18+gFNZ2+MkL5blBrbM6BkH2oQEOTqMCykV8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9h8osMa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTaiuVRW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9h8osMa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTaiuVRW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8jhBP3000893
	for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 12:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HSpZvDklAuE7Px+3pmBQmNRMPaP/hmhQOnKgPjG2M9Q=; b=X9h8osMaq9D2iy0z
	2PFcQUD4l7Qq6HwRsE6sklUHygN3xTYsLtJv/3QFURff7GmrxJPUqFa3/taifgY7
	cor4ZebDvuqyrYmKTP9av8sjIqANT1vJScz98DPcCpIo2MqH0bXGiURQGyRyPesA
	sQ02BXTdCGyED5WI4uE2KVkDjNPPkb+ytUE7GJD9RYmATyxLNCW1xQ8IrCO2adG/
	ZKTPbV3JXkHLgG2jqz+1p4eKORYqG+rFZHh5yqVhFgfEQyMUOzOJinQ/xAV8ORr/
	1CpcI9HFRGnVIF7zfV72FM0xJ1MpNH2/ok8q4RGSAkhnYdVqcTUjfd468+0oEiqq
	JU9vIA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbeuxbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 12:37:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e834ff4d0so1109103785a.3
        for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791981437; x=1792586237; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HSpZvDklAuE7Px+3pmBQmNRMPaP/hmhQOnKgPjG2M9Q=;
        b=hTaiuVRW8HMDhcUJ0+fxDo2+MCBnXfo9OlR3q1fA2Cb2Bx3RiBkChfAB3A5zXpiU0U
         Hnv++gLyuOY+GSbIGkbSld2v97/t50vPF4d5Iv8C/ab3DQPfXtKoTYVfBorfhqFdj39J
         e0Iow2pUy4gSCB8c/yTC+EXIOURX+UHORVzIx/wwbzqfizglB6mEf6NH5hSomgwXOxz1
         dRn3H0W+NS/AvCVPU+W+o9BlIgUbeJEGPDMOdWZxOh8COtyIeobM/qoUXlS1Ev7WbjVG
         Xkpde8ONuodD4vrAHa1bFA/fH8c2VZaHPeqHbanwgklm9nev7fyKID+dRg5hRcbs2dQv
         o6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981437; x=1792586237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSpZvDklAuE7Px+3pmBQmNRMPaP/hmhQOnKgPjG2M9Q=;
        b=MqFR8Zg3NyyNYfVHiWJ8hgof2cWTi9i3aYlHBK9r9yiiDIgLxfGiC1jqM+gpxY4NfA
         qgz0zCYzkg9ACQKKy6BRdu3tbWyKg+z1wLFcFyV8EWyYIgdE68GeruxAmN+jYiDezszE
         SBmDLQDv46g8nUcb8iX37/cx4KY3iOjwWechQ+tbUOREnWLFNcyrB0Q5jsDV4mSKA4sN
         Dh0ExP4yF5Tw24fQ2ShChrodqoC/V3/aejNetOo/5RK8V44X8HlYyvEH52hRpfeCFGoV
         hcEvrwFIomQrRzdWF2qq1l9Kuoi+UAkwXDOrHgdG7/QFt7uVzpwzwRJrH4YJlp1DcZBl
         IuXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwy0XcqY6LCpBp/S/MlAZ3uJHu9HnWCkGw0u7F6BRdMnjbxqx1ffF4JqbcX+u9Ou6aQTml6qbw=@lists.linux.dev
X-Gm-Message-State: AFq9FYLlJm2KKmFGZLQCq7VFSIa0YKsa/ZV0Wm99we114v/o8OGSEC7a
	70bvCOwEt3hezNma9HCFAnIDv/APhYmBEQvD4dMvn3xF751SZZNFq+tAZyx3ZX6MI8BiTyFVRuH
	Q4K2VaXNh6unrlLAmR9Wrb9VCTuoxvrB74F2Zn9fRwfO6oV9Zowjl18/wufk=
X-Gm-Gg: AYBFou214CcphEXrOdJkBzIpv8INsX0dumN80Nib8KqM3/Bb6lYdS6iZGldJCOL8TAB
	Ssh0WimGRnX+zladfpNd1OLHjhARdbD0RttYY7EN06AjyuEci4Lj2e9qG1/yeCQwnZ+NbpGEM6N
	GlIyIXRNjImoBxgKT9gphBudt860XCv1MXkLjRT6PwEd33/abI7k2mSj5Nu+UnFdmez/CHPOwP6
	6+Oc5qIr90WYxrTel5iYAB1z6Kf7BAmROuW1ApGmnqxQdqWuKxk6XLQK8ekux2GECIL08XSOfxm
	bOQI4vPTXilCuWQ63SbKlkIYgJTw5IpjVXjaIKhpp7H4+zAa4o8lZ3KpnPJRBLutinVOGjgzRjV
	GctHj4c3KESttHEKloxKmhpHIro5O
X-Received: by 2002:a05:620a:4611:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-93ebd0c0178mr2571768585a.3.1791981437392;
        Wed, 14 Oct 2026 05:37:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-93ebd0c0178mr2571759685a.3.1791981436618;
        Wed, 14 Oct 2026 05:37:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm206122615e9.3.2026.10.14.05.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:37:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:36:42 +0200
Subject: [PATCH net-next v16 3/7] net: stmmac: qcom-ethqos: set serdes mode
 before powerup
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-qcom-sa8255p-emac-v16-3-0266c2ead980@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=J9yeJClaAz5Pqb+CQAyiL1LQKIlwch/5HMt+VwNv+30=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz3dnI32DHykdHRara4SxS9EMHllBi8RbNpVvb
 4nM9bknjESJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas93ZwAKCRAFnS7L/zaE
 w7dVEACYXQEJ83Q/QRV92yGB7cs5znjC4RvZ8Gfcv+TeLoU4qXA+kMEYugpyaPG1/YjlURDT2ZB
 uAFF8SeBV8Ul11R3yaqpMOdy/Hl7TvT/EtEzZ6o4dzkfE58+4KvCKwJGZiv7Kd8yfw6QS5+a/Lm
 JKKUte4f8WA+SI7SpSpXO2blXJ40JKryYVK5Dy9F8cFK69kDBxcOC0goo6+j3BCbH4ZKku0y4Tv
 HeJ3OWXpkVz2VhcBFRQaWC3sDZ5KsN+DSaQfxTNsgnjI87WXvtyR0M7msV6/0tqCSoIDlN1RjOT
 6JuM3kGD9PqzYuwRy7zmFVsVpLou1oeZpiQqHwjBPHYfgb3SHhtRI4bqhqCvmgqoSWuOF87veTz
 Pcs0S5b6MwESHuClnn0DEXVm+/SOqqMcDXz9BHQERa3gYzglJxWogGmTU2ALIMst4s4GqhuoJ9l
 zbE+Y5xRLfDEJPwI3Tv8OJVjNwhUe8PwTqsecOd2XC0cep7xtLfwFnFmlXJ3b/hLDdGxFzkhRv6
 SGcerBJ4NUdI9sNVqm2xZJ0aRfmhaw5oqL7FnYYlHX6NQsHMkiyiBC1Y4LNYg1vQZ40YDfx5Dgo
 gsQgc+L+xsjrtl8c/6ZfmSizWS0cJ3hykju0KOVf1Y0iqcifh1Ug1TdZlU6TK+tol6J7O3QeqRi
 SK++5yF89e03Oxw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: YaqN7ihbEZlky5GEz1mIic9SIGjGx8qO
X-Proofpoint-GUID: YaqN7ihbEZlky5GEz1mIic9SIGjGx8qO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfXxbKsNh8nXcIa
 TkeGMzyWeRQE9qGjiGtNz3OEsoWFupSWRbjnO+FEl4Kv7Xb1TAtgN22uyXIZgRP/x+6JTO+dJPQ
 LuQWp4yrvvUfsKD32m+pYMwSxnqr9XkB9LHAluUJObQvOmTTL0kcti1yjdVxToPUUQs/1o81Gib
 TITzxxVR1wKcLDQpIk7jRPe4p3FXH9nhqUGWS/H88giB03JxvDaTIRaVimZXsXBR7Z1QhHAg6ku
 PJUG59lf+ZgeqFGS8swx33v8WLWMv0Sww+BPbQ5X7NcS4K4vqYXOb8tTbKZEQ9JuPIvJouNzpiw
 zM7PAkymB8wQkgCDJ/OjGjhfXWuMNp1gJX3mSVf+BUZPb7AOG1y/2tfZz4t3J8GYQQm3ltS5iwH
 PcXsJkArlPk8hkMEGdYQYdhqlKX/gzLBzYHlrMt/5SD4MJanm3RmfQ5mMGbQ3GAAPr0b+yHpu3u
 X0kukX4O22olJlEdBAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX/DdCcZ+JrqGD
 BNjlScng8gDY+Q/iXKD/zs60gbddFH+bkn9FRJT6Pv/2uEO4W2HRqcWM9xo07n86NXBdtLj7oGB
 7xs7LJ/oVBGl1hCyUaaXe6wCc1jDjWI=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf777e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140050

Call phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
SCMI systems this is required for the PHY driver to select the right
performance level - which translates to the link speed. This is done
ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..e2e611a4d2c06bd567e9d5e353b3a4893623de6c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -601,10 +601,22 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_SGMII ||
+	    ethqos->phy_mode == PHY_INTERFACE_MODE_2500BASEX) {
+		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+				       ethqos->phy_mode);
+		if (ret)
+			goto err_out;
+	}
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

