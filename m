Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D7137F8A0
	for <sophgo@lists.linux.dev>; Thu, 17 Sep 2026 02:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610578; cv=none; b=Z2bQmKfaTsF3Mzs5DE8VLByhMgukxqonB/OudYy7gcSxYIlLFTayrEOi672mWshUwkuhfTl4CntZJ4FrmP8nGzwp4THFniBHcLwSm/eYkIq9FGmicNsvnpaM2ZG0rTEYja3choAKhJeQPqHpbMMsU6L3QW+SOMDxYB0zfEnmTYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610578; c=relaxed/simple;
	bh=b6wjZQ1RX/T/S/dEijbGBQbbX4WRTC8hJhLEfqq2hAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAU0aehWejDHajlvyRGtNNzAsjQVuvouiQohtL0BnuaP4LPsUBWiIdKOu3FrrapzdsEid3XiBUVNhZ47vVcywwZt53Baiv0pPnEkdybLeGbjnjS67/gV+GbUVbVz8Ao5cZxlZFKxlCaAqzZv9bWxMVw8/tv2EjlpNPtf5vGVApQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfUx5TXP; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfUx5TXP"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d9004a1ac0so2226025ad.3
        for <sophgo@lists.linux.dev>; Wed, 16 Sep 2026 19:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789610575; x=1790215375; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yXMeRLzLYKk1dOekGjdx+ZqUH1z0s4dOYL9Yud176Xg=;
        b=kfUx5TXPiYNnM39sesizIQOavGJchDzWTZcwpLWNZ29iRGmLDf3/cEzL+FPSDwE7wI
         77jhopHWrlPic5oasWi1KtELa/T44JC7ZHlQUeUq2wWOnm9JeQKD+Jk47tddYDzwKmqw
         MuBD56Y44PUq9k2xfap3Af0ca7jGESg7QbXztJWM+vQlayYfWHqBgNIeZdfhqX1SMvNU
         WxEFgdIhc2MMs2mnOp5enEIhb4H45FfBg0QlEoJIh51Bbfs5WEK+7sW0rMF0x9FzrdlM
         c1Bhf9yDGLN+IKGstCJkuKdy/UF1b8dSlIPZyXac5RpZXKWPFVIzBImn7V8ZdURPxovN
         6/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789610575; x=1790215375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXMeRLzLYKk1dOekGjdx+ZqUH1z0s4dOYL9Yud176Xg=;
        b=PsxMyWOFw4Mop3E8tsLd89v8NMzKjne5Nkv8+3Ea/E2L9BMZhRvibK6U5JHbL8vjLV
         Iv/nEgdwD2by36A6WAE8c0LNJ3zLAC2FIAzDDVZC7nRFM/0+4b2KHA9x41x+1XSfU6Zh
         4sEx3yBbFbZa9ZX2s6LGjx+UCaqOu0xQMqWDlEwKbQPB9fQPI0X/gr0Sr17gLXEU7g4Z
         5vbNqceFLaQjA/iwc3OSDjC4MeoCez0thLg2iLFz5vD9HDBgKrLRVL97Gh+91KwPVo4z
         DtbHKM7koCJt+sn1WTxTAPR/n0qElXb6FjQkOJeLP8QXWqnXda0TCO26NLnR9giORWr7
         DzqA==
X-Forwarded-Encrypted: i=1; AKwUvBwRQFpH9D/gCy3+STVrCR8Bx13UiaUMw7l/8TIzAxgvHepyOVBpOcx7tRNlgYNmLr23z26+sxg=@lists.linux.dev
X-Gm-Message-State: AFuF++m6pKomEup2IWcABCVbAnwhNqrsFaHNzyV8bV4FtBI15Hje1yUy
	O4mCRNRrvsnn5xdX/r1E6m8ru69smXrVZiwIsiFg/TQ6/gTA4JSWUxPY
X-Gm-Gg: AYBFou21spyfb79FxPh+2q3EbZnOqtPSt+TyG8+aePbFUZ0xTJl8zkJxUIXXAlEQdUT
	VWskdI52GkPf4mAwQmDz8wmVQu5fgRPR5ZR49U4i3SqO6zc91AZyIyKcRSNmGO7P08hxBMS8jLd
	9yAUj1vezyRTJhjGqp0IkqdbtDTeLN5kB/J1Fgo3ur4baaZZAmvF7rdoyiHDLaWiowXVRzsagra
	eYcZ744BtClcraC0JfjvVgEFSq8UN39j+ESgyWPOBIGGa89VKeMscxj7FOp3zNvhWv8mOgUY+qj
	/iQIJrvgNFB6gHgkhpfWYjcsD0W9Fen3sUYYR7MArqv95tsXaxk75ljTrWgi9RQhOoReIn+Yknc
	XIhV3SDXEHFaRkMqC123o0ll9vMNBrfem3T9yDusVBxjbjgUMDkOZyDRnHPijxl3QLz7Y4qT6dh
	/R8kOy/k030yrwvmRElvHZjA2cEJy6dDjsU6zcQQNMDcFdEXp2Cs3ex3X4tDQ+YWMDfsH402I6n
	/tQx+nv
X-Received: by 2002:a17:90b:1641:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39e1e4d99d4mr10807662a91.18.1789610574914;
        Wed, 16 Sep 2026 19:02:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35dab2e9sm2345861a91.1.2026.09.16.19.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:02:54 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:02:10 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>, 
	Samuel Holland <samuel.holland@sifive.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: sg2000-milkv-duo-s: reserve memory
 for RTOS
Message-ID: <aqtKAuoVSCxcts52@inochi.infowork>
References: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
 <6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com>

On Wed, Sep 16, 2026 at 12:10:23PM -0500, Samuel Holland wrote:
> Hi Andrei,
> 
> On 2026-09-16 11:06 AM, Andrei Lalaev wrote:
> > The FSBL loads the coprocessor firmware into the last 2 MB of RAM.
> > Reserve this region to prevent Linux from using it.
> 
> If the FSBL wants to reserve some RAM, it should modify the devicetree at
> runtime to add that reservation. Adding the reservation here creates an
> unnecessary ABI surface between the FSBL and all consumers of the devicetree.
> 
> Regards,
> Samuel
> 

This is fair, and the fact is that the current fsbl can disable
coprocessor in its configuration. So I will not take this patch
and maybe do a cleanup for existed devicetree if I have enough
time for it.

Regards,
Inohci

> > Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> > index 78a257839f6f..693c9fd7b771 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> > +++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> > @@ -22,6 +22,17 @@ chosen {
> >  		stdout-path = "serial0:115200n8";
> >  	};
> >  
> > +	reserved-memory {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges;
> > +
> > +		coprocessor_rtos: region@9fe00000 {
> > +			reg = <0x9fe00000 0x200000>;
> > +			no-map;
> > +		};
> > +	};
> > +
> >  	wifi_pwrseq: wifi-pwrseq {
> >  		compatible = "mmc-pwrseq-simple";
> >  		reset-gpios = <&porta 15 GPIO_ACTIVE_LOW>;
> > 
> > ---
> > base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
> > change-id: 20260916-milkv-duo-s-rtos-memory-7a94933e35bd
> > 
> > Best regards,
> > --  
> > Andrei Lalaev <andrey.lalaev@gmail.com>
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
