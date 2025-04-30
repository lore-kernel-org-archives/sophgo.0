Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01A07FD
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 00:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745974701; cv=none; b=GTFIrJ4LtNiJXfnH/j1vF8IDQc5c35HrJ4NsOjeuL/l1HsG8WBuY1ulM2yBj6sp1Po2X1kAkIFMcbDVCIFeIEdS0+8AmwxVkTtwuCZBDJ8kkdAF4X7ZmlGVD8eIZjejxjBRKBV4x06XbCr0Ok0lHLfh9CLsHhYA36PY8PsmJnk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745974701; c=relaxed/simple;
	bh=VTjDPaYh+u5lYUk6QTs7Ped8pYONP5kyLuqft4sGjrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrvAMdW75d53XLR4QDVEmRtbR5ekIqAjGvd/rmY/mGLBmCiWZbDbzglGFl8djOMvGQuMYxvFmaH6iG8E4y0UHjeDEct2QJdMiizNO9D9bsQ1+s2/cF9LUeU7E7OGwBirCNdevthxM4kM/UDMZ0jcAmZgOjaSAnCcRCB9mLdPAoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xm2vlwnO; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xm2vlwnO"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c9677cd6d7so452416885a.3
        for <sophgo@lists.linux.dev>; Tue, 29 Apr 2025 17:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745974699; x=1746579499; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=94XR8HfIvZVA47q76MDPh+836wqzBgIA3jvEFvXfxEI=;
        b=Xm2vlwnOERuAX6g0NP49kdcL1GjR7rqBdCp590kIkDXUEVjYzselPGIsA/L3kW8vdf
         2uiNevQDx40g6cZVfjM0TABBIBsicrUJXbIHIHB8g+2neOS7t+Hu7jKH90ZpdqWpf7qi
         XkCBL6dqqkxPK6zcUe7SwGhuJpUweLfmt+ODk5Y61afkNMy+BRnjEGrfz/ICRKuEJRva
         5P2nJLZgbvDM4NqSYG6gQbd4lodKsG3ZAv+hB1vZKk2jVTryHLYQPdvCK+pRjAe7I3jC
         hMf+C5YYYnZkXwYWqLTv+Idpd+vdSkMf2eyJAta/5OJhr0PKJvMY3m39XpfSsOMZbNVS
         fkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745974699; x=1746579499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94XR8HfIvZVA47q76MDPh+836wqzBgIA3jvEFvXfxEI=;
        b=gNzgdapE2ldex1tWl1xerJF+opu62VmlFTNKyro5ZPPiPHL+VyyvCjI+8NtG/xo3WP
         bavgw/NbjP38fNA4eh94D2ODIBahw5S1AnUl0R0LD8+aWjRof72lPxQFqvGHvvWexI2+
         WktohlXD+Q3Niv4U4dGhDTQySGQfheWlgF05GCkFulq9mHyCWGUn7CePgfoQTos38/dN
         qp+Y6+TzPlPsAn/bbZ7YAsZNtp1z0dhdyHxpgSUhUndreyIrDFjxJdgZT45z5+zrFeWe
         eqZt7hdQvoDG2TZSb9BtHcHhyxGxnXxIN+dKlGgDOOXQIrZVZS0CRCs7Q0GFUhazyEmb
         RUsg==
X-Forwarded-Encrypted: i=1; AJvYcCXiB4w+NOCS525vRTxObfMjJ+jgVOVLnC7nTMBpObkqY54YCLwLEKljuO0TglM4LaX+4E28ANI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxnh6B804W02AaQzKCWOSp71ig5Q/lXJyiVz7WrGb5byVXNlbo+
	1Gko8s4ITF8ypXmwuSbjy+SJNSD+7wPS1t0qQ755Zlu/ZuuyufNG
X-Gm-Gg: ASbGnctK6/hUkt5Mz8pqRVSMaL51GqRxVdJOCsxBi1Sdg+DVZKyH68e9xg9PDXdZHB6
	+/+D0fyNRcjFpSrqhcFuouLlAFs5ALUC5sXcP3AT1froVJgSH8waPxY/D+gn1dPFFBMxUqO5i4W
	rBTapwgGHJN2RcFg35DFFtd1o6B9U060+INQM8Y7eH5Ko+ev7s7ptMa/EDFfy1M/Qwo7aVMzrs/
	JXnj/e1iJ0kF5xXPeKmL3+uQv+XIUvGzlpFzvm/lxaXbvWmF+WSJFBuyI50httlLDUTjCYXk7By
	47+KS1B6EGf9fPs2
