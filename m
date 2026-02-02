Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C450A2EDD41
	for <sophgo@lists.linux.dev>; Mon,  2 Feb 2026 21:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770067891; cv=none; b=rbjRCVgJQLjGtp15HnW+wBq8R+5Zs/IaAAQTNTiavbmLUVg5Exsbg7m+DAv72OtRHmgUv7AFtl9F0DjKYNOYxXXSfmI4+7Kh1Z+9SO4dqFLwJhM9VrpBjZGYxmA0I7d8DCnKXSqoDrdfyeMXic3iE5Z99uuxbTbreBEnAMMqaQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770067891; c=relaxed/simple;
	bh=cyc6OoN+kI+3TAVGBTSTHp1l4SopH0CyprjPmJtiexE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dWK1nWOpiYLzIPGw6CylyWYTZCbfVFG7DTKHRELgZ3mrKnfXelz9Y2yLXfp/tc/Ug06dX8cB/TbU9bXyo/zePHjFt9NM/UJPLAls846h0VlpWqE+dDb84u2Nfc64Ux3gwpmsUxhbbWYcZ6Ae1QyAPA2YOa78GqGrXfEYzPaLyxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiE1RzBn; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiE1RzBn"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-88a367a1dbbso77081246d6.0
        for <sophgo@lists.linux.dev>; Mon, 02 Feb 2026 13:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770067889; x=1770672689; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lWCuWOd87xE3ipLxzMTGR23XPtyn4/7fQsE4OP6NNkM=;
        b=DiE1RzBnpVao1ajmmeDFtq+TKfdZDkVfoONUkc3PpW26T3gJcg9frQxIIn4oNRebV/
         wkQxGmgTChRPzzH3wzi31g1kiPPNCNzLeqCXzOwdY4stuh8XcXreciQ8sKDo/k5ARCAk
         7Rete7ifL5M9isnMjVLFV2aoP4vRvIh9qcthO++v4tZmumH0UyC4b1BhEE+BbKEfRkce
         ncbhZK7MaxY3r/sOvQD1H2vImwdlJFBdAorVBPRwvmmqMWYWJlbxoq1YR7u6kEI01l2w
         UuVJ5TM/KNjbTh/6lAMZeQpzhN/bZlZ9EO+Gw7tB8+9qA7atEE+Kz1Nx+1M56dn1D22Q
         84Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770067889; x=1770672689;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lWCuWOd87xE3ipLxzMTGR23XPtyn4/7fQsE4OP6NNkM=;
        b=HFyoejOXg1jbNsKlxprYrMcgySBjDUfOE1BEYBevtc6+4xoi0tmUTVoaLQ64ad1lLx
         ZLnGrQ+/QRn9mHB10Td2f8hSn7wpVufSwB08mQmusdZPpGuGdIPIn1F2k5JExx8coyfL
         MzJdeW+aHv+PpP4feMWzFhB0bta73s4HIN93v2A+2YIzy4RI5CRuLIowxkx7C7hrFBDb
         M25LDfm/ttS3kX3PdF1CTKakzHGbDyNc1q+tH12uavcAdUz6JoUHKfdLrEsBFgtSHiAd
         HyO+KEAafj4EudYqNjJnK0ALyiD8Hyxi6U3hhoN46bvIM7ZKtqrWbO4PaOwgQQFZLP0R
         tZaA==
X-Forwarded-Encrypted: i=1; AJvYcCUsQ/KdVUogQoqhE8KOF8uKCktRbAbplzBDQw3uXAl6sMkTlzmnLqFVoCdyffYpaBb18/xnf2w=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtLUSwx6k7xd3Zttzrjq+5Vv6VN9bXiQspd1ptRQbo2WazQ1Tx
	SXtJ+CVIaa4pXZZQZzjKGWWBOlgzHqMYY4lO1jAbWJeYve2+rvAp3hNP
