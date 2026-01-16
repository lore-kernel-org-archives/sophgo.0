Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1872045AD
	for <sophgo@lists.linux.dev>; Fri, 16 Jan 2026 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768567865; cv=none; b=tHkax9dv5idWne78gEqC3Vjk7xCeKDXluy/KLt+xwTd2oMc0oit6xT3TBY4UwB6UUCbN/AVTlB24AzfICizAqI8ihEyEGBWdOErQ8HCh13MQGhaAo/TIGXl3Jrzl5PT0NUBUUb/C4XEYFOzX/K7ydTRoH0AiYJWC4+ZZbWdHct4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768567865; c=relaxed/simple;
	bh=DSALMvzBwB081u4Jt8c9NpYNawx04HscrqIhArOIoek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIUG41DFt2IaM0phNCYvVyGVCU6ofWEA5XEV3wDRrimkLu2KGaB+FWjpqHPTsRUjtlhBaD02aX7EqOBfAQCdCDoFxNRaIcKrI3M7IuIGXYjBtozk4o4h9zQbhk9M17SFXHPaWrFb4caaTT9mOklV/+k7gWHOps349jDJRBxcOHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJY5o8V1; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJY5o8V1"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so23914295e9.0
        for <sophgo@lists.linux.dev>; Fri, 16 Jan 2026 04:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768567862; x=1769172662; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zTkxHu8mh7w4aqi9Nu456ezpUXh108CX0ltHIeT0yH8=;
        b=kJY5o8V1nj9bkFvFE9D7aPAv3Eg1gMCAlOD0C8TZ+u/qYxjjWrp9XbVg91T86ff5B+
         TQ3e8AQ4HqqeTVKgMEU2DMUxiNQP0dG5EivehHqUsUKRo1XlZ2aESPDc/XOWa2s/iL58
         SX9mw+RTrO1CrKOguWByFDIf3dyRjwMPcqUx+5pEpSHtbM4IVxxtWw/3FhTdcgvmROYi
         Vyt6zzYepVs0cpgnJqqF7mx2g2HdJyBweZ01S1G/ccxOr0rBQVRhe0rQtV9fG701f0LZ
         SFr3r7lBKoLyBTWL6uS7pPnoc+i/u/5T9PKYPhXTimn6ildNv10WQDiRiX5JF6c98Vf3
         r4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768567862; x=1769172662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTkxHu8mh7w4aqi9Nu456ezpUXh108CX0ltHIeT0yH8=;
        b=NUFMOYVRRak/4fBBy73KMWtXi+0RWS4ejpKmVVslElFBsf//nA24/fmpx0jx0SqZUJ
         KvL8ahyEZBkws9ESyKLFbnKnuN8/r0cZdhQDJ5W3cwKIDCbEzpII/GtrVNlYG7wxY4Ii
         2UqQeeQN4AZtzOYGuD809M9B6de2vZRB/90kXqt+oFwrl3Xu811/inLOX7zrc/5TYROt
         y3xk64Pbf6OpMPhyhV4LdUQcRohAfEiG+VIrKzUon3iOkP6GWe8LOuaDFiDI0TNe9TgN
         TytTYLyzVJlAL3dZDadEJdlDDHSO/+IsHxT768Y8LCDKIGA+dydee8OkZGP8MEQwdxPD
         ktrg==
X-Forwarded-Encrypted: i=1; AJvYcCWm0XxplRFy8nKUpErKNSMhnugEB6UbfPHRrxx896ym455iHwSy5j95fCkWJZF7cKEK+KylinI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfzF+V8wTlptnB5mnd1csxgIyQAcLY2+WoVUAWqLCj42NdGIwc
	6Qp6SyS1c9VEHrNr7FY0diYubsePb3fdMr88gic0p6XHeJE9b3phR9+k
