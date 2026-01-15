Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AA2309DA1
	for <sophgo@lists.linux.dev>; Fri, 16 Jan 2026 01:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768526468; cv=none; b=GG2fiPuuDNM+XM46efebIE6RdS1M5/YJCx+u9imuyIwoyrfCc0S9n8BqxSVi6UA2yO2GN/vhhKm9JEgo4Mgr8th5UrkTEzcSDGK3cWJMr33Z+T/BdvNJRRjIWv+1PQb2/ohGUr6W1OMDMxT6rd4Y74gmTrJNV8g65Qb6pNxGCdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768526468; c=relaxed/simple;
	bh=WVAFk/G9Jae2iegxU72AI5Nf1GESFNgXZ0s6CTi6AQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uK+o5iiWIZYV9T20jLlYEX1pPZ69xcEiVDiPHGNmxNrl99QGbTm1BLRpodaZcVZcDL8bAR7A9D2EFVsu6SuaYqJtiiG3uRT/u+fYEfbr8yaLzIMWmih/ec4uUyJ8UlF0P99m/JOAqs744sU7EJLb9sf+7nlBjZ9cyJth7Ag0VbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUHkUCpZ; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUHkUCpZ"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4044854464fso440032fac.3
        for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 17:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768526453; x=1769131253; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wFG3gVNxJD7Ap7fJ1CZDygWmut6qTFwFZjaDYw553m8=;
        b=IUHkUCpZjRUvLN1AV+vYCMHZimtPkAy0rU7AHLoj4UtB0vGqFOFxeYdivVUdVBq4HC
         l/uOmtF24iKBlwQnozjjJKW4U+yMhwF0C4fQzPiN3QagIc6TgzCrKkrCkfRNV7pPZJh+
         Fs4NeV9J5Tu25UyZQIAao+gDpcDpu7waEAK8i73xIixMayyGQOj9bjiy/uRzR1MmC5kC
         Qf7WNk+sym1x+XdWz9bw3AS9UmAZlFTZNYIneGGnbPunvfCDBRGlH31D/VmrIrAURKDt
         wFp8hrOKLej2uuLsMpF2lVrf7KrbUvfnMjlHU1pJlex5atrAYCoOlyI5aWrANnsaGxzl
         EABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526453; x=1769131253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFG3gVNxJD7Ap7fJ1CZDygWmut6qTFwFZjaDYw553m8=;
        b=uG3V8vHNGYvr1AoOE7v0Mqqh0EbEuZrTGEKCzBBD2YakKBGudUzgOwFpjfFalLoCUY
         bJLQPvz1UBySooVLM/7BvPEdcjUx6goros92v2Z8+j8bP4IHXnGwmK/sROhnvO95luoW
         kp2XRBgNWfQFkoDjbhuQafa1STPzBKT63MSlIgi6A6kxlL4Sr8FJcf7/xoQ2jKNAb8vB
         TvlT2AYnTtkhOPVfKemQKATcRCRgrPxzPYgZvYYpdZ1hjSj0LFZ9Vw9OQHKxfSYZNLT3
         Vwh9giZwXJGsknMuPOwVRya1scdrF/hy3O2dY+v/fs1UdN2LBgekebzMlUpyHoYG6k1s
         qxzw==
X-Forwarded-Encrypted: i=1; AJvYcCUGp4kMhjr+cZFCbBiUhrOtXLciMeOk0yFGgc4bQWPXtIgPay1r3ofZ/VVL4Jz/xZVgSg7Pn9M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyV0Ul3iLhc7pnxHZH/WXUwMkMqHyQTvupEaSx/8bkBvwsFhxaT
	ShwLZKFfW1iY3K4JXUmAiC0lq8mVFNTcAexoNtmaLPVRiOSn625d6CEmShxpDA==
X-Gm-Gg: AY/fxX4IXlKkdHEZeezFtu/htKlC1z55XAhesCBMvWFpq/4jww35/7jXAtp5ZEtXfXw
	IkoS9jtCX45XzOSDBbcyN+tLajsbAa6A88GMUOtlBp18Gx7GZXPxpqDJM1GgMk1Us9c7DshZ1B1
	ZThHYJiBtoblWfXSCjJ6Gzg2QcVCsShOj8AGxMQ5lzKo1b+VjJQm2U9zvJ/fv7oPhsWOSURPkqm
	Q0I8tDJNTL+M0PpYEN9RyjVPltEM51Fn+hEnX6mcifGV66RM5tOcwzWVq7kk6B5ek7gk7xVw7AJ
	Y21IIzM10XR/I7twDm4rJNy4GJcKv3cOgyaERhFCn3hk84tJYn8QOj+U0VBi+cFTzUjzy2O4dhj
	ZzqIQhgWHOb/heR8XzhFBCByZukCR6aHYsa2YAFoopEuBX221CU8sJRXO7B2ulXONixPBgOVvHs
	uQ4IovRtmYAw==
