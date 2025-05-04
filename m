Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7332A15B102
	for <sophgo@lists.linux.dev>; Sun,  4 May 2025 10:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746356102; cv=none; b=ZzDTgbm+iXGAJQ+ur3erHqYfFB8UWZLJnzbfjTDPZrBJ6y45lqNV0SAbdIwUz+X/OA5bVRk86r0VYNT9cu92n5SLp3yPc5AK4xWtD9z4tu/I1F+XPIvRZtZaTvxZ0hnGYME5KLw+M73DY9kv142C4OX/ccd+k9+fPy++b9SaeDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746356102; c=relaxed/simple;
	bh=lFawDT3TyRUPwBOj1cNHy7xrga4+P0K6HQ6xQ8bs5Aw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kOkFzhiVV+TgTENAoDLxucf/RTaZhOBb+fta1fnQEB5CXdPGSEWHKqET4beiG9OHcUKsA6VVgx7XmxeS255e4HGDBuWxOlGv0nZmY7AZAumn8NMluV5j41hMGQgJPto/h5vZOyK6FXEMO5FONUZ4llHxz5oyX6VcAksjCikn9SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UebtQWZC; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UebtQWZC"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac3b12e8518so598603166b.0
        for <sophgo@lists.linux.dev>; Sun, 04 May 2025 03:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746356099; x=1746960899; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X/Gw8AZoyqt4Qe9tKx7GhjTg65Csx1ptC6GhiSTdPJA=;
        b=UebtQWZCVpl8DLS02vw8EQEVa7KZNJ8o8I4e78W+35as0snEkjBiReo0mEIJNlOdd0
         S7vAJuOWC/WxZ9TqPZFrstFxhvaC6jerNz090Ylvn2nDwEbq0/aiezBDecjMxye+Kygd
         TvjRF3lD98lAJQRUztMsrKOey4mvKTWGvoJxxr2esIMt0pxAEKs3ot4uNwaDn2r9PPYw
         bbVzl77DE27zfRhnQ3AD/XhUxPnkQd5MoNnXS74zNfu+APcHQBWgZx/+9orFXEbjY/Bh
         oYbZ5+M8P4FpeZmBSEAJJlgEEO8/jdrd7iwFdYMqeGQuYrFxxAgxgg+O7D+P8Ccm7Lv+
         xnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746356099; x=1746960899;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X/Gw8AZoyqt4Qe9tKx7GhjTg65Csx1ptC6GhiSTdPJA=;
        b=hEP+mmizthOo7cEn7WcQrFQXHdQqMz1XYym737MLB4nRNHTCURFIk8qa/vK78w57ed
         kMcTew0gMSAme1beeXQvYBkWW7WVuTjRUr6YxdzySZsc734L2J7eupLayv3cZDpZQ2v7
         xbYyB8D+GcIbvfOCjdTGwpIoecLwMbHovXg6cCC0wxWeO4qhiR+iA4bO37WDVYktUlNN
         xGOa94ety8jwPOAFIZ8xoKttgUA+tFHOei+bCHfqZVuiN+bk7Iz583et+Op6Yt6HfcjP
         ucA0nCVRLHavnBgotEapnmVLKxy6I/hMJdQI4po/bBkzo9Xu5i1XxLRso0vUOOtjL7ka
         p7NA==
X-Forwarded-Encrypted: i=1; AJvYcCVrQmq7wJRSoQdR0vruRwYB+PRnCTXHov4O1t2LO6zlbghbNh+SMx2djnQzW94IrHwbyD8g7sE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVH525EXOsxRe37ZuLLCEJae2UGHI+MFLjKB5IryZG1ptIcr2i
	62DI6Uw3vjnOy5DOnCvCsPLbbtlmQ0+TCQrCWuTx6pBl0kTtkgVv
X-Gm-Gg: ASbGncvYEVe70jicrLjeZFbrd4piegTX4t5Tu4L4DO4krOSEGRK9DSvvnC8+fYXsQJP
	YNMPQOGNHtglrwOyz8utbETirazPbyt9DQA8bRDAxspC7JbWOb121CkLBKRVUKoaIsXwbSAdL6I
	q18CMajfZBnvvNtv51km7tKHhra3YWz5FeCvcXlTJbf3VEn0mOX3LRmFYJiI64SfFgnLIgHmVaV
	tQXhwMPj9L9m5/Vvx6A9K9dS5XsewEh83n2yrXmFKK6hl/gba1MGkZYFm4yWW80haB6no1da1FB
	Z1+eWn/nIuoiynL9eRV49TpTStMylPCPgK+HGK9gDEJ5sQr1DM+vyAbWr4dE
X-Google-Smtp-Source: AGHT+IHtsqO7K3CdDxe3EOvKh/0HWmtCN5k0hmjmOgHDHjsnagKK75fxLjlAZX2eQdzhQSh6GTz2vA==
X-Received: by 2002:a17:907:3e05:b0:acb:33c6:5c71 with SMTP id a640c23a62f3a-ad1a49c3349mr354017666b.29.1746356098387;
        Sun, 04 May 2025 03:54:58 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c8b2bsm3858937a12.32.2025.05.04.03.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:54:57 -0700 (PDT)
Message-ID: <959c4537754ad014727e356c4b068bcf5a9b6a48.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] clk: sophgo: Add support for newly added precise
 compatible
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Sun, 04 May 2025 12:55:01 +0200
In-Reply-To: <20250504104553.1447819-3-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
	 <20250504104553.1447819-3-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2025-05-04 at 18:45 +0800, Inochi Amaoto wrote:
> Add of device id definition for newly added precise compatible.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/clk/sophgo/clk-cv1800.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1=
800.c
> index e0c4dc347579..a4116ac1adcb 100644
> --- a/drivers/clk/sophgo/clk-cv1800.c
> +++ b/drivers/clk/sophgo/clk-cv1800.c
> @@ -1519,7 +1519,9 @@ static int cv1800_clk_probe(struct platform_device =
*pdev)
> =C2=A0
> =C2=A0static const struct of_device_id cv1800_clk_ids[] =3D {
> =C2=A0	{ .compatible =3D "sophgo,cv1800-clk", .data =3D &cv1800_desc },
> +	{ .compatible =3D "sophgo,cv1800b-clk", .data =3D &cv1800_desc },
> =C2=A0	{ .compatible =3D "sophgo,cv1810-clk", .data =3D &cv1810_desc },
> +	{ .compatible =3D "sophgo,cv1812h-clk", .data =3D &cv1810_desc },
> =C2=A0	{ .compatible =3D "sophgo,sg2000-clk", .data =3D &sg2000_desc },
> =C2=A0	{ }
> =C2=A0};

--=20
Alexander Sverdlin.
