Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F031B0F33
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 15:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027594; cv=none; b=RFvd0Fqa8HWuUtyCQ3r9YRXkC8IWKf/JuGSboFR59NqUjFLf8SdJHAK3ahgUseUHSNGdmQ+4AtQp5y/rv0Z0uKzsIv85uVkYm6Z7aSE2eCNBKZHImCqvbNF9xYP6YkayGTU8tDHMJdSXravuLuPOT5VvDhu3ygLLdW0Qo5+mxhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027594; c=relaxed/simple;
	bh=7gnwFWZ0cFqEhVbNLmt9Fc9sr/LSelqQoAOWfIU8mOs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oqSDi6FlLyUSDi9myER3E53838b2daROBFpq2LnEInVfZPrhp6uLh5u+QdUpWrvm6OQJfqnHb45W0uyI62DuU6X/aas2hklyJmOxyGusDygKIeAHGgmiJFdxZQMsqqmDcXkPfBqngfKEdyAZPLGfdeOXVISFfFA7fyDNMj/QvGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CT/hi/gg; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CT/hi/gg"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39d83782ef6so849949f8f.0
        for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 08:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746027591; x=1746632391; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AgReYpbiEfzzRjpl9plzaSPk0WShKygYvywpy8RPSlc=;
        b=CT/hi/ggiYzAGooGeayxtP1L0QSmtokP76IOS93dLnwfY+IDFlBgMRJj34PEj/l17q
         oNqTK2bWPfgGCUn6GQprNBHuYNyMKWvcMnqDiUqpNzwllp7kvu4bXzsauzRRNqnakJCc
         ggy7ZhzZmx0PFAbLJdscl4SJ4muR3qmMLhEQwSbilXwfXhx9mIQ3eqGtKNzzsoAkdNjg
         RVLbb+954zDnR/PYRZdXITveAojj/mu57GOYQxItNJ5aHkz5l2BbCwecpooOB0gnjw9a
         gDPPPIGMDzGQWAF9kRj56km12W6A0mmSPVEsq/59TumsjQ6Yajb9d5a2FEeK/URt2qOr
         Hn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027591; x=1746632391;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AgReYpbiEfzzRjpl9plzaSPk0WShKygYvywpy8RPSlc=;
        b=cfakpre07aWMrNcANNHL3ew2IHpBr9CUNtoRQ7dA565wwaxUbxK304h9j6+rCS9WMC
         4vNfc7oPp+3cIo9lAnrfdx9xUjADNbiQ3HPnzGtA9lxOKmdU2RB0QCnUHgqiU5iCwJoI
         2MYFZoarmvOL8XN3cIvNpriZ6O07IKveY8faiANU1Hz0ZGIcdBuB8pZtgMtZWQSqMB/x
         0E8XbEu/DcJzILFd2Z32dJju2SkifxImWc+651LC4g3IoeSRriy5aQP+GKssVA/613L/
         DMpjaNHj1QHpS11y+oLMslFtgxPNgEG2l5WLZrEhDVKz4C2yJAEIEOFjcxIO5moBPdXK
         gv0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxCgJHMnB1cj1W7w/WgHmTiV8qj5ngPP5vCIIw/P3zHT0bnsrSzW6Q3VaMS3LuQNBmicwEgpQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt0rFuKewigvHfYCPAA8uXRW3t5C/q13krRMvssmkBXdJFKL/A
	OETm/SK1/ryyt+Sa9jxL69F5rHN1FpRtxN/hbbpZVt4DQt0ZWNq8
X-Gm-Gg: ASbGncsxVfZsceFJgwhQp+mzd/MHrzgeXuboBlfgpW/I4MxnejEIMl4WSQMEqo/S8Tv
	rDbRI26j0cC3Yg9gUxmFGR7ctUf8rpTd0/YXAfQ3tsRVowhdrGocNiVVC32G7GDiY+sic8C8uwB
	JA+DLDMzTFDeEumB4jiVtX+zAx1Hkb92EWPAQ+uNufqEo/vo3xPj/BP6usKu4lbBkiwotF7u2Fy
	GdXi5bN4Dk+WRCY0UvxGzf7aetd7f3U4hzcwDn1yk/VuWCzx0d9ws/F4eJ0TYQmR5YUTywR5ukK
	IaLKUA853aUqBepK+t1gTx4TMFhOoyZzQd/g2ktDX/wfHJSgn/IfV0Gn+CnK60bUjK0fxDM=
X-Google-Smtp-Source: AGHT+IHcVYNpX6kC+rpllRwGYlEvC7hfE7RUIIVLkUZ5sknWEbkBsoGfPhKSTHjS/hL2h6rPpP2B+A==
X-Received: by 2002:a05:6000:430c:b0:3a0:85e4:2268 with SMTP id ffacd0b85a97d-3a08fb450d8mr3047261f8f.10.1746027590590;
        Wed, 30 Apr 2025 08:39:50 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28732sm28740255e9.37.2025.04.30.08.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 08:39:50 -0700 (PDT)
Message-ID: <9ea234373b18a91c6a2f7a41c441002de1e92e98.camel@gmail.com>
Subject: Re: [PATCH 2/3] clk: sophgo: Add support for newly added precise
 compatible
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Wed, 30 Apr 2025 17:39:52 +0200
In-Reply-To: <20250430020932.307198-3-inochiama@gmail.com>
References: <20250430020932.307198-1-inochiama@gmail.com>
	 <20250430020932.307198-3-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Inochi!

On Wed, 2025-04-30 at 10:09 +0800, Inochi Amaoto wrote:
> Add of device id definition for newly added precise compatible.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
> =C2=A0drivers/clk/sophgo/clk-cv1800.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1=
800.c
> index e0c4dc347579..e10221df6385 100644
> --- a/drivers/clk/sophgo/clk-cv1800.c
> +++ b/drivers/clk/sophgo/clk-cv1800.c
> @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device=
 *pdev)
> =C2=A0
> =C2=A0static const struct of_device_id cv1800_clk_ids[] =3D {
> =C2=A0	{ .compatible =3D "sophgo,cv1800-clk", .data =3D &cv1800_desc },
> +	{ .compatible =3D "sophgo,cv1800b-clk", .data =3D &cv1800_desc },
> =C2=A0	{ .compatible =3D "sophgo,cv1810-clk", .data =3D &cv1810_desc },
> +	{ .compatible =3D "sophgo,cv1812h-clk", .data =3D &cv1800_desc },
                                                           ^
Should it have been "cv1810_desc" instead?

> =C2=A0	{ .compatible =3D "sophgo,sg2000-clk", .data =3D &sg2000_desc },
> +	{ .compatible =3D "sophgo,sg2002-clk", .data =3D &sg2000_desc },
> =C2=A0	{ }
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, cv1800_clk_ids);

--=20
Alexander Sverdlin.
