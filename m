Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7221632DD
	for <sophgo@lists.linux.dev>; Sat, 18 Oct 2025 00:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760748281; cv=none; b=GGQEhK9BnGwDAxikXO6IfcR1kTz83vDHMTuZArrsXinthygm+66LjT9M3+AjowNOoflgVcr6KogU2QThZiwSJvllCX4tyLSFNclAWoQ4+G/D1Hji5PtJMuB/fH+sgKEdTUKJMLgXnYHp5VqrvUksOEl4pxV9C7zkotuo7182bNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760748281; c=relaxed/simple;
	bh=sHF2/XPZw6H0+JGNQbRl7shSpw7MIUsqz9Xi23Hix74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmulLrYOoSe5h10+1P9gFdg9y9jEaxLOFmwlPy065pIRG9gsQYK5e+sAeu0amls3I1p10HsJGXgMhDXLewmw+7VYnbEZdbXnwHAFjgg6DtB9x63nAFzhMXj8nn/LSDM6up6EBPEBd1xV9rLQgmHMLFu81muXWnlw73G12MbcKA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YECEXnnq; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YECEXnnq"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-269af38418aso27138955ad.1
        for <sophgo@lists.linux.dev>; Fri, 17 Oct 2025 17:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760748279; x=1761353079; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3QafKpBA9ev9tZ8RtBiTe7ilN8YrDWJs4uzq+MACIIs=;
        b=YECEXnnqiGWPIjv7SMO6gJX+fPe1QFgYFWv//XWRgkb/qNvmrs06bg0EYOlaAcIMrb
         lHFei0bf+KZTN1lR5WXhRj0jPyYENiFUoF4W3rTaBeKbPqIB5nx6r7VkJOB0RHe3b+uU
         cJP6u3kF3Ten2/Mi7mywvGgMgB1NL/7XRfTWx22ayPZlaG7DYbVJrNxS3aYNiy4fkN5b
         +wKxb/uKD/G4B8EaFXmtJ03rAznoflRwDtpJ2ziMJZG7VnBuYiA6xwnFq0kT4LWIQtwE
         i6z9j8xFtjCe8nwes/iKKluIC4yWXt8eRWhoLTgO/PJBPA2Qb9iPnTqOkzHsdCIbV82t
         cMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760748279; x=1761353079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QafKpBA9ev9tZ8RtBiTe7ilN8YrDWJs4uzq+MACIIs=;
        b=IIVsH9iyV85E2ClIXKeFAzTRiXcokIvt86LGE/Er1Fzn/GM5gKJzqT9r14ZHT+JSUw
         F6ZTWhA7T+LawPzK0m5VHBFbEpsPNqFQh848lTuTknKx1QXriLgKngv+opci4RXPjXqT
         5Q0jBc2mLMaDzp1cxYnyiusQP7zXbtzbLIijBPwITGxFHFStPCoyB2OXGN1CYUKFhWQh
         OTe/dThRxSzSslkpnGZCCNfucNJ1EP6dAAFwm9yHZOjwKZjvxvPlvC9rAouKz9Faui+Z
         8pjkT8nj705iEzwh1uovrBMZPYQZmXXVDMDKdPBzUd+pr2nPyDLgqnc/Vfdp0UHy8KAA
         /QZw==
X-Forwarded-Encrypted: i=1; AJvYcCWwA9QHcUEJANhhptkCZ0a+F5MugN/wZt68uAGbfDULXIQ9XzHk2dScBrVuNYw3SyQIE5Am9s4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGHm8v9Wu98eK7dou9EwkeNdqcqz/dTfdMPAXxUYhpFUu563Gt
	R8nCZiMG1Qf7Yw2AWP5P+0M/m3/06XkkWYdUD6JlS1rxcDgqSPnKfpkS
