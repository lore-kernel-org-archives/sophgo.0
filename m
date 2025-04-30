Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1592417CA17
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 15:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026709; cv=none; b=Utg+0L8rN9492ed/As2Ex1CH1b2PQJJUSS7HT04KSatsqSdneUSmAALCz5b5Srfv6UDXYa/rw+VLGOKUsOv+7tEF34CwhLLV+OyCisvSsy6kYVhBIO0Zq2Qmw3TX4pR7KXCQVBpwYPND5bRfH+CWCIiPrsSrsXgGf9OoiB+CyRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026709; c=relaxed/simple;
	bh=JfAY8HFpUWj8MR/O1/7lz4Lk+Scgd4D+t3tpyWD4iVA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZlCBg95gUpvNjHsBxcVBkTuNvnQ4D3IjKL0rDIKSLp4PGLBInCAIl9CoKzHu6jqSi1iXuXD4D835KDYBeqi5beq/AfJIM4qxCyI7NNFunI/1px49pT299gdXjbSvBdN04CbS7pSe7D8uHr3G2T7PAtlWyPLeVtFHhSnp/YwKHjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lop188m7; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lop188m7"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac25520a289so1183878666b.3
        for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746026706; x=1746631506; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sj0MRflIvEedys6JQ53UQlPgHXKKoxulPTXkRt9mne4=;
        b=lop188m7C8UPeo1whR+U7Dtn9cv2jMB6WUjDoLhPhZDf2wdyyqSkAF5vjzFzFlVT2z
         cd6KA0as7gcpMv35HbI5kH2+1yklGNc/5o+yj1bOr5DHfXdVZjOUIivzQPbl6duZJc8Y
         VUQ+ctScLo02YA5xm2Zk2k2IzOafzZtGi779dx/aHGnnI0OsYnngDdCh2LUO+ttWdJpv
         esXEpNryrpMB1IA2hy4SQteuszP9IxiNXLdT2qkHRtc44Y8BwoUy18uyHuS/b/2S8dLZ
         I5AH+2A6REobEwUA1jYZrUC/XzoZ5nTz35S9CrYUgFxKdKCHHxN4j2fPqX4MV0C7iiDu
         1I9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026706; x=1746631506;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sj0MRflIvEedys6JQ53UQlPgHXKKoxulPTXkRt9mne4=;
        b=oAmIykS7MBh//PxFJ1KQC1yB0YxDG3lxJ3j0CodmJ4Q+qjMn5LUDMTUHF1tlftbCBc
         7dWwFSb2+33Rat0U0GBw8jyxHMW5b6FF1u7O8rH7Fl8OJPcWLMHfAMva3Ne2qai33Lsn
         UMf/2/TfX0c08tD4+0cK32OPz+Tk+ywzqmjaCQx3K4s3646B7VulDI3CEg2enBI12y4I
         qw/f3MG9HWY/LWQK+tz8/VEHkw090Ky34MKf6cO8+hrb7DjA4ozYb0h16jYCv78mP0yg
         IMGDax8cCOiR6v/qdDFZjFG4OAGpKxUdU48jA+Df5zjThYSeOPimWpA8vLTdqRHxJpBe
         8cBA==
X-Forwarded-Encrypted: i=1; AJvYcCWg4+OYagyGQ0xHk79RE9p/yXV+v20cldypP5IW2UUU0wT8TSFy5GYnizt/tri82ws8XefCUzo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3CsqAkFC3/4UKJ3/7k+gH2eAnAl3PU9omqzY563hDSdZ2n2mi
	uJmzYwHjm5R9Jcrhm65O3Waz9wHHtxtpaJGalE6qBvn6Jm3AcxEe
X-Gm-Gg: ASbGncsxzW84OLaM0pjM473hCKzIYELgmRvmGfKmUclQd0G1NtRgCayC3O6rhmBxK1H
	zuY2ygsqhV3McrNVxrn3zhePd1gFID/d2qgZ/mR/Gp4ShoYqPXRr2Q0fDYXeQqqPxQrZro9HbSE
	uTZQ100XiyGa18mLYXS2HCg++4tP6mYIokhBCyclElIFH0ZFPnQsCOFspu5NWqSYmmyOJqXYtxf
	zk2JlOCFqGQ0YcuxuLLwHllWFaiDjMR+Fu6MDN1YTD1B/21J7v3hgzaCiioTor4kmprrk0R2Yzv
	CROcpM1bjLi8ws0hX39s5yKjo2NCQWJrO2NEAJFEHAcsz31gZlAsSNCt2Jhs
X-Google-Smtp-Source: AGHT+IFzQBgBRSQ6GOeinovlut4MyV3fq4DbhhNOJPV0muIn4pxuSp88mG1LvZ+7QvhqG/Fa7ZM10w==
X-Received: by 2002:a17:907:3f21:b0:ac6:f6ea:cc21 with SMTP id a640c23a62f3a-acedc764e4cmr435843166b.55.1746026706150;
        Wed, 30 Apr 2025 08:25:06 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed704f7sm943027266b.146.2025.04.30.08.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 08:25:05 -0700 (PDT)
Message-ID: <a6164eadc96bea72cc21ddc4794401907fb11d97.camel@gmail.com>
Subject: Re: [PATCH 3/4] riscv: dts: sophgo: rename header file cv18xx.dtsi
 to cv180x.dtsi
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Wed, 30 Apr 2025 17:25:07 +0200
In-Reply-To: <20250430012654.235830-4-inochiama@gmail.com>
References: <20250430012654.235830-1-inochiama@gmail.com>
	 <20250430012654.235830-4-inochiama@gmail.com>
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

On Wed, 2025-04-30 at 09:26 +0800, Inochi Amaoto wrote:
> As the cv18xx.dtsi serves as a common peripheral header for all
> riscv cv180x/cv181x/sg200x SoCs, it not cover the entire cv18xx
                                     ^
                                      does
> series as there is cv182x and cv183x. So rename the header file
> to make it precise.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv1800b.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +=
-
> =C2=A0arch/riscv/boot/dts/sophgo/{cv18xx.dtsi =3D> cv180x.dtsi} | 0
> =C2=A0arch/riscv/boot/dts/sophgo/cv1812h.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +=
-
> =C2=A0arch/riscv/boot/dts/sophgo/sg2002.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 2 +-
> =C2=A04 files changed, 3 insertions(+), 3 deletions(-)
> =C2=A0rename arch/riscv/boot/dts/sophgo/{cv18xx.dtsi =3D> cv180x.dtsi} (1=
00%)

--=20
Alexander Sverdlin.
