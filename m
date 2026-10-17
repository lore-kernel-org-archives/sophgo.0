Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EC83CFF44
	for <sophgo@lists.linux.dev>; Sat, 17 Oct 2026 16:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255373; cv=none; b=KA0v6VM+Gn6hg9t7jmBMKAKwnCKKL7/g3PcQqtSsLn59zkhtzfez7VA4peoJbV+siUfgaJdIjD5Yy4cem+nDYjO+Ode0mzTNkw4EM7lb5rcRa7yNFiCzwSelqEdXSXjtikcOiaSs68kd8ktWOY5MqoHsBek/w0u+nWK71fPQ5hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255373; c=relaxed/simple;
	bh=oqtbq2GGeLimTwMiPXXLtV6CRd56cCRXZHus+yXgxlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NP91QFYPb44QtKlgua5Sn3z0oSvxDP0bKSAs0X5wnj/id8DXXyXReypAeCTITNaCZzBm4DFusUtT2/6ojDIPt9h0xcD6u3mqdo+MoQQz81MNPciIo7NHEv3YdOSX2Vkx/Ztd25YocXn9hHmjlZceiwjqO/RBhlB8qChW5XjsPRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lNhoZ5Km; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJGc6ido; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lNhoZ5Km";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJGc6ido"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HG9sMK465650
	for <sophgo@lists.linux.dev>; Sat, 17 Oct 2026 16:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A5QXkyLgqve2yg7aR0QbgBy6
	tWTAd+S8xlmq02cu4VU=; b=lNhoZ5KmND8CPcI2ztJrmEz30rkXHlfA6ZXPZ/BF
	dIjaldaBjswQDQz152ahMBvv8elLhUYIikte8R33fvDM1XFYB4bJJwxbmkydvHs9
	eShIPCBWf8E5pwxIyBHGeuDQy6qdqbdVggs0w6DviKRSBV4mr+P3cTJTp4wdY74Z
	5KS3ymg6PgRQRKbX/+YVIu7Re+hZZAA+q5SytRzeNXF0f5SCG5w6ckx/tUicRxJW
	NwxJhIQeClRVZ0OtvWLuWHL0rqEzv6Gfy7aqB1TktkhdKtYwuruOrhAkDsgnYJJ5
	WmRvDQrRAWN6umuhYE7m35Y2hOg40tfgMs8wZ1wwrVlYWw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7s9v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Sat, 17 Oct 2026 16:42:49 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso1863210c88.0
        for <sophgo@lists.linux.dev>; Sat, 17 Oct 2026 09:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255369; x=1792860169; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5QXkyLgqve2yg7aR0QbgBy6tWTAd+S8xlmq02cu4VU=;
        b=gJGc6idos69554Nck7+7p7e4OKccqT2chIYhpExPj+XIRvaOSo9uPrrkUE9PG908AA
         gjW0wHGvAVLWCKmUWr94xh040wRfcj87h9D6iDPcZVWbH9OCemwuoBS7OnlHEIlsrLAZ
         AqhBDMvPKlYaByHyHrvYPbJ5cxLRiU4DBXYMJbJc9sN+G1zhF2fXyu9sWVmK6WCtvgby
         2HEGI+DDP/IwifcOBwnRB0o1zJbi67HutBNIdKcLEMy3O2I0JLM39BU/pIHwB/Lv+INg
         yy8+Ml9wiJQaS9PvnTB59w4wK1y/aPuvtAJb9SqvIqZdqP+0V+MjraiC4JiavmiVjiPH
         eVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255369; x=1792860169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5QXkyLgqve2yg7aR0QbgBy6tWTAd+S8xlmq02cu4VU=;
        b=K4hCQ4PdxuGvXhbaoL1rFdxFZBbGk3Ydbj2Jkn/Luw83wfer4uD+NzYvbgWCFj1LLL
         IgIiI6ikS8DwyRzlOfWEM1GAd6425hU/9Yjnk7SrQuPFgmTpz2Jnfgwe10V9f6zUrlu9
         ZNIw7ZdfpJNArOsTZrWjCNtdYhRmtD5Dso2t3aVjkUvmDlJmKaoK18t+iUjuvuGV+zxK
         6xv4xiUiFKN6X475ttVE95STwq+0U6/hKNmCFtJouUmYobMN5ldSFG62BMR7eFbmLC+D
         dRKgSnrS7puZ1uRSD7viV8ebNGFmdTXJwGW7yBfEOwckzG6ruJp0MBYmR/aEKNztsr7l
         jhqg==
