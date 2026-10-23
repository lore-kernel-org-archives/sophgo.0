Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772535;
	b=1ImtnXfMnvUo4oABC/chm5j+6aBEVDku5dWcM7yzuRMJOc//tRzGZs8xwbKTaqVAvmZr
	 GIBpmJrmz3SigAZ0QFYRFo4ix+eUa0xbgQiaXTM/SfgtI7i5wctVSyG6eb+QP8qwPxqRQ
	 jRVFgeyRu0rshwu6c1Fv142b5meOrbRLjYTg3Vpo3NJCT7D//T/pBDJqOq3HCpP9KhpEz
	 l6TYqQeQXWJndZxZ3sxn7IoNWRngioYpR09TnobDFTh/bPnLcVZ0I/zKf7PDglyLWJOZn
	 ceoyXGto2wMYtoRdgqX4Q58qUB+DB0c8yCJ2ot1iEtv3cO2KDHqtN/TaSy7Ukz2S+zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ZJ0xWpVe4TubyrkAFcNp+wX+AghqXwDOEBl9H0zUk9M=;
	b=F/0qau+SeLTtsG2QhnwRw15vgmxLAFvVdFF15vjAvt7/dBOTWcPcDbmn0FbmLhZWkLj/
	 JuahcW1SbTHbC8wfJZuAZl1AgbT/eUSrxvLMOQWHwHKX3ZC05TrQUth9EIZWiE6C/sjrI
	 uuXOv7N4+jlTsm4+YO/QxvnWm1S4WS/4ZCWjL8a22ViLgZSn/eVfOeq36jeTNvcVl2Aru
	 1apVOHpmbIYbG/T50Po4BcESNxlqXRKdsgqNJpTLkYyMjym6GQKGPEVtWkwz88jBg443E
	 WgMIiJtZKEqud67U3UskvTUkAxQuF3hpxdMyRWUFPf9oRNqvFmMl9dFbaeBdFytKpjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AAETzZ+1;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DF4606A31B
	for <sophgo@lists.linux.dev>; Fri, 23 Oct 2026 16:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73DF4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AAETzZ+1
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1627035137.1
        for <sophgo@lists.linux.dev>; Fri, 23 Oct 2026 09:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792772533; x=1793377333; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZJ0xWpVe4TubyrkAFcNp+wX+AghqXwDOEBl9H0zUk9M=;
        b=AAETzZ+1QL4UpwYC/EcsPA8jPJq8ctd73NGO8DeFEdTEWd3zO/BhyeV+mC3jkAuzzz
         w0tlitV0PdRdzkbSQ5ZL+fUMzYHA51+J6emAFd0X34kfZ29D5IY/XLGru2UA+iUIINKd
         cPMFlGJ+84IeAldCiVBxHwtrQcvvMiXPDhWnicODYUo32/DnCajkwPmy5ip9CHqlWjvq
         On4SJTJcXLFVazeKwd10YtVI/KYU8DSouu2drdJAP0+S2wGPd5EePK0Fcw1R4eE4a+ni
         Pm0nUi707E422ztEyRaGVSUTUUDfylhnBi5KglIlsZKRetb3PTWNThseuhCoqrFGZjhx
         Rvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772533; x=1793377333;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZJ0xWpVe4TubyrkAFcNp+wX+AghqXwDOEBl9H0zUk9M=;
        b=NKRbdWBQHW6R3OptnSzCgQpyls+wrtsWBwJgfzOFwcYG9vVsBapd6LzVKkbmG1fSKB
         JqTJylwC5ypkz/D9XU3GaFN6y05XWy9jn4BwOfcSABREomKw9qNZNmGLPvEc9YjjG1PC
         AbCFNNskY3HUbqzz9nB/T2xR3sA+raJ6eUX6L+eEYWeEiMRLdXxNUkDpi4zarSP9iiwR
         ila24GZSLB0v8/2C1HrGwudzM00IPyyYnW+HRaTl8K6+lDHF28Ccj+qe5uRTlCt3QY2y
         xPEwIkwUKey6UjA6gSI6xyv9gFwUAjaL3EX1U9OAh/bL6AjQQ7wbjP9RNpdvbxSggmJS
         gCGA==
