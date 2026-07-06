Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8D7431489
	for <sophgo@lists.linux.dev>; Mon,  6 Jul 2026 13:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344070; cv=none; b=JeHYVuEIxLQ24IKMwedSuqwvkrMVTrZa7Xgrfw1H4yRuiGL2iZoF3xTidFw8f1Jkd/q/CCGitcWCYPrkbZXtCA8u4lHQnLj3hKRR9QCtsyr/Ez+E4xhIBjaW2TXtLxQXBSEa/+bUCsmUp4hkvE6CBV8JTrKMkEFc5gS9MaOg0fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344070; c=relaxed/simple;
	bh=zlpwRA2B5tVQ/D/s7B0Bufz2lMNZ9fNOyqanrb1FAug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvxBE0DCw1PdHKRrSND5NiDwjCcU8BvwpFit8fP4O8ZWGZAh8H1Zfm9Y5OYM5tdxuLUMVfQ9ShcPh/1O0LMRlo5Cw+YXarqWtAE9RtWnXf0fiN4PgEUcIWhgrGYHqwl2qyENA5ZOcD1Bt+HeL1d36itu0CG/fLLS5VUafV3k4Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=or4nvSXM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JFRKH1zk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="or4nvSXM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JFRKH1zk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxFhm401636
	for <sophgo@lists.linux.dev>; Mon, 6 Jul 2026 13:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=; b=or4nvSXMp6OqVfrb
	eTPyTd+JNIs5/y38nBtVyWwIiW27rsBdQRdvx0sqzDSt1N13hZdTRnfo3Os6Hc8U
	Y/gk63ZssPZx3V1THQq8OpawsmWcXnUX9kWKPu8qJZpYArT2IiRRxuNPXXcrvR0f
	+7tqkw2pHa2e1blkbCqdhFPwUcX1XSZNNqFS0yzqksjTvbvPrVa8ZbtkuA3Mv96R
	kqAOYnJhAaM1A7UYZBsEg0GK4J5pLn/PgeXTlkEpgO1kvSfFfDeYNfoawKv9eEBL
	JGtvkUNAI+9L6k7Fyx+WBSoZt+2d0I3j9JhzEJ6amrd6l5hLWYDqGzNeaT/hNHiG
	XAl5uQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grsa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Mon, 06 Jul 2026 13:21:00 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5a1912d5c85so3873112e0c.0
        for <sophgo@lists.linux.dev>; Mon, 06 Jul 2026 06:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344059; x=1783948859; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=;
        b=JFRKH1zkzQ/D9E/6jpVhJd8A23fA8zPrHEIZE1cvvKYrkljTWVq2ipx/PfQeBZ3hdu
         58KD0E/YznpQEU3o9VRcVT7yRxHY/rSPKDjaDWKYuAx6gaYnKN1tAFvvvC6shSLH49C3
         NWruxxwn0ZUduovkkPMfIPBmMrOeY4dDg0hDKl1UOV0zHwafyBlT210VPLHt4A4wp8eF
         qQi4miXieJJchuPSTk6r652VrstiS3vmElP3qbs4A042WHTvfuB+zUJ2+A/zYMTxQ5nT
         wscJlqSl6kWz9JRAmPVzQ0BvcIrLnUUMED20I/Moyo96dSD8u6BaEiTKIJjnrJlVTzH/
         8PIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344059; x=1783948859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=;
        b=stLDXPiEkBsaFoBH9GKH1PnixyQm0zxbnfgT8RQ0i3fhQwWC8iZyPH6Xy1FAz5SlOc
         Y4MKKM5k07YWw8kxB4+4/FF/iyDunrrs+GCeFjybxukOefRMsnvedPPH8bgvfJA17LG6
         wMJV76afpI0pndJqCATeD/1mKgUaoklMg269BhHYMmgUyg0mNm3YtSmkuvXEwwle6C39
         W7blI8u+gi2wkUINETVWriohgrvBveRND1Y3lycwMKx+9fXe1JvO+uVTGk1jupuUZ3CY
         j+66haGyDQX3KguXfsf1MK0kf5xQLNdfjt76PlBhK5qgqt0lirGOdH99ADiIG0xvrmm+
         f94A==
