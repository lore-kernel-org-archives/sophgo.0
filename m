Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C47238D53
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630296; cv=none; b=t+CV9RZfqm4BUSde4CaJ8m3QloUIhlOe1l9uIoZptheD78gm4IpZxCJhWrqzCX782kh2JB5lU/8yKeHZechaBFLtkLOIuPD30RyvKjVw7B7gzD0XWUVGQKNp/B6PneW61e9sLx/Cxw1ast1SLcl3YfvzlYIi+VWrUavj45BmLSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630296; c=relaxed/simple;
	bh=B1Tfjt80+dGutPeeGdC8bxfRXEk2YUaC3CwohjsKd50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8w9vjJ1xGdGYLg2Xz/1XHkwNyBIoyGsGuk2EHsWdcgPTvt6bhRSPzJNiOS4Vr/ScsZDP5jzbxn0v7PzIBepNx6Bl6yr24QO12vZuL15ZlLVCAbuUjwIftvyXqyXKBWGUByR+jcvBL+Q25juIbiErNRAghSqre/SDcTPpeFlB4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXsTDLcT; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXsTDLcT"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c922169051so360760385a.0
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 01:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749630294; x=1750235094; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BidLvrmOmqABz8QFweaiXGgnxn0STrjzzVlTkfXyV+8=;
        b=TXsTDLcTfGbDcHLogjWV0AO2yWs+JFxGTAaTUDANHFgegLC0kncc+QyIM8SdkRu42+
         YMxF1WlcJ3DyD4np9f7S894C7Wo5QU7edyHEbF+dGNeFYuu0oKxG/4KWOe0RUOuTGsEX
         MdsG6xfpw1DiUMCalbkr3V9jW34fzs1RsE5/ITaGyoDvMbqqwMvdXyLGL2Pi4QpgqnEQ
         kcfurvm1gUjcHgOLzPOGiuefGZ7w5MswB9GlOf5sl+c7RFPvqVzRKBMsWtjdesm4dMpv
         z/0TdFKZH37t8OHnHMuuZRVY6iFex9TJ3xELpwwsgc+SPrGwNQD9uJep/Qeifbg4xrBP
         Up8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630294; x=1750235094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BidLvrmOmqABz8QFweaiXGgnxn0STrjzzVlTkfXyV+8=;
        b=bOB6r4LZG9oSb4cThnX7gQBx/cToBYwhR1RgQZxMGFE/FpbrKG7rLKn0PMUT8c1IgL
         l6nOFF4VuD94xVodsqWU7VyS4K8asnubz1XS5ffCYKn3EU6jqDPbn4dXdxbjH1cXjkml
         cQwoUyM30+C8jdT2ubZV4Q5W4mNWfcCFv+KmVauTprJl7xKtdfbTS0qwfmJhhPjdmnaK
         QrTPAzbkOtWeyAJz/jsReDSYYABqsbDCyAhM5n5cLIcbSSruNr9HehzE5NFzRuDKf+Z8
         vqByNhISl/vrF7su5Rni/ITsbKAUQcE9NmGAEafYxh7HI8X6UZfck8isKw50VtXVOInj
         z5fA==
X-Forwarded-Encrypted: i=1; AJvYcCXJwU7vs7AOmwJLNq4w5bdkbDTF/o/5hc0L45aq3ssBjIOv5xcF+BOEpR9QdaNIw30dv2vEJGY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoC/BK9EFFf+i7+qcjWtLLbNg1O0akhI9hmOM9suIk9HXAB2Ci
	MgxRTPxnO7aZlZdVBJocMkgprjyNSXZmxh/1VqFNEKBvcnSe6YtFsh9P
X-Gm-Gg: ASbGncu/myFsOL+2ww6Pjzj3JgYKpxLRH01ph9Qb19bJp6gddRTtf1N6+YsUkY0scAX
	y0uVhChPtqRQ9MksrQSzYQ9A08ddvgWpXELQt4pIVZHYqdnDPwy15LqHax9iWjHzJNLh0CTi/IN
	74CEvjN99qtvnmx80UXRDUNNyuU/ERbKvoe8CbSaJLQB64NLszTLKvg+l2fhqSNXY98Y23yETrG
	zIOKAZUpJIpg1aCvRalrdBSUymLRjF9G4Z/ruJ/NewlFM3q8wpRWcvFw58Mk4FXeA1BNe0bg2pu
	F90pCkjVlGXEQobN4w4HpdhS8CqWm046fuPdSg==
X-Google-Smtp-Source: AGHT+IHb2MLjUBYv7CB4OtR5rJJhMMfCSImfLyf7zcPSqR4AyQunE+RrQVFB6oFjHFdz9IskAQDceQ==
X-Received: by 2002:a05:620a:2955:b0:7ca:f09d:1473 with SMTP id af79cd13be357-7d3a88ae947mr345558185a.28.1749630294098;
        Wed, 11 Jun 2025 01:24:54 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ab8a31sm79287166d6.7.2025.06.11.01.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:24:53 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:23:45 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vinod Koul <vkoul@kernel.org>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Message-ID: <ycnj5ke42kpqjwgsjoo3vs4gibyr2i3yr63jfwbeajo5unqqmx@xdt4xwhcjbna>
References: <20250611075321.1160973-1-inochiama@gmail.com>
 <20250611075321.1160973-2-inochiama@gmail.com>
 <20250611-brown-turtle-of-election-87c324@kuoka>
 <f74e217e-4a6e-4ba8-a89f-9518e2f74fda@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f74e217e-4a6e-4ba8-a89f-9518e2f74fda@kernel.org>

On Wed, Jun 11, 2025 at 10:21:07AM +0200, Krzysztof Kozlowski wrote:
> On 11/06/2025 10:19, Krzysztof Kozlowski wrote:
> > On Wed, Jun 11, 2025 at 03:53:15PM GMT, Inochi Amaoto wrote:
> >> Add bindings for the reset generator on the SOPHGO CV1800B
> >> RISC-V SoC.
> >>
> >> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> >> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> >> ---
> >>  Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> >> index 1d1b84575960..bd8dfa998939 100644
> >> --- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> >> +++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> >> @@ -17,6 +17,7 @@ properties:
> >>                - sophgo,sg2044-reset
> >>            - const: sophgo,sg2042-reset
> >>        - const: sophgo,sg2042-reset
> >> +      - const: sophgo,cv1800b-reset
> > 
> > Keep alphabetical order. That's enum with previous entry, btw.
> > 
> 
> Heh, it was an enum when this was acked.
> 

It seems that I have made a mistake when rebase. I will fix this in
the next version. Thanks for reminder.

Regards,
Inochi
