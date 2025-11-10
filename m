Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A67301025
	for <sophgo@lists.linux.dev>; Mon, 10 Nov 2025 22:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762813619; cv=none; b=kTCFi5/tIM12uTLdPbg5oSJtpBVo9PvAcmQ+3qyvnULur/R5MmRurmp7nXwDvEyzSqDJmesaui5oitdFP0v0f+CPujbsfiQuH1dymCQBkkGbGPrlFlDiy48JjhLAVxy/ktrEyrUcV9QLM2qis7naLZ6EBVFoIQCYW5P7KA8YIT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762813619; c=relaxed/simple;
	bh=ga02Licy+YKpNgCmYN1YVytkG6Mk2o7Q83NArawwZFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOh8Hxi4fsxOoat0zexcwOJDl9IutJpQCMrVNftUy/3In+bwvgJOlWeWmqpMplErSowkFWu8c7drzB9zvQZn2q906LzfVdNrKHZL/IwYnQSE3Rf1pFJ0ayjCEAIr1RjCYGFM3RCV7f/h1WoCYK5yPigohnFSfop92NxT6hAtebU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjgkxYtW; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjgkxYtW"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7833765433cso4014533b3a.0
        for <sophgo@lists.linux.dev>; Mon, 10 Nov 2025 14:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762813616; x=1763418416; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xLyXGRaLm6sEsE+EXjhF05M8r/IYZLjTnBThGk29/Q8=;
        b=TjgkxYtWx1AjvJ4VnQ+TdWEeQBkCDyUsD76L7C98UZYhu4VOAkBBjpFXwVsI7p8hk4
         5shX6wOjPJstmeVLQKeA8VLrZsvurLOQqldI8dkmYpYa1OL5DFEgn2dOJaUXQEVT0m64
         BdJneSeLtaGoz90ssrtwFMtKBRi44v0kvTLciMo+Sm9cTvoSxlZDkGpPP/h75gmG5LcZ
         AUM8IK+TuA2VBRu4+9tkx/GvQ/37wDEAmSP0vvkniVk5rFKdfjMZWzaywr4TgYukzefd
         qt5Sbf8mWL9c0ml2aPgLgAaRTCLxn0dBtOe4QKvttpgdVCGWrm8ffCTAKjj7wdapKhga
         QI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762813616; x=1763418416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLyXGRaLm6sEsE+EXjhF05M8r/IYZLjTnBThGk29/Q8=;
        b=pSwfyXK2EioFHzx4zXlfhfvszH4DEL0Q0zknx7/U8/mK1l4Fwz7gobShzovEijeKNA
         /impbatZZv/53Egsl8SAkIEyv364QzgZ5xcVg08OPLphWXhpfYjfXlpSJNnMOYRw+y28
         1p78hkwUxsA903xSqXO7ao5HQHBcv87FF+C8z7TQQYH72i52duUIj8nV5LP0ougy3cp5
         aA8FhVLdF6bGRbp9w0xbL2ARWxkdCM1WL8UhOafi1+HeZi4isHWl20ztXFoj/JRZOMPu
         02ld5TwJ0jLpoN5H3DG3OEP5hGombm5CHwoIe/z/qrN4+MrwukKuyWCNOP6NZjDlakqh
         199g==
X-Forwarded-Encrypted: i=1; AJvYcCV6MD8C7hviDWdAq51/EUdgAGD7lJTOdYGHIP4D743Rr/TBbaJcMwTeos8q5wEmlvU7e8D2hrc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjiC7gUl/3oYQ2gVLW7gaI6Lm3Z1aMz7iWElpdChH1muYosj+T
	1Zxx+3IPJX37KQOX9N4AJYLpzOOHH+MYJ/eAMdBapyPf+PVB+mTtj59e
X-Gm-Gg: ASbGncsqK8x7Mege1oYQxFKOI5Xqyorl0N3u3CB8HnfE0fHhyRsh+oDOLUF57Q7xt16
	/v2Oos4ROKLl1IY9mjFoGGHaj2VvG5eLFl+I9zcRgX8St+SGBN/cm6zSe3oLQa/4I/nnprYLTcA
	2l1pHD5UJ4iRg7RYvxF/p50pE9vuXYxM/ucLNB/YM7dnxfcL+2e5Liw5xOk1Q/QQPIedMz5cB/e
	7rPVMpAeSbOUPcOdW/43QLlbc0MmawxeaABpHAx634kwsBo92mias274z0zOr6SQVaQYnv3ifUU
	IejPSKsutaRq0QIqD7e6hxsW4Y5A0lOZv5IG2W1V/7oIAyMobhZajRyEaoEsfYH5lISQVXMaGo5
	9b0WXBVnWHfqCXXvpRvEIsNexN7PDCf6fgd28HOG5Ne7HQA8O/2B15hUBexrh5Znha3PShr0A0+
	YWCLYO4gDwSw==
