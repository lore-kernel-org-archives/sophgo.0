Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818EE191F94
	for <sophgo@lists.linux.dev>; Mon, 13 Jul 2026 00:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783904248; cv=none; b=O2VvzfSMitd8+GVLfJB1hGaWKi4BtU31I9bt0VzFxlFOwbVLekSXHzc9AbtL9UT36VHrmGh6Tu2vU2l/yACjFNO5ZldaoPO4nCFv3gaopJf7HtZdUKz3lMbZhH46aJuL+CDy2lFqSDv96DIxEH9jpqd0oCbHgDAGqxFQ3ReXpP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783904248; c=relaxed/simple;
	bh=Xo6EyzqNrckhHCa4x6TirXmUCwy921YsGGy25SBUVdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTSmauvdvfRgXKUSG3LbvL31UARwy4VMMqfXHIJ4hHH41p77EkX8I0um+MOd1F6SHxSOAVoYkE08FXuak6fa+5PdBClF//BSsc4MBfUijGz9d3NrPq9W8L0i/BcUtukiUSt1aXHjyU6a+jR8lzV12Hs9Q8CKsz8VKGVoCNVSYsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCc/BikN; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCc/BikN"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so34102175ad.0
        for <sophgo@lists.linux.dev>; Sun, 12 Jul 2026 17:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904247; x=1784509047; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rcAmTvO8VZf1EU8sxDKdiXNrU6FxGa8pq7WzxSsB/Lc=;
        b=hCc/BikNN2qoweIPgs92zaj1/b8Q9KNnZpfoHoVL74gxiD7JmCIV3jWdFuMWc+5Rfp
         qJUmxlrouxycTSZwTb2pXG3mXBJNsn3BX+XHLuPtfNOQzJIQH5CUUqx0c7Y+sV6Tvz79
         8GEhCmWr6HgZnqJ8wrzwGII/oppwXYaCEL0YsY2f4voo4Ce+ArP0nfux1Tg/+YZCG/r4
         rVJi53buEN+AG0qrc0C8aJUWlgqgY16ZBOOzHxzdaX/xCWHsRnIU0qrLexjI49RX16Sn
         SJTSFY4Zp7NqbbmlRaosTi88sR7p5dKXHykA/72fWPIPzFPJNsqjqgjWj6FbDwRUhs/s
         X1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904247; x=1784509047;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcAmTvO8VZf1EU8sxDKdiXNrU6FxGa8pq7WzxSsB/Lc=;
        b=YHxosKOX3a0/wnrz3dcZCid/ofyEfz/mRqUiFSP1g+E0DCxODt5mid5vSQ1+05E5Kx
         lNssiy0Npatk6vMC4vIMzVoX4gg2Hu0RNajy1y0RVBHh0IDlo3Fw/O+i8uC7e+is6hxZ
         3OozS2W9o/JyRDxApO+DZ9yzZogxzYDLu2j7CtGdmFUSETkcZpjF99uNWaJPQAktopai
         AJA0G5F3NxhezvBk7W/MnqAIsnzRseUTUA068+Px0KJU3qaOqlJ80UEvyZy83B5c1kiR
         5455apG7TFIpmatwl7W5MMQxZVRjgH5Ri7oqVYp5BCyRUn65enSWgDnbQ/Dy5dLQAeXe
         QZMw==
X-Forwarded-Encrypted: i=1; AHgh+RpOVN1IKbCBQG2v8RXVf5ShOrt1rVDneL2RVsOLkFlMB8Waim4SuWsNuQd7T2QZHgtGrJ3fYfM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yww5BMw1YvCePT5Z2sehY0CiYmNhxNiqNN/r8RFUK89nJ3ZNQ8P
	c5dTmLwuepl+LxZJwGJHp9oam7zIxGbzKQjdByox0tghJasPA8bFCl4g
X-Gm-Gg: AfdE7cl2nKWlQ1hI6OsqVXkrpWTAbDgyM0uzvaqDOQkXqOuJHks9GSx+EJg9bbAws7Q
	X3mbjCKEGApaOU9W9iN5P5PK0IJvGtrqGUMqlDsF6gI8dWR8xIV+uIPoP6bO0wmt83Q7Q11Sh4j
	AckOC9IQSq/C9dxNGD4YqUVuwhOtqhUNS8XNaeIlT+5vlrzcxO7M7w3sH/88LAMQWaecdpCcCP8
	IsO8oqwkW85NsnvMbhYFnajLl3e038qOevg9Yp33cA5PefisrnRdaoJUrrQ7XvX4as5Z8ZF2tEe
	stsLdePnSKKnL5R+sl8T1bY4/tO3BqQevCnZq5kDtsddktGzrP863hYiIJhRyVnB3/I1UqiSHuH
	2f1DmSgnToQUY9l3HD+AqvyjHBQZWe1dWTJ/i95XwL8SyuDEg+bcDVrh5umRqf/Fy
X-Received: by 2002:a17:902:d2c8:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2ce9ead153emr69863775ad.20.1783904246723;
        Sun, 12 Jul 2026 17:57:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf92bfsm90539215ad.28.2026.07.12.17.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:57:26 -0700 (PDT)
Date: Mon, 13 Jul 2026 08:56:41 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO
 controller
Message-ID: <alQ3mqUPItCP2CVT@inochi.infowork>
References: <20260710075917.159969-1-chenyou910331@gmail.com>
 <20260710075917.159969-3-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710075917.159969-3-chenyou910331@gmail.com>

On Fri, Jul 10, 2026 at 03:59:16PM +0800, Chen-Yu Yeh wrote:
> The CV180x/CV181x family has an additional DesignWare APB GPIO
> controller (PWR_GPIO) located in the always-on power domain at
> 0x5021000. Add the node so that boards can reference GPIOs in this
> bank, such as status LEDs.
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
> The base address and interrupt number match the vendor SDK device
> tree (cv181x_base_riscv.dtsi: gpio@05021000, PLIC interrupt 70,
> i.e. SOC_PERIPHERAL_IRQ(54)). Verified on Milk-V Duo 256M hardware
> via the onboard status LED on porte 2.
> 
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index 06b0ce5a2db7..25ad2bd265d7 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -160,6 +160,24 @@ portd: gpio-controller@0 {
>  			};
>  		};
>  
> +		gpio4: gpio@5021000 {
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0x5021000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			porte: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				ngpios = <32>;
> +				reg = <0>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <SOC_PERIPHERAL_IRQ(54) IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +

You should follow the device address order. not by the device name.

>  		saradc: adc@30f0000 {
>  			compatible = "sophgo,cv1800b-saradc";
>  			reg = <0x030f0000 0x1000>;
> -- 
> 2.43.0
> 