X-Gm-Gg: AZuq6aJrmHp/OZjLKxIPfPOj2s18uOd8UIJE9JOtE0DT+QchC4+ruYQWb3evgQx116P
	scwzaR9ed/CfgAKXaaqTitdSHP3+bTAMyIhOMy5pW4s/K4nCw3RRTWhHqph4kewixuvj8WH3sUT
	/cJwkibxXyel5upgwsT6X00rKgN0FHk51jyVvZHdedWHK0b1ole5VitrEdey3479Gnss3/b129I
	vqugAIYBBMah914BLt61pA2xqn1822lbjN1LOK/TTidUGnWCSkl/CxelbOLWWGy84g8FtqlW+6E
	ivKRkncnF4Q2uMBAJl4ySZBKOpZ5kmqEn0Vu+Xzp1zsAxFCfIqRnuT0FQR7f2/x64gnHfgu2efC
	g1TSjL3oEz0YpV7P025RXhav0t836LmJ5xhBFtU5GeHWBcTjoNbDm1sct5VUbHS6p1Te7oAgAc7
	ghfkBY/I3+ChWEsyRCx3jiyuX654i34EoZp0xcp9AxKunS4PWgwZOfDELuhuIA1RMv9B8=
X-Received: by 2002:ad4:5be3:0:b0:894:7d25:d6ba with SMTP id 6a1803df08f44-894e9f40675mr182162476d6.6.1770067888668;
        Mon, 02 Feb 2026 13:31:28 -0800 (PST)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d37420c5sm121174056d6.31.2026.02.02.13.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:31:28 -0800 (PST)
Message-ID: <33cb662c718507c6ac747af4a9a3f5af10fcf5a5.camel@gmail.com>
Subject: Re: [PATCH] ASoC: sophgo: fix 64-bit division build failure
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, "Anton D. Stavinskii"
 <stavinsky@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-sound@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Mon, 02 Feb 2026 22:31:24 +0100
In-Reply-To: <20260202095323.1233553-1-arnd@kernel.org>
References: <20260202095323.1233553-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Arnd!

On Mon, 2026-02-02 at 10:53 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> cv1800b_adc_setbclk_div() does four 64-bit divisions in a row, which

3 of the 4 divisors are actually a power of two, so it would be a bug
in the compiler to issue a division for them...

Regarding the 64 bits: seems that the actual issue is the tmp variable that
is of u64 type for no reason, because priv->mclk_rate is only u32.

Maybe turning tmp into a u32 would avoid unnecessary 64-bit division
altogether?

> is rather inefficient on 32-bit systems, and using the plain division
> causes a build failure as a result:
>=20
> ERROR: modpost: "__aeabi_uldivmod" [sound/soc/sophgo/cv1800b-sound-adc.ko=
] undefined!
>=20
> Consolidate those into a single division using the div_u64() macro.
>=20
> Fixes: 4cf8752a03e6 ("ASoC: sophgo: add CV1800B internal ADC codec driver=
")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> =C2=A0sound/soc/sophgo/cv1800b-sound-adc.c | 7 ++-----
> =C2=A01 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/sound/soc/sophgo/cv1800b-sound-adc.c b/sound/soc/sophgo/cv18=
00b-sound-adc.c
> index 794030b713e9..b66761156b99 100644
> --- a/sound/soc/sophgo/cv1800b-sound-adc.c
> +++ b/sound/soc/sophgo/cv1800b-sound-adc.c
> @@ -105,11 +105,8 @@ static int cv1800b_adc_setbclk_div(struct cv1800b_pr=
iv *priv, unsigned int rate)
> =C2=A0	if (!priv->mclk_rate || !rate)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	tmp =3D priv->mclk_rate;
> -	tmp /=3D CV1800B_RXADC_WORD_LEN;
> -	tmp /=3D CV1800B_RXADC_CHANNELS;
> -	tmp /=3D rate;
> -	tmp /=3D 2;
> +	tmp =3D div_u64(priv->mclk_rate, CV1800B_RXADC_WORD_LEN *
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CV1800B_RXADC_CHANNELS * rate * 2);
> =C2=A0
> =C2=A0	if (!tmp) {
> =C2=A0		dev_err(priv->dev, "computed BCLK divider is zero\n");

--=20
Alexander Sverdlin.
