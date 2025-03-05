Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992E61D5151
	for <sophgo@lists.linux.dev>; Wed,  5 Mar 2025 06:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741157186; cv=none; b=CvzvUPE7Uhx3pkyI6rNTNS/d0hewCcXU2yrnL2kMPz5tLpoNz/D8d/aeqM7joHLEyVvLMvYTWBY+pYWmi56NXABNTSQ/sbwZjlJ/fCoop/qxFobxSoaP7haVQUWdlXh7mLBK6ap75keQzQ/ZiDkhAloftZQ4coO1NXh6eQrgI68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741157186; c=relaxed/simple;
	bh=T8kgu10A3Ru0S/vPXVlXR7wrs+4T9jiwbZ+e6G/X/VI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCDyhehf51q7o9yElHNrwEx4rmavYrfciXCQHRJWNDdsJqZ8mBjQxXjGDUMnix6PVO0+YmHqmTLg7kbmx+1VU8Nk1+nNsgYWPmFGQ6/8udBc3GH1CXGhOHt8w6j4O7ThE+YVv8/eGfKZUCGY3Q+gUe+crv/kjHsEziUlcbeuhzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YoHMfJlH; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoHMfJlH"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c3cf3afc2bso146052585a.0
        for <sophgo@lists.linux.dev>; Tue, 04 Mar 2025 22:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741157183; x=1741761983; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9bNA98XHBa6A4NtZ0UQAOT1rpXsRwMwVDy3StPnIDc=;
        b=YoHMfJlHJmAWCS5X/ppHt+QVFpz7FvKe+69NvCSaRHTI6bbh2/I30a0t9Kp4XSANip
         qpz7RAGiKeLywQG/wehoi6O4zB+rfXKeyu+sntGTPs5bYWWkNWL1/GpIFKV9wfec1OHx
         OLI1NoT4rjeGXv4uYwJGvEbQSoNaTOgtw9zzyzNOEZPKcyU3MwH7X/aM2QhSaCfywwi6
         y/b9c3tJiX82NmOyfYp0J2xSK+LbcK7oBkkmxUlc7hzYiPVC1Z5pdervkWVKK3L29qNT
         TWaeIrMv3h+SAKNmc1Q1QgJKz0Dv32jhZqQAU7odMwkpgINqnXxc90QSbPKtKYke5YMO
         yhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741157183; x=1741761983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9bNA98XHBa6A4NtZ0UQAOT1rpXsRwMwVDy3StPnIDc=;
        b=hO62zK1x1RZVeCX7fvWMps7i6z8ZHenaGysqb7OpD8CiObR+Hu1xOyc+1BsXykN7EX
         6EH1p9X8gPomKzjewmRBRuyAo9DPdDyOCPlM6tB6s3g2ryYcUs0UqK1yX34BKAPyLEpp
         PDVGdoqSYrIAHGW9+Vmy5GFQNxGejNP8QhihEaZyQ1EhV0kaiYEh2Qf7Mo3hojrbsImT
         4LD9UvKo45rIEia1Zwz9EnyIgG7hIVBckib1cocnA4sxL93OeKzIbKsSYudK539oghLo
         NXq9XYWzXZUmlvNxQElkXe1U1LybZuY5gKlMWN5ZAjZrHzy043FZVp6lto3HnVVfwjGu
         tpTA==
X-Forwarded-Encrypted: i=1; AJvYcCU9uXKBqqlW33rYtdtlL+rXXXmATfKlS5P1GeR9xOZcABzy7bCgY96Pw5nQat2cdit8re45QKc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbFktYaoxfS7/GBWsDpPG0/GJWvD+0uB6xstrnnOlLc0yeQ+/y
	U67lmuVHNHkQGtE8lvhuhsWMibn3IGbJfLleoyInEkL8hm3i29V0
