Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BB72E7BDC
	for <sophgo@lists.linux.dev>; Tue, 12 Aug 2025 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990065; cv=none; b=AlEkkuwvRhy7a3Uquw/z/G17TpX3tEyM7YaXpJYkkIpecjfEzbx5pXCVG0Bfe9B8oz2lQdMdo5MBAAb+tfXUp1T6ea8x6GAy3jURVigMyH1jxJxtFWfUga+yIUkdqI5UMuIyFIPv/i4yLYkDL46t5ejAkhHntJULWATGH2ZYSM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990065; c=relaxed/simple;
	bh=Ov0Oe/fjUSgAuHs0OdT4PMNwtGL69MPkRBbW+7CrYn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bJ8PS0U7dafOekHHuOFHHkDLT+fyc9sioGgzzbMS/wKlqBQngutx3tSbyqisXphZRtDgphjPtQ/tSEJOHbWDDJlwmUD1TnRRBmuXwwrbnkeF+/h5VM1EL9GH02eA5WX2Im0ujdXNNWS4YNqb0rPgr4qHvHsY64pahl/MsdDDQp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfdgQiWN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfdgQiWN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5v29W024342
	for <sophgo@lists.linux.dev>; Tue, 12 Aug 2025 09:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	clJ5A/6cgDIQE2u4HyX9gAv44cIhvX0vHF2jW/8Rc5Y=; b=cfdgQiWNNxQ+3gOz
	tvXu+hfjH5tUiLlCYXVCQj4yajCG2tbwmGSKj8r6EPIclyHu34r1Mq6Yl5gff/Z5
	rjMhJd4x8GzKxE6kL3nIqqhOrnJOSnOb6Nrx14iYpIZqPgyuDd6VhuWRuyrNAynZ
	G9tqJgPuq4rYDPz+y5a0M3z3ORQGSwDcElBx7jEOo2ZRLufvhAIOGqeiaOdTkzjm
	tPMLfaaWIzvq2kY+T0SliAsuaDCHIBCqnpus61yCdav0D9wmC7jEiFf0YfI4ZUMZ
	BaNmNlevD2vZKyrsN0RYsV5OylahioN/uPBIRG74BeWZcuwuvK8/ihxzhffefMma
	RyIkIA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4bhyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Tue, 12 Aug 2025 09:14:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b07b805068so11784241cf.3
        for <sophgo@lists.linux.dev>; Tue, 12 Aug 2025 02:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990062; x=1755594862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clJ5A/6cgDIQE2u4HyX9gAv44cIhvX0vHF2jW/8Rc5Y=;
        b=uUogtlgAwSp33avQ7mw/RiXDDY7vG8Kk45pzdkgYMzNsAA/iMI4QhodtCzFCGyPnJS
         tj4YMoKu6S84L8C9QWuRtBtjy0LnhkYi9/Vd81Du21B05H0Tj5eMRBnQXZmJGU81sG/l
         oXgibWjdKGQqQNOVdxjHwe4tKbRFUOUlz22/1iLOXdsqQtcTfXaE0iZo9YDxLEX0LbGU
         yMcNWLTfIXBDdqkyPfb5rTTqnm4OMI5QmVOPRvw9QJclX7IpAwL0SRWfu0CqXIU+GwYZ
         YfoczPFJm3qI7P7b8cG2v2c5/tJR2IfWS2fQ1vIby4rXcLgkDD1TbfHz/pswxBAJvUHx
         Rrcg==
X-Forwarded-Encrypted: i=1; AJvYcCWqxIqhlx2YKkW9PAVZ8mty2MK4DRyZB+cEpIJokjKS7/c/l1RWpHezOMmi1RhJRpp+GDZ9kgg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0XKiIvKDkQ6GtY66HNiFNT2co/G7KtoNAyfIn52GDHtlKWaF4
	m5ofQXjCc6Daqs1513EJPr/XbkpD48f2F/YHEfj23Zv8RDXAVnoKOM0AexRuwsi6dkSC5Avjv64
	jtGhTemd5T1GTKDyiW1Z9qCyJaXmsAayftWCpRFy4sZxoMcGaV3Ok+rKQxPA=