X-Forwarded-Encrypted: i=1; AHgh+RqIdh80p1b0ThpTOe46Eom02Je2HQsYvOIqzVhtH/pyQYwHqGy7YUvARAAEAlZnuEqtzlNealU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAKt0oJObdwA9dLI7NnvFT1OSIGm0Ika0biIRANk21zdlRc0AY
	tO/tQx+5TL1QATPQirN9qU2L6ZXpYCw0E2+aQxw1fbMwG68ZApDtT1y/p8pr4gFI90/x8KApl+1
	1rtssOGp8Vi4IRgg/mct0TMmDKJGW42LGNKvybrBbpzC4C/mDHiIPm/A6nFw=
X-Gm-Gg: AfdE7cljAcp/tYICZdBXBrGOt7dYczmsGyYH2lF77i6ga9vBmRHzOTFE+AqLThYSYyo
	HyBu/HXoNzvbSm1SrB+iwaJLDQMEDUCcITTX9gEAMBYVaGBdT0psipyE+2WxrsJhz0EXyy40dg/
	ky6fWXg0PgjZYOHRtsloHueQgtkKfziTLJua/jsyP3D2JUq4ZIH41JRGgz1pyA7g0semySSSBL/
	afg7CxOZ46QPxmj+0s3Og2HNwXL3t/E+iTnnbpds2beKR6BDIL/Tzr9uk36vBMUflsxt523x/bT
	lSsZQN6l/H5N9U+JGjOOapGJqxg3txfiXyeimh/Kb/N6XBeLCjbsc8Cv5iuGa3UT/At6eUWDsIj
	zT2VincT+9DgPCTLPm3WPlqTQNYTCxFAaqO8XGrx0
X-Received: by 2002:a05:6122:e469:b0:5bd:73b5:6d25 with SMTP id 71dfb90a1353d-5be9074e753mr306831e0c.5.1783344059191;
        Mon, 06 Jul 2026 06:20:59 -0700 (PDT)
X-Received: by 2002:a05:6122:e469:b0:5bd:73b5:6d25 with SMTP id 71dfb90a1353d-5be9074e753mr306757e0c.5.1783344058691;
        Mon, 06 Jul 2026 06:20:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:22 +0200
Subject: [PATCH net-next v12 7/7] net: stmmac: qcom-ethqos: add support for
 sa8255p
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-sa8255p-emac-v12-7-e3ab1ecf2901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5134;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zlpwRA2B5tVQ/D/s7B0Bufz2lMNZ9fNOyqanrb1FAug=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6uitXkpHF5K6Rc5H2juaPjDX+WdM0SlZPmHq
 rC+rjBIaBmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurogAKCRAFnS7L/zaE
 w9V6EACRebpawQe2y7q8VZHMF5Y42eILGxBCttoAm5H65PSgUVQIlUwIiie91TITslGf5GkfU4R
 NZDfOFhlHZP8QhMdbPo0XqoQ24wcBD8Q+U5WU908BLcT4J4OCJtcMxuNOp/rdZQE/E93Sv0Hd8l
 OPhrOU0PTH8fhGTchTD2K4tQFgb7pr90RMRAppVv4SKzEiyAUvj0Ul8/wX3Q0nFimqcHscKdkmt
 rbOE3KqwsPawJQX1R0sunanImePVYIuLYlDCRqsd8Gs7bGG7+o3lyInW8dgSXu+lgON9PVN65wI
 mOnx1/MU0yLT4b+RjKoJIYA33MCGDelkZ4HCnA/tfDnSc4IqkBWxnruSz5ISHLkp6sEt3zLNKsL
 lw/xWNA4LE94yiHdgvHNGYEjFx7nqlb7jdBHJWYoQ/Kov5VL2r/XnAk1rbZgJtwFMEn4DrukCKS
 HBfrU5m7X+z4DZ/OZDXgya7jaUGHXIWkEFzxJrPAfxQgzKmnS6ZCrbAkUJ4mGIBXu9cGHjRtUs4
 Bgpp+/XklqZQJ2Ko1981ir6hFumr8jZempLQegHyOBbH8UsA+zWcehfiLbHbBYjDJ1mKUYeLPle
 N+SxIr4y7GDZ1lBVUVVonzUoni7lV8ckMooMvUb3Sc/6osTOnmj5+PxEbF6JTEiBqBxFBHUJDMe
 xp5lM6RKQ6LdHJw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Dz4Z2falFWXilwVOu-Og1S3qA_BJvR1Y
