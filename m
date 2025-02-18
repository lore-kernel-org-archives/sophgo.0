Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8212D265CB8
	for <sophgo@lists.linux.dev>; Tue, 18 Feb 2025 13:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883809; cv=none; b=Ay8g154isFd55emX2WG8AxK+1XmHs9hPeSuy0qi4P76ayWT4zx+iJAeygUACYT4WYEhJsQ5/L8I4VaTEOfLfdPWtZU6qLZvWS51EXLAAw1fMJIfJvOf0a1ofLUm1nh8KreX8i89sTWcesUHklw+6yPduhXrakafOXISVn8Sjhjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883809; c=relaxed/simple;
	bh=flUlf8HSS8oigGTq4cDt8CaW81S8RWojiSVP5bbCKX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjiwPmTOSTZRmQNT8osfjKD2CVITsQTS+UloZ+1eQJwXfD7+jEQ1yY2+HXO45pU4v7Nfbij0QhSpzlkjh77LhH9BSkKux8+OHcNPUJHHsPNVw/u8s2zDsosmLPRm/0WGMBrjzK71LtVdZ4M1uaFY5XKrA/g+Y4Z/mCEfgKl4Lc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hk+M5XYN; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hk+M5XYN"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7be8efa231aso590004585a.2
        for <sophgo@lists.linux.dev>; Tue, 18 Feb 2025 05:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739883806; x=1740488606; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=shcHVe5ScV+KF73Cqgadpco0XHdM/Pvt/zjUdwF7k8A=;
        b=hk+M5XYNIfvSk4xCludr1irM7qfDEEm4hU3ISViCziOC1y/U1QGQC5csDs21kUWng8
         Zyav1/dXf6plcYhdRK+ua9yAul9MtWGMeLlB0nemMcXYYHlF20VMiYJEMha/uw+6CiIw
         jrx+CZhKaZ35xe78DaHXktSBtWFQZczJ3QSUrd432toEmYPAn68jkk+7yRy6SF1P+RNI
         LsjO9CrKgFLjPlhcDTZTwvPFooQGlcuRa8d7eHHlMBWtyv4xFavWY6eOK8aRJA1EpCBt
         r/d35whl/FJJWp9ywzNkEhDqBwo+1ERB7U3j9sqUwFvmHDxPMRs9FJLHUFPBbDiAD3rO
         qhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739883806; x=1740488606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shcHVe5ScV+KF73Cqgadpco0XHdM/Pvt/zjUdwF7k8A=;
        b=CpXZf/KODiSzisOmabMdjOx4hQvwfA3V7k1mf3+UR60HVaOljUf6m+/clqlfS31T6H
         UgpZHkrNZ1+Dr8uS1L6K1PSTo2u7l06OZXn060Asx/xDhX7CYfbQcjU3sj3D9XprxNoH
         BUhZCTwYOO7hB2bK1GcvHC5QZtE6uxIHEvTmRZ3NagcZCnTg/1YnBFiTwiR1Yli4fCIL
         MyjXhN8TML2xfqOQGMF/+AlpX6D58b0d5IOovFhCdAVdhe6pN6iY7fIVP4RFg4bA8vAW
         KdOKxMcsqgoLUowl3Q9CXU6aWrhSkVp37sRvlw5U0BE0MXIQ98Fjj6g73w2E3TGEKlsD
         Iw/g==
X-Forwarded-Encrypted: i=1; AJvYcCXtvv1+5SQlf4XZ0WHBnJIbxzz2lLFJUKLNWhC3/6vUyTAY4erDQO4NX65xp72bnrmqQVVzn8k=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBP4jIslrMYxlAAlTmhY2Qir0WQ9t4HKUqGW7FS03Usmm2DE5j
	AWxMRPCNJokdlJbYgjxPKjP9Ow9/D/819xexp4NhZUzbCMMewO3V
X-Gm-Gg: ASbGncujG4L/mUFlI1cxRM/ZUzZZ+LF8i7mfhXhsgj1eYYXJhDrat6sKIvd8UMBGs0v
	8Bg+QJpvc/i/yXSsCPerJlz2E2XbmQ+Zb87JCTsugTVJ1omZZVZTml73yqFCTBVRDM8b4KakHyF
	t5zq54oMLQyZQZRAYq1207ajzZ6+fdngrk7IHF95PL4GEWCEidXuYwrQgfrrVCqJeWYw1PwJAjM
	eMDYUj/ZvWUJZa7BXV2A21PHmfvetDNlrQNZasBNOZAK5Uy+9rgrKDrBXr+qTSrrvU=
X-Google-Smtp-Source: AGHT+IHMvBa2pdrsPXBeOhKSDCxofcBeoktPP7uW0o0YVj6yGzgsaMY5yizsS+ID7z1U76ykO/2aOg==
X-Received: by 2002:a05:620a:31a2:b0:7c0:7ca3:b123 with SMTP id af79cd13be357-7c08aa98cdfmr1890605085a.46.1739883806193;
        Tue, 18 Feb 2025 05:03:26 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c0a28e8700sm189185085a.113.2025.02.18.05.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 05:03:25 -0800 (PST)
