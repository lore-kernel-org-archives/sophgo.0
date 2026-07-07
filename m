Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE152EC09B
	for <sophgo@lists.linux.dev>; Tue,  7 Jul 2026 07:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410485; cv=none; b=kVJ25SL6wMOqkMd/erJSsRrFtCV7tga1KrZ7s0yCo3r/JO3uFDzIQ+GkRbvoWo70Jkif+DF6a6oIBr8e9AXyhKG+RQ0Sr9cMqvUIJ3tIiqFAb/891AZh0CGkYJflIfzLdwIHyZImSgo5qnfRvrplguMZ1x6HaegwzjhVeqRl+wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410485; c=relaxed/simple;
	bh=fTELVgDPDDa/adOsZAcvFwbR5ckIe3CM0pZ25SuNlOs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TpVfgccABseHx5M1ItfPiz29dSSt1EH8JlNtT8lWV/frFAlhJvyWZQT3C5wmTywfFbtj9pI73UwyKZxyo0WHMoyofDwfV0hzdsfsjKJukwsAaeyF4JGgpTWEvbPjHndHLTaOThFqqRckJGRnhaPfiNgy63t6ggAb+NlN9y19WOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qr8xIagy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qr8xIagy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E631F0156B
	for <sophgo@lists.linux.dev>; Tue,  7 Jul 2026 07:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783410483;
	bh=fTELVgDPDDa/adOsZAcvFwbR5ckIe3CM0pZ25SuNlOs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Qr8xIagyx3ZvdFRwQDOyaVjrunJxWrC6+trHzfCOrWDL4efKaTczCRhRnaWpZPL9w
	 RlUUxoJX5bqH139t7TLcLBoqc2GKzxuzwhHJIEl09v/QjIpaAkmmmKdbFyETt/dHKA
	 gvh3wZot9pWH++z5987HPaaFNzkZJ4lkd4JLq7TiSHOUUoirbXRrp7XXl2kVq6Lxpg
	 JyBnnOCcxFfH296ICfguEed3znxsoqaQ5HS31bHn6YhmIJ5dPJkjTUSAbnssxnJ32I
	 bELdOIGLBvKV3GRyM67aheIoorsOD0CvmP7Bu2cqvOeRWhaVIA8tz8a7HpKWZ9LECP
	 CWIaVzf0v0JTA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39b237fb695so33928741fa.2
        for <sophgo@lists.linux.dev>; Tue, 07 Jul 2026 00:48:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrG/AKV8qHJwqo4Qtj1dcQlAf2l1Uo+v+VRkS8XI6pS4Qp0UqxeL9X7HQfBPyKb/siqvjXMA7c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3QNwpJcWwm6wL0NBcZNNf5goBh8YBtFKqQl/BMrXLwT5E5a6u
	oDiSH9IrcdPdYVNdzizbZ7r8SYgUveHNOj/K38bsXAFNjLfShEthh0dbk/fWixqMZMyw39ZnRB8
	Z8H6bQkxfqrKb3q6mKjfFtkotQ+f3/Uz7+RS/hUVpOg==
X-Received: by 2002:a2e:8a84:0:b0:399:7aad:889f with SMTP id
 38308e7fff4ca-39c60016efdmr6273461fa.27.1783410481786; Tue, 07 Jul 2026
 00:48:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:48:00 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:48:00 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 00:48:00 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeZ=9Oy9rCfugiivuTWNeZc6o5RBm3T_8_Q70RsbVyjkg@mail.gmail.com>
X-Gm-Features: AVVi8CdfTk0d0MBtBeXEYxHV0em1KoWufQbF_cpMl07Jy03GCTI7kHjFfQ2Uf_Y
Message-ID: <CAMRc=MeZ=9Oy9rCfugiivuTWNeZc6o5RBm3T_8_Q70RsbVyjkg@mail.gmail.com>
Subject: Re: [PATCH net-next v12 0/7] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Christophe Roullier <christophe.roullier@foss.st.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Jul 2026 15:20:15 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
>
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
>
> The DTS changes will go in separately.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

There's one more comment to address by Uwe so there'll be a v13. For merging
strategy: there are no build-time dependencies between the PHY and MAC parts.
Vinod, Jakub: do you prefer me to split the series next time into its PHY and
MAC parts for integration?

Bart
