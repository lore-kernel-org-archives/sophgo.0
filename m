Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC3523395F
	for <sophgo@lists.linux.dev>; Mon,  6 Jul 2026 08:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326512; cv=none; b=lreWlC5vcHc3zOPyByG32s5jGpbJXVuhQYjQ7xTpz60t1GM2x7FEN2jmjTeAzhhdGroKLpj1eZIiMdsD9kFYX/AYEcxWZby4L49G3/R82KX5XuR+rZ9caNDX7HCNxdrRmJXMssXX/e+4OIyKahReTQJyIdugbFciwvFx+QCqBHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326512; c=relaxed/simple;
	bh=JJvjvXzlCcli26w+i5Hirhm7MyXZ6wjDQGioyQ2O3Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xj+G/iwpeGZ0bE/sN16N3lZkAj28SbfiX8cOYnfBHssh5tst55RF09qDFenSF/CQ9vl89WiST3V8HCSRBhOeS3hT2DoSizAU0w9l3+TjDML3rirGU7KKb5xu/lrZV65479r+AgBGySyW7hLgN0pxmHJ72wd91HcN84Dg7zfs4nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jm0Kg9lS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZnlWSNb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jm0Kg9lS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZnlWSNb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641TgF3470431
	for <sophgo@lists.linux.dev>; Mon, 6 Jul 2026 08:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=; b=jm0Kg9lSibJvV8Yi
	8hdJzAn4zgpP2byZ5O4vxPHA667bXVLXHofUt568kB49iHxnfwvFhctaInLtCjCZ
	sjNHRodxgeyEI+K4Sh5SeEFuH+eYubHtMfiWH/bAUEFyu7LxqpBoChobn1qyHVpZ
	1rLLI4FJJqj/Yk953HEONXVBT+N6ylBmW+SjTQeQEVhfTmxCK8O9BG8vaRt3Exir
	JXmS8JQhSMmJuTk8SMinF8d+mY+jVTVBRkY8NqkZa2/Ot0bSxasJBedLFZ9P4/jy
	oIqrv4PZJHfl9zhVgr7IHFht7qp40w3MPq61gyA4heu2IH0hVtB6bY7pBm7HdH1D
	jKj/ig==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txen5e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Mon, 06 Jul 2026 08:28:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8eac2620cb0so37353126d6.3
        for <sophgo@lists.linux.dev>; Mon, 06 Jul 2026 01:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326503; x=1783931303; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=;
        b=GZnlWSNbHVUzlRUz6K/icIumn3jpNAfdLygMC7Y9jDOSrLeGFkeHA27l40FcvM/h15
         Vtjlnos8WT7ZPPp81QhGrI3lQV0eH8f7bpI121sWk+HNzy2odBbSUIbpbAUrfSNfY+1C
         pNKr/PSNEuC1vuosa1JwQITwbzR7VxVeQcc28SQyXaDt2+b0qLZ2+L5gH4aYjrg8XS0H
         63ZmGUSFKEDoW6w1BcDLnXLWWGM4K7IHVS5o/OoB4Eh3qwzM5m0EA5XNUV7pafdzBEtK
         rnRwQZm58CASzUz3BsWFxy+xLyLQW8KyKSVwugXqBGj6xr2NCO0pkIIJIC7OYo3XKGcX
         68hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326503; x=1783931303;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=;
        b=HMKWeSYCGsGljaWFbHSBeOv7YYseQopAuv6lpw+Iu0N3dAeUyYuxQQYzbk/OSz2KoN
         rML4a9wOZpqD8smMaXj3vLNgIE7gFcEnYY/HmrzsQ2idMhqcgZrj6eOr/nsHo73Be3fG
         eXGH5ciPKpOTvwCmPXlDEVrFeHeL46HtSEqXYoV2LYkFzNfoDcO9x2yYvm5XYlGsxTIC
         6wBuxNs1umdIwK6P2efmg2Mg55bpe0jU35JlVAXpszUSE+t2/bSck9VXbwrwkQjX2A0k
         qcAifruEGuVZ5GdVLWiyZdZPFDItQvTbakVq/0Z5CzX1QIq6p/iPmphUSBxhENGmSl6F
         k9yQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLi93/sL4QnEkfVpLtPAn40sdCwN/8PX5zwVHzsRrJzrncT/fjie70Uys2ufq2JjoKfzZmw5U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9iyH+x7uGmSoLTS+e8TPCzaUl4Mh+VR9kX5F4KEBVKircN81Y
	ylf5Rx3Ti4yYMoHJvuCzMDz0YEMBIK2G+4wvg5+fAAL+Tkag9y9ewsOej5KwOQJ9UUxkIqT++8w
	BoF4nGkWJ+W6SbuS0lRrHkDdgSDBpshlD7l0DXqb3SoNAWp95Rc1djpdADQo=
