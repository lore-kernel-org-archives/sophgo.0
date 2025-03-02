Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD74219ED
	for <sophgo@lists.linux.dev>; Sun,  2 Mar 2025 02:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740881949; cv=none; b=UZp9ALmW5sExphWEtBjqKo3qcoqFeaggDZJB2zj3Kbwtoi1vQVRCU8ey5siFbigyCQwM/XbpE71kvt66duExhlKszZVk7kx6DqMYSBNpBRBFQItvrfFeEupzTesqMBlY6npqdWUhd7RVNgEc/MPIoFGdF3FTrC5zhINpURB1Z/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740881949; c=relaxed/simple;
	bh=Q3jk66jHAAXQHX/Py7DUzr/pfHIcKPy2OogvHy2RdHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bS/zxNPAyJ060UW7zM/McTOTjZQPmJ2OVEBbo0qsiTIhW6GZdYVjVUpaHLZv1tOKWH+UuTPr6kGMWN3cSUIa+WdDjPVaAd7IpG9Msf2ADv4RDbMwuH8okbZ5i3OyzRAUAJx8o9MY75IJpvcm5cyVj3XCDqNJAPJtDpk3FQFOHQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XK8QwlEt; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XK8QwlEt"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e6c082eac0so32615116d6.0
        for <sophgo@lists.linux.dev>; Sat, 01 Mar 2025 18:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740881946; x=1741486746; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oPjKRzzKrglUg+fYVwz0cgQwVYZBInp7nhcExhwtF6w=;
        b=XK8QwlEtdcCVo2+ZBnKzn9A4Y5lp4UJyVUFV3vJpL+BP9SUIrZSr7J6ixivSq053Mj
         SbkReFY0/vS1N3rJHW0NyMA1Lo47MY6KXf9gGb6qTRZ92t1ouN0M1g/InoQ4cxuqBlyo
         nKvHHDIqzu7TwrEjXkJ6lxaXrBg2EuiscqNq/8hnUuXherZUrBuOKl3jestzgeBxnJJz
         KV6XK3HOT5BJf8xNqIxb9Hg9VfQ17S0eI3DcLwFqiq5os9up8/LdpuWbRFjmE0y33Frj
         TDZ5gAhL+Eb4kAb8qPRoquYd6sEQrmV01n72m3HqY3/m7gIGkpoBa0okQnn3whAKPhT0
         jccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740881946; x=1741486746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPjKRzzKrglUg+fYVwz0cgQwVYZBInp7nhcExhwtF6w=;
        b=rd85Go4eS7ehMhqaolAzXiqJgd5S3MAsLKoAMkJA7JAUTqNr0mIuhXPyITk938Grbk
         /F2XKT79DijYmDduur5SG8dYLKU5CnVLuQibZyE6OvduX7NFpiIGL6yenCZn548QBoZE
         GpOz9VkCA5zav+2zht5QoUAh/+f26Kg+Zsa0kaYL3LoqLp0x0cvgZMVfPevdiZmYyZJP
         aFRlw2I8JrTznhlUq8bNO5CgnolgoECJWWVkNBQB+D8SgyYSUnb/dIiY59Zp2yXeDqqo
         QT0pyw9qzbA68ziywYU4YRiquFEEB2u1IztJwj4gsKmAkUGBSJTDWgYfDT0UYlArkotA
         d+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2K9Tn+nxcV2hb9UfT+4Itu2IBMbkv+XKOyi8lrMilD8tYKmjuamgdJb7wwLEnOswxoXrQYFo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4zcHh2jnhEi+ykllMw8wYzdolLhPHB5ZRRPYi39JphQYSiW3s
	u1YrrNGKIZwOZwk5NNB8G6wWM+DeRap89Ni+hIIKfr+9HBy27b6a
X-Gm-Gg: ASbGncsXYM5+jUGg4oiAfLfWkrhbPeC+q3zwdrS7ub3umvZjQllm3RwgC0UEjuiR1z8
	pK5HUeJq3k/zwyB+0oqg+iMHaoL2vke9EI6ga2yOKEx4RaEJGXyHucb8RgaabDZddWR80aofCns
	DU6fkQ2SSrsRckkNRPNiP2BRmKAh8XB6ZXOvmfGdYVIirPCprbNiSFs8rU6D5OIdcB1XK+SWKnC
	Scw4QaT32XJUDMoZGMhWESnR+mc+T9drg2OSV1dWVFP2rEyEpCHsAuy7z91HGYCNvo4umDOhxk8
	7/PF6v00RJBkYaxRF8RZ