X-Gm-Gg: AY/fxX687X8//pKEH6oX1DOY5mVbeSNuDB4p1CW2WwRhcKhEATFxJaitdohUKLqd4lu
	/8RLUQbZ4Q0+7VDlnVKaYuo/DL+I7ddyuGlNPUCJn9KzIsDXXUDUuhu5BodxTiCL8OJO9uZnGS/
	Rk3HuAsPvLGLj1Gb4WM4EoW0aZRgYq239YU75U6MnNawoXHp/3hlgu9FjRRn7PcB0RKX1DoFhzB
	fzU63XvmOtyB7EutRhZ0c/pBI6vFtGQccG3Z3u2AgB0Tnq/DHR+1o1mB41FHj3VcviOvdj8cR72
	8wyyY2znUMSXfzK6TPoTiXoTvpWQLrBFj9F892rlIyeWGaF0mTog8tuEE/GOIfz80bA735e1UCT
	EjYk/fSZpRlMjCWE5BpdTBSjW4jFpy6+Rnp3xMhVVNMZLDH3BHej9WahSZLimctzXcsSjKe0OFm
	sBSp3JAfRjvH3H/p3lndEe7izjXlkYHAQMn7ridTgFmr90YxsmFrBCZRJYsU6l3QqNpi+Bd70uK
	Q==
X-Received: by 2002:a05:6000:2004:b0:433:2f55:7cab with SMTP id ffacd0b85a97d-43569bbafd6mr3570766f8f.37.1768567861918;
        Fri, 16 Jan 2026 04:51:01 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997eb0bsm5012584f8f.34.2026.01.16.04.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:51:00 -0800 (PST)
Date: Fri, 16 Jan 2026 13:50:58 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 08/11] pinctrl: tegra-xusb: Return void in padctl
 enable/disable functions
Message-ID: <aWo0LESc5bIs1kHi@orome>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-8-a14572685cd3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bhhiv6s43avuu3l7"
Content-Disposition: inline
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-8-a14572685cd3@oss.qualcomm.com>


--bhhiv6s43avuu3l7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 08/11] pinctrl: tegra-xusb: Return void in padctl
 enable/disable functions
MIME-Version: 1.0

On Wed, Jan 14, 2026 at 04:30:09PM +0100, Krzysztof Kozlowski wrote:
> Make the padctl functions a bit simpler by returning void instead of
> always '0'.  The callers - phy init/exit - still need to return 0, but
> these are smaller function without if/branching.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--bhhiv6s43avuu3l7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlqNDIACgkQ3SOs138+
s6HKVA//WbWB3AVvEbOYpT8fr129RiWvQ5lRtQceA8fb/1Ep4k0qX0M5cVujq72g
OFie2IcJyCzuci1ZmKEf7fTaR/cjlzExIrXvmox2TLmtKm5kBAFTu2UcHzvAbRcs
VbasfUeQ/Wi7dlT6+I6JeNLYaXbstuH2RQV3NQ2BC3zPUsJk27p7DARdqBLUSNTJ
7jX2sBu0xKu5n0hrBhesTMi/zBLMI3pZvqmMlhGzTU01GSlmPz72GMI5J6YmeeF0
Midhy4ZCbs40l7nJPghjxdtQoKLhUPG6z+NzTyp9Hfelr7q/cYZ1avlAGkJ/39fI
ugJEOfjl0ed/HMarlvwrRPSTjF6f2BUKH1Ub2xGxErbhGaGvOsKGJizbjsK0CGzl
jdVsdFUF/wmzPeX27RIel8DxTdTYnhpUyZoylg7l9thjdhYGceKGJHeHb1DaOOZ+
OhsSUZlejccTbalvk7OeBxtnujGfE56nEXsSByA0C6kaDRxPZmsH9WWtp4mwIzXg
rvw2hOERLedWoFTjFynl0+3hazgw2hh21iH/uE+uOEiVwHNhPiEXeb+lJMGQbH/9
Bm2mL/1gvDYA3KxeFZbTTyNwEiGkZyPFLvwZ4hpapk8AvhFdEu/60sMZWsTRlSgx
H7CJIWp6MSs4e2ErCXbhjjucu3eJo1lFTm/bGVBosixPjjSZ720=
=VB+5
-----END PGP SIGNATURE-----

--bhhiv6s43avuu3l7--
