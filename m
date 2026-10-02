Received: from mail-lr2-f31.google.com (mail-lr2-f31.google.com [74.125.230.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28A61B6D08
	for <sophgo@lists.linux.dev>; Fri,  2 Oct 2026 03:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790912995; cv=pass; b=tK6PCzygrgYx0wQrJ+K7aLRIWQ6ihxMCWofjaDm85upTGwaHf8JA6XNklOw2NwqRmuoThizJ9wa08B/V9zsrV+3Otz/jVsdcTlc5VdXq4hP8K7iRsXF5lv+wGixGTO7Uh+SOmdgBvGM2HY3DNZS1t1wu68yZxKuMfIvXS1W5u68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790912995; c=relaxed/simple;
	bh=5sGej+DLfkAUgSW0hAN9X4g6v3915oL1VCHDIm0N3Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAqXUDFXipuZ7ZKw3QdQ19sQlS9fXtHITZ4er3IuAhzNJInc8VbcDjep3vyGG9LrM+z3f+sx8VuH9NrPwsl/RK6tbGL8tYqoZDOIOGXvokDCNFWYKdIfiS1LPh9Z7OKGbu54XHiWnblWdr95SwlJYBSENF7VHr96w9VyHFD1rMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuyfalHp; arc=pass smtp.client-ip=74.125.230.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuyfalHp"
Received: by mail-lr2-f31.google.com with SMTP id 38308e7fff4ca-3a49e560a98so5194781fa.0
        for <sophgo@lists.linux.dev>; Thu, 01 Oct 2026 20:49:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790912992; cv=none;
        d=google.com; s=arc-20260327;
        b=APUtAaOQn5RPVpkoPhWdcvfAbFW2uMkftE4b2XK+7GMCfGlcXP/PqipYZ7Tmwq4EIf
         XpcU1s6fYFuQVzV/idxSPb2aPvYeKxNPtGiOlR3o2J22tA7JB8SEgWh8qzStCyi0W43X
         Yv2wTIo0/1NNeQFLkOltzbXS8PTNdMj1jAobNRsTZ6/A+6h5+kJQQ7xkNKfg7vS1Y1cs
         y87Ip6Xma1lK2aM/Xpx+MCM4Gp9y/P3SnfZtvNHdHVIeFYweE3hcECJ/L5c7zVGWud6k
         Y0GoPlTGPzbbhJpaJXdjBSnbUd48HM9OzqdMQXee7JIIv3A5VpshkKvh+mfpiAhNFnHS
         o4wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5sGej+DLfkAUgSW0hAN9X4g6v3915oL1VCHDIm0N3Dc=;
        fh=n8ebMF1QCyxeevxzzn1pgySrJShQISpRxBQD5IKPeK4=;
        b=L2Fm+nTqdUZUuMIaKTIkACMYI6WWYtfs3IALsz6VcQGLGvA+77TPqbPTAJZxWisWi+
         0KjdwMx5sjUx72An5ZA0Un8gKHYk6CFdsfXmsUiJ+uV1bH3yg7KJ8qIZQLChJvsZlUru
         rhgUa2Vv16JnXp1Vnn4CYsW9bHHnLoWEzA4vE2+poeagEH9c6KlWogR3ZILF4qd3VDW4
         FEgDbbukbH4ARnftFgtQXobXWHbrGhHvv4ieGvMVHj5zHC+wgl3YtCUh0t3rd7uTHSvd
         OCGd7FlK8r7egV9uYQpRB+Gap9M/R6kIA80IZ+MJq1HMW+nYE4VMjE1NXYZuSHWXkB9V
         xfQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790912992; x=1791517792; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5sGej+DLfkAUgSW0hAN9X4g6v3915oL1VCHDIm0N3Dc=;
        b=FuyfalHprAq0lMBVnChLBQKuMZsdhTqthxeErRfm8gNqc15JBKJWUL3Mt/QzNeqfam
         N3KH0MYtx3rTjN2ft/32IfInXVL34q9R4Pd3a7Vuy5WyPRrH1PXwOXZSirrpuiMqJZr8
         tcX3+i4LW3a652NmqaeQIZhtUfGke4GchlPzdM2MWHMJaT231RMk+SekQqxG9GVlSypZ
         elxcmF+DHasJTSBIf2sa+M5hgEAKeg3m4RY3VmIn5BK0hsgNCoxGdMGxhsUMUMMPygqs
         Yi/xDvNpS55xhNqKE1PR2UzY/96Nrej8NtMN3Dfvwv/k5zXm0BhpRioXI9CESIvVUVgI
         +02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790912992; x=1791517792;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5sGej+DLfkAUgSW0hAN9X4g6v3915oL1VCHDIm0N3Dc=;
        b=XAM1/WIYy0aAbto2cut90nUpPXiG9uiE0fv522vkW7zr5zfoRCcVY+VLzVhYfSoI8I
         z75PV8VwF373s7L+WoTg6e/v/AraTA0bp6ekE+baJLoZu6Nhk3QpoY6UpnkkFwGwhVOd
         YUra9txZNnixN7OwLU5WKZM+PRLdeD8hBLiKj5r7jFcLGz9CH7tR6Wk15SK2Kg0r3fCu
         LIQ5S+dYqvE2SDtkgP9ytTBmlPXW7eM7582KS9OHdlMRobNqE06OL1h1vvC+yIApR2rt
         S3H2N9ADY6fB/+Skl42daRn6AxKOUVG+jqXVbNvx/EIV0db7g8qWjfzktAkQSxTsm7i9
         X3LQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9xSxBk5Gkn9I9tn2sEJtikWaMufDupPouFmG8llix5KWFQR0msaDIUeGiGtGk1WE0ytjmf9o=@lists.linux.dev
X-Gm-Message-State: AFq9FYIJtRdi2YI6ZDD4zgWhHqVo41dVSVKv6Hqmschgid1BbGCWys4J
	geERjdCwU5zfenyJRVCAO1XRie9XU+6Pdmw5/XMAiDCpEx7JncxdkA58LLH6in4Iag+s8Pu1t8a
	WVOVEJEnZVjR0RxDp8YMtIHXhTCssxHQ=
X-Gm-Gg: AYBFou08lK0G/pkC1VIEe57iV8Z1B48KhvNEFsTb4VQznCzi/WTVipMzB7dBnGBu1la
	csrxzxrlGvAnKOf08M1s5Qg7mkMnfLOqUsDUU+gbaVFI+B/vJslvS2P4cHHuGTbG37TNcRWJTAP
	xXnjxyjvfl+2j5aTFEnkz+hnf/Q7arFsiSudiXm2zZQcgUHmI5INJcjZKsj4Q+flHXduwM3FDPF
	fxaOUKffuUhMdAhWElQMo4dsOj8wHNYkYrjmcqO5Oe6RiSYNa/5QFnGFNMOkzhOOwpHjaBfQKZ4
	h5XPEYQKrv9GUIqeCmCcnRsV1KsGsZI7o68JaPzKnaH48m38jHbep9f0K1kG70zObDQhzUprpt0
	xOAM9RH5SZg9yKHLxMjv/09HmS8Vdd3BYD3BX
X-Received: by 2002:a05:651c:1b84:b0:3a6:629e:447c with SMTP id
 38308e7fff4ca-3a8827de31amr2384311fa.1.1790912991548; Thu, 01 Oct 2026
 20:49:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com>
In-Reply-To: <20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 2 Oct 2026 11:49:39 +0800
X-Gm-Features: AclHuK9nOE7Cp6JUOFi-QxVBuGMkiu_Zk5X9AVbxMGFwo-WwiNAL3M8EJdWroT8
Message-ID: <CAKspUhKOwuXyweSk_EsBTTNKrUbDy4ATkHjEPSObA=zm-Hu7jw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: add cv1800b ethernet support overlay
To: Hiago De Franco <hfranco@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrei Lalaev <andrey.lalaev@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 01, 2026 at 04:38:30PM -0300, Hiago De Franco wrote:
> This is a continuation of patch [1]. The same patch was sent before [2],
> and an overlay was suggested, altought it was not sent. Therefore I am
> sending this overlay now.

Thanks for picking this up. [2] was mine, for the Duo 256M; the overlay
rework stalled while I waited for the IO board, which has now arrived.
I will send the matching overlay for sg2002-milkv-duo256m in the same
shape as this one, so the two boards stay consistent.

One note, not a blocker for this patch: the internal PHY under the mdio
node this overlay enables is named phy@0 but has reg = <1> -- which is
also why it shows up as mdio_mux-0.0:01 in your log. 2/2 of my earlier
series [3] fixes the node name in cv180x.dtsi, so it covers CV1800B as
well, and already has Inochi's Reviewed-by. I will carry it in my
overlay series unless it lands first.

Reviewed-by: Chen-Yu Yeh <chenyou910331@gmail.com>

[3] https://lore.kernel.org/sophgo/20260803163427.74445-1-chenyou910331@gmail.com/
