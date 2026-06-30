Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D35387363
	for <sophgo@lists.linux.dev>; Tue, 30 Jun 2026 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815083; cv=none; b=dLwTWBdr0eaF0Ulnw3mMTqxYo+J0DfHnLWBO7COQDOVt2OyBZ3itD3QCUkRbyimZkY76riW7IDUZOUK26DMA95n99nzO4s07slr2YPumKDUvpggL4bs6jsEL9YZWMAX3LjkX1ZsNerRITjl1wruK6VnmVrg1hADaxY48hDnHKDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815083; c=relaxed/simple;
	bh=QB+yFg75hqQqe4KF7RxRn4SKV1v/JdxFtb5/52LHcYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6aTk5awg9jNL1KRmbwwhDHyQ7eBLlS/fzXTsKSmrtug5ZcJPBRLv8dw/QajAaaXpoqMc4GN475iFVK1r699eGW1aEZ8nfR0Oxoe7tH42hvgiHwcKLTvvUzQ7EJT1+gVlmHHwPh2aT61iBQAJyxd5rRSTGPpuqT10FDemJrW5XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39669bcaadfso46920211fa.0
        for <sophgo@lists.linux.dev>; Tue, 30 Jun 2026 03:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815081; x=1783419881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+1GiMffsMJvBdu44BU50jfVnBubjZ5dimn//DJ5+Rg=;
        b=FxNn2/WOkBJqshDYhbyldSAIRE1IDEp9CKPG6oX0rRfhsn2zz5IC3xsBGq7nGQpVaT
         0mhGgex9xaYg/o0AtQCajJURL+KmdRH7oUWeVr8DlUfQVcFYaF5OzyNFIMi/kOU4eLGa
         NGaCLfl2Oum+S9hBdQXoZCNd/E9j//Yp08ZUhccY78pNGbsP4GRdtn1RBCwYZHVL2vF1
         IsUFIUN6B9Tp75owuqREPzyb7tTl5bNvyJ42Xu5Ua1vp0UKKTRIa+9HWUjXGGO2euQQj
         cDAsQydgzeKqiI6iUgMQMUCKnp30f+ldj25jmH7gs4WLzZNlosxGNzXnwRCP5Q/GoG+V
         VEOg==
X-Forwarded-Encrypted: i=1; AHgh+Rrm9W6d4RK9lgTlazvb/b8LAG5D0nj+uPBeWkpj36oKTjHQNjrRjDubyMo1eVdnU9bk9T4x8Z4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0GHku/0HNMp4nKn/egLvqfNCzR5ydkGxIWdA7xn50Pt1RtZe/
	RjT3V0IDZX84TjRaG2vicgYdILwlr5Y4/MnaXWcvZvjjRkq2ZS2nmSlDq2xvbgWosyw=
X-Gm-Gg: AfdE7cn4gA1ylUjpwy2h9Xa80V+dJBWjirAGF4M4ywRMOV/JxITEpZ4Kt6XptETRPXZ
	rb7RhJ4zilL5zf3PnACTK+YJjOBPBDEVUSm5DpW/malSvp5FRgJBex5CiH18BfdsCvQrZEAnqxP
	2BJwbvCW1Y+XQFS4s/udNN7sSF29AJ/CmKyJ2AiUlxL0NrJlYSbRkLn73xnxb6deToIRfyTDtVK
	qwtqQN1yyS1XGTvQbBpe91OjV2WS+uZuVpzjC8dMuhEQwQHoz4j7PXirhTpPtUQIo72bjxUGP1/
	n3lIVeqwQ5FCh92LKwx5UsmzdhxM98aA8vbQlisglcLwCvuX99d/n1/XySbQWECSJ9eVLEcg7oa
	t82CFI2/E5DH2gGgl5qWbe8sYDwEqNmn9p7b+g3OtjCuSBjT6MHvFD0l6C1y48EFdFLdoQsmiEn
	pgu44slFXA8DSoCPFysF5ovfjZuw18Smv6mlDDWjwDbeNhpYU3bA==
