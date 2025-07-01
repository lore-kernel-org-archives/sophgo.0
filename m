Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FBA270EC8
	for <sophgo@lists.linux.dev>; Tue,  1 Jul 2025 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364285; cv=none; b=LAx1H/i8v3j6bK3adCUQW+Zvpvh+URVwytk6ADVAi/xyTE1QH4QnoDB8+owQWS1m1Pp7ATTuwNqH6lKdDSq5JSd6OjOG9HYQYG+r6dOrbPchrCbr/k62P7X73UiEituZ0fiR4YNV/1CliW5FqS5m3Y1kd4KtMVng+e6yZOonmkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364285; c=relaxed/simple;
	bh=gdgJ0pLM0UcV8oL609CbKelSnZQmL/t6Ju0O6BeBF1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ME3vptqxTq+RWUmVWE6QuBK1DP2xGUmbGj6nqlEsYFsiSzGGZB4t7e+Syh0HUP8cpuDU/y2kMIYujsWAd573XGxFXeL/dAebrl1zm9l3nmrWU3QxCuN/rUIGniXueSGnOnuFkqGnWUTbtjWQrBR7EJu3lr3RA6flvpWmA3DcMfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhuUpLp8; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhuUpLp8"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-747c2cc3419so5157354b3a.2
        for <sophgo@lists.linux.dev>; Tue, 01 Jul 2025 03:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751364284; x=1751969084; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=71QusJ5AouGsm2mgHkr3YzuD0h0jCWeTyt1AC4+RDvs=;
        b=DhuUpLp8PJ9fPUx6Jb/hV8D+WxEv+C//ZbYkBRvq19Jp0HidTFg9b2PxeF3bFef8y5
         DygkkFNfi31De6+KhOBnb00Z88HuW4A1gGtxbcl4Ny0HJQrxIOiAtv5pLAWQPUqfrfQL
         zNlTyZ4KyPms9fSXBQly6T6GF2GocfdADgLF0rSTSapS+FL+Oss+axwxbKd23EesAGRo
         9imRIDnsMKomD/dZL1NOkSKDraHqMG5QHSbUmtVZ2nC3OMUnGl28Lkk+VAueCCdGdNPT
         UDlUxaavsxVZ1gAlOR9k+WStaBzKSI3241XLODfv+llF6+fjRBnOHiy2j17fhnl9+p6l
         6okA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364284; x=1751969084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71QusJ5AouGsm2mgHkr3YzuD0h0jCWeTyt1AC4+RDvs=;
        b=G5TFfA29WYeaQn7faGIyvhmbdLhai8sF6eIU73D2GkvGzzFmyMqChLt1FhpDPYN88S
         8Pxg2fGCAV13juCmeYQkk0waSsjDZeuzuGZ9iMhdKwHl5rKylXgD7IbxtIgO3FCd61Qn
         C6+aT9SNRIhHhs65OxHhPj8iJaonEbO7Oo+QKIx2m3GSWWBMD45KmHee2PAa3Cml9XFk
         49adkvzwoyXLFZdww4gOSwFUAWEV8czOWqf5jV6ty8PIs0WCEBo71BWrrINHmp+9Zz21
         2S8mc9JOoEmO0T0SrC7EJgB9XrKDQ0T0JEdSFXMmMoHzEw/I/e9e60Oso2DD8DROOi+B
         6ftQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbteOM/zM1w8IUwRdl3cS/SkETkdfzfbCNwEOYfRCeRPACqiWKRy+wxOknvOS7qq8zkcILX54=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkFbmKArPHFRx4v/gBTx9KD/66aVCNgEv+sKNuMbUYk8GXTqUo
	CvSS1TwTHN87WIVpPvQr0G/WHWjP23Dhx18ynw/GhxjLG9oPSDz2fqZF
X-Gm-Gg: ASbGncuQEL7T28K3jcUoYU5nE3ACdMwLes2zU4wvekjozfJFCEjBISxjsG32fc2VliS
	uc8vsYTxu97cD0ngm+7JOLyYk0uk4STg/evon7h6s/3lgsIzO3SodbRhc8X0i/ONrNGUTk4Wk5R
	yP9WEOECLD+NywWj27yVg92K1eC8xaLIwTPDwcCrhhsmiMpbqYhTJssIr033Cv9/DOY44L/Slck
	dHyP6nQFe5vLZt5h/6aEj/q+cercq9KtYY3yhhys0hUcgkSfEc1xxjmwIDB6SNIbI8IxiSQ9Pm0
	1NI3MDtzHYSIkah/Gyge2vLiddqsbYaaUDzGpMCDxTS/nJkXh8EqAHzW6iD31Q==