X-Forwarded-Encrypted: i=1; AKwUvBzyCjFCm2RI3NBlyX6Y0pkYeiXwQFagXWSZ73EedVac1CugLwxsN5OYEZEDLJ8ZXfKBe7i05qA=@lists.linux.dev
X-Gm-Message-State: AFq9FYJGQEOr/8faU7J4KPzviTH/aAvTNPJ3xlxnq5Nh6ugsVmBkEihj
	qms3V+PShHWio2y2QL0GAvNJR8oRe4bmViH8T1Q7H8khu2MM0/EzYlaBSm9/lBXluSw7dYi1o6M
	gZI+7DnB4zBYeOpco340dtJcEmLMGCYDz8dGz1G9lqS+ShRoTC7Y18ErzCxI=
X-Gm-Gg: AYBFou0e3xeff0nu/e67+GoybsUULs/KKNt1RUNc+7AIExCV+fipvEv/6c+bBNI+hSc
	OdMlzzFulbBW5p9PkFBEsWbsFvBHMCaBVRaF9lsX+62L6Rc2kFbjYsABPPeEWMutmKh58pxa9MV
	/FvaLDm3HELSDUXnhyH/hWQpnDTFKVjZmtjZg0Iybi60fmBvUM4ApJgjZxiTWTByXLy+PPnNdwC
	XSmBwixbbxG4Ij6I+zwtakNQxO7w9DPUDTAuuaCfcoNkqLjK7Ff63W8XDW7hvOTO9Elx/S0ce+1
	DeV2483C5pv9VSV8ihqo5m+Ecwkk5SPjc9D831jlt/XPgc7aXW16KQXxftEWrnpDpY3CMhLxaSZ
	upaTA6UcuIl7uqQ==
X-Received: by 2002:a05:7022:7e89:b0:14d:ef19:246f with SMTP id a92af1059eb24-18513e7b18emr4689722c88.45.1792255368736;
        Sat, 17 Oct 2026 09:42:48 -0700 (PDT)
X-Received: by 2002:a05:7022:7e89:b0:14d:ef19:246f with SMTP id a92af1059eb24-18513e7b18emr4689692c88.45.1792255368055;
        Sat, 17 Oct 2026 09:42:48 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm15041602c88.5.2026.10.17.09.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:47 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:12:32 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v16 5/7] net: stmmac: qcom-ethqos: reuse the
 address of ethqos_emac_driver_data
Message-ID: <atOleDtybJde/UE8@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-5-0266c2ead980@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-5-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX/TA60Gawq06D
 5Xn5UEB844yKybZfSsRXNE1T5QanFtYBSEeniSdfh7PATqdC0L1gllxmNQCRIh5G3PGkSAN0hDj
 71RTdlwPApA8S/Kf9lU9jTFhLiBoO4o=
X-Proofpoint-ORIG-GUID: 3YtdcSRUduRjn1EMDK93T7zmya5i6-op
X-Proofpoint-GUID: 3YtdcSRUduRjn1EMDK93T7zmya5i6-op
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad3a589 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XX1oeNa5M8xgm1Jp0F0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX9DaIZKf8d6Of
 mb+KF6gppiFfhwb3xQqcCvb+BUieR4HzJGyxSSL1BYpq7AzpjfatY0i+6s1QUglZbfcmTn/ImDj
 mQUClDqVM78L27ZMnENozViOs5kLJPkpni9Mw0zBHKWx1trsQSwtTwQUVioRel6mco+x/fhaeqz
 3ybRy8nZyst0dxnaX1LWJq7D9oyWYnL1jwDjfdNrPNsBGvA5dgi6ZJKDShnt2dgCaqZFEpiOh5f
 xoVFhf1QuKs0MM+iQu6Az19g4dQjHyWQSuksMed4RE4/wT+qf3xBnf7c1MeMxCf8KrTODc7+G1h
 JIbtAU0pnn3px7aGIWIxX3rDms4vk3vEYHCZwUIAkhrJIg3GYFi7YMG7CbyN8U9osnhO19H3tqk
 Gq6y0s5K+gdgyAl6W1jceGWL5hdZ3+YmjfbBvzYTbt3P6b2v7wT54OTKEpOdbgdLbUx1oBgRfnF
 PJ9aGKTgOcGGvMAVN3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170066

On Wed, Oct 14, 2026 at 02:36:44PM +0200, Bartosz Golaszewski wrote:
> Instead of needlessly copying the fields of ethqos_emac_driver_data into
> struct qcom_ethqos, just use the address of the former as a reference.
> It's .rodata after all. This is done in order to avoid having either two
> calls to of_device_get_match_data() or having to extend the latter with
> another field when adding support for SCMI.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

After testing it on a couple of legacy non-SCMI boards, I did not find
any issues with this patch, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

