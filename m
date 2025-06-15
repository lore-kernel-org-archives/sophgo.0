Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7652527AC43
	for <sophgo@lists.linux.dev>; Sun, 15 Jun 2025 15:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750001954; cv=none; b=ZL3qWuXlI+Z0QqYHV/wyUr0qg3K9f2j6FixoHr2FivKfQwGzP1vLtyBd1N43lKF9mHgWeMEfplPigCLpNdngaFfmYwUNn5GqIYi7uK2gDQqUDRQdPbybde8Hpe/nn6AsyThlUxtHT5f3gdLUEw/uw4M2CcwkIRB/iSybgoawSEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750001954; c=relaxed/simple;
	bh=m6LP38QwVoEaHLyw8YxufwF/MJQu9Kb3/FKUtYP05hk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qrKXdfaeSLn0LFQiUZd3Q1JffR98P8Ibs3HfdPGdd7nqhTY5NLzjzavSoBgg+Z/9P3iUUPvZoTnas1GTtTKKoX2x1yRpgSo1ZkqXK8auPX0hqJDW5SPlmAARg9L61jUthtbxCN8IY1m8OhT1Le/tCdxeZhpApQJpRO5xNoBtljg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CB3CA3LH; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CB3CA3LH"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so47588085e9.1
        for <sophgo@lists.linux.dev>; Sun, 15 Jun 2025 08:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750001951; x=1750606751; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q7ElqBBxYK8zwqSy2KMj1EAXRpTMg0e1y6o6qhKBrfY=;
        b=CB3CA3LHFeTCpotjXad4o2zgPrWE2rwDShbmmKcIPw8f0MoFSoi3zGEzFELKwxaobe
         ATmV97GwEdwFXKrWq7OeOUuiH8x3AQVU4VOsllLIJuLHd1W0s3GhdSlb6xdX0FtrQ7uT
         hTYqXchSOsRI0Wn8Axc8aA6Xp4+w65/ZKU96qvpNplZG/LYDzMSe/mOjLhtWuTviH9oA
         ewSRP8GcXC1lGHynakN/OG00/t5qXFzAVJXnL7jmNmo6rLhOEIwB6Gr0irX7LW0zQaSO
         Dl3/2YwycdmH9Kj02iH4DYuNmMBkKo8crgyd/da1mU2OU3iMSifJ+CamKegTT87WxzLB
         MqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750001951; x=1750606751;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7ElqBBxYK8zwqSy2KMj1EAXRpTMg0e1y6o6qhKBrfY=;
        b=BQOAfeBuQlqHHUAHaXPlW+vvlN3hxzeQsMuos4iAE2iMEr7kKR1lCuEALmBJtjK/O7
         KDb1Mom6kR+eNNgFih71AYt5WZFmz3++f4LS46jSwzX6lADMQXyAIBj0+RCHNYHIukgm
         YNog0aDk7KjubocrrbhVwl4yqspJTi6Gs5Ch++KGerMa9VX+7bzgmW/RYg/pKrgNPNu1
         us4XLDGqa6wfTFWONmbqfH0ampig/jPrySRxwOjFnhXpNxmInww/W/cXitppympkxgCk
         2pkALFod5TpdSb7afwNsWUHPEcMUAF7L4yKsfACZZURArl79tMksd+F+IAvsNLmoOpWj
         3pFA==
X-Forwarded-Encrypted: i=1; AJvYcCVkS7clNjiJV8oiyzS2xwlQCkVXC1LVnMBeaba6G8pjB/Ats41+BbohGCe+AS1wkbQT6sC47qc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVWkyeW1fSGv34EccPaKuer1PsOz2F1Gdfcv0LlV1q5ApX+DC8
	+jEVonAr21SHqYJ0cw5A+LER50QiRZOscH8KaQHq9P6vwu6pGPln6ZLw
X-Gm-Gg: ASbGnct/8gj3hn0Gb85TyTTkpN+3UXPyuRb3fHdf9Cvn4OQvkYNeAYDZ7E7+Qz1Xg8b
	6TexoC3fS6V62bOlpsl6s16JSmVNxTzM1LdEOP8FfXK95rB6x7pUaudv8CoSnTgS7bVc7f15xi9
	UH6vCF/bDyZ+O90GRu+sjjCnFiIKsuIaQGXBPS+JbmkMp8mIIVE1rZak4FJKBZevHG2cQwG8mFa
	dy3rpOZyBmo5Vvnzp1vHjmwpJX8BOClVeg9Q7Gkd4dMH9QMdr9PHbd2eeH5G2rslZfCacgfhZ+A
	IdJPMOOjvSVZsDtNHfle1ApXK42vE3588O/qSjsBNwUaagPR5eSZJG53k4zucvgBQJcGAJV/9Sx
	tdXOr1u+0ShWQR7Mi
X-Google-Smtp-Source: AGHT+IE3Nn2aP/qP3xfmKvxxE4Tm9DNlDreyA9eo2JAN2p1efPcWJyOTkPDySsjd3i0sSEsHjflkPQ==
X-Received: by 2002:a05:600c:3b17:b0:442:ff8e:11ac with SMTP id 5b1f17b1804b1-4533caa3473mr60153345e9.12.1750001950395;
        Sun, 15 Jun 2025 08:39:10 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c2d2sm116082625e9.1.2025.06.15.08.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 08:39:09 -0700 (PDT)
Message-ID: <fe84a75aa6d91bc8de7610660e861f1f60fdf9ef.camel@gmail.com>
Subject: Re: [PATCH v3 2/4] reset: simple: add support for Sophgo CV1800B
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Chen
 Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti	 <alex@ghiti.fr>, Vinod Koul <vkoul@kernel.org>, Yu Yuan
 <yu.yuan@sjtu.edu.cn>,  Ze Huang <huangze@whut.edu.cn>, Thomas Bonnefille
 <thomas.bonnefille@bootlin.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org, Yixun Lan
	 <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Date: Sun, 15 Jun 2025 17:39:20 +0200
In-Reply-To: <20250611075321.1160973-3-inochiama@gmail.com>
References: <20250611075321.1160973-1-inochiama@gmail.com>
	 <20250611075321.1160973-3-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Thanks for the patch, Inochi!

On Wed, 2025-06-11 at 15:53 +0800, Inochi Amaoto wrote:
> Reuse reset-simple driver for the Sophgo CV1800B reset generator.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Successfully tested with USB series in host mode on Milk-V Duo Module 01 EV=
B:

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/reset/reset-simple.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
> index 276067839830..79e94ecfe4f5 100644
> --- a/drivers/reset/reset-simple.c
> +++ b/drivers/reset/reset-simple.c
> @@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[=
] =3D {
> =C2=A0	{ .compatible =3D "snps,dw-high-reset" },
> =C2=A0	{ .compatible =3D "snps,dw-low-reset",
> =C2=A0		.data =3D &reset_simple_active_low },
> +	{ .compatible =3D "sophgo,cv1800b-reset",
> +		.data =3D &reset_simple_active_low },
> =C2=A0	{ .compatible =3D "sophgo,sg2042-reset",
> =C2=A0		.data =3D &reset_simple_active_low },
> =C2=A0	{ /* sentinel */ },

--=20
Alexander Sverdlin.
