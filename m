Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD6231AA9C
	for <sophgo@lists.linux.dev>; Mon,  2 Feb 2026 22:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770069885; cv=none; b=rXBScLNJlUPWgIYqaVDXbps1apl6CQcqf48tj6mVge2jRINpbrNREJ6dUxD8+5tGOlXZFEbsAvQ8f2yIkWlfiX0yP0AUsgtZXj1w/CYG0VFxNXDimI3K+wBT8BE/iEC/nLybJv1t8m+rI+TuEV+9DPuFTk0bFWRSlRiwfmPZFcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770069885; c=relaxed/simple;
	bh=7VykqEqHfUn5733n2KE5/tx5n0O8ya9OVk/KKprmhC8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z3lXFlknOiQbyW4DwUUgmdp9jLsHqQkjgVuaJk5fCxhiKkYbny6dKuZE34lFftv28+41isA5tEsSiUkYaOlCqM2z9pMVVTbWrzlWAdDQDqUJw6qPcMYvgOoOal5irAMTMwwQzDjEIM8PGntNJUHFETsk+MjcQHLD/sbo+njI6kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1ifQ9An; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1ifQ9An"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso50626855e9.0
        for <sophgo@lists.linux.dev>; Mon, 02 Feb 2026 14:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770069882; x=1770674682; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IFLZ+5GxWIPwp0hW4yiKz6XiBiZeFbJ7SQBypDoy+TQ=;
        b=m1ifQ9Anj3N0BCfznSHHLuN+OPD+dgsV/qzVqZOMjrGKUSji0KgkTw2t6OPshoQjzq
         0xgv9qNPl44111lJWAr0aPmEYzOKh7IiqGhQ55QKDGQZMBfRPLmwPnqEhrKUijtVX8vp
         ZAbTnMmDCgVyfci//9S5MECB/ppIcbRLaB3hLkFKNbk7gQ1f8J8JWIXAX53lU9UsU50Z
         LrZOP07Q0a1Ysr/kbLNRpYuERFufKucWMZOLR+N8bsHXrjVxjqJTaDlEvCI7LLB7l+eu
         AztjHlNjEZB3icb/ekKrKm0xGT2vmVXulWac+6hNEzGb/M/q8hKX+k03ascch3HJYMQG
         42DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770069882; x=1770674682;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IFLZ+5GxWIPwp0hW4yiKz6XiBiZeFbJ7SQBypDoy+TQ=;
        b=ou8aa8hlBVaWi3IZcCm64BZHQ+yZ41bG/kxQCuSS4NhcGxXkNxwY5jv2NEddMtalc7
         ODMCUsYpi0SOCrBbhpm9nnwsKuWzLUd84feeK46tJi63meA3s8wa7iqAefwT8heahqr0
         XE3Nz1VmGPRzTQjEZROfnBEMo150aWxuDMWNJ2bWDS2bLSpenNIXha+qJWGYxGfU1DY1
         14rlL3GPpVBAt5CkZSjd75csA6y4otf4UQkCrhoGVfZoec/VTDAA2971qZq77T+SHFnf
         RdsjE6GQ80E7kHpFbi5HTeF9cfBAMLsoCSH1l1v+b9UrWWVnQcJ3smJKQzZuKphMsFlz
         KQSA==
X-Forwarded-Encrypted: i=1; AJvYcCW0jjoSHQ1VkVl2Qavqujm4541OPkNJo9foFJWfgfWnysaMJ4Xrzki0Hs/Ix7dJXBiX3SDjxng=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhyyQg2Mc6Ea5MSRFfnNePECTFsglpZB1BBD3bxlXTkJ6z2jKy
	kJfphc1QaHAYFHueZV/S6/mMeKqMmEUY99mjtmwbplHsmm450IM5i7kZ
