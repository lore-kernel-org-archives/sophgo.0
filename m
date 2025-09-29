Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9722690D1
	for <sophgo@lists.linux.dev>; Mon, 29 Sep 2025 23:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759190107; cv=none; b=aJuaOzQlaEhw1HewLHLoJBlVuN7d6Ah/ieC4yvNasL+IEC9CD286tfRhV+fwSl+PGyescGemLGgNHa3U9jqG4qhHIs00vE+g7miI7CiRniBWSd7xxsCwCyaypk/zi7J9KHYGSCCXyN13UYr1o0HEaLf/o+Wcl7H7gKgITyjZh0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759190107; c=relaxed/simple;
	bh=yHm8XI5gruwYUfE+vygBhATsguf1WxH7EgeqwJr3N2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+mHnBAuxNuNj/YMcfC+gF0rZ8a0cyMg5EwKbwHtdc19B4iGOBUAy7VLNDVDa/Z7w0UKf2ZxcdLOsSJM5jioDUSxpcTKOvGZSQMGRtT8N2XULmVOIat/80n+uPB0nytMTI6mhPZLbBJj0ltNA3Xk6KcTzOHXXFm9zCOdMkuGqOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTNARBAb; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTNARBAb"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77f1f29a551so7032610b3a.3
        for <sophgo@lists.linux.dev>; Mon, 29 Sep 2025 16:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759190105; x=1759794905; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YesvkbeRlI0InhN5JBwA3kaIUEivhW2AvYJVPyt7JxY=;
        b=GTNARBAbZpFwcVwdO7jpC8lI1UOFixuf3K0Enp2sjn7cDqb6tPYPrJGhECiltMlYWZ
         Al3py74Rq/Awa7l3lK/f5AYjVOdLx3D7sXY7Laya6Yjf6KSRRnBNhvvYxR4/cX3d9gtr
         mpfwLPl7XT3rzHuQ+3QcMvZZ0MZbsqTqXyg6XsMOg+olxJSHRalfQaToQ8M/Vfx48K5A
         NzrAc0OBDi96D7pYr4zFWXM2ucuWc7qHR481l3jCk6cK6DUStoTYOu03u5O9m7sJwRmu
         5A9hqxq/GtR4kZ/+xQ62zPgwxHXiYN7KdturuEwHRTfjsS2JrTutvSKXEf7aD15bB6/R
         Rnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759190105; x=1759794905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YesvkbeRlI0InhN5JBwA3kaIUEivhW2AvYJVPyt7JxY=;
        b=g91u+lQgDBQLeqbvy6tCffPlDmRBCl1lN150SFiZ97EPE2WL9tboI8mGB7d3XKhI50
         RzqcgvTr9dbJp6dN8IQoxFacDf0Tl8qR0YVJBHYmTLpAy8oCeAjfdYBCrEgdjc5X4xyN
         ZokeKJlSLadlT5VvIDjaeS4Q9Whw7Zml+cq36IuSedX4BG9ijpS2MCCf7eg3rHtL0nXS
         ZbI57mwDPSJtCtHy3/SD+1QYD4qX3ub6vyA4LWZdcZYVvrlnFyU7oV/s2dOHNm191Dhf
         0b7Vt2sHU5QmlJQeSPzG86pBv+3y6vmN42+tH43UeKjj7s/FAgxfwFGSdeY2+M9ZsYej
         Jg/A==
X-Forwarded-Encrypted: i=1; AJvYcCVw3HiDn8n0/9Lu73lyeYEebiKqI3L3u+1w9iKyWMf60cDrsj6fmBK89h+I5HchvTyUmamJPww=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBIA1FZrrAKu43jxU2FV7Y50zbSyVlkyB2PBkPi6giHp7CnDvu
	ln9c92ladSX7ho0d18xZrUJ9AeXBCRLENVpE1o1MEsm0g5ChWZsqfg1r
