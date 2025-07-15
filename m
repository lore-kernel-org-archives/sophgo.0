Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FCF7262D
	for <sophgo@lists.linux.dev>; Tue, 15 Jul 2025 22:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752617834; cv=none; b=SACQqmz5QztelbNXCfiKeAvumirzKcmRBDWkDqYvDubw899FlDxJw9HvdLxxO4bwdPJoCNoFY6zNuIZebg3LZ50akTj1V/tVfNVHBftVdf2Vd00iKpk9cgwCcuo61JtX+F9LLdQN6rBe8FyNlUA55ZJpxczleLhxPtMHZ+82uyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752617834; c=relaxed/simple;
	bh=pBasewOutybSgPeTnnFJ9TF1ZtaNHDhit9tLEZUO1C8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MVstmZ8s2DPC0rxJ4w41av78DmDjXlL2P/zxIkhYhx6PrxH+WvkEXNztkZazhTamuSMQgn38gyAZR7WO1zJkXoSCKvPLSOURWe+RPo4ej+4ACSS6F1nASv7YPQ12/zIGhRLxCCElfZbCU1oLirbf3T1GAb6C+87AT44/avyCJNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EI8HDasY; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EI8HDasY"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so9865094a12.2
        for <sophgo@lists.linux.dev>; Tue, 15 Jul 2025 15:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752617831; x=1753222631; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IlpREsArsA65Wjnvz7fR13JpUjf3JpRjm5gzm/gRDbs=;
        b=EI8HDasYMqfOAuvrej4Y7SPILzRkavGekGA7XxNtdA5S93o564O2bKE9ojT8LHr3uz
         noV/bLc8qt8wSOKqAHSJ4twIJFGXRNE0YZj1M4KdtF0iZLlITxqswEv9KuADtrKclUT7
         K1CJJJxkdnvgY8SwMFLAGDO+zS8GzCV/5KfpW5dVmYG3tEJnxn9vofWXdRFlpHqXwTAq
         o1dMu3UzeFLBWuUqj7cWUTaUP3XVVaEikHBAQRrMBfarPX5QYVZkwb1WjmzP0sTybOtS
         4HGjiXk2+SUjJl1RP4X0SXwgebUfEPZEepyjmexQm6Eug0pgZOm4bu93svmrnwBpBi3B
         lwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752617831; x=1753222631;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IlpREsArsA65Wjnvz7fR13JpUjf3JpRjm5gzm/gRDbs=;
        b=NpXdmjlhyg9lmRuMQp6IT6iMOr7I+Og46vpFn5w0A9QVhh6p7U4q9Qa1nmMYvFuSbV
         6hsK/Qnz2gqQieubEeY/EXv0lqtdIWmdN9KwVWll/hnqvv3SZDYDE+2rtl5pKg/FFGcb
         15oJ1DUJhEp0WsMKigeGw5PyRwxi6kSImIaEN7hDWSHk5IO0oP4uBz8NHKYcP31pkQ+g
         9mbIJGFT+h5PrSEX5tRC9sVzm+lMOJgDcxGhqgkaoVvViZmJQL+IKh8kEUP04MVXWNjr
         5xVqRoGXKyA9I9yxPYVIMMEuoHGSzAbpTzZp8Cn9DJBPpIp1R3wwZ0DlSAdEt0DvCaq3
         me/g==
X-Forwarded-Encrypted: i=1; AJvYcCVc81JXfQox16vyAa98+y8BHNpI5gQtQfrgrUS/Kp93Y0UN+0jN1VcxZLz/wxRvZLy4PqsyEOM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIcbSoU3GZX0jdeCUw7ksnXYhcjEz7+3+jNh07bPJKpxz3q+qv
	1nd/J56A3nmWqRwgIjALBUuNH48qUvyXAaGev135rtqe09JiAT/dlBjr
X-Gm-Gg: ASbGnctRX+uUb0PUKewKBTcJgz8U59zpE8zV7zkrWTiWETAqT+DphFD8lnz+OsQpdul
	oO4Hbo4ntxdOVlXHzClUySsBNBWXUzYIYLta1rKKoAEDTZtbkPSC24WTv6J0o1LpVB6IOiZrOB0
	ZfT//xIFcARe28ZjU6OTeLw68XsTiJgXlWiwAdKGXNU7gGM1Zn/QFAPjg07vsVym8gWYU1C9upB
	1Xb5JkYB131IJAUx4+34mwCLt4hc3E2WlvSh9bdWL/cg7YauZQEVA0kNM5nKRev2BVNvY74vQdS
	0q7EDqzGLM4juCkUNPY/6xGsFK6Ed0VzaJZi4JPpCWpc63eweMIxPW97hnTq4GcioPywvFvqLgx
	0ECNZxkUr3Wc0hFuv3Z9t9N3QQpNI8+7LPoFMMwywPEU=
X-Google-Smtp-Source: AGHT+IFS1FOWt2Mu8j9kFCRNXMuFJFrO5X2nsF/JgZHo3UNGWsUzJOoz0tkKgDtKz4i/peCv+xWi9w==
X-Received: by 2002:a05:6402:2756:b0:604:e33f:e5c0 with SMTP id 4fb4d7f45d1cf-61285dfbc42mr291122a12.30.1752617831067;
        Tue, 15 Jul 2025 15:17:11 -0700 (PDT)
Received: from giga-mm-11.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61274d50d06sm1084048a12.8.2025.07.15.15.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 15:17:10 -0700 (PDT)
Message-ID: <ce6c909d9d6724dd36a2b35ff19faa93b5152a0c.camel@gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: fix mdio node name for CV180X
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang	 <unicorn_wang@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Ze Huang
 <huangze@whut.edu.cn>, Yu Yuan <yu.yuan@sjtu.edu.cn>, Thomas Bonnefille	
 <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Yixun Lan
	 <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, kernel test robot
	 <lkp@intel.com>
Date: Wed, 16 Jul 2025 00:17:07 +0200
In-Reply-To: <20250715221349.11034-1-inochiama@gmail.com>
References: <20250715221349.11034-1-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2025-07-16 at 06:13 +0800, Inochi Amaoto wrote:
> As the mdio multipledxer is marked as mdio device, the check complains
> the mdio bus number exceed the maximum.
>=20
> Change the node name to mdio-mux to remove the following warnings:
> mdio@3009800 (mdio-mux-mmioreg): mdio@80:reg:0:0: 128 is greater than
> the maximum of 31
>=20
> Fixes: b7945143bc33 ("riscv: dts: sophgo: Add mdio multiplexer device for=
 cv18xx")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507140738.XRjv3G8i-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202507121830.POx2KDVi-lkp@i=
ntel.com/

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts=
/sophgo/cv180x.dtsi
> index 5f094c6085cb..27056ef70ce4 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -57,7 +57,7 @@ rst: reset-controller@3003000 {
> =C2=A0			#reset-cells =3D <1>;
> =C2=A0		};
>=20
> -		mdio: mdio@3009800 {
> +		mdio: mdio-mux@3009800 {
> =C2=A0			compatible =3D "mdio-mux-mmioreg", "mdio-mux";
> =C2=A0			reg =3D <0x3009800 0x4>;
> =C2=A0			#address-cells =3D <1>;

--=20
Alexander Sverdlin.
