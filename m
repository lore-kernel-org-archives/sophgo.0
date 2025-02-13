Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A195C227E97
	for <sophgo@lists.linux.dev>; Thu, 13 Feb 2025 11:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739445988; cv=none; b=a3W2iG3mCfRGzVGU/beDqCuVKRw1jqIJs+xodpL3JYqtOLLMn8B2Lpi6VVNr+b1BU4CTcWG6q7XJG1lrV0VVr2l3h/1h4t5CCZznulB1RwiaPXrKboXZd7HVxdGr8HV0ZbqeLaFqpBzVxExF6txi96Fd6f+0O/eGOZ6g/XgjrZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739445988; c=relaxed/simple;
	bh=cnh/7/zjc5DJNspE8+HHSdkJj2bWRf+SQNBW74wjlrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BX0g542lGOAeqVrJfEPQ2pMXFf7ZekKWTChuieKBKYOHLUuHyHJdlnqLgrnPJrfmeCVOqjm9I3gGDcGP2uUNOOKnDXntfOR6HWi96KhJ0GOZzjnGCNXQ03RIg9FsR9wVYePSSDTQ4dLmhq4vd9KQveJPg9FPhUg7o0FieeAvMbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1LbCA9L; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1LbCA9L"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-471c8bdabcfso2001851cf.2
        for <sophgo@lists.linux.dev>; Thu, 13 Feb 2025 03:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739445985; x=1740050785; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QUTfDmvy5Bhdv7Ab6yYlWq1JIjBJXsMdnuekE4YJLOk=;
        b=T1LbCA9LEMXxGKhCEP6iU7vfp9OWN4QLSUhfjWmAO8tmT8jW6FTfA3KAs8W9moVy4x
         +F+N8TshDcPCZ11aGKhEkS0iHtH4RT/ko45nfi+/Qyr6gtSiMemTdYqdAIzkCZnCx2uP
         GL8PqbqGDwA2gVCiNi7BPAX47sN5yk+aEcIvE+r6nRhRB35WHua0YYlT6oBYF75FOxA9
         yQwyV2IR6xRCTzptZZvomOxJ2osz5cxTwMO75dLjTaIQkb6rM7nx4ZiodyPQ+zKFuryT
         eNkjhqHpTgcEumrwcrOwQ2kEdBWH6K+V/grI0diufWLxNT/k+GmyUqoJOPYmChbAqyjK
         c9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739445985; x=1740050785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUTfDmvy5Bhdv7Ab6yYlWq1JIjBJXsMdnuekE4YJLOk=;
        b=ZBLUXSf+qCRVDjRL6D1RyplwlGj+OxOhCU02uMzp5L8qioZrZXht0TyqsxyNZNjwRU
         Igj+2XcKeEYUPPIidUGdpfpIjckdjY0rx5LJH5dSDo4BgnlytiMBkKqf15FtmvHPwKJ/
         y9PsTorikNGW56Pi7tfUo9/rLf5afi2xhs7lkGtLi+u7bDGs2+gmJjl0lhcZxaNY7ah+
         xU5uWYBxujRDIG8Vw+2y6ztQCWjbORLiDGvTp/OQuDmJEMD1msdANCvUJ/s5urAEVcG5
         c+csHNYAZUEsrQikRZvVCN3aXU/kxVGLZh+OfeiYWDs1WZcerIwEjeZm02vAIl6oFNRQ
         bEQg==
X-Forwarded-Encrypted: i=1; AJvYcCW+8LXJiSnhTdlnNdVVxGjiP13jngLN09OmfNbZQfaZDzfxLeR5PKgC1rpGFgyl1kD1uN//hdo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFih/n3a5Ybw3g6H8nW5M/IL37cfjoNA/3YQVBqN64GNCfXHKN
	tUxKHhDgbhtLmsSjR/lxWkVFgdM4ilB+/7pbbn89DhBUbE9DW0fU
