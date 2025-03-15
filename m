Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAD419DF7A
	for <sophgo@lists.linux.dev>; Sat, 15 Mar 2025 22:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742078131; cv=none; b=uxTMLw5JScgK93O2fBSrX8X6j1dJS6DP+6EltKNY1K+rzlbTwRIivFWe98dDboY2fvwkfjTyjvInosjEaMyv6alosb2FMuUjcL3u+01IudSzzBHRjK67PMfZ1Tcz4hDKrtCMSjEhD8UL1dsR7tS8PED6JixGqudDh9nTgd8f/Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742078131; c=relaxed/simple;
	bh=APHiIY+8YjkreQ56brJKKPgeRYzDpb1lozz4o0qQBkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZ1vHNHrtZhB0mLcQCcDQzRn2RTOPMmgr796ii/wse3G0CHXsf+ObFPZrdbUSvBBkYUrkN4uEPJ7PBPCxvgCpPYOIsuc9owwNZibTENkLy+jC5g6YA2w15lynV9Z6wPdFvRemGwCgwJORwIqK4az/9f54OiVljvpQnUZsodmNMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/ED5YCV; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/ED5YCV"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e90b8d4686so28131556d6.2
        for <sophgo@lists.linux.dev>; Sat, 15 Mar 2025 15:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742078129; x=1742682929; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i2SkKg6kOtxwoOkWdVxaGHyMDl15IMmbQ5ok+DaJJMQ=;
        b=c/ED5YCVFpmIKwoKgcjd/O9zRkBT3UiqWl4xMDwfVKI8qdg6cqzNx/MPldaiEQVjTI
         FzGanIcpWvwgtfNeS9gcLnC4IPBFeTOjx9u0eO7vqlFIzN2AHJTDn+Rr/m0Z2tMMnoPn
         e4dmGhnuHuF0tNbMFq6Yeu8VA5FFyj301++1TAgllq3cI7vBH95uUhbO+7uVHAmbIZq2
         W+ksohIVqUKCBWpXBa+sBaOsoW0Zp5n3MAtJNrc3eo1qNp1EZf14LmXVQjhX6+OkOJm0
         KoUIqKfTEh7fIuzH6lNV+YHSATitlhn0yFFgwTnMsUNx0jZBQYc4i42pjH81U7eCPEcO
         lLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742078129; x=1742682929;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i2SkKg6kOtxwoOkWdVxaGHyMDl15IMmbQ5ok+DaJJMQ=;
        b=KRJZV6wGnBjHyB/PlLK++6Mc7qs5VZTbsWG9MRagApsknvJ0CdvI7wnW/6z08+5UkV
         PoRhQT5Y4iCnMoFTsSw3mP0HbKOLX76P25r//zrL7bcZQyeKfr38oPDpx/wqKL9/1EM/
         Ed6DteFvhqh4rd/0UqInxZMT+eNl/EHMjFAwS8NHlBrHOpwzbT9GrQp2EWZRT3DaRX4i
         IqkRNT9TbaO92BjL9RZJ81od8ZBmtRqMA7FWEofbzndTocOMm5uqdYAhDpt+hKSzTb9i
         9BgbnrXi1tp+C/bPaWh6YomjpJh5mggmyNuWZlE/nAWJyQPhBEXkg0fqicLKkKrbz9L1
         jXhg==
X-Forwarded-Encrypted: i=1; AJvYcCXgroXj0ntHEOTbJdphp9sDcSF43kL7iDrpXo/ZVM3xO0jMa9Rt5NISLVxVsxUh8vaPfapCAWM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzL88S9maWSs+BEc+LzKN5OnBF35ZHNo/nJFNivuV3QW/6N7VDM
	CE5fs/I7MPT5aC5dlTIQ5RwSJqgbtAOAJlVLVsgZGFC6hRqAXxXY
