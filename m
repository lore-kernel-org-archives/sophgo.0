Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FA23AEF3F
	for <sophgo@lists.linux.dev>; Sat, 17 Oct 2026 16:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255931; cv=none; b=mdwWJzzWM6Jh3FC3T1TmiZWyjBF4SeHxS3EP2AQoMD2CC5xlwekFlDp1EbkGAUCajHNEZHZdbb7m0mDVWs8K8F8CeljbsX4D9THuWWXDobTSW9OkmULl84fAWjrA0D6cUT5C+0DAh4QQwN/fxSabPbkMXKwKCR96J8l6ELfufUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255931; c=relaxed/simple;
	bh=hsHiEZ0MfrTq0vKlHAdbOE/dq47CUmz0Fx7H3gCkV18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyCUbIGt+8wJGdoBKvUaDQDjobc1u3fBtUehdE/4gXX8q/R40HN2DRf3aEBV13y3FrjwEVCJ/bHhUzJ3zWS19TL7QlJ2ENhv2oQIgtJ6i0zEJhSzeY26sTUDnuXEFqfq476gtjHT+avCoyB7pkwitf9W9R6Bae2+MdfblSvyw9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddkdEhfx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZlNJeXJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddkdEhfx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZlNJeXJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGAihK021133
	for <sophgo@lists.linux.dev>; Sat, 17 Oct 2026 16:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YwGr/VFcVBThPZuxD7wslr2Y
	PtoE5+81Oolo9GzuWu8=; b=ddkdEhfxlYdg0WsHZwg9YM05OnoCCx+IZFh7CpvA
	fZM4QzivJbpNpTR3Qtvrat7NqSk6ZsAwVBAwG3CoBTtAjfQGMNpWcuQ268iZAdGt
	b60a9SGpXkDLJ6ph+xnqDDr9mh0at3I1KPAALHtr+svlkjG7/Nu0r9dSvr1TPFdT
	ASyOqglJ2l2IcfKTLLF/bBQqY7QXhXz2vgiuIIoH98GsX7hItE+yHIikqJ9+b0XE
	900wrUHa54nqfofviVcxz0LDmr5v/J2R/i8OjdfSzkD3oOKAXZspDdj/WuXU8KkI
	nVOP8wkXAUnOP9wrXm5HU6qi64684cL5vBonmhbOSiPozg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k1803-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Sat, 17 Oct 2026 16:52:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so1364013eec.1
        for <sophgo@lists.linux.dev>; Sat, 17 Oct 2026 09:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255928; x=1792860728; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YwGr/VFcVBThPZuxD7wslr2YPtoE5+81Oolo9GzuWu8=;
        b=RZlNJeXJ3zD/8M/Vk+cz1lNk5NEwXZUWRThV+o3gLfc2/travqIDJZ7g4cGqapxmKs
         fcT3nBfJuV3Uhe3j9PC1y39YhcDIJuiZidN6W8vZMo8Vv4ph1Zw3DzWgzmxpV41fBQ7L
         OmlG7gcHSkiqIsS52T4k6NP6c1RwixSI42b/FuYz8fQ0pc96iF/99ITQcwyV+11/V/M2
         1sXqd76GJwp049SLQrA7UPwNz3hI5EVI4tQJTJ4Yn8Rq5p+Tq4jC5YLO45neYGBJBIt0
         pYKHLpkzsCTRwFhTkgLqRs6tRtqBVSCxmrsc6wN101Xrqq9WwiUShTtoJVoc7xnj0c/C
         847A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255928; x=1792860728;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwGr/VFcVBThPZuxD7wslr2YPtoE5+81Oolo9GzuWu8=;
        b=af+KVHjYzo9Topb/OvbgZnGqL7EXsfu6AwNyeIS+I57X9MJvAH1UQbqH/gi4v7x5AN
         v7pKSQIROeNvQRB2/aTqnC+Ctl91uTR99Qazv3Xc2lklElhRpW93R0HTHjIvnKU5lEQ9
         zNfciMMhaUcPOLteDUFE5mN4DDlDxE0f+h1jIZtn54rcUuPYJ8uQRnDNXKXWp0Fs+9li
         A++gRrkCkUwdVCJYDpc6WPlkJUMIT0g2+nN/ZlPbXjTNIkCk9YoBx/p3aoBHcCqp/pZt
         y7e/HtD0l3RZtayNOD3X8vMpI4YArwrKA02FB7zG+Biw65VXAWVAC3DvDhEK5GZwW1xU
         p64A==
