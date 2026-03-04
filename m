Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F5A36C9D5
	for <sophgo@lists.linux.dev>; Wed,  4 Mar 2026 17:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772647085; cv=none; b=lYDOCThQko6O9lrqUTdfz+jiXkdjoLeK88W/ZeN6V68rf87heEuAoXY1BaIz3aDB8u+vqwBRye4CyLelPWJVyu8Zm0aZ6oUpy+cExZ6evH3A06mokSMiyTwgYNaVCKS7g0sBhTKbyQRWy0e+ZrEj5pmCEoW9K7xIzfeMRwaliF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772647085; c=relaxed/simple;
	bh=kD2QH8t4ii2+KFV/KGuDMZq9ZU8V8+zutfjGr5AYUE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GExaSvqxwcH+TTOgZqNBdRZhDo8yxB9Gu4AVSAHLfieKDmXF5+PPPPTnqyQ8jd/f/oLmk323re6vVoGDCRRyLv91fTQF9Ftw+5ZDv0+667m5B4XSKY1+3ScpB5krTTs6MnYzz3P2sYGqdY+hdEqifGCbDE3hyv51ItDZ0znlLG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4ZvcW1Y; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4ZvcW1Y"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483487335c2so59294345e9.2
        for <sophgo@lists.linux.dev>; Wed, 04 Mar 2026 09:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772647082; x=1773251882; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rq5hYgf0faXia9cxwlRkLJL71Mpw7xbT+1o0WoNrPw=;
        b=I4ZvcW1Y8N+9EL8jXnIHKM+1qSVQsV56vIVruUxkH/37vSq7P2XFfhjKr5KggV+zMR
         dwXbPE9Kd8pPtTKzf1wqk2T6LASLaxrDQX90M12uGJHhxCNjTIOBWBdAaL6d4tUv7BTh
         D6QcJs2bw6lciCBEn4E4uzMbadmLnNzvtzhDW4s9FfOTkHA4rGv/asXC86X0YLowPIC6
         L6gr+PVuar6XO2c0UQKfDcWOYNa1og1vRhG1fQOlrcz34Dr82aa2N9r/QpdPjDgN+eI9
         MzuJI6vk/SVK91lZSh4cPK30nS127mB1VYgazYWQJaxDMu3asmPCWPlOf3YnK18YHsrh
         BYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647082; x=1773251882;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2rq5hYgf0faXia9cxwlRkLJL71Mpw7xbT+1o0WoNrPw=;
        b=L29ugBBFhvBwPiBrIAV49J4q02O+efenMQ8FSeFJaaqtcfrrdsvf3pm5R1QU5lUnwC
         c9xsMkVZ03LT+jZObQoqJ2BkDMbIphKPTJ5oEv2Ko/KkpXc3UhImU2DYnS50yAjpfEv9
         +BG2HV6XBsBL34k5O8R5Jn24/Zf56BQeaBGkn8O2upksMzcE6rqNoaN/6QzDsH/ROUBt
         4rTLZWAVs7zN5Ef0lJ8q7mVUTKzxKGQsmacHoSZKS94DCnio9DIDfLpYdUMyxH0tnXtm
         XHZw/A2WeI4WZIPVS1C4hkubCTCdDSw3x5UXdPCOCyG4BP4rxLqloJKeYWJXpW41Mu5B
         VQDw==
X-Forwarded-Encrypted: i=1; AJvYcCUKjwqXAYoi1OH45YEyGLCATrEFgJ6eZCNm1lJomS678CLWUIylAaVETbjR7F1miOzLOkAYbU0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEYxJPdtq1RrCaNEg6NV6glD2vNw49LfPaHCw14UR2cVzFscFf
	xp0Lg50ZJ7yqp8lPHJi0JgB5SV/hyBUrbmJQ38Qk1+pD/vgchoW0Pc6p
