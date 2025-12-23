Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2DE2F0C6B
	for <sophgo@lists.linux.dev>; Tue, 23 Dec 2025 09:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766482845; cv=none; b=EbjiuK2gkF/8PAcZ+TPQOLdXzVq14bBMRl1pVr2dmsUHmObjDBzRWqQ1wdu6S6NBuUIy2DzF5OAvGiUEe3QpLHlUkRM2eZYDaMuSWWNHX7ifnAydrReeV8m8oEwaig1a3WySQKbz8urfnZgGsEFXDvGBHY1dORob303tILAkgL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766482845; c=relaxed/simple;
	bh=8Kus0tZd4CK0EY8/6nzfiOVEg1GqsUfNItVlV8LcEUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r21FhR3eQHLMGIyP0eMG9kNqGWJ5LHeM/EycNBUw6SaF53iKtGIAxtmxeBWpSVFkmASs+wmJ4KGiJwhdmvGnMdtlslFN5tuNh7ItXguhlsVigKKw+1BUotdK9Gp+wSCqvWHomkYojRGmZt2FuIp1lk+kzBHZOz0Ez36u7pPQw8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S82CvnJA; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S82CvnJA"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dbd150efe8so1724131137.0
        for <sophgo@lists.linux.dev>; Tue, 23 Dec 2025 01:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766482843; x=1767087643; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5DQ/Hd0FueInSklnxg49suOinyeSeX9sLj0XHbFm3M=;
        b=S82CvnJADHVYa1+gEbAcL5/ZdhiMpkivx19YNfOY7yjYgvOIO537srhF2RfsREOJR8
         cO6VkobjFyqTzOty2O4CJuGA/0SZEOUcM2cbD4BkemCge9tJ3cIYJE6Wh1SqigjlYniY
         b3boz/iCykUqFmRSW7tvzvxXs7TYNMlrZRMBRouDWX1wWLzEwSupNdspRlMkzpR0vohh
         yBrjZp2PoYFciWVuB7ZYlt53vEVcjc7XIKXSod5fGXkJhhO6ef51AMzP3svd0Zqr9kkp
         rUO923wKBLmLf1EKf7CRvKVvTfCFfJQW70cMo9e1lU64wPnLPkAR+Z36nAQcOfoTXAs7
         mQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766482843; x=1767087643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f5DQ/Hd0FueInSklnxg49suOinyeSeX9sLj0XHbFm3M=;
        b=j8sQxflJBL+z95k8R3y7iIA4lM6KKmVaG2iG7KQeDTti/2jy5uihkOKEfHWevN2Dyb
         byM2Humvkxa1ASZTkscG1kTARWeB+dUMLS74ELY+IdViXuZ/1hmzEieftoAqfsVY0/Xv
         nrw1Ft2ESzLo1wyk96Z3IU4r0hvdMoOaWxWcEUitHG3CKzEYxCMDDmsTnMtjXxuj6i6F
         N2VfShon6EOC8TKBh8lBe2M16danFtI4H75dyPytpaoTP98G5vDyNESKcUjQMa6Qhs19
         LSMDwM/oJPLNroQ6eYcXbUfG3PJXh3uDpsojzXnKqlRlU/ZUngbTe3F8nKQw1C3/3c0W
         stRg==
X-Forwarded-Encrypted: i=1; AJvYcCWIFuaRRsHjbuH8eudR/tzx4E7enIOOoDHOXSuLu3Bv87nHHYA6Bb3aozje5q9vlqDyUCMr1zY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv8osi87w2DunrbIlyxXHid8Q2cX9KCGxGmBTO4cN9nInq/+wf
	P4JNkXouQXVQ2pDOBie10lyGjMEEXgEwLLBQeLHd9hjOt2431DgdNYojGsd6iTWFHQfcyE7C9vj
	rM7C3p3uucthfdo8C8NxzgjD1Fizz5ak=
