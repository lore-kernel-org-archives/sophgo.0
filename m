Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161A83C3443
	for <sophgo@lists.linux.dev>; Thu,  1 Oct 2026 07:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840412; cv=none; b=Kf4iQxcFVm6OtaeqXlpy1ryC2y276JiJZR25HiRZyC5xcO7Asxb/2uu+8sAH+oNBBlyZ6wQ9noWeUigiKFoiyNHLPRKy8sFm3NTYWX0Oe/zZ8mx+57QddndZ39K6n0jNrzkvqJioTbV/AGHSrR/2SO9x/SHBiWZccrHSzGI5MwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840412; c=relaxed/simple;
	bh=prgThMa3RDaqzpouVznTJCw2SnOG3567R/8UJXmM108=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jrho/bl+tXOaRoW/7fG3tJRPumOvH1bHeQlZoRwxhewthAUZKrzLjpN5mCwvRelahfH4ecmmqWv6uAQNWSvq1NAqLXn9zEupadtaxKdUrg2BtH2CzTkM0SMrA1Tp5ofQWUSn5HQH0UQwXx/Q65CTSBb3cfdrnGLYk6As9Ecn1pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7Ip35yk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7Ip35yk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A056C1F000FF
	for <sophgo@lists.linux.dev>; Thu,  1 Oct 2026 07:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790840410;
	bh=6/ClGyojAdsXGc/BQReGBNWEln4ElamcBkeTBZDQp5g=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=f7Ip35ykhBRv3QisfvNCglT9nXT9FA2vTItLSyZissds0JavuMeaDtRzv3iOWnuGF
	 7RxBJTHE/NJQpzRI/JVamF8KCKwote0hze8N7UblUDUnWdyC56wIaGOGOXVmvRcgGz
	 BVGLHXcbSZn+aI9o4i/Tsz77eadhavJXU33W4/nLQSjNK2xukOAXIpdP/mcEwtdGw9
	 9zdZcsCHSYDDNX1bXSzXaJ2lboJELTf2lbBkkceqbqYbqoOmbDJhxrj1+Zy7jdTtkG
	 rIZzRXA8BqqZG7RM3ywFtAOTsv2hAf025ZIVP6Pqzg+BCusxVFAyn+8i/fFI2InqiR
	 Edb5Dk8fZZMrQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3e27d525so1269191e87.1
        for <sophgo@lists.linux.dev>; Thu, 01 Oct 2026 00:40:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwnS2Tu8IW+aQRCDdYy9BYkzhOSr1cGFHVBY3ufqoDkarDkmjxlEmxI+pZe55P1BehGWEAb4IA=@lists.linux.dev
X-Gm-Message-State: AFq9FYIDoigMP5s8c43CLmjdnNLEEnN1IXlGloHbIvSL/TUrVAyDnOn2
	Fk0bfvqmgrj3DKPeS4xImSFfDiICEPAsVx/Oq7DEkwwN+nHxLKQsVrCxgEH4G6gQqoKcW76SO7X
	SJk7Pj3GMVc7DUsGA/TlT+7fiKgRYuF6A4a5E6iv6oA==
X-Received: by 2002:a05:6512:2115:b0:5b8:f4ad:6e49 with SMTP id
 2adb3069b0e04-5ba402b86b1mr998420e87.8.1790840013059; Thu, 01 Oct 2026
 00:33:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 10:33:32 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 10:33:32 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260930163217.4003d232@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
 <20260923-qcom-sa8255p-emac-v15-3-e82f33720737@oss.qualcomm.com> <20260930163217.4003d232@kernel.org>
Date: Thu, 1 Oct 2026 10:33:32 +0300
X-Gmail-Original-Message-ID: <CAMRc=MfEHHny4x8pi-M-WqvcTxFY+98TvRa1jFTKQBjYCzy8FQ@mail.gmail.com>
X-Gm-Features: AclHuK_lOavdmNlSvx0sNUPmny1qPtgCYs4QE7hryCERWbwB8_l7zIoUuzlYZiM
Message-ID: <CAMRc=MfEHHny4x8pi-M-WqvcTxFY+98TvRa1jFTKQBjYCzy8FQ@mail.gmail.com>
Subject: Re: [PATCH net-next v15 3/9] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Christophe Roullier <christophe.roullier@foss.st.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 01:32:17 +0200, Jakub Kicinski <kuba@kernel.org> said:
> On Wed, 23 Sep 2026 17:14:37 +0200 Bartosz Golaszewski wrote:
>> Implement support for the firmware-managed SGMII/SerDes PHY present on
>> Qualcomm platforms. Do this as a separate driver from the HLOS-managed
>> variant as they don't share almost any code.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/Kconfig                   |  10 +++
>>  drivers/phy/qualcomm/Makefile                  |   1 +
>>  drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c | 117 +++++++++++++++++++++++++
>>  3 files changed, 128 insertions(+)
>
> Hmm, why is this here? is there a hard dependency?
> Otherwise it'd be better to send it separately out to Vinod,
> this is drivers/phy after all.
>

Heh, it's always the same question of whether to split larger series into
per-subsystem threads or keep them together in order to provide the full
picture and let maintainers pick up subsets of patches. I've been yelled at
for doing both in the past. :)

Ok, I'll split the next iteration into smaller chunks.

Bart
