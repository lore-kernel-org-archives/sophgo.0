Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFA74A00
	for <sophgo@lists.linux.dev>; Tue,  8 Apr 2025 04:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744085810; cv=none; b=rjD5VNNCYIpEH/z1xT2nYw85CXcfOVIo66TfVrq+yAufhcbE4c4LlnMioVWl4aaI2zAZ3lNbi1GW79LqVVmNOdMDl+eunvz8qNhdW6iAWHjxi6MiCJkInyurdicJKXpvOEYQvZDuZiqJaO8eBBWB7PNEiyPVHKGcI/pBYIHoMcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744085810; c=relaxed/simple;
	bh=1zDY2PQ7EejFS4wJEh5V7NNvFMuUKFSkFa/g1W1+9Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkzF4p8xEAQQSvZF454dpZYdPOLlv2I8xE1SHqQ1rT+dt5GxG0x0QpauWQUufdV9dcrrSJxo+VkedvEc6H4v7iZV9Tzv6V5RktC21+bBhi9wbZgKEU12aqqQHWMjVC+CEBQcL9m+SJnk6oM9yh+7qgOwSA4TCAIXCLfEyVieO4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihIZyKTR; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihIZyKTR"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e8fc176825so43130426d6.0
        for <sophgo@lists.linux.dev>; Mon, 07 Apr 2025 21:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744085807; x=1744690607; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7MhpaoeO7h/qkpEkWkHzuOXqZ0v7YjgSsCtzrFEagf8=;
        b=ihIZyKTRhD5NBP2mLvr6CHRbaWRGTPxXKwm9tVg16zUyG7TafUr3uhsitS0MeRznlj
         3A/83nvp2/XXOnKJlgchNl+tf1UVeIouAMIJkKMfKQkbc9OQdLpnbM1VOYOJ9mdOgpkw
         to4puGEp0qWKG2f+5+41HzeevfbIh9jLIyMNgI7iCeHaiokm5dDYBDY3wvEIl+MEABgr
         9D6iaMQdOXOgffAQiFffvBRHpNNYA8wudd6pVa7ckE+ctZgFnAGJAQAtXXV990OhOZYZ
         gRpnIPeNIgV2nspDD9qbcuKL8Q5Too4PXv1g7puJ8BUPBsOmhg5X9dfDIGwdOzXhgDgR
         nyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744085807; x=1744690607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MhpaoeO7h/qkpEkWkHzuOXqZ0v7YjgSsCtzrFEagf8=;
        b=u4kxFGpIFLMmyCsyFrkIr/M1qg7YniSatrvFlpI8LIHYt6iEtJ0H3bESo8qPxNQ7FJ
         X3xL4DGVBwUoZxi+ndOvzDx/JGzkU+8J8cnQ8eETFzAHirjv2SHhyqhTTgOJfJujIZD7
         0JVz9zy4sFCyK8qEkhYF07DpJkinWJTzCDGPGM0KQHfHdDNVP8iUMK2V00XxsAplCosQ
         HnaM3ENOaja6ugPoL/Ex9INiy7yDq3aoVKcmf950LJpoPRZRahOuQS3BiPu7pDffAI+r
         Ysn9MNQ7aIiirpgbf6g5IBlSUeCPNPFFiPQUMkvXVmqyh3hH1K2KqGHrpupToUz32hSc
         WtbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOdV2XrLlY4Lr2UC13vy8FTRZMDiVQTMwCiejC8Gn0UXFveSBse4BC3q+Qt5PkEG41N3AIMJA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0NOlSAtUKOLXtdhHKhgHaDMCoyImHne+9TvqI+CXQabC3Otrd
	V6GV19uyV8vzm5nN3jjy9FJOCHSTslAj1U0scJu0wsONinFHzW/G
X-Gm-Gg: ASbGncvwed9YwHKd8aMJ5k0Lj7fLUE3fvHjh+wXFTsCfSvzzWHTSg31wpA9JXemeSDT
	n9nBry98Twal8VXvar365LHM0TO0YLXFqGicCNMFQ/dvLaOSlSgtbqu2KHiuL19Zblf2Tjex9Fw
	coNYH/EcFrL3wHcvjAQ7sR3nMWGlXUmNFmcYvc3SM9jiR/3D9oYo36XNdAp61VgY/EltcAb0eXA
	u12xQB4qHUsTvXzZ+YjmvGSqQSuQSnSy5MI1ZqCfaIxte2g72CCgCZsUsHYdpzeFWLiiTpHrdQD
	2nu+xpYDcF2WnKxN5VDJaFHC0yDmRUM=
X-Google-Smtp-Source: AGHT+IHpkJl0weG7b+4Z2c/EtaTVZb0bclvZQq/iKfwqfKQSUH0SB7w0ljXe5+mA6VKUSb4sI3zcjQ==
X-Received: by 2002:a05:6214:c64:b0:6e6:6b5b:e559 with SMTP id 6a1803df08f44-6f01e7901c7mr249976466d6.34.1744085807163;
        Mon, 07 Apr 2025 21:16:47 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f00f2e0sm68304906d6.36.2025.04.07.21.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 21:16:46 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:16:10 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 2/2] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI
 interrupt controller
Message-ID: <g5ahbuz3uju43qb56xvhx7vi6yuabn6wlhkzeaqfddhxlbo7eh@4dvxswztbn5a>
References: <20250307010649.422359-1-inochiama@gmail.com>
 <20250307010649.422359-3-inochiama@gmail.com>
 <87jz9147tl.ffs@tglx>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jz9147tl.ffs@tglx>

On Fri, Mar 07, 2025 at 08:29:42AM +0100, Thomas Gleixner wrote:
> Inochi!
> 
> On Fri, Mar 07 2025 at 09:06, Inochi Amaoto wrote:
> > Add support for Sophgo SG2044 MSI interrupt controller.
> 
> I asked you in my reply to V1 to split this up into two patches:
> 
>   "The conversion of the existing code to this should be a preparatory patch
>    for ease of review and the support for the new chip built on top."
> 
> And yet you come back with a patch doing both things at once. Feel free
> to ignore me...
> 

Sorry for miss this. I will separate this thing in the next version.

Regards,
Inochi
