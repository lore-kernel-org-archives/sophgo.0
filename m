Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE88337F01B
	for <sophgo@lists.linux.dev>; Mon, 23 Mar 2026 13:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272094; cv=none; b=Ik1LLeOa5fUyvKO9lUi3ebEkkXb8ux8oo6OEOxttc4W3plL3hP8ro2VgilEbV8afQcuo7tmjLieBdLeCPjU4bcHwPSIN/2YU6U/y7Wad+IFNdmkuPfTqyUpdNGHibHUVQMgVVXpz1wAsZzpz6dCj6uJb81RJ/k+n3DVkzidhm8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272094; c=relaxed/simple;
	bh=fbNtS/uHH7i+GRvFL8DqLP7cyjy46QeuA5MPj1IWrU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SQuHKlJMaajSvMXwSNBafaj7aLylMTXtBwyzA2d3028fHOFr2wzu4EI5UADMHdHgpAL1mU0sluaUr1xzJhvDLqoOUX3G/5JezajWj4+EYkrT7F7qYzKJk7sjmgYEunhEi145KOOet8NgnvVyaTbsFnjTG+/oFaeJRF0QIQRRjt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UbFh3hgl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XjTg45wO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UbFh3hgl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XjTg45wO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tkrw1627278
	for <sophgo@lists.linux.dev>; Mon, 23 Mar 2026 13:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=; b=UbFh3hgl5FsVLM3B
	sm9Hu660ve6IIfQnn+MGoS318CqYS7004KEd2g+JiA9TBEaTA4AB0j0lrCREtzTK
	kp3p52jOtl3brB+7oxWbJP9czqVkJv+xKREZbLHfPyhYe0WsvVIkBSGxQJ7eN7B6
	qsqJLuKNoy+TrSe3YWICA15j+LRpRXtNB0VpDVmg4CWyJxckQxM1H6mHKmNb9Cuf
	78cmsiKqXgvbA2rLptc0GxCuC9RRCGC1QS3kwslCdv43rXULLwrUUrnPWuNjrzFd
	gmMgsD9mM/i2z30FMJ34+tmBV1mmaZy5G4OeVNvu2sceQQutJBgE/BaThgn55pqc
	lxkS1g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc15da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Mon, 23 Mar 2026 13:21:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b274f94f8so311529411cf.1
        for <sophgo@lists.linux.dev>; Mon, 23 Mar 2026 06:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272091; x=1774876891; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=;
        b=XjTg45wO4z7NmuG4M5MJp/9SUmGFxCHmT+vUT/l1gb0BeaeaTq3ueFM8UFOvoMs1RH
         rB4E70BjkUsCh8Gb1kAY7lfjEGeCnWh3/7kC8NAi6ivHkAA/5UKk/wdkZ1MYGzvOnQJQ
         6ninVWAJgbVfj2i996lnAeBgjNF8WAujXq0ef7ovefmKz94tEnpgQ5q6dcqo1SrVCn1k
         oboFmMAdGjxMw+8MZfnlwdq5oKMpAMPvfedlU/0RkxdV/IDBBZFjsGzZWZEZ+pN/lvhR
         JDS78AFxvHrgANBmuIxIFL94qzikIXwShtsoq7T1YML3GxfvjM59966W/6GGOK/YtkfB
         SMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272091; x=1774876891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=;
        b=ZoafSv8vT2qorN7QIBXiAid8zwSMmsS1m9ii7Fxuf50PA479iOk0aWMcCGEmpD7Cvc
         1iepVt7840F8/tZUy+lefQuzMKkcNmQcZh60fVJQVsZ7+9Dt1D2gTOZ+d7zqnkCF2oHN
         Tp46gqmZzwMXAtzgS889IjMbIGzIpHWDxWE1fF0L80BiRprBRIUT0US0/GFjzb+3O4wa
         3BWOoGBaZsvUrbvd8hPIlN93FlKWEZ+FxUoaweWgsxEX884TE9ZAxmYZik1sBJdOCwHG
         Y1ZnriLY+n7TDBmCL1zlKNtiIgQeGJWht4fPXVdp91CC12r4cmGvabr6WdZ0NHF2/hRc
         KVUw==
X-Forwarded-Encrypted: i=1; AJvYcCVNyrrHuC+znkUCQHmUeIo79tnm3rrcM3CK4isLO/xBy3k3JcZHaqsuluUx+6s0yZHfWGxU7hs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDevaPAi2E8HP7ZoVuYugfWphh8s+kgAIhXSFewzJrUrG6alEg
	gddn4KLNFqbmyRn6sK9M/WwSACovoR7PfLSqZmsQIDM/p8dQUnEfeux6Fs6uduspreGJbd668l5
	pR3fgCHN+dsGk4edzy+Oft9khNj015ez3q8UxhHDl4HBhfYj1LzmfY1EhcCE=
