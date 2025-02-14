Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E4525A634
	for <sophgo@lists.linux.dev>; Fri, 14 Feb 2025 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526521; cv=none; b=We048Z0jBFpEM/kK+PkhtgLF/QnC3zZ/TRFkBImOkWai+rd9c2TdnydFSDrntHDFKH5J7Js/WYDRo5k5CfvR/vSiB2niQOiOQtSWb+Ha/j/pgneISeCwwXc92zQgTxKSid/6I8W1HgJwYzoREznFeG9TgOdVqPjCFq9/oZbH/VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526521; c=relaxed/simple;
	bh=U/XK9lxux++1rCX/XaU4m5VtyKNJ/y7QLLupUamyVUg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dYDKxk2oMBGSQDhneg7VPoMiszavB0WQt9XtqwSpBiqG7dm5nABA18oj/8eOWXju2nTdQr2nIXgKEvyG3saUUlUg5QcoEd1YVqateaRTF8mBiwmZ9/k2lJ2fy5LpdccWNZFfGj/A6aH8XvMe0B35C/3p4enGGleVmIN4lOAK+uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWw52+N4; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWw52+N4"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7d451f7c4so271059666b.0
        for <sophgo@lists.linux.dev>; Fri, 14 Feb 2025 01:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739526518; x=1740131318; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mkPFoVMQL/mYhcTcaki3q36SMLzV+i7Fu65c+D3vc5A=;
        b=CWw52+N4fIr+pPmZSfyjlRAqXJZvxefF9HWE8eL2+VCbAqBBBVYD2PplwcpL0avvKD
         i75FnuXEvabLmbpxemvj35P+nsh/25MOdZALcZ+e8NiR9XIJUOxw9FxRwBa+PP3ztGgy
         i5qZjEOjwFSEZzZQ9V75cQqt0bPTFk+aVysZKS0bn+8wCmik3dSYHq8RnYGsJR+3crus
         qukNhixcRuVh71Gtc8Y512ZMiKnun2zG9zxZn1TGNgjOxcc3NCz2eFWAPnIsjMk+SLoU
         5PNAGqStb7hGKPuZuVw5EZh91kl/Fq5p7rdSv0sslGcCE0E07W1IvhzokveX8s+E+Zwu
         fa5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739526518; x=1740131318;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mkPFoVMQL/mYhcTcaki3q36SMLzV+i7Fu65c+D3vc5A=;
        b=fFI6U9E93G0jn4421iF8gx73r9DY8No3tRXPKOhCki42fFDfaqjwVtYx4n6GdE7uhF
         Ox/TWUaAWuOMa91W3JwRGQUxsaBd+PCUHPWrvuB1Svhyp0/85LCmne3THGVyToo8RSn2
         08PztjnjSaSHRUXaLR2DlcMph3SsKEJd2vF2Fha8mo3H00nepeoiOcC6o0r/Kdzt5uBm
         UBf4/0L+40KtOp3lCPZwf60/HeeC8q6ziwun+h3CvgVGCJsPIyuu42XsxkDWfK7fV6Gf
         19hzXHmIvfubYhjigKGZIVYQg2saIGFIjQf4VN1znsb3hcbeBBVvpJOjqYa3MVHLwE4a
         qUjA==
X-Forwarded-Encrypted: i=1; AJvYcCXq4v9L1oma4yBdZ/ATpnzvfHydtMsBAelBuKpM3XOwpkMkalzmDZObpIYQfpJQ0J4PHHoJi2w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQX0BL4MWjkuS55gSsHKCespnx7/7y1IpMIhgMu/N0pC7W4Plf
	TQlxUFZmUXju9jLIW9lhfvMduItmHuZxOfFLiO0V0Cqig3MxDpe7
X-Gm-Gg: ASbGncsqqvQqBYgn6pI7//Xh3EMuOuTIY60diQ8YAAnAfbgH9hSrhbDAWRO5kiINtYK
	/iWP8qPYmoslW1cO+St0k6quYkBKxuhWouZGLUoDMVZAppMAX+5MIx/Jn+j8fkakm82pO43auo6
	3o6cY3kOeRwfkiEptXrxDUr7Hx/b6MRza1I+x+2g9vmd+d9vnuLjYz96LGyKKT3jEIBpaALxgkZ
	JUuOQY1v35Y0G48A2zBqEwlHTFrP3BLN2i6peFqhrFEd1NkgfxJA6h+4UZ2KEcXgbAsDtFhtK/G
	LLP5N/pj89LJkzn+y8UX51I9JHwESHiV
X-Google-Smtp-Source: AGHT+IF/WMNFRvHaiGuGegW339Yn2o6KPOe0XOjLxo/ZqTX+q5ydw7HmVZEF28gC92P39HsPRvsXVA==
X-Received: by 2002:a17:907:2cc5:b0:ab6:f4e7:52f9 with SMTP id a640c23a62f3a-ab7f33d1874mr1151153666b.25.1739526518067;
        Fri, 14 Feb 2025 01:48:38 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5339db66sm309917866b.148.2025.02.14.01.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 01:48:37 -0800 (PST)
Message-ID: <c07e2096cedc993e8a23ccde44e7f47adbeff99b.camel@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update info for SOPHGO DEVICETREES and
 DRIVERS
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Chen Wang <unicorn_wang@outlook.com>
Cc: linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, Yixun Lan
	 <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Date: Fri, 14 Feb 2025 10:48:36 +0100
In-Reply-To: <20250212022831.244143-1-inochiama@gmail.com>
References: <20250212022831.244143-1-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2025-02-12 at 10:28 +0800, Inochi Amaoto wrote:
> Add mail list and wiki info for SOPHGO entry. Also change Inochi's
> email as the old one can not be accessed.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0MAINTAINERS | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 896a307fa065..6b79681877d2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22097,7 +22097,9 @@ F:	include/linux/sony-laptop.h
> =C2=A0
> =C2=A0SOPHGO DEVICETREES and DRIVERS
> =C2=A0M:	Chen Wang <unicorn_wang@outlook.com>
> -M:	Inochi Amaoto <inochiama@outlook.com>
> +M:	Inochi Amaoto <inochiama@gmail.com>
> +L:	sophgo@lists.linux.dev
> +W:	https://github.com/sophgo/linux/wiki
> =C2=A0T:	git https://github.com/sophgo/linux.git
> =C2=A0S:	Maintained
> =C2=A0N:	sophgo

--=20
Alexander Sverdlin.