X-Forwarded-Encrypted: i=1; AKwUvBzDoo0T2vp+iApCsMsz48iGOwYi/d9IyhkZRTn1jBj2DRvKSeYqyfe+a3QRPdxrEzEauk22+/E=@lists.linux.dev
X-Gm-Message-State: AFq9FYIQczY1RT7j6ZRiiIQFCUzEHx1K5E/B5THHQr7BXOb9vf+uONMR
	Gal4XngwjqJSh3nFsPfFdMUz8HX2I+211VQh9aHvWb4G4FNo7d4rB5EmKVHZr6tm9GEqxjIUpVx
	l/A+a7l5f8n7Mv06qCBX4sdE0PHoModEzAYB9o1V0FMEBYcyYXBNnJdJEFas=
X-Gm-Gg: AYBFou0/mVZV3vMJZDqwYB6oTMeccIarrPxoaCzqUs3whZZ2EbfnSN7TjTtS8Wc1XpH
	+b3mQKlUR39+jWHsW3vXryndyidV/sEWsJEKg5EKZG4U6df2Owfqba73dYjWV42hBin1EhQyCI2
	bpnFPi9jwOU9vmTouOUy5+Z3+gKis0qa5ntxtHvF3Q7sHA9BbAOw/W0AUAmiRqB5e64VkL3Z+Rp
	G1pVILXWcVYrlEO8LYnIinfobEHyqIYQELGCMcVzfQz1PxlV7Km4mGPiiQNaogMINfi3rhKrfmb
	RW/GoFOIN5+ENR7c9j77aMWdHtZjbDtUAAUIbkUxaXE8hb2I+1SoCO0wf2vEkWlv/GcV26ujG/7
	QAqbLKZv6kxVH
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-361a2c38d17mr4246739eec.33.1792255927860;
        Sat, 17 Oct 2026 09:52:07 -0700 (PDT)
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-361a2c38d17mr4246646eec.33.1792255926579;
        Sat, 17 Oct 2026 09:52:06 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6ca5sm16487376eec.9.2026.10.17.09.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:52:06 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:21:50 +0530
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
Subject: Re: [PATCH net-next v16 6/7] net: stmmac: qcom-ethqos: factor out
 linux-level setup into a separate function
Message-ID: <atOnpkct5QYK9VW1@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-6-0266c2ead980@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-6-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NyBTYWx0ZWRfX4dQitEwGuoQ2
 j0a+WiWVUWHAviKH+HJc2bP8q8ryqQ3VIiYQXAYYt2QUBPv2AmhW+/j5qq9CmtrQnNOfE5Ih8Nq
 gXiqECCOY7ltQ8mLDB3lCmmUzt9IwxxJbij+I+M5nsggQOs1qIrZpwEzv8fhFcHG7X858xSenPE
 /dsM6CiBdffkIvFJcQfgO4WQJu9l4/1zCNzLyDWLovhMzxu7V2HPKnZkQEUiSZyH4ufoNkRFfFR
 vXi/hSNq8l2efZ03I0hUWnr2k47mtzowc9h03Wolo86J86Ri92hw+3tV7w2Pg06frKdls9SLzBY
 LK3B4trK/UzYyRl3eRRP1MH/y86NDI33hTaA6W/iMec3BOHWnzQBWcRvYilMnD8CYKvE1iKP7q+
 zdL3/zYQKRrxJukPuzEZv9TJRI7Qe90gZk0VXxnONR9y1rVcYGH2Lmb6WcB/IHSdkoPL1GL4wti
 jzHIaOFNXNhTzA6GLZA==
X-Proofpoint-GUID: ZoF_dAUSjnMk-TPscVac5K19cWXPQ_aA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NyBTYWx0ZWRfX1ixsHejLhYtG
 Vr2yoA0IczI/vjT+zF15yMcasvV4jPCx3LD33amD9jN7x3Fnv6jmnsLCCW0NHD6yRojbxSi5kbO
 YTuAnrU86tw1TX7XAjHUPWzowvTlXfY=
X-Proofpoint-ORIG-GUID: ZoF_dAUSjnMk-TPscVac5K19cWXPQ_aA
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad3a7b8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rqvSfYwyKISaz1XZPbMA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170067

On Wed, Oct 14, 2026 at 02:36:45PM +0200, Bartosz Golaszewski wrote:
> Ahead of adding support for firmware-controlled EMAC variants, extend
> the ethqos_emac_driver_data structure with a setup() callback, implement
> it for the existing models and move all operations not required in SCMI
> mode into it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

