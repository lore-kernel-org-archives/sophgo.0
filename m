Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89358226CF4
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 23:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068772; cv=none; b=Ogtxh/Mh7cqRUyzPUKZTmUC+kEgsrApF1YAXE8o1ZO+LLdXl1QQjQFhZBTsFzK0Q4uPxM3hmFPG0scJykHRVonqCcPZzE9a8JsY46MdZze3SxMhIVyG+qVxQ5Pgg78c/rSq0NyZHZEE/BOOKPfApQz2jmiLo2/BPjaFsrQhXmL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068772; c=relaxed/simple;
	bh=dmuKXMQ/caR//xPi4FKmohokbL649GqU+5X3flfmL4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6k2WYw8w6YnRgA/LJmDouL8yPw48D92ceZ7X7mK0wGjpIEdDc01B6n0ue1X76O8WvC/TiWvgs5SPVPg7QqP1qxnyddkzyeTOCnsgaTzOaixipyCSD5VKj4b9gP2HZb80e/obSNJCvZ9V1yTxmLlnKIM6LNFhJMfsCFIdkcWpNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0ki7t8h; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0ki7t8h"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6ecfbf1c7cbso86452546d6.2
        for <sophgo@lists.linux.dev>; Mon, 07 Apr 2025 16:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744068769; x=1744673569; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gce3tpEJQvbseQHEqMDIeqXwjb5hnF6K+vDTyD8uXCg=;
        b=D0ki7t8hJlxpWHVD5FXeGQW7nHaxG5vyPlpfPgeXeH0H4YoK7KnCfz1Y/ScwBn/gai
         +pt9ZF330NzwSN5iEQLtpNi4Az18IuP6QHA6JZ8PwIkVvYPbFdQkSfgATJEa2eH1dct4
         1DCo9fhuXfh4H+ScRM2TOlyXKxLsKpcr6mygMMt7gbBQXVcWZWcEcREZ48gwZjWii39Z
         +jaOg1LGl8p/xS6KMM5fRvMYD2WUEihA/1auk3LP21UI502Gtq0QIFUK/UEk5vuviMa7
         C5qVFHne6nGfY47d7hc42tG1PuJYLru4B/lId/mtjzyn7ikm3sEBzyY6dgfQurMNLpa1
         6FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744068769; x=1744673569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gce3tpEJQvbseQHEqMDIeqXwjb5hnF6K+vDTyD8uXCg=;
        b=dqf4TmS71OQPdMZT9GaWVd0hmU8PN9bIkGXf4NZDJRK2dPHuspf6XeucTmDBsCZ1g/
         v7qb5KlBNjid4xq1ceHxxbcxPCuFg23JjASLvOg39934+NWTJIVgutEQARpXrygZHFNZ
         6yEJ5AGhef6l5QntTakGT2fPpSViqidKkEUgmdOc5tlhrEB8CT8R8gvA0OsufbTJHvf3
         5BOJvQpidCx1F2A8e6GILH5efY+U4h+WFBW2v2kZHjrHJAeVok7PuqwwwO8WWxbAqyXs
         5eYUuIKkvn8Qe53cFwygSAi4SxV/vXP9PKhYvNfp8q0poiEKc5LYP/pQ8unoYllYdv9/
         rOVA==
X-Forwarded-Encrypted: i=1; AJvYcCW915MA+1zY6nkgZvHa+5cA4ZuK49buX4alNpLu+PbLSYFPFwOcTGQaXz/UxMfwDjZsGEDjGOk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOFvatKsvoFL4XdL+JKYVaBYZgFPXXWvsByjWk0wyeFOadGTJK
	f1Gbam8++/BLCRbBM4CEqnZv3oIRRrlHfrfSwgi1XgljLqmLzmHi
X-Gm-Gg: ASbGncsRHVUC5YFUwY8Okqc+C5AcXwKna/MGuj+mgL/ITPqSIcuWSuUhzdCOPSax3YH
	0Cq1nq1Zk8v9plrgn/SztWd5BynNFkn//HAyOx2ikWCbXZvl0g7LrhgxwxDFhUajoCC58OGqX+H
	78lRbAzB8PZd2TzLn1GS97hWtkEHCy80w2PEscx4hKp3Qb9IfivvU7YSBUhF2i2r1V4TKhVUvcR
	RkpTQ1dzku33vegwH+gdPgzlMXZqr6LXYSbC+oNNGeAO3easTDasuYYu/nKIvXC2ckZkF9b120p
	qLuq7yXkvIE23O6Hae7N
X-Google-Smtp-Source: AGHT+IGGFoQKhq8jM/xnT/qx+VBX8ceaYU/gWDZkhtX4DqhWCeEET7bOo/0E0kCVyVbHnelemU4pwA==
X-Received: by 2002:a05:6214:493:b0:6e8:9021:9090 with SMTP id 6a1803df08f44-6f00df2bf58mr216384456d6.26.1744068769391;
        Mon, 07 Apr 2025 16:32:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f164dc6sm65186516d6.120.2025.04.07.16.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 16:32:49 -0700 (PDT)
Date: Tue, 8 Apr 2025 07:32:14 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	ghost <2990955050@qq.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 6/9] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo
 SG2044 support
Message-ID: <7wklz2qbo3pej7plhdwcuwilbkntfiyuadjpihuhedkvhgvz6p@3h2hxhw54lgq>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-7-inochiama@gmail.com>
 <20250407140015.GA2164748-robh@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407140015.GA2164748-robh@kernel.org>

On Mon, Apr 07, 2025 at 09:00:15AM -0500, Rob Herring wrote:
> On Mon, Apr 07, 2025 at 09:06:11AM +0800, Inochi Amaoto wrote:
> > The sdhci IP of SG2044 is similar to it of SG2042. They
> > share the same clock and controller configuration.
> > 
> > Add compatible string for SG2044.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml        | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > index e6e604072d3c..47b5fc1b8e07 100644
> > --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > @@ -19,6 +19,9 @@ properties:
> >                - rockchip,rk3562-dwcmshc
> >                - rockchip,rk3576-dwcmshc
> >            - const: rockchip,rk3588-dwcmshc
> > +      - items:
> > +          - const: sophgo,sg2044-dwcmshc
> > +          - const: sophgo,sg2042-dwcmshc
> >        - enum:
> >            - rockchip,rk3568-dwcmshc
> >            - rockchip,rk3588-dwcmshc
> > @@ -74,7 +77,9 @@ allOf:
> >        properties:
> >          compatible:
> >            contains:
> > -            const: sophgo,sg2042-dwcmshc
> > +            enum:
> > +              - sophgo,sg2042-dwcmshc
> > +              - sophgo,sg2044-dwcmshc
> 
> No need for this hunk because the new one has sophgo,sg2042-dwcmshc 
> already.
> 
> Rob

Thanks, I will remove it.

Regards,
Inochi
