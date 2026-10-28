Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793207711;
	b=E6MEm5HTn3qYbsZawzzdzPcxuFg24vqVFzU1gpelsCxqJoWyAsuGKyZRdFL38JvSozqH
	 dFv1mQnahzQrDQLqJQrUrMvcplO+YHNfMiyDOTwRWynRjvY29Cf/G6OoTRHbqplnXiSzk
	 LRTqzXHMCmNS5gO2TSilnxYDFlk5lGxLq4iQ2TNqaySbA9MZIlw8iGc/3p4Ddg5sHh2io
	 +IadVuTtHL3PLqG4srPTRsRnOaXm+pLU18T8G4eUknLt3wpOgzGYJ5W6NBYfPrKPZ4hmL
	 TQ5LlujihPLa48oOXWmSk0lPmlx2Piy9FuHjxw1cNkvVnF/xHpc3KOSfOOb38oi8N9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LnugOozrP9VXqnObYje6VqLo7X1iy+GTdieQ0zj7BwY=;
	b=dV/2A/jAPwcidpe0mOo9KxW3DgtYaQjPgbNZjujpgo3oIMoXvjf17Odz4kQ+VacgTEnS
	 Xq/YU8StxtbMMczIKPQnqp7TiZWTlh58LeIE8SsC17STzKVlR36uwpC9iTLuRoU/+DLNo
	 3JxbEMtDqy2UQ1QAnPQXEqY+C4F1JExelekxK4o5pr/p62Z1RPCafo9swb81BNeSqAk3x
	 a4+rIOQJkdE2HmN1JC/z3piIvo6oPNacjycHWp3YP+i0wpcFTgjSe92dLB+UZ0IfZY9di
	 r//VifUSrGCN4kwTlNkD1uV6fbIP/5vSB/IBaKCyuSV1OSaCF/B+nRubV7MFNUDxkig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FX7BORYH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=blXGYfcH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FE5606A32E
	for <sophgo@lists.linux.dev>; Wed, 28 Oct 2026 17:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0FE5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FX7BORYH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=blXGYfcH
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFB6hu2070802
	for <sophgo@lists.linux.dev>; Wed, 28 Oct 2026 17:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LnugOozrP9VXqnObYje6VqLo7X1iy+GTdieQ0zj7BwY=; b=FX7BORYHJdGVYKvP
	zR05piPoIjX63d2tWSfCH0J6bCKixFpnUmf1n0mhrH3EC29X58LJUIr0LMWnDcrt
	bhBIetCLQUndTqTHCfCeDfME5hyzY1n3eqewj40uPzif/a0i3be5ZtooHM/QHDq5
	VDW90hWYqF0meKrmTr6FHQWoz1ztHZvQk/2ymvsLUXEW60148Tto7S/iOHhqVac2
	0VL2hz16Pjb0nLEdQZAoea1bXtJaWNLpNaDT840VxNPKzHnIWXv8/dM7Z28XoDAA
	4oMdN4NRefuwGCVQ5hCYsMIP9DFz0ZoQZGDorG5vt14rJWtpcHyc2cAf38G3DxQK
	mJtQfw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7kdwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Wed, 28 Oct 2026 17:15:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd0b795aa8cso1416493a12.0
        for <sophgo@lists.linux.dev>; Wed, 28 Oct 2026 10:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793207709; cv=none;
        d=google.com; s=arc-20260327;
        b=Wc1+nqinD3XnLofsVSxy+jiFtZW/6X54WConmhertAHMXgKaMxxQ0zD5NoUtJ4eU5H
         cWw6LmAwTIItOobbthsDjtjlT2NWIbyCg2MPV1kQCM8MZ1erlpecmiiS4duh5Wz3PLIo
         FG4qFKMX1v0zKxRjsxFCaBcQhqxhLVhkGR+ADWdj4wsZ+bGhtp+IxG8kumKdM4s+lCdp
         PuUmkEaj3TI2W5vCygC5riRD9YYpbEzqW2GZvTHh60H84s45V10q3Yg6PilCbVG9Kt5n
         BH8n5CzzkpRw57KGTrwmXodl1Js3JCFEE9m8XcTpYaHez3eRUZUeJ9ksWMV8RYbuskGN
         WKmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LnugOozrP9VXqnObYje6VqLo7X1iy+GTdieQ0zj7BwY=;
        fh=FAqNT4wvd5ymnaxaqerSjC8hWOzYQ+AqH5RhdBxTZm8=;
        b=sDT8JPoHg18UJfF5wITW+4Crj7bFz7Iv1IxTXPQpHJHJjK5XJRuOITNBuH+C35tWWd
         Cm3ca7q8E06pbsSUpS+KvpWAlelFeXvr39hg+08TJdCL8NJXH6EfQ3hgf6Mr32zGVhfq
         Vs54FyElcTinro268dnahQbQ94KBznySUHr7AvJ5HuA0ky7NV5LSPagfmJyeafaBjT6n
         JQiF8n4ILWzrxqMyCosHuh2nUCTUwfMOWkBJbNA5WQ+k6LZDGPees2zgVAEAlU7TZNKJ
         DIxFBzC2En7ZSKBgOqraXFHG3anNTVDLr3plOLJmjuzbORAAnardqgp+YNGe1rHxtMt4
         SfSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793207709; x=1793812509; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LnugOozrP9VXqnObYje6VqLo7X1iy+GTdieQ0zj7BwY=;
        b=blXGYfcHKehMhAEwyKHZUuZTijK/rIDyGBBaNNmkDIb5EO7SHepVhMnKAP9Y6P9gM1
         0doXW9iGqDP3HpQdQtHPUUgrgfSBUsX/oPQ1Epx+yCIpoFZYT1op+nlaNrNPKHwibJvT
         e2I2r7aLUPhotaEl/hOkOYGUR1Y28CAugm9r5nKW8yERQcLQxlbnAgvMR2pt+WKSDx/H
         tySdl56CJqz+cEfLY8c1C8Y2fxWjO61J2GskGIFT8YfQken8jeBmL4LiV1Pt1oEVjGL5
         el2a0JxaWKUAAXUzOZSRTybIuUTqHsrEb9GM+MCPWGe7BAzRbbUiJvYSkGpPuTapLWtU
         ii+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207709; x=1793812509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnugOozrP9VXqnObYje6VqLo7X1iy+GTdieQ0zj7BwY=;
        b=hQlYEjZdQCvv7Ola6kwHJFuwEO087HGVegEf8RwfiZtdN0ZXxgmHRDaWLAFKedXHdC
         cUCD+1nDZ1GgvP63UDNf6JpgepRwdW2RpUVk/nI+0/fyIe6l0rTj1T1uZq9KEwdMD2zd
         uYapMpNo96mtJiFMcy3UvWdM+GYgChGdrPJRHbS0Zo/SJrFjL9dgi+KVuJtr9O9Wt3qy
         Woo1EXCGOOJWEY4aZtQlp6pIhDWePszDcIcWB5UzVNw/hFaeK3neqBW9o7vcjN6zeSnm
         SxHMl6RKju7mANlxSLtnymKH8qWyElNrbpS+hXHv8b+TiYeOxFRzFg01htUQtvkzjQm1
         dWuA==