X-Gm-Gg: ATEYQzzCCKoYSsAijhv1EDtizVYiga2Wv0Wn9uTDgGf0FyQUL7Y4+U1LDtXrtJG5LEs
	lMdqDeU0P1VjbVg7WuhC4yWpyN6UfZnwmhRQsVRB0NORj3BbDllju3Ecgt1+Bv9DScbnq63uCrx
	0b0FjL4nnoBVZetcep4RqD4YWITl7leqraqt487O93aoaHFwbbCGn9oezs4b6WNDcikJqWjs4NH
	WkQwYfuC1V/hmBH93fkXY9wvasLC2shHDCPuBiY0R44UMKIFezYUh8gNXhu85CCtd9QlTBBPjID
	u/9lP/1/wH5YPcvyx266bVM9uB4P3mHJ+OBBoTgYWX4+Pv7UoCjG/rQR8K0LJw7AeEf7s6rhCeP
	9uZK0xnSuc3bw1rEFc/QvAZ2CjiMJCJI+BBUZUxCZ4yqybu+UvQ42IQwzBGhN+71lHNsmA93w/j
	CUaRH54hGkJHp/nYtRa/cbzBfW+I2zJseP+rkEiQW2eIvK5y/GxvdA7ubKmb0hXevFnpNEjw==
X-Received: by 2002:a05:600c:c163:b0:480:4a4f:c36f with SMTP id 5b1f17b1804b1-485198749b6mr51102325e9.21.1772647082156;
        Wed, 04 Mar 2026 09:58:02 -0800 (PST)
Received: from anton.local (bba-217-164-166-37.alshamil.net.ae. [217.164.166.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851acf9c31sm13254295e9.12.2026.03.04.09.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:58:01 -0800 (PST)
Date: Wed, 4 Mar 2026 21:57:56 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 6/6] riscv: dts: sophgo: dts nodes for i2s tdm modules
Message-ID: <aahuz5KJLL_rAZTH@anton.local>
Mail-Followup-To: Inochi Amaoto <inochiama@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-6-6ef787dc6426@gmail.com>
 <aZ939evsOs6nCd5I@inochi.infowork>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ939evsOs6nCd5I@inochi.infowork>

On Thu, Feb 26, 2026 at 06:32:27AM +0400, Inochi Amaoto wrote:

> > +#define DMA_CPU_A53		0
> > +#define DMA_CPU_C906_0	1
> > +#define DMA_CPU_C906_1	2
> > +
> > +#endif // _SOPHGO_CV18XX_DMAMUX
> > diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > index 06b0ce5a2db7..ebe5e8113939 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > @@ -8,6 +8,7 @@
> >  #include <dt-bindings/gpio/gpio.h>
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include "cv18xx-reset.h"
> > +#include "cv180x-dmamux.h"
> >  
> >  / {
> >  	#address-cells = <1>;
> > @@ -448,6 +449,60 @@ usb: usb@4340000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		i2s0: i2s@4100000 {
> > +			compatible = "sophgo,cv1800b-i2s";
> > +			reg = <0x04100000 0x1000>;
> > +			clocks = <&clk CLK_APB_I2S0>, <&clk CLK_SDMA_AUD0>;
> > +			clock-names = "i2s", "mclk";
> > +			dmas = <&dmamux DMA_I2S0_RX 1>, <&dmamux DMA_I2S0_TX 1>;
> > +			dma-names = "rx", "tx";
> > +			status = "disabled";
> > +		};
> 
> This magic number 1 is bind to the RISC-V cores, I think we should add a
> macro DMA_CPU_ID into CPU file to route the CPU id to real cores.
> Or, just let the borad dts configure which dma is enabled.

Hi, Inochi. Sorry for delay, I've missed the messages somehow. 
I'm not sure what is the best option TBH. 
If the problem is with the magic number, there are constants for this in your
file:
#define DMA_CPU_A53        0
#define DMA_CPU_C906_0     1
#define DMA_CPU_C906_1     2

So I could use them. 

If the problem with hardcoding the CPU - it is little bit more tricky. 
Ths commit is in the riscv branch so we could not use ID 0 at all.
Unless you want it to be more generic.
From my understanding we could not boot from CPUID 2. (may be i'm wrong
here) If it is correct, it means the whole setup will only work on CPU
1. 

In any case I will follow your suggestion. I agree, leaving this with 
the magic number is not good. 


Second question: 
Do you want me to resubmit this change as A separate patch as the rest
of this patch was applied? 


> 
> Regards,
> Inochi
> 

