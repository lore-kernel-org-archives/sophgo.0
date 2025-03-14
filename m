Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562BFD515
	for <sophgo@lists.linux.dev>; Fri, 14 Mar 2025 00:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741913510; cv=none; b=pOKmNdqi5PQSuqdDk9B+WePWa8h38Um2NpXIuLH+6i/TX7ETTBnDZBBNWV+aer073GkJD00779FgIUbBIog1/KfQgrEWR9QB099vGPrAkedN0pGlj6uTAdT0a0lrjWYt1kme1rKpGCnsRdDA/yCObpLvgYUTZ9mesOCmHQluc6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741913510; c=relaxed/simple;
	bh=qzWSYH/eCAhh5s2bxnUnC01sCxZd8637XHy49KgH0+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9mPFaBlzhb7xghbigQiZqwxPwIBF51wEFX5ganxkD9yFDG4XrkXCxb6y9DCqXMAtqJH8zOXVNUwB1y+DtvEXbrP8c41vl3mZ+F1pjmxCrI8xUa3I6zNczeW8skgTIeunqNGJos1xGYOvJ0xpLpS4k7+nCMxL1I83nCBQLWphKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoI2ys/G; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoI2ys/G"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8f916e75fso30984646d6.1
        for <sophgo@lists.linux.dev>; Thu, 13 Mar 2025 17:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741913507; x=1742518307; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7m/qzle7Z8SJPTCv9Yq7wZFdYLpzPxwHjo/0UoVX67k=;
        b=BoI2ys/GnG19w288kkQZslOhht/8rUzAyTc0NjfEe12Px+/3VSF+31d9bOu5dzk8XR
         s3BDmu5nP00Lvz8PUSdwhqipoUNxmc8QPWqm1aSyBoUA9bMDUxvJRl6tmJS7bUzQrGOE
         5P9U+dXLUCfeYWMMaz/bhXQg1VcB05EWo8zyJaUOg1exEaX7OohwgSnwl9lq/K9fMS6u
         cRoQ2LFhLvm57qZBz1d3a2OV3VmCJqQRD4xiz7XOmHkQr0aLnodayH6rwxTwHne3bRND
         P7woVBNrAHKw4MlSy6inAwv+Ahk3NdYi9S5QeNfHGXrWWqRn0eUd1gSnEiwpOswnwrh3
         RVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741913507; x=1742518307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7m/qzle7Z8SJPTCv9Yq7wZFdYLpzPxwHjo/0UoVX67k=;
        b=sXoLcFlVIBeMNGYjX43pOcVkUfQc6JLNFgoC52xE1DbMzWqm7O17wQ0FYViCa6GrrI
         BC+EsnZQqpYUlh0kNC1NdBMdqgZSk/lNuCaPy6cBIwrq4bmSjgYuC2UeC78rEp8u9FWt
         BNN52DrGdPSLSgkpgutcyr0zMguV3C1cezJNN69NQ+lLYWNiROY+ECO8vg8/oj+U5bS0
         6Fziwl1HQM/zq+L2qlbZ6PYxRlVUMbD7vh0eC2Z1PPy5sa9rre+2TVLVkVqLjpmt2eLr
         xXsZKBEcG8KE70thVfXnx8izkVTofvJMcux71J1dA1U0sRELWmxiCDj2MjES3sk0FyIH
         6SxA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ5DaBGOEJWzuPOogjeKOdEYfavARxAR0Qc2Fn4the/YM88nO/VZzphNIgs2WxgWgXybmh1ak=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRSxTRw7RhRMS5A/69Gc8b4DlqQZj4jlO8d6F6O6lKLz2YJAo6
	pi5kcyVY2EI9QlbsKxqTZq7ZBSZllebrMaYmKt0d+CwXGW7VuATa