X-Gm-Gg: ASbGncv7F8axJYpQSy81TQ4EnOe1ScDcMA/jzgIk4E8ZtFAG3b6sKk+WzdKuJuSVouy
	NiMydYH2D0IVcVvPyY/cg+y6gYA4no/UyTjogAEtmQNzzWkZS9dpEXLztSWhbrY+IVQitLc5+CP
	sRPaM/2BX7lK0HLylY09WVYOQK9v6ULj0g7okIJDLxod+DWXSA8bdLL/zkUBzoEvKwX6a9lO2Fg
	+no76VefMZTMcL70XWh0k2t8wk57IJqe0kJ76peJ6DozMXeQlNPV2sAT2XBEtahPBnQjvAnYdYb
	P0CHDq0DGH8RQ/oVK5Tx9mnQ+392H51aBrQl5MuQdPioqy+vrEny3JxiPPe1doMdQLivaGl69Wz
	PymMXzGMhsQUFSf0msEBD2YV5hIflqBpRLAUOY8qr4Q7zF5kpzd6JEkVWDNLxEXktxPNfOw/qhi
	c=
X-Google-Smtp-Source: AGHT+IEJHzKpBZuNZNa18WS/ADFtdVavA7SE/dNX1ygVUM8SyYneHAxGCurSyYxg3cW6a8KtgONCXg==
X-Received: by 2002:a17:902:ea01:b0:267:d2f9:2327 with SMTP id d9443c01a7336-290c9cf2d88mr81827755ad.27.1760748278692;
        Fri, 17 Oct 2025 17:44:38 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2924721b6fdsm7874395ad.118.2025.10.17.17.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 17:44:38 -0700 (PDT)
Date: Sat, 18 Oct 2025 08:43:47 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, netdev@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] net: stmmac: dwmac-sophgo: Add phy interface filter
Message-ID: <hmch7csqotxt42snddksce2mpnjeglbgvoxs6r5qlu7v2ayxyk@zctj7xhugeln>
References: <20251017011802.523140-1-inochiama@gmail.com>
 <20251018000548-GYA1481334@gentoo.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018000548-GYA1481334@gentoo.org>

On Sat, Oct 18, 2025 at 08:05:48AM +0800, Yixun Lan wrote:
> Hi Inochi,
> 
> On 09:18 Fri 17 Oct     , Inochi Amaoto wrote:
> > As the SG2042 has an internal rx delay, the delay should be remove
>                                                      s/remove/removed/
> > when init the mac, otherwise the phy will be misconfigurated.
> s/init/initialize/
> > 
> > Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >  .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 25 ++++++++++++++++++-
> >  1 file changed, 24 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > index 3b7947a7a7ba..b2dee1399eb0 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > @@ -7,6 +7,7 @@
> > 
> >  #include <linux/clk.h>
> >  #include <linux/module.h>
> > +#include <linux/property.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/platform_device.h>
> > 
> > @@ -29,8 +30,23 @@ static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
> >  	return 0;
> >  }
> > 
> > +static int sophgo_sg2042_set_mode(struct plat_stmmacenet_data *plat_dat)
> > +{
> > +	switch (plat_dat->phy_interface) {
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_TXID;
> > +		return 0;
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
> > +		return 0;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> >  static int sophgo_dwmac_probe(struct platform_device *pdev)
> >  {
> > +	int (*plat_set_mode)(struct plat_stmmacenet_data *plat_dat);
> >  	struct plat_stmmacenet_data *plat_dat;
> >  	struct stmmac_resources stmmac_res;
> >  	struct device *dev = &pdev->dev;
> > @@ -50,11 +66,18 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> > 
> > +	plat_set_mode = device_get_match_data(&pdev->dev);
> > +	if (plat_set_mode) {
> > +		ret = plat_set_mode(plat_dat);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >  	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
> >  }
> > 

> >  static const struct of_device_id sophgo_dwmac_match[] = {
> > -	{ .compatible = "sophgo,sg2042-dwmac" },
> > +	{ .compatible = "sophgo,sg2042-dwmac", .data = sophgo_sg2042_set_mode },
> I'd personally prefer to introduce a flag for this, it would be more readable and
> maintainable, something like
> struct sophgo_dwmac_compitable_data {
> 	bool has_internal_rx_delay;
> }
> 
> then.
> 	if (data->has_internal_rx_delay)
> 		sophgo_sg2042_set_mode(..)
> 
> 
> >  	{ .compatible = "sophgo,sg2044-dwmac" },
> >  	{ /* sentinel */ }
> >  };

Yeah, I think this is a good idea, thanks.

Regards,
Inochi

