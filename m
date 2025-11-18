Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BA126738B
	for <sophgo@lists.linux.dev>; Tue, 18 Nov 2025 09:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763459366; cv=none; b=YK+bzMxJXbPf8XQUyTjyaGYlE44UUp1mqO4MoqZ4u0dvatmL73Wq8TzH5Efe/fnhIaPLBRQg3zsYly0MBRVuu6eGQXsuB7HxeZIqsTGXpuqkoaUP9ib4HbD0/bByFNNkYXXEbPtvnYi6OiJdABzPhjXGWMBsvsvhZ2ea4/IukOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763459366; c=relaxed/simple;
	bh=xSwkm1Pq0HLSwUJEdhhUOB0YJjcM1IKQQUqnrAAZbOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNnA7tsVoMVAOxAz8QGttxaWw81QMMQow+OxBkPGZwbv8t/+1YwYMmFKSVidekN2/DMgIrvdhqqT+tkHP0zgEoTeC9l9kC0vlc/eTtH8tXR0GfisjFJcOmdP8OwVeFM1B+ZtAv7RSdYsXKSsMjhHN8Rlx3fxQ4wTGlM52d+em/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcORwrS9; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcORwrS9"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b9f1d0126e6so3388001a12.1
        for <sophgo@lists.linux.dev>; Tue, 18 Nov 2025 01:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763459364; x=1764064164; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xzCBMigVD0krKuQCjmEzo9fFKxVpsyvZJvTxuR6DkP0=;
        b=JcORwrS9/v2uhNLfsEUD3KFX80G9MZRL9VuZTV6laWIJgnIDKjL1UyMFHJ5HwPoLBg
         W12KD2Wk/m6cAEc1cJtsXpB1WX7eFOF8nliM+gnbeEYJXiFuIoA0Ap5YCP8lHrJvphfR
         qlKzBcZaSrlt4vMmtOsOafGspgHTed9/1iQzwRi3+mhWKW3kWfiJgek8+0Zh0V4DMOEG
         m0sG3TYcSMXMmHjbuqQkx4RFvmnhloscc2ZxAfVIFrBXRCwnHYGwmtJC5Vk7p3+ZWVby
         a3+L0/WVFjzYFqkG/luzPEPI8J8fdWPpcHMiwLHrghjuW9gkYn6t/32D5NfCPQ7QylZ7
         GFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763459364; x=1764064164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xzCBMigVD0krKuQCjmEzo9fFKxVpsyvZJvTxuR6DkP0=;
        b=Z1BqHQQevwwVfpPbeQMoFe10fv7yHRRkI/EorwLHbOtSVx4zwPDpizd0Jql3qlHa9f
         UtvDbIFyN7Fj4HPnwuLlvxfXgeemdlaX1zF1EJEufaEaK3F4dNomaIFpf+rEUr5GJ4zd
         yHIkEuLCkSaUAOX0ZqHVXqYxAQhk9VMNkKdY67VL3srBVnaoshxBfI4U0Fr91l1DevHG
         7phkA20rKp+TCKYRC8HN7nqLBzKo5PL6aKtZb2poVLKYKi6L3Bz1YRdBedrVQEvw02Lm
         r1rbKVQF44Rc+ej6TiBeJhE5HMILG4b31Z/aOpxndiAGsF3nOUhtjVB1gD8epiYtIJVs
         QN1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWeAq5gDZQ8Z3fUqsaH8xFGdkw8ODVeO967uXhH469D07c56TcQgraNRX0q9MCQHGIE4Vxc8iQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhrQzSEFZfgEWRcdOxRaZC9zWc8TI2bAiDQu4w+E4wr51gn/h0
	7AyYyo6M9F4qHWBM276LNiV6NRldNDlTy72f12L2gwCvqTHiOHhr5GbV
X-Gm-Gg: ASbGncvCJ//M49zbNe0t6MvbpsikEK8lXdAOQbq3+MmhImyS5EJdPYrNBkbO5JI/9BH
	dfrgTyL9DLfHbeUHu/pbbj9b+lSKzKYczwHKFBg0CCCTWLgIyfZftm43MyYU1D4ju1dtyKSnppn
	oPUKeYCJt2KOWVVQ0Gwwiqzv7Rdj9UWI2twKxUwYMEiQyTnc1zFJnG0PXmlNj5wPJIZ8vPxvB8V
	W+STdaabHEpvOU7ZqoWrhFk5xBgVAO70bicxv0DCmO0uz+e2W7Jdv4DUq6aOqbrnDGdJ4nXB34w
	EjLJm590vGTKA+8Gz/NdCedQolLrv9eD4ED/Rm7EAAKYeU86I74RlxfSTtWQ9mJ1p/VH38nhsBg
	xvXWZc+PcZuElerWtyJZaD9kHvcwiLcQP2qa2W/49x7TYDaTSmwDyEgpWCUBdGZd7kghv1NJC0v
	TNagW+omkUVA==
X-Google-Smtp-Source: AGHT+IGX2vg9yS5PesxmtNKzfyWKsQEYzhdmMoZFsVnrN9bTUhkb0gAf4+KyOAW00IAt5KKjwTpS/A==
X-Received: by 2002:a05:701a:ca86:b0:11b:9386:a38e with SMTP id a92af1059eb24-11c74fb2245mr850013c88.21.1763459363884;
        Tue, 18 Nov 2025 01:49:23 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b06088625sm59877211c88.8.2025.11.18.01.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 01:49:23 -0800 (PST)
Date: Tue, 18 Nov 2025 17:48:50 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-phy@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v1 1/1] phy: sophgo: Remove unused of_gpio.h
Message-ID: <qyvtgvvvq6txgliwm64bapal3e7ehjc46fdjm3fomf6tp5gwkh@qrwyzwgvkfg5>
References: <20251112085220.1452530-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112085220.1452530-1-andriy.shevchenko@linux.intel.com>

On Wed, Nov 12, 2025 at 09:52:20AM +0100, Andy Shevchenko wrote:
> of_gpio.h is deprecated and subject to remove.
> The driver doesn't use it, simply remove the unused header.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/phy/sophgo/phy-cv1800-usb2.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/phy/sophgo/phy-cv1800-usb2.c b/drivers/phy/sophgo/phy-cv1800-usb2.c
> index 64f8e37b4b52..6fe846534e9c 100644
> --- a/drivers/phy/sophgo/phy-cv1800-usb2.c
> +++ b/drivers/phy/sophgo/phy-cv1800-usb2.c
> @@ -11,7 +11,6 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_gpio.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
>  #include <linux/regmap.h>
> -- 
> 2.50.1
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

LGTM

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
