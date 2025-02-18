Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6321AED5C
	for <sophgo@lists.linux.dev>; Tue, 18 Feb 2025 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739878505; cv=none; b=C3lyCYGhuHHWKLeKa+7H5GDQlO1sNlujeYxDYrzlR/IPoJOdL+OqyzGnds8Xe5WQvuQKDRd/SWQ80gUKAzKAhF21cFAJiyGx6O4/f9kf2AiR5vdbdMWawkXVsWHsYyZyg5cSn+APELHgo65winBG9KASu+fCEm2igxBPlbpoF54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739878505; c=relaxed/simple;
	bh=0Ooo78SXds6E1nnEquaFe/2Vk0UC6/lAqlJ+KmDmEl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kwl/yqylQCWjhuvmY+yBx5UKRF2tDWSRqoMnQKs0kmM05Zcz+FDhNaGcj6zuLbEJ3sB8zdgmdNSeEfz8+qPHEzA51VymMxVFq0ti+avLZJnLrRCaPEO+4gpahSurkcmyFriW3URsVrMcFuKAeJGeC+JGEzaD8ZBicTDw8Z2+5+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBh5lvyO; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBh5lvyO"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-46c8474d8daso42043321cf.3
        for <sophgo@lists.linux.dev>; Tue, 18 Feb 2025 03:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739878502; x=1740483302; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=afaSq1n/9Zx2C/a6yp1UZpzU8FTiNXOckROl9W+xe1U=;
        b=EBh5lvyOwNQK4lttfUUHovtXCbJI37bvysBy0bfWKvQTe0JzsGNgZVWCuEfN4V6XG8
         hFfCIrEhr2TlhSFrDwTsKhRNibr7lX+YeTIILtqQ/o+Jo6xZswtKLKIbpXEvAERhR5cT
         hKz1+CKwu5LGUZxEy87Wk1nU41sJXvTth5r1KODzCki0gnBSDgW9oxOEFy7WiAqOjvVt
         35GCcWgEPqdfl/ZVL95lbS4sOyCvr8lEmHuGgWa2Xm1OUuome+w0s5Rkaovlm+tD3EFA
         qXGiV3jiIPQY9naRop8ZVRsdu8bt3hgmD6JRjpHeJn69ysZV67MzEZUaVJ8M4pRGHxco
         OONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739878502; x=1740483302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afaSq1n/9Zx2C/a6yp1UZpzU8FTiNXOckROl9W+xe1U=;
        b=EXMrxHJG9mzbtD2rT9b9Yu4jI3Matuv5/nFFJZqafO9BCEUEiB5MimoR8UjYsVR3FT
         zgilfKuFPRMAtVn5F3UlXYB4xORsS5K5zzkfR6K6h7nJR3/+9v9G0peuWjJ39/k2puMR
         Nx/klWuyX0PKG62gwN/HSV8vfa3ZaKrAoqmsRDqOk/Hf9mpxZ9tmN9UT2t2xwvHc3Y/X
         Wee1CE5fcZJ+O59nbmnwwndAEN6kxMPJsknE9uLw2TALHXurWHexUoao5jN6RQz/wE15
         Yz786qHlNHKlsd48Oaaa1rptiXQ7QE8TIErB/cogfUihQSs1yZ6hS0C5/XwrbWA19n9+
         iLhA==
X-Forwarded-Encrypted: i=1; AJvYcCWddHSYMYYcVnFYvy4pDzd9EDpkRRs+2VtC2VckTIuppmyY88TENgqMTVvDDvXmUW4kM4IJ/b8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpoTLGKPcUZJ+WIO1KCZU3gzEaGsLKcl3U8QA/H/oVl3RRx//N
	6/91aSayY/4oVEPpW0GIWdELm76dEKpSodYRwwiX1j1vr0gXsN8X
X-Gm-Gg: ASbGncsVS6Io1/9eWfcdGmEedmKKncAy8DUNSfamNz/k061I4D7kEA9e4HtYuoBvoHf
	ofTAZXapOSZnfcC9NmtfYMpqcaOPHtItLVqN8zXmXhJNpm/6jcr+l5pBT+mwuRCX3u4b4g0SPsc
	QKc6DJQu9QEHyzGnbYrek60HH8N4v/USTfm8N6H1MD/gvDegJokEZS8YsLCsUhjbWh8WrwvRtGd
	57q3h2S8H5SLHQeT0ETmhMpZSZoIPLl9ARfaPpmSNkvMig9QGxK3WHitM10bttrVUM=
X-Google-Smtp-Source: AGHT+IFe6C/gSNnzxL8kV6UCXZr3P6tf9lX30/uxdZgxSpgJktrmUiTn4Zw2m+FrVeltIJ8PDsdvvQ==
X-Received: by 2002:a05:622a:1803:b0:471:9cba:ad2c with SMTP id d75a77b69052e-471dbcc2e05mr196823821cf.11.1739878502351;
        Tue, 18 Feb 2025 03:35:02 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471f2b0476dsm19857671cf.28.2025.02.18.03.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:35:01 -0800 (PST)
