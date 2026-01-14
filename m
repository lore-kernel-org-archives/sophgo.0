Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117453A0E98
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404640; cv=none; b=a0AJOLfyjHd6AdHkTQVhoAqga/FMP0ZZdjuruYW2ONqBCB8CqrHJjShYiODxxvWo3gCnWIIpcuRbzHRLTHuL3rIC8TaHZMRY/xh5md1n3wV2HVv9kUt7ACPsHzvxZR0wjOalN8tnXFGe8gG+77lt/GxYvr70pD3CU8t9/FIXKTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404640; c=relaxed/simple;
	bh=zRGKe5UJ9yNFcA3nCyV2yle+pcJ0o698KmnQ7j+oxLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PoloOHdZ3E1EYTf/1PLtYnlZX//ffuTHemK/nsW9O4HibQRgfwxV3j97DqXllOQSygQXOhyZCNoZepzRNdcB3CT0i4F9wGuhb36U6HxRgmtYpUzruB73rGhN6hDEqyTRLdxCSzbR/JDpT1R7UVbHz8JzR55jBIC8MfvSgkRYQcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kk8JIzgW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQ7sYWWQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kk8JIzgW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PQ7sYWWQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EFNdVP1943035
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssy8kvmbkidBSVa4bIF/Sg6F1PMs1iwvsiG9/WVtcJY=; b=kk8JIzgWD/bAHEgM
	0ls96MNXXtEja6QlnGHg+sHWfdxg9wDNaEzJfvyQq5xMnTuFWVseT9s6RLHdO5L9
	fiiRlWgh/YHepJkNkuC0AnfkwGL0Ld6YutVOHruXFFvt2zdl1KPFXN2Cdk+9raEf
	zVwyi4HdbYB1Qm3iEm8EXAmNAB5eexz3+aKnzn6LtAne6tKxrKfpmd2Pdf1s2JA6
	PGnyZKWvZl78FlUvryh6W208cUEVgEwxQtAzboLq6Fvy6bXHKAL+r7R4mbLDWzH6
	KQ/pTMq+l2VkT7Uu6Vm/oLuuz9ef9Gr2BrJAtjOSQ6YQeOgumZ7CN3XyCY0Zv1ZS
	hqsjxw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp7b6sjqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2194e266aso812119085a.3
        for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 07:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404636; x=1769009436; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssy8kvmbkidBSVa4bIF/Sg6F1PMs1iwvsiG9/WVtcJY=;
        b=PQ7sYWWQ3TBmRoImqPkqE02mbDOGqu0g2xjMNfFIYQKNcglbboKyGfiqS8EUnD14je
         McXDdUSMTVV8HTC+YLgWf9+TmOOWsDdQruBuG0cPqTD8535L9h2YjpHINENQOGccETyx
         HZcqDIIcOg/klamJ2ZNs72BQc3K08x3is4qzF62FheaivSxG8+UoohlBLOUCEYTogb+U
         BHyQLEvcZIOYaWxm2IBRP9Iiq9gXgyqLvCQEHD9ef1lRMEB+/OwJNTJuTvAkKMOGVj1r
         qigePN1xSyl+L5Ar+GxGBarc32MzmQhZGZ3N+u5018lGD44r4Oc4S3nWC++JIVvHFk95
         a+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404636; x=1769009436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ssy8kvmbkidBSVa4bIF/Sg6F1PMs1iwvsiG9/WVtcJY=;
        b=XZya7yfvxI7JuxgCzuUpoQWbwaY5+pUi3eQWQVBhN4ZNEucCxYO3rdGeqGbgOnb/Ef
         1jePua3Ak+pR6LFe4X+84mzFPT47sgzXjnu8LqEobyQsMEZjQiYBsQmXm3/4WDwzmgGx
         ravfdi2/d6/TJgqJn7SUAsQVX7BRV+UawArnSHIHv8ObTHjVbgjapxknYGW7cK8q+jUo
         yxYUvDw7Gd28/POucR3Wpr2PNLBfCmUeZnzIhUUPReScpjv9l/ab8qIPwTT42YP0pO9M
         1paOuJrEdghr1AtgSkWw6MUPtZbxLxLZSfMrHQLUAS8Iae+uGoK/6vtakIoJGzdFKQgw
         8PmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaXkrLrMuMNwLRMAANCS6WaVDXMnztBM7auTjo+9tkTQaeyvI7J+DJkxstqD5zGA5f98cj3+w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4H8wwg8B46vEDIxIuV1mwQZ29kcfvXgV+rCv5XjyxOnvM0Dbb
	dbGuTSVwyJWegg360XDAO2IcEIjr/YoBsMQp4N2syEaJafGCX8Pv5I9pXM/5m+U/GdZ8coItkCh
	Gk9AAidrb9UXzwtxq4GQ9vlyZoV3TqDxwxp6ORX0lcvLd0Hw6AHyIQFyzBOI=
X-Gm-Gg: AY/fxX6SE2AS1B2j9z7Y9RqhRpdWeDKV+pSClYpNLax59DDw1OsGiZidYkf3xgmlDh8
	sO1Oeh5s9oeWH4THtIcCWu1MQxGGcHkPOwg6WhOvA/0rU1dHWPc74kUap3KVVXsApvDbBaZf7ub
	GP5P97UDCxCj8DcMk4YzDnGKa6tiEPCQXP8/jrEziZKAT4oV2Th1k8GpB9c1fc/pViG0UUcvWet
	qHVijSvcAzgeJq2c5DvM60175fH1dC4s5QuOU9EDxwdYMUvRjYeSKvJnATD+tRPStrWUmlUhK2D
	z4ZGusW1hI/zLmRdq2mx05v4i0okBMGzpswaYbvdjP2DUx5v5FiEN631yJ1GChEWNXIINlI7Vfh
	kXFuAdj3ErMUnp+UUm6jNMERNQQcv65sMGQ==
