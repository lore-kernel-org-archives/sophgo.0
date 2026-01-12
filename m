Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92ED2C21C9
	for <sophgo@lists.linux.dev>; Mon, 12 Jan 2026 10:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212989; cv=none; b=lqRW+GM0+YKsOts/tLWclPMfJzEIqQx9IDUFn0fNEs1F4RInxhzHm+C1tugKwEVfFTHVml1XP6Dje6at23fNlTs80xFwiA4nnSHW/JYcMNbTi72nd7pVzMvFOoG+V27jJ2xTn0qlb2tvx5hEXutfl8HHvQqmxU006Kl+1ojqlbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212989; c=relaxed/simple;
	bh=ZfN4GLyjp0mjiV3ESbukBe5w2o299Tx+Wp9XN5V/wEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+L+zCT14hA9SVTD7JtEwOj2+VZAP/VnH3ceK3Dqi0UWeWvT24JHplw90yXgPsC4elMQYt4oBlIIQCGnZzeVjb/SJBBJDQyjmJydOKDR1I51uAzMbqH/NN5RZPU1XkE9GsLcEZIVVc08Mu1PVvJMmyufCzDrSbJ0WeoAGFLjakY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGZ+YJUI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q36MEpTB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGZ+YJUI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q36MEpTB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8BqTF1387412
	for <sophgo@lists.linux.dev>; Mon, 12 Jan 2026 10:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3CANCoZnA5JFEckMdXBmY1C/JzkS+TKyANzWnvW0ps=; b=kGZ+YJUIz+BF53tj
	DvtCbErSPxhCkQJ3S51//Fu5hVdEClGBAjycxAtQBf8JqCDNBvVXObaLS+L9BOGt
	D9v5c2zALBZ6oyBaJTLEMPZgpBHueOnWBMSVJ20KzhoAFbs70PCftqnfOf3OOpMR
	+g3e9wVNLQKkcDO0WbV6iW1ZH0Rj3iacgMDRE+UG6D2FF27xPbmlJGz9MpmO7IrO
	qIJaV8AW0VGJx0Rmxf+gkS+EB5yEsAGaa5s9j8kYxQ5gFFf/I9r+dGJY++BpdVin
	4S0cC+By/0CkSHaUnEaQ8zmrReBGWH4uYA/SCizCGK2krA/eC3wqXNS7uEVX6kLW
	+dT8AQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxfvgab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Mon, 12 Jan 2026 10:16:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c2a3a614b5so1430152985a.0
        for <sophgo@lists.linux.dev>; Mon, 12 Jan 2026 02:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768212984; x=1768817784; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3CANCoZnA5JFEckMdXBmY1C/JzkS+TKyANzWnvW0ps=;
        b=Q36MEpTBgzRO8jpB6CJsKYfk5bwn+zQ8xNbKN6B0LtHwLaxh/EwIdHjSQSRb9oZnNb
         Oo+NKRDkRYLcFaeNBQKL8oKTiIKhTmHRgIPuUh+WQdPDpwnmMoBjEy8OSxw6rAxi0tvc
         q0xqsrAx2WtScep6RGdxLPF9m3DKrbtHJuoLxmJPuOAdPB6Dxr2Wod3UFTEePnuGGn/r
         l8Jbn0o6okWMVaLMUpeVqmxqmLiab/EPBQmimZb3hW5UEFx0j7c2kp5rTMZF3rxh7UUc
         eKnQ5yg+pEX9nrnCMtQdSdYqNbCMm+LaXBwEa+9CXm2quOXpqrQZtv/5d8ZYfUSr/sqa
         bLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768212984; x=1768817784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u3CANCoZnA5JFEckMdXBmY1C/JzkS+TKyANzWnvW0ps=;
        b=rY0bMjZHDVRKM6ZZGxgqrVDxtI3i0q3cOF/sv+PPa3QqBRczuMoBfhO3gYzRABx0jb
         JiGbfGxSlZ/7PFKlgvsyMvHr+bR8T7o5VEShMqymZayzKBYCAiF8s7TalWOdf3clYXb0
         wQnP7jF3EJQJFkqKfAGd/xyhklc8Yq7VSJBCCUE0Gh8BW5ze8lMso6OrpyxOBNtMyQhh
         oqtNhYuO4J18T1ZEwC28CfNGbPPfQgnEO9z/gm6jg75NSJ6byGfnhclCnifWD4dgPGJ8
         IAbWgX40cbxlLwd3cuZVzm5hm7RnsHZKt9n6tAaPyCiAvHyZpHGy83KJHJePC/Yt5fpa
         i+CA==
X-Forwarded-Encrypted: i=1; AJvYcCVmmUdu7S2hT1ceuVNEI6xSVJXZXiTD5ZrzCnG1sYD1uBjrf65pzRDdqP4f2VS4COQauimIGrA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlN/T54os9qaKUa5YLhlycEN0teI7rVWhKDayqg5fFlC0a9R5W
	7txCP92AZIzIDGLMBKO15D8j1LIrN1tkxG1oovdX9aa3jI/zGO8eS/galdAQcbiXxg2fk/qJJaE
	4aumZw0rb9fNaQAxt2iQyUygVF1Hh2MDNrv2J8LAvU7ZoG5w6pocRkH14nRA=
