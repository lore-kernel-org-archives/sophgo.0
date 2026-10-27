Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109464;
	b=YWS24tvdDt69rtHOvTct4BuRMpw0ARRvX3LAP2xqdWSk+2h+SY+8iAkp90hDldXgF5fb
	 GpIUB/D74famir6tzZi1NXJglPlNvQDYr/CyI/2zAIbAh1A2NdpeBiNMJ6RxUuoALuTAE
	 W5hKYj+Wg5zhkMisngc2bGaFeay25SG1/WGuPcOUTm6l030qVjFglV4rbTYMZil3BpyOp
	 BtBAVy0pu0QBNnQaL1c4dKUnMeaQDx016Jqb6Rke+LoYp10qPmxa6tb1eGYIvvE7cFguW
	 5g2Zr7t76mwp2F3ybysIw9NZTfA3kD414O/AgTdg2hHyvdz9pfe6IPY50kZFNdk6LgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XNC5//Bd5KQNucbkx3QsmmiwGgEOwdHKbps9MXx0uvM=;
	b=yB4XifkAbepmtzlVbGDlrNyL+DBKrQM9Lv0nC3yXGCPbHydJUgR3Vi+6/si6FPv2rDVr
	 WFd+H9z4SUX64KgbJIs6bgYT2HdNeCpBe6EYEJUzvyQ5S9FMumo58wSrhbiDq1GsqCEkB
	 G0xuUO5Jskh4gVgw+GJfwSuOw/ItYAenYDJinqnuC9RHJ/HN4kqREApvP6bI3jpGr0KxY
	 dAu9oFGVW1sACTiFsM1Hw/lAoYIFuYryaaH4zB8zaKQNlw42RMWDF86nbl1BZrX0KkEzj
	 fb7aVzCyLdVzAR+qvAt2B0er2BYjwASOGNu2y3iozZNlevaBt4XtBDnEnYJ8WxLvQJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UnsyCuJO;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B358606A31F
	for <sophgo@lists.linux.dev>; Tue, 27 Oct 2026 13:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B358606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UnsyCuJO
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so2992534e0c.2
        for <sophgo@lists.linux.dev>; Tue, 27 Oct 2026 06:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793109462; x=1793714262; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XNC5//Bd5KQNucbkx3QsmmiwGgEOwdHKbps9MXx0uvM=;
        b=UnsyCuJO9xyekgBoMeHA7lcj3M7sGMa+HOK+9fp7h7cunVARBljdIuQr7ffkTxs9fe
         uEcupUbw+59pKhyo35wDgfe/ys322FUWuE+yKDOpqjjbwqxrxs19AuoNNDweJHzR0Ebz
         py2BXm7t5Xiz8q+qzdQNOkGFCfhaHSnt6yr6bImpucNiZlWnOdH5HweuIFVzbDZpMyGt
         RMKVcyfrMM2IYF+4y/wFxCPpfvI4Ek5fkTuWdrh4x25pOhZTLwC0m1URqvxKrGN7t21+
         WEY68DK0SoF67LkXShBAWrNd23oAdmC4Euw5IYloAerlq9Kod5ODkCqU9scpU7Zj6MNs
         je1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109462; x=1793714262;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XNC5//Bd5KQNucbkx3QsmmiwGgEOwdHKbps9MXx0uvM=;
        b=xGh47PHMYZCvgd17uW9QPoD3AcmEAvSip/MueWPo8caV/nIa5d9pZ4awSNow2PwY0o
         gXf9kykwefWrVXozez0rNJEIxFfGAKK4WiE+MlnR3VZ3Lf2GZ75likGcgYxeKe3y/ql9
         M4A4IPLIgHi+i+gRIidajzeCG1Pw8jMdVM8urO3mwNlOxkx1z8tk5RC4WNvfNaGSTRV0
         R0iqBWWLuI16yfe8K0rOccC9j+EE3XltWthWxQcmhAfzTuV62KaQk/QvKB9eQoh7fckX
         f5W9r+caoxtVzEkxwmjLTG8iIYSd870stNpdasR9oi0IgBoPxT6rA/T/ILrsGxiyOtQC
         U0ww==