X-Gm-Gg: AZuq6aLo1/euAX9DnLHUWTHUjY9TnRVvNfjrZfOcdI0MM3mkjeH1rpK9MRL2bMReQ5Z
	I5TOmMzCRaUv21zvhsJUL33Kb/B7XwC3cxqefxyOYI+9AsWs7BBdHFaYEOtObM1olc+P3Mybjha
	iLxR+pwI9If2ZM91nTvXT+SQOeXYOMZnCb19V1/9hTme44ixVkfpcCnrXw3V7hitU0JVIr700GJ
	CUjz+/MyyK0RpmHO2PazN12N5J4Y7NMCw8XrfZ0AV28+C3klhCC6VYrKpq3SwbCkKL+HJgTsmDK
	r8/4hDnBYAl1GNF0fxEUa2ir+7sC77QgFT3v+n5Bwn318fN2v92ZiZ6glRHRQd6U8DdRlyMIHxb
	RX7MezRNjCiTj+TaLpRynG4AdVkxovQ+Qghb7yDa0JBfso5TSGR73oOOmiNM2tcwrX0FBX1aZRZ
	zzkcgCteBp1h5kq4DKvtsn6M0tT9PZrFmFIYKLUq+imkD5V9KSRTQEaWVF20GPgjwHCzE=
X-Received: by 2002:a05:600c:3b23:b0:47e:e87f:4bba with SMTP id 5b1f17b1804b1-482db49e871mr172494235e9.29.1770069882072;
        Mon, 02 Feb 2026 14:04:42 -0800 (PST)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edfe7sm46189472f8f.14.2026.02.02.14.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 14:04:41 -0800 (PST)
Message-ID: <ac21f40fb56a8cc40c7716cb059b9acd0c0bcc5b.camel@gmail.com>
Subject: Re: [PATCH] [v2] ASoC: sophgo: fix 64-bit division build failure
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, "Anton D. Stavinskii"
 <stavinsky@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-sound@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Mon, 02 Feb 2026 23:04:40 +0100
In-Reply-To: <20260202215956.2127414-1-arnd@kernel.org>
References: <20260202215956.2127414-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2026-02-02 at 22:59 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> cv1800b_adc_setbclk_div() does four 64-bit divisions in a row, which
> is rather inefficient on 32-bit systems, and using the plain division
> causes a build failure as a result:
>=20
> ERROR: modpost: "__aeabi_uldivmod" [sound/soc/sophgo/cv1800b-sound-adc.ko=
] undefined!
>=20
> As the input value is actually a 32-bit integer, just change the type
> of the temporary value as well.
>=20
> Fixes: 4cf8752a03e6 ("ASoC: sophgo: add CV1800B internal ADC codec driver=
")
> Suggested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0sound/soc/sophgo/cv1800b-sound-adc.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/sophgo/cv1800b-sound-adc.c b/sound/soc/sophgo/cv18=
00b-sound-adc.c
> index 794030b713e9..de1c77014c2f 100644
> --- a/sound/soc/sophgo/cv1800b-sound-adc.c
> +++ b/sound/soc/sophgo/cv1800b-sound-adc.c
> @@ -100,7 +100,7 @@ static int cv1800b_adc_setbclk_div(struct cv1800b_pri=
v *priv, unsigned int rate)
> =C2=A0{
> =C2=A0	u32 val;
> =C2=A0	u32 bclk_div;
> -	u64 tmp;
> +	u32 tmp;
> =C2=A0
> =C2=A0	if (!priv->mclk_rate || !rate)
> =C2=A0		return -EINVAL;
> @@ -117,7 +117,7 @@ static int cv1800b_adc_setbclk_div(struct cv1800b_pri=
v *priv, unsigned int rate)
> =C2=A0	}
> =C2=A0
> =C2=A0	if (tmp > 256) {
> -		dev_err(priv->dev, "BCLK divider %llu out of range\n", tmp);
> +		dev_err(priv->dev, "BCLK divider %u out of range\n", tmp);
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0

--=20
Alexander Sverdlin.
