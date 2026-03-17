Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBB73EAC8C
	for <sophgo@lists.linux.dev>; Tue, 17 Mar 2026 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756788; cv=none; b=lkTjZ/HJO1BUrG46amqHhNvQoDBT2s0BPMjWqmMPzrIH1CMDVhSE9QUYhukUrmDcJ9KnpUBFzqD55tUISA/bH+X6b7IBpydUPmlnnsFigv4EsD+3DnHA2dDjwc8JKgAoRPzDsSvz27QJ6kxXWs2w9mK7bG+UfN2kQv7CClcwAzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756788; c=relaxed/simple;
	bh=9QDalKJYBUEDUJPFs8n5F17T6oCLIOfRdQADKKa+dtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rLujsfuzbLE855ELQRNd7OppE6YBri2CTGLE2Wko5162tCATWQbF8HF8Q7t9uqRUYtIWgLmQDszk1z76gt8mb6lnb8vo10Rs4vD2FUv9UV+fQrQmj24vQmPIxABxly+10wpnGeQi5fUUDqnG5CGcDwnBhPfrWQdCWPEnm4y3lBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=smEUHuQ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="smEUHuQ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB97AC2BCB2
	for <sophgo@lists.linux.dev>; Tue, 17 Mar 2026 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773756788;
	bh=9QDalKJYBUEDUJPFs8n5F17T6oCLIOfRdQADKKa+dtg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=smEUHuQ9S4E4lZ0Z0lJcSmn+dbG4QICcCHnAV0hebiBk9ijvmV0scjnyAmZIaACQR
	 6jb46TDjXc9RxF9+uQAHMcnU4z9mPc5WFuOtCYBU+Qc2qEAfkAkSZGbHimeRFXGNPF
	 iWdHN1M0/Yb/69TE/T64a6x3aTYuqhQaliMXQcodlsPz4RAziOIKLe5aLgRLbD7c0o
	 KYhjYSe0JUxO60gJ5SVtjvRfeR9rfGqI9VLRFlOJXhVqWMAwSK3h+xGfJQzDX2oQRZ
	 9BcjBE4y4b8g8sQy/F9GkA2GybZ7h3pl7E7JxnkxP89G4bXYxy/Ip4PW8cf4OKVdW7
	 UEBgjMemsgVyg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38b13652c87so4371191fa.0
        for <sophgo@lists.linux.dev>; Tue, 17 Mar 2026 07:13:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUezRDV92FUOWggGzb3f3T68paXZG+uK3fabgD9VvRSCpbkBftZ5rT/nevrztosh89TZoFF7lA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwExOW2WQ7nbcvYP8WsE0bFOfHg6FECr+C5X7hLpopzyTk0vXq9
	ENacMkXWeEuneN1jx00YiPrfdLSOh4LywF4ApoSLuA2rrJOoYPh74BDV8XHvaImscuujgMIJcn2
	KpemfXQp0JN7jFe68b+cqyPgImFyDAKsrG4BVCY3bcw==
X-Received: by 2002:a05:651c:2115:b0:37f:c5ca:a6d4 with SMTP id
 38308e7fff4ca-38a89666433mr58706271fa.6.1773756785569; Tue, 17 Mar 2026
 07:13:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com> <64d282fd94be1546df75d7df5b47eacc0479797a.camel@redhat.com>
In-Reply-To: <64d282fd94be1546df75d7df5b47eacc0479797a.camel@redhat.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 17 Mar 2026 15:12:53 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfNcK3MLndik1jy-yhHAph5=amnTGgn-MpXXG0Uv1ifpQ@mail.gmail.com>
X-Gm-Features: AaiRm52mh793CgOH9S8BNXU-tBYi1I-pfEq9XQjt50faEkjR5xH42aEvJgG19dM
Message-ID: <CAMRc=MfNcK3MLndik1jy-yhHAph5=amnTGgn-MpXXG0Uv1ifpQ@mail.gmail.com>
Subject: Re: [PATCH net-next v9 0/6] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
To: Radu Rendec <rrendec@redhat.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
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
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 7:31=E2=80=AFPM Radu Rendec <rrendec@redhat.com> wr=
ote:
>
> On Mon, 2026-03-16 at 13:05 +0100, Bartosz Golaszewski wrote:
> > Add support for the firmware-managed variant of the DesignWare MAC on
> > the sa8255p platform. This series contains new DT bindings and driver
> > changes required to support the MAC in the STMMAC driver.
> >
> > It also reorganizes the ethqos code quite a bit to make the introductio=
n
> > of power domains into the driver a bit easier on the eye.
> >
> > The DTS changes will go in separately.
>
> I'm seeing some weird behavior with this version. The probe part looks
> good (but see below), but when I try to bring an interface up, it fails
> with ETIMEDOUT. The relevant part of the stack trace leading to the
> error is this:
>
> dwmac4_dma_reset+0x208/0x220 [stmmac]
> stmmac_reset+0x2c/0x68 [stmmac]
> stmmac_init_dma_engine+0x108/0x400 [stmmac]
> stmmac_hw_setup+0x5c/0x538 [stmmac]
> __stmmac_open+0xc8/0x2a0 [stmmac]
> stmmac_open+0xcc/0x238 [stmmac]
> __dev_open+0x138/0x2a8
>
> Now dwmac4_dma_reset() is very simple. It sets the soft reset bit in
> the DMA_BUS_MODE register, then waits for the hardware to clear it, and
> that never happens.
>
> Now, getting back to the probe part, there is one extra message
> (compared to my previous successful test on v7), which I see at the
> very end of the probing:
>
>   qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00
>   exceeds mask 0x00000f00), truncating
>
> This is a sa8775p ride board, so there are two stmmac devices. I only
> see that message for the 2nd one, which is also the one I'm trying to
> enable, and which fails.
>
> I realize this may or may not be related to your changes. But there is
> no way to test on a SCMI-pd board without them. I'm not sure how
> relevant it would be to test on the non-SCMI variant. I'm assuming the
> DMA part should work the same way (regardless of SCMI-pd), so if I can
> reproduce it there, and since I know it works on mainline Linux (that's
> where I tested v7), I could bisect and see which commit in net-next
> breaks it. If you don't have any better idea, let me know and I can
> try. Meanwhile, I'll keep poking at v9.
>

Does current net-next on its own still work? Or is the second
interface broken even without this series?

Bart