X-Gm-Gg: AY/fxX5fTveZI0VtSgHCBvtCzEUbW3aJvTNuf2OeWqM92uXqlguTKq96i19Hy3B5JyO
	8tFSf1A5o08coq2xKSMnPMbqE1k4Bh9akQhrmhEXQK9q4vDa0zDB9eWvFIwrJ0MzyV5Irv8xXcr
	0am4tunXToSarZnvJAoFSpq8wWtNK5DOO6wY7nsDqP7lBqTLvedz++ctytdtboh2grhZOuj/+JQ
	kyzPm0AHt4y/B6X16qtdxBlYauBUDV6Npsdmembn2H/1E+rRRp/0tPSu1rxnK/IXyfYjXoHr67a
	hStY0xOwXCm+bB8yamoRlMrV7k5i
X-Google-Smtp-Source: AGHT+IHezjaq3BOJA0/IKlT+rUY4LDRLZgpfCi9YXlzB67YTN0ZhqyYz9++mFn6fkbdpRKvBfOwrvMA4yblTtcXrdoQ=
X-Received: by 2002:a05:6102:2c14:b0:5dd:b288:61af with SMTP id
 ada2fe7eead31-5eb1a420692mr3942878137.0.1766482842127; Tue, 23 Dec 2025
 01:40:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251220170501.3972438-1-gaohan@iscas.ac.cn> <ad17d046-158d-4019-b801-423896fcf5fc@app.fastmail.com>
In-Reply-To: <ad17d046-158d-4019-b801-423896fcf5fc@app.fastmail.com>
From: Han Gao <rabenda.cn@gmail.com>
Date: Tue, 23 Dec 2025 17:40:31 +0800
X-Gm-Features: AQt7F2pNnJvaR2fFMXaWCzuRSUjzCZVvvwJpoWcbcif2idpoK6d8gJIQk4KoPBE
Message-ID: <CAAT7Ki-ddgsyJ4MDfn6MXKEBjXN__PZxWJQ_W5WjCcuaJ-_6Uw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: intel: Introduce msi64 parameter to override
 64-bit MSI restriction
To: Arnd Bergmann <arnd@arndb.de>
Cc: Han Gao <gaohan@iscas.ac.cn>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Maxim Mikityanskiy <maxtram95@gmail.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, linux-sound@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 1:01=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Sat, Dec 20, 2025, at 18:05, Han Gao wrote:
> > Sophgo SG2042 MSI driver does not support 32-bit MSI.
> > Introduce an 'msi64' kernel parameter to bypass NO_MSI64 for ATI/HDMI.
> >
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> > +module_param(msi64, bool, 0444);
> > +MODULE_PARM_DESC(msi64, "Force use msi 64bit.");
>
> This does not seem like an appropriate use for a module
> parameter. There are very few things we want to use those
> for in new code, and working around hardware bugs is
> clearly not one.
>
> > @@ -1903,7 +1906,7 @@ static int azx_first_init(struct azx *chip)
> >               chip->gts_present =3D true;
> >  #endif
> >
> > -     if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64) {
> > +     if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64 && !msi64=
) {
> >               dev_dbg(card->dev, "Disabling 64bit MSI\n");
> >               pci->no_64bit_msi =3D true;
> >       }
>
> The behavior is also wrong: if the system can use neither 32-bit
> MSI nor 64-bit MSI, this would accidentally try to use the
> 64-bit variant and then cause runtime issues.
>
> I would expect the only possible fallback to be using legacy IntX
> interrupts, or returning a probe failure if that doesn't work

Unfortunately, the SG2042 chip does not have an available legacy INTx.

db79afa1e57925ba96ab18514c0ebe42a28e393e
91ed6fd2c383bb8f02d66e98b4a4d2f7207249dc

According to these two commits, these issues seem to be caused by powerpc.
Can we use the CONFIG_PPC64 macro to determine this?

> either.
>
>       Arnd
