Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CD9A47
	for <sophgo@lists.linux.dev>; Tue,  1 Jul 2025 01:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751333017; cv=none; b=WnryWiCKw9z10MKkWoxC7LN6QeFNAfT8i8YXS7M0c/QjxP1F/wK1a3+I6BP0H7svtstGBCdHAkDXFPqA1B+F/4YhfvL/D4QyT+PA6rM8gW4A9xMElnJyg9IpdnZdM2rDc0X/ZYzrBIg2nRI8nxJyiHEDYfJhgkDg8lp4nzQTND4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751333017; c=relaxed/simple;
	bh=nWsdPjkIHLStXytRDGELqLXh6E1K8A/hb4EUHkz3d2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cr400GwGhkRN+Uc/eknnLvmEW1a741KY5CFJFXv/a9si1+n080iivBpCbQsYTqwVynNSzg/l1rolwnjrxcnhG2o7gfgP45J1xZZgS2zqmBuS7e2GvNuE0Nh4xT8o3zOL1U8CtpDkrfxPvHF91e+gf6tXgR/mlcsDjEoolVWm1hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQ41+0/J; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQ41+0/J"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b3508961d43so1525268a12.3
        for <sophgo@lists.linux.dev>; Mon, 30 Jun 2025 18:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751333014; x=1751937814; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z6DtZA4TeVhHJ4LgQPcp62/OtINngczo0Qlp10jTpvs=;
        b=TQ41+0/JayL6p1o50SMxWqg+b+x7DPgrnpxBaaOVyjUynaE18oIIBp5XAiV7J0TTm9
         9P2BxId7EGPF83QS4QkNd6ZbJH8l3MKZBqAoql73BFveRi2YDmv2mrDujruINoqNimuB
         FR5TIasD609J+Rcwq69x7lMnhkHf/Tb73l8KXauqwRwvsDIDuhpdq6xrdkFJsxFJZuQf
         ybcOyNSOb0jRe7uqnxvt0MaLj0V9RICsCQHcQzE3Nbe5pPT123dz1DRwusn93pAtdxv8
         0hVa3JAfDuHl80Q7UDVmFLFauCAex+2WKWDOUrSCwmq3GO1tvlbUtJMVPjRag+/JBHsK
         dpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751333014; x=1751937814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6DtZA4TeVhHJ4LgQPcp62/OtINngczo0Qlp10jTpvs=;
        b=FUWWcx0ZgTW8GW8K2yLfgfDTRbTYVy0ujInx+I/n4OrOZnwf1MadkZnHqdy8wigyXd
         QepLTF77fcew9we9TIe5DecwAp0Fj/ys9N0Ecbf5dJG/h20s4d8FLzepUMZbr1WkakZl
         TMWgYCFyhFN/XdHzA1tU28UF8sN2pLaejuU/FjtL8P9wxqLNbOiVSUqMpJVBx2m2C1Pf
         Lo2/6Icj6iREph2o7JO0jlxGFY3cJn6nG7HpiQZjTioKs2+Hd6aKXQMFoA1+u90w1GW/
         sQlwgL9+MTMQTJFnJojlXiBFRuTHR1MqDp3S+P+l5wxCbFDeDkn8pz1pDjLly2YmvL1z
         W21g==
X-Forwarded-Encrypted: i=1; AJvYcCXrN3ClmS2gaMq3fuxkwmPs2atJqwx590Bsz8RowZL7MPPVUkgixgLaY4o5TWXtfTCo7g70mgA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpTv0s2DwIK3ovNhSNGlOEUYlR/r0ygKv0wtOs2BTH1RxoqkoN
	jVwntloZpij1iOPTcj23bBW5iklC+2swW1SDrQwgCXB47N7Xdm+dQOd87CxcwwW+ruo=
X-Gm-Gg: ASbGncuN0DyyFYMkZIy6z8xXqHqOneQdQ9HzyVuhFMfZ1qlNfH4CbuE0ywWwI1qTuLM
	LggsL5f8zmuB95XlOsFhVNvtQkfsgCqtHeqXbPmEYmGiK1FTg3AMzadWuvxhBj5jXBS/OHo3BjJ
	59bjnXnAOQRoSB/gD/MSlnSDOFV+QqfwyH2dSwm3N7+6IFGfhJrI9OMJAFWPlExwMYBF87BP8vy
	PfSSIgnixA7h6YAyRTyHZlxCivZhPKVHB5g382R13atb65Wiq7G9Bd9KZ9jJQYK5zaKY7uzRDiG
	ogS3bCypbpTThDNf5ehlEbqc2Q7UfoulTta6WUSqYLcAmL6nm7Q+iBiBzpptng==
X-Google-Smtp-Source: AGHT+IHBfzg5Sx40TE02hAClbOF6eEZK4Q2Z0GmTczaAMMCBaM6R3MFw6f7sjjsS70ov9TvAF6LTsg==
X-Received: by 2002:a17:903:1b28:b0:235:2403:779f with SMTP id d9443c01a7336-23ac4682496mr217436775ad.29.1751333014268;
        Mon, 30 Jun 2025 18:23:34 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb2e2423sm91648245ad.37.2025.06.30.18.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 18:23:34 -0700 (PDT)
Date: Tue, 1 Jul 2025 09:23:16 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Richard Cochran <richardcochran@gmail.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next RFC v4 0/4] riscv: dts: sophgo: Add ethernet
 support for cv18xx
Message-ID: <vxnvovuetfd6rzgaenwplpkhxm62fhw6t3vi4wkyigul7p4bkx@pwlprna4pyul>
References: <20250701011730.136002-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701011730.136002-1-inochiama@gmail.com>

On Tue, Jul 01, 2025 at 09:17:25AM +0800, Inochi Amaoto wrote:
> Add device binding and dts for CV18XX series SoC, this dts change series
> required the reset patch [1] for the dts, which is already taken.
> 
> [1] https://lore.kernel.org/all/20250617070144.1149926-1-inochiama@gmail.com
> 
> The patch is marked as RFC as it require reset dts.
> 
> Change from RFC v3:
> - https://lore.kernel.org/all/20250626080056.325496-1-inochiama@gmail.com
> 1. patch 3: change internal phy id from 0 to 1
> 
> Change from RFC v2:
> - https://lore.kernel.org/all/20250623003049.574821-1-inochiama@gmail.com
> 1. patch 1: fix wrong binding title
> 2. patch 3: fix unmatched mdio bus number
> 3. patch 4: remove setting phy-mode and phy-handle in board dts and move
> 	    them into patch 3.
> 
> Change from RFC v1:
> - https://lore.kernel.org/all/20250611080709.1182183-1-inochiama@gmail.com
> 1. patch 3: switch to mdio-mux-mmioreg
> 2. patch 4: add configuration for Huashan Pi
> 
> Inochi Amaoto (4):
>   dt-bindings: net: Add support for Sophgo CV1800 dwmac
>   riscv: dts: sophgo: Add ethernet device for cv18xx
>   riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
>   riscv: dts: sophgo: Enable ethernet device for Huashan Pi
> 
>  .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  73 +++++++++++
>  .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |   8 ++
>  3 files changed, 194 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
> 
> --
> 2.50.0
> 

As this is mark as RFC due to the reset dependency, now it is OK
to merge it as the reset patch is taken and this patch is a minor
change . I hopeif anyone can take the binding patch so I can take
the devicetree patches.

Regards,
Inochi