X-Gm-Gg: ATEYQzyGo2T+J6BufgJxOWQh76aqk3t0WZAw/iXTo89270XCn4NrDCXd9/ztvxfAJ+h
	EpEBigYTeIxzsiYkqnCazGXeL1axlJSR2rvUPFBheUkrKgCBILzqFenUJDyIVvOmPqtFxdr56JC
	4c71SSuobUO1hHfnIsU6v04KMER+510d3o0UsAtjAHt21YBiQZmscUQH3D435qJiSPKmNGP3tXQ
	dfOz2t7YeruT+Wlt0Vb0FiEKYM7By2P9Am7fs0/mWx7zCPLOezEs7D4rheSzxsQKNsudtX1C2Jx
	BHwYYfsoBt7++JApUQDRgsG257Kz/wUY7WXZMZVnpBNYasKmrqt5fERURHSzFc1GUEzENRbfPU/
	+qcjJ5IDlfFYU689ppPIaB8+9Tgy27LhkpbdrlgCSGOkHZnuPIHLh
X-Received: by 2002:a05:622a:355:b0:50b:4262:763d with SMTP id d75a77b69052e-50b42628ac4mr150309581cf.0.1774272090533;
        Mon, 23 Mar 2026 06:21:30 -0700 (PDT)
X-Received: by 2002:a05:622a:355:b0:50b:4262:763d with SMTP id d75a77b69052e-50b42628ac4mr150308571cf.0.1774272089775;
        Mon, 23 Mar 2026 06:21:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm503102066b.4.2026.03.23.06.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:21:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:20:55 +0100
Subject: [PATCH net-next v10 3/6] net: stmmac: qcom-ethqos: wrap emac
 driver data in additional structure
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-sa8255p-emac-v10-3-79302b238a16@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5840;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QEjA6ztNoVJqA2fzdic1acw7AfUASpMj8dS/VFE3Oks=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwT5IjAVUbJgLZzOY99SxIeC1HEhMu1hNYF6zG
 HWHluc4O+yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacE+SAAKCRAFnS7L/zaE
 ww2/D/wP/Ex5W2woGWfDOP2LjxhH1VUxu0Ohs5tocx+8/G6QG/C+4a2yI1IUhY87af7fFgWFFj2
 dAthXs1FtkgQKiCFv0F+vPVlLrKN5UqibTQYyxg9b1YoC4WJTO+YETC/JUyCNnFq+QLBFUiA89k
 5HWMANkFZ+7OhxrIVsMoPn6Q1gqkjZzxb3DS35OEOcj7iQMpYtH3P0FOwZfzK4i4Trp9zvUNaY7
 bF5AY5sD3sgyIyHO6STeWk6gIGHdS8JHNxd7e2Y1+1uKT5D3K08MAEO6vdEpgdyvOtbplZb2gez
 WuY7WKFO0gBEMZ8oSAucg2kVnuQLs9HaBXo1jBzfHzUsrULK7fKZfb/0VppKFtepnIqdPrTM625
 RzZL029h0ZKEm+uQmpj1eFszVW6RguALHttCvhNMkBm4pndSKmtENbx6vGDwTUsB9taEBBZQ2/c
 EcHM/H8PGRmPTZnLtEqsqQ9GsOlrLsVT0nVE7k5Ylxff9yc3cMDI+/BMiriP1r2jSVMX7/02/sD
 +2z37I71xy89qZy+laKZPj86GmdgE8S0iePy+g/IyXWsgTzD7ffAPEzN4GdG4ukCUi0W7aCupA0
 +JffBph4I5CUJzHPjC8EuCKpJutok1MxaV9G923sVU0quAwrq9GE8XI5erwKaP8PqKv7sFIN6XE
 u7wQ1WUZHJR5Ahw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c13e5b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fYgtqwV50X64hY7jBhMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZVqdNxH_rfbmO_Diso28Dd7N7q6Ztn2N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfX4w/WGwPAHoNb
 gr+9h9LD/jeWN+GdFrk5sGXBRfgKAm0T5wGXn7row82QiHmgIa4BFHEBne/JBTasb49oiy+7Yg/
 GMgFaURiQGiwF2sneIgj1W8vK1RTK3s7QaDJaUM4LLpF7nxsTJIBp8baUNs2t+NvfnY5f219/OF
 p57rEbbZLozk9Nh9+hfnG1RcBhP9JXZkYHFD3W2V+1ePUwUTDAiqBR4QpI/uFM/bkUOs8m6pg+j
 BLCzOjhuxFRe46sMIUb0vFtuZ7cQd9ZNToBpvZ1AECE4uuZEOqWZdiOrX8rMSEg3Z/RlT2FD9FQ
 W1j1S6B/2o98fA9DOaSNgUBP7nXQkCqCcbR2odVSfpdc6CJR8BTX5XsAsE5aFH3G04wA3sXvY90
 RpRbEEFgtal3dDQzMMEvO50EKzLYfEqZH7X9Mcsm3fo2qm5XiQySRSc0GrYZcivvz/8Ow0F6b+J
 3wVBx7zxno3IdOgjdlQ==
X-Proofpoint-ORIG-GUID: ZVqdNxH_rfbmO_Diso28Dd7N7q6Ztn2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230103

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
index 66fd2ed2c2c8428694c07d89220d0e1608546791..8fda6c128117d7f5b1dece68c919f2a09a511210 100644
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
 	plat_dat->pmt = true;
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