X-Forwarded-Encrypted: i=1; AKwUvBz7J1HP+pwK94rsqPSjvWjXXL1ZocI8MTY7w7VuyNwzbYdY2iymGyyvvdALWgGBATf4SBZE8f8=@lists.linux.dev
X-Gm-Message-State: AFq9FYKMFwSp4zFWpkdrtcoumwXI9K0WsYqS8U0C+PP2eRvra9utpjFs
	h/MSgHUYLEMU8b9pMuA3dC/FhkJyUR9d3nF0HWS+AZYIgAGsW645JP1TaoX5K+Wp4so=
X-Gm-Gg: AYBFou0kc1XW3psf7UGFEKS8/2VPTX0xG/pDIHNYYoTGG1tzSs1+GZ29DMaxZ6vUEub
	cFMB9z0WWZowXqSiDr7jMXDe2h1+Q8q0QUO3zp6dWP3ee6vW40oIOBgB4rfiH9o95GIuiEySewC
	I4tDiHyHqgEfiedbqx2m5O6gg8DqUppU24NL04PU1Ey99sholbJjVvSQsJAhhixTJyhbmcYO6c7
	ZM7fbA1I+QOvTlNQwPXoeVdqULRHeVNOrNBf7dX9oLHH243Ofx//1mUw1kZSFbXlONmKHrUKU2A
	lXF3WZ/qlfKdZws+308dCCQup+KO/3pAqmXQujh2K5btzH1gdc0VAOgJHYcBi7whEW8bELA993r
	mskw7vXA17MXa3o3EtqreCatiF1HHsOpJ6axQZ9c6Oqa4CvWKoaLgUoBdP0NBX/An22UH4bN19W
	yZ89LpIMzykNGUyZcuQsGmTdyiJx2MpMX27yhYrXxUu3vEmV03vhU7hmqeLjTPwbiZOzI80KqmG
	PNhZIqeiWETYsRMrKl9RXBS0yXJzOCOuAyf+ZJ7KAAqihf5PZQBL5lVJ1q/ri7+XFv6q/nyBMJW
	XNGCq/t/t/5CzA==
X-Received: by 2002:a05:6102:524a:b0:7c3:881f:b76c with SMTP id ada2fe7eead31-7cca9a0f9f7mr1612370137.11.1792772533315;
        Fri, 23 Oct 2026 09:22:13 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec1fef3fb6sm586734e0c.8.2026.10.23.09.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:22:12 -0700 (PDT)
Date: Fri, 23 Oct 2026 13:22:08 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	sophgo@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: sophgo: add cv1800b ethernet support overlay
Message-ID: <atuJfV2qGirgShGY@hiagonb>
References: <6067ebd6-83a3-4ba5-86c9-a66c3348f8e4@linux.dev>
 <as802eClIH7MpxBR@inochi.infowork>
 <as-_ZlweuKWU1dsc@hiagonb>
 <CAKspUhL1HMT14JZARuxnoh21+mH+7_9rJRggqu_s-t4_CZB8PA@mail.gmail.com>
 <1036bcd5-09ce-47f0-855b-1f1fbf248825@linux.dev>
 <CAKspUhKLD+dCXxtY+hTCGL6465YpeSAypE8dncEH28YKowZusw@mail.gmail.com>
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUhKLD+dCXxtY+hTCGL6465YpeSAypE8dncEH28YKowZusw@mail.gmail.com>

On Fri, Oct 23, 2026 at 11:26:38PM +0800, 葉宸佑 wrote:
> Hi Hiago,
> 
> On Mon, Oct 19, 2026 at 04:36:31PM +0800, Chen Wang wrote:
> > Chen-Yu and Hiago, you two can discuss it amongst yourselves, just make
> > sure there's no duplication should be fine.
> 
> Since you already plan to respin after 7.4-rc1, please go ahead and do
> the merge yourself, covering both boards and keeping the current -eth
> names; that keeps the two of us off the same files. I will review it
> and test it on the Duo 256M with the IO board.

Ok, I will do that, thanks!

> 
> > Are there many expansion I/O boards currently on the market for the Duo
> > series? I'm not entirely sure, but my suggestion would be to avoid
> > adding too much support for expansion boards to the main codebase,
> > that's something best left for others to implement offline.
> 
> Fair point. The naming only matters once the USB role is no longer
> fixed to host, so I will leave it out of the merge and bring it up
> with the device mode work instead. That is about the board's own USB-C
> port rather than an expansion board; I will send it on its own once it
> works, with a proposal for how the IO board setup keeps working.
> 
> Thanks,
> Chen-Yu

Best regards,
-- 
Hiago
