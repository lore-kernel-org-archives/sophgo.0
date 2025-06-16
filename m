Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB013B2A0
	for <sophgo@lists.linux.dev>; Mon, 16 Jun 2025 00:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750035424; cv=none; b=LVKHWZAXoCIX99escDz6gk9YPy73Vyhz3vGXdhMhcQRm8AjGOoAXCXryfcYFKvQ13vINA/Db9VkWJxiCox3d/QUILF8OvcnPjOhWshD2yWlykHKZ0h5ylRIvCsUP2L1MNwYeDEmx3A2+wYvuCuy/YLxT9IhjeCgGsh4eiiSSzy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750035424; c=relaxed/simple;
	bh=+E84oN7ceFHfRJbWHpZhLPyDdbHv3VBZ8qaE/QVREiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfQv5Ec5HqGDm47Tsloa30G0T2zUfwN1/ShEtVz9A2zTp0TF4CqD3uJO8I6n+//E71R1uBNTypTwVFwjwSXD5jWRnGkFpOJnXP/nk9Y21a7aPIFEYvWZCJn4ndy1oKeFi01CLf6FM+b6z8xggAQclmv5Rg/OEJEvT47n8EuFKCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aG9ZgDUg; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aG9ZgDUg"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3116db72bd7so4296120a91.2
        for <sophgo@lists.linux.dev>; Sun, 15 Jun 2025 17:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750035422; x=1750640222; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oT/gl9ntzgnLVv3Iy2roEt0j1rQ3Tf60S9oriE2bToo=;
        b=aG9ZgDUgodmmtiIoOG+uIzVY/8VIThhkED732ErEQfj/kIJJSeMcpH1ZDo8CLQtsBZ
         Mcnx4A9ig0yNkJJKGYOwHMjZmAFB5+/YYHYcXs2QTk9kSvnsUOLrKo74lSTvUKOhh+gB
         VqHsw+JRHgHyCCNYTodZeyFp+eggNvHve1zWsv8Sqo4+otYMGGyZE1Eq1c486W86+yjP
         KhftX2h/5BxP21RdBjRYGitZBtIT33g0ZzKwM7x939Ga+h2JajfXvsqjmhfo/1sSC6s/
         Iitt5EFtH/Ov8J283NxJ2B5tuuTT5nUwdt/C0GIS0tDWIWr70NQYEcL8IHwvRAV7GdeL
         KdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750035422; x=1750640222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oT/gl9ntzgnLVv3Iy2roEt0j1rQ3Tf60S9oriE2bToo=;
        b=Xd5mp7+yO5NKpqUFuZz48+v5ANsA1KeHB72A7cgEnsp3x622f1ZeeMkdLXq31QABd5
         metKFZtxBuLMs8JqiOzMQsnGDymhnhqQ5Y/UdGn0MbJvfCCEmVjtCg4qR4pSGHFqICyO
         Wvgy4QeurCJzcS8f5pSY8jLj0wnoEiFlB/LkVMJi9HCE8Ku+9NxfOUP845NIiA/94rC7
         2P5Ywz0AE8nKCMMoiaZLae055iYs0g8wZSGk8FxFmHcARhjotdrevTVPLZvhPjW+9TPi
         J5z1p+1a6raojwjbh9WNvWpva4Y2SYcJ6CHkUDKQLp+FXja+QK34572hqQz1NOTj2ngj
         dhPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhOoBjvwH6eRDDvdYTXUfd3e1HYQ2sT4OpsF4yCHlbvZFfqdbIAkkcNIelL4/UjY7IwtrA2go=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy00gpPLJLNZiF62OaClygOUaznxWxq53oiDAbdhrbcA72It/b/
	azO9DGDJ4Ry3j1J9zSH437pEo/gjC8vYN95m2cH+XGRQnVBBPeJXAhQa
X-Gm-Gg: ASbGncsdgTYJjPOhQhWDco2ro9QWbQTMdMxNN0A64/3k+5pGvnMzQYojP+PP22Ht3MD
	LRMc3ozZ54Lbl6mvkrg4fJEupTxoARtXS9hNQ9o0IMbjKCyYwz+8S1GsbQYGayHJZEPtOk//dN2
	kYpzuWh9We9+QxDI739vHLcNaUrC5vH1jFN7tyM6ZJLiU/OrWh8nfb0KcQ8qkMHeeVGEiswaQv9
	ozNRz92MRwu75Q0Gn7ByaCFo4ZxTmzNAumVqbbH11PypUWq15l6ELoR5I6AMc4+OZNz+3/Q1p6a
	s+1Wv0k4/5xrB8+YDt7KwQl/kQRV/AX4F7h5DbQhTJS2E5FAPVbxoI9mq1DFLw==
X-Google-Smtp-Source: AGHT+IEJZx+RvcW/dbXwya7QUE7sY7JBiNDXSGJnioj+9AXE7S+LvtvlFoRF1iJqrMM91idUaTWYJw==
X-Received: by 2002:a17:90b:3805:b0:311:ea13:2e70 with SMTP id 98e67ed59e1d1-313f1cfa1afmr13643569a91.14.1750035421829;
        Sun, 15 Jun 2025 17:57:01 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d8a17e4sm49582235ad.56.2025.06.15.17.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 17:57:01 -0700 (PDT)
Date: Mon, 16 Jun 2025 08:55:47 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next RFC 0/3] riscv: dts: sophgo: Add ethernet
 support for cv18xx
Message-ID: <dex2g5mafop6vtc5qdkdlunk5te53u7xxntcz6sjhwldhah6hl@gs6inqeuzlo2>
References: <20250611080709.1182183-1-inochiama@gmail.com>
 <d3b20a9ce58fa296034fe3aa8b60ecde4c4192f4.camel@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3b20a9ce58fa296034fe3aa8b60ecde4c4192f4.camel@gmail.com>

On Sat, Jun 14, 2025 at 11:19:34PM +0200, Alexander Sverdlin wrote:
> Hi Inochi!
> 
> On Wed, 2025-06-11 at 16:07 +0800, Inochi Amaoto wrote:
> > Add device binding and dts for CV18XX series SoC, this dts change series
> > require both the mdio patch [1] and the reset patch [2].
> > 
> > [1] https://lore.kernel.org/all/20250611080228.1166090-1-inochiama@gmail.com
> > [2] https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmail.com
> > 
> > Inochi Amaoto (3):
> >   dt-bindings: net: Add support for Sophgo CV1800 dwmac
> >   riscv: dts: sophgo: Add ethernet device for cv18xx
> >   riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
> 
> Have you noticed any problems on the board you are testing on?
> I've added the patchset + pre-requisited + the following into my board DT
> for Milk-V Duo Module 01 EVB:
> 
> &mdio {
>        status = "okay";
> };
> 
> &gmac0 {
>        phy-mode = "internal";
>        phy-handle = <&internal_ephy>;
>        status = "okay";
> };
> 
> And the PHY is being detected and the Ethernet controller is being instantiated,
> but the PHY behaves really strange: LEDs blinking wildly, link status is bogus
> 100FULL UP even without cable insterted and the real traffic starts to travel
> only roughly a minute after the cable has been plugged in.
> 

This is true and may be related to a wrong pinctrl setting or the
phy setting. But I am not sure the right configuration is at now.
IIRC the phy is inited in the uboot and the kernel does not touch
its custom part.

Regards,
Inochi