Date: Tue, 18 Feb 2025 21:03:13 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
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
Message-ID: <rkcf6tmgv44uxof3oxsmzqduvc4bumtnsjlkvenxezu2tjrp6l@vy5rbr4p7f3d>
References: <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
 <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
 <24eecc48-9061-4575-9e3b-6ef35226407a@lunn.ch>
 <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>
 <rsysy3p5ium5umzz34rtinppcu2b36klgjdtq5j4lm3mylbqbz@z44yeje5wgat>
 <Z7PEeGmNvlYD33rZ@shell.armlinux.org.uk>
 <6obom7jyciq2kqw5iuqlugbzbsebgd7ymnq2crlm565ybbz7de@n7o3tcqn5idi>
 <Z7Rjjo5nZ0gnCbzq@shell.armlinux.org.uk>
 <thc5oknaqaw54wghyxpx6nr4kbykxvpgkgvpqsnsp2osjlxgwv@dekgtkxoywrm>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <thc5oknaqaw54wghyxpx6nr4kbykxvpgkgvpqsnsp2osjlxgwv@dekgtkxoywrm>

On Tue, Feb 18, 2025 at 07:34:47PM +0800, Inochi Amaoto wrote:
> On Tue, Feb 18, 2025 at 10:40:14AM +0000, Russell King (Oracle) wrote:
> > On Tue, Feb 18, 2025 at 09:01:59AM +0800, Inochi Amaoto wrote:
> > > On Mon, Feb 17, 2025 at 11:21:28PM +0000, Russell King (Oracle) wrote:
> > > > On Tue, Feb 18, 2025 at 06:50:24AM +0800, Inochi Amaoto wrote:
> > > > > On Mon, Feb 17, 2025 at 02:10:50PM +0000, Russell King (Oracle) wrote:
> > > > > > On Mon, Feb 17, 2025 at 02:25:33PM +0100, Andrew Lunn wrote:
> > > > > > > > I am not sure all whether devices has this clock, but it appears in
> > > > > > > > the databook. So I think it is possible to move this in the core so
> > > > > > > > any platform with these clock can reuse it.
> > > > > > > 
> > > > > > > Great
> > > > > > > 
> > > > > > > The next problem will be, has everybody called it the same thing in
> > > > > > > DT. Since there has been a lot of cut/paste, maybe they have, by
> > > > > > > accident.
> > > > > > 
> > > > > > Tegra186: "tx"
> > > > > > imx: "tx"
> > > > > > intel: "tx_clk"
> > > > > > rk: "clk_mac_speed"
> > > > > > s32: "tx"
> > > > > > starfive: "tx"
> > > > > > sti: "sti-ethclk"
> > > > > > 
> > > > > 
> > > > > The dwc-qos-eth also use clock name "tx", but set the clock with
> > > > > extra calibration logic.
> > > > 
> > > > Yep, that's what I meant by "Tegra186" above.
> > > > 
> > > > > > so 50% have settled on "tx" and the rest are doing their own thing, and
> > > > > > that horse has already bolted.
> > > > > > 
> > > > > 
> > > > > The "rx" clock in s32 also uses the same logic. I think the core also
> > > > > needs to take it, as this rx clock is also mentioned in the databook.
> > > > 
> > > > The "rx" clock on s32 seems to only be set to 125MHz, and the driver
> > > > seems to be limited to RGMII.
> > > > 
> > > > This seems weird as the receive clock is supposed to be supplied by the
> > > > PHY, and is recovered from the media (and thus will be 2.5, 25 or
> > > > 125MHz as determined by the PHY.) So, I'm not sure that the s32 "rx"
> > > > clock is really the clk_rx_i clock supplied to the DWMAC core.
> > > > 
> > > > Certainly on stm32mp151, it states that ETH_RX_CLK in RGMII mode will
> > > > be 2.5, 25 or 125MHz provided by the PHY, and the clock tree indicates
> > > > that ETH_RX_CLK in RGMII mode will be routed directly to the clk_rx_i
> > > > input on the DWMAC(4) core.
> > > > 
> > > 
> > > RGMII is not the problem. The databook says the RGMII clock (rx/tx)
> > > follows this set rate logic. 
> > 
> > Sorry, I find this ambiguous. "This" doesn't tell me whether you are
> > referring to either what s32 does (setting the "rx" clock to 125MHz
> > only) or what RGMII spec says about RX_CLK (which is that it comes from
> > the PHY and is 2.5/25/125MHz) which stm32mp151 agrees with and feeds
> > the PHY's RX_CLK to the clk_rx_i inputs on the DWMAC in RGMII, GMII
> > and MII modes.
> > 
> 
> What I said follows the second, the clock is set at 2.5/25/125MHz
> with speed at 10/100/1000Mbps. The only thing I can refer to is the
> ip databook.
> 
> > clk_rx_i comes through a bunch of muxes on stm32mp151. When the clock
> > tree is configured for RMII mode, the rate on clk_rx_i depends on the
> > MAC speed (10/100Mbps).
> > 
> 
> OK, I have no problem and find some descriptions related to this in
> the databook.
> 
> > This suggests as far as the core is concerned, the clock supplied as
> > clk_rx_i isn't a fixed rate clock but depends on the speed just like
> > the transmit clock.
> > 
> 
> This is what I want to say. clk_rx_i is not fixed but the
> s32 uses it as a fixed one (This is the thing I felt weird).
> 

> In fact, Non-fixed clk_rx_i is why I suggested adding the rx
> clock to the core at first. Since the drive may not use rx
> clock as the databook says, it is good to leave it alone.

Please ignore my wrong point, I mistake the direction of the
rx clock. It is not provided by the mac, but the phy.

Regards,
Inochi
