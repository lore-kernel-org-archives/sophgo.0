Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4F53B28D
	for <sophgo@lists.linux.dev>; Thu,  5 Mar 2026 00:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668951; cv=none; b=IACtBLpSjht20ah485a0ki6SJNJ6D2kN1pSBTWu6bQc+SP1CQpaAn8bBvjlM6NOSl88PnEZyUNAEqFpRsIRVzjUuBS0LnKRRTReF9Mz3RMW/CFuIFpqnGH9aIaxZfrmYZUds8zjcOF/SfY9oxSVzM6bPhAIC1gXz+5/tAIKT6A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668951; c=relaxed/simple;
	bh=qrNHVwQacnhh0gn86fmgbUh3DdQ6BkJxXbWGWASTxTo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzNT4KzbBxLuyFNa3W9Iajwrzr/2h3TCoU2o8n9Z6xaT6ds6cIN9y1Cqh4VrrL0pWiSKFHpakjY4lrVeeJ+T4A713bR2M1Fe20xhyo/fW9DA0uB7Dsfr9tLAFCm9Eokdzo1Y7nnMVRyD39qNZJGc4t636aE4anNDZXTMnvTHF80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUqlKhpr; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUqlKhpr"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c738d1fa6f1so99522a12.1
        for <sophgo@lists.linux.dev>; Wed, 04 Mar 2026 16:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772668949; x=1773273749; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fndfnkiJRWkhuW+xvek/3orGGPPXnFwo/ptLxjPpUVM=;
        b=eUqlKhprINF0pYEelI/Fw60DjFuX7LvJkuFoVw3XQHR/IO5zgH/AOtrnk/f2lEWBvg
         fM/7Oo4Fb58k3Jh6OZqtn9ZTpFw4y6SiOBjjywkLC33EyPtqIehSTgtsHbwLcGkChxhF
         fIW0p/7Vq0ErMfIc5Lv1ZeNZYK9gTR1CA1YK/Fk2p8nEK87hkslLaLNrt9axlDk7H7B3
         kB9SzoArmIVKOjSHT3fF/1wK2OgEGaLvUoOTYAxEKW0Ay693BBCvi2+b3vcVJrNZaggt
         5zNYVqP6tAkZpYDWbJ4nRTQim/Pgz60oDD1eQGjFk91ubcOiDWyicw7s36F2y2ln9vHo
         sKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668949; x=1773273749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fndfnkiJRWkhuW+xvek/3orGGPPXnFwo/ptLxjPpUVM=;
        b=XXD6jBd5TXYCucO8QtRv07PkX3ABQxgDQZ5sbc09DdRXvzMsSGBzb3ScHTrQVZnH4r
         WBxsSmeIsGELBtWPs8jkP5tBJ5vV+EEOF+wE6t8v+LYaDR8kUnWPBckxx2reGy76Q96d
         PB2c0IXkWwTF420y/dXR9cGGPqpO0VewCHFSWsgTfjcoO0SfMG/Aneb+I7pxZh73XN0e
         cwVcLHKqLcoQM5jeVxsXKtr5Bzu99cB09uGetMTQyqPmbidiYCX1gJIK6lRC/lgJqZX4
         ufWmvB8N2POLnh5X5pxrOGdtbwSNVBoqHXojiI4ah4ZPVcAT8Di7vBUkHhNY15vnDto/
         8t+g==
X-Forwarded-Encrypted: i=1; AJvYcCWRoeQHAayrnId8BnYmVQPd3QfuRMdUuzYYQPC5txOvSfcuIzM2grSMUareyrTAMs7I3ZxMWdk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVwIh3xsyZgw3FLKK3eJXke/uwoA09HzPzR3IyVXov0veXx+NW
	0cVIRdUsG9KNfotAhs2TZnijIG7pQpIZsi4h5hgDJSTBHz/Iby+TAo/z
X-Gm-Gg: ATEYQzxVzspBvFdh1vLR/COWUdGvilnzLHAhRuE4aQGmfTA7JO4nn74DP/oqTY+SStB
	Rqp0LA1j0bbML6MuFZ0YqddIJ5rpxJ3Ho3e4GrSD0U2R4I8XK+YpiiCBZmi5b/9/IncHxoskFn+
	L3oYBqx23p0e+Mknq6dAR8WUApSItsYOcbjaD5mBkDsuNiOrx65Ou5zIGN9WE95ABLNVe781Geq
	yB2ig01pT9s4huhbCciDHrUNJ54mvERJny1n/J8hFeDQfhyj/12MM3lcyCHTg3kUBqdbWn6UbxV
	jXu6aXkUblFoWbrdFXU7bLQNVlU52hGHE4BlIY9lD9NwlLRt6YzGKlunD1ES38TyXj3La4hbk28
	pY0zz8a9H/e5NDJ4bPPFSKsI1WU+fbUSQxcDNK0P4zEkovR7QyoNvCtmMhK+L6WzvMxw/sSs+iG
	HCGQl2o7M29k9tYWfLa6MhHBY=