X-Google-Smtp-Source: AGHT+IHie6mqvlaJorzA6xUxii2gAFC0YaJ/JvpPEZQX9X8fCXiwrRfXuXkWDPVsvQUlpXtMG94W6A==
X-Received: by 2002:a05:6a00:2195:b0:748:f80c:b398 with SMTP id d2e1a72fcca58-74af6f08c99mr21158524b3a.15.1751364283601;
        Tue, 01 Jul 2025 03:04:43 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af57f467bsm11309945b3a.170.2025.07.01.03.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 03:04:43 -0700 (PDT)
Date: Tue, 1 Jul 2025 18:04:24 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Yixun Lan <dlan@gentoo.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next RFC v4 0/4] riscv: dts: sophgo: Add ethernet
 support for cv18xx
Message-ID: <gkyq4gakaji6ddx5btmd6fzehfu5mzfhdy5pch32idoio3jf7g@7zlwkf2bvhac>
References: <20250701011730.136002-1-inochiama@gmail.com>
 <vxnvovuetfd6rzgaenwplpkhxm62fhw6t3vi4wkyigul7p4bkx@pwlprna4pyul>
 <a5107266-853e-4658-ba90-d6a08882d2a8@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5107266-853e-4658-ba90-d6a08882d2a8@kernel.org>

On Tue, Jul 01, 2025 at 08:26:31AM +0200, Krzysztof Kozlowski wrote:
> On 01/07/2025 03:23, Inochi Amaoto wrote:
> > On Tue, Jul 01, 2025 at 09:17:25AM +0800, Inochi Amaoto wrote:
> >> Add device binding and dts for CV18XX series SoC, this dts change series
> >> required the reset patch [1] for the dts, which is already taken.
> >>
> >> [1] https://lore.kernel.org/all/20250617070144.1149926-1-inochiama@gmail.com
> >>
> >> The patch is marked as RFC as it require reset dts.
> >>
> >> Change from RFC v3:
> >> - https://lore.kernel.org/all/20250626080056.325496-1-inochiama@gmail.com
> >> 1. patch 3: change internal phy id from 0 to 1
> >>
> >> Change from RFC v2:
> >> - https://lore.kernel.org/all/20250623003049.574821-1-inochiama@gmail.com
> >> 1. patch 1: fix wrong binding title
> >> 2. patch 3: fix unmatched mdio bus number
> >> 3. patch 4: remove setting phy-mode and phy-handle in board dts and move
> >> 	    them into patch 3.
> >>
> >> Change from RFC v1:
> >> - https://lore.kernel.org/all/20250611080709.1182183-1-inochiama@gmail.com
> >> 1. patch 3: switch to mdio-mux-mmioreg
> >> 2. patch 4: add configuration for Huashan Pi
> >>
> >> Inochi Amaoto (4):
> >>   dt-bindings: net: Add support for Sophgo CV1800 dwmac
> >>   riscv: dts: sophgo: Add ethernet device for cv18xx
> >>   riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
> >>   riscv: dts: sophgo: Enable ethernet device for Huashan Pi
> >>
> >>  .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
> >>  arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  73 +++++++++++
> >>  .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |   8 ++
> >>  3 files changed, 194 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
> >>
> >> --
> >> 2.50.0
> >>
> > 
> > As this is mark as RFC due to the reset dependency, now it is OK
> > to merge it as the reset patch is taken and this patch is a minor
> > change . I hopeif anyone can take the binding patch so I can take
> > the devicetree patches.
> 
> I don't understand why you target net-next with your DTS patches.

I just want to make them all get reviewed, as the dts patch is
related to the binding.
 
> The subject prefix is here not correct and probably this should be
> split. Anyway, bindings have issues, so no, it cannot be merged.
> 

Thanks, I will separate the binding patch and fix the issue.

Regards,
Inochi