X-Gm-Gg: ASbGncvU5LUODdE081fXILzJb3MuGkWhjXzaBOWblB4+/Wm0QWtmrCcbkJLw+GjdiRg
	I6IEqskFcNk69DZ5KsWvNVCj712dwzJEW19KYNSR5mXzvHvMthdPJezwgrb0lwYwqYZ4Yb/3BGI
	qoVEwOj/LXToo1u0w7Rc+MVCLTN6kBTKYGT4OOz4W1iCLJ5W5vLAMWElcrIuvLMtV4SXlRIVzCL
	dHtdwRWNOfUASoCFOg6nIJwpqJnKwhUNi1SyB5UbEjTkhEyACUm3hYXZ0n8hbdzVTWIGZHAk1vY
	bLQtRCGJuRzUhMDF1rsV
X-Google-Smtp-Source: AGHT+IELWtfqwszYoCcC2kmAJwyH6o+bHtBOPZmt0BU2jCIoX9fDIaH8na6Ue5jCSeNPLr38nklDeg==
X-Received: by 2002:a05:620a:63c1:b0:7c3:b7c0:cd79 with SMTP id af79cd13be357-7c3d8ee1cadmr311033785a.38.1741157183364;
        Tue, 04 Mar 2025 22:46:23 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c36feea6fbsm848972785a.22.2025.03.04.22.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 22:46:22 -0800 (PST)
Date: Wed, 5 Mar 2025 14:45:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Romain Gantois <romain.gantois@bootlin.com>, 
	Hariprasad Kelam <hkelam@marvell.com>, Jisheng Zhang <jszhang@kernel.org>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
	Simon Horman <horms@kernel.org>, Furong Xu <0x1207@gmail.com>, 
	Lothar Rubusch <l.rubusch@gmail.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH net-next v6 1/4] dt-bindings: net: Add support for Sophgo
 SG2044 dwmac
Message-ID: <n7jfcncujogjlysfd6v5bbt7tzun2sicx3r3jq3s5ogm5k4ths@y7wwlyijemgx>
References: <20250305063920.803601-1-inochiama@gmail.com>
 <20250305063920.803601-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305063920.803601-2-inochiama@gmail.com>

On Wed, Mar 05, 2025 at 02:39:13PM +0800, Inochi Amaoto wrote:
> The GMAC IP on SG2044 is almost a standard Synopsys DesignWare
> MAC (version 5.30a) with some extra clock.
> 
> Add necessary compatible string for this device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
>  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 126 ++++++++++++++++++
>  2 files changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 91e75eb3f329..02ab6a9aded2 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -32,6 +32,7 @@ select:
>            - snps,dwmac-4.20a
>            - snps,dwmac-5.10a
>            - snps,dwmac-5.20
> +          - snps,dwmac-5.30a
>            - snps,dwxgmac
>            - snps,dwxgmac-2.10
>  
> @@ -98,8 +99,10 @@ properties:
>          - snps,dwmac-4.20a
>          - snps,dwmac-5.10a
>          - snps,dwmac-5.20
> +        - snps,dwmac-5.30a
>          - snps,dwxgmac
>          - snps,dwxgmac-2.10
> +        - sophgo,sg2044-dwmac
>          - starfive,jh7100-dwmac
>          - starfive,jh7110-dwmac
>          - thead,th1520-gmac
> @@ -631,6 +634,7 @@ allOf:
>                  - snps,dwmac-4.20a
>                  - snps,dwmac-5.10a
>                  - snps,dwmac-5.20
> +                - snps,dwmac-5.30a
>                  - snps,dwxgmac
>                  - snps,dwxgmac-2.10
>                  - st,spear600-gmac
> diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> new file mode 100644
> index 000000000000..4dd2dc9c678b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2044 DWMAC glue layer
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@gmail.com>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - sophgo,sg2044-dwmac
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sophgo,sg2044-dwmac
> +      - const: snps,dwmac-5.30a
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: GMAC main clock
> +      - description: PTP clock
> +      - description: TX clock
> +
> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: ptp_ref
> +      - const: tx
> +
> +  dma-noncoherent: true

Hi, Krzysztof,

I add this property due to the discussion on PCIe binding of SG2044, it
can be found on link [1]. As a similar change (at link [2]) was acked by
Conor. I preserve your tag on this binding. If you have any further
requirement, please let me know. I will appreciate it.

[1] https://lore.kernel.org/all/20250221013758.370936-2-inochiama@gmail.com/
[2] https://lore.kernel.org/all/20250303065649.937233-1-inochiama@gmail.com/

Regards,
Inochi
