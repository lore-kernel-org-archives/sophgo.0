Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C002DF122
	for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 11:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760959551; cv=none; b=Uc47C5Hak+4irQ+N/zjVQu50U3azyklrE/CbwqZ9T9EmBSXpTbbZlEckhUuoqzK70WeHFxHHt3wlJd8T6rA+SrVQBOibpIJBZTLeYSPiXUs4yACLL0QlKdZcBvbRRsHMQyS/axLaUvjhsBENBovfs5XN1E+HWp6S4MlxVLnKuS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760959551; c=relaxed/simple;
	bh=+QexM2APqEkUlpP6ZQAEMO79ItQrth66FIvsgz4+9CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/h2HUceAdPkwzXduuDN2sqXQYhug49e10DH1oLOzEkCVLX/4HY2jkKAJL0LNKKHut26B4zYLqtmXKbBg4Nem9Vs6/AIXaDReV9qOPL2yychcFmuIsK3rBCYazzOTLqLGy21rKawLvLaFjqBVtRDIxcZPYarlGXA7qzRKiDJV4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLhXPbOp; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLhXPbOp"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b67ae7e76abso3068126a12.3
        for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 04:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760959549; x=1761564349; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oz+Xl2/NrMdS6fZi0EK9OqxzCdzOSL6WeQJpOQkz1Yo=;
        b=GLhXPbOpnEWaMgGS+zWHNvtf/Qrwm8/JjB2bVGiSLunYhki1OQJITR56R/2ZedXZfS
         FEHlzy3NOMuT7+9CzBc4aoilHghSysHZMgcwagNqlWWsuroGAVXAOvBZGAgLY0D4f4Wz
         YfZp1SzDJPuU8wUUTOsfF3Tw5tbrOeuKkBnSsa1KyFeujqRe+ZO6fSMFApTxlhCn4ueq
         2pjyKRLXfJoy8DDjfIJYkv7GJrszg+c9rxZOYVdcRsjcuUYtDh9jFlm+rtrBG5+oW14e
         xcTLLq4AUYy9Yd/ShSdOusLYAVxfVMJsKTlMD1UEXWfYCRYLhQsmCT3L7fU3NNDqPNXX
         6cuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760959549; x=1761564349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oz+Xl2/NrMdS6fZi0EK9OqxzCdzOSL6WeQJpOQkz1Yo=;
        b=RLAzQUhxlHfPRpTPpRhXZwVAaj6VNynQ6OEX4lOCVxF9rjaI6moxv4Th2GAuoNqRRT
         iELs5YixwjCGaLsynvBOVdSJn34ViXuOiEKVLRoSUyLOQ3Co3s49jaFkHToIs++bUwtu
         aTSPK8u/z2TGHKYsa3sxU8vrO5fv5lFgIe9+dxIidqAOqPZb4sOskwGdfnUF6XCTERMg
         T5cHE4iLMgVIS+4RUTZa4aKCWGIMfdJc1MYPnXm3VjBSQQ3QWTvkzoU1hepBdMYirUC2
         fOm7mfUBkW3BcLeHxX3NRG/E8P1yYGT5s3GZ/xj1lnRgLY+jU5KugvWmSuvabMz5E2oj
         48aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLYu/Q+sJmRtQGymSNj/bNv6Lh0yWRMSybHQbGiRMa/HYObWR4LV+5jtMhCryFDnubcKew21c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3ttPHV5FRd4uVY705upGGS2bUh7wrzbMtjUp0x0g0RANYrtu7
	SXHNQN4r8Rc8rSPBbZ3igErix9wT15C69bsUr15ep7y5U0RasV7oX3U+
