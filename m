Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04D03E5592
	for <sophgo@lists.linux.dev>; Fri, 10 Jul 2026 08:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670595; cv=none; b=j4i+wyhQOlxSyV+DU8o88tDWj4+Hndx9ecHQskdxFcse2IT+iFVWSr1QkSiJr8JLi9VGZpEVRawuwRcd1mWZTInqHjNgZWZiY6LM3IO7xT5bVGA/5KvrAGakJF6W9rMUCAr2To5j7iaivXH7qL8nAJMtkoywLs/Y196nc0N9xLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670595; c=relaxed/simple;
	bh=DWdfXN3BNh6HNT+0goMzdBpTUvzgP37bXlBu5ybAYas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqW/bLxdBxKut3eWI09otM+UN3OncsyA8EBJo3d4UwVONLDVXUKiJMa/nRgWWsolqXXCwyyJaZcxjtjSdE1NNOrZFS1HGo1vzh4q+6MqKq5sXhtGO+S9bEI6a1tu6QmFIovLsb/OgTWurx9Qm8lVo9jlb3BbHqQle6Ui1KQUYBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IljZosE6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IljZosE6"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso3201245e9.3
        for <sophgo@lists.linux.dev>; Fri, 10 Jul 2026 01:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783670591; x=1784275391; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DWdfXN3BNh6HNT+0goMzdBpTUvzgP37bXlBu5ybAYas=;
        b=IljZosE6QWRG5Wb6zWVuDa5ameLKZX0nKC4pnbAkoFHk+hBfnZ1zUxEDNqgLIlKvmZ
         BS+/7Bs30OLBnKXLntvHmhvZeyAGXgpN9nr+0pJm+6gl/Qp5AVFtt+dlpwNQcd2XpFWM
         R6VX2Zl3ZP96P/vokbQQE2BHDcinlac/Va3ZNebvhxuOuCmjfguRXgHnjA9TSACLqDF/
         5QwtJxsxzF91ZJ6y6z2fvQAnNdZfHfD03GimcSypb525rsMn5JALpfc6bD5E8zxIZ5z2
         MYqgXJJMPNYZqJnQazx92TZOtraPpQxDE4xCeEBI1SDN8uNZ6bJqyy8QFsCw/NVGa29P
         dwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670591; x=1784275391;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWdfXN3BNh6HNT+0goMzdBpTUvzgP37bXlBu5ybAYas=;
        b=Fx2267cWeS40Vhbax3yxC9oE3owzjSVbvakXYcMo3uc6+jyZDHQ41xhca3ko1c/4fF
         MGlzsvYhuJ0+g+9o4mrX4v9JqfF7HUORieQUz+w4UHuldYlXD+jAXOUVrog9xTO9ELGV
         IvSmIYXacFoDDY46q4YRmq5JeAuZxpwMELIrwStAbbP2ejHkHpwaXLDfXRM24IN8s+gd
         Yedt1RFh0pVccfgWSBCQAYZx+msd7UpDtrUXgIaRP5jcRIm3FMqHV2gT3skhllH7dYXG
         l88ZSQMf+Tzt/vtt2+FufqFEAZqqXryETj0zrOrac16UBVNORZz+ZDt0M83I9tXaZIh5
         F4kA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7I4kQqhrD3vMzIq43qXlCsroF2kdmT1wHSZG91j6Efzqp412iiQsoKuxbx4h26blmwX0TYn8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnDU7RoucmUjrffyFNgbEFSG3m4d0ctaKlU+VUkZdB/5Q9afrm
	o43OXwybgO6xXUOHkjk2WbSJlKCFA0xfxQ2+R7kxpJTrR4vf1w7+615zgdqX4CN4WPk=
