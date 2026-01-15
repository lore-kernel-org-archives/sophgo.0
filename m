Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4A32877D4
	for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 21:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511155; cv=none; b=jVJee6fAA/n+sZZvxVrWHoTyl5lok4vFWEAGd62D99UXB/1Txmo5Me2dyhDAf9LAJTBEpbstYHsk9i3dWhcgWmwdfGYAOw9Zd6tJZZWZz57UU32gqA4icLmiTJMVcIzEYKZF+lAHMm0WMBv5pbJ63TejmESWSUWU2MifPZXrsO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511155; c=relaxed/simple;
	bh=ENmGoObji0+Hq4MublklfZhpzGxYbI0JiS47cctdDv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MroEJwv8eLodYEE0y1aPqpk0C5AeJNw4kzdAWFAjcs+KBFMqU6XbcF2D3Ki9nTTdq2SxDLTHawMW2tn7eF3OJA+Qe+TyJcx3cMZtbO6vMLoUN+wKvB3NWg4WqiEmLHwvx3orLhQlm3f2efbfQ/URQxNuQWdmwtirv9pS9XwyOcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcyP4ZgH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJgFn56K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcyP4ZgH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJgFn56K"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYGM42866207
	for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 21:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=; b=LcyP4ZgHar0lfCNc
	erfRehhLm+Jly3LD5YZe+gnbNWLMPpKpCHqXWqbxOusksc+bO9tXicyW7jh//NJi
	usIGfOEjO9AEv9gpfGj/98YCcHfrTukl/zYmQLydJsdQKttHrSPAJdyOP2ZwhZgo
	JBQMEwdzMGLiVdBk1W/SXyZVvNdc5NRZT+FM7qpEx7/7NvdPOy5frXysA8s0gU8J
	ZqNYay2ewVXzcLHlbBz3ecFwu6edWv5ajyjydAsDG19/Yj+LuCA7AN0opCmt5loq
	k4QJeBZL720AEGIBMtghVzSNUa8Qz2OgpGPhh0XGju56X61amGvdnRG64wNypL3C
	6E2Taw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2jfg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 21:05:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52dcf85b2so523023785a.0
        for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 13:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768511151; x=1769115951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=;
        b=TJgFn56K0W9WJuU5klZvJZvnsR1HXUORQHFy2wYSqXQ0MUhadzwiGq1Fkl2Pax0uwy
         YCVhHwF4mRxiZmfrsrNxUy4Ni2J+lOb7Nv9+nuOF0MwSQSiap5KVdCzX6HDa2k6c0Mnv
         NsJsS+nNAexZVZtsh5vvMwH0xw+0KDGEFiE7gMSMQnWwhVgA7GJUVc+JeGUgJSDVSAmc
         w06/9moTmEEzeLKvxmSEtFjyzzNEOYxYZP9xWhzcfZ0PavG42m3NyNOzzbOAi6GxrwAI
         D8XQy8GkJ6OCFroVHUceRsfPFCfraeNE8iRjJH0bqmoVdQ9y0mJ1+T2cAf+9k7iPhSri
         +n9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511151; x=1769115951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=;
        b=A0ly2ycxI5aJl/TN+2sbqp8skcMFeSQOVPzqut7tOQzkqo/YP5+1EUm99bFzyOlAqg
         fFcrYlguApJLp6tbB9RHe+EqLgr9mvlDfmgD8BXkWjD7oL7bYqERTAAbHAE0RrT5OVyX
         /oc0HOuP6+r8FpwLX/iRleUUYv8dz6/2lrpgBL1+4EXzIdIi17TQMjJz3hT30tNm38eO
         skb9P8EgaUqOzzAadPzADt/ROY1wfZD4bnY5Ma8yoTqg76v1DvRDB7SZnyuHHKMMxgJ+
         5OiTetDbUgcrfSK94fpHHYJtDaTSlrbZCm71Hzu881FclU0s5p2NmG90UnyDTohxh/IB
         lXJw==
