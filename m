Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE5E28E8
	for <sophgo@lists.linux.dev>; Mon, 17 Feb 2025 04:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739765807; cv=none; b=Y1AGyasG2TQfldLeo+Ii+HG+YjGb9XNfv0TNvsHLCXFu82puIwFVGEWuAVMQZOw7nhVRVqO2WfxPfD5u0dw6VxodphSu8ONB9DCb/BBB9TjFT8bdEHACHu5RQ5qc/FIS2hKHtnQkQ6yFbhBFvakK/B1nc0iwPXkd067EmkEVcgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739765807; c=relaxed/simple;
	bh=gj/1qK7xign1jPAvFg7498pRb/o7n+h70Z+EO/Pzt1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWAUz0heG2GqDszLRdYjhT/ymKWL4e3EFB8YFxmrtlWOKByAxjH3HShpNx/gG1ad4rgeNJPxvg6/WDmHSho3ZgzsQwFuoQ0rkrAM2A6AAryZ33mtG5x5fqqjv/ig6AWJZIkjSGjJ29djPwZUqbWfdqhNgQZl0Kn81i2iTtdpYM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3NJVsRe; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3NJVsRe"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c08f9d0ef3so48213585a.2
        for <sophgo@lists.linux.dev>; Sun, 16 Feb 2025 20:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739765805; x=1740370605; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xeqYFA0tm4qjUwoN64e2QAw9r7GkkFQxBxzl+wfEXG4=;
        b=m3NJVsRenWkuHFQe58CKU9rMkdq/V0oPgladOzLzRHXOQ9EVXoZr+Wp+TJSyOWTTOS
         CFsIp7JXNga4QTHleWhZNbsYPg7TDbppgYpeFgo4j8UfU6jGftUkByrMYTF5poIjdNxr
         B1UDB6P75pK8tGVn8HsZZC8vlaAUB/gK9WqFjKwhXg6+FVabNOR/LKqvi3leeGExrnFW
         0IYH0Jha2jNpk462uyrNZrQbRrpnxhGfrsLN5nD7Z1MumPAxSbmqS0Rl58+GED6mn/Qh
         JISOEM5aTrpjg8FIfBNdBzrmj/uRtDtd1fYeNu1WHyH3lbRN8PggJjeotcfhwyyWESzJ
         /ZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739765805; x=1740370605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeqYFA0tm4qjUwoN64e2QAw9r7GkkFQxBxzl+wfEXG4=;
        b=Ne/ObmW5AVC4W6PGctDmtqxXPF3dkyTKqlA3AYC+J0Iy7e7g1k0gjtQ6blZ/4h5Ahd
         TSKEDginwkK/qiqPtwX839L7wGpu4sammfB5MDD0/cGI0Xu4hyZnE/mEsZEY7OsmaTzH
         fVwQTAmmUswy7YuOu9TeonBO7n3PRrxCjbcq66TQc79mr1kO+mSRq+OLJNwiqTByg5bx
         UhXFBq/oijxxd9X69siNEo2WhzWz0k9icZueidYHQ6iDspvYW4rdL0IzkOFDz9ayJf1F
         1cutRz80JioxLJoqtLU5pxhJddiDTwv6eSUN8WYPrjL4byKji+0iY+gBeTn3g4OX1+sO
         ccnA==
X-Forwarded-Encrypted: i=1; AJvYcCVgmuuejrsGPCYzBMGvoCdsJR8VMm2sD7cp7/DRFzmSyMHlvf1fvJlHbcKUh3K/KqamWwSY6w0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4Uk5ka6W2yykthWhnpKyqDv4aJYk44id1Xyp8+wNuFW4wUetg
	E46QVhSyQp4y/eCCGA7dzom8QpZTv4OFoTAf5PfvxHrDNaTgmIhw
X-Gm-Gg: ASbGncvp4KpNvzimRR2eM43yE4W+i25kgoYQZKTCvC/hjw+w4kYxyuo03yqOqBCLltv
	FMdagd4i4uTbnS6vSApCkSHE29p7PqYBdV8bAQkEFrt7bV/dmVcXsKFxQFClqNsbTC3P5GS5fju
	ZNi65SR9+vcHoOiRwXOM34XMugHz0BHYWgQoFkxs6JdAXG2EXp2CwgIt731ULGZIt1AsBYIwSNx
	wDTEdyq85pzVogyCu8wltDgCVtktT62eUhImBQlpwgIkLliu+k6aP/nL4k+itMEHN8=
X-Google-Smtp-Source: AGHT+IHUeYGGtto6/bwu6hE+gNTJFxMdU3WJnKYol+GAez3N8iWRXGYbLq/F4f11XJjWE3T4aBpX5Q==
X-Received: by 2002:a05:620a:172c:b0:7b6:d8da:9095 with SMTP id af79cd13be357-7c08a9a2157mr1155035485a.13.1739765803223;
        Sun, 16 Feb 2025 20:16:43 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c09a14d45dsm102936485a.10.2025.02.16.20.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 20:16:42 -0800 (PST)
Date: Mon, 17 Feb 2025 12:16:30 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
	Hariprasad Kelam <hkelam@marvell.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Drew Fustini <dfustini@tenstorrent.com>, Furong Xu <0x1207@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Serge Semin <fancer.lancer@gmail.com>, Lothar Rubusch <l.rubusch@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add glue layer for Sophgo
 SG2044 SoC
Message-ID: <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
References: <20250216123953.1252523-1-inochiama@gmail.com>
 <20250216123953.1252523-4-inochiama@gmail.com>
 <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>

On Sun, Feb 16, 2025 at 06:07:05PM +0100, Andrew Lunn wrote:
> On Sun, Feb 16, 2025 at 03:47:18PM +0000, Russell King (Oracle) wrote:
> > On Sun, Feb 16, 2025 at 08:39:51PM +0800, Inochi Amaoto wrote:
> > > +static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> > > +{
> > > +	struct sophgo_dwmac *dwmac = priv;
> > > +	long rate;
> > > +	int ret;
> > > +
> > > +	rate = rgmii_clock(speed);
> > > +	if (rate < 0) {
> > > +		dev_err(dwmac->dev, "invalid speed %u\n", speed);
> > > +		return;
> > > +	}
> > > +
> > > +	ret = clk_set_rate(dwmac->clk_tx, rate);
> > > +	if (ret)
> > > +		dev_err(dwmac->dev, "failed to set tx rate %ld: %pe\n",
> > > +			rate, ERR_PTR(ret));
> > > +}
> > 
> > There are a bunch of other platform support in stmmac that are doing
> > the same:
> > 
> > dwmac-s32.c is virtually identical
> > dwmac-imx.c does the same, although has some pre-conditions
> > dwmac-dwc-qos-eth.c is virually identical but the two steps are split
> >   across a bunch of register writes
> > dwmac-starfive.c looks the same
> > dwmac-rk.c also
> > dwmac-intel-plat.c also
> > 
> > So, I wonder whether either this should be a helper, or whether core
> > code should be doing this. Maybe something to look at as a part of
> > this patch submission?
> 
> Inochi, please could you look at the datasheet for this IP. Is the
> transmit clock a part of the IP? 

I checked the ip databook and found it is part of the RGMII clock.
Also, I found RGMII also contains a rx clock following this quirk.

> Can we expect all devices integrating this IP to have such a clock?
> That would be a good indicator the clock handling should be moved
> into the core.
> 

I am not sure all whether devices has this clock, but it appears in
the databook. So I think it is possible to move this in the core so
any platform with these clock can reuse it.

Regards,
Inochi