X-Forwarded-Encrypted: i=1; AKwUvBzs9OTY10SvC0PVQuRllkCtuiVCBKTWmI61sNdkHXM7AhBw7hDS0f3d25h8m38TTf9a7TTfRCU=@lists.linux.dev
X-Gm-Message-State: AFq9FYI+du1TniiuDHG7ea3iQ+GDocWQDQZigeMPhj82KgV8f0aJs6Os
	36VuYY6f79w9LUqGEwbAzxYBCsCQIDCFtqki6rjpqoEJW+qAsa6hwvxhaISk7nZy6B0=
X-Gm-Gg: AYBFou3AP4qu6HvWQtBDpPXZkeU5oNJOxqeZ4VXDba01imzf2SNcF+yyDGNU3WL3NXE
	RPX4sxfim+VfOs5rWh6EqQ3EY4OSoHtPemtxt2bOH2u4LX0++znva3G7rI724is9zWfZR2SkmHV
	mPpaRftyKtMxI27Tr24m7X6mFqcwGdbcqRCtGSsCh/zzHZU+88UKk8l3NqFmjj4QtLGPdMLSB3L
	xfh0l3gm5JZIylfGbDaqGLaAyAjJqZ9GVZY1l0i5d51iJZwC3Bn/6R7F7YSnKlMJaRv1TEfNSZf
	rNq6fmR2iKHyhvb7ukgb170D0hDxTehTctQe2wh3gskg0RzhgJlKauqKqGGFCIQIDoGqRe4CnLR
	LG2LIN8Kl8fQnvOPC6KEOy3mBSNy9TR4FPZjIhE2j0GqqpE8dMvbda0We3rgtpbZpzfCOp9gI16
	P1Y1P1CZy14MjRBDYxmgoQq/vR1Yw9sefYR+9+fHfOY+yNYWhlyfHQohWQTYnpuI2irmzaY9d6R
	Px8ttJLTMe3RM6oXmVDFh9I3y9tANp9RogMMN5Mylhs0XgT9F64WbHn8k+Jr9wQo+iVbWPXOsEi
	NrMW6/mPi831pQ==
X-Received: by 2002:a05:6122:1c07:b0:5ea:a1ad:6376 with SMTP id 71dfb90a1353d-5ec230a26b8mr4056026e0c.1.1793109461968;
        Tue, 27 Oct 2026 06:57:41 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec2343a846sm11578284e0c.10.2026.10.27.06.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:57:41 -0700 (PDT)
Date: Tue, 27 Oct 2026 10:57:29 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v8 0/2] riscv: pwm: sophgo: add pwm support for CV1800
Message-ID: <auCsaQt0kda01tZ4@hiagonb>
References: <20250509-pwm_sophgo-v8-0-cfaebeb8ee17@bootlin.com>
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-pwm_sophgo-v8-0-cfaebeb8ee17@bootlin.com>

Hello all,

On Fri, May 09, 2025 at 11:45:42AM +0200, Thomas Bonnefille wrote:
> The Sophgo CV1800 chip provides a set of four independent
> PWM channel outputs.
> This series adds PWM controller support for Sophgo cv1800.
> 
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> [Thomas since v8]
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

I see this series is abandoned. I worked on a patch to enable PWM for
cv1800b reusing pwm-sophgo-sg2042.c driver [1], as Uwe asked.

Is it ok if I take over this patch?

If yes, I will wait v7.4-rc1 and send the new series.

[1] https://github.com/hiagofranco/linux/tree/v7.3-milkv-duo-pwm