Date: Tue, 18 Feb 2025 19:34:47 +0800
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
Message-ID: <thc5oknaqaw54wghyxpx6nr4kbykxvpgkgvpqsnsp2osjlxgwv@dekgtkxoywrm>
References: <20250216123953.1252523-4-inochiama@gmail.com>
 <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
 <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
 <24eecc48-9061-4575-9e3b-6ef35226407a@lunn.ch>
 <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>
 <rsysy3p5ium5umzz34rtinppcu2b36klgjdtq5j4lm3mylbqbz@z44yeje5wgat>
 <Z7PEeGmNvlYD33rZ@shell.armlinux.org.uk>
 <6obom7jyciq2kqw5iuqlugbzbsebgd7ymnq2crlm565ybbz7de@n7o3tcqn5idi>
 <Z7Rjjo5nZ0gnCbzq@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7Rjjo5nZ0gnCbzq@shell.armlinux.org.uk>

On Tue, Feb 18, 2025 at 10:40:14AM +0000, Russell King (Oracle) wrote:
> On Tue, Feb 18, 2025 at 09:01:59AM +0800, Inochi Amaoto wrote:
> > On Mon, Feb 17, 2025 at 11:21:28PM +0000, Russell King (Oracle) wrote:
> > > On Tue, Feb 18, 2025 at 06:50:24AM +0800, Inochi Amaoto wrote:
> > > > On Mon, Feb 17, 2025 at 02:10:50PM +0000, Russell King (Oracle) wrote:
> > > > > On Mon, Feb 17, 2025 at 02:25:33PM +0100, Andrew Lunn wrote:
> > > > > > > I am not sure all whether devices has this clock, but it appears in
> > > > > > > the databook. So I think it is possible to move this in the core so
> > > > > > > any platform with these clock can reuse it.
> > > > > > 
> > > > > > Great
> > > > > > 
> > > > > > The next problem will be, has everybody called it the same thing in
> > > > > > DT. Since there has been a lot of cut/paste, maybe they have, by
> > > > > > accident.
> > > > > 
> > > > > Tegra186: "tx"
> > > > > imx: "tx"
> > > > > intel: "tx_clk"
> > > > > rk: "clk_mac_speed"
> > > > > s32: "tx"
> > > > > starfive: "tx"
> > > > > sti: "sti-ethclk"
> > > > > 
> > > > 
> > > > The dwc-qos-eth also use clock name "tx", but set the clock with
> > > > extra calibration logic.
> > > 
> > > Yep, that's what I meant by "Tegra186" above.
> > > 
> > > > > so 50% have settled on "tx" and the rest are doing their own thing, and
> > > > > that horse has already bolted.
> > > > > 
> > > > 
> > > > The "rx" clock in s32 also uses the same logic. I think the core also
> > > > needs to take it, as this rx clock is also mentioned in the databook.
> > > 
> > > The "rx" clock on s32 seems to only be set to 125MHz, and the driver
> > > seems to be limited to RGMII.
> > > 
> > > This seems weird as the receive clock is supposed to be supplied by the
> > > PHY, and is recovered from the media (and thus will be 2.5, 25 or
> > > 125MHz as determined by the PHY.) So, I'm not sure that the s32 "rx"
> > > clock is really the clk_rx_i clock supplied to the DWMAC core.
> > > 
> > > Certainly on stm32mp151, it states that ETH_RX_CLK in RGMII mode will
> > > be 2.5, 25 or 125MHz provided by the PHY, and the clock tree indicates
> > > that ETH_RX_CLK in RGMII mode will be routed directly to the clk_rx_i
> > > input on the DWMAC(4) core.
> > > 
> > 
> > RGMII is not the problem. The databook says the RGMII clock (rx/tx)
> > follows this set rate logic. 
> 
> Sorry, I find this ambiguous. "This" doesn't tell me whether you are
> referring to either what s32 does (setting the "rx" clock to 125MHz
> only) or what RGMII spec says about RX_CLK (which is that it comes from
> the PHY and is 2.5/25/125MHz) which stm32mp151 agrees with and feeds
> the PHY's RX_CLK to the clk_rx_i inputs on the DWMAC in RGMII, GMII
> and MII modes.
> 

What I said follows the second, the clock is set at 2.5/25/125MHz
with speed at 10/100/1000Mbps. The only thing I can refer to is the
ip databook.

> clk_rx_i comes through a bunch of muxes on stm32mp151. When the clock
> tree is configured for RMII mode, the rate on clk_rx_i depends on the
> MAC speed (10/100Mbps).
> 

OK, I have no problem and find some descriptions related to this in
the databook.

> This suggests as far as the core is concerned, the clock supplied as
> clk_rx_i isn't a fixed rate clock but depends on the speed just like
> the transmit clock.
> 

This is what I want to say. clk_rx_i is not fixed but the
s32 uses it as a fixed one (This is the thing I felt weird).

In fact, Non-fixed clk_rx_i is why I suggested adding the rx
clock to the core at first. Since the drive may not use rx
clock as the databook says, it is good to leave it alone.

At last, it seems like that I need to improve my statement.
I am sorry for it.

> > For other things, I agree with you. A fixed "rx" clock does reach the
> > limit of what I know. And the databook told nothing about it. As we
> > can not determine the rx clock of s32 and it may be set for the phy,
> > it will be better to not move it into the core.
> 
> I'm intending to leave s32's rx clock alone for this reason as it does
> not match what I expect. Maybe on s32 there is a bunch of dividers
> which are selected by the mac_speed_o signals from the core to divide
> the 125MHz clock down to 25 or 2.5MHz for 100 and 10Mbps respectively.
> As I don't know, it's safer that I leave it alone as that means the
> "rx" clock used there is not clk_rx_i.
> 

Thanks for your explanation. This is OK for me.

Regards,
Inochi
