Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7777A2E11D2
	for <sophgo@lists.linux.dev>; Sun, 15 Jun 2025 01:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749951770; cv=none; b=UWQ29OOt9uEnqBxIr5U0uBB5U5iAUT0b2qZ0A9qdBJHKh19O62WOQvgjNUwrGP6mK/sjOFzljtM7c1hOamF286svfy8y5ON/NR88n1yq3/QON+WSoHxyMKi5lTI5v+quy/KqG2qxBB+KChyzSBrE7s8IA8xqlqdlHj38Hej3o+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749951770; c=relaxed/simple;
	bh=hUsudwWSbrDY74Me4I8ISvrmEGy1vwtv61ce/Y0YldQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxyZsQB7TNwBdb5ikgFdqCPZhhiGabvQQ17sPWaJ5zXL9PGTFrhfYPAyyPwSmHFosZ73XJE0OcoqrwiJC1caNVOXQ28y9h0CBZC2739tRwrmS80XXvAeD6iOZ0gl7vR9l4axqPb59gziYnDqC9Xia2oD41zhv2Ae28SUTKTMQSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkQfvIFX; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkQfvIFX"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b2c49373c15so2557378a12.3
        for <sophgo@lists.linux.dev>; Sat, 14 Jun 2025 18:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749951768; x=1750556568; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SrxySgbd2izx1maOgVxP9ZTfn4E4sjc7PUTQCsZRh48=;
        b=KkQfvIFX1t5XUhN2Ux+0wyB0qRdKUCfyQay590pQbq+hEPRLDxDhmb1L5oGHPFpX9G
         06XjLZ4Asi0QDzQ8PMyMPpk6l/CXqc8mKDFG9xvfj0Fikiyli7bQx+enul5HOL/Zjfv3
         GYjSR6m+tap1dqhetFIpu29qzKH0S7PNnLVNSEsHgQubNmBxj4L1E57QZqf4Md+HZL7J
         9J8ZSoIJT9F+nG+cbdiWJD8wVB/Iae+LEHm98zRMp7QMD9Pat8okE7c5Qx+UetUi62NE
         JOyXM61ZqO2S45w/x4G4SA9XWVuc+wEJ7IsiOOtINtYef8Fjf3lwexF0UjS1oevmhKoP
         Hb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749951768; x=1750556568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrxySgbd2izx1maOgVxP9ZTfn4E4sjc7PUTQCsZRh48=;
        b=A27KvmzTQlsi4Km5lrM6Cgm9uCY0gvGqn5l7DPPP98FcAzXUoGFyA47m8Ou9n6KDHW
         Hw18BkE4fDtTzz5k8wkEeEQ4c2zF2iOuTcAFxMZvaK0gp1OYT0gaEP7uuf1whgIUsH4b
         Ff3nPEd+7ERPi0CvSuCBpttq3IWSRYp3W4v7N4kiP/psgbAtgkgFZXXzq9bOOo3MrCP0
         JLd5HjqnOosbTaDIAidWy6xpb/3YjhvJLcc+hbB7knXCW5uP6IEo3/c6ek8dTw0xab9r
         eBVnjyHbJowU2VwNHPSYq4ppof9GngfgMagvvdU/SgZZe2Pq/lcZTaec+gLbzBVWXH/5
         Ubmw==
X-Forwarded-Encrypted: i=1; AJvYcCX7h5UpTYBmDuVFLyzj7mGi419hjs0GCtawhXuL4facMZytJSZMn5LhU6h+xAN/WrjtdBkUo6o=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe25DjBqmDvW3mPc5RZShciSQ9xqmVNAiwGoUAZquUp/v2QAud
	nRqt4bssTBOojlrnCd31v5rl92h0lo+k3+lQGGUW7JLKzE59eBcPGiPO
