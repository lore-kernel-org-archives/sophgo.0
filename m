Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D95438F249
	for <sophgo@lists.linux.dev>; Mon,  6 Jul 2026 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325293; cv=none; b=TAlsq8safWvaXMBaf6zYRHd+ljAcTI0h7ISRpsmjodwV8U4MZaUGclK5bgX4kbBKq84C8PIfR7dS1ahNljAp/gwcpGOabkDTeslsCTCDVMFIMsiAoDTQjIeSbxvNCXWHikwB/C9Nl6bUtIJogG46ZGbJLF5NtaO8u4eRQdc67nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325293; c=relaxed/simple;
	bh=6FRXXocn1lfRgJnxiPkpYYSBB5w4wnBEBhNnIuipX2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJqbk5eP4mVDWGuby8hA2eZXEEesuhRuCWjTag17RgZmEo0ZxWAThxMJfJlxFl+iIwzzyBCwJFOnUhJWWlvWOgNRPM5n7L6CUT4HBbbHsrYiPV2huBCPVhaYdJvNxkRD5WuSMHx6q4aRJqXH4W8Woez65ERJsCPsUm2eUAzR3Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59ebb89109aso2137231e0c.1
        for <sophgo@lists.linux.dev>; Mon, 06 Jul 2026 01:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325285; x=1783930085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xlcdnSGCAGaaD3Qtz41jPpd7wkV1TEYjW94sOKYd3zY=;
        b=FSyETIEO6aZ0n2gqUoVeF2FEt7jXxnd3VKK7NAc29YpHywx7K8EKf6V5Pj70t+S0r3
         KZzMn22UjJE9IHhfp4lQedqTuNVIvTv0apECClWbJyh8d764+//hK+K0+rhBzGyVcUYy
         QTP16pAhih3lm53HWaomWL8DTHZm/V1PHi9MbpkN9MN3wvhVUrOVdwikliwZYwXHHs6y
         /JT2+YPQlyIUPuDpXEetjMC9Vhx/Abid5a7chWjzKp8HUlpR6v1SqD4m07USlJgnwAVu
         nAKS7RzOCD8QYS5TUEn8MQhwiAC4m3fj66V/BIAJoVjaexe1uKC1MO/80y2F3003kn6N
         3zvA==
X-Forwarded-Encrypted: i=1; AHgh+RrfepIwxOy7bNhkz+RjDq+KddGscQ5sesrVrzWbpQkYolF4sAz/3rXOIrDUm7QP3arPjIW4EIg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4LPWdQMxPtNblyR3R0meOTH9TfwYYpZQcsSyZajo2NCWIQEYQ
	Icx4Tb8nswHfZpn3hmXoIZiHeGsXD/liFrA5I7Lrgnw2X5lwgKXUSR0mlKxcJQ/x
X-Gm-Gg: AfdE7ckq5ktroT4kwyEta2BYW8Bx6IPnSxKJf2DIyW2E+F7rtgeuRu/BDnfeXIRXmxp
	MnTZkqBcn7oMSGfLrmFld53U2N5a+6v8vwanhCthto+IeiDfihi3EWWgdak/tZwXuBsHhDfPDjT
	AaWb3FMCIJNXAG3sp4pNMAbLL4Sw5f59Miijdvowjy2KcheNb2RRW7KdfN3n3KzaINeoXzCqUh4
	Khtip5YZ9OM6+sGiE9aVUR0rCw9Wajz4wTaTz5hW76zKt7mcU12hV3TKGxlmxywe+IF3cMEjIto
	6vy44YfEQBSayVbe+Fly2M+NXyNrd4ekXSaqjVbtRRmEavXmn8I5obORPk/s99fEy4t75+zg4aX
	jPLsibp/E9XfE4Ud2/P8NbPP2j2zudfMN/KjVPFUYe9kzfW6PmJ8PwPnf3Xt3KfvjUhSVZtFNq+
	HZeT0jEHwgQ3TBou+soGu/bNiJmhtErvKq9Y4yiEuuG2rlkfURyXogQA==
X-Received: by 2002:a05:6122:6610:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-5be101fdf17mr3387804e0c.7.1783325284449;
        Mon, 06 Jul 2026 01:08:04 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5be02934c13sm4292306e0c.3.2026.07.06.01.08.04
        for <sophgo@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:08:04 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59ebb89109aso2137206e0c.1
        for <sophgo@lists.linux.dev>; Mon, 06 Jul 2026 01:08:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp5NnUiq+HlaYcH67D1RvJvqkwTjwd0u2s6R0h6EMvl+Bbt5/1iezPFg4krTp0KGq9jDR1Uen0=@lists.linux.dev
X-Received: by 2002:a05:6102:800d:b0:722:826e:1423 with SMTP id
 ada2fe7eead31-7427f0478a0mr3286706137.20.1783324855096; Mon, 06 Jul 2026
 01:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1783263835.git.ukleinek@kernel.org> <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
In-Reply-To: <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jul 2026 10:00:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
X-Gm-Features: AVVi8CfQACxAMot5VlqKHI6FXvkOZpEWhTZp1dlkgWSruFHOk1f-I-dS5kVo31s
Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Michael Walle <mwalle@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Alexey Charkov <alchark@gmail.com>, 
	Sean Anderson <sean.anderson@linux.dev>, Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 5 Jul 2026 at 17:14, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
>  - Use a single space in a of_device_id array terminator; A single space
>    after the opening { and before the closing } in non-empty
>    initializers;
>  - No comma after an array terminator;
>  - Also no trailing comma after a named initializer iff the
>    closing } is on the same line;
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

>  drivers/pwm/pwm-rcar.c            |  4 ++--
>  drivers/pwm/pwm-renesas-tpu.c     | 10 +++++-----
>  drivers/pwm/pwm-rzg2l-gpt.c       |  2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

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
