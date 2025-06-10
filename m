Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA751991A9;
	Tue, 10 Jun 2025 01:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749520769; cv=none; b=eLxE0BVK40U85xYTaNrb68vb3C/k5/lkkW645+Z7txdnDkHKi8/5WCJj0jM1vdGIW0kuCPvrtEnbw1DY7sS4L4X6Nh2suZ20K+62nVL6GgTZ66vX8fzuX6PELdrufg3gMjXkOMLNdf9MSA/x74pcJwX82a+2pXzeR9jRf2A7v5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749520769; c=relaxed/simple;
	bh=WHspqItW3GE5AWeo9hPdEmz9/AUMLt/B2TZ6sdpXJIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvgMqUHH5VPm+bhNMP9Wbxik827g4KG2vbOrS0p+ure42nBHvaeyvpizzrbxUv9Skfh+jDG7NLt+TsdE17YyY+G2sNRJDSEDnKdhfaQzYT0skU0oZSKuFTf+ln7E2Pu3RAJ5ckBuYG89qidX1uV79iju5C///jGgdQNxfjOrJ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2Zk/603; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2Zk/603"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6fafc79bca8so58096796d6.1;
        Mon, 09 Jun 2025 18:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749520766; x=1750125566; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L/HbnauDYf6ui324V2v/SCWpldAIlHfJUA8RdUYkcDM=;
        b=f2Zk/603Q7Yl4ZkCoY1Mh1m/jBJUM+G61+fu1iC505iM33HNZ1BeFf02zsnPzzp0f7
         7v+TjMnK3w+EczTWZkcBrgKJC7wtMIwCTmiJiMoK63xTAXVjnWsHLb+u5jHg18xLXkkE
         Ou0fi9gyZksx1wr3VgdbS8NbhsMHFqn8gK4eGt1EPXSGWDS1jM9b/plkLznE92LhfIk1
         0TLF1bmD095rVB+yoIybRimcox7Qz7HjWq+y809ciycQweT0n+SIcq0hYD+Dq9yZBD90
         ICazvMrft74FF0oPBAGOOlvqARgtdEOoslGcYSEwzA2PO5kROqKAmKinKEzScsm6Le4y
         QBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749520766; x=1750125566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/HbnauDYf6ui324V2v/SCWpldAIlHfJUA8RdUYkcDM=;
        b=kAZyCDXMby5590sr+PSyPRWa2Ymf6/E5cdDTYhzPx5ApisLSRS7ejIvQzSZfNy1MNy
         M9yIccI31o6YroerB10mfb3mOEphghhyj97blzvyKe1X69cUHwHy8Tcsq6J/ZJQHkyT9
         Xbir4bpEfWNFxrDnDMeMP5uK4Edn9yuRC/buP6KdD/4paXQkM/Vo2IJPylEz+fzQQKn1
         R2j438HelS2sbuT2lVRKZwGJX3SF6x/CptXHJXcJJInva4skK9aS8R56lg7CQDwaRh91
         EF1mHXSBJziRE2PTLinTJmRVbz/pQ7G/JQ9ncyz1vnoqJw8VErxcnKbtSLcfF30bkhHB
         qNaA==
X-Forwarded-Encrypted: i=1; AJvYcCWvKunOf5msYig7UIyuzZtLVfpm1MGlWkH2/5M2+T8HtfoB3sv+Ovzq2hkl93qUs21iRRTnSF3C@lists.linux.dev, AJvYcCXqEKYQxa6UUW6iO+iIePe/ivEqOndmlcEHAaMozW9zLhYM/v9ibHbjKxmkXWnD267tK2c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWYKJFm67bC3ggzAuJL6mckGy9sGqhGxNPZSqq/C6Or+GMkuhE
	bES6Shq/C74X5zxhKpUqcWxCtMIstvBGElk7IYCDgEqB7ByL9N7zdA4k
