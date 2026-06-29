Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D937F319852
	for <sophgo@lists.linux.dev>; Mon, 29 Jun 2026 13:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741482; cv=none; b=eSqo7Z5LYHes3FyU96dTK8NyroszN/FhtVmUysXbjnTf28X+lVNnuOcysRyFORk0+uFK+0gSIxTP/t2RkuVOkEHVksEpW1iNS2dlll+jThD2dWxOhLfJEKrhOh55hRXALZBawinsHAE3PC9ztvr12IDEaM1YxtD4EkMTKRot9MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741482; c=relaxed/simple;
	bh=UvkvBBzeyeMqgudY2G6gDFJg27JiOFKpvozKSRN3iE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqfIm8ruEUAQHY+x23uclXbSAQaX41DpyGX+WRq1XMiAu89mSSrt+NARdAenGAtmiPX5O17sAwnkD52ltI8dkFbITJi/Pb7RmhWEUk8nLm1I6U7mqR+aUV0WIj72xl/Vt471H86jHAhwBlKjKfuagJI7pehXEnBGMTDyQxJ4C3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8f032b47e3cso8231706d6.0
        for <sophgo@lists.linux.dev>; Mon, 29 Jun 2026 06:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741480; x=1783346280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDPhNjOsxEQ0DHLYZPQfDHuBKCTUhxYTzus1J/5tEMc=;
        b=rOJ+NQR4sm5J52SzQgmoiG+A9407IaqqTLZcEJLlpLhTULkPvRzUagVxbeK3mel7qx
         /+egWvuYUCeYwzxhv//nvXvo6AGHcuTKV6kalJywx+cIqanTfY2EDSfYePgun4oI/6H/
         r96OBPg6l/Dq4+eXe0YRupxMJnYqP0uWH0UrNuP0U6HcNZFMRvQNm3C7C966W1rHzAP/
         X61+ajlQhA3D2WRHVswvIQnSFGzcN5SnZtGCZjQivCtDchw7giQFN7nFtCx5OAF6+SBh
         4pXZjWX4KEVSUuCLz3xz91xnqg9TJgNjb0/I8yXR8zF8uLscyZvGUU+kFKHKV4P+xxqC
         9mnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqtp2BYmK+q9G5OihYumKRS9HDahvT/WUgP/CNVIDpShHnB/1HIK0pm81ZZKq+uCsLwhmtg7Uo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXcBDS4Eai1Uc5j7kFtiHDQDNDUMTvgHW1uLQbLdfPckgaPY1B
	SEiHc8vSVDZsDi0g3fyQU3yIYBkNyx3rPp076f8pRbSD5HQkcivjapHJ94mMyhnl
X-Gm-Gg: AfdE7cmkYtN0Z8+kk48MlLjEKBqUYCet7ysme2yxe97fCs9MqsKAHLihyl8u2thr5cj
	gTvOTplKR2rq1A3AaJSsOOmLZKrKTQ9XGUTs3kIxN+3OklnuWhzUh5qkfLp2teItneh8Y5YHDdd
	7RVx8YaLpw9Tqmhk1VvoR1SyNVP/NW9JFwjJ6xuKmN6VLcnngFjCbKGnCJ1RPAuE+rBAoJCE7W6
	PUaC9DEl7uMgSw2DjgkNUWXxK/pZ6M8u4ceFrdvK+HX3fOu1QP7mPccxmYwM+0f59/GX6PDrHuP
	7zbuAQdMuPYOMXG722Gzr34eHTrKas4A27/KHffgSqZOf6NkCnk6mlHi2rTmqfSz9WZ6rhXA8nz
	OtkRf41xWkte6a4GxFhKzZTw/XoBH5158meu5b581AOkSoqD6kqS2dDFwmAZhLLFPP7EA/mKVlO
	4PIf0hUUERaFk2r74YUtF//Ai58MqTtKbXU+QOHxWNFSyDakm77w==
X-Received: by 2002:a05:6214:3385:b0:8f1:3bc5:5a61 with SMTP id 6a1803df08f44-8f1578e9e5emr13656136d6.25.1782741479298;
        Mon, 29 Jun 2026 06:57:59 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ea681172aasm92249886d6.40.2026.06.29.06.57.58
        for <sophgo@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:57:58 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8efcef23d21so14036016d6.2
        for <sophgo@lists.linux.dev>; Mon, 29 Jun 2026 06:57:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro21MN/Pp5r1q+xaBVPhChUa9GStOFniG3mTiYfq7cId7GMY16sySHOmKY2+rtdGFUWKyFcpS8=@lists.linux.dev
X-Received: by 2002:a05:6102:c93:b0:739:86da:7777 with SMTP id
 ada2fe7eead31-739fa951f6emr430364137.27.1782741103904; Mon, 29 Jun 2026
 06:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com> <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 15:51:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
X-Gm-Features: AVVi8CdHRRLXddfc63bNJYLQ9RF__6zMi6ngPMxYGYM87lHlKy_8kZoakyQBXrY
Message-ID: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
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
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

Thanks for your patch!

On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
> This is essentially the same hardware as sa8775p rev3 but the PHY is
> managed by firmware over SCMI.

So why can't it be reuse the DT bindings, and be compatible with
qcom,sa8775p-dwmac-sgmii-phy?

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml

> +  power-domains:
> +    maxItems: 1
> +
> +  power-domain-names:
> +    items:
> +      - const: serdes

> +examples:
> +  - |
> +    phy@8901000 {
> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> +        reg = <0x08901000 0xe10>;
> +        #phy-cells = <0>;
> +        power-domains = <&scmi7_dvfs 0>;
> +        power-domain-names = "serdes";

Ah, this uses power-domains, while the existing bindings for
qcom,sa8775p-dwmac-sgmii-phy use a clock.
I guess the clock is the correct hardware description?

Adding to my list of examples for backing a hardware-to-SCMI remapping
driver...

> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
