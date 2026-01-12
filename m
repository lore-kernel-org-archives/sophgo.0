Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107082C17B3
	for <sophgo@lists.linux.dev>; Mon, 12 Jan 2026 10:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212996; cv=none; b=rwYc1cgGVgfifRtFY6EHsVQ5Z3B90BMewnKwNV/jg/2e92ikCwWoS1jNmFL6hnVALz++7Y8yVWnquth+m3J/6lL1GziJZ9dotGXU3LJzTrkYWqiDTgcta5pOlVBi5cEjkwQ3Y2YbjBmX+Lp9/xvIsrAmT8DJG2KvIbHEX7L5QHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212996; c=relaxed/simple;
	bh=jEgAybpVETf1wU8G3/LnbFjI9MGWJ7atKbSvXXLyX/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ff8zkcgusQ4HofHUcpMSCWL/I4FeJBWKz6ycM26KUNil9vtJxS/ACKaEtpe6mTcHVoXkrfZIY9EycBLq7BZEcuzwF0Rk63gig2S85rOMANhe409oyIBbU7GYw2+/3naD/NC8EehaKA0VHccgpQyf03bcoRZGIxHlfFPItBhzoYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0007oBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqFqte8F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0007oBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqFqte8F"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8ivs1113479
	for <sophgo@lists.linux.dev>; Mon, 12 Jan 2026 10:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FopvU/uHrAiCRaPlRxkzQ4E02U64mEyQRO/C/UoGdLU=; b=N0007oBLwnURoYhN
	eSYRJ4CCvFTU2mFtVbWaO7sNK4NRCixAN8QoncTc4fLdXiLjZZ3LtLgTWnvWrKD8
	2hLiwLXnneWDrCtEL56DCJ1Tf2y0cQ2pDGVUANH0bOxBMOWZWsNeOr44MImXIAft
	qlw7O6MAu2yiklecld2wALs0aVsMod/IUS+xt48koG5fJ00i9Rf1nKk1E5VODoYj
	TWk/wMOFgViuKE5s7dXvMP2D9Zc1KwTPcV68eKK/vOxoIug+q0/qWhvQPT2vPfkG
	RL3+Ww9oIoGBslUC8XtEo6Goh+Y8QdhgSXb+VG8yKTFp9gVkZd2BNj7WpGicdwzh
	zzDOIQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4uhbdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Mon, 12 Jan 2026 10:16:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb3388703dso2563288185a.1
        for <sophgo@lists.linux.dev>; Mon, 12 Jan 2026 02:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768212992; x=1768817792; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FopvU/uHrAiCRaPlRxkzQ4E02U64mEyQRO/C/UoGdLU=;
        b=gqFqte8FfYpXqTGEHTFeuoT7pjmDdpzI6ryg5ABidpXTc8x/35Blmhxrxvu1zCjEc2
         b7DIAptdvAXHnnku5FEzeuB5Us05PBlRM3HhmYII20j7HTMLBG41e9+n/v6OWRmtzh1F
         nMteRhfKGhC0vyzYvbEZCyAKML0WwNu7nyIxYsNFadfLOPVBrLFp9L6914OIbDZq3t5n
         q2WSAIUCkkGEQXRD+p0RRnDLlGAAP9KZjOskEmszo8E3yIjWHqV20zPzU/8sNNFnMrn6
         vvV25Hn4uQFfuxaGlhmIo+OxXHzpbtw4QDcGcvfAl1rgw61l9nxVhGqIzYxQh4JCTF/f
         Xz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768212992; x=1768817792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FopvU/uHrAiCRaPlRxkzQ4E02U64mEyQRO/C/UoGdLU=;
        b=OcgLE0rLJtnLgbdq9UGaBfAE7o1uQIsYlnsYxcuxHQyq6bCHjOIR0eKJyqVj6Rw6QB
         Q/sAE2DpKBSt5TDBC6pZpQd6BtckoOIMJjLhwvT2XpfCNTrnZ7CWYrOwfQYqCxu7adZc
         pvN5DVYGaOxB/8MOZg5CgWL8uDR18/91xFP0mjlCWIZJHMFaY1WuBCIjuDEXm9NWo1a5
         oNpsMek30CfzXd3sNGipryUCdCzb2yNMvP9uYzFj5cJIHOSBxWDXSbDM6nZsb/NrP6M6
         oUJ1iIL5bgZss/6GtVokLUOT9L8bKmyLh1z3rr4K+X2LpQgXHZjCgNb7Nc7zROlR67xt
         g7gA==
X-Forwarded-Encrypted: i=1; AJvYcCVQflh0b5z9mLWMSOBfAcWDzFEljJ6cMuPqo48hcmv7WnhhmWJsYzWzh7nEPrFLGnUdV5rUYr4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd/WnfWWSIQ7b/FBOYJFen+1MQKOi7zgIGVCjIBCdqvir+dC92
	n/Rohtp6Gt1beAwIcDtBSAdVnCVTccgcR0arbMMwhstNU4O8T24WJSbcwgDsJLqj9sY2MnFveXE
	60tJoGcTw1t2hIK6ZuCwKjaFZeTI3cxSh9vBRA9aX+0/70w1VUxVzlaZWufs=