X-Gm-Gg: AfdE7cnAOsPwv/TiCkgsSm8JLYFZk8lkhzLMUfTZbRhXo2zkrxrsOR5797akuWEG3Dw
	BPcvOKocUeP8GM3UbjJE5etjKSPR2YX/gqzrPfVzxxjczt8CwTIfcusVaFk9eMHkCW2xptBNAHv
	cSnwHAceeYbYzhCm/bTj3gfXyRQOnpZKtHPOzxpqIhQClw++d10aSo59MmeZ3usZBOFsdxj4k8g
	VofEQqRLziuGKNkqSzH+XNdJJ9e1ohrt4H2S5kGGqq+gz2soyiiRYeDKf8GchOvix0xcBt74oZQ
	0i8HSo3cMbpfU+BWxUs0TZY9NWAA+uvjo3srilKCGD1jt5+bWcsMysn5zJhS5v8I1OS4DSQHSQQ
	0Yzmzcgj6eSFwjgOU5wVQcGyJZ6bLSNhn9bHeFsig0yXoR7Vh0OCXIzBIKWXUpp/FptjYEIzxUm
	0QvDV/dcA5jetSdbWoxc75pN1/kXg2zC+aG8vEZP7qmoY9WjjMsFRexdPJKseCXu6r3Wqa+0NiQ
	Bvv
X-Received: by 2002:a05:600c:e557:20b0:493:c0ec:9a5f with SMTP id 5b1f17b1804b1-493e68ddd9bmr75755495e9.19.1783670590951;
        Fri, 10 Jul 2026 01:03:10 -0700 (PDT)
Received: from localhost (p200300f65f47db04fbea22a44ee9ba38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fbea:22a4:4ee9:ba38])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9e4d6e4csm55102028f8f.10.2026.07.10.01.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 01:03:10 -0700 (PDT)
Date: Fri, 10 Jul 2026 10:03:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Michael Walle <mwalle@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Hammer Hsieh <hammerh0314@gmail.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Alexey Charkov <alchark@gmail.com>, Sean Anderson <sean.anderson@linux.dev>, 
	Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v1 0/5] pwm: Unify arrays of various *_device_id
Message-ID: <alCm-J1wRBnhoH0C@monoceros>
References: <cover.1783263835.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iuf5svn2mmf3pdwc"
Content-Disposition: inline
In-Reply-To: <cover.1783263835.git.ukleinek@kernel.org>


--iuf5svn2mmf3pdwc
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/5] pwm: Unify arrays of various *_device_id
MIME-Version: 1.0

Hello,

On Sun, Jul 05, 2026 at 05:14:12PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> this series is part of a preparation for changing .driver_data (and
> similarily named members) of *_device_id to an anonymous union.
> See e.g.
> https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre=
=2Ecom/
> for the idea behind it. I also grabbed the opportunity to unify the
> coding style for all these arrays while going through these.
>=20
> The patch series is based on pwm/for-next + "pwm: pxa: Depend on OF and
> simplify accordingly" [1].

Applied the series with s/iff/if (and only if)/ in the of_device_id
style patch.

Best regards
Uwe

--iuf5svn2mmf3pdwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpQpzoACgkQj4D7WH0S
/k4qdwgAk8w911oLsA5aqycP2AV5trJAC5zx53mJ8LxbKoImqWjYyvmd9Kb5YCt2
LPeZPEPqg6LIhPMbDp91hBWArDL5UUUJ5OfgC8/i0zK1+zWS0B+UPtXUGxzQOkwk
stkrTAN5eVW7rhVy1AtT4N+EJVm4Y8958RVsmNi75/idP+gmhs7RdJg8zMdhrVVy
M7XB5Q1zxVcmhsx5TDStZ8tzeFMsDbMqz0s0xVECWSq50U70IwD0Scn0a1BN68kQ
+fZQMwGT3KhdqqmLJV44puWQoDqj8OwGeAuWJQykzluefOFNtRHtRhurlZQAUOrv
W4X++IXkqXbyyTO72ousttS/RpH5ig==
=4YUW
-----END PGP SIGNATURE-----

--iuf5svn2mmf3pdwc--