X-Received: by 2002:a17:90b:1a91:b0:359:7c55:c160 with SMTP id 98e67ed59e1d1-359a69da7d6mr3299580a91.13.1772668949367;
        Wed, 04 Mar 2026 16:02:29 -0800 (PST)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359aa1ff041sm1177382a91.3.2026.03.04.16.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:02:28 -0800 (PST)
Date: Thu, 5 Mar 2026 08:01:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 6/6] riscv: dts: sophgo: dts nodes for i2s tdm modules
Message-ID: <aajGmn3KsZGsZlhz@inochi.infowork>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-6-6ef787dc6426@gmail.com>
 <aZ939evsOs6nCd5I@inochi.infowork>
 <aahuz5KJLL_rAZTH@anton.local>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aahuz5KJLL_rAZTH@anton.local>

On Wed, Mar 04, 2026 at 09:57:56PM +0400, Anton D. Stavinskii wrote:
> On Thu, Feb 26, 2026 at 06:32:27AM +0400, Inochi Amaoto wrote:
> 
> > > +#define DMA_CPU_A53		0
> > > +#define DMA_CPU_C906_0	1
> > > +#define DMA_CPU_C906_1	2
> > > +
> > > +#endif // _SOPHGO_CV18XX_DMAMUX
> > > diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > > index 06b0ce5a2db7..ebe5e8113939 100644
> > > --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > > +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > > @@ -8,6 +8,7 @@
> > >  #include <dt-bindings/gpio/gpio.h>
> > >  #include <dt-bindings/interrupt-controller/irq.h>
> > >  #include "cv18xx-reset.h"
> > > +#include "cv180x-dmamux.h"
> > >  
> > >  / {
> > >  	#address-cells = <1>;
> > > @@ -448,6 +449,60 @@ usb: usb@4340000 {
> > >  			status = "disabled";
> > >  		};
> > >  
> > > +		i2s0: i2s@4100000 {
> > > +			compatible = "sophgo,cv1800b-i2s";
> > > +			reg = <0x04100000 0x1000>;
> > > +			clocks = <&clk CLK_APB_I2S0>, <&clk CLK_SDMA_AUD0>;
> > > +			clock-names = "i2s", "mclk";
> > > +			dmas = <&dmamux DMA_I2S0_RX 1>, <&dmamux DMA_I2S0_TX 1>;
> > > +			dma-names = "rx", "tx";
> > > +			status = "disabled";
> > > +		};
> > 
> > This magic number 1 is bind to the RISC-V cores, I think we should add a
> > macro DMA_CPU_ID into CPU file to route the CPU id to real cores.
> > Or, just let the borad dts configure which dma is enabled.
> 
> Hi, Inochi. Sorry for delay, I've missed the messages somehow. 
> I'm not sure what is the best option TBH. 
> If the problem is with the magic number, there are constants for this in your
> file:
> #define DMA_CPU_A53        0
> #define DMA_CPU_C906_0     1
> #define DMA_CPU_C906_1     2
> 
> So I could use them. 
> 
> If the problem with hardcoding the CPU - it is little bit more tricky. 
> Ths commit is in the riscv branch so we could not use ID 0 at all.
> Unless you want it to be more generic.
> From my understanding we could not boot from CPUID 2. (may be i'm wrong
> here) If it is correct, it means the whole setup will only work on CPU
> 1. 
> 

Yes, that's true, the only boot cores are 0 (A53) or 1 (C906_0).
And You only need to take care of these two cores. And the ARM
DTS you can just find it in the arch/arm64/boot/dts/sophgo.

Or, just let the board determine the DMA required, as the DMA
channel is shared across many devices. So it may be better to
not allocate them without enabling the device.

> In any case I will follow your suggestion. I agree, leaving this with 
> the magic number is not good. 
> 
> 
> Second question: 
> Do you want me to resubmit this change as A separate patch as the rest
> of this patch was applied? 
> 
> 

A separate patch or a new version with this single patch are both
fine to me. But you are always required to add the changelog and
link to the old versions. Otherwise, others are lost the information
about this.

Regards,
INochi
