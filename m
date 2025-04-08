Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE3B265CAF
	for <sophgo@lists.linux.dev>; Tue,  8 Apr 2025 11:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744111296; cv=none; b=NJFr0+4PLz8EynqwX0epLE66nR/BLOIgS0iIakJxftND08nz/Ao8hDRonS/vvghu7pUnOOnlUwnzYLiC8B96iwH/Oi6ymHxmHcDd4LTdGBUbPT1vayAqSKWQ53W/8GHNTEMViTUtGDvGls5VirJW5QcFq/GmxpGzkowO0NqFFB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744111296; c=relaxed/simple;
	bh=D3tSjslJEG5gUmYqPQBwZcslLuwSvruWXMArraYU17w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uByR9NP5NeiZepniLJK+Lk7siyzQMRoXc4c8YcF7qKKVdHSxD18kxboSi8fzT9AhlSrJmdNOv4cOlb07wtrdRV2ByNrW0ZFnSB+FOzVv2KOVFBuSKN7kKUDnRvlyj8w2XQbIKK0nNVYfmQUvHLYeqtMW3Ao2ec7xX3rCdOtlzV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlBsLruz; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlBsLruz"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso5211485a12.2
        for <sophgo@lists.linux.dev>; Tue, 08 Apr 2025 04:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744111295; x=1744716095; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y1WTsXHcQYhNYnT0/xU5DpY+xWRau9JN7FZGJGxicCc=;
        b=PlBsLruzTlu7BAZI9c9/hEfRFVA4spZTWo/r2Bx2R3YDpBTxQUIyoZ4409q/V2XTWw
         9s8YUoLppwMLNpOQNLMTH2s2dujNxYpwYNyH8Q/iGMPrFSGrJEsGO7pJ/IXiQkD1vkE/
         FkqBCsFaPlHRVigx9wFwUu3r6XTw2fQYERUx+Wzs4S7kfcjeTSJBsAd0AazjzFdiB4Fs
         G/gzw0TzrLOjFWiNGyqsBElGjrdLRIAMZsktN0ihgJEUhH6+iJ3HLR4FKBeHccbSJhKG
         4qzcD2hCDYbGoxk3DZaPHOrZ5aqCyCupV4/pHjRQkiyWIII4/F9RLohbr9L9bfZZaAZr
         DxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744111295; x=1744716095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1WTsXHcQYhNYnT0/xU5DpY+xWRau9JN7FZGJGxicCc=;
        b=g7af6rWOCxdhNrKKmotiXv3+iIyWasolem02CvIt1kVyi/A26jRCOgL1RsBd1JTFtI
         0LUbNsrE+QrWK7yMvYqnl2R5mhkTxBCQuy1X/Sln3tuSWvGYWi8GH+UVNONqGpF7Z1ID
         N+NpBeh8ULLrVk/Q/HuPEPzB80+ioUlJ0YvlMWXIZ7fPBzH7kVWcUw/wGjbYOIu31Zul
         sxLCZbJWi8z+Nr09Q8My8+bRv7lfD3AnriosC05uGjk0F7Wi2sYPjbVb9zppQw7Fiiqx
         eAtUrPRV5mSRe3uRU/1M3BOWZ08oi69+AadELFiXSDx7CxXZK/M2wY53Uk6Hw7Ya+7pb
         rcSg==
X-Forwarded-Encrypted: i=1; AJvYcCXXsAu1Ea+NQyG6QmFBdf54xz0Hb5lXTGkHlqr9W5CA/hxY5Abpn1oy5aZ9gs21jqeitP0aoME=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4FGcjwdfzcWabSAM9OFbJwBt3h7tsvXNZAPgJp7L8/DDDcASh
	YiCH7u8/uACaQZ7Uo+8pXdK2ilq84JVc3SP00YoTV56EMy2dzv7C
X-Gm-Gg: ASbGncvt3TYzMn9bn7xL8+oRWW17EWD5gi9C7yDv8qHX0e7wk2QgvYcYH4fOWRtHjUf
	17DnU9pychfmRaMdrJqwDzOAp4lf3HtnruIch1o281Gd89eSdmFsPPAc4SMMvp/nrxr0kKfiv2N
	N4e6KqDAjUsscgP89Gi53I9lMa+alvyK1pQCLVO0en/absO04P8cg+zKuYWZeJNUGKmKPaDeZQM
	0vyx/wHYqj3Y2UIF4xTxRAXWYSi+M3ThPQsVitQRr7TJbXL+BlvcdCQfVyv+cQLTq4RbJWv8l8G
	mcc8nqbnDmaEqt86+S1ghjq4ipkDHHvq/Y5iGvKUxZfHCoc=
X-Google-Smtp-Source: AGHT+IENHbT7aGSGC2d+Xs3HK0eW2n1NHcpEJC/0ogHOySPZcdktzD7ZPPAXmOKRs/wQ018ClqbpUQ==
X-Received: by 2002:a17:90b:53c5:b0:2f2:a664:df20 with SMTP id 98e67ed59e1d1-306a47c2e20mr24517484a91.7.1744111294119;
        Tue, 08 Apr 2025 04:21:34 -0700 (PDT)
Received: from localhost ([223.80.110.9])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-30588a30974sm10619376a91.25.2025.04.08.04.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:21:33 -0700 (PDT)
Date: Tue, 8 Apr 2025 19:21:28 +0800
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, sophgo@lists.linux.dev, 
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, dlan@gentoo.org
Subject: Re: [PATCH v4 1/2] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for SOPHGO SG2042 SoC
Message-ID: <qe4qhkbou5t24jccfrufvszsrbrwvj765y6jrj3bnhk2jnh5st@2y4hpbmujo3w>
References: <20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com>
 <20250407-sfg-spi-v4-1-30ac949a1e35@gmail.com>
 <20250407140739.GA2174606-robh@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407140739.GA2174606-robh@kernel.org>

On 25/04/07 09:07AM, Rob Herring wrote:
> On Mon, Apr 07, 2025 at 02:35:12PM +0800, Zixian Zeng wrote:
> > add compatible property to include "sophgo,sg2042-spi" for
> > the SOPHGO SG2042 SoC SPI Controller.
> > 
> > Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > index bccd00a1ddd0ad92b437eed5b525a6ea1963db57..94102d94ed5dffe889a8a11c1c637d466713c208 100644
> > --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > @@ -88,6 +88,10 @@ properties:
> >                - renesas,r9a06g032-spi # RZ/N1D
> >                - renesas,r9a06g033-spi # RZ/N1S
> >            - const: renesas,rzn1-spi   # RZ/N1
> > +      - description: SOPHGO SG2042 SoC SPI Controller
> > +        items:
> > +          - const: sophgo,sg2042-spi
> > +          - const: snps,dw-apb-ssi
> 
> This and all the other cases with snps,dw-apb-ssi fallback should be 
> combined into 1 entry.
> 
Sounds good, did you mean conbining "SOPHGO SG2042" "T-HEAD TH1520" and "Renesas RZ/N1" together? But How about the description?
> >        - description: T-HEAD TH1520 SoC SPI Controller
> >          items:
> >            - const: thead,th1520-spi
> > 
> > -- 
> > 2.49.0
> > 
Best regards,
Zixian