X-Gm-Gg: ASbGncusXwnLvU3p0twym1F6+rNcRNetZFUhlQVVmLqwTzyfEXk6MTF9MWIwGqbNXuO
	5tRZicQ/1cfbIHLgJszzd1THEOXHQWY3tvWOoEbXqSIfhKoQnYH6TBxvwPk73QRLPd3KE/kLuRk
	tw1m6iKx/9AueBG063nkG6WKu+MOkpu1s+ug8bsOhpyrNk0Tt18EaQqKpWy3LeT5JnU0wuK4j7c
	5E9KIwW98eEdsdWOgLHL9rQB1h9ESftAWOsKnwf+9NoGF8s8VOET6Jr8ehETjppa2goi5HzPJGy
	j3ovxeUo8KZcHlxRwJI0CQ++fuIfZkJ2rTgf0YYyN6HKyJwOYo/zOgYpY5C5Tw==
X-Google-Smtp-Source: AGHT+IFQJycihrzqStgqBch1SxHHFFK4UJbfgDZpFK6aOcFb18jbAbwV9uqWfmoR+F4PY5gp6uTNHQ==
X-Received: by 2002:a05:6a21:3982:b0:201:2834:6c62 with SMTP id adf61e73a8af0-21fbd5f2087mr6758634637.25.1749951767631;
        Sat, 14 Jun 2025 18:42:47 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe163a470sm4139687a12.9.2025.06.14.18.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 18:42:47 -0700 (PDT)
Date: Sun, 15 Jun 2025 09:41:34 +0800
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
Message-ID: <z2msqxjwfwieqafr4trj4xvdam5tapfl3ls65vecgtgpz2f2zw@rv6zd5ovsjz7>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611082452.1218817-2-inochiama@gmail.com>
 <20250612-culpable-roman-295df1360198@spud>
 <y6dkhbc4x5qvd3z2yyh3ba7zkq7gphcnrc5757fxlmpz3zh2nb@tk65ldng6oyl>
 <20250613-paving-reimburse-fa5ed8c40c7f@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613-paving-reimburse-fa5ed8c40c7f@spud>

On Fri, Jun 13, 2025 at 03:23:26PM +0100, Conor Dooley wrote:
> On Fri, Jun 13, 2025 at 06:09:47AM +0800, Inochi Amaoto wrote:
> > On Thu, Jun 12, 2025 at 05:04:46PM +0100, Conor Dooley wrote:
> > > On Wed, Jun 11, 2025 at 04:24:49PM +0800, Inochi Amaoto wrote:
> > > > The Sophgo CV1800/SG2000 SoC top misc system controller provides register
> > > > access to configure related modules. It includes a usb2 phy and a dma
> > > > multiplexer.
> > > > 
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > ---
> > > >  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++++
> > > >  1 file changed, 57 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > > > new file mode 100644
> > > > index 000000000000..e8093a558c4e
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > > > @@ -0,0 +1,57 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Sophgo CV18XX/SG200X SoC top system controller
> > > > +
> > > > +maintainers:
> > > > +  - Inochi Amaoto <inochiama@outlook.com>
> > > > +
> > > > +description:
> > > > +  The Sophgo CV18XX/SG200X SoC top misc system controller provides
> > > > +  register access to configure related modules.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - const: sophgo,cv1800b-top-syscon
> > > > +          - const: syscon
> > > > +          - const: simple-mfd
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  "#address-cells":
> > > > +    const: 1
> > > > +
> > > > +  "#size-cells":
> > > > +    const: 1
> > > > +
> > > > +patternProperties:
> > > > +  "dma-router@[0-9a-f]+$":
> > > > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> > > 
> > > I think you're supposed to add "unevaluatedProperties: false" to each of
> > > these nodes.
> > > 
> > 
> > This is is OK for me.
> > 
> > > > +
> > > > +  "phy@[0-9a-f]+$":
> > > > +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> > > 
> > > Why are these permitting random addresses? Are they not at fixed
> > > addreses given that you only support one platform (modulo the rebrand)?
> > > 
> > 
> > IIRC, they are fixed address. I use random addresses as I see many one
> > in binding do the same. Should I switch to the fixed one?
> 
> If things are actually possible to have at variable addresses, then sure
> use pattern properties and a regex. It may be like that if a new device
> is released that reuses the dmamux or phy but locates it differently or
> on a platform with multiple phys etc. If not, then then just restrict the
> address to the only permitted one.

Great, Since all the CV1800 devices I can reach have the same register
layout, I will switch to fixed address.

Regards,
Inochi
