Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF4721D3C2
	for <sophgo@lists.linux.dev>; Thu, 13 Feb 2025 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739445497; cv=none; b=oYTyle7WASh5HtLQTgsYeFB9mOS2wRXOWcAgAClO//NzLAZcpvi4RseRLaySh0ragg99cr+8UB7XuwexUoA6waSoNQg57lQP5ZVprLwjpD6/wDwVzOhLxN9jaxvQHHU6d+gkjogsJCAKsVs1QDE7fnf8BL7h0Of6D7v2WZxR9CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739445497; c=relaxed/simple;
	bh=9LpzrPq1k/DfBL7MweeRVJA4rDbePodzUAIyyC7lXQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuDuOSJ0gbQfWRyXQoaxgM+6B3F0W40WDDsstz7GoqgIFMGdeQEdDgdcY11YY8N8fFnMePl8pEwW7k0XJ0amiHkeN8w6bdbtMIlIwcQXf5/2moCrx1ohv400Xdu4EAlhpwNe4xS9AitlCjYdyUWfGhOxMKXIJQMvy/iKNLHV9aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ma+pNzK7; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ma+pNzK7"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e46349b7daso10448426d6.1
        for <sophgo@lists.linux.dev>; Thu, 13 Feb 2025 03:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739445493; x=1740050293; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jWa5V9+gOF0Da18gHiRuUCSUVEFQiY42ni6Co3x+yiM=;
        b=Ma+pNzK7VTWhPVBpTjrdy7k8qu1E6Dcw0d+oU85cyfXxcdtUWr46BvWOuapqk3A8hD
         ORMBLV291q/Q3Z3k2CejPvGVyRQFiyTU9ICUYsEK+IWICr9qQFwXqVbhANFxv9yAHdpr
         aVYda+B9HLBoUbEfjYPA4h2ZbRSZz5RT/ctW+6+x7qxhh0h3cCQXmCYlV6FNfgNrudHs
         l9NvJfGJw5FKWBkBARAVmFHja+rGXi/PH1ekvf291VpZDL+MRiuAcvjiarDZ4c12rl+x
         ug5ik7LInKWxGa/56hYPiSYzUt6cn1SlfjiLCMzKz7uHo2rgcfvg/3OHkkxOiRvapl0z
         HwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739445493; x=1740050293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWa5V9+gOF0Da18gHiRuUCSUVEFQiY42ni6Co3x+yiM=;
        b=DXGXt0uLbyNugpxTO3Ul325njnVgbYo7nAju64DlOrCN94nlS3/3cf9rvaQImHM8l9
         yteZFbFOYl9XLQVDlZM042DS0D/sGCNvkqcS0CwGxIk8lyvbXrjRvdLSuJXORSVkYgTF
         5Bo3q0Lm+0Llx4b7GUShOtDuqLLTCiR1QGAj9hpSX93qD2FPypno9hENtKe4D2u31uMi
         7EKrXbmoRHu+6/zf3QeS/ec62afhpYESu+TO24iWQhn/ZTxoFvbA/hPdOvVYbdNS21mf
         R4z32cCBBz/72mZIlc4TwyOvGUKIjCCAkgwIUu09mL+RyNBYsGOLk+Z6MBIPbiX6DjLS
         Al6w==
X-Forwarded-Encrypted: i=1; AJvYcCWUO/SPQLtFhx6UAJ5RT66DIemCb4yE0GntjkitinwwEWPRCB+uj1ZolbD7vjwdI/mlXp6n4uo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdGI8o6w9HUGui1jBfY2uBgYxVPthOJsivqBSQUuHt+bn+/HWB
	FjNAKSp3hSQCxs8LRU48asyAlhsx3HHRteTJ4t9mdyjzAVfJVhYb
X-Gm-Gg: ASbGncs5BQPZ1N3W7JDSBVcOWFoDVKmodKuxR7/WMtjJxE6rxgm27g93imNf9vt8i4t
	ZJmUbL+XnsJYCkf5MfhSwIHD5y3BW6uCJFM6x6uytjX/YHDOkVN2l8F8zoDcsxJYLqC4dUlGc2r
	wo9MsC1rzrBBn9D9/W1f+PLpX/sVK9NkNM0RlpY1p7joXiHVSH19BN4m+LF6JfQMSg6nvDzo+hD
	wFTvobfi9xjQTem9vy31vNsIpbiK/zIt4XzumKQlEEtRCVtsBtgg84G/JjQYMEaXXY=
X-Google-Smtp-Source: AGHT+IFLRibe0XYKyIJjpp/EoUMufvpGHOsU5BVQtHPrYtw6m74u8WCyHY1uY/X0uZMhys3D7yZtUg==
X-Received: by 2002:a05:6214:5655:b0:6e6:5ede:7d83 with SMTP id 6a1803df08f44-6e65ede7e93mr16129926d6.25.1739445493556;
        Thu, 13 Feb 2025 03:18:13 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65daffdbbsm7895126d6.99.2025.02.13.03.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 03:18:12 -0800 (PST)
Date: Thu, 13 Feb 2025 19:18:03 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: reset: add generic bit reset controller
Message-ID: <j6xw7cpk4mfggonh5dhqz7dqj7abo75sojaann5pv2uar5en67@sdo2ygvttzqj>
References: <20250213020900.745551-1-inochiama@gmail.com>
 <20250213020900.745551-2-inochiama@gmail.com>
 <20250213-cordial-elated-grebe-57aaae@krzk-bin>
 <619128481807b279e5d3b7967b00e7f094dae7ba.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <619128481807b279e5d3b7967b00e7f094dae7ba.camel@pengutronix.de>

On Thu, Feb 13, 2025 at 11:22:07AM +0100, Philipp Zabel wrote:
> On Do, 2025-02-13 at 10:35 +0100, Krzysztof Kozlowski wrote:
> > On Thu, Feb 13, 2025 at 10:08:54AM +0800, Inochi Amaoto wrote:
> > > Some SoCs from Aspeed, Allwinner, Sophgo and Synopsys have
> > > a simple reset controller by toggling bit. It is a hard time
> > > for each device to add its own compatible to the driver.
> > > Since this device share a common design, it is possible to
> > > add a common device to reduce these unnecessary change.
> > 
> > SoC components are rarely that simple and even if it is just a bit,
> > usually it is part of one or few registers.
> 
> Yes, in those cases (which are probably most of them), I would argue
> this binding doesn't really fit.
> 

Yes, I agree. 

> > Anyway, there are already bindings for reset-simple and I do not
> > understand why this has to be duplicated.
> 
> I think the motivation is to not have to add a new binding document and
> modify reset-simple.c every time there is a new SoC. 

Yeah, this is the motivation for me to write this patch. It seems that I
describe it in a wrong way.

> I wonder if some of this can be mitigated by adding just the 
> binding document similar to trivial-devices.yaml, without the
> actual "reset-simple" compatible.
> 

It is better to keep the original compatible. Adding new base compatible
will break existing device and make the migration hard.

Regards,
Inochi