X-Forwarded-Encrypted: i=1; AKwUvByz3J9l8XvMPHcXfzN3Gyv7m9BSG1vUUGVh+O7TG9c7ErXhzTgqXJn9BBYNiTi4UK6UzhGmiFI=@lists.linux.dev
X-Gm-Message-State: AFq9FYI13Z4so6g6kFvbCzoeBSeMWKfIclCdNhINv7Vgxh7nRfpELNPm
	0znH0V4qLZoNcBiOoCyh+k0cn6lT1qYjvgZXiZswMoMNL8u+bBOdpokUkH/cKZmXpBd67xV0j5e
	hbAhXiuFtbCz72faX/zL9t4rZFASFbBw5g2jdwEZtamMiYR/HOg7En+HlH4GFRT8xucLkPn4eiB
	MHfvnsvgziScQY114RAzezQRHp4RhNMjL2Qw==
X-Gm-Gg: AYBFou2lxmnzPwK6T6LJByHNtdowHVkqwNVg+s5kzCDGUprPhYRXfpUOCzvKTz/vcyi
	06MI2xf4CxT4ur9AKbQTnsRLO0zJCZgxNIZpDHfVhnPKSML7MTtEU8ptjcYg3XpyxXVmRC5Kql8
	UFwrNEavbdXfax7rNweVhGJ0LWEb3hRZVOvgzO4j7EZye9fyoj/ecmZ1ZIFg==
