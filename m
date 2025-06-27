Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BEE21CFFA
	for <sophgo@lists.linux.dev>; Fri, 27 Jun 2025 07:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751010314; cv=none; b=Wcu8paTUP8EPlx5NaYzYA/BDI9XSoqN61Pv+tAmQtMXZHYpsskEXj4PCxmVXPvcItg3TlVg92LGBIvVJXAr4w/BJF/0hibkTLzLXDSlV3QPx7mCgM1F85FFVZ9PpQkpj631om0Qh34xb4YhZVq2SX69VM/gRtvif8wVzL94asus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751010314; c=relaxed/simple;
	bh=vqujOY/R4b/ay6EtDaM0zoqhCTHH7KClxFgKqjr1jAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8WW4yCgA9NrMfDDS8HINZVlFxCrlMyKzM/5JHNTF6edOYrlCQCDlfwfWb4uA8aHyFTg+tkyzr9dI/rUT0Ckhd7M63F8Yr9+VqzXigJBftoBMwVrPl8pvZxZu3phm/EBJNrbAfGgVrwK8Hhi2CglPLPGCqErygr8E8MSojbftxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dP5c5k5y; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dP5c5k5y"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23636167b30so18764275ad.1
        for <sophgo@lists.linux.dev>; Fri, 27 Jun 2025 00:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751010312; x=1751615112; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6kwXMa0RVLz7EpJ4koQvotLZKLm6G+hz8I9ALzuYytU=;
        b=dP5c5k5yQ6SDktoH4QFfcj6aK2a9ITV1cCHvgsg/Tqlwc2qfzhoGcXH8M+4vTmTb7Y
         P1E4kEVGqjRqDoatSBhUx4ebi39ohv7B6S82bkfXY4cE8aKo/J24mBta+ZO3Pl95E3BW
         NaDjjVZaoqtx0iOor+oK1ozKqx9og3PvKJdXReA9N+sCftXmoYJtQTan9X9rLYjMqa2O
         Gg8ednB2pZqQG6c933n4SPG63HmwjWcgmw6ADfIZHG8XBVju9nV+N/LViWDCubzxuG+N
         QZfLEsldWjxYYn7uFYyXHG5faf7l4jXF/tMtTb1PE7fxTr3OBtkdheNUCmPug4x9TlFz
         4LcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751010312; x=1751615112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kwXMa0RVLz7EpJ4koQvotLZKLm6G+hz8I9ALzuYytU=;
        b=OKzgNL6ZMs7S9Ps+3gUnj5imLKhWqHVgCSwRe20W9ZfkZFacY0pXMy6e9Gx2pbWwNN
         NMt0A26qdsiuTfGbOiI7yX9VdKNK78o4XugJU5IJ7P5SDWZITdlLKWqfyGseoEehQXTQ
         c8rP5AXKlO9sTegz4Au4shGvmQC/JCvz637KpVUzwC3hKaTWK+cXl36YpdxRto79XNjl
         DfS5ffRcRtIVH2EJvfCN5tFIiKfqrE4BxkyA924unnLPC0K8mKdgXLM0bkwm3Jo0jQYD
         SQztCQcxKrjhoTcMJsW40KNs5OHfA1isqqvQCIMOWMnwDBwY4+w9peJ6GmdSQ7YkGeVG
         ypUg==
X-Forwarded-Encrypted: i=1; AJvYcCUZRG/+R2dJMwDWezf+Up+1xJuZ6wArbCPgdGG+HhT/b2lW91o8EFSkeLpZvBCorXDV07B79Tg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPG54yqGbv7L6Qqoq8QOsBSH25PqmwAxSxh0ldTQ/Xp2Ni8AYF
	lZNcW3XK5XFAzXtDVt1zQqfeUuqjIi5W2C4th+mJM427W9y4kqxRtJCA
X-Gm-Gg: ASbGncsgUZMYEJ5aNblSP/M2Ud1L4A78wh1Q+ZpCZw+zHEwMeU8vcdHGgkX3IpcrFVx
	8duUalQ5x8tvTUCNZCexwzAs7A+d1Sql9AFg79FT/vGVZ/b+WMAsC8D/H4wP2kwjjIuhYhulBEE
	bKP8j3181nVsgnjpXuZzicikqaxyY0pgmQ/t0s5pWJam/hVi3MzJmmoGPglNMs9YHPxVQThvdFZ
	wN6OBBMuUZPrHKiII4IfBgytdmIZbYCFWYEBzamGkjHbIsgzN31U3EPZ21GYWOLUxrsvGTYlYgj
	DP+VX7FrMyiqcwBboHwXTgeAYjH4Oc2tT0Io5/L4e/OzcKVwgnKDHDCbmLDUPuyIaR8zrZ4/
X-Google-Smtp-Source: AGHT+IEosVdRq8jswGr8fyP/uRwtM7xveOdc4+/YhWRKXXFAv1fBojRPrGKTceYMplzzNMFyzx4jZA==
X-Received: by 2002:a17:902:f601:b0:235:c9a7:d5fb with SMTP id d9443c01a7336-23ac3deaf2cmr35094145ad.16.1751010312004;
        Fri, 27 Jun 2025 00:45:12 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb39b99esm10595105ad.102.2025.06.27.00.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 00:45:11 -0700 (PDT)
Date: Fri, 27 Jun 2025 15:44:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 0/4] riscv: sophgo: cv18xx: Add reset generator support
Message-ID: <ep7gbthprqyzfdcqvs3wadqflyusdsut3uxt5wv5j7mvazyl5s@muk77uizwcrg>
References: <20250617070144.1149926-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>

On Tue, Jun 17, 2025 at 03:01:38PM +0800, Inochi Amaoto wrote:
> Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
> Add necessary code and bindings for it.
> 
> Changes from v4:
> 1. patch 1: convert the compatible as entry of enum.
> 1. patch 2, 3: apply Alexander's tag.
> 1. patch 3: apply Junhui's tag.
> 
> Changes from v2:
> 1. patch 3: fix wrong reset ID.
> 
> Changes from v1:
> 1. rebase to v6.16-rc1
> 2. patch 1: apply Rob's tag
> 3. patch 3: fix wrong reset ID
> 
> Inochi Amaoto (4):
>   dt-bindings: reset: sophgo: Add CV1800B support
>   reset: simple: add support for Sophgo CV1800B
>   riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
>   riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series
>     SoC
> 
>  .../bindings/reset/sophgo,sg2042-reset.yaml   |  4 +-
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 25 +++++
>  arch/riscv/boot/dts/sophgo/cv18xx-reset.h     | 98 +++++++++++++++++++
>  drivers/reset/reset-simple.c                  |  2 +
>  4 files changed, 128 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> 
> --
> 2.49.0
> 

I wonder if the binding and driver can be merged, as many devices
require reset to functional normally. If these two are taken, I
can take the dts change.

Regards,
Inochi