X-Gm-Gg: AY/fxX5VBdjN2aFRRsl2b6cMXCksku+FubqtTH4bRh+VKJJ5iV+WWBd3iQbRYJusWOl
	vN2aMSTItxic8boAtkvfou5jK83Zz3DDwiB0q9GqHDMJKLRsQmoY7yerdIEENU0O2jJpVgP0Wha
	dTgWOKj5WI5N4BZSBAPw7908GTU0Hxt4XMsTgap7mHkyo+/JVVAzyb6BlABk6e9TnZcbX35HIhz
	PgmxH5m3k8OXhrJb7kMYViselVdekn7bygfTPbtfS57QZqj3BTnJNAlBpxq+3zjCOkm3KbnvZXe
	5U/dra8qCYeBCKZnaa1gqQGSG3sQ4Z3RxnGIi0SGxk2B8Am/PxZEfypPuVB3ljNy+JFhay5Wbwt
	KHjVT1OVQTXDxn5jzF31GCgLTlEtiTvHzUnkNYQoY
X-Received: by 2002:a05:620a:172b:b0:8b2:eefb:c8ab with SMTP id af79cd13be357-8c37f4e8521mr2840672285a.19.1768212984069;
        Mon, 12 Jan 2026 02:16:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm1+BMB3wcHY+CfBZCzxk3TfmnwQG4rssPyIYg62GrFRai7K9ghgpyZ0S5lhQa3cL4tO8HBw==
X-Received: by 2002:a05:620a:172b:b0:8b2:eefb:c8ab with SMTP id af79cd13be357-8c37f4e8521mr2840664685a.19.1768212983551;
        Mon, 12 Jan 2026 02:16:23 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f0cf2sm126530355e9.3.2026.01.12.02.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:16:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:15:41 +0100
Subject: [PATCH RESEND net-next v6 2/7] net: stmmac: qcom-ethqos: use
 generic device properties
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-qcom-sa8255p-emac-v6-2-86a3d4b2ad83@oss.qualcomm.com>
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
In-Reply-To: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2971;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5JRKlaK1PvzHkhM84UuOQHNNYPMck5ucBln5/d8C5Fk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpZMnnyYKxObLe0zkriAGSkbmbpZaPApgDozlsZ
 /q4OAMJQFyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaWTJ5wAKCRAFnS7L/zaE
 w/uoEACZYn8RkTNsWZELfKwfkZp2Zq87dICjgpuLqzd9iuW4pgU0Uco9G/gXWcMiMEAcOB93IfP
 6V6Z5rJ0chtzBov4JYuo8JJf7JFIuASYaXj5HN0bKm1ncR7tuEtrvuFjXEGgfGtU4VxHtczlaVg
 Yd9wtvKN7QtkeHeYfHwrSYaX2RASMRODw0XRPw5jqr4t4NwmF8LjPGZqYAOpR2iE7A9JdR+oUBQ
 XeeqXJudbQYzEw0Rc0ZA4T/4Z5MtaNhkycar+yuNFZ8nfP76eSal+tElLfjkxWthTnc43t2wLb3
 YbXXmYCIx8cprn++YEi/rkFhSd7i2ajfjZ7xqxKpX0ILeXTP8b4AxBTq0X9mcDVGR8ri599HLgx
 4Faj2vxNxK0xNVqrXxxSYPpmwPxSsYxGzX319xD3sxiGYkEug1OxLwXD62Dv/qGRDJ/9oxjz2VR
 snYj02FtZsOxxvPU6Pt+mZ6hEaeuGwEKWJR0M1YbDmzISLNJFlOp4jg44YK4BDomeZSTIvqLfmz
 gnDcmQKsZT2ffA754kGnRcuWxGLuIYu5VJyNLAh1a/FnCXD0CEi/GSR1G59c6Sh2LN/RoHNaQpQ
 xG1SuFuOtUkbYoJbQN5t/ciZeY6UYYguue3YrDyDthkeWzMdGh417zeMDAHcNLgmE+blaUeUfcS
 NfyrI/chIE1Z1ag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: OYKPEAwdw8SZKOpGOfj8h6tBsUWxvCvy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MSBTYWx0ZWRfX3JhiKDQN7Owv
 yaedmah3htQ87q6M59cCpQmQFplb7M7wcbolEzZmAN5xc5y2mWkp2pRXT+euBwVvNrY9wZBgq3V
 kAnCigpfcDC8kMKKB9RiAIgBZNhEr+NwrXxNlvjUdCe6I6IwY0/7RT6gIIiT1pbmEFVGuLYoNKD
 0BWUH2mtPjCZj2XN4275lmBFQu1bFER+pEG8wrY9NQHaCIoAI0TqiH/QRhRkRBCr+eEZgvFj74H
 azJC3Sv6jK7Fe4J5GQGmTmgC7FwhbDMIpBII5vb5jp96+poMx6XmXab5Gyq5J5a2D1Cc9B9yXIU
 /2HJLxC4Cu7B6B8D7K0Kx601eLXwjcLdfgLOu0ZLjIuE2zCMh1GPSWwz9bUCtSePjDC0SwY1ram
 J3JrjWccXE1iIHvU+2I06rKv3b7ZUtOF7vHlx/d/Tyulo4DgIzT0OKMtam++1wjpWpfXsGANmhI
 uHWvrYcnP77Xxzvy/Hg==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=6964c9f9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aGGWjMbO5e2og8PNdkwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: OYKPEAwdw8SZKOpGOfj8h6tBsUWxvCvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120081

From: Bartosz Golaszewski <brgl@kernel.org>

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
index 907fe2e927f015542b6a7228eae9a6c6945be3ac..1310312e3e099841da89d2f19b138b4459ecb504 100644
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
index 0826a7bd32ff55bef62f8fda4e3eaef64facdb5d..457748e5781231680b64382fa73e195cf7473924 100644
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
@@ -723,7 +723,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -774,7 +773,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->mac_base = stmmac_res.addr;
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -811,9 +810,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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