X-Received: by 2002:a05:7300:6ca1:b0:2b0:5079:d3c8 with SMTP id 5a478bee46e88-2b6b3f139f5mr1020729eec.4.1768520046558;
        Thu, 15 Jan 2026 15:34:06 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3696f40sm696762eec.35.2026.01.15.15.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:34:06 -0800 (PST)
Date: Fri, 16 Jan 2026 07:34:01 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/8] ASoC: sophgo: add CV1800 AIAO mux and I2S support
Message-ID: <aWl4fvKsUZDg9dwj@inochi.infowork>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>

On Thu, Jan 15, 2026 at 11:17:37PM +0400, Anton D. Stavinskii wrote:
> This patch series adds basic audio support for Sophgo CV1800B, 
> as used on boards such as the Milk-V Duo. 
> The series introduces an AIAO audio mux driver, 
> an I2S controller driver, corresponding DT bindings, 
> and DTS updates to wire the components together.
> 

I haven't see your mux driver, is it missed?

> The implementation is based on vendor documentation 
> and testing on real hardware.  This series relies on 
> recent fixes in the DesignWare AXI DMA support; 
> in particular, correct operation depends on 
> the DMA changes discussed at:
> https://lore.kernel.org/all/20251214224601.598358-1-inochiama@gmail.com/ 
> The current driver implementation supports a fixed audio configuration 
> of 48 kHz sample rate.  The series has been tested on the 
> Milk-V Duo 256M board using the Sophgo SG2002 SoC. 
> The implementation is expected to also work on Milk-V Duo and Milk-V Module 
> boards based on the SG2000 SoC, as the audio 
> and DMA blocks are closely related.
> 
> Known hardware limitation:
> On CV1800B / SG2002, the I2S2 output pins cannot be enabled via pinctrl alone.
> Due to SoC design constraints, the output path becomes functional only after 
> additional vendor-specific register programming. 
> This series makes the limitation explicit and does not attempt to work around 
> it implicitly via pinctrl or undocumented behavior.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
> Anton D. Stavinskii (8):
>       dt-bindings: sound: sophgo: add CV1800B I2S/TDM controller binding
>       ASoC: sophgo: add CV1800B I2S/TDM controller driver
>       dt-bindings: sound: sophgo: add CV1800B internal ADC codec
>       ASoC: sophgo: add CV1800B internal ADC codec driver
>       dt-bindings: sound: sophgo: add CV1800B internal DAC codec
>       ASoC: sophgo: add CV1800B internal DAC codec driver
>       riscv: dts: sophgo: dts nodes for i2s tdm modules
>       riscv: dts: sophgo: add Milk-V Duo 256M board dts
> 
>  .../bindings/sound/sophgo,cv1800b-i2s.yaml         |  75 +++
>  .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   |  43 ++
>  .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   |  43 ++
>  arch/riscv/boot/dts/sophgo/Makefile                |   1 +
>  arch/riscv/boot/dts/sophgo/cv180x-dmamux.h         |  57 ++
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  49 ++
>  .../boot/dts/sophgo/sg2002-milkv-duo-256m.dts      | 231 +++++++
>  sound/soc/Kconfig                                  |   1 +
>  sound/soc/Makefile                                 |   1 +
>  sound/soc/sophgo/Kconfig                           |  41 ++
>  sound/soc/sophgo/Makefile                          |   5 +
>  sound/soc/sophgo/cv1800b-sound-adc.c               | 322 ++++++++++
>  sound/soc/sophgo/cv1800b-sound-dac.c               | 204 ++++++
>  sound/soc/sophgo/cv1800b-tdm.c                     | 714 +++++++++++++++++++++
>  14 files changed, 1787 insertions(+)
> ---
> base-commit: 7a52965b6976c936f413eebeee3f78c6faf09012
> change-id: 20260115-cv1800b-i2s-driver-4f17836dec56
> 
> Best regards,
> -- 
> Anton D. Stavinskii <stavinsky@gmail.com>
> 

Thanks for your patch, for all the patchs, I hope you write a
meaningful comment for the patch, at least for now I found it
is nothing in your comment.

Also, the patch 8 should not in this patch and should be a
separate patch.

Regards,
Inochi