X-Received: by 2002:a05:620a:4549:b0:8b2:db27:4268 with SMTP id af79cd13be357-8c5317f0aaamr303441785a.53.1768404636245;
        Wed, 14 Jan 2026 07:30:36 -0800 (PST)
X-Received: by 2002:a05:620a:4549:b0:8b2:db27:4268 with SMTP id af79cd13be357-8c5317f0aaamr303432485a.53.1768404635555;
        Wed, 14 Jan 2026 07:30:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:09 +0100
Subject: [PATCH 08/11] pinctrl: tegra-xusb: Return void in padctl
 enable/disable functions
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-8-a14572685cd3@oss.qualcomm.com>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zRGKe5UJ9yNFcA3nCyV2yle+pcJ0o698KmnQ7j+oxLg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aG1jDmkP4a6PmHCk7jxdg6pIwc6m3a2BsZu
 jfRoWqEDhyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2hgAKCRDBN2bmhouD
 18PUEACGRm9HFTgK/BMYNlKpt3lPmWT9bCXtaAiUNJGcB6ffgJheT+i457oOaT/xTx1LOOiYEau
 UWjdo7vnfye/rqPz8xYcdQr+go81raUQ3IhBxe+LqfaMunA9y3Q+s3QbktSC3PldiTWJyw6MXBt
 uq+YFH0Vtnkbp8TC6c1687wMzaJsm5xlKxC6x3Sfmws6HwZXhBuTB4Hi0wT0my3LoS8gJTHQTNq
 +qkjU0hLXmrpN6ibgVT1FxGuHDuDSNeVSEIHmrFSXVlPBywSQGm5gVuLyiQCtiarsEhPhlP1a06
 OD9Hmdkv9AZLGDb+Nyi9BewRwnASnSvswYKtqIMj+lA+fj+BdCmRx1CeX2CIRINVcIZXzU4+VMe
 uKlw9dXawo9KJHktVbqmjTBM/mP3CqYpYoLKJ/Z266veUYfVXw8zFBpEdU0xSOqRlekxTnkGZEN
 dOEKquxcczR8jUIAagMutrlY6GtaQG8YcU5pIdWXfU7Mmly/s9fuJlOFKiCuv78MnGkL2CIwOxF
 saww7DthM71jMUAZ8mCReBzVQOz3GSqWUmdqg2hOkdn6kGEQgkbdIeWBCfvFxgKmUJOw6Jx3QkV
 ceyz1gCkgjID4vnUSP0ziWiUhEXkrHazIzGuYyBPUGmzvaZk1w/COGY+KgPKeu7arJ/qiUw/2Iy
 P4nTGG0eFE6fjiA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: X3ZnreKTh5jtZVgDhL3P1SSYRJKEkmcK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfX7B0xdk+1EnPm
 CjSHD+S5vU5rUHm7nkxoYSVbRmobaeTGxdZU59IArtWcTcDhmoo27CJdixW6nVpvbl4m5MK0qW4
 uV/0TLYX5DnZl6eNeh7MNZspdNNZerkWvnwuMw2P0drvj6a6Co4h6MX3v8/xhDCmXsmhRLJCA8F
 t1OT8Kdz9BQaGEwp0ud2u0fBVFfJ3tsKqMBtgOfHjNTfsiSHVMlLZHWNTSOIdmdjxEyWe2me1lQ
 9qJ9xW2TPA1rhvOgcAQB51BQt0iDe5CBsGUcBEiGaRsUDX+t6FSxvLOxtEv3RzcENShqUA/kzNN
 i+K4mZ5pnNczr9njI54BktudcrmNTY7Lm/9JY/eS1D/b2xdJ91jm64jZX9KY86WA0V7WFPtfm1s
 Vhab8DAZVGijGEKBBIdS0xM56dpR4D5K5VmuVIxQO5BdFbFAIw7ISgi+HVoFJrdLH8GfLjBo8iH
 w+diMTk5lbfKsXGXEHA==
X-Authority-Analysis: v=2.4 cv=W+w1lBWk c=1 sm=1 tr=0 ts=6967b69c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ed5BEzkqmhObfCaRRI0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: X3ZnreKTh5jtZVgDhL3P1SSYRJKEkmcK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140130

Make the padctl functions a bit simpler by returning void instead of
always '0'.  The callers - phy init/exit - still need to return 0, but
these are smaller function without if/branching.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index 49c5edeba87f..34a373f7e04d 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -474,7 +474,7 @@ static const struct pinconf_ops tegra_xusb_padctl_pinconf_ops = {
 #endif
 };
 
-static int tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
+static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
@@ -501,10 +501,9 @@ static int tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 
 out:
 	mutex_unlock(&padctl->lock);
-	return 0;
 }
 
-static int tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
+static void tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
@@ -534,21 +533,24 @@ static int tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 
 out:
 	mutex_unlock(&padctl->lock);
-	return 0;
 }
 
 static int tegra_xusb_phy_init(struct phy *phy)
 {
 	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
 
-	return tegra_xusb_padctl_enable(padctl);
+	tegra_xusb_padctl_enable(padctl);
+
+	return 0;
 }
 
 static int tegra_xusb_phy_exit(struct phy *phy)
 {
 	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
 
-	return tegra_xusb_padctl_disable(padctl);
+	tegra_xusb_padctl_disable(padctl);
+
+	return 0;
 }
 
 static int pcie_phy_power_on(struct phy *phy)

-- 
2.51.0

