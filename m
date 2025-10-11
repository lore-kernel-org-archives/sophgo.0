Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A302AEE4
	for <sophgo@lists.linux.dev>; Sat, 11 Oct 2025 01:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760147893; cv=none; b=lFJTdQ97o8Bcck3P8k6Ljks+B6da12mkbLDxnYgaiAveQav31SOaCLF5ktROe7wYqdw+zZDW8+wopeaoXkC6s/GIIoJ7YjZodJeejGhgfOJ5fS2UpyxEkJ1K5UFZ3AXS/ug7aVHXDitmc9HRFM8Lp+9fvyiRQ9T4SauAWolVtrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760147893; c=relaxed/simple;
	bh=xEjenCizW/1lsmBfGOz71idCIRTTM8vnk5qmRJwsKxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbTdiW+68Ywwfj6L6pN4ZvQaEBb5FB3gdGBP9Zg4yeCdHAJfQ+Ab5/nPgbm19a2MTwIyp93C+0rPvu41cGvR1S5rXuXt9EB11dmQAxdlbUHjMaKtyCDLLatTYxd/DJJxXvLYXvNpgZHWUIrVgENLEDsCtIUfMkcoI6sT9xsZ7w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZXwbC8n; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZXwbC8n"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-339e71ccf48so3733448a91.3
        for <sophgo@lists.linux.dev>; Fri, 10 Oct 2025 18:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760147889; x=1760752689; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d6HW8g44DEIQGTTdP8+kouoeqn7L/RqaKDm2Xldyjzc=;
        b=OZXwbC8n0Vwa8yp2bpD1aegFj3ovhgvmb3i4046vKqB3shNEaRDe58JQniFCmaiuw+
         D0QH+j0qKZlXhvWjpq7FRB0VsibV9a/0FnTFJ58bmwuATByvbt9rt2GUGFGLLanUvluR
         mrgLFQ8fKQci7C4mDmHi8B0frsLLY26mtRbyPXeiT3SqvZ0oU6fxLAjY65rqJ7z6h5MG
         K35r8B/K4832MA8oUgx+2XguD9CZ3eTdPk0ycwk0q5HlLOli4kminyK0rjhpAnSP3DRG
         dV/Hay3EdpOJAI+X00QMldPvSxy6AZA54v8GB9sS+qswyWOjTzlx27VllsEWwOjEt0j+
         2dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760147889; x=1760752689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6HW8g44DEIQGTTdP8+kouoeqn7L/RqaKDm2Xldyjzc=;
        b=TbOGhUMzfF7vTLQj2QDCUa9vNNOFRHAy/2qZspYXXJOPXYBvuPgp5dr1gxqUV1BBp/
         suSo/Vr1QwPoYzMahzik7tRtuXwf3Gs2epKBLIiap7wbmxWAA1Mas+VaZ2A5Qvy8+csR
         hEjHKo6YIP/A2wxttpks8QWSapIL7G87EhZwXHX6vb7djWRvijN8FnoW28F2YUV3+P/a
         ou/D/ChomKM3KYE0R2c07mkXhDdQOUtGNNyhdRzBPK9mvYeCxYEraQ9XZK4YxiDJvocg
         snQ503rJ9eP1e3qfbjiuI+5iwEoC+IDT1ADeHmEak6u+74HT2GdJG36oXm90pyjh6erV
         h/bw==
X-Forwarded-Encrypted: i=1; AJvYcCWYuOjg/nL/G/cLN+zTG4jERRjUjfDoh9g0uuMKKfv5rKs/AjUeKol9PnHeUdOvpsR7BrYYWtY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjMB5KYaShcugENLg+AP/HKuolirIuyF3c1VZ+QZ5ljfc2Mh/c
	8Ju8vgF4l3+6Uwe5xBzDHa/bIr5FvkammaHhQNwz/V/4vz4iOFfERlrI