X-Forwarded-Encrypted: i=1; AJvYcCUlCRegiopagsPYWjVG9+z3NTT/7CJF4o1c8toNuptBLUjLo2AIL1sZCBQ96UyDHmNqLeRQI70=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/9Bb662P78/JpL03xY1RGdgLpw0AZBTxc+FtaHjockeNQg4pv
	Wgk+xLC6TOaf58K1YjA8k65Iy9cBjCJ1aMQzZFhhTCGu/eigNWUL2F/4AHX9U2C8KMqd2gH64DJ
	NN/noLxqPjWl8YgT+YCmo17csx1uMLg3fgBejYAwEibhFWhn9j7uprXU3hLY=
X-Gm-Gg: AY/fxX7kDuBFjEuI53IuA3Jn5R/WdgQKJwzuJ97/jc/gS7IiJmjN5MTEzm4Orz6aqMI
	gs6eRaGN7SzfM2zr+7VVCfAa5xlCCWjdpGtpcVhS7hedOYdoYxXb7IzvJwYCF6KD0RE5VE70cDK
	oa1MRXf1nOImXIcQ9SlLFUc17EHAhmdn6tKtpSRJxrRmK0pE6CNPZBQuDqkpggfnCSYu0XuL77p
	DSMN0BfrtRF+6KVGEpOvWwldnoMsZtQ7WihvkKdBxAeQQ6OHoVnj+yTUFB5N9XRiwv5Qyfl5hmr
	qDcmUIk9iOpNNN4l2fM+/G43KdtUGQGbixmqzeYPCoRrvx3RK1MTMXgrY56x9RGeYuKvvSbcwer
	nZlu7UGjJEvjaNAhuH6dWRrKleLhSdTQe1IX2MhsI28VP513y0VgyZdl9YgP/1XI/RCoMUOnCVI
	wSePMr3qZpKqB5uGY6FfYqR5k=
X-Received: by 2002:a05:620a:1723:b0:8b2:dfda:66c4 with SMTP id af79cd13be357-8c6a68d2f67mr120083385a.8.1768511150967;
        Thu, 15 Jan 2026 13:05:50 -0800 (PST)
X-Received: by 2002:a05:620a:1723:b0:8b2:dfda:66c4 with SMTP id af79cd13be357-8c6a68d2f67mr120072385a.8.1768511150340;
        Thu, 15 Jan 2026 13:05:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:05:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
        Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-actions@lists.infradead.org,
        Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Michal Simek <michal.simek@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 00/27] clk: remove deprecated API divider_round_rate() and friends
Date: Thu, 15 Jan 2026 23:05:48 +0200
Message-ID: <176851027322.3933285.17869583744437773979.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX2Rluz5oQ0HbC
 gv/2btm4VAntoJW5tvf4Uzbx9RxUFKIApc9eXE2IX6cdm+k3pygMwYez3fuOhnC9JPHUo4v1v+W
 itZ6U+pCD6uhbAlodP/wuJ7WEtwLfZWYlbcdBhCK+xvl8FXCkkF4mHkMjVQMZD7zK+9yihe6gQX
 hKYwp6CdCw5gqVU69tjDeGddUYt5qC4y33gtd6UYsbf3G6E7VGWjtZN2rsdXnd/DHB15MfnwKOE
 2M1goRzUti/LTYsc34D2YkwSg5YW6fzmyDKUtGYxYn1El2xuCezJrNKocFHil7nF5eRaxgWFK90
 y1gBju3D+n5UNb2uQkOnNtux5CMMtEsPq7c2zbgA5+UL5coBaLMyaqd4RMAgUUx6ozWRzw2S8QL
 cIf2x7NjkxlNDesMRZAk/yBAr23TyBwTaBiWqiRB5eY0LXzqq8dctjWC/X1/Xo1MGJ1KOzCMr8z
 y9S9HwN8QUkkJdQ06zw==
X-Proofpoint-ORIG-GUID: cprmxFmLAq1ug4nmaxhg48PPOGDzD9yC
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=696956af cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=whp_R4xS9ENlu3RGya8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: cprmxFmLAq1ug4nmaxhg48PPOGDzD9yC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150165

On Thu, 08 Jan 2026 16:16:18 -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.
> 
> Note that when I converted some of these drivers from round_rate to
> determine_rate, this was mistakenly converted to the following in some
> cases:
> 
> [...]

Applied to msm-next, thanks!

[24/27] drm/msm/dsi_phy_14nm: convert from divider_round_rate() to divider_determine_rate()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1d232f793d4d

Best regards,
-- 
With best wishes
Dmitry


