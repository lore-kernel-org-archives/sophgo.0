Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23617D098
	for <sophgo@lists.linux.dev>; Sat, 11 Oct 2025 01:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760147834; cv=none; b=n13IY8lNCqSfYEMg+6lN7UN7UN1I8yS5Ez9JtApBMtEH6/6H5SqdlXAIMjxC2rXToOt6LSw3xy/3sC1RYEHXZEqxpneGsg5me8OEa6hkxVlfCSoUfGs4xuHUH2ruBmIg8vBIQnQpmJ1Lc/IBwrN2OWj09N2JNWetFlRWivmkzeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760147834; c=relaxed/simple;
	bh=+vf+3RHZibMMj/tI8fb1sI6RM2pGdspNkZYG6G7Lqmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ted5hCWXBnJo9iWwhLGhLlxujOWy0RIuzN8gjJMs1+uAfh1vXSB2DlGLr/iujwxJ0mpDsJaFP5m0R0b8JskgHC0zz5IaPHSsuQcgGn6QGg5sLuquc8kt7xNBqLGW3cK4nlG6+yXXMXnG4tzPO3zACWgpIFDrvF6b8B/kutR+skQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHahD3ey; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHahD3ey"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so1711266a12.0
        for <sophgo@lists.linux.dev>; Fri, 10 Oct 2025 18:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760147831; x=1760752631; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eHTSJHwY1yibK3NZWh/Q68kzDMLrWU3aH+eDUXwCRpA=;
        b=IHahD3ey7kRpBUJHgWKW4/RW4dRmuWMIQGnjsqpNpWCTW/AuFjInIbEuPpLAtwosVA
         t+hd5MqhfmOKGoogBOOTupD6lbXYUeIttAxz7pWYE1NV8BlKTcQMsqpj8zlOBtEkgnD4
         yI1Q4dqCwS9gwOAm8AJUyRdSlTMuuMaNxAZntVv+UJMv5MtmKPKcuhqV5Eo2/kgQZvKH
         o+nY8gEQXYB/fuP3ksZDC7feehm+9YwuLj483W9lr7Ttz/fxQcd7EGRfhPSfUilyDqNR
         VlaATeeA2iWkNotCHSN4wOMYdBYxj3DMyGuwy6DA6KSEoBEGScz/724ZvuMFnWWppl/p
         46FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760147831; x=1760752631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHTSJHwY1yibK3NZWh/Q68kzDMLrWU3aH+eDUXwCRpA=;
        b=azVVKWWs5KNKd+/ZRB+fdUnCBcZR4Y7W4AkREL/jPCNoPq+18zF8qYRLMeZPDt/H+C
         fMf0mIz6vYNO6Of0uRISnCDi+OyN83tUcvS0G1u8hDND+2iFVHSl6vsAzW4VNlPQjOPF
         KnHukc0gmS3y2S0Q7Qam4JQYglZ4V0VdSNZaJ2PB90OqKLtbGlAj5SqDcBGyk0FbG0L6
         ytJlgKpDffep7UqudYD/pPtqfs20tPRrFKFolHihxnyAH0YUd5LONaG7Fs1pkXkfnl2Q
         rbUYAxnr7mkMjYT+OXByJeG+w3mFKjKDkSjY629hsyN37o2P6cJF/o5O+kNPbRDCRZBS
         uxbw==
X-Forwarded-Encrypted: i=1; AJvYcCV/4onIiKEy/0Ci/PDmnKVLOX+Dec8yocpyDgLkIfukNIfmgTBVnIxxVdibP92aYN/lPJMrXjw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl4RGmzCu4E8NLagBFdz3hA0W39dB8Aibchu8AqFnQdwhC2NfK
	dcHNB2Xj6ZoG7LMtIknwVQFvJzDNplYsbXTx9/5YKj0mCQUyZhhYOt4R
X-Gm-Gg: ASbGncvZeJw9sNcc5+dS1h4xDCrnXkRnNhB//CjmLsOdT7a8FkX9Ah7wtw3aGxNgRyX
	RE7tbxcgqGpKNAYN8reY/B2iX+ndSiCV32dpCXxeN4ZMlhbX9ZJGm/lfMFHzWLZu2wDT1NeH7Dd
	Kda1xsyfny6aesHvziQm6M7GG4nYC5nfMEtrBxOt9yBe4dBZoUnOmr0AEmLKAoI30TQUfgYuNlC
	+h8pslAFgLT0eWYmE3kPLMJB/20DtBaUmF9U6y6/l6PucFH6Oi3Qk4gAtZBHTpzW/l2DrIB4KOO
	ygzRuIrZUSD4LjhDrWVjl9+IH4JnGr6kBn7XgaSVBnJroMcsU0c2CZXLeTJwhBsjkGDR3ojn1fP
	AN+kPrrd2WHU+PZxDPioR+mNWBpLbCEmLR8/SDjLY
X-Google-Smtp-Source: AGHT+IFc5FAAft1OfRzVanzQWGtZ/tg/QAdN+bH6b1aigX28GF4mdggE7OEsu26WE+5GHtCW7IZH5w==
X-Received: by 2002:a17:902:fc4c:b0:282:ee0e:5991 with SMTP id d9443c01a7336-290272b54abmr170693615ad.30.1760147830782;
        Fri, 10 Oct 2025 18:57:10 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-29034f56c04sm69598565ad.110.2025.10.10.18.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 18:57:10 -0700 (PDT)
Date: Sat, 11 Oct 2025 09:56:28 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joshua Milas <josh.milas@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com, 
	inochiama@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, alexander.sverdlin@gmail.com, 
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com, chao.wei@sophgo.com, 
	liujingqi@lanxincomputing.com
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <hkdnjyldwr4watvizsju4qcvpvkb3mtt5rathaooembpceyufx@ega5xrqj6v3y>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-3-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011014811.28521-3-josh.milas@gmail.com>

On Fri, Oct 10, 2025 at 09:48:10PM -0400, Joshua Milas wrote:
> This adds initial arm64 support for the Milk-V Duo S board
> [1] making it possible to boot Linux to the command line.
> 
> Link: https://milkv.io/duo-s [1]
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  arch/arm64/boot/dts/sophgo/Makefile           |   1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 110 ++++++++++++++++++
>  2 files changed, 111 insertions(+)
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
> index 000000000000..e9afad6fd106
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> @@ -0,0 +1,110 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
> +#include "sg2000.dtsi"
> +
> +/ {
> +	model = "Milk-V Duo S";
> +	compatible = "milkv,duo-s", "sophgo,sg2000";
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

Only enable device that can be accessed directly. These devices share
some pins and only one of them can be used. I suggest enabling devices
that are accessed by default (which means it is compatible with the
vendor kernel).

This advice also applys to the riscv dts.

Regards,
Inochi
