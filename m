Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6235C3A48E3
	for <sophgo@lists.linux.dev>; Sat, 17 Oct 2026 16:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792254902; cv=none; b=OOLfNaBfibaOgkPB4LnNfPKm5Ddoovd3Qwbiy8e/zarO4tleE8y36r3kAqBQUKEEfBDyGenMHzs4DrVdnJzGlXrx5ExS0sRZgfVsmtjS7lvgEjk/u6IXw6tH+U3OnpzkALF04NsQ8+n0NO2Xn1ORbBBgAjBJKKrDOPVk++dLGqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792254902; c=relaxed/simple;
	bh=3/TD6n+QNpfWoQyOgUqAMw5vaTdMgXTKy7qCbfhhy1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6EUL3IK9bSaFSBuLsjvYEpFewrOZFGLeQ1P+eVeUBoT56aHBhMKh3tFZHgdKWpiVR1kE1KPipu0K99NQGZlosLCsBKzOypwYZSJherz46wsYOrF3dXK0f3V3rGH99CEADc1ozqtzaqUUk8TKIMygLm7DCXd4PmGYXroR++Q6BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvbhEerp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hOp5c5hR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvbhEerp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hOp5c5hR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA2Q9019420
	for <sophgo@lists.linux.dev>; Sat, 17 Oct 2026 16:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M8Exf5uWUb9cZkvT1EFUDPQ1
	TTQV69aXO+M/fGf49Pw=; b=SvbhEerpHza+8SdmQLIHmI2tzCGBloUXBXclwzhH
	3zvmJVOB8xwyS3hhxJYTNNiBUKV0XY8PSqCFVNpgzc6CSSWCLvfPtkFeAkh9XIK1
	xP0T0+G1nwM3GWS7HSfRWAo/8PcMnsmd7shqnuEJ3rpDIoglzHyWZguFMOBASYUQ
	xSZvhnsNiP058el1npRPaibWiTLs12fbApd83r4HIqKT8fCMA72QZOq1uwE3l8N7
	UFCDy0DUt44epTi+3yVj932X9a0ROrwhjoNKlti0uhJoGJp9p+GEAT/QwlAJKX30
	ztQqKDxqmquratQ7dPnl35V6MTTEyo6UTZRB8hrvMHd/Fg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k16yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Sat, 17 Oct 2026 16:35:00 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so3333368c88.0
        for <sophgo@lists.linux.dev>; Sat, 17 Oct 2026 09:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792254900; x=1792859700; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M8Exf5uWUb9cZkvT1EFUDPQ1TTQV69aXO+M/fGf49Pw=;
        b=hOp5c5hRjtxobJm3g7F8MX5wmtsu6t7yRemNI7xe5pqfyebbpvK3VkcmLXOJTiEdb5
         g9XxlQXlFZpZzNBlJJOhSQI0IxrPSh5H0aNSr3NaV8JZmM6Qf56fHiRsLV7ezxMXp4Do
         3qKlBLBWaeWSffZUpmiyy3LCrWBXZX0d6rAtkJUiezJYpkPAv8+z20THkzF8KXkeX1Zr
         QKIemcl4/tQD//z81y/LRHO0vOD3AvDlKfMMrqvZ9QYdnzwwrvJecyjoGOu52+v/IGoK
         jbjW/qcf5YLwirNMCPr8so5OwhUPvOCA7dENiAvw8n7Q/i+BzrQHBFeZMOwsIMrwgcJI
         0jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792254900; x=1792859700;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8Exf5uWUb9cZkvT1EFUDPQ1TTQV69aXO+M/fGf49Pw=;
        b=Y5QVfG0l5wod2TJt/e05cj9vf9Vm7kSkHZ1E7EsGFcq1us1gRolTWCcEtYquqZqX11
         JOBYGasGvNoUBwPgIORbOZCzsL+mkpnZ1RiobhN4/w0Gg9L1mw+uNNdiNdY74w/S7hEo
         tiZPvEJDlWN4zV+k2kFkrQ0S7Xk4ePkQRebimbEb7CqeCpvuydX7ZYJlkTaCyK/1itTk
         AnXq/ECqR+29OJznaTbDGYBqBOj1FYST8ooqJdRXQxxWtn7yuV9ok1CdGGYvWAPH3V7w
         n9f2lpzPx3xnrM/MKZfiWBdKfSurVPnUVoRbb5CWedTrliFBy2wJPM/3NHQ8pI14/0xc
         UNYw==
