Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53984EFFC4
	for <sophgo@lists.linux.dev>; Thu, 15 Oct 2026 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054750; cv=none; b=TEK+zz8j/7wcURFfRS2A+ZGa3IoqV3uq4uSLklI0C1XPI05p905VTlI3CxctN9lmqmPoHtNTj5zmWvwZk/bTCmITPcnTvMdTvHa1uPc8Z5UGVcj/2DC8iQi216dnqiwlu06dVAM+yoMEhNBbNuEPKLqB7d9IwBkhzqInsukoMck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054750; c=relaxed/simple;
	bh=mibTasoYLPRkTtHblHAGE9NyG/cWGdvc4fiuNRggKPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+Eg/ihfKJYb9470O37zF8/5Oavm0jOgZl/jmSRmfJApRGtCLeDu2PwaFUzqYdwStLouO40ji9RGQ6thaQfMYcx0drijx+KzeB5DKcwQhJDrK2LS+QqX4I+4uKAyc8/4q8bawsTMX6e6/Ul0FmGaKwziOdntayaD5Z4FvuH9Yc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ks38Tsl9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ks38Tsl9"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e87c66e556so21603645ad.0
        for <sophgo@lists.linux.dev>; Thu, 15 Oct 2026 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792054745; x=1792659545; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iY/Ca6upnPsDr/ZtUeBJxSM1jnY+ETFKViUNpFJNrus=;
        b=Ks38Tsl9Fwgax2+q/03ixEQgluZSy87yAXCJyMQhEUcFwacKJBEMmbaj7qj7KiWTzW
         pRP3k959W1NxoshvKe/HCBrDI5HPkiQc/w6H+6gOjv+2z++56pYoPjzr7OO4tvz8kjAI
         i5pbVbAzu3uzuDRz62Xioz0qK9Pf0qNneQFPa5D9Zm2/rHhBhtM7XPNk2EDayt5FelW+
         SKkzdElbAh24SlmCnAwv20OAlIbqBpElksUuyuwAc7r1eBIN9YDJg4xIEhowNzb1aXQj
         keP2aHDxyuji8n+xyWPztw3XR4mRdPKqrbQXA/IZ2rH/RMDVyUOmXShol3ex3KFwWga3
         hRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054745; x=1792659545;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iY/Ca6upnPsDr/ZtUeBJxSM1jnY+ETFKViUNpFJNrus=;
        b=FYhK+wEvq5rVgwBbJUmgVCpJt3jBEsYwFKKBXrgV5jJAqWEFb5AlUJup4DQkTNpXmb
         C/5YNT6MTOb3qYhFpselpsqbDeKgoAM9YKKOZzavLr3O9a5Wg/xshs7OG7q6l70pmlaH
         Q6steuueO0nVOoEwn/Gyssl2MNlznqtQAuXACMNV83hCUr6bSWsLE8Ta2Da7ibq3zcSs
         DpP2mbgs2QcmWfXIbfqNsMGAmlNSEoAiVGlU/EHBLswFqq4EEunwwnUKVnLjK9J924zz
         sPb8+mMatOWCE+choEh47FIZUz23NQb+drbqY1cBBc2le/zNyhgPMudMF9Psjbczs810
         c06Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuFcXYuIv9iVvU69EGPv9keVSKy6QnmR5aGFpJts7N9iAVo1atip54CuyBh6SXb/ym5shfa7I=@lists.linux.dev
X-Gm-Message-State: AFq9FYI0D4FCXQRVOx+C2EHvPUIQ7C8I/laWo2kQd4/MESqq/d9y1pFE
	q7VHy/mgbnRyVYvZTjbZ91o0m++B8aBsJ8OT1IGvsIM2OfSafOykbNwI
X-Gm-Gg: AYBFou2/76GtRLOiOEmP0na7J8QllS7KNRxd/hukONb9duuo1VnrKoI9PMKjkJby6NJ
	HUcdX6JQ7PV6168R7C1DKP4lVMm+Nvo+JApRwXcHPEhpM0WmNyKdaLSJYVFUNKHFgELtOB0BlQu
	ydbt5spZdZhaUSg0kj9Ov3MH4QAukG66sNK/C5BUG6WwJUvMKw5Sff+4zJbJjBs7Qk0MBpL56sl
	9tbaKgIepR7KlR1Py3vgvNEhUNh1ngPA5JjT0Whs0yxK//hF0bPh9DwV6G0HnnjQmEdoC0HXAEf
	kc1Uqw850yrCt+AhmdcDG33St/5RU3DV5vG80agko354xm/NcS6rNzEgAL+Ak/Ds4lR3WerKLYm
	G945sMaeZjPgpI8mnFkcraFtybRScMqRlgzpH3UeAtp+p/8dNVwNnegI/jCP6SsLiD4d4+YaqBq
	4d3iKMYGWrjP/X09Hy8vvNFIUNuE4EO4a6P757yG0qmIn+MOEuK2+QQ3/9SJGohz+bFCl0IQ==
X-Received: by 2002:a17:902:f70c:b0:2df:aae1:4905 with SMTP id d9443c01a7336-2e842cf990amr110281435ad.26.1792054744748;
        Thu, 15 Oct 2026 01:59:04 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e94ba30f6asm13269885ad.57.2026.10.15.01.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:59:04 -0700 (PDT)
Date: Thu, 15 Oct 2026 16:58:33 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: Add SG2044 eFuse controller
Message-ID: <atCVYXd5cIkcB0oS@inochi.infowork>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-2-inochiama@gmail.com>
 <20261014-humorous-cryptic-llama-cf6a6c@quoll>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-humorous-cryptic-llama-cf6a6c@quoll>

On Wed, Oct 14, 2026 at 01:43:29PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 03:45:13PM +0800, Inochi Amaoto wrote:
> > Sophgo SG2044 uses eFuses used to store factory-programmed data
> > such as ROM patch, public keys and other factory information.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../bindings/nvmem/sophgo,efuse.yaml          | 61 +++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> 
> Filename should match compatible.
> 

Thanks, I will fix it.

> > 
> > diff --git a/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> > new file mode 100644
> > index 000000000000..d4bffe2724ac
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/nvmem/sophgo,efuse.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo SoC eFuse-based NVMEM
> > +
> > +description:
> > +  Sophgo SoCs contain factory-programmed eFuses used to store ROM patch,
> > +  public key and other factory information.
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@gmail.com>
> > +
> > +allOf:
> > +  - $ref: nvmem.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sophgo,sg2044-efuse
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> 
> Why is this flexible?
> 
> Best regards,
> Krzysztof
> 

This is a mistake I missed. It should be the only clock, so maxItem is
needed.

Regards,
Inochi
