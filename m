Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A33A55
	for <sophgo@lists.linux.dev>; Thu, 30 Oct 2025 02:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761790593; cv=none; b=nc1WpMF1PMgarVtvp4ZJGgDO9narty5wdW4rpowe59BlNrO8jjOpHmAFco9MAS1+i7PbiMLyME+fBj/VPyL9fhNWe3Ar1sPmy6mTEejaFiqn3IJgwrJrEDlhoLTVJL2wqCsgYV4VF9HMhk59paHaNFeJvBRdtiJdQkl55e8uchY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761790593; c=relaxed/simple;
	bh=B3CAAoANZ8AdYUQ/vBMppNZHRyDpgu6a7ycm90jmpdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkGTvmMG6c7W6AqkoLPCrnqBLKd//1e1iy8QC++VMLn9wHh5hKlQ38E3rvJnM8Br0UmbVQg28z//AH4/diJWZSuHR8e+ZBVfVACGdGKk56510cp9S/oTUhCdJtRXY4sgTFFlodPpgJLEAxwAwmFI4rg2Vfv3rwfIREQ+0nOl1Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAxbVRk8; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAxbVRk8"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-33d463e79ddso653859a91.0
        for <sophgo@lists.linux.dev>; Wed, 29 Oct 2025 19:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761790592; x=1762395392; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=skyS+Cuyodx+9RItDMBTIU91z9/i7AQUnbc/OyIR+As=;
        b=hAxbVRk8v+hHhxnwYN2xCx0mqME8+8X/bKDad/Ou918CD4jNu9njFgSQO6tOwY1mHf
         Jz5c+KiSKhU4Szf/xzzC3ey9025Jz8WMbvJZlrL4GKfI63yl7P+twMlkluRheUD9ujDz
         TM/ategLzPcZRvlghX8/X/mRkyDMvd31cUjSVpywpPU7ZKQGOlVf1vQ2SKFK+VhV+ZwQ
         r8pZWWaTbuC0/aGLtRhdK1V79YFwgjqfRATT4Lt3wDxkB2yzvoOvUOnQg6oCRxHaUV2F
         47VvyU3e9WRK0bOgu43+rwaUcBJKAUxCyn75JH7VwzQGzX/+gNDlRB2NvcRQMZUHSKaD
         csbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761790592; x=1762395392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skyS+Cuyodx+9RItDMBTIU91z9/i7AQUnbc/OyIR+As=;
        b=aRmK0hxLOrfhZ/xUP6YxrXGJbSGcYSvaPep34CYr75DZz5TEwjd95eAqE9hie7k/u+
         f4bQkiOhbYpCRwyMBA9SHnDeUi4ezeVYQDGgHhbHenKAXZEzVh4ql3KDqZjOrh2mROCn
         BEYzMItdXqPNlCupJ0gK9r91WrqoGyt26WS2SXzK+HBdpUDATKIFTraoEu/jdL4Ow0uA
         Laa2x+2YwTSYmU4rp9EUk/l92Y9HLR8FQUaSUJxQDZZiPr8fA4CBnSXEKvnoF/TDzeRi
         CPdC3VBGuKQ/wD0ibwSqeo9Wv2JwC6vCnWBtsNILi6qs1UfXzzwLLWj3qFQ+TeTqVnZA
         uCdw==
X-Forwarded-Encrypted: i=1; AJvYcCUq9/442XrGPVMEN4HY4pMIom8MykxiF6gsygA4L+WddX6o2r8XuJnEeJr9LS4hUA5h7leAYOI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxqqyyEddKP7nPNTQbj8CJBpqS0IfCfSXIO2q7Wt/blHDQBFpwh
	TDf9Ev4QTAoeikWScD3JjD6AUN4DHY3iJqdMR3ULrjSV3L/X4oQVzJ3l
X-Gm-Gg: ASbGncsM1vf4oK1Mv0sjqleUEjU1mbPYHN0dfTYHfiC6PCwdFMfJEI0BxyHNjdSIF9v
	jgqh8BlpfUEYnYR0n5yLYm0xKKa9fyiXklmHHui+mMaCNC3Bxxg8SQu9JEn9xojRPSLqgn8Bvdi
	Is9xaDfXpz+rFgg9ChQ4+7zdNZwqAv0Q9z5lbQY+J1fSk86SdwhtduG0OmvcgKeKp6D9l6UH5jW
	qDj+DCRWilKZvhxVm3mOIuzLMpq9beUF/UOiMK0rZgoFmqYdcXJmDaKD1Ki87cpd97nZj+MGgu3
	Ns8A97BJS7qEbCwqDlusgAzDW3zJ6CWRGLPHiv2+YAhB34PNL2SbEtmuYl2mWLEhV0DSmSmm14M
	U2XvBAQ2wLnvouupIePZ7aRbYItn78/MpWMGaJgD3f7gVGDWlaxvQNQ5QsmbXaLW/JiRaGX0AHw
	M=
X-Google-Smtp-Source: AGHT+IFhl6dhnMtg2Ql5+VRs8APrxjowbgOu4JakifHuDRZCkhJocdr+tQp+x3ll8cCXsnDbLGKBuw==
X-Received: by 2002:a17:90b:2d8c:b0:339:ec9c:b26d with SMTP id 98e67ed59e1d1-3403a25bb3emr6580820a91.8.1761790591601;
        Wed, 29 Oct 2025 19:16:31 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34050ba1472sm580887a91.17.2025.10.29.19.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 19:16:31 -0700 (PDT)
Date: Thu, 30 Oct 2025 10:16:22 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
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
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 3/3] net: stmmac: dwmac-sophgo: Add phy interface
 filter
Message-ID: <kvkmvw2a7n3zils6rx3casv7slgzvli5cwlukmixly2loju2aw@vsuigze4wgwu>
References: <20251028003858.267040-1-inochiama@gmail.com>
 <20251028003858.267040-4-inochiama@gmail.com>
 <20251030004948-GYB1549833@gentoo.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030004948-GYB1549833@gentoo.org>

On Thu, Oct 30, 2025 at 08:49:48AM +0800, Yixun Lan wrote:
> Hi Inochi,
> 
> On 08:38 Tue 28 Oct     , Inochi Amaoto wrote:
> > As the SG2042 has an internal rx delay, the delay should be removed
> > when initializing the mac, otherwise the phy will be misconfigurated.
> > 
> > Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> ...
> > +static struct sophgo_dwmac_data sg2042_dwmac_data = {
> > +	.has_internal_rx_delay = true,
> > +};
> > +
> you forget to address in this version? see
> https://lore.kernel.org/all/ljyivijlhvrendlslvpo4b7rycclt5pheipegx3fwz3fksn4cn@fgpzyhr2j4gi/
> 

Yeah, that's right, it seems like I have forgot too much things.....

Regards,
Inochi
