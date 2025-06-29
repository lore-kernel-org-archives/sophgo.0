Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A3D1922DE
	for <sophgo@lists.linux.dev>; Sun, 29 Jun 2025 08:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751186244; cv=none; b=uy9u3a2/uwlCukFo2ZqLE0znL7Zspky3I9HVzO6HzfyppOB1GEseQNzRHW7Nh9T8Y3EoJrLeztpuD884cxs4+AI2iNvrzRd/5sa3pMedQQ5To8i3kq48Ls4r8wt4/1Im9abazmoLE2DDyPC2hAdjAGk2UQ6rOTX0eOjAQlNdZWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751186244; c=relaxed/simple;
	bh=QjtaeULOocQ639xsWhZDYI4GEBGiiOhnaPbbA/yGWrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hATZoYRAJumvVbDFiPqdi3AolnnOgU94+cP/CojKnyrV+opPuS1fxcYhMXmFKtmLh+cHSQE2S+hp6MtLgXN1vnIuzrs/IZ+Gd7Ur8xArcJCgyOTcV9PYSLWiyDzx5ERWYe17y96zxSzHgMnHwKBRWLnT8e2zLGLPfT2CJAqgMqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6PnmGMu; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6PnmGMu"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso3585339b3a.2
        for <sophgo@lists.linux.dev>; Sun, 29 Jun 2025 01:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751186242; x=1751791042; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d+BcgPGnRt3iJg519EPQI5YMO+fb+KS53JEcTm8aE2s=;
        b=T6PnmGMuyk/qVYpQg5hL2TYXN4aQv4ISiQlidDfQHkUWAZ1QNyTHXcz2DOuPnmJpI1
         UecbaNE1GH9RtLBdWOe8c7IdTBtl3SGa/fmTQsmZ9uFMG1IHJuhldgWVAzmj7dviq2Q1
         KLcHCXzho8IFGsJa5FHma9dkjFQNNjxVZC5d36EZ36nSjMkvWzL5u0bdZ+fV2J7Ho2BQ
         ObX0Zw8bKODZPmdiK7yNx+IN/hpKkhlAQlIz4Zaee46FeAy23xu5YVxo7QXk0MbzRPWR
         ZDMWCCbVbHa6VKJi5ChPP47hvPIUTdwCgBBiUaQcJ0sVWiRjzw79p1w4pkmTZYoSyTNk
         5yPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751186242; x=1751791042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+BcgPGnRt3iJg519EPQI5YMO+fb+KS53JEcTm8aE2s=;
        b=VDvaDWl4EIvl4ZOB+MSc1DMuAsLVKBzC8j6d1WfsMZef9MCZcayNUXXZl1HbjpAl5d
         7CAZljXuc/IIZvMbAPLNs6fdVlK1ljfkHdjQ1MgPlaEFaig3ODQ/V0vE9I0BFl7W27YJ
         od+k4iBaP86eRB3LIy5dYNsyJK1wlPHU5gmXN2TTX1A50x1RrPW4si8BkxcF7ok5s3UU
         Rir7iS9lvraGV351p5Du1LcgIIUFzczK7eJXqWV8uraXcxnksl9OzMbQw+ERw3wmRCj3
         561CoaxjFQIxkbnX4r1hxa2CONRlZRaKoNmPIZAzTOxIZQKsvbybD+/wdgqZ5d1Wg70L
         x7Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUMJlmUp4g93yQlXzmIKpAnG/NGn+FUE5bt/8OXVBAWM5JKHEuk5wdrpx8UjGLCRjaS7ZYLY2c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3RNL9DxbN149o6HaUch08QXgsxTlR9U+tEq2Dv+4FqpuPmTLN
	sUQ8LnQcnZ303RGi7GjqEnrQIRdr2T12D5beUuzlDxPJhnQF11AlrnciUT4YOfvWtb8=