X-Google-Smtp-Source: AGHT+IEk3kYn28lJz/C+AXXcRWMVZ9b5FI05N3tJpVXS4fy3dE0avtehbQZNj/cOBXS8KtnzWEvWzw==
X-Received: by 2002:a05:6a20:e605:b0:357:be83:d026 with SMTP id adf61e73a8af0-357be83d02fmr681099637.35.1762813616432;
        Mon, 10 Nov 2025 14:26:56 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f8c880c5sm13710401a12.6.2025.11.10.14.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 14:26:56 -0800 (PST)
Date: Tue, 11 Nov 2025 06:26:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Simon Horman <horms@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v7 3/3] net: stmmac: dwmac-sophgo: Add phy interface
 filter
Message-ID: <g2tqvcw7ocewzbqy7txz6sumdxeelhl4jk2s3btnnijyt572di@nrfcac6grpvn>
References: <20251107111715.3196746-1-inochiama@gmail.com>
 <20251107111715.3196746-4-inochiama@gmail.com>
 <aRJGZjgTgcjZgIqe@horms.kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRJGZjgTgcjZgIqe@horms.kernel.org>

On Mon, Nov 10, 2025 at 08:09:10PM +0000, Simon Horman wrote:
> On Fri, Nov 07, 2025 at 07:17:15PM +0800, Inochi Amaoto wrote:
> > As the SG2042 has an internal rx delay, the delay should be removed
> > when initializing the mac, otherwise the phy will be misconfigurated.
> > 
> > Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: Han Gao <rabenda.cn@gmail.com>
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > ---
> >  .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++++++++++++-
> >  1 file changed, 19 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> 
> ...
> 
> > @@ -50,11 +56,23 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> >  
> > +	data = device_get_match_data(&pdev->dev);
> > +	if (data && data->has_internal_rx_delay) {
> > +		plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
> > +									  false, true);
> > +		if (plat_dat->phy_interface == PHY_INTERFACE_MODE_NA)
> > +			return -EINVAL;
> 
> I'm sorry if this is a false positive. Because, more so than Russell [1], I
> confused about how about the treatment of phy_interface. But it seems that
> there is a miss match between the use of phy_fix_phy_mode_for_mac_delays()
> above and the binding.
> 
> The call to phy_fix_phy_mode_for_mac_delays() above will return
> PHY_INTERFACE_MODE_NA unless phy_interface is PHY_INTERFACE_MODE_RGMII_ID
> or PHY_INTERFACE_MODE_RGMII_RXID.
> 
>   phy_interface_t phy_fix_phy_mode_for_mac_delays(phy_interface_t interface,
> 						bool mac_txid, bool mac_rxid)
>   ...
> 	if (mac_rxid) {
> 		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
> 			return PHY_INTERFACE_MODE_RGMII_TXID;
> 		if (interface == PHY_INTERFACE_MODE_RGMII_RXID)
> 			return PHY_INTERFACE_MODE_RGMII;
> 		return PHY_INTERFACE_MODE_NA;
> 	}
>   ...
> 
> Looking at phy_modes(), unsurprisingly, the following mappings occur:
> * "rgmii" -> PHY_INTERFACE_MODE_RGMII
> * "rgmii-id" -> PHY_INTERFACE_MODE_RGMII_ID
> * "rgmii-rxid" -> PHY_INTERFACE_MODE_RGMII_RXID
> * "rgmii-txid" -> PHY_INTERFACE_MODE_RGMII_TXID
> 
> And in the binding, patch 1/3 of this series, only phy-mode rgmii-txid or
> rgmii-id is allowed.
> 

rgmii-txid is a mistake and should be rgmii-rxid. This is because
the mac of SG2042 add rx delay, and the phy can only add tx delay or
no delay. So the phy-mode can only be rgmii-id or rgmii-rxid. I will
fix it in the next version.

> But if rgmii-txid is used, PHY_INTERFACE_MODE_RGMII_TXID will be passed to
> phy_fix_phy_mode_for_mac_delays(), which will return PHY_INTERFACE_MODE_NA.
> 
> Again, I'm confused about the mapping in phy_fix_phy_mode_for_mac_delays().
> But there does seem to be some inconsistency between the binding and
> the driver implementation here.
> 

I think this inconsistency begin with the change for ethernet-controller
binding.
https://lore.kernel.org/all/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/

And this function serves as an helper so the driver can only add
the delay once.

> Flagged by Claude Code with https://github.com/masoncl/review-prompts/ 
> 
> [1] https://lore.kernel.org/all/aPSubO4tJjN_ns-t@shell.armlinux.org.uk/
> 
> ...

Regards,
Inochi
