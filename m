Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93AC2F4314
	for <sophgo@lists.linux.dev>; Thu, 12 Jun 2025 22:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749766259; cv=none; b=Lxi2zXaJS9/48eIckxCB+VXQndnDL3l5KXAF4VnzdBBftkfiYE4PNxQiGfcLT9B0dKcNZgVn/PCfbMl13tJeq9v0xQCQu/0R5E0p2oBbEXEcnPtaV+53uUDpapkZHr8SiwNNuJgflHEMOVPPAb6bDXXzHwN1bpG9Vf7jlzcRnlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749766259; c=relaxed/simple;
	bh=X4UYrbhCkqofW05LY1qWOtvrFlFxZeee9uJgB4Rayds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yt/0CVAVhxh5g0uR5VWpq3tKBPo/d70eLTY6879Rae1s36L/pPvukDGGL4vL42xfUJEdUyQcdfMSHpzCZFkiwP1vMINBTRzu0rpCSVDDSGu4fCIj6blU6YHSpdXCDOpcks7rKy1x5p+9Ffitv2wHfwqFfZtL+fJp2p13S1sKoGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOoXbX+i; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOoXbX+i"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22c33677183so13493465ad.2
        for <sophgo@lists.linux.dev>; Thu, 12 Jun 2025 15:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749766256; x=1750371056; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KriEKHEYlCTi88JAOccOhUjD8CzVygMM4sUtYzcDb5g=;
        b=lOoXbX+iTQ/gw0I91yon3fCNX6XjTBdtrLPWPu1+vRnowuLc2czsHDFSZoAnnBAIiO
         z8bY3MODdBbiHjU8jsqgkf6JVBN/iYkbDiZQ7SY2cIIyhxs55k+uP96bpoMpkmzE9D8p
         mZgLLUtsmFVJtxvG9/IWR8kigVH/FA3UBGlFGnDzb6IShtA42mtddygN5AW+wqYiMsVH
         oljB8wPIKx9z35J7dl8248eXRiQDv5ifg6khaGScznt85gQHl7yysj4NzpUGhrd0zYB1
         /L/hjDvzJkHBlyUgAs8rwTkRvzQtP5ZLqS5tqEK/HEPnI0M2eAcoNdcJwGvrldqJbr0A
         FUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749766256; x=1750371056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KriEKHEYlCTi88JAOccOhUjD8CzVygMM4sUtYzcDb5g=;
        b=vyLLg+Y6bx6P+zoTR5+XMRV3uBz/G9iLCkRIfowNbuyjk5fcx2/kUcDLQKD/RxY87w
         gqS8bzVNqQvMwuqiHHKt0dpttnySRhnH2nApyagREMORg06+7jYFxpVsTZi+28y/iOz5
         FRU4+ApysKj0hO3870xKabT1PM3dTEPeGQ4roi2/mHFaZU0y5G3Rnkn0HJKCR5+1J2go
         4nCPz+5iJxJ/nFFOA+HqfMofIgtIhFDUnMf253459a/AL7wa+kyNzkFGlcuHv0DJHW3z
         k6f3nlqE/hulSMHfsA+3N8gBa7sEI7vPlrtabGsxKQrESH0D5Mj/FJWyrX+uWlJFeIAB
         d04g==
X-Forwarded-Encrypted: i=1; AJvYcCV4b4/jyE++sxJA0A9sGYa0yWafK3xtvobzciCi3g0Q5i28ghFWwtDl2j8fTs816H66A9OSGh8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNagGzYzbJ1Zab6QfulqzbeUQJp+tL7ss1kHO9WsKRB66RVrgb
	TFifzv619bDkIZZsp2ySCBuG3wNA5inDYoZAnlZqLaxwxOfldf04LTkzv+/OXXUC
X-Gm-Gg: ASbGnctSjrknaZCWWZgK4F7ccKlChKiJ16DAV/RQGO/cTB4J2IAam7v8tu8DLUD69Se
	JeoWLvvIUZz+dYCERTv2ul6BJmOG7tmd12M6KzMOFybW7GqZXzKPJumxHPWFpECHKy9OtwhY55B
	Ld4shUxalab4kpqFZOdwIDGRxR2HfnRIKa6mrCEny4zuK5xSRGzLeYyumDm7NSPQ/Pdkq+90hiv
	i5M5R0PAtuTcWcIGEM6WX4oeVuJpkigdQ8dP483ZrA5CdPR9gGVA/wwl1VpJ9vQZEK012GTcr4g
	a2zedwBpQBNXcB/MOHSQoUlarREXLiiafPI5Rg==
X-Google-Smtp-Source: AGHT+IF3VWf9CLIOpaSuBO7CmtrEXj75DaYp06Yzj+Kv4Xtv5ablupO9zYlfs0wiUHGpvDYApyEsXg==
X-Received: by 2002:a17:903:98b:b0:234:d7c5:a0f6 with SMTP id d9443c01a7336-2365da06f72mr9323335ad.31.1749766256233;
        Thu, 12 Jun 2025 15:10:56 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365decc11fsm2092655ad.222.2025.06.12.15.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 15:10:55 -0700 (PDT)
Date: Fri, 13 Jun 2025 06:09:47 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <y6dkhbc4x5qvd3z2yyh3ba7zkq7gphcnrc5757fxlmpz3zh2nb@tk65ldng6oyl>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611082452.1218817-2-inochiama@gmail.com>
 <20250612-culpable-roman-295df1360198@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-culpable-roman-295df1360198@spud>

On Thu, Jun 12, 2025 at 05:04:46PM +0100, Conor Dooley wrote:
> On Wed, Jun 11, 2025 at 04:24:49PM +0800, Inochi Amaoto wrote:
> > The Sophgo CV1800/SG2000 SoC top misc system controller provides register
> > access to configure related modules. It includes a usb2 phy and a dma
> > multiplexer.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > new file mode 100644
> > index 000000000000..e8093a558c4e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo CV18XX/SG200X SoC top system controller
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@outlook.com>
> > +
> > +description:
> > +  The Sophgo CV18XX/SG200X SoC top misc system controller provides
> > +  register access to configure related modules.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: sophgo,cv1800b-top-syscon
> > +          - const: syscon
> > +          - const: simple-mfd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +patternProperties:
> > +  "dma-router@[0-9a-f]+$":
> > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> 
> I think you're supposed to add "unevaluatedProperties: false" to each of
> these nodes.
> 

This is is OK for me.

> > +
> > +  "phy@[0-9a-f]+$":
> > +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> 
> Why are these permitting random addresses? Are they not at fixed
> addreses given that you only support one platform (modulo the rebrand)?
> 

IIRC, they are fixed address. I use random addresses as I see many one
in binding do the same. Should I switch to the fixed one?

Regards,
Inochi