X-Gm-Gg: ASbGnctIjmOE2t5Y/QOquxcI+ePi5xYKSRERs2+SX/SUm8P9qQP95mGGW3botSOuUKZ
	e+mTOw8PkerjJNXhqesFZ3XhGtRCyKq2ogVRp7OdaaMr9UJzooOzsRt2tIbAjvYDvPim7DiCODx
	2s6VoEN/iyicEYoRR4AbXrAKhzkj+8PuWSXA/JBDd94cWwhWRZuxEpki4NKa6m/gP05nkZQ0lW8
	MEYnNPVctLt+PBSu9ujy3leeajGEiUECVqK8oOBCQ9qO0RsbWAHQYXNsOOvLid/3pVhoOvHXXCR
	348LcHoHg6SqrsGM6XWjUvJiP2Tw8LV9/PR7ISZDsYdPCbZ6KxpoZ8X7P4qkPS3IwD2Cc4ale4A
	qJv4LiiZJchFZe1M2jL8pTIoaouEVhrXWk0zbcMpYVXJbbKwrVs1p4N/r
X-Google-Smtp-Source: AGHT+IF0yLjZKmx74zx7YOPFw6nZf2/BVooPN9TnbQy8BPac/NSkrGIRLd/u/AxqgakhTmso8szx5w==
X-Received: by 2002:a05:6a00:1399:b0:781:b59c:b0cb with SMTP id d2e1a72fcca58-781b59cb1e1mr10242245b3a.6.1759190105342;
        Mon, 29 Sep 2025 16:55:05 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-78102c1203fsm12244556b3a.92.2025.09.29.16.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 16:55:04 -0700 (PDT)
Date: Tue, 30 Sep 2025 07:54:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joshua Milas <josh.milas@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com, 
	inochiama@gmail.com, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, 
	thomas.bonnefille@bootlin.com, chao.wei@sophgo.com
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <nkzpfylhxyqf5u3bjlokhe4udgcxohbaanhwuofjzatan3iwio@45ljfquf5sui>
References: <20250927173619.89768-1-josh.milas@gmail.com>
 <20250927173619.89768-3-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250927173619.89768-3-josh.milas@gmail.com>

On Sat, Sep 27, 2025 at 01:36:19PM -0400, Joshua Milas wrote:
> This adds initial arm64 support for the Milk-V Duo S board
> (https://milkv.io/duo-s), enabling the serial port and sdhci0,
> making it possible to boot Linux to the command line.
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  arch/arm64/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 88 +++++++++++++++++++
>  2 files changed, 89 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> 
> diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
> index 94f52cd7d994..68aace728223 100644
> --- a/arch/arm64/boot/dts/sophgo/Makefile
> +++ b/arch/arm64/boot/dts/sophgo/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> new file mode 100644
> index 000000000000..94cf89d423de
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
> +#include "sg2000.dtsi"
> +
> +/ {
> +	model = "Milk-V DuoS";
> +	compatible = "milkv,duo-s", "sophgo,sg2000";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		mmc0 = &sdhci0;
> +	};

It is better for adding gpio and other serial there?

> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +

> +&pinctrl {
> +	sdhci0_cfg: sdhci0-cfg {
> +		sdhci0-cd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-clk-pins {
> +			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <16100>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-cmd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-data-pins {
> +			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
> +				 <PINMUX(PIN_SD0_D1, 0)>,
> +				 <PINMUX(PIN_SD0_D2, 0)>,
> +				 <PINMUX(PIN_SD0_D3, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +
> +	uart0_cfg: uart0-cfg {
> +		uart0-pins {
> +			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> +				 <PINMUX(PIN_UART0_RX, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +};

Small suggestion: please ensure the pinctrl is correct, different
board may require different configuration.

> +
> +&uart0 {
> +	pinctrl-0 = <&uart0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +	/delete-property/ resets;
> +};
> +
> +&sdhci0 {
> +	bus-width = <4>;
> +	no-1-8-v;
> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +	pinctrl-0 = <&sdhci0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> -- 
> 2.51.0
> 

I suggest adding all the support devices instead of a minimum one.
Like ethernet, wifi, bluetooth.
In the next cycle, there should be a patch for adding USB device node,
as the driver is already merged. I also hope you can take it.

Regards,
Inochi
