Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD081F8722
	for <sophgo@lists.linux.dev>; Mon, 23 Jun 2025 21:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750715951; cv=none; b=Fjn5gRkGQFgwVvItW48Y4N1ELkeFWbc9ufKyUgV9GadMEesOuBE65O9hDv1nW7DFin13X6aGwzx1RQc+p5ligI/gdmCSMkKDNQRso0P2KaogUdgbhl1no7Ovg/QJmNrCfcgssDqB3oykv8OaIc2LFDKDEvdZTGCk/DfYBbqdvE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750715951; c=relaxed/simple;
	bh=CV+QG6+CRgw24neLMjPi3GkjM45lC+PSOpguhXjN91Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMwywrJHBRBrFye6uvaF6zv+dDycBmAAxo0p8HxBUH9iC1iEDusyfP4ApgvG5HfI7WY81aB/lO8it+QogJ7udO3loFyskK0yEb8dlLxXsAq7TiTZbFq4c2ryIYp5/ffi4JELJpITPr6O8mtakMOmIR3ClH24KcmE4OUTySqkMy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmiCHpX5; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmiCHpX5"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b31e0ead80eso3289588a12.0
        for <sophgo@lists.linux.dev>; Mon, 23 Jun 2025 14:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750715949; x=1751320749; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l3yB+qOk7ujVR/LBAYKGt7qD8w55PbhtiiJGomEX+B0=;
        b=UmiCHpX5VPWRXMvqgh71VJs/r692AD1mX9MYrxjiy4vXy6CDLnTQKcVech9WrCjuPx
         08oRYQ3xGhBZRU3NpweE7P3WQXRCate8Yn6LLt4p/YJDmgjzOQE03/ctODTMkB03i2mE
         n8pxVe/hmRabb1zTLHuycp1JxbkGjbS5qDX7VhPiTrVND+V4yo359JMZOYJ0YUkpOhUW
         vDIGrfz3U4KsHCtTrnHxA7787SGxsTedeiJ8bYkmxLAWog4bK08ROQwP7Jh/WGl4xy6W
         RWNt1+PZRomjOsraGI1fpyPGRZL/jPgsy+VHFRbVlGscbaN51kzDL2HvJG4bA5zhAhaO
         BydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750715949; x=1751320749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3yB+qOk7ujVR/LBAYKGt7qD8w55PbhtiiJGomEX+B0=;
        b=R1TTYZc+du4cuS//mVdKgLO/AMpj4Zq982KHFpHb5IH/K22tDwTng2HUiXlG5s+bUV
         kqDt+Ip8RGY33Or9dpePge8G9GDZh3TIf2D7iP6xUAD1HkgJ0L9MC+VG5tGBKxcYiPaf
         oT0CtXZAvH05ALsTsYvI4JEIuwlIg6ad11RIbW+dlvOmT7Wq/+9BiIYN+IJuCAd1gZbg
         FnJyzP03Bzl4anQN9e9AGYSzrqN3CViQBLMdfn/PBfrwHK3wfEZI2gPn7DSPMu9ngXkD
         oDDUpJqHEFNqfH4ga1Qwl7P0w1nNvfcw8api/avsoN0fRXGtqe64ZEnWApNXgJI+HzMc
         Iq0w==
X-Forwarded-Encrypted: i=1; AJvYcCV7yd3heXQTsGuqanJeVdSxOm0VXrsW8Zs2TkhKMq2fJ4CgbBpqMG+yZIs8RW2JTTfuMtWU+IU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yycf8IN8G4RDL1S4VdIwUep1+i7gvLWgnX2OLuhBS+iXqtQi2D3
	/mCqMHv4ZdLlGBNI5ctyz7kot9oOn6HPa528R8VNhupSqe7gb15NzU7B
X-Gm-Gg: ASbGnctrEAMWAlB1ytL6KFY3X8Xr0HarsmukP/EokZac1oijcCTBL/lAlbqGuwSkydc
	x4P6T1lKa5aq3VE2KSnvijP4GekHfPBuGMSijV2ovPKIkTakMZNjCJWjBX5UI+qKVtKCsZ/pjT3
	AY61891RAOeTYqccg0xNp48vGRyjTK4dLeigkivXASd31J4SRTGfEegd+suHlt/wjoifj2MJ0dN
	qEY0Bf6V6t2HUUn8bE0d/g/+vkUqOuGp9YNfmkvR/7LP41+GFgaIGUlID1frNZGUWlSb0a3Xkup
	Qsp1q27Sv2uQKTLFbarZLNuMEyW6c15KOiIu5DOIFaFE3/rm2MdP/bMxkZONWg==
X-Google-Smtp-Source: AGHT+IGFzE62qF3LBZw9k/a/Lzh2nlx6tpEsN8z9xHpzhHhKrHLcsX6GHI2IN06+kXkIIoSfeiuGQA==
X-Received: by 2002:a17:90b:4a01:b0:311:a54d:8492 with SMTP id 98e67ed59e1d1-3159d62bf03mr19438715a91.6.1750715949257;
        Mon, 23 Jun 2025 14:59:09 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3158a331288sm12485010a91.43.2025.06.23.14.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 14:59:08 -0700 (PDT)
Date: Tue, 24 Jun 2025 05:59:01 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next RFC v2 4/4] riscv: dts: sophgo: Add ethernet
 configuration for Huashan Pi
Message-ID: <vlolusjs436s3tsp23g2bsr33fngp6vrc2g7vbaeypf3l3gi5k@i44w7sjacahp>
References: <20250623003049.574821-1-inochiama@gmail.com>
 <20250623003049.574821-5-inochiama@gmail.com>
 <bd1485c7-e6c3-4360-8e3c-e584ea0b8040@lunn.ch>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd1485c7-e6c3-4360-8e3c-e584ea0b8040@lunn.ch>

On Mon, Jun 23, 2025 at 09:26:43AM +0200, Andrew Lunn wrote:
> On Mon, Jun 23, 2025 at 08:30:46AM +0800, Inochi Amaoto wrote:
> > Add configuration for ethernet controller on Huashan Pi.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
> > index 26b57e15adc1..86f76159c304 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
> > +++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
> > @@ -55,6 +55,16 @@ &emmc {
> >  	non-removable;
> >  };
> >  
> > +&gmac0 {
> > +	status = "okay";
> > +	phy-handle = <&internal_ephy>;
> > +	phy-mode = "internal";
> > +};
> 
> Since the PHY is internal, it should be part of the SoC .dtsi file,
> same as any other peripheral. The board .dts file can then enable it.
> 

Does this mean only boards using external phy need to override the
"phy-handle" and "phy-mode"?

Regards,
Inochi
