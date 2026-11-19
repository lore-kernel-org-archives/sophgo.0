Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795089376;
	b=ZiYyj4qDuFG97/m9FNsmj7KagQt5fPRsw7/q0sYeT8FMwwfEvrJ97Yzov2DUgSnz7EiZ
	 DwtvPSmjgW7RPz+AAJ4Qt2C3jpoZSQ+9sSMXtOalW5Tn+hbPZ6DLteO6Ny4Tu/VcWhPrx
	 68kEgxsn0raR3t/7kk1axAbcjWRoYe1In6BHaRY4LEjVmDAU/9DTjAcQn5St8FoDazv7r
	 pWGB8HyGuo9mu0UDJayydwHO6K/Mw24qsv9E3K5H4+gl2+bucPwJ9Bpba5+X2vWOH3+4z
	 4gmboGPoi5pwBRng4xnBrq705p7Scn/70mjivZP2rdE82k8BXy3H5EdSkXch6sIEVow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
	b=aM9aQYWHfuN6KtzqJRmNRBOZrPyqnrdBt/iWk9OebVicoGfkwnbAlRMu751Rmad/ksU3
	 BjBjcCQ+DFHEJh52uY1QxWsmydtVadPY/b9B5VdIMem6Yb2axgVoYXC2zH2lUwBhSoUGp
	 Unt3j29Ca9yZzTmKGZpwNdLbdsuH/Ey9PyPaV9KtP7dOT5BdD4jW9C6pe+maRaI4RnPO7
	 1lt6fAPM51Gtl9UKQIgS7C4XikWc8TNbgGWTCf7bMX3/tihte97e3WrYSJE8gQcK2pL/q
	 evEbpRUOKYy+X0R7OawLX42hs/6qpZsQTmCQV6qI4hnw4nEaRYvKFcrJgm+M2B27j8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vR8r5cDS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E299C606A324
	for <sophgo@lists.linux.dev>; Thu, 19 Nov 2026 11:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E299C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vR8r5cDS
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adfe7a31dfso2132711fa.3
        for <sophgo@lists.linux.dev>; Thu, 19 Nov 2026 03:56:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795089374; cv=none;
        d=google.com; s=arc-20260327;
        b=esoHOJXLw4Gc/kKcaz+HEZcBshFYKppHF5XKfTQtIxTozIBcXX9nFQWDZW615ZWh6J
         t2OKA35KBFXQhihOaU7HTFa5i81xd2z16kQvfS+gHmsmBb8tYFvfYa3Plwpxa3l0vzCF
         hcP7qwE3CvTWBTeCFFNyqN/6AuDZo6sZTXJ/a+kQGpLHr5pKfWNhFU4Ipf2PLWDkeDcX
         /RRSFdhjsdzzfh3axkPh0pVYk9bakq1uxFQNBOWqCg4dS44vB9baZ3e676hZw3BzD3JP
         hociwQ2c4C1JlbKjliZfKnuZj1obUwgHCty7oJyPsiZAiYlyRyh4W1TWlU+n8aDWgrKj
         B/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
        fh=bA4KEL4E/M6lKloWPx/Lusi2rqEUcdouuJXS7pp4jLE=;
        b=ZRVPqeGyG7/L28LKw89f6WsljohEdWKiUD/8eNxZb/JSVrRS1KRgkPRzcNl1SwiI52
         N4nnnBnAvIkMWMuTwRAY8DYTSCR4r6Od011M7xcBEBe8XtQxyEWo+Rtp5wj1qsaWd6kd
         q2mGF/WbPG4SeDyXA1IrkuwDfJprzgbfU/+MBkajXm+2/wey74Xjh4ZPNHnMrzKlQROh
         /tQHvSWoSrf+9Q8G2arVw98D6t4fOUr06lr9/c6r1lbfBVF+a5s/fNaDbUGGS4pWfYw6
         ZxmZFi1uk9uvaR0IrChbQywDHIlHa78jEghx86fKH6m8qDLGG6Ko6AclFzhvaDqMK0nO
         e/yw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795089374; x=1795694174; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
        b=vR8r5cDSrQ7yjbAbySsfjKu4/naHnx8O9tIXkeJ9s4Plcx/DC9V11B2BSY8aOny63l
         D89QuOASuXpMH8e8oKR9ZFJ3EMEwXW3sZiv1FJF7yuW2XfC9jI/ynhOJ8tXKuUXz5p8p
         jhJev8MB/Vn+CDPHZ+TyulVSJdOo26kdvKTqeU8g09d1KLZNcTM/Sv/JshR3fobw9y31
         9R2zrv616wnkbPqVjteAMrDWdFs4xhSg/psXANM8XTKvONT86cdNAnefq44UicPfAJHj
         BJEF01iRGf9hlINKk4pkc7AR/GV1iHGG/A+G3FwrBcI/MDi+uCmkmsBVqhMlYeko2NdC
         42gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089374; x=1795694174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
        b=SPgGW9kroJ/bdw2+JpYmR1+ZCYjqBfFloY5AyUstSBmYki0mgEs1faikdsGTqFgiue
         a9ZVOJfatv3Z0npBshw/b0fETTEo26tUhxuUpK1R3lHRm7h4OVGv4BU0+S7LGF/HZ6Ea
         TtKc/TP2sbrCOuOP/D04ivdQnFGJJX6qqNfQXW0T49mINKdgsU1mt9/4ZOUXIZBsIn1Y
         e1Pv3g728eXjIHJzsxqQqPeUopdCVdOUsxoDclVPwVI0KYxRXoIREsyDcwT0gYWpovpB
         OHwOX0ZgBzfaca7o6mSx/ak85ec+8jvACBfKWs9k8rw12eCCIe1PZcHI5Ypi3JRYKxHv
         V0iQ==