X-Gm-Gg: ASbGncuuu4SW/rGWO43z7qeflZiejDdxBZvdOg2zINpzAhMvArHnjPPZQlNVIW/DhGF
	33vWcWfpsqcNTkkxmtJ5X0JuchrCBdFGukQCabvf6QFvImTAaWCLMN4lqVpEohe9JPjUz4ihDiZ
	SOB42MiHSQ/h5E1ge9IjuXINDMun0h0d4cHK95ahFIopTZmydmJGg/OQ5gcb3dquhHkXrVmds4q
	EotnTqWdKsULTP6IqPrXk/mhd063KD0qs6lCGysgg5ulYZxryXLEJoHX8OL/NLt5nWIJwjtrcyu
	qJk24/q/uAMfUIqexKG17aefVFt4oQrOhFu5XLtWW3irTPMhgtMfYmpB3MPQ+MsIma9mna0V58y
	/kBBBUV+UEqb0ySytBBz8OUW/VHto/vFK1MduAiRxq3/spPLvHA8=
X-Google-Smtp-Source: AGHT+IFJ8EMUE7lChv4D1+KCffDibjFkTRRBWFD6F1X6h5F7fXOSWuNLu7wYFFrVDYNpkYrbaVyViQ==
X-Received: by 2002:a17:902:ccc4:b0:24c:e6fa:2a38 with SMTP id d9443c01a7336-2902739ad2emr176670255ad.25.1760147889100;
        Fri, 10 Oct 2025 18:58:09 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-29034de6c88sm70267895ad.17.2025.10.10.18.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 18:58:08 -0700 (PDT)
Date: Sat, 11 Oct 2025 09:57:26 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joshua Milas <josh.milas@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com, 
	inochiama@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, alexander.sverdlin@gmail.com, 
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com, chao.wei@sophgo.com, 
	liujingqi@lanxincomputing.com
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] riscv64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <jpqvq6vr7ffibgshnqjxxfchdny5f2o4alyzqjort37ogo355j@n3pybh3hj565>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-4-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011014811.28521-4-josh.milas@gmail.com>

On Fri, Oct 10, 2025 at 09:48:11PM -0400, Joshua Milas wrote:
> This adds initial riscv support for the Milk-V Duo S board
> [1] making it possible to boot Linux to the command line.
> 
> Link: https://milkv.io/duo-s [1]
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/Makefile           |   1 +
>  .../boot/dts/sophgo/cv1812h-milkv-duo-s.dts   | 110 ++++++++++++++++++
>  2 files changed, 111 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts
> 
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 6f65526d4193..49d6ae4724ea 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-milkv-duo-s.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
> diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts
> new file mode 100644
> index 000000000000..2ab46ec1fc0e
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts
> @@ -0,0 +1,110 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/pinctrl/pinctrl-cv1812h.h>

> +#include "cv1812h.dtsi"

SG2000 is different with CV1812H, add a new sg2000.dtsi instead.

Regards,
Inochi

> +
> +/ {
> +	model = "Milk-V Duo S";
> +	compatible = "milkv,duo-s", "sophgo,cv1812h";
> +
> +	aliases {
> +		mmc0 = &sdhci0;
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +	};
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
> +&dmac {
> +	status = "okay";
> +};
> +
> +&emmc {
> +	bus-width = <4>;
> +	no-1-8-v;
> +	cap-mmc-hw-reset;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&gmac0 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +};
> +
> +&mdio {
> +	status = "okay";
> +};
> +
> +&saradc {
> +	status = "okay";
> +};
> +
> +&sdhci0 {
> +	bus-width = <4>;
> +	no-1-8-v;
> +	disable-wp;
> +	status = "okay";
> +};
> +
> +&sdhci1 {
> +	bus-width = <4>;
> +	cap-sdio-irq;
> +	no-mmc;
> +	no-sd;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	status = "okay";
> +};
> +
> +&spi3 {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	status = "okay";
> +};
> +
> -- 
> 2.51.0
> 
