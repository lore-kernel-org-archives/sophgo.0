Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5995B207A09
	for <sophgo@lists.linux.dev>; Thu, 13 Nov 2025 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763041321; cv=none; b=DaRXlq6LRRhHbGKeSHfzPBSzZ4A345xYjAYpvs17KJfc6h9MQt3U0TG5ULLJk0gqePmBzB6qXtBoqeH3evnzhXxw3pH4O3GRzEvkbIajuSJ81yTAObx2M5npFc0fG51i+5sQTUewot0NtA8J7llWGzmqNOfXOddH4y3eMQBH4HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763041321; c=relaxed/simple;
	bh=GLqncc5/5zGkwI1+bv2pb78gB9RyxcsUzYNiDGa3NKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JYJW46IsNJCYVNO/TcgCOYx+dcIsxQxIxWwaGoAr517jPILF0NvkLBNxcSsCWIubS6/k3LhJMNYCDOS75O5a0yvwYsQLo9AidjwEHJZAw6baQjvUGJpwyivJR/U+jaQqzZZhTB8U26tDHNJYpiQkTacyi0oBO2axXlNWlbg8D94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Q/eWlEY8; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Q/eWlEY8"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5957f0218a1so803009e87.3
        for <sophgo@lists.linux.dev>; Thu, 13 Nov 2025 05:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763041316; x=1763646116; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6YFPbYQaXtcm5LdD7/GneIOXBdjWXCgrgn8VVQE3So=;
        b=Q/eWlEY8rYsnw6zJoL1IjUxFTiePCoGWS9fdZE7n2E+pQ40QqgwXbMq7pR4jxSKiJb
         TwJY9rilzEpErcuoy9BgSjXzumalTUiVkVQiHuXUKwLywLcJPgjeeW4g95RGiN0huZtw
         dS8icS3jV/8qivqFpblBrnL2tWJ6o5IaDsNol9NEOtGdicfNV3ngEQksQ75OgMFo/KTm
         stMb/m5SaU2ML68wyXnsQXp5+F9UjsD5o6P1NbgI/tRhOEnN0SPZ143Rqe0tpDNXMj1A
         Hzsbno1tB8KfSlIqOCuzdeqPXrANmkqL1i+uru2FyUYHjDVa4QgHjUuEj6MAUXUE0FxQ
         QPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763041316; x=1763646116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6YFPbYQaXtcm5LdD7/GneIOXBdjWXCgrgn8VVQE3So=;
        b=rTUJlq6KIT+6IH3Y7V3rzNcoWh1EOWzS2j3VRp/PYPwEp8s39wjXZjM8MLW+jhYDJt
         o7YvokDb0XFSJ8dQeTvZMYqnhaD4Vr1XBDGZxo5TH16PmWhzzIFXt6clpUUUgLeRvNa2
         wb3GN24r6dFf2af9aDiA5JX1k/ka35rILMKJZBdLEPRaGaT4eZsVa+JNdPwMjhmrg20x
         99RKRF9/hZ0lktwq8XsfUARb6R++52n6M/qXqy7EZnI4tNINLiqHcSDKLur+ySjGsaHh
         6XFJlmQhaLdxqECfFLpsKOR/9t7MwyZC53X2gluXdI96JeJTfMIZNiqPhzWVEjPF+gLS
         0pNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXks5j3rLX4IxAsFOFzF3bi0Gk1T4K4Ei9Cv+4ouYAvBMt/SQ2Yqdc+FysLinP4Zcv9Q4+Zsvo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxajf4X0z90gOgpM1WtqpUpE1iS9mIk2ZzMS7SKA5s4z3hpThiz
	4ggnqkZesljUZPsoRQCrPBhwEcd/cuLYXNdRv/Yr2ttsXQ/ajuGU3UBD1otdTH22aSGTsTORjRV
	vm7zyAUUI2yk8oEhocE7M5z6f6aebBm8LBNMcGmfqsw==
X-Gm-Gg: ASbGncu2buUMoj6d+4KAxD/UIOCzPfznJobaNT1J+fQX6v9SeDqU+It+zWskipn1hwy
	qkzdDN9glCJgDR4lx6l52PdzrTR8/UZArXZxNe+O6bfk3CZm/OOxDCEt0TWzXj6WJWUvAoNMvZk
	4jkeJYHqizvNxVybqGgLyGf94MP07sDqZxzh8rQWGJCLAesKJCFPNo80N6JmN05KM/NX2ZNVNuv
	ThK1Cib4cjwep7C4RH4Fa9KPdcuir4QNu93IwDU80/U+WV76ylJlfOASY81qQMLWjXnp7xCWUaP
	5/Llz9+tMegklD2W
X-Google-Smtp-Source: AGHT+IGgWlCG9kIv5RM7lpIk9LC7ddziZ8QniI5XBDNtHyHFdpWvdUKYxGgON08x+t3awJ+Cz4M6eIo1aCJcpUc2eyg=
X-Received: by 2002:a05:6512:3c8c:b0:594:2fde:a159 with SMTP id
 2adb3069b0e04-59576e552camr2521011e87.43.1763041316428; Thu, 13 Nov 2025
 05:41:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org> <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
 <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com> <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
In-Reply-To: <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:41:44 +0100
X-Gm-Features: AWmQ_bk13TVZ2MEYPAt7pfoLg7e0lkaPcfsA9km-tpYIh11AXtLgw1MABlXNgK4
Message-ID: <CAMRc=MeuByh=N_-F2+zPiqnh+Qp9u97kiMheLJ-xxcSZSy+_tw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device properties
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthew Gerlach <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Shuang Liang <liangshuang@eswincomputing.com>, 
	Zhi Li <lizhi2@eswincomputing.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
	Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 2:33=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/13/25 2:18 PM, Bartosz Golaszewski wrote:
> > On Fri, Nov 7, 2025 at 11:49=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> In order to drop the dependency on CONFIG_OF, convert all device prop=
erty
> >>> getters from OF-specific to generic device properties and stop pullin=
g
> >>> in any linux/of.h symbols.
> >>>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>> ---
> >>
> >> [...]
> >>
> >>> -     if (of_property_read_bool(np, "snps,tso"))
> >>> +     if (device_property_present(dev, "snps,tso"))
> >>
> >> This is a change in behavior - "snps,tso =3D <0>" would have previousl=
y
> >> returned false, it now returns true
> >>
> >
> > This property is a boolean flag, it cannot have a value.
>
> Every DT property may have a value, so this is not as obvious as we'd
> like it to be (IIUC - unless that changed recently)
>

That's new to me. I thought that if a property is a
/schemas/types.yaml#/definitions/flag then only its boolean form is
allowed. The fact that the dtc can compile it with a value doesn't
matter as the bindings are the higher authority for DT sources?

I don't mind changing it to device_property_read_bool() but I'm not
sure if we really should.

Bartosz