X-Gm-Gg: ASbGnctPHQ+xT1aTMmDgNJg2EDlCQLHDmITuRsrTtzBFARov0G0e6SERiFeDU0gxbrr
	gEMHCSqXtEaTXMr1SyCqoaxbG0cU6ilZGqDdAk/R48eN4163gElLJZ5DOeOsLcCSOI16wPQr9EB
	58chGoDBEAP62svkFysR059DEQjlk98B0EGV/g0NfeOmG0GeNVo/36ccTStmJcg2rDys7/JRzML
	DRhYmwdzNM1lC5mMjRhj3iL0uXgo1axc+Z3G84hTHtkC8Ht/mB4LUvJzDI6kUyljVVBhUUcegNF
	ZLryGBWSO/O9926ksJYS
X-Google-Smtp-Source: AGHT+IH0tb1brEibUfzMswXbEBGec7NTj4DU78qIWu+exAe9oKFasFAqIPbncsP7Fm+lcRKkKK2XSA==
X-Received: by 2002:a05:622a:612:b0:476:add4:d2cd with SMTP id d75a77b69052e-476ba88ea20mr65691781cf.1.1741913507124;
        Thu, 13 Mar 2025 17:51:47 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-476bb825396sm15373441cf.69.2025.03.13.17.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 17:51:46 -0700 (PDT)
Date: Fri, 14 Mar 2025 08:51:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Yangyu Chen <cyy@cyyself.name>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
Message-ID: <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
 <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309202629.3516822-3-alexander.sverdlin@gmail.com>

On Sun, Mar 09, 2025 at 09:26:24PM +0100, Alexander Sverdlin wrote:
> Add driver for Sophgo CV1800 series SoC RTC subsystem. The RTC module
> comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state
> machine to control chip power-on, power-off and reset. Furthermore, the
> 8051 subsystem is located within RTCSYS including associated SRAM block.
> 
> This patch only populates RTC sub-device.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v13:
> - Moved the driver from MFD into SOC subsystem
> - Dropped unused "cv1800_rtcsys_rtc_subdev"
> v12:
> - new patch
> 
>  MAINTAINERS                        |  1 +
>  drivers/soc/Kconfig                |  1 +
>  drivers/soc/Makefile               |  1 +
>  drivers/soc/sophgo/Kconfig         | 24 ++++++++++++
>  drivers/soc/sophgo/Makefile        |  3 ++
>  drivers/soc/sophgo/cv1800-rtcsys.c | 63 ++++++++++++++++++++++++++++++
>  6 files changed, 93 insertions(+)
>  create mode 100644 drivers/soc/sophgo/Kconfig
>  create mode 100644 drivers/soc/sophgo/Makefile
>  create mode 100644 drivers/soc/sophgo/cv1800-rtcsys.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3eee238c2ea2..ac15e448fffb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22354,6 +22354,7 @@ L:	sophgo@lists.linux.dev
>  W:	https://github.com/sophgo/linux/wiki
>  T:	git https://github.com/sophgo/linux.git
>  S:	Maintained

> +F:	drivers/soc/sophgo/cv1800-rtcsys.c

Please change to the drivers/soc/sophgo/.
We should maintain all files under this.

>  N:	sophgo
>  K:	sophgo
>  
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index 6a8daeb8c4b9..11e2383c0654 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -23,6 +23,7 @@ source "drivers/soc/qcom/Kconfig"
>  source "drivers/soc/renesas/Kconfig"
>  source "drivers/soc/rockchip/Kconfig"
>  source "drivers/soc/samsung/Kconfig"
> +source "drivers/soc/sophgo/Kconfig"
>  source "drivers/soc/sunxi/Kconfig"
>  source "drivers/soc/tegra/Kconfig"
>  source "drivers/soc/ti/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index 2037a8695cb2..0381a0abdec8 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -29,6 +29,7 @@ obj-y				+= qcom/
>  obj-y				+= renesas/
>  obj-y				+= rockchip/
>  obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
> +obj-y				+= sophgo/
>  obj-y				+= sunxi/
>  obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
>  obj-y				+= ti/
> diff --git a/drivers/soc/sophgo/Kconfig b/drivers/soc/sophgo/Kconfig
> new file mode 100644
> index 000000000000..e50666e423a9
> --- /dev/null
> +++ b/drivers/soc/sophgo/Kconfig
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Sophgo/Cvitek SoC drivers
> +#
> +
> +if ARCH_SOPHGO || COMPILE_TEST