X-Received: by 2002:a2e:9193:0:b0:39b:90f:b1dc with SMTP id 38308e7fff4ca-39b1da66e8cmr4957401fa.13.1782815080392;
        Tue, 30 Jun 2026 03:24:40 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b1da1d0fdsm4429771fa.24.2026.06.30.03.24.40
        for <sophgo@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:24:40 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb89359a3so1880267e87.3
        for <sophgo@lists.linux.dev>; Tue, 30 Jun 2026 03:24:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpdRrve/AfqJ8zGbB1FQUKEDKRjqFf3233OdLU7uwq37kEyXtbRFqyV33aYqqNT/9DlJkHjfWY=@lists.linux.dev
X-Received: by 2002:a05:6402:3223:b0:695:f580:a66f with SMTP id
 4fb4d7f45d1cf-69879e3e43bmr1292708a12.21.1782814728107; Tue, 30 Jun 2026
 03:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com> <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
In-Reply-To: <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 12:18:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAPesQWMR4F_dx5axi6EwL+KfwLUmAyctLuYicaGHrkQ@mail.gmail.com>
X-Gm-Features: AVVi8CfDZI-66BCdudtb8k9h_4xIWUPsPqj5BKaSPsoCDQPTdsJgDTc_K9d7_9w
Message-ID: <CAMuHMdWAPesQWMR4F_dx5axi6EwL+KfwLUmAyctLuYicaGHrkQ@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Mon, 29 Jun 2026 at 18:54, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Mon, Jun 29, 2026 at 4:58=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, 29 Jun 2026 at 16:07, Bartosz Golaszewski <brgl@kernel.org> wro=
te:
> > > On Mon, 29 Jun 2026 15:51:31 +0200, Geert Uytterhoeven
> > > <geert@linux-m68k.org> said:
> > > > On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
> > > > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > > >> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p plat=
forms.
> > > >> This is essentially the same hardware as sa8775p rev3 but the PHY =
is
> > > >> managed by firmware over SCMI.
> > > >
> > > > So why can't it be reuse the DT bindings, and be compatible with
> > > > qcom,sa8775p-dwmac-sgmii-phy?
> > > >
> > > >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualco=
mm.com>
> > > >
> > > >> --- /dev/null
> > > >> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgm=
ii-phy.yaml
> > > >
> > > >> +  power-domains:
> > > >> +    maxItems: 1
> > > >> +
> > > >> +  power-domain-names:
> > > >> +    items:
> > > >> +      - const: serdes
> > > >
> > > >> +examples:
> > > >> +  - |
> > > >> +    phy@8901000 {
> > > >> +        compatible =3D "qcom,sa8255p-dwmac-sgmii-phy";
> > > >> +        reg =3D <0x08901000 0xe10>;
> > > >> +        #phy-cells =3D <0>;
> > > >> +        power-domains =3D <&scmi7_dvfs 0>;
> > > >> +        power-domain-names =3D "serdes";
> > > >
> > > > Ah, this uses power-domains, while the existing bindings for
> > > > qcom,sa8775p-dwmac-sgmii-phy use a clock.
> > > > I guess the clock is the correct hardware description?
> > > >
> > > > Adding to my list of examples for backing a hardware-to-SCMI remapp=
ing
> > > > driver...
> > > >
> > >
> > > Russell King asked me to put the PHY logic for SCMI pm domains into t=
he PHY
> > > driver instead of the MAC driver where it was previously. Instead of =
cramming
> > > both HLOS and firmware handling into the same driver, I figured it ma=
kes more
> > > sense to have a dedicated, cleaner driver as the two share very littl=
e code (if
> > > any).
> >
> > I think you are mixing up DT bindings and driver implementation?
>
> Ah indeed, but the bindings don't share a lot of content either.

That's the (maintenance) problem: it is essentially the same hardware,
but the DT bindings (and driver) are different. Does this scale?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
