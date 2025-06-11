Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB572239E72
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 09:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749635231; cv=none; b=fWtCJVhUNQZsDoVg7hdUpYwugpMrLArujAnsWsmHDtzn0Ph1HqvrS87jS+6wuR/xmvsOzVhH4ab6lU58fpO8d3iofHzjrtnIYWdGQ+tCwoqy87ahwuZ+oSAUhnjM5/I9ehwZxnwH1VQokfWQeXcg+fr2RvE22dJ1a/xhlYftYrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749635231; c=relaxed/simple;
	bh=QY+5Tek/02AwNhLeuvLKVoyIRN55q5XqE2CxxS2Khq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQQcXvkJiRv+dLO3lptMmEKPjQQYRulGz0JXGxiIH+Ano9qxuvV6Y2Pl+D36iUtB3jq5CkatDLJcPZAzypwrP74G5/KGBFrVxDsr+apDGbJj3btlD8dKOzMPBn4cJIparWGHwG0TYCGty9bWP7MaA9XAoPRm1hy7YJ7tF1VnUAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0BjD33h; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0BjD33h"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a6f6d07bb5so38529051cf.2
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 02:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749635228; x=1750240028; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n9rPiGNTaPA7/GngQM8aAU/prJJW46EXooVz3Uq/Q3M=;
        b=M0BjD33hRwlpdr8T5lt1yLqTtP2KG90wsYQsY5c4qcMygtxoQnCFcLA2S1Z4zRNo3P
         2dqWFseTu/Xj4S3fsug+pf5e+NtsHRle9CTuclNk9QSFCLjwUgPDHwpbOPRm1CCvOu/9
         OvBfxZKnQl/1R4Um5nPdSmyGvR+0h9VeQeMlMnZgd+mnpj+THC3MDRcyA57GWP9F+GHB
         WChw6ASqlHinuekljI/22SJVVdoZbM73Q98ZxCLU1BFHDkNEiJh2a/PhBb2gXm1zodMH
         S8GE+S0KDIRI0dnH81Fe2SuhRRMI52mtBHlKSIeXwpWV3PC7f/X2VxzMVMIyT4JuNgBa
         PxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749635228; x=1750240028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9rPiGNTaPA7/GngQM8aAU/prJJW46EXooVz3Uq/Q3M=;
        b=JTq5eQ+Vt5fCX96xcv7Ed0veRcC64WoBm0yMLeUDnA0OzdYBKowjcqacnBQAiinRj3
         HNIog2R4bI9VsGX+xoBrhRCZFlMw/qetnxTHa/D3BOYvlh/Jqh6TTHevx5YM4AexMQ4V
         le8x7Lng3ke2zo3IWE4YpZPe1QF4YDTgAFL4yiSbyj2IB9A0Tr4wzEh9XDk1Y2D/O+S+
         XFQF+6lvTyOYG4iRFft4ZI/MiyZg72b8roj7E1fsO/tkO2CLAPaCehxzsgvzx/rOQ2v6
         q5ayrcgYrh97Zg+3X45ohY+75mgKqJsKSewUWqlPE4LDsW/sELRCYO0KyA4TVy8J3Uu+
         PG0w==
X-Forwarded-Encrypted: i=1; AJvYcCWIIQQlIEt8s/qXzT8OE45nIF3fmFMoFvffV6VbOytX0HwhTeJRl5+p+w0/peSJ+hua1bfXTO8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwChPbUuXIPRSsRXDPiFtFFd34ujSn9GIDF0tL1d6JA35erq1px
	jsX847/1KkR8OFhIbJizR8Ddl5I1iZlx0DqtoRS5sQdH6dj4SxDxDZMB
X-Gm-Gg: ASbGncvY/Vuxo2yqwiu41xoJajA7ZLHCoKNDKhDplPwbOwv6ElG5ICZoa4bJZvEfmg1
	cl71JueLAhy58hcQY53I2TIXkDxvfiHVZ0mqBZ5xPlJi/t0726dxo/GA7U6GF/Zpqnei77N+9l0
	9ixJfuHEkWNwBnpPbXw6lZQuU+ov4HWHfRQC4ej/opgjdRwCbQQr1SXUO8RbUuQqt6pY/jrGWVv
	IEg0adnU1JW+LAeDrxGfJHur0he9We6pCOrqEHVJ6RkSnFRw5rebXQx+f5BamHuAx0cCiFXlxpW
	wZk2iti7Wvo1Pi9SZnLCsJ6C12p4hfuLPRUo6Q==
X-Google-Smtp-Source: AGHT+IHoucd0pTsqUEMuvaSjWbfTQOjCUx6k4huksi1dJ/QwFsl1H1FuuHsdR5T8wu60/r37DLUb9A==
X-Received: by 2002:a05:622a:5595:b0:4a5:911d:52f6 with SMTP id d75a77b69052e-4a713c5ecc3mr52302751cf.39.1749635228486;
        Wed, 11 Jun 2025 02:47:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a61116bc4esm86576941cf.28.2025.06.11.02.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 02:47:08 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:45:59 +0800
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
Message-ID: <mbvzlggbisa4zvvbjvlg5lrmhb455av37mrtwmphqiqi53iuyu@ybql2m773x4c>
References: <20250611075321.1160973-1-inochiama@gmail.com>
 <20250611075321.1160973-2-inochiama@gmail.com>
 <20250611-brown-turtle-of-election-87c324@kuoka>
 <2v4hfzqgz22k6s776onexnhd5cnhfr7s7ggvcmh4mfiviigq66@a2ehkwbv7oll>
 <ec60631a-7e55-4dc0-83f7-6e6cb156dbf2@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec60631a-7e55-4dc0-83f7-6e6cb156dbf2@kernel.org>

On Wed, Jun 11, 2025 at 11:09:50AM +0200, Krzysztof Kozlowski wrote:
> On 11/06/2025 10:29, Inochi Amaoto wrote:
> > On Wed, Jun 11, 2025 at 10:19:49AM +0200, Krzysztof Kozlowski wrote:
> >> On Wed, Jun 11, 2025 at 03:53:15PM GMT, Inochi Amaoto wrote:
> >>> Add bindings for the reset generator on the SOPHGO CV1800B
> >>> RISC-V SoC.
> >>>
> >>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> >>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> >>> ---
> >>>  Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> >>> index 1d1b84575960..bd8dfa998939 100644
> >>> --- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> >>> +++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> >>> @@ -17,6 +17,7 @@ properties:
> >>>                - sophgo,sg2044-reset
> >>>            - const: sophgo,sg2042-reset
> >>>        - const: sophgo,sg2042-reset
> >>> +      - const: sophgo,cv1800b-reset
> >>
> >> Keep alphabetical order. That's enum with previous entry, btw.
> >>
> > 
> > There is a small question for this: should I move this before the entry
> > "const: sophgo,sg2042-reset", or before the first item entry?
> It does not matter where you place the enum. There is no convention for
> that.
> 

Thanks. I will fix it

Regards,
Inochi