X-Gm-Gg: ASbGncv/AvPI0SzJoCjlbBc0doVX0TIy4bgeY1AU0BIYw3Xd5cUThpPhTXnfv410djr
	Yx1M4bMnYC+Uhy7zC98UW7YBQqIE5ObhXQaJwbJ6rCdfwMeqMz5BXzurIJVcGEU0B0IG654TNpN
	cnpL0+TkzAdCh57Eg1aKMDmiXt2CsIz+POR+GfmiB5Y8oQD3sudNbn8pRQNWyvpkn4pwMypBQ5n
	fud5nVy1rZLDLYhaioJ57COWER1EKgcnVIgIZexdBpRkI5VM8MCq58KrY4Spzih+caH2G4X3zmq
	ikL7ZSSdxCCPaA0pHMmFYkCLZN23a2OGhsrUFreoXd7L7jkTLD2kFLT+KiUwpMaL0CqwzvrOk6j
	yOWRBdKdQhyVsJOABpWmxJYUmqaYIRwIPPGArq3fw2L5tGDxZ0yMeGXnh1rppANKzZiWAGGX2C5
	dkomCnEvvA5w==
X-Google-Smtp-Source: AGHT+IGmXkq5K8nuswuZOy/Q3vJ1q/fs2FggRu+CXIAg0ikFpAfPL8SJOtCn/E3IpbjQlSwX+Wyw8w==
X-Received: by 2002:a17:903:b90:b0:290:bd15:24a8 with SMTP id d9443c01a7336-290c9c89fa6mr155748285ad.11.1760959549499;
        Mon, 20 Oct 2025 04:25:49 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d598asm77433485ad.63.2025.10.20.04.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:25:48 -0700 (PDT)
Date: Mon, 20 Oct 2025 19:24:55 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 3/3] net: stmmac: dwmac-sophgo: Add phy interface
 filter
Message-ID: <ljyivijlhvrendlslvpo4b7rycclt5pheipegx3fwz3fksn4cn@fgpzyhr2j4gi>
References: <20251020095500.1330057-1-inochiama@gmail.com>
 <20251020095500.1330057-4-inochiama@gmail.com>
 <20251020110219-GYH1506524@gentoo.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020110219-GYH1506524@gentoo.org>

On Mon, Oct 20, 2025 at 07:02:19PM +0800, Yixun Lan wrote:
> Hi Inochi,
> 
> On 17:54 Mon 20 Oct     , Inochi Amaoto wrote:
> > As the SG2042 has an internal rx delay, the delay should be remove
> missed my comment in v1?
> 

My fault, I forgot to fix here

> > when init the mac, otherwise the phy will be misconfigurated.
> > 
> > Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >  .../net/ethernet/stmicro/stmmac/dwmac-sophgo.c  | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > index 3b7947a7a7ba..960357d6e282 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > @@ -7,11 +7,16 @@
> > 
> >  #include <linux/clk.h>
> >  #include <linux/module.h>
> > +#include <linux/property.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/platform_device.h>
> > 
> >  #include "stmmac_platform.h"
> > 
> > +struct sophgo_dwmac_data {
> > +	bool has_internal_rx_delay;
> > +};
> > +
> >  static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
> >  				    struct plat_stmmacenet_data *plat_dat,
> >  				    struct stmmac_resources *stmmac_res)
> > @@ -32,6 +37,7 @@ static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
> >  static int sophgo_dwmac_probe(struct platform_device *pdev)
> >  {
> >  	struct plat_stmmacenet_data *plat_dat;
> > +	const struct sophgo_dwmac_data *data;
> >  	struct stmmac_resources stmmac_res;
> >  	struct device *dev = &pdev->dev;
> >  	int ret;
> > @@ -50,11 +56,20 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> > 
> > +	data = device_get_match_data(&pdev->dev);
> > +	if (data && data->has_internal_rx_delay)
> > +		plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
> > +									  false, true);
> > +
> >  	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
> >  }
> > 
> > +static struct sophgo_dwmac_data sg2042_dwmac_data = {
> static const?

Right.

> > +	.has_internal_rx_delay = true,
> > +};
> > +
> >  static const struct of_device_id sophgo_dwmac_match[] = {
> > -	{ .compatible = "sophgo,sg2042-dwmac" },
> > +	{ .compatible = "sophgo,sg2042-dwmac", .data = &sg2042_dwmac_data },
> >  	{ .compatible = "sophgo,sg2044-dwmac" },
> >  	{ /* sentinel */ }
> >  };
> > --
> > 2.51.1.dirty
> > 
> 
> -- 
> Yixun Lan (dlan)

Regards,
Inochi
