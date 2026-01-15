Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11EE1D7E42
	for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 01:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768441956; cv=none; b=ZdFRre0+bLT/uyE82vAopvWdyfeK3N1l1QIX1hrD24OnZINtuoIFwx8sUbzOYleeXmODOPAQ+s4qtZVUjFftJU2QHwEvY+4xc+hS6sV9ZYT/HA7LRyNlVYcrR2FrJxobyMHrvf08zJMjHAQVPvmuf3XYdzbySweIR/dkOsDuov0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768441956; c=relaxed/simple;
	bh=JsUIR/1OXo+BahiQ+lgaQs8O0CEy9G4etSPFreXSyck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qaCw60vXmXLIfivGBjmLqRB+DXpXIeyAG6lhV5KZWYRAe8Y19Q9Xap0JtnazmgolFVtw0Lv/vv3d9l49w1+PSESR3gNJwuxZSvv6Y2O4A2NEhcyYkwIbDrO407OvGjaTSsDAUNQsQJK7FXpO2s/y27OdVhD7LGLBwxuMSKqbr2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNjV3Can; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNjV3Can"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12339e2e2c1so275934c88.1
        for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 17:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768441953; x=1769046753; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eaGsIuvEkZT/0ZxJsJ40cQ270Lj1PGkWPT1RajGBoys=;
        b=cNjV3Can2nhcgX3G7EBpRn4qkj9jagu93YR4Vki6369f+d5qTEhi4gglYVZ36U4Ier
         61V0anFsGvTtACWIcy7r1/b6GZuJjNldtTyaNB1XcoJCzLlqqlfF0aOTXTeKJWM85ywG
         hebINkuj4drR8ydM/SZGSeKPqJHRjmEMRFmqfhSow8UeSfXdG0z8yO/Ijyx7coKe0Y5F
         1S598239q6oprg+Fu59Ibzgk700cguLK2oT+jAbzDZaSLMRSOHB+JzU8Zfzsk+Kk43jR
         C6pQRiwbcZZ/H41jiI09y48RVZLNURy/wdfxltOClu0D/lUPGEASF+mDYewQBAnR+G1x
         3FwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768441953; x=1769046753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaGsIuvEkZT/0ZxJsJ40cQ270Lj1PGkWPT1RajGBoys=;
        b=wxJWgJDrMF4WwYx6Bugvfr7GUyVbfylulPzJmbTa7TfvDyv8Ue1/JVrNj9mVtRs0gx
         hgCzA1GUhLSMCyq///m9a+2fslaAbnqgV7BefnQkAuXInEJmniUuCbHhTvQFjPhb9PKN
         r8V5BhwgN/PesZqiHN0Fbpd2X5VSYDkVnYzMKlo3tRuNQErNy7aF6mK4h6H8Lq/UFlw2
         0e/y28AT2FD8uxHC1QJPN1IR/pmDAD5bVnF+WlleRidsJ/R2856INnOg4qPmAtOjCdzZ
         2TLeNBF5NnMfJaRx3gajC0PaThTQqqRbpf1InerOwf88W5fB4rlw+SFsiqe5orv3VWep
         +8Sg==
X-Forwarded-Encrypted: i=1; AJvYcCU6x8w3dYkuLGiPQy4GCf+hHMGYm+yaWUlqxWyR0sr++ebLhizaqg8qehOLAWMnjcfhX2ilk6s=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSMZiSu7wADpQUhPUSTxbs7F/btqshaGrh+8J31ZrBfHv5yaRH
	xZwlRDZ4tk6Ht5kkiyRWnivfjYO56mfAg/LcLasF4iVAhdjCXDGkB90t
X-Gm-Gg: AY/fxX5f7IpooRc5S8LXd34fYbjqV1drRDay7vx4Wbn82nOuORmGtnaQt3evDlJmw4+
	5kToQIMhvvYchxIc85faeHX2dtz/UfR7L0KcYYc0dCB4ZCrKYEhSF1iEfP44O99D93yxDB2Rr9w
	df/NkHzduMjz2auTVD0Sp0dhluLKEydijqhasrO2UBMMc+TzyvU6NyU0QEDdhA9G3t6R/WYJrY3
	nJOcJcryxOShToYmJ1pnbykDrWXrHZQ7F1jZ6/qQ0qBgMFuW3p+1n5Qam4rXm58WykWeAZ62pEx
	oShuG/8mKHBzrZdq6N4stcvVzgi/qwkUmpB4vw9mVKjh0mNRAkpJnewvRFcKZyzm8/q2L8nyj6s
	mPGDBEP6ueLCLEJRJk4XpujXSTQQJGdX2G+8qTp74j+rvWqtXAJwF2KBFuniwwTbzIiOGX5LGXL
	bUmyMYXd0Ovw==
X-Received: by 2002:a05:7022:6708:b0:11b:9386:a38f with SMTP id a92af1059eb24-1233d10f432mr1505698c88.22.1768441952848;
        Wed, 14 Jan 2026 17:52:32 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c246sm32727140c88.11.2026.01.14.17.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 17:52:32 -0800 (PST)
Date: Thu, 15 Jan 2026 09:52:28 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 03/11] pinctrl: sophgo: Cleanup header includes
Message-ID: <aWhIOYIWnJy7mhkc@inochi.infowork>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-3-a14572685cd3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-3-a14572685cd3@oss.qualcomm.com>

On Wed, Jan 14, 2026 at 04:30:04PM +0100, Krzysztof Kozlowski wrote:
> Remove unused includes from internal headers, because they do not have
> following: bit manipulations, mutexes, spinlocks and struct devices.
> These headers are included by actual C files, which seem to have all
> necessary includes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/sophgo/pinctrl-cv18xx.h | 4 ----
>  drivers/pinctrl/sophgo/pinctrl-sg2042.h | 6 ------
>  2 files changed, 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
> index 759c0e604acf..973ab9a38fcf 100644
> --- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
> +++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
> @@ -6,11 +6,7 @@
>  #ifndef _PINCTRL_SOPHGO_CV18XX_H
>  #define _PINCTRL_SOPHGO_CV18XX_H
>  
> -#include <linux/bits.h>
>  #include <linux/bitfield.h>
> -#include <linux/mutex.h>
> -#include <linux/spinlock.h>
> -#include <linux/platform_device.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinconf.h>
>  
> diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.h b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
> index d481973fcf97..1a2b00dde1fa 100644
> --- a/drivers/pinctrl/sophgo/pinctrl-sg2042.h
> +++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
> @@ -6,12 +6,6 @@
>  #ifndef _PINCTRL_SOPHGO_SG2042_H
>  #define _PINCTRL_SOPHGO_SG2042_H
>  
> -#include <linux/bits.h>
> -#include <linux/bitfield.h>
> -#include <linux/device.h>
> -#include <linux/mutex.h>
> -#include <linux/spinlock.h>
> -#include <linux/platform_device.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinconf.h>
>  
> 
> -- 
> 2.51.0
> 

Thanks.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Regards,
Inochi