X-Forwarded-Encrypted: i=1; AL+hErG3TV0oMVb3S14kAPfO3/2/EKukkHTe6cTdcKfxsupIZLj0je88kWurQUrrc60MBh7A/ZJmU5I=@lists.linux.dev
X-Gm-Message-State: APuU4Z8pAen7f5UtOMAcPjtaO85Q25+7GlVlKQzN9mA3i2GpOgtnDRxf
	YCt99H5xapgcP25N5HICMwKMW9FuW3f0Hg2JEuXkHHbZeNLV9NWIHmzACuRPWNafKZ180ZpNi9y
	1JQFY4sb/G4IeQUMHDoCcWdCBCJqjZts=
X-Gm-Gg: AYBFou0Epzqa5mRpPLXHBs1oe5Tx7JBmfLntTUncSGZTJizmFhwOsW6Xgiom/fS9k7V
	rSXrxAqUGywXSSZUx14Hzy4JGVWmSVo1gN4WD+EzQJIwQ3jTvAvNxfATrpnlkakYDxZd3DesAxJ
	uu22Tv0kA0Cyh0sTfyFebQKlEEJ0uwNraw3Yq0DPukBQQteLJ1SQPwtS1xZbIWBCXt4iqFlp/X9
	pcPNhF3NMr6iF0KWVL33D6OBkxTtKnN6H5Z46zyemHd+tAjUWUIRDKDzDECd7NUBIoPB6577eeA
	PCzO+j6ilUXq2aNhHDK52F3IYmx9Uc5bljTjjfUPnXFBQWJ1KkWBCBtLDL2WlJ5qd1EXWX42Xu1
	huPT7tvJ5n74sLjj/DxpH62RChB7I0eMWsHJjD2yoHFruBCQAhVOyYobADuhH1MDFB3oY1VWxII
	HDxETnlJ2Qa9hra6qlMg==
X-Received: by 2002:a05:6512:ba9:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c1a9bbdf96mr2564765e87.2.1795089373747; Thu, 19 Nov 2026
 03:56:13 -0800 (PST)
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110070627.217946-1-inochiama@gmail.com> <20261113072305.220610-1-chenyou910331@gmail.com>
 <av2M-6w1u5mOyqDM@inochi.infowork>
In-Reply-To: <av2M-6w1u5mOyqDM@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Thu, 19 Nov 2026 19:56:01 +0800
X-Gm-Features: Aa3M54riNxFLUFg84fAOhmY6bjWZvKgiNBwAs9BSg1G7sMgZ9DPXd0hZVBFcQ9M
Message-ID: <CAKspUh+LLonm90ywMGrRUcsLDE+Axw64qjs0OtDB_ySUsrPPQw@mail.gmail.com>
Subject: Re: [PATCH 0/4] usb: dwc2: Add USB DRD support on CV1800 Series SoC
To: Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	chen.wang@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, hminas@synopsys.com, 
	gregkh@linuxfoundation.org, looong.bin@gmail.com, 
	dinguyen@opensource.altera.com, paulz@synopsys.com, balbi@ti.com, 
	dlan@gentoo.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 07:36:04PM +0800, Inochi Amaoto wrote:
> If there are no other bug in this patch. There should be no new
> version. The device probe problem is not a very big one. And I have
> no idea about these thing. Since my time is tight, you are free to
> send the fix for the device mode.

Thanks, I will work on it.

> It depends, if you accept setting this to host, I can add them
> at once. (Note: once set, no change will be accepted).

I would prefer peripheral as the default. The vendor kernel uses
device mode by default, and the bare Duo 256M is usually connected to
a PC over USB-C (RNDIS); host mode needs the IO board or an OTG
adapter.
If the "host" mode is used, it means that anyone wanting to use the
product would have to purchase an additional I/O board=E2=80=94that doesn't
seem like a very good option, does it?

Since the peripheral default only works once the boot role is fixed,
I will send the fix together with the Duo 256M DTS change (dr_mode =3D
"otg", usb-role-switch, role-switch-default-mode =3D "peripheral") as
one series on top of yours. Is that fine with you?

Regards,
Chen-Yu