> ---
> Changes in v8:
> - Rewrote supported frequency
> - Hardcoded HLPERIOD_BASE and PERIDO_BASE
> - Change usage of update_bits to set/clear bits when needed
> - Rewrote construct of enablement of PWM
> - Fixed OE activation
> - Fixed hw state modification in case where pwm value cannot be reached
> - Renamed variables
> - Errors out for new cases
> - Reworded some comments
> 
> v7: https://lore.kernel.org/linux-pwm/20240501083242.773305-1-qiujingbao.dlmu@gmail.com/
> 
> Changes in v7:
> - add detailed Limitations
> - using BIT(n) instead BIT(0) << n
> - use 0 instead of disable macro
> - modify OE judgment criteria
> - add devm_regmap_init_mmio error message
> - delete unused variable
> 
> v6: https://lore.kernel.org/all/20240406063413.3334639-1-qiujingbao.dlmu@gmail.com/
> 
> Changes in v6:
> - delete the OE function because we plan to use the counter subsystem
>   instead of capture, so there is no need to reuse this code.
> - fix set polarity reverse error.
> 
> v5: https://lore.kernel.org/all/20240314100131.323540-1-qiujingbao.dlmu@gmail.com/
> 
> Changes in v5:
> - drop filename
> - fix macro
> - optimize cv1800_pwm_set_polarity()
> - optimize cv1800_pwm_set_oe()
> - add comment for cv1800_pwm_set_oe()
> - use ticks replace tem
> - fix duty_cycle larger than period_val
> - use devm_clk_rate_exclusive_get() replace
>   clk_rate_exclusive_get()
> - map linux polarity to register polarity 
> 
> v4: https://lore.kernel.org/all/20240304085933.1246964-1-qiujingbao.dlmu@gmail.com/
> 
> datasheet Link: https://github.com/milkv-duo/duo-files/blob/main/duo/datasheet/CV1800B-CV1801B-Preliminary-Datasheet-full-en.pdf
> page 614
> 
> Changes in v4:
> - use macro instead of npwm number
> - add support for polarity feature
> - add support for Output-Enable/OE feature
> 
> v3: https://lore.kernel.org/all/20240223082014.109385-1-qiujingbao.dlmu@gmail.com/
> 
> Changes in v3:
> - use 0x08 instead of macro
> - split if statements based on conditions
> - in order to round up, first calculate the
>   number of high-level cycles, then subtract
>   it from the PERIOD to obtain the number of HLPERIOD
> - use new pwmchip_alloc() API instead of old style
> 
> v2: https://lore.kernel.org/all/20240212121729.1086718-1-qiujingbao.dlmu@gmail.com/
> 
> Changes in v2:
> - drop full stop from subject
> - re-order maintainers and description
> - pass checkpatch.pl --strict
> - fix naming errors
> - add "Limitations" section
> - use a driver specific prefix for all defines
> - using bool instead u32 in cv1800_pwm_enable
> - check and set state->polarity
> - use mul_u64_u64_div_u64
> - use clk_rate_exclusive_get(), balance with clk_rate_exclusive_put()
> - using macro definitions instead of shift operations
> - remove shift operation on 0
> - use priv replace cv_pwm
> - hardcode npwm
> - set atomic to true
> - remove MODULE_ALIAS
> 
> v1: https://lore.kernel.org/all/20240207055856.672184-1-qiujingbao.dlmu@gmail.com/
> 
> ---
> Jingbao Qiu (2):
>       dt-bindings: pwm: sophgo: add pwm for Sophgo CV1800 series SoC
>       pwm: sophgo: add pwm support for Sophgo CV1800 SoC
> 
>  .../devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml |  45 ++++
>  drivers/pwm/Kconfig                                |  10 +
>  drivers/pwm/Makefile                               |   1 +
>  drivers/pwm/pwm-cv1800.c                           | 294 +++++++++++++++++++++
>  4 files changed, 350 insertions(+)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250407-pwm_sophgo-5032b3858c27
> 
> Best regards,
> -- 
> Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> 

Best regards,
-- 
Hiago
