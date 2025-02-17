Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2F2189B8D
	for <sophgo@lists.linux.dev>; Mon, 17 Feb 2025 22:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739832638; cv=none; b=q6/c4cEG2PGzl8c0joZ9UuHQBA6OXWbGTGApPH9pm+XaLoOylYrr5h/bZe+WdSDbBe+OuMXUp6jK8o992RMyB0oJ1KBoeNBT2QxQEcXbhAvLEHiQrWoF4aDPR8xeOgrykoR6/pdDjF4ZhX61t1oZLgF4bTbkIgI4kZJJWFNFv1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739832638; c=relaxed/simple;
	bh=/6SGeRltRm31xAdkNm0gzzyt7aeAn431Szrtm/7AyJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/wuiKj4ZWWN27dTJ0dKkzHdLRmO3pOjGuIOnd+nc376fSdxy7itad+HzVjYQcmFg99SHMoPRyxNFI1KfhUa2DBu+pm0Et0BqsXs4hqzfPWUeKdQhaQVQl7LuKkRDDp9d3ryZHUXYuBn3r2X1RzJUAh6xJVLIgCCXg/I58R9pzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nva16N9d; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nva16N9d"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c07cd527e4so310165285a.3
        for <sophgo@lists.linux.dev>; Mon, 17 Feb 2025 14:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739832636; x=1740437436; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GuRB9Jwf6lkVtrT6vIlRJUWZnFJbbxQGyG8tssiDsGY=;
        b=Nva16N9dxQoAE/nas3CGaoRxIQWR46908LHxcu9jvhjYi2/EErpWhmcG8iOs6iIBLi
         eiV3s+cUgrCMg7QX8mbEBbzpjb119sh59cXNsdGLB4x+atRiOPAmeL1klfvs/a58uPO+
         TB+Bcz0F7B7CKOEFjrrm4E2FqytkxXRPIcBexX+JIkqtt88zbtLKoF2X4OiQUTxglIbP
         uBQ26Ue3SrFIu+S4zG9ZWB9+NjtYhGf06O16d49efxOM7oou7/010TXboria3n05zQx5
         WATf2/dlprMpSp5d7GbhTlrhvB7Qb/CPSjoU0Dmj0uASQZMD2NcZG6gdC2ebcksWvWJm
         9GOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739832636; x=1740437436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuRB9Jwf6lkVtrT6vIlRJUWZnFJbbxQGyG8tssiDsGY=;
        b=fZpI8jVRXHoESt0FETLv1xSZ+ClyCjQtL9ul40Brz9ePLr6smXtNJjV8PTLBwvC0Jq
         72adtEuCnU3ZJIRbIrNKnSeh4Dkp3dMJvns1UcBXnW7zcI2Wwvg1QjOnShMx/c0NJXie
         dMiZPM/oCAKkBxHS3Wkav9J7Hy83+eYvXVv13fx4h8Hb2je9bXKOuB3WuN4NQhEVVjtj
         WNIDNzF84czUYX6lPFmcJFE7pASxtvy8o+8SVrVDoOnqNcggMNQJ9n60+FJqdkmN4wc0
         p5icE7NoTXuLO+aTCdIXCIl+KqE0XX9YiQsnjItTyU55dLr6+/HACvb8VJ5Lc/kBsWDA
         hZDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0JVVtED+1+bstWzttrI0r4/ob491Gxi8J5kz9/kgOPLr9AENgLwYvjSz9kMSBJQtoWRfHLrU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8WwaW+fIJHwK0IseIh2TQrYazDMRXSTYdASg/cVx2nJNqydpK
	Vk1tr9TQCr7WibMiy6lo7bBUR2P+1mjhmy3SD/lQn26j4oIoUOuH
X-Gm-Gg: ASbGnctSj3973iGdJdzfkjxQpmW0doI9hNx3Gqj5XHcbHcEORZoXVXbubumRpysFiy9
	AGHVVEtjhrwZDjSH6N7I58F4IpJh9n5IrVT/VWOvRw4/xrN958jM7QYUjLscdPv/pFHMAicb+B6
	zqI5dvqKTrSGQnwTzsurymMSHqK50nKuEosCM+yBkadg3FiIzYDHqCzo9JAo/k6JaYLERovXC1t
	R3DxWUE15Qw7d4AoF7RCBo/GvMsaCnYNQT8+s4RDYeaa7eI1AO/ByVbgTyrHIvriZg=
X-Google-Smtp-Source: AGHT+IE77k8p+mAi1BZHXw2Af6ibqX9QoECI2nv0Dz4rUPqmmgRmUNBBDIKtrBxkEobOVjl1YJiisg==
X-Received: by 2002:a05:620a:44c7:b0:7b6:d97a:2608 with SMTP id af79cd13be357-7c08a9a6481mr1561011085a.17.1739832636093;
        Mon, 17 Feb 2025 14:50:36 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c0971334f0sm208792885a.56.2025.02.17.14.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 14:50:35 -0800 (PST)
Date: Tue, 18 Feb 2025 06:50:24 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <rsysy3p5ium5umzz34rtinppcu2b36klgjdtq5j4lm3mylbqbz@z44yeje5wgat>
References: <20250216123953.1252523-1-inochiama@gmail.com>
 <20250216123953.1252523-4-inochiama@gmail.com>
 <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
 <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
 <24eecc48-9061-4575-9e3b-6ef35226407a@lunn.ch>
 <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>

On Mon, Feb 17, 2025 at 02:10:50PM +0000, Russell King (Oracle) wrote:
> On Mon, Feb 17, 2025 at 02:25:33PM +0100, Andrew Lunn wrote:
> > > I am not sure all whether devices has this clock, but it appears in
> > > the databook. So I think it is possible to move this in the core so
> > > any platform with these clock can reuse it.
> > 
> > Great
> > 
> > The next problem will be, has everybody called it the same thing in
> > DT. Since there has been a lot of cut/paste, maybe they have, by
> > accident.
> 
> Tegra186: "tx"
> imx: "tx"
> intel: "tx_clk"
> rk: "clk_mac_speed"
> s32: "tx"
> starfive: "tx"
> sti: "sti-ethclk"
> 

The dwc-qos-eth also use clock name "tx", but set the clock with
extra calibration logic.

> so 50% have settled on "tx" and the rest are doing their own thing, and
> that horse has already bolted.
> 

The "rx" clock in s32 also uses the same logic. I think the core also
needs to take it, as this rx clock is also mentioned in the databook.

> I have some ideas on sorting this out, and I'm working on some patches
> today.

Great, Could you cc me when you submit them? So I can take it and
change my series.

Regards,
Inochi
