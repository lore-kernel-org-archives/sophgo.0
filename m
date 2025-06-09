Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C1C21A43B
	for <sophgo@lists.linux.dev>; Mon,  9 Jun 2025 16:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487163; cv=none; b=QH9LY9bf0eJnEEhEt9NzWSfwKr0kZK6/EMwDaO/0OAp6FA0eReOulTlSeyVUog2OOrLDj4kFChlfWdfomcS1kvuyHU0qTuvBI/bH/FGe0oYKsJMO1SXlPaWBQUMWOrXZHyANczFhLFJMvM7zLxWrmHDixWUmE98jG5IKnB0jnxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487163; c=relaxed/simple;
	bh=tzexrrjny5IMXPQ9VvFMvoukaPiMY2y2N9iypoi2Qh4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QctonU6c6UbFtAUoNI2iwAWJpcpF7Y81044uxYFWl8a0dOmzciEpCFukfihYrfSNMADUksWiNYttH8UVLxL/t3E1LciKLLp8TRSGB/EQjRivo11aB9rMflWG+jxKiOEXbfXwM+Wy7CcLQneQeDj4lMlTRVHExSQi0/EpfvRqYtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQvMDc5z; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQvMDc5z"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a361b8a664so3782796f8f.3
        for <sophgo@lists.linux.dev>; Mon, 09 Jun 2025 09:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749487160; x=1750091960; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MdlA7FTprXZiicVKK7E8JIBJj3nSquxMjsmIoLs6jMg=;
        b=VQvMDc5zFTyzmkUtb0wCGnvAldhja3oMBZfrTwkPu0iv06X/6nKU/osqgWihtkwqip
         BFVKVZCj9ffCaYO+WewHGCaL+o0iQZL24TWKcGp1F5JRZ30vsaecH8G6D7BnjJfHD19o
         yG34waAV0QyzV7FOxoXL7QSDMVm1Xt/JTOOAMelyGQivuBfJlZ7Xzxx3RK1zJBQPqD2C
         R0gOK8y5hCRsfXiFKMi+dIEsGUP5jTN/AjMS/o+/X/+Pd3Bi69p7XAgN791YW1XOpMg9
         HNetie9+1EprwnU6BPZGgwsw5U0Weifo7Pn55sX+inhdILTZT9MWY3T89xlsDbn1lnY8
         hgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749487160; x=1750091960;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MdlA7FTprXZiicVKK7E8JIBJj3nSquxMjsmIoLs6jMg=;
        b=dGRjpTPojr6K7xsVZz8bP8WkUSBytYTr+DUvu1tsH1QZ+Cbo8lAXT6hEFpKn24rh75
         crTNxvHATov1uxMKbu/YArsbs9ImtnmbgoERTnkyNAaQBbn8GRsx+BteGsT4SQK1cRJp
         8UvhUB/MEP+KDuhv0EL2Z2ZgINXY0tqizeXIKAGwbMv6e7pwfP0zgIJEwg62hjupJP+S
         EEOzQUBdvSJ4T1bes0aCeG3FaxxLU/iaX7UZIFUkvl/XpdebNOf7ADghvV+6zMSJzM8a
         vlbIPM1vb9/Pa7THsRdtFXRQkzIHyN8eyWcSRK/Ja9dniWQD3UAk9RPertB5bAhoBek2
         7PnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlTbXH1Ml6KUBSyz37rK/YlSLg1xBgCk1QAV+cDpuJV4YgZFBynbo7Zby6881aDOvySpIi8fI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBJ5WkusW5U9r4/TZldxCxjYXhZpxdbw6VMU9qg6ZJa0wzxbx+
	OhGwAt4EfPqlc79f0+67lSPOcfgjEPn0Hm7BlEHauipCf0NPyeFwjlX3
X-Gm-Gg: ASbGncvIfA+bhLY+I7bZyNZCC1/5BvXL5Dv0DH3ZAv8VFG7QKVXfZBPXwXFokHT06/e
	kjyY8W6zq379CCuQ9u+C63d9SimDFAAOe8G0TFdQjpSj5ygRcdoS7VClKD+CPOfEVTc1Oqokhel
	dWnktWmHk37ammYViJOqGI5o3VeoE6V/mP1+mxCIzfrVlKHd3XFxRJmOr9ZvrgHfdsogMff/8pF
	uHhng3KNE0Jcj1T2FedJ+3VrpxSh+b2I72QjjXFEapReyluwvU+xa8dy6C1muNIlPC2mOIcxTo9
	ekBeZ+iPyR72YgDupcjOj+if07UTzve8QB/NINeXRPCGjVSILK+OfmYAa11nqkRcXzSXnQVvr5J
	mGFirmA==
X-Google-Smtp-Source: AGHT+IE641WVTYCKGJ9CW2nJENZhWmhnjIJAkzfQD2E1jYnnkEDfEBr76CpBPCzz77Yns7HmTZCRfA==
X-Received: by 2002:a05:6000:188f:b0:3a4:fe9d:1b10 with SMTP id ffacd0b85a97d-3a531caff2dmr10438461f8f.45.1749487160286;
        Mon, 09 Jun 2025 09:39:20 -0700 (PDT)
Received: from giga-mm-5.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532464f20sm9972251f8f.98.2025.06.09.09.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 09:39:19 -0700 (PDT)
Message-ID: <13f0f876de57d2a96f4786bcd3622772bd478d69.camel@gmail.com>
Subject: Re: [PATCH v2 2/4] reset: simple: add support for Sophgo CV1800B
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Chen
 Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti	 <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, Thomas
 Bonnefille	 <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Date: Mon, 09 Jun 2025 18:39:20 +0200
In-Reply-To: <20250608232214.771855-3-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
	 <20250608232214.771855-3-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2025-06-09 at 07:22 +0800, Inochi Amaoto wrote:
> Reuse reset-simple driver for the Sophgo CV1800B reset generator.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

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
