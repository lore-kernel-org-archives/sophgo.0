Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C748F285401;
	Tue, 10 Jun 2025 22:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593147; cv=none; b=OYJug7f/bc2pzY+XRVpa9A78FQIuxkLTWXVjTrQUoaWSKuVbt8/UpkYXtMgJFdp6CkSifmV0dCtTBQlkqiJbXQ1qNTfsk4aGj1QUh/xeDUmXy4Uqsy/wo/jmxZubfWFr5Fxv9me41JuAOfZsCideXjIUkxIi5Dv36vwKWJJluhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593147; c=relaxed/simple;
	bh=HuM5zxnDhh4RUNVAMh1E77pQ4bXzqpgKY2NT2k/Zg2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiAGSsi6NujFmIazxblshXYIP27u+oQN4s58YPX3KpZqjGYtKIeamtB+jMsYufDzuVeWu4R77l1wU2DU281VEvy5YacM434HDq8NO08/Sd20B/vh/Vud6Ldv3vvdgIWJ09J4AgNxBnZf5957uUtNwWQ/lCzTCQFU8V38aeAWS0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVKLxsPv; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVKLxsPv"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a58b120bedso77209441cf.2;
        Tue, 10 Jun 2025 15:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749593144; x=1750197944; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DmTWmU9NEikrwp3F1QNeTNdfTomvenelOaCl9Z9m7F8=;
        b=hVKLxsPvp6hSlXcjTQwZHHfWDHEkBl2GqIvSo2Cv/Rz37XmabmAFU2Az8dbunGlHZ/
         tWkCZdq2vDP/RLCi34bzChgVJ9Nf/owYQ6jFRV6LSCvlWC6u8vkwYmjcNjk+KwpCvumZ
         XuAzholX2If9ewTzAeXwpxtaqa9MhtphfHVh8oh7FuGXQuUiB6snYP8DC9Mwq8RFE2gj
         YdwFLzXja7+RWcSdRAR0Ewq6TD9V+4k38B5gDY7dhkYVYO7wGe5dhOgym8lxBgd0KBEP
         4XqmHgy57dnIm6UyjanD5t/igl1AH11/iFcfgDCYN5WwTFsf38/VYpBjaGimTyic+vAN
         cjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593144; x=1750197944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmTWmU9NEikrwp3F1QNeTNdfTomvenelOaCl9Z9m7F8=;
        b=xLDNrvuuFfHqOZc3TnBYtOYBF8n48uuBjjTFshf++sSlMcnR8Bd5L6sTiemUBOjJWb
         LNYXm2fx3J2uK72BydqJOZUuebsS3DmBmghFLAe8FppP4yJOYGSzEBpsc+sJFxuJMT3D
         0Qwo5BaKIi1vB0FttVrVh4ip1UaV5oo8LYlo+LAArBsTZql0ZuqA6oI+auEDyREdmq0D
         FvwoSwnEMEGRqzzeHE9wjBmGpwxSmjFRRHrt+9gDYiLoAoHt5qpMihb3fkT4ixpOAfpT
         Mxy0Ikax8g9PXxCp9NSG4Znb3QXR+x43ZbIryisv4yy+hIuQqvaejoDO++pUwnVAWP3Q
         Ksjw==
X-Forwarded-Encrypted: i=1; AJvYcCWFMUR5SB1JG1w6WB6+haIQNX3ejofpcOj2Q3S+9w1qQapZT8du6FQaC2rXdwA182NSlvY=@lists.linux.dev, AJvYcCWsdlrKgLwF//HWNQQFF2Ed2jRqRd4cDC4TwsY3CPzoI07fiQ8Zy73prgZclVN55rENpt5Ck62I@lists.linux.dev
X-Gm-Message-State: AOJu0YwboUQ1R+nu0dDvOXVt2Ea0Xza1VraUuEPITYxZUaUqDMEwykEU
	TqNH0ShHVgxaZjsSoopqIuZrAAbDrFBY+qYsCyibrowQMVLhUKYHdsZk
X-Gm-Gg: ASbGnctyfQu0UL+ODljKuqYLkI0IezvP8peV7M27qEczeL9HPWBXD9fe6DL2X+1kYro
	Y4WXyq8czcEGor3R1nY4oSRwIp1N696a57+djPguWANul3aE+9VepaXtI3mazC0XJrpwM2jUDXs
	QhJHa3aHito94D0L6sV20GEXEewUyc7foPsPiUQDHcDKZQZ2/suiqaA34Mq8APlPKiWR7gysozb
	D/pkpy/QnwY35QL/sSqDBjIw6yrriCAjQg027DUuY1y3lmoF+DfNJmcgELYxIzOPZERW0BEB1fq
	RRituahxmjsNbZzi+Wlju6rTb1UNmMt5elFEa42gxIZIjG/T
X-Google-Smtp-Source: AGHT+IEDJpOYkGfTUyYs1FXlXzDYqJOyu0jNJBu7zkL7VpiJWuUnOT+hGZ2ALGAVCMSkNmIUlRsQhQ==
X-Received: by 2002:a05:622a:558e:b0:476:8f75:b885 with SMTP id d75a77b69052e-4a713c45603mr18755041cf.44.1749593144531;
        Tue, 10 Jun 2025 15:05:44 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a619853048sm79911851cf.47.2025.06.10.15.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:05:44 -0700 (PDT)
Date: Wed, 11 Jun 2025 06:04:37 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, soc@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jisheng Zhang <jszhang@kernel.org>, Haylen Chu <heylenay@outlook.com>, 
	Chao Wei <chao.wei@sophgo.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 3/6] arm64: dts: sophgo: Add Duo Module 01
Message-ID: <h3vnwdlmzdjdm2nfpg3rvbck22pgvpweqphuwy67a5ny2wkhen@d2vmojc23pli>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
 <20250610201241.730983-4-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610201241.730983-4-alexander.sverdlin@gmail.com>

On Tue, Jun 10, 2025 at 10:12:16PM +0200, Alexander Sverdlin wrote:
> The Duo Module 01 is a compact module with integrated SG2000,
> WI-FI6/BTDM5.4, and eMMC.
> Add only support for UART and SDHCI.
> 
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
> 
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
> new file mode 100644
> index 000000000000..bb52cdad990a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
> +#include "sg2000.dtsi"
> +
> +/ {
> +	model = "Milk-V Duo Module 01";
> +	compatible = "milkv,duo-module-01", "sophgo,sg2000";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
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

Please move this slice to the board dts, only configuration related to
the module itself can be left in this dtsi file.

Regards,
Inochi