X-Gm-Gg: ASbGncs8Tfb0k97XcC30ROD2h8exG5y0j3c4/nCZxPgc4HGiU3JZufOIlW5MdbSl0Xp
	XURbIoXtxtCikF45f4I4LXlm3vjqas0Kx88uNr7ft/DkkVfvV+WdFBhPwJXTYyRsjXHIZDVaFwD
	Jmf20Dlf6UymMc/1oBLR8cniIxHkO/WQWgVkugjofJ4X5uqECUt0OOXX3lpQbrZMq/ycmVqKiSU
	i/csymfkL0DSoBI3us9B/bqvQwLfhOmuNogf9xNoinTaBoGC8bt1tir58mHUW6+8dteD69on4RB
	Qd5/WkJkMJzPzopD2OOKBX5T+C8KfMZoCPF9hlXqwZnVbJVos3anHDhL9aVHB2Djue0=
X-Google-Smtp-Source: AGHT+IF5QdK7zE4cTr0041AFjTqMIeuBxsDXV4WV5f+rw5vGOtEvUzEIvjAK9unWEGYVymasc3U0vA==
X-Received: by 2002:a05:6a00:4b11:b0:748:f1ba:9af8 with SMTP id d2e1a72fcca58-74af6fcd15cmr10632012b3a.21.1751186241526;
        Sun, 29 Jun 2025 01:37:21 -0700 (PDT)
Received: from localhost ([101.76.241.248])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af557b3a2sm6117064b3a.104.2025.06.29.01.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 01:37:21 -0700 (PDT)
Date: Sun, 29 Jun 2025 16:37:18 +0800
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 4/4] riscv: dts: sophgo: Add SPI NOR node for SG2042
Message-ID: <aGD7Pvua1OCdqfb3@calculate>
References: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
 <20250629-sfg-spifmc-v3-4-28db1f27e999@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250629-sfg-spifmc-v3-4-28db1f27e999@gmail.com>

On Sun, Jun 29, 2025 at 04:23:13PM +0800, Zixian Zeng wrote:
> Add SPI-NOR controller and flash nodes to device tree for SG2042.
> 
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> ---
>  .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 24 ++++++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> index ef3a602172b1e5bf3dcf54a8cacdad5172b7f50e..554ec14d58453a44a02a82da40a7aedb80d61dc9 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> @@ -138,6 +138,30 @@ &sd {
>  	status = "okay";
>  };
>  
> +&spifmc0 {
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <100000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +};
> +
> +&spifmc1 {
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <100000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +};
> +
>  &uart0 {
>  	pinctrl-0 = <&uart0_cfg>;
>  	pinctrl-names = "default";
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> index 85636d1798f11804546ed8606595ace1b4cb2a2f..0e1fcb54480af71147d0e71178a8eb08a31b75c3 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> @@ -48,6 +48,30 @@ soc: soc {
>  		interrupt-parent = <&intc>;
>  		ranges;
>  
> +		spifmc0: spi@7000180000 {
> +			compatible = "sophgo,sg2042-spifmc-nor", "sophgo,sg2044-spifmc-nor";

Sorry, This should be compatible = "sophgo,sg2042-spifmc-nor", binding
is changed in this patch series. My git branches are a bit messy, sorry
for taking your time for this issue.
> +			reg = <0x70 0x00180000 0x0 0x1000000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&clkgen GATE_CLK_AHB_SF>;
> +			interrupt-parent = <&intc>;
> +			interrupts = <108 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rstgen RST_SF0>;
> +			status = "disabled";
> +		};
> +
> +		spifmc1: spi@7002180000 {
> +			compatible = "sophgo,sg2042-spifmc-nor", "sophgo,sg2044-spifmc-nor";

Same as above, sincerely

Best regards,
Zixian
> +			reg = <0x70 0x02180000 0x0 0x1000000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&clkgen GATE_CLK_AHB_SF>;
> +			interrupt-parent = <&intc>;
> +			interrupts = <109 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rstgen RST_SF1>;
> +			status = "disabled";
> +		};
> +
>  		i2c0: i2c@7030005000 {
>  			compatible = "snps,designware-i2c";
>  			reg = <0x70 0x30005000 0x0 0x1000>;
> 
> -- 
> 2.49.0
> 