X-Gm-Gg: ASbGncvULhtH8Kx84xSes9nTlnyV6dQ4lJqIDMoEL50Z6HDqeXdQNGvDBbLtjGvr4+J
	zrdBuuBpBbtDdq1+IQCXDXGgIbXLFikT3nhWMUp/ZwhWPY/+KSDg4YaNFQdMLPxvQXlIz4ysVLD
	RsMS8wi0zscEgzG3IgvBFVOw9wwyIMTwtcSQNxkvYPMFrY/nwxnIw4QHZVuvhU8alR4PsSUesRj
	dXgpjkvBqeU9jnka9FumgBY422aVoe+xfpjiw57waMN3UvHNmMP0C+SKTgualD+a90=
X-Google-Smtp-Source: AGHT+IHarKxPF7Mq1Va3dpnA4qdWkYz+da0eCf7AiIm5qMplxsfMjqtaZ8SbX7mt6EAyGdIMQeVqtQ==
X-Received: by 2002:ac8:5ac5:0:b0:467:57c8:ca31 with SMTP id d75a77b69052e-471bedbbe05mr52875421cf.46.1739445985449;
        Thu, 13 Feb 2025 03:26:25 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471c29e9428sm6781241cf.7.2025.02.13.03.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 03:26:24 -0800 (PST)
Date: Thu, 13 Feb 2025 19:26:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: reset: add generic bit reset controller
Message-ID: <bzzwckg2ac2q4fkcp5jju5ubqmget3jdwmvcubdmc4xp3slmwn@hn4kmkotfnfw>
References: <20250213020900.745551-1-inochiama@gmail.com>
 <20250213020900.745551-2-inochiama@gmail.com>
 <de7dedf98e2085c895a93ba56c4e5fa50e298d05.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de7dedf98e2085c895a93ba56c4e5fa50e298d05.camel@pengutronix.de>

On Thu, Feb 13, 2025 at 11:08:59AM +0100, Philipp Zabel wrote:
> On Do, 2025-02-13 at 10:08 +0800, Inochi Amaoto wrote:
> > Some SoCs from Aspeed, Allwinner, Sophgo and Synopsys have
> > a simple reset controller by toggling bit. It is a hard time
> > for each device to add its own compatible to the driver.
> > Since this device share a common design, it is possible to
> > add a common device to reduce these unnecessary change.
> > 
> > Add common binding for these kind generic reset controller.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../bindings/reset/reset-simple.yaml          | 42 +++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reset/reset-simple.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/reset-simple.yaml b/Documentation/devicetree/bindings/reset/reset-simple.yaml
> > new file mode 100644
> > index 000000000000..77584e23e8e8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reset/reset-simple.yaml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reset/reset-simple.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Generic BIT Reset Controller
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@gmail.com>
> > +
> > +description:
> > +  Some reset controller devices uses a simple method to perform
> > +  assert/deassert by toggling bit. Some SoCs from Aspeed, Allwinner,
> > +  Sophgo and Synopsys have this kind of reset controller instances.
> 
> I think some properties should be documented that make reset
> controllers "simple" according to this binding.
> 
> For example, right now, the reset-simple driver assumes the following:
> 
>   - There is a single, contiguous range of 32-bit registers.
>   - All bits in each register directly control a reset line.
>      - There are no self-deasserting resets.
>      - There are no timing requirements.
>      - The bits are exclusively resets, nothing else.
>   - All bits behave the same, so all reset bits are either
>     active-high or all are active-low.
>   - The bits can be read back, but the read status may
>     be active-low independently from the writes.
> 

Thanks, I will add these assumes in to the binding.

> > +properties:
> > +  compatible:
> > +    enum:
> > +      - reset-simple-high
> > +      - reset-simple-low
> 
> I wonder if it would be better to have a single
> 
>   compatible:
>     const: reset-simple
> 
> and a boolean property, e.g.
> 
>   active-low:
>     type: boolean
> 
> like in leds/common.yaml. Also it should be documented clearly what
> this means for reads and writes.
> 

Yeah, it is better to have a property instead of defining a base
compatible. With this property, there are two ways to process this
property with existing device:

1. If device has defined the data, the active-low is ignored
2. If device has defined the data, the active-low will overwrite
   the device data.

I wonder which one is better?

> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#reset-cells":
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#reset-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    reset-controller@1000000 {
> > +        compatible = "reset-simple-high";
> 
> The example should probably include a SoC specific compatible?
> 
> regards
> Philipp

I think it is OK. But I think it should be added when a
specific compatible is coming.

Regards,
Inochi
