Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922A43DCD85
	for <sophgo@lists.linux.dev>; Mon, 29 Jun 2026 14:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745148; cv=none; b=t4TKuZJQ+t2std+JNVSc1Sf6VtMflVSkMC50WrgcR5qwu4i5kTEo/Y8GpK6HmUQUHZAZ3Yy2hRiS7kx/kOq6XhVsMxVPBbw39riJrLLWRUglju6RugfLKj/Coaf4V/t9cRKVKZ5rLJkFHiOjOoMmGBCBY4RhldLuy7MtjAR/5mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745148; c=relaxed/simple;
	bh=LAoZJqVfdU9+V8F5hBZtY//uWnuQHis0eN8ii8DLed0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGbZ+vr+fK6DM+bqvOKBnnsNAYhLm1o3nQrogNMuGdc849Pa5vxTgKZAMm+5prgKag8/zifhWeRHn7LL8qdEV17tZgJw+Zh74q+HAzflAqWOEk2yd4HJ9wwHgx0gRCwZKB8+WTVFizXoxSVGppIThHJZV5ar9Cheq5M1CKPVS0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6a0c7c4f55fso2546331eaf.2
        for <sophgo@lists.linux.dev>; Mon, 29 Jun 2026 07:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745146; x=1783349946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrA9ccFaco9J2BZQ3eRpFjtGI3CKCK/xF2koXbFr26M=;
        b=pdkoCvNeeP77n2ZtSPZfVczENN7L/LclBWQtFIpfoQtgzckFzhYiLmGK01cLLWqntE
         iM35A+6RwxGcJWiTCiiLExYoviA9MXPHM0CWWt+IBAuOQ23CvxrggIcvZ9xztqBAjT2b
         K26J8OQfS/wrmxH6dQy+fwGH3Tr9GZXYuGNo/PAyeJv9EHqhS3AeUxO7QDxQupu9bTwe
         bIoqHpWID2QMPzKm0LnHy118env1n76CKYq9robnA+TzEBZHMBb1azcrPVKMf6jacEEh
         iQ6+G0vRZv2jIPIPVf381OH88nBrqy3I937FYu33OMsZoqSjaVkV3ufa6XB3C5QZDlgu
         JBcA==
X-Forwarded-Encrypted: i=1; AFNElJ9p/h/VjfLz2OBAvBmcUGxf2/OUSKuN8BKaSv39NHNskpA4BRvuENpKGzA+XV0RxB0sKwpv2j8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfNeyt2sXuOjkoy0gGG4Bqh1qFRmeVoI7uf3SxAosjBGlwH1Yd
	AXXNtdOQXFc38+TLP91/AIxIns89zz5p2/ND7z1qBiQ1cBVDpya8LWkAZvWTT1dV
X-Gm-Gg: AfdE7ck63xgWe1Un7bJ08tAzaOXrNevIjdQfNxEw6s4iCdqF1sZ55LONpMbFg9/a3R9
	a8p2jdDIbNkUUCBxsuk07s6BYDpEBhu7O9svZmiMtu/VUMUqmeSqzaUroAdn5yLPIqK9rprmlr7
	UASSDPa07+tneyd1w7cKMTHjiS1MO0/xmAJSHMvBUKWu9ztD2IJKBOD1GUhgA0VjQIJrZqEn5QU
	WTuDRMEhsKRChjlc1Lb9WKchTPbqBlOplsWcWfVzB6tOucCaSyZPxzdWBdT5g7ARLyBfmvJbRBG
	0fB2ADrK23qFcSpGQyseXA0HXjtsHyhfL/ugnCmE4dkzgRI2HbSKYumZJJeOa8Sha3fH6ADlN9l
	nHY3OdKnwl8620Fg6wA7f9fOiOaNXZtP3J2JmAg99MmOvPUWHQcQAZnFQGkgfalTUQCbpy/KnN2
	iUGRPVE4EpBIBLoFVCKr8nEjZZ2zqfpoGS0J2pzDCbGLOQGls+usKvxw==
X-Received: by 2002:a05:6820:c2c2:20b0:6a1:4fbf:5f45 with SMTP id 006d021491bc7-6a189078adfmr19316eaf.19.1782745146406;
        Mon, 29 Jun 2026 07:59:06 -0700 (PDT)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com. [209.85.167.175])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ebf891b8sm15325a34.6.2026.06.29.07.59.05
        for <sophgo@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:59:05 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4877a7b451dso2309594b6e.0
        for <sophgo@lists.linux.dev>; Mon, 29 Jun 2026 07:59:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9nJA0B0IJ4+4foSnghrFLZ88n0grVqg6vANNmiNkyR1PcHJcYgRWlXToz3zM3CqEtpj1K9yGs=@lists.linux.dev
X-Received: by 2002:a05:6102:c86:b0:738:ecd7:198e with SMTP id
 ada2fe7eead31-738ecd71defmr1394925137.19.1782744721048; Mon, 29 Jun 2026
 07:52:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com> <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
In-Reply-To: <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 16:51:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
X-Gm-Features: AVVi8CdkJoaQviVQ7ltoNYHwA2g-kW32TDsBBJn2QkEKdC-zwJrV4O3to75iJ6g
Message-ID: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
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
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 29 Jun 2026 at 16:07, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Mon, 29 Jun 2026 15:51:31 +0200, Geert Uytterhoeven
> <geert@linux-m68k.org> said:
> > On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
> > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
> >> This is essentially the same hardware as sa8775p rev3 but the PHY is
> >> managed by firmware over SCMI.
> >
> > So why can't it be reuse the DT bindings, and be compatible with
> > qcom,sa8775p-dwmac-sgmii-phy?
> >
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
> >
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  power-domain-names:
> >> +    items:
> >> +      - const: serdes
> >
> >> +examples:
> >> +  - |
> >> +    phy@8901000 {
> >> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> >> +        reg = <0x08901000 0xe10>;
> >> +        #phy-cells = <0>;
> >> +        power-domains = <&scmi7_dvfs 0>;
> >> +        power-domain-names = "serdes";
> >
> > Ah, this uses power-domains, while the existing bindings for
> > qcom,sa8775p-dwmac-sgmii-phy use a clock.
> > I guess the clock is the correct hardware description?
> >
> > Adding to my list of examples for backing a hardware-to-SCMI remapping
> > driver...
> >
>
> Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
> driver instead of the MAC driver where it was previously. Instead of cramming
> both HLOS and firmware handling into the same driver, I figured it makes more
> sense to have a dedicated, cleaner driver as the two share very little code (if
> any).

I think you are mixing up DT bindings and driver implementation?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
