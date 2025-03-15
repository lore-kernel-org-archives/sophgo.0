Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08A2188A3A
	for <sophgo@lists.linux.dev>; Sat, 15 Mar 2025 15:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742054162; cv=none; b=tVepvcOi8ZNDlfB2gYhQaaKST6yFAAduHylLBl62JfzBsZ84Rm/LBWW9QByQx0fnPwks8XEyBnRL6aSwroQskdlmb/XsVFb39OSdu/rbUT5iBmq0JKHqQHf9Lp01ysr+qsruA65kcWFjasQ4kbXXGORfM5YleoKAH57MtoIiNlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742054162; c=relaxed/simple;
	bh=MRJjZ5O1bWjVu2eWngnjmrWJQHQGwJx7tix5FKfUILA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fyj87/jR0xW39Vk4RgL0nvSViH8b5RIe6PMZZtROCyJQ3yMQJR/Lj03aejkPBIv0ibKqAaKqui61Nn6zyCiSvICppNi3q44eaKcBwDxXmCAOCLYlFXYKiWJ40v+7wf3di5pc8tMzSEpYjGjLQ/6eXGXh8mb6EQik7BWuo8p8nc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gfg8uh1q; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gfg8uh1q"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso4313485e9.0
        for <sophgo@lists.linux.dev>; Sat, 15 Mar 2025 08:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742054159; x=1742658959; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qHLhAyyIe2MeT11eZPTmP9X5jZJNkxRaVxiRBPcxsAY=;
        b=Gfg8uh1qGgetgOSCER+Dw4NquaEbChk937c/kjNPCyUcxn9JwXMBwbMkRIHpzpVIA5
         u0V2aTEnlCdZuDhrYzYeCRyjxu0kWh1JVNlFjaQ0nM2HpPeP6zJIgcexDy8t7vgY/XZd
         I0YPDNHOenQSVcmaace5624fBIj2wWC1ufA2ed9T6KBU7cnrv/5ZoxUwCtL37qJOaDqc
         Y0UxG5Gg1IbB1xiW9xKPfrtWa2TejwJZ5t8t/OfqebDpgArBWXNXQ4QN53S2YZd5hsn2
         t3eYgEAZjcA3Bq6DSGwYo4NjOUrsfrWEIhqxWasBCTokgpw58QO+KG9Zok+Te/iouG0X
         hBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742054159; x=1742658959;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHLhAyyIe2MeT11eZPTmP9X5jZJNkxRaVxiRBPcxsAY=;
        b=Cqvdu2DnImWNrz7uKrPvCZapqtwl/s1sAynYsZS00AuK/wtM7JWm9kijVXoJBh+2vJ
         XLrpyAHwZ1rKldA8sM6oNKZDWP3OIF2Gq6Wb02NZyivAxTH/LSZNQhVhVwtPYphJo31q
         x/q3R8lndBItiIEJ6qlVAcmNR0Gn5nmmc25845hKn1qROU66gDWZXoHfmoobahC85N7Q
         Rfr6zGxhRMIL/Mr+LGBVw6duhqti6x+HlN06E0iEUZJY0gGhREr8wI/ILBzMiBuYceQP
         7aTdpx7W/t7NjXCuuTcPoU/CN8PkB8H0cr3yOudsU3urYB+lH/BdBYQVEYI/jI/XZa13
         3eUA==
X-Forwarded-Encrypted: i=1; AJvYcCVLPJ9LQq3elskrB3QSBhAgu3aD/eia9FAtI3EY+t0rXQnfs379ySU5Uq+pQW8S64aO7s5MhK0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsbMmAJeDHauquyLfxgtCDa6In9EllhMycwlil/T72HjqrdbtA
	Ca3I/EWP5fvjKH/L2A/1beSX6mYoDLboBhDcyBIsO7ieV2YtgSsW
X-Gm-Gg: ASbGncuumWbdKzsybL6MgtCN2hwVlz0LwVa2sJaMfvqR/IIXSQFqk2SDWmu4AcWSmjN
	5MDJX/EHfX0SgI9yJVlIfsW0mPi08OPZLH5tEF7Mzh+yRbUrUIYRRc7Hpbc+J+pJeVCJKL1yAxF
	iYmWfAqUqbWqFcvZXXptip9+jCvERdY6KqrMduCCZMGO3Jf5vthxBQRqhLv1+CtaUTgwKrEcuYe
	9b/BNP/lX2bKYKu4vZn2ZLCoOpaiYa7OXo31j5T8t6Fons8Ylg+Z9S31dA3TZemJQDIbTgqe+kH
	XhNWXeDiT77B8FE/VVsaTLBt6GUT3iLunkRAgSXkd/Qdm7CMzJVrXcXJwXQ5mGkAFJKrnEQz
X-Google-Smtp-Source: AGHT+IHDnn8P0rTvJZGxr/bBa0NVdDYyh7DnEmDOEsVUcOLIyJnBFWm1Zs2TA7EjVueh9oZiZymW1Q==
X-Received: by 2002:a05:600c:5493:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-43d1ecc77f2mr89127045e9.15.1742054158914;
        Sat, 15 Mar 2025 08:55:58 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe524ccsm53978805e9.0.2025.03.15.08.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 08:55:58 -0700 (PDT)
Message-ID: <99b7f8181abda40c78bab67cb5a4b00b62851b14.camel@gmail.com>
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Date: Sat, 15 Mar 2025 16:55:57 +0100
In-Reply-To: <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
	 <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
	 <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Inochi!

On Fri, 2025-03-14 at 08:51 +0800, Inochi Amaoto wrote:
> On Sun, Mar 09, 2025 at 09:26:24PM +0100, Alexander Sverdlin wrote:
> > Add driver for Sophgo CV1800 series SoC RTC subsystem. The RTC module
> > comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state
> > machine to control chip power-on, power-off and reset. Furthermore, the
> > 8051 subsystem is located within RTCSYS including associated SRAM block=
.
> >=20
> > This patch only populates RTC sub-device.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

...

> > +++ b/drivers/soc/sophgo/Kconfig
> > @@ -0,0 +1,24 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Sophgo/Cvitek SoC drivers
> > +#
> > +
> > +if ARCH_SOPHGO || COMPILE_TEST
>=20
> > +menu "Sophgo/Cvitek SoC drivers"
>=20
> No Cvitek, only left Sophgo here.
>=20
> > +
> > +config SOPHGO_CV1800_RTCSYS
> > +	tristate "Sophgo CV1800 RTC MFD"
>=20
> > +	default y if COMPILE_TEST
>=20
> I do not think it is necessary.

Maybe it should have been

tristate "Sophgo CV1800 RTC MFD" if COMPILE_TEST

like others do?

--=20
Alexander Sverdlin.