X-Google-Smtp-Source: AGHT+IEoxuSWeOuphj55vm/B2QbnSvTd1DarRfQwHsT+LizREZWeT0py38cxrg7yErDGpEqmoj4ZIw==
X-Received: by 2002:a05:620a:448b:b0:7c5:50ab:de02 with SMTP id af79cd13be357-7cac767c95fmr205020885a.41.1745974698627;
        Tue, 29 Apr 2025 17:58:18 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c958c9204asm804297885a.5.2025.04.29.17.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:58:18 -0700 (PDT)
Date: Wed, 30 Apr 2025 08:58:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Nikita Shubin <nikita.shubin@maquefel.me>, Linus Walleij <linus.walleij@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 0/5] clk: sophgo: add SG2044 clock controller support
Message-ID: <f6bg3cwrujyhbrcpww3ezsqew4raelctk76qwl633f3sbkbasa@g7fuf4taklby>
References: <20250418020325.421257-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418020325.421257-1-inochiama@gmail.com>

On Fri, Apr 18, 2025 at 10:03:19AM +0800, Inochi Amaoto wrote:
> The clock controller of SG2044 provides multiple clocks for various
> IPs on the SoC, including PLL, mux, div and gates. As the PLL and
> div have obvious changed and do not fit the framework of SG2042,
> a new implement is provided to handle these.
> 
> Changed from v4:
> 1. patch 1,3: Applied Krzysztof's tag.
> 2. patch 1: fix header path in description.
> 3. patch 4: drop duplicated module alias.
> 4. patch 5: make sg2044_clk_desc_data const.
> 
> Changed from v3:
> - https://lore.kernel.org/all/20250226232320.93791-1-inochiama@gmail.com
> 1. patch 1,2: Add top syscon binding and aux driver.
> 2. patch 4: Separate the syscon pll driver to a standalone one.
> 3. patch 4: use abs_diff to compare pll clock.
> 4. patch 4: remove unnecessary else.
> 5. patch 5: use clk_hw for parent clocks if possible.
> 6. patch 5: inline the header which is necessary.
> 7. patch 5: make common array as const.
> 
> Changed from v2:
> - https://lore.kernel.org/all/20250204084439.1602440-1-inochiama@gmail.com/
> 1. Applied Chen Wang's tag.
> 2. patch 2: fix author mail infomation.
> 
> Changed from v1:
> - https://lore.kernel.org/all/20241209082132.752775-1-inochiama@gmail.com/
> 1. patch 1: Applied Krzysztof's tag.
> 2. patch 2: Fix the build warning from bot.
> 
> Inochi Amaoto (5):
>   dt-bindings: soc: sophgo: Add SG2044 top syscon device
>   soc: sophgo: sg2044: Add support for SG2044 TOP syscon device
>   dt-bindings: clock: sophgo: add clock controller for SG2044
>   clk: sophgo: Add PLL clock controller support for SG2044 SoC
>   clk: sophgo: Add clock controller support for SG2044 SoC
> 
>  .../bindings/clock/sophgo,sg2044-clk.yaml     |   99 +
>  .../soc/sophgo/sophgo,sg2044-top-syscon.yaml  |   49 +
>  drivers/clk/sophgo/Kconfig                    |   19 +
>  drivers/clk/sophgo/Makefile                   |    2 +
>  drivers/clk/sophgo/clk-sg2044-pll.c           |  628 ++++++
>  drivers/clk/sophgo/clk-sg2044.c               | 1812 +++++++++++++++++
>  drivers/soc/Kconfig                           |    1 +
>  drivers/soc/Makefile                          |    1 +
>  drivers/soc/sophgo/Kconfig                    |   21 +
>  drivers/soc/sophgo/Makefile                   |    3 +
>  drivers/soc/sophgo/sg2044-topsys.c            |   45 +
>  include/dt-bindings/clock/sophgo,sg2044-clk.h |  153 ++
>  include/dt-bindings/clock/sophgo,sg2044-pll.h |   27 +
>  13 files changed, 2860 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2044-top-syscon.yaml
>  create mode 100644 drivers/clk/sophgo/clk-sg2044-pll.c
>  create mode 100644 drivers/clk/sophgo/clk-sg2044.c
>  create mode 100644 drivers/soc/sophgo/Kconfig
>  create mode 100644 drivers/soc/sophgo/Makefile
>  create mode 100644 drivers/soc/sophgo/sg2044-topsys.c
>  create mode 100644 include/dt-bindings/clock/sophgo,sg2044-clk.h
>  create mode 100644 include/dt-bindings/clock/sophgo,sg2044-pll.h
> 
> --
> 2.49.0
> 

Hi, Stephen,

Would you like to share some comments on this series? I think this
driver now it is ready to go.

Regards,
Inochi