X-Gm-Gg: AY/fxX7/9XGU9GeJGNAAsB0KlEv728ZxNLlz8Mrk2hZW6hLuq/yTBeERv7vkXr3FVJ2
	XACo0T3GwvVFbPEe6yFfpPB65RCr5Yu+5RNfPJXibKPG1wE4rcmtZs4A/L5MjT5Ix3/PRSTt2ZA
	m74eeG2GGbXmyb+L7BPHeGgh5UwdR+6Bo+4veUgKEpbhtkG9232/pt0RQK5gMCYW7G2JdsQ9YZ2
	k/WMRz58TirFIIldi+ClCQ2q50zwD4Q/5AieUapJuCD2XxmtxLAldJ2QdcQDxLbm60OxU7budii
	IfioN4xn5uvh1/2IvadOih8HF4zGJpdDjvf15OtyAOIPfGT9nJOvc1geMCZQ53Wi84STM+C1m1Q
	vnRdF0K4mUBqT2foIQcNeh3+DEgE/UhwrcGBr6i/m
X-Received: by 2002:a05:620a:44ca:b0:8b2:6251:64f9 with SMTP id af79cd13be357-8c3893f51a8mr2447170285a.58.1768212991817;
        Mon, 12 Jan 2026 02:16:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2C3RkdMQFFZ2lWORPuAazNVGVOCtBnDoC9lVD9dpEON9f/Z0WBVt2UJ654FrVQqL6BPNyrw==
X-Received: by 2002:a05:620a:44ca:b0:8b2:6251:64f9 with SMTP id af79cd13be357-8c3893f51a8mr2447160985a.58.1768212991276;
        Mon, 12 Jan 2026 02:16:31 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f0cf2sm126530355e9.3.2026.01.12.02.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:16:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:15:43 +0100
Subject: [PATCH RESEND net-next v6 4/7] net: stmmac: qcom-ethqos: split
 power management fields into a separate structure
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-qcom-sa8255p-emac-v6-4-86a3d4b2ad83@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3515;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SvgO86hvregXRCCIKpnZ8DXQ/gsX+xRnz4fK2MFB8zw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpZMnpS68E6MPAKTYOCCDfAdG6YpdqTFBzJlHYT
 m1XfvKT9n2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaWTJ6QAKCRAFnS7L/zaE
 wxcPD/9Jdw6lE3yxZNe/WKwcXn7j9F43Ct75jwfkHmaXABy+zG9+bJzVfvPYMURVPg+Xt06I12Z
 3ru0MCKYVex90w9rmlDU6EwpPjbjV0KUKl70wPpkXb4yEbeULkgr9QhJKA5fT2ev/bHe2CeqVUU
 U0m+626PDZEKBjBGurJ9c4ykqpLzgywBNeqdXThfbVmR/UWy5bX2Tf4szDreYhsevntHLQFIB7f
 w/EM68rQlxr++CEPaXzTW9MBGdrPtMt7YNadWPmSExAl7ZIZIAg+WmVl/R4zy8CcRP/wyGyytKh
 xyKinAXyw5PpALc80Vb3/h6fn5GY16S2DN2gwMQoeg5SOGTm1BnLjLSBeyEc4cZbm6gTNyrLHO8
 MBYXFAe5icfHNnlYNFCrHs5vnxuliTVTviavacY4xlDxWaaAg1gJcD/jPrgn8FqSpwDkaastAf0
 cQEwBoyqdkTN4gJRvhH6H+thiZWhicampXmqGtQCbv+Pb/V32siDJmNpulXNdnzuDS48k9/CA3t
 zlkmsgaGkezlzg6RtOK1e7JbxarQq955bGhZtcBubwa5w46j3M8pR7OH6w9YINHvqI1bvv/OkDQ
 XS9gbNRTdOJBCAVwmjKS3hzcv6uv3zZFRDc5pLE/CCIgb8LHOhNGNVnpgF1M9jzQETcqf8NAE95
 283LuhKXD0RE/tw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MSBTYWx0ZWRfX/MCB73OaF5rn
 74nNCjfdzPrzIx8/BMhDM6j5+Y0R9i2UFG2HmqraTtSuhan+OCRk/V0+VVmKcVh2AGuwPFxWkCC
 GDi9hAMPbDE/Eup4/SeZMfEpygkCprkL97jtMK1c8I7heDgdsHbpqvDki1KvQk9n9wYqvceAPTo
 DlM9VhHyKFh6qUjkE69u1tSNBjFObRkp20xkaAfchP1rWCUNdnl/BbmrplxslLf7yf3oBk4jevP
 zomK07isztOjtHoUMBZiSQ8v0z4/0VKA1u47HTsAdBbXsmfCWD5qdb/0nw/nx2Uq0bDRHC0HSxM
 gQr5iuMpiHEcCqM35/dTEMvd5wmWZzYnv+dKAekMRyjAVAQf5FzzmI/bc3mOyPs8uHm1GruhHoq
 mdZFuGNraXgYJKAPRKtRWHWMQh+vxmyWNx4AAoNZoOSfXkZynjHxYwSotN1hOcInSr8/QZhAUj4
 /mtQl1lwxwUbC5616ZQ==
X-Proofpoint-ORIG-GUID: AF3ZzH633QNKwiRBrpeKhaprVxWgjJJ-
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964ca00 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=91Jjr3N24NtUYBPB5vwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: AF3ZzH633QNKwiRBrpeKhaprVxWgjJJ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120081

From: Bartosz Golaszewski <brgl@kernel.org>

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e0f0eca943420e24dad4e506e12bbb1eb731b8f5..54458ff5c9108a6255b38677f4de973511b5176d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,14 +91,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -303,7 +307,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -324,8 +327,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -744,11 +752,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -796,6 +806,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -803,7 +816,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.47.3

