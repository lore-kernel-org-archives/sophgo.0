Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABCF27A911
	for <sophgo@lists.linux.dev>; Mon, 28 Apr 2025 16:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857300; cv=none; b=UoIsxTNiHZcv3D28m4UbCsDOyOQGH1LKiammZEo5k2mlZUfONtowLbL+TUrYQt6hEYQ4kYqs8QJs5Ye6Ii4QdAktnXRlLzJNSeJ0U/mLdxNeVXT8XgzRs4lneNv8XcZBwYnWNu3KgGJfQTeuFb93TtXKZHMLs6P0ot30Qi02SD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857300; c=relaxed/simple;
	bh=VPZALAjR7Zdva25NLVz5KQEgfQ6d4QldoSci+gyc0ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PXwaNSxnBLhWATf2nI4LzrRu7ECQtoFOD7ov+sst+9z9JHqT5zFZrEH8RF1Ls3jaKPnSj24xvc08dfaWvyfJtd5j1dddH381vp3yFbjSYWmDIOz4PC9xYMWt/if2QocBVQXy+ex9sx+rRyBUs5jgwQ9jFcs17c2ukG0t+p/gM5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EIDeRXel; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EIDeRXel"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e73120cc26fso3081644276.0
        for <sophgo@lists.linux.dev>; Mon, 28 Apr 2025 09:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745857297; x=1746462097; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WOhasKd6micKEiWT/MKXPBW1f7I1/Q2+vdBpOz089cI=;
        b=EIDeRXelVADEe8jRFguQ95iRSdLQ4Mwik3LQXFYvnbFiv+ztYwGMf5d1WIxo8N2qNF
         sbH75Kz6FGuH6j49AQOW171SDKCaAOaLcu1UaO5Prmvpb4zkfZGTMiEOQyZvm0Y49hUF
         W3CmFaQcCquIB+IeYW6NrI8lYnzoZpsEH2hwlgOxJgI56BIsZQl4TK91r/qMFO4W5BGr
         9/EupEazcrtkmQomr73H4ag1bgjcbGgMGcpYgQeXbmrDMnIgy3MhE4aWmlRv/VNS+TiI
         zu5KcKfzw4TMcjN76XUPZFD/+Jl5rmVZhwboidfbVB83fYwARgdqsYVcbYDDQSR8Vs3r
         d+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857297; x=1746462097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOhasKd6micKEiWT/MKXPBW1f7I1/Q2+vdBpOz089cI=;
        b=OWVcOo/kwsiKCELHw9YvkLkVqwnZxdjcn+myLyleOpS5iAiDUe4YetuX+TJizT+MNE
         smMzcHUjBLZIhTlyB6I16woViKignPMj1wDhEX3qWii3nulLDZMN29uVmQ+zVMskE2HN
         M68KfhSMW9yZUzeE/3g76DO6FvxvSnzL2hynFOvI/LukvY5/VRGYrGFJDtqzUb4ruNAd
         YbD973PPV7k8yt0sJmj5eFq0Z4lSrwN0xEUXbsv+ScwjbrvPha1gGlGop2gzau0IG0N7
         rasuN3oeUSA21iW/PXcdm8SnM7RF+YHXwbLTezhSAvXTLO7RKNHZMXoW1Ux+b+Fwsuw4
         JjCg==
X-Forwarded-Encrypted: i=1; AJvYcCUjzlpXMH009V7bIRBB9eiVv/3TURzOmM66JrsbEmAyqoF9IYaGnBt5/geowL0LyaZwmoRUF1A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZTRqwEYf67gG/ozabLiNmVoXxdBaoIfYim4U2J1TycfbkzLRK
	DAZ0XI4oIfXJob6AcoZO1IbAeCojSYGXJ2ypdVfb6B+XS2wdiTh9AuK4zolgCKhgiM4Qen3kZeZ
	VMTp6BNyt5woW2wOUZdfOyxgc0rTf9IobkbY+nA==
X-Gm-Gg: ASbGncs4qjJ9Ldyyb6BJeo4TwutBhcYVuW/L/MjtV653/0VbKVjCCmPB7vt2iQwzaPI
	vRj1FBtfw009y/irdP6LP2wdNUkx8waNg7UJbBq6ywt0iPIkOZBbRpquYLG71CR14lBpizBO6Hg
	o0bhOr1R3PInf2eS+W6tZ9Uzc=
X-Google-Smtp-Source: AGHT+IF2+lLJogWYmJ9CklQNKtsYDG7mA++udTlmO/sYgtKfw1zcHF/zNyAnw+6seYbb5sOJx4PEl6rhupOOr/4EHRU=
X-Received: by 2002:a05:6902:15c1:b0:e6d:f0a6:4cd7 with SMTP id
 3f1490d57ef6-e7322febd09mr12474369276.0.1745857297087; Mon, 28 Apr 2025
 09:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250413223507.46480-1-inochiama@gmail.com> <20250413223507.46480-8-inochiama@gmail.com>
In-Reply-To: <20250413223507.46480-8-inochiama@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Apr 2025 18:21:01 +0200
X-Gm-Features: ATxdqUHo5zpHgBeVnQwujIcWP56iQkcuhTXqhu8H3yGRlHLlrSHxM1LpwpFg6CU
Message-ID: <CAPDyKFrM32TVAHzSoMvmO_ZW2Ax=RQmH_7KqSGgqXTOc20UnLA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo
 SG2044 support
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Apr 2025 at 00:36, Inochi Amaoto <inochiama@gmail.com> wrote:
>
> The sdhci IP of SG2044 is similar to it of SG2042. They
> share the same clock and controller configuration.
>
> Add compatible string for SG2044.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index e6e604072d3c..5fb347167004 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -19,6 +19,9 @@ properties:
>                - rockchip,rk3562-dwcmshc
>                - rockchip,rk3576-dwcmshc
>            - const: rockchip,rk3588-dwcmshc
> +      - items:
> +          - const: sophgo,sg2044-dwcmshc
> +          - const: sophgo,sg2042-dwcmshc
>        - enum:
>            - rockchip,rk3568-dwcmshc
>            - rockchip,rk3588-dwcmshc
> --
> 2.49.0
>