X-Google-Smtp-Source: AGHT+IGrdEuBUkRKtS239DYTHqorXLkacSTFcSVvkbaNWolaWYlbaQEuA1xg/Dhtk3D1fi/XT3FAXQ==
X-Received: by 2002:a05:6214:1bc9:b0:6e6:5d61:4f00 with SMTP id 6a1803df08f44-6e8a0c7da89mr139365716d6.4.1740881946305;
        Sat, 01 Mar 2025 18:19:06 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3b67458e0sm5920285a.57.2025.03.01.18.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 18:19:05 -0800 (PST)
Date: Sun, 2 Mar 2025 10:18:42 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Zixian Zeng <sycamoremoon376@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com
Subject: Re: [PATCH v2] riscv: sophgo: dts: Add spi controller for SG2042
Message-ID: <fllmh65x7ke4sfolxbdod73fx3fm45w7gy7x4pgamxnbhztjvk@wqd56dzxaa37>
References: <20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com>

On Fri, Feb 28, 2025 at 08:40:23PM +0800, Zixian Zeng wrote:
> Add spi controllers for SG2042.
> 
> SG2042 uses the upstreamed Synopsys DW SPI IP.
> 
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> ---
> For this spi controller patch, only bindings are included.
> This is tested on milkv-pioneer board. Using driver/spi/spidev.c
> for creating /dev/spidevX.Y and tools/spi/spidev_test for testing
> functionality.

I wonder whether this patch is tested (or at least can be
tested), as I am not sure there are pins for spi or any
onboard device on existing SG2042 board.

> ---
> Changes in v2:
> - rebase v1 to sophgo/master(github.com/sophgo/linux.git).
> - order properties in device node.
> - remove unevaluated properties `clock-frequency`.
> - set default status to disable.
> - Link to v1: https://lore.kernel.org/r/20250228-sfg-spi-v1-1-b989aed94911@gmail.com
> ---
>  .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |  8 +++++++
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 28 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> index be596d01ff8d33bcdbe431d9731a55ee190ad5b3..c43a807af2f827b5267afe5e4fdf6e9e857dfa20 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> @@ -72,6 +72,14 @@ &uart0 {
>  	status = "okay";
>  };
>  
> +&spi0 {
> +	status = "okay";
> +};
> +
> +&spi1 {
> +	status = "okay";
> +};
> +
>  / {
>  	thermal-zones {
>  		soc-thermal {
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> index e62ac51ac55abd922b5ef796ba8c2196383850c4..500645147b1f8ed0a08ad3cafb38ea79cf57d737 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> @@ -545,5 +545,33 @@ sd: mmc@704002b000 {
>  				      "timer";
>  			status = "disabled";
>  		};
> +
> +		spi0: spi@7040004000 {
> +			compatible = "snps,dw-apb-ssi";
> +			reg = <0x70 0x40004000 0x00 0x1000>;

> +			clocks = <&clkgen GATE_CLK_APB_SPI>,
> +					<&clkgen GATE_CLK_SYSDMA_AXI>;

Is the sysdma axi clock for the this device. IIRC is APB interface.

Also, Are these clock aligned? If not, use space to align the two
clocks. You also need to add the clock-names here.

> +			interrupt-parent = <&intc>;
> +			interrupts = <110 IRQ_TYPE_LEVEL_HIGH>;

> +			#address-cells = <0x01>;
> +			#size-cells = <0x00>;
> +			num-cs = <0x02>;

Just use decimal number, no hex there.

> +			resets = <&rstgen RST_SPI0>;
> +			status = "disabled";
> +		};
> +
> +		spi1: spi@7040005000 {
> +			compatible = "snps,dw-apb-ssi";
> +			reg = <0x70 0x40005000 0x00 0x1000>;

> +			clocks = <&clkgen GATE_CLK_APB_SPI>,
> +					<&clkgen GATE_CLK_SYSDMA_AXI>;

The same as above.

> +			interrupt-parent = <&intc>;
> +			interrupts = <111 IRQ_TYPE_LEVEL_HIGH>;

> +			#address-cells = <0x01>;
> +			#size-cells = <0x00>;
> +			num-cs = <0x02>;

The same as above.

> +			resets = <&rstgen RST_SPI1>;
> +			status = "disabled";
> +		};
>  	};
>  };
> 
> ---
> base-commit: aa5ee7180ec41bb77c3e327e95d119f2294babea
> change-id: 20250228-sfg-spi-e3f2aeca09ab
> 
> Best regards,
> -- 
> Zixian Zeng <sycamoremoon376@gmail.com>
> 