X-Forwarded-Encrypted: i=1; AKwUvBzsrzmbHxSzkr6Cf4lthdRv4YdrBYH91fuGEkqbVH+E7RUtomYAG7DacHGeCjy6aNTB3FG2va4=@lists.linux.dev
X-Gm-Message-State: AFq9FYLsUk26C5tJgGcEvYEvKMDLDAb44ESisy9AFARTNvClSgEu7JHa
	bjobHjIoRHDc9fSeIE4QrVw77FV5t+auDsIXPNAnT5O5D+Dt+61b9UpbiSCmgeGQEVLRkzX1DSC
	aJcJAfJBhbsXCT1LaqA6gCFJ4WO9bKL0rIb8ICa5xpXHBKy1DnnKxLNS5EHU=
X-Gm-Gg: AYBFou3KaKp3jvVhu602Tj0Xx5ldTMOzA6NipymnRGB9iMKN3WCTT849rJ7G5Q4SiiB
	PC+qSqsRZRVn/Ybf2OToSTBKHOvNX6pQxEYgcUTrM4v48rZ8nzbnZbi2te9iFPQfHJJqLX6+gqE
	BrBtbMmzHlXPeuldGLdAXp+vuztaYgdZm13J5Mr2q977vLIryA+U2YxQDsl8EaiyxBxvEfrw4kU
	NFtrE8vgIZGOgX/924IBU9jCIhnl3lTPR0oH29rqvyOF3Lp7zqpxhSt/qruFy2PfyCZVlqoTEWF
	tFtot5dwnUIU7nJYOEVLfQmNg4PH8wIUcquDIJpKPOBzecbM0feCdfyltJkKxIf3UQ4HPkIenRw
	/Ko7F3I57c45y
X-Received: by 2002:a05:701b:205b:10b0:184:d593:2897 with SMTP id a92af1059eb24-185138b5855mr4814788c88.29.1792254899697;
        Sat, 17 Oct 2026 09:34:59 -0700 (PDT)
X-Received: by 2002:a05:701b:205b:10b0:184:d593:2897 with SMTP id a92af1059eb24-185138b5855mr4814714c88.29.1792254898926;
        Sat, 17 Oct 2026 09:34:58 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm21415852eec.20.2026.10.17.09.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:34:58 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:04:43 +0530
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
Subject: Re: [PATCH net-next v16 3/7] net: stmmac: qcom-ethqos: set serdes
 mode before powerup
Message-ID: <atOjo+X7y3WniiT3@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-3-0266c2ead980@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-3-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX10qoEnZKUYTA
 GsnGMxlQduBuEwehd3eUjKlJTGt87DIkC2+oVaFeVBBfpXdc7YP+Xv9xlQZgrPW3Z7jy4EfhovE
 pgvuyePVN7+QKCR6Pc1gimQOSn7kMefzBPw0NvsMnhxJ4M4loiWZvvo+DI3ON/Ncan6o0noLODv
 uLjzwzQAWZD2SPA2lzrd2weaAJIIaaHja4oGB1f1sbN5RsXKZcHM5PCQ1n7YL43JgM3sWqCU7Of
 WCILntJDInujtmFv6AwktnlimYW0TLrzddufJ18O5pBYhYImhJICyahgo1OMvPW1IVLqpLaV2KE
 R1VBg5JujG1+nFTJbuw6d0IemWewSm4ev2tPxqcEmm9dj1TGIjb41MjvPaoz1ezuvXNbANN/KXt
 QUbtHVdwYzTD79EQVcDLEL4O7yZBnyEaqfiQtgs7KJn7d1jXeu7T8H2ndHxO96GqNxCJsug2+h5
 ZXyq94gFNu3e3bETKHw==
X-Proofpoint-GUID: nmGY9zoEUMtE2BWtkmesPkqEwnlvYwH_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX2w+qFzpxeTb1
 IT1ZTyDMkOpKSDKafnFPi7llqhr+skaT2PCafexFiJQdl/EgBsgh7lVUNn6b6tO+bPewKbe3dGU
 0xBCQDbNl8RmJzK/l4qU4gVKEQRa/g0=
X-Proofpoint-ORIG-GUID: nmGY9zoEUMtE2BWtkmesPkqEwnlvYwH_
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad3a3b4 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6xCJM4BY7YgkIKmfACwA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170066

On Wed, Oct 14, 2026 at 02:36:42PM +0200, Bartosz Golaszewski wrote:
> Call phy_set_mode_ext() before phy_power_on() in
> qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
> SCMI systems this is required for the PHY driver to select the right
> performance level - which translates to the link speed. This is done
> ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

As mentioned in the commit message, this should be harmless for existing
non-SCMI systems and I did not see any issues while testing this series on
IQ 9075 EVK, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