X-Gm-Gg: ASbGncs4e0XhG9iLBlZ/crvj6BlDLEU73mfkK6AkSyCm+ZrbG0dErUOaxlOkxhBFIVo
	pdKL8tsaqXN8x7UMcEoZSRZY7nmJ61NKVavUqLQNbMVPMSP7Z5RlB0RMcO8IIWecSPqtFMgpzbJ
	DLu89PO2PRXFak79pJ1kbUhDxrn/3Ddr+kIZCi+UePQVhfmwYBCrLh/3wnUdYQB5PUhOViHwGAC
	BTX9vPjY14+yVNgrd8MiyHrXeEat6DnraIJGU0aUdaiSMuUOR08soFUkkpQTNzdmXbxRqscVdXD
	b+iegymaH0+7geS5nydsdFHZubVyQJzpD1D/BQ==
X-Google-Smtp-Source: AGHT+IHvYMWWyIw93LIzw1NNnddQhHK80Bpi1zW5dbuBE6Bl2s14aPbKsVPoJsZlb4z8YnHtVCaIoA==
X-Received: by 2002:a05:6214:c8b:b0:6fa:fd8b:54de with SMTP id 6a1803df08f44-6fb08fcc705mr227117416d6.30.1749520766486;
        Mon, 09 Jun 2025 18:59:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25170613csm624044685a.6.2025.06.09.18.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 18:59:26 -0700 (PDT)
Date: Tue, 10 Jun 2025 09:58:20 +0800
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
Subject: Re: [PATCH v6 2/6] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
Message-ID: <g3wzmewsjrbeteumfv3ibqwj62cwm45whledqez4issjkmqao3@oymrmm57c7bx>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
 <20250609234125.722923-3-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609234125.722923-3-alexander.sverdlin@gmail.com>

On Tue, Jun 10, 2025 at 01:41:13AM +0200, Alexander Sverdlin wrote:
> Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  arch/arm64/boot/dts/sophgo/sg2000.dtsi | 91 ++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> 
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
> new file mode 100644
> index 000000000000..5e69ccfbab56
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <riscv/sophgo/cv180x.dtsi>
> +#include <riscv/sophgo/cv181x.dtsi>
> +
> +/ {
> +	compatible = "sophgo,sg2000";
> +	interrupt-parent = <&gic>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			compatible = "arm,cortex-a53";
> +			device_type = "cpu";
> +			reg = <0>;
> +			enable-method = "psci";
> +			i-cache-size = <32768>;
> +			d-cache-size = <32768>;
> +			next-level-cache = <&l2>;
> +		};
> +
> +		l2: l2-cache {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x20000>;
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x20000000>;	/* 512MiB */
> +	};
> +
> +	pmu {
> +		compatible = "arm,cortex-a53-pmu";
> +		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +		cpu_on = <0xc4000003>;
> +		cpu_off = <0x84000002>;
> +	};
> +
> +	soc {
> +		gic: interrupt-controller@1f01000 {
> +			compatible = "arm,cortex-a15-gic";
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			reg = <0x01f01000 0x1000>,
> +			      <0x01f02000 0x2000>;
> +		};
> +
> +		pinctrl: pinctrl@3001000 {
> +			compatible = "sophgo,sg2000-pinctrl";
> +			reg = <0x03001000 0x1000>,
> +			      <0x05027000 0x1000>;
> +			reg-names = "sys", "rtc";
> +		};
> +
> +		clk: clock-controller@3002000 {
> +			compatible = "sophgo,sg2000-clk";
> +			reg = <0x03002000 0x1000>;
> +			clocks = <&osc>;
> +			#clock-cells = <1>;
> +		};
> +

> +		rst: reset-controller@3003000 {
> +			compatible = "sophgo,sg2000-reset";
> +			reg = <0x03003000 0x28>;
> +			#reset-cells = <1>;
> +		};

Remove this and use common cv1800b-reset.

> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
> +		always-on;
> +		clock-frequency = <25000000>;
> +	};
> +};
> -- 
> 2.49.0
> 