X-Gm-Gg: ASbGncuuehDHA40KQGjxnYoE2L7zzyUTYtLg3z7HTYdp3KFQgfVkEqJtkLiyllE3JI7
	D6sUcvbINYqVknP78Zke+LDwjn2+IDpR4Suy+uFGm29nz7c5sdAmTKVgHBjcstMKtfeJdiVcfSA
	HYortj1G45mUSLfT4xs57CYa4Qwf2euBSY6PY0w9T05YGC6ck8C9pyw4zxnTruJJcgvfpnXRIIA
	whckcjv0b+b4b4/Kq9YGGcWOrTAPIcJlN5fdkSr4f2Axm+ddvAlLi6T9eOFDtOg5BygZzr+Jj+C
	lPfXwu2kXnmHpbuITa4YCgf8FfKjN0sc/GzdLccshYqTMA9xNKODMqF9ZUjeHkg2J3+6Lc0VjpC
	TxG+7LWbSQN/1Uypw/Q==
X-Received: by 2002:ac8:580d:0:b0:4ab:23fe:a743 with SMTP id d75a77b69052e-4b0f4ccc1ccmr2591041cf.9.1754990061614;
        Tue, 12 Aug 2025 02:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV6Qlx1UbGp6Aaax5Fxj5SKbEXoDO3q7jBZvznDhAU+9eJcmfQCUOIdtA9nAu77phChEO34w==
X-Received: by 2002:ac8:580d:0:b0:4ab:23fe:a743 with SMTP id d75a77b69052e-4b0f4ccc1ccmr2590471cf.9.1754990061134;
        Tue, 12 Aug 2025 02:14:21 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a218aa3sm2185232666b.93.2025.08.12.02.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:14:20 -0700 (PDT)
Message-ID: <86b3f3e9-8a48-4580-82f4-68164e3022b9@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:14:11 +0200
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 091/114] clk: qcom: regmap-divider: convert from
 round_rate() to determine_rate()
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Paul Cercueil <paul@crapouillou.net>,
        Keguang Zhang
 <keguang.zhang@gmail.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Yixun Lan <dlan@gentoo.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Michal Simek <michal.simek@amd.com>,
        Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Neal Gompa <neal@gompa.dev>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrea della Porta
 <andrea.porta@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
        asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        soc@lists.linux.dev
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-91-b3bf97b038dc@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-91-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EFC2GvaBdMoQcfbjDaaboV9zcYa8SFsY
X-Proofpoint-ORIG-GUID: EFC2GvaBdMoQcfbjDaaboV9zcYa8SFsY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX76QqDHHYgqCf
 sSTfwKGDb1HrLwwY/grwpbXK5ch+WDF42u/RmXjXzJlOawQ+qy43qdq2qsgGHsAgTsQoplYBgje
 qOvb6WBXtxZIfKc6S3dwFtuW0xSJNd+Tasj9V3ZFUsDwmyoxcpvn1Z+SvC1Ibgx80couCYe+ZZS
 AVizdLJ/nHzLbQ2JTw7FPgIC8oh4ag7fgiIdv2Pi08dFeNqW2WZjnPxJCf2wXFjW/hTEHWMgS1M
 P8KHIfinBg47j8E0kNkkyXGFZ+hjljuzXkftr6bZajWnXMpy+GSZ3FDkTbkf8vwXNbfAj5gp96T
 Iflh3bYu98PKFpO/5EVoVYmC6udGbOKUqaonkleHFbBMYTlSCkJ6iR8RqauF5Mtgzpvtu4Of49I
 OJLKJwvh
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689b05ee cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=lhVY8u9YebhmjeZYKd4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

On 8/11/25 5:19 PM, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Note that prior to running the Coccinelle, div_round_ro_rate() was
> renamed to div_ro_round_rate().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