X-Proofpoint-ORIG-GUID: Dz4Z2falFWXilwVOu-Og1S3qA_BJvR1Y
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4babbc cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=RTgpwGSXUauNkVmvBPUA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX7YDzzAxfBrP9
 jBChS0WkOsGjbLC79J+2BGOj6faWx9LU4fh5Eeg/lO914aoAanWwTZQtXx0gz1lFSBfy4xL+aE1
 qzIQPfovu+EnLjsRDKdsGs8x1BKpiL2W4SH8aVqmEjwNV78XtRQohB02iqUPhdkGSPm76bXkUQf
 4pX8qSuF/wzlYMhq6bRaZUdGMAoVklbG5ZFWV+Fne/SdEosefXIt1h25vpa3C1ICTO67je9qFuu
 JfEg+S3zcq0PwxgCiX51qm0NQ4ICJVFTE01qkYEk0EuM1BF/u/jH0pi/kkPFyk/wQ+yrXKjFkqK
 hBDKVuWi6rp7MQowbdJVkw/XXn9dWKKwDSCdqiutbZqDtLWV7UKLWuwEAZFrit1JXyjtiMPIYKY
 7WKWZmSM4OG6MudVmkfvnvK2hJpFKrtLM9SWFCZBiYgv2i3QD6Me6k8v/ixmCjhYOkIPkFMeWcU
 kknwuB6m0qdG2FGdpGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX30egO26Xs8Iz
 VSTNnPIULSn8nEy7YqZl26WUaH23fX9m4Un5bpZ+OP2t9tBdR+vYjzeA52gPMfUBovIL/Q1XsjL
 gYGZU6JPgUAViS4lY0JUL+NyfHIsgN0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136

Extend the driver to support a new model - sa8255p. Unlike the previously
supported variants, this one's power management is done in the firmware
over SCMI. This is modeled in linux using power domains so add a new
emac data variant and a separate setup callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f379570f80680e96f027873cda6a6bca398e22dc..47175670a32631369a2cf8b00388d9359513e090 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -108,6 +108,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
+	struct dev_pm_domain_list *pds;
 	const struct ethqos_emac_driver_data *data;
 };
 
@@ -206,6 +207,8 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 
 static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 			     struct plat_stmmacenet_data *plat_dat);
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
 
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
@@ -310,6 +313,29 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
+	.has_emac_ge_3 = true,
+	.needs_sgmii_loopback = true,
+	.dma_addr_width = 36,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+	.setup = ethqos_scmi_setup,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -749,6 +775,62 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	return 0;
 }
 
+static const char *const ethqos_scmi_pd_names[] = { "core", "mdio" };
+
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	const struct dev_pm_domain_attach_data pd_data = {
+		.pd_names	= ethqos_scmi_pd_names,
+		.num_pd_names	= ARRAY_SIZE(ethqos_scmi_pd_names),
+		.pd_flags	= PD_FLAG_DEV_LINK_ON,
+	};
+
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = devm_pm_domain_attach_list(dev, &pd_data, &ethqos->pds);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to attach power domains\n");
+
+	/*
+	 * The SerDes lane, its clocks and the MAC AXI/AHB clocks are owned by
+	 * firmware and brought up through the SCMI power domains above. The
+	 * MAC wrapper itself, however is in the kernel's register space: the
+	 * mux that feeds the SerDes recovered RX clock into the MAC's clk_rx_i
+	 * is not configured by firmware. Without it, clk_rx_i never toggles
+	 * and the DMA SW-reset polled in dwmac4_dma_reset() never completes.
+	 *
+	 * Map the wrapper and program the same loopback/functional clock bits
+	 * the non-firmware platforms rely on (see ethqos_clks_config) so the
+	 * RX clock is present by the time the DMA engine is reset.
+	 */
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	/*
+	 * Run on every runtime resume, which stmmac performs after the power
+	 * domains are on but before serdes_powerup() and the DMA reset, so the
+	 * wrapper is always configured ahead of the reset.
+	 */
+	plat_dat->clks_config = ethqos_clks_config;
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -836,6 +918,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},

-- 
2.47.3