X-Gm-Gg: AfdE7cn9ZKA20lxaUgBg/+BSXfivCEApAY3ZzIbYGBOtSlvHIt5txEj/M9SKBsyGvAL
	XxYNtucha1+fM+x/spSIgpr38wZZUcVb7zphSblE6kS5hA83mlHznZ8hkDP/KOxR9EVB66+pshD
	0+Q8keJ2SpXFs6i/o0sOj4j8E9iQvtT6AhfcEB37PwwIkfliKzNvHO0HfMB7/Sa1Nd8ZFaGv2ED
	UYtSuZhQq/V+BIoJXo5Fh0Fqdtqx+8roHwC40upzpQTJ0XXftJZF6sKiF/tVMpc4v5ymHo0/lqM
	iNt9uO/NQVHyJRJZX2OP4/hoqbzCWHVkkSJZVy17NeYkcDu6SjILdtFtw2wbioYZuPAYuAFhBp0
	UEhvwcCDVeF6swzkVVU9EJMym7Aw4ntlj9wlpQu+p+CbqKcxOBg5ECBZ6kOgxGQ==
X-Received: by 2002:a05:620a:2b84:b0:92e:47d4:b485 with SMTP id af79cd13be357-92e9a4ed0e1mr1294193985a.62.1783326501625;
        Mon, 06 Jul 2026 01:28:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2b84:b0:92e:47d4:b485 with SMTP id af79cd13be357-92e9a4ed0e1mr1294189385a.62.1783326501174;
        Mon, 06 Jul 2026 01:28:21 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62907absm677939066b.33.2026.07.06.01.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:28:20 -0700 (PDT)
Message-ID: <bc697542-b1e2-41c2-af36-b708ca4aad5c@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:28:16 +0200
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
        Chen Wang <chen.wang@linux.dev>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Michael Walle
 <mwalle@kernel.org>,
        Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Hammer Hsieh <hammerh0314@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Alexey Charkov <alchark@gmail.com>,
        Sean Anderson <sean.anderson@linux.dev>,
        Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
 <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev> <aktWoIfY_DdO6gb4@monoceros>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <aktWoIfY_DdO6gb4@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX55cjGRMSBQDW
 F9FsB/D1vG1IUF6a2ZsH/d1O/ps1l0plgn68r2u+zYG9rl3F8gBO3W086K4bbhAWX5Yl5aZcm9D
 kAhMxELdtIlkAlxDlPJw8BpH1lPP/JQ=
X-Proofpoint-GUID: dmHVlOZVT3DXZFOaOhE2n_LjR1tRRBYi
X-Proofpoint-ORIG-GUID: dmHVlOZVT3DXZFOaOhE2n_LjR1tRRBYi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX91RTGlTMZ5sX
 4HR+BQYIJn6w6JY0/NRrN4CT21I7mlQ/+woJh/kQiWS78HE/L2os0C/5GGOFlKrGLzRQjpCV96O
 OA6cYmLi+/l8jDVgOlQKhWd6/UrFleY/ubejEqpEcqXgR3wmIUY+xSl764iNqIerLXu8mi3BE3u
 NCtEZPuTpEeJDrxcGbw5n/ay1pnyKZdVALstQ8XXtIxrykgHQhcjQc7ONH3NtGKIKovaln1Vscu
 nJPerQ5uJZjR4MtfC61pYpIQC1sW2+mRU/OvO8Tp3spKfYrHLSISu7rocS6HIZxPb586kIAwG6K
 bdHThZa31kKSAP0zw30rX5bJNg8ekkEnYGnDDHTUANej4C+Ch8YtxSC8CzLYuhjSPd1EDbayjoC
 IkCJv5eY9gjaBxyHTutz33bdlwKB/G9IQiyRj+4E1uL/R+pGOweXKaJVn4Rl5ul3vB9ufmsULcD
 drwI2Uvy8i2eoKC3EZQ==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b6728 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=8pif782wAAAA:8 a=IpJZQVW2AAAA:8 a=TiEZW8bMWLlPbLH3YMsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1011 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060083

Hi Uwe,

On 6/7/26 09:19, Uwe Kleine-KÃ¶nig (The Capable Hub) wrote:
> Hello Chen,
> 
> On Mon, Jul 06, 2026 at 08:33:47AM +0800, Chen Wang wrote:
>> On 7/5/2026 11:14 PM, Uwe Kleine-König (The Capable Hub) wrote:
>>>    - Use a single space in a of_device_id array terminator; A single space
>>>      after the opening { and before the closing } in non-empty
>>>      initializers;
>>>    - No comma after an array terminator;
>>>    - Also no trailing comma after a named initializer iff the
>> iff -> if
> 
> This is actually intended. iff = "if and only if", see e.g.
> https://en.wikipedia.org/wiki/If_and_only_if .

I agree this scientific idiomatic expression is not well known
by non-native English speakers, and using the expanded form is
just simpler to review (thinking at non-native English speaker
reading your commit in the future).

> 
>>>      closing } is on the same line;
>>>
>>> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
>>
>> [......]