X-Received: by 2002:a17:90b:4cd0:b0:3a9:79b4:d85 with SMTP id 98e67ed59e1d1-3ae6eff7393mr71039a91.32.1793207708739;
        Wed, 28 Oct 2026 10:15:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4cd0:b0:3a9:79b4:d85 with SMTP id
 98e67ed59e1d1-3ae6eff7393mr71013a91.32.1793207708003; Wed, 28 Oct 2026
 10:15:08 -0700 (PDT)
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260930103258.13375-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20260930103258.13375-1-changhuang.liang@starfivetech.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:14:53 +0100
X-Gm-Features: AclHuK8CaXJNTmA5tKbBoAyE77_drdIKa6H1QBEjzQPCv7RqE6LaFLcpv1yZaLg
Message-ID: <CAPx+jO9dthZCQ4V-25PKGgEJ2qF9Znu6VVFECYhjB-JabyV=6w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add StarFive JHB100 DWCMSHC controller support
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Inochi Amaoto <inochiama@gmail.com>, Chen Wang <chen.wang@linux.dev>,
        Jisheng Zhang <jszhang@kernel.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        sophgo@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX/rNMll/s+TvM
 GIBbyxoENl0lqz9GLoqbDnPMjhixFRw35T86z2fChr5IYdp65oooRH0+gHqfkr2oGc+kMUI9KJx
 Eie3nE/oMAe07N0wOFmesNgLdPDnxQI=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae22d9d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=Bq6zwJu1AAAA:8
 a=N58GgX4bPs6XW67x5a0A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=KQ6X2bKhxX7Fj2iT9C4S:22
X-Proofpoint-GUID: DY-M0V7mdtTQg7nSUjF-RkCefRN4UiI-
X-Proofpoint-ORIG-GUID: DY-M0V7mdtTQg7nSUjF-RkCefRN4UiI-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfXzl6mYbhEJ/lK
 Vo8ie9o2jJRXrxeOaz2XjnmWj2kfcESBru7OHJ2Q+rZZ8e1hT9v7mrAmlS70adhYBuoiWx/dg7s
 Fyws2bXs7zpWSGMw7QvZmcf6WqwEFCj6hh/ULYJOkbxZ96OkkeCNXjmZYdkPODVEi8ZSiM6TKtW
 wxBXwhIZ8eECDYxuXvvSXqV54VH7dGGFGGdSNIdOlp7u9H5x6oMEvJ+RK9chOznPXzeo2hyS6C5
 3x+8tsk/hTTH2RwedtQM9cDOt4lQ5a53FRSIR8hHsC4edDe9uDy/X1AzONO9OQCgJmP+pxY2Ito
 IN6NpFrNbeWf682QalAGOz3LsWN6IcY8jn95EzoF2dYQoDu5f73sIO17TXLA1oxqj4Qo056Utfg
 MeABnA1telYrIgv6LpGLfTV/LfP7sRk8j2Pd27xnCv7+asyxDLErN+Cyg009MOdcJVMguq4uq2V
 bYKzUm7Ps5EmkHj26OQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280068

On Wed, Sep 30, 2026 at 12:33=E2=80=AFPM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:
>
> Add DWCMSHC controller driver for StarFive JHB100 SoC.
> This series has been tested on the JHB100 EVB1 board.
>
> Due to syscon limitations, it is necessary to use dma-ranges
> to restrict the DMA address space of the eMMC controller to:
> [0x400000000 - 0x4ffffffff]
>
> bus_nioc_4g: bus_nioc_4g {
>         compatible =3D "simple-bus";
>         #address-cells =3D <2>;
>         #size-cells =3D <2>;
>         dma-noncoherent;
>         ranges;
>         dma-ranges =3D <0x4 0x00000000 0x0 0x40000000 0x1 0x0>,
>                      <0x4 0x00000000 0x4 0x00000000 0x1 0x0>;
>
>         emmc0: mmc@11b00000 {
>                 compatible =3D "starfive,jhb100-dwcmshc";
>                 reg =3D <0x0 0x11b00000 0x0 0x10000>;
>         };
> };
>
> Changes since v1:
>
> patch 1:
> - Add Krzysztof's Reviewed-by tag
>
> patch 2:
> - Fix the DMA address range error in the commit message
> - Clarify the 36-bit DMA capability and its constraints
> - Add a named macro for the JHB100 delay line value
> - Use dwcmshc_reset instead of sdhci_reset
> - Detect 1.8V capability from mmc->caps/caps2 instead of DT properties
> - In sdhci_jhb100_set_clock(), keep cclk_tx gated when clock is 0.
>
> v1: https://lore.kernel.org/all/20260919092950.178617-1-changhuang.liang@=
starfivetech.com/
>
> Changhuang Liang (2):
>   dt-bindings: mmc: snps,dwcmshc-sdhci: Add starfive,jhb100-dwcmshc
>   mmc: sdhci-of-dwcmshc: Add support for StarFive JHB100
>
>  .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |  74 +++++++-
>  drivers/mmc/host/sdhci-of-dwcmshc.c           | 169 ++++++++++++++++++
>  2 files changed, 239 insertions(+), 4 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe
