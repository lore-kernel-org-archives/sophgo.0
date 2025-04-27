Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A422A8DD
	for <sophgo@lists.linux.dev>; Sun, 27 Apr 2025 21:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745791122; cv=none; b=DYrnGm/1Z6sBxbXH1bx0aExbfZSbAdeyhmwk52EPZmsKT0lYtyOYLNDuUaJZ9L7T404YuJiYFvwQSo5N1fm0KGLGOkq4BEcGUqT7U3xSF2t9D1L+w2XXUhYKQ0VvO95XEaPxNzwnRTWaiexXjMx09UQcVAcNgppt+27aHIXnheY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745791122; c=relaxed/simple;
	bh=xoFFlUVS0wVlyjp6cbD2/5sZDhjRZH9fJXC40AGr1qo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qmk8gob9nTkQIEVKt0eQcZb0O2HYq7eIgFPcuRdZyeo43HdF+qa635nyrySN+7fbcJO11riSHasJ1HZaKOAXzdZAMZUE7sbqXXPHKFv4O2rikeX6lDh0YlT+Rvz7MlMUrF1gG8YEHcLXGZXx3uevoBllyP+jZ736tuFzKuLkLnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ng2p+nz9; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ng2p+nz9"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso5764620a12.0
        for <sophgo@lists.linux.dev>; Sun, 27 Apr 2025 14:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745791119; x=1746395919; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xoFFlUVS0wVlyjp6cbD2/5sZDhjRZH9fJXC40AGr1qo=;
        b=Ng2p+nz9hUZib1wT5a1wzF91x3mOdlUpzLFL41H4ZAQuY2jeXAF0cegJQXK/7JT81f
         tT74OxC3IvtUOb1w6txnwdlWVhcjZXsz74gPrgAIbcjeu9//5XulUXCRGgknYKm/3PrN
         tMec0+FSHDHEl5GQu5e0NAYc27niUOaBNaSM+VK7ZnmP0sMJUmEdBme5H01ceYgCmz8H
         CLtT79OKiDDkPu/dODUDE/XKCY285x1K/iCBGJwFGcDk8Byyyxd3pZUO2BylMskjF+Zl
         mdNO6EGgXSH9/A4GTI3OZ6uIENunA2ChEykoHzGJTfzYCjLHYKK+2VdqC9XbNi0TYDPv
         1SZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745791119; x=1746395919;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xoFFlUVS0wVlyjp6cbD2/5sZDhjRZH9fJXC40AGr1qo=;
        b=Ojro0K0CjMOACizLFt/RdY2KH/Ad6bKuV34Y0b+tmuFRIyRxEMlQi7Xb1g1dAYgzWT
         NcaWRZpEmUWpxpIhHfdPZT2TLJIWg5ds/oArt6j9oX4JafYxrUelxR3QHxg3B5JqtpVi
         /OJ7oiwPxf+qfHOYdT65EucSWYjNfXOk1uQk31izj+cGdI2Vovj3b/Bv0EuO6DxEjaD3
         bwUHeqx/xYD3ImThiCIxrtkfA3RVKPT0BmnX1B1k1WlKdyByOb/ALRzD+337neTsP4Qa
         7YBzTF67/mPcYo6aGdyPidxfypKah6h7YsZ9PkD/XzsFZqAqtdK2vuQ7E0dy5dIG2d42
         u7Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVDgQ5O8sz83ANCky7auArEsA87rt/4AiCk86dnpeIKGGfbZB72ZPFzWZGL6wYUZEXqrfqF/wg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyst1aabFsNS5/8kaIkQTsZTS9hr5FscMSXoHoAbGvZYCrvBphp
	TBPdtTAmQzpEn0MG9sVGpjAsXpSHMCwq70tFEx5lVMAffn2+HEPd
X-Gm-Gg: ASbGncuv5zovEti1yzkSMqg525hkVvp/qkcWRRBXHmekg3RSw3XcfFGYwWtIs8PHc0m
	2ZsAn+qGzzfZpSfaMq0tjTtAcZ4Vzi1/lEOBFF5z9t7BKcaTWP5nbwoSZqGa6rYAsWMpQIKr4I/
	v72ZtL6DB0XDYoFRIWKYnqIloo8j302XufzYe+10n9CdihErlyceuQ2HBHWcA8Vg+PYnbCoE4KC
	+3sbu6OCec0LS6xe3C/CL5nC4+jOxJydpuVYLEELyU7qpsMW2nc36Q8m6MprvQ8Aw28geok7gEV
	QHf20ydsUJUJEpdfZ43COdazstP8mDdMigAXsnPoFLFEe+kyYDRkoSI/XeTE
X-Google-Smtp-Source: AGHT+IEvi0rXbr0VMx/VLRtdEN19IYnmAtKGHC7Mvz5NgjFistXAFXnPPApAe04irDPvLTwJqMpsmQ==
X-Received: by 2002:a17:907:9721:b0:ac2:cae8:e153 with SMTP id a640c23a62f3a-ace71047eb4mr759769866b.4.1745791118757;
        Sun, 27 Apr 2025 14:58:38 -0700 (PDT)
Received: from giga-mm-1.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7ec1d7729sm1150180a12.8.2025.04.27.14.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 14:58:38 -0700 (PDT)
Message-ID: <f2c8a44453d5a74f9878d1d45e3a61d8107ecaed.camel@gmail.com>
Subject: Re: [PATCH v14 3/3] rtc: sophgo: add rtc support for Sophgo CV1800
 SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Yangyu Chen <cyy@cyyself.name>,
 	sophgo@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>
Date: Sun, 27 Apr 2025 23:58:54 +0200
In-Reply-To: <MA0P287MB22628A1AF7C3B2DAAE837CE3FEB32@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
References: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
	 <20250315224921.3627852-4-alexander.sverdlin@gmail.com>
	 <PN0PR01MB103935B34205CB22313838F34FED92@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
	 <MA0P287MB22628A1AF7C3B2DAAE837CE3FEB32@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=mQINBGWpGj8BEACy09IxfduHTzAdqKkf3SmGIHIEquHWHIXqgVIoZo/ufP8mIpsWYwFKP
 9gsCvVvNNugtK8YPN92lbHol35nfZiXLIp16ASRQXYFtBjXj4GAVjUPjaTkQbcedIgD2nEZ/HQSio
 hfnUSS0YmxI0UUJmZFulwQZil6OmPVbbQoda8/In5h/wNRo6y5vJreRhsjqcP5LckLRov3t+jabUz
 n0/1twHNO0SnI508dXenEhQcBX7Wns+JfwRqO8jxBK1P3DntW+n0OJ8DkjSMJjm0zk9JtY28WK332
 Vpq8smZxNDNCfs1YtRMzfEEZKRvxsSMzTxri/cw7VXJa7m138LlyPBkXizjAKqad/Mrthx4ambsWu
 RXyjklYOBYqMEAdlZNLPQnhnIICFwkJ/lnLE8Ek6Dh0NYl1HpsOyvu1ii7VPEXHLMGTKFmFmWtrmC
 UrHIBrAvStMJ2jIRhEyCGDpf6f5dfKNOb3GWRtX36326TDOa2eXWqaTQEPKWRSUwhC3f3j/C/o/vj
 6bDHQ8ZsNcKYxwtSoh+elHT5xtHOMvPBP6gavgZRDnH6wBSHWnXYxyOmZPKr2NuhMwhEyhpvkEq5z
 W6Z/hp5POzZ74GNkIKB5/FpETobgoV/XB2HMnlIUAJE2RYRYwvbgIkKTJxFD4FIIP2DVt/7cT/8ry
 5Nhe2fouscuDQARAQABtDFBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBnbW
 FpbC5jb20+iQJUBBMBCAA+FiEEYDtVWuq7d7K0J3aR+5lQra83LKgFAmWpGj8CGwMFCQPCZwAFCwk
 IBwIGFQoJCAsCBBYCAwECHgECF4AACgkQ+5lQra83LKjUHA/+KlP0no2WRK1co+2yi0Jz2kbSY61Z
 oX+RqbLqkCoo1UxsU/MddscgjKOfggNASZ1l//jUkx39smTBONmxcauTtY4bB4Q9X8Djk+XO1M9iw
 Gb7feCbnIuRHyvI3qygC+k3XgLIJScui3/yEL0aikd5U4F6nkKyQiPQk7ihKWKyBQXQ+tXS06mUH4
 p0O5BYvxijW32Z9esVB15OB8vUcx2bsdjogEuNc0uwOGMHsVIsW4qupoHRHPc1865uAqzv9vW3a2/
 GOG6IpBFjmXqg7Wy9zwVjSJFMvVxu2xs3RCdpS99aMrfA2na1vjC5A7gNFnr+/N2vtMBP0d0ESfd/
 54zSglu3FW0TIOIz7qkrWQKwiennfUun/mAvCynCrKpCpUMkEgeQw1rHCWpSfnJ6TPG0UfQGNUFyz
 zmBheQRSEksaepfCtqwCxtjF19JZ6yapLi/lQt7YBjwxIPkZRHJNelPkK/bs6yeRJul90+X6UAJst
 Wh4mC7HzVvmopJoCxbInS4+L6qlefdjqhB6NYw9Q5GsRmTKalaqJoW1/kXopeGExCY4r1FP5ZoLHF
 s0xNbycpD2tp/GnI8GlYCIzQED3TNab7IkWP2otXnWAnF8CrqhglBbYnp8oCkgBPatYftO4dWFP3Y
 LVWE0EtoWLLrmiWzHkbWc8YKpWAiFX8OhUJLKtA=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Chen!

On Mon, 2025-04-14 at 17:14 +0800, Chen Wang wrote:
> I just find there is an exiting "REAL TIME CLOCK (RTC) SUBSYSTEM"=20
> section in MAINTAINERS, seems we should not pick the rtc file in "SOPHGO=
=20
> DEVICETREES and DRIVERS".

But then the below mailing list will not get notified on the changes to
Sophgo-specific RTC driver. I'd say it's rather about providing timely feed=
back,
like Tested-by: and Reviewed-by: than any other more serious burden.
What do you think?

> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -22354,6 +22354,7 @@ L:=C2=A0=C2=A0=C2=A0 sophgo@lists.linux.dev
> > > =C2=A0 W:=C2=A0=C2=A0=C2=A0 https://github.com/sophgo/linux/wiki
> > > =C2=A0 T:=C2=A0=C2=A0=C2=A0 git https://github.com/sophgo/linux.git
> > > =C2=A0 S:=C2=A0=C2=A0=C2=A0 Maintained
> > > +F:=C2=A0=C2=A0=C2=A0 drivers/rtc/rtc-cv1800.c
> > > =C2=A0 N:=C2=A0=C2=A0=C2=A0 sophgo
> > > =C2=A0 K:=C2=A0=C2=A0=C2=A0 sophgo

--=20
Alexander Sverdlin.