X-Gm-Gg: ASbGnctWxjYx4QFeAV4WFVXHgZ4yv7srjaT6BNPoiqCOgqEinW7ZEc3009T15pbOTRJ
	vHx/cFzZwHhS5vIVjZyjzTKDPVhSUAsAHV/JqjylMndlB39R6Y6zkMTpSjfOU8fqqQFo60RmYdg
	7wvXW6mKIh1+jaQ/iwdsePqJ+XV6njFC7FwLpvFpXGzJ2oeXhwmSN6k5shsWJtJWGHGVSQzL61d
	tT56LtBLmmOLtpbMQGbyup5ycI0oiMKyrHEdUPauB3xI/ASiTgkTkbu2V14uKMjp9pYdbTD1s0g
	FZP0IiExj5j3w4hdeaAQ
X-Google-Smtp-Source: AGHT+IEpEs9MMyWo4UFWnsSC1ycVCKzcnkBsNg5/cf5snQGc8DALFkkPjxGXFJ7wkX+/cV1Gc0bnvQ==
X-Received: by 2002:ad4:5ba9:0:b0:6e6:64e8:28e7 with SMTP id 6a1803df08f44-6eaeaa4c59emr119830586d6.15.1742078129061;
        Sat, 15 Mar 2025 15:35:29 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6eade24ea07sm39071576d6.66.2025.03.15.15.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 15:35:28 -0700 (PDT)
Date: Sun, 16 Mar 2025 06:35:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
Message-ID: <pnchvojzytndybmc6xjw4gh5kajsos76lq3lgvkjwqtukl2sya@wvmgw7zp4cqz>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
 <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
 <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
 <a824d6b57ce5a9180a45c3ff65b4b9051ecdc1cf.camel@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a824d6b57ce5a9180a45c3ff65b4b9051ecdc1cf.camel@gmail.com>

On Sat, Mar 15, 2025 at 12:43:19PM +0100, Alexander Sverdlin wrote:
> Hi Inochi!
> 
> On Fri, 2025-03-14 at 08:51 +0800, Inochi Amaoto wrote:
> > On Sun, Mar 09, 2025 at 09:26:24PM +0100, Alexander Sverdlin wrote:
> > > Add driver for Sophgo CV1800 series SoC RTC subsystem. The RTC module
> > > comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state
> > > machine to control chip power-on, power-off and reset. Furthermore, the
> > > 8051 subsystem is located within RTCSYS including associated SRAM block.
> > > 
> > > This patch only populates RTC sub-device.
> > > 
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> 
> ...
> 
> > > 
> > >   MAINTAINERS                        |  1 +
> > >   drivers/soc/Kconfig                |  1 +
> > >   drivers/soc/Makefile               |  1 +
> > >   drivers/soc/sophgo/Kconfig         | 24 ++++++++++++
> > >   drivers/soc/sophgo/Makefile        |  3 ++
> > >   drivers/soc/sophgo/cv1800-rtcsys.c | 63 ++++++++++++++++++++++++++++++
> > >   6 files changed, 93 insertions(+)
> > >   create mode 100644 drivers/soc/sophgo/Kconfig
> > >   create mode 100644 drivers/soc/sophgo/Makefile
> > >   create mode 100644 drivers/soc/sophgo/cv1800-rtcsys.c
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 3eee238c2ea2..ac15e448fffb 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -22354,6 +22354,7 @@ L:	sophgo@lists.linux.dev
> > >   W:	https://github.com/sophgo/linux/wiki
> > >   T:	git https://github.com/sophgo/linux.git
> > >   S:	Maintained
> > 
> > > +F:	drivers/soc/sophgo/cv1800-rtcsys.c
> > 
> > Please change to the drivers/soc/sophgo/.
> > We should maintain all files under this.
> > 
> > >   N:	sophgo
> 
> I suppose my F: entry is actually superfluous because of the above
> N: entry and can be removed altogether?
> 

It is fine to tell others we do maintain these files, so it 
is fine for me to keep the entry point to "drivers/soc/sophgo/".

Regards,
Inochi