> +menu "Sophgo/Cvitek SoC drivers"

No Cvitek, only left Sophgo here.

> +
> +config SOPHGO_CV1800_RTCSYS
> +	tristate "Sophgo CV1800 RTC MFD"

> +	default y if COMPILE_TEST

I do not think it is necessary.

> +	select MFD_CORE
> +	help
> +	  If you say yes here you get support the RTC MFD driver for Sophgo
> +	  CV1800 series SoC. The RTC module comprises a 32kHz oscillator,
> +	  Power-on-Reset (PoR) sub-module, HW state machine to control chip
> +	  power-on, power-off and reset. Furthermore, the 8051 subsystem is
> +	  located within RTCSYS including associated SRAM block.
> +
> +	  This driver can also be built as a module. If so, the module will be
> +	  called cv1800-rtcsys.
> +
> +endmenu
> +endif
> diff --git a/drivers/soc/sophgo/Makefile b/drivers/soc/sophgo/Makefile
> new file mode 100644
> index 000000000000..8f22b4e79311
> --- /dev/null
> +++ b/drivers/soc/sophgo/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_SOPHGO_CV1800_RTCSYS)	+= cv1800-rtcsys.o
> diff --git a/drivers/soc/sophgo/cv1800-rtcsys.c b/drivers/soc/sophgo/cv1800-rtcsys.c
> new file mode 100644
> index 000000000000..cb271f02afcc
> --- /dev/null
> +++ b/drivers/soc/sophgo/cv1800-rtcsys.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for Sophgo CV1800 series SoC RTC subsystem
> + *
> + * The RTC module comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module,
> + * HW state machine to control chip power-on, power-off and reset. Furthermore,
> + * the 8051 subsystem is located within RTCSYS including associated SRAM block.
> + *
> + * Copyright (C) 2025 Alexander Sverdlin <alexander.sverdlin@gmail.com>
> + *
> + */
> +
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/property.h>
> +
> +static struct resource cv1800_rtcsys_irq_resources[] = {
> +	DEFINE_RES_IRQ_NAMED(0, "alarm"),
> +};
> +
> +static const struct mfd_cell cv1800_rtcsys_subdev[] = {
> +	{

> +		.name = "cv1800-rtc",

Make this a specifc one, like "sophgo,cv1800b-rtc"

> +		.num_resources = 1,
> +		.resources = &cv1800_rtcsys_irq_resources[0],
> +	},
> +};
> +
> +static int cv1800_rtcsys_probe(struct platform_device *pdev)
> +{
> +	int irq;
> +
> +	irq = platform_get_irq_byname(pdev, "alarm");
> +	if (irq < 0)
> +		return irq;
> +	cv1800_rtcsys_irq_resources[0].start = irq;
> +	cv1800_rtcsys_irq_resources[0].end = irq;
> +
> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +				    cv1800_rtcsys_subdev,
> +				    ARRAY_SIZE(cv1800_rtcsys_subdev),
> +				    NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id cv1800_rtcsys_of_match[] = {
> +	{ .compatible = "sophgo,cv1800b-rtc" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, cv1800_rtcsys_of_match);
> +
> +static struct platform_driver cv1800_rtcsys_mfd = {
> +	.probe	= cv1800_rtcsys_probe,
> +	.driver	= {
> +		.name		= "cv1800_rtcsys",
> +		.of_match_table	= cv1800_rtcsys_of_match,
> +	},
> +};
> +module_platform_driver(cv1800_rtcsys_mfd);
> +
> +MODULE_AUTHOR("Alexander Sverdlin <alexander.sverdlin@gmail.com>");
> +MODULE_DESCRIPTION("Sophgo CV1800 series SoC RTC subsystem driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.48.1
> 
