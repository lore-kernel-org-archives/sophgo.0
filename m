Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DC2389DEC
	for <sophgo@lists.linux.dev>; Wed, 25 Feb 2026 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772016247; cv=none; b=D60QETVZWb/7mFIxV9MvcwglCtjy2yNdrT5QC3rzbku7L3wIe8Kp0Y0Ahc0lj9xIe7iBN6DG7qmn+aWMVPzZUj02xWhE2EsH3sbXo5rl6/9DwMEmT+q9Hb3lamG3dyZZg2D3XUCSDlxyS+4O+pC+dKBu8zAtpt04aU+xqzqPDbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772016247; c=relaxed/simple;
	bh=WgAXcvLFOLlS2CrV7fMpnmt29OISe3ahfs2U6BLXuUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1UhU8AhY1tvgjY6NNsdfHnw3JyZoehnHuWHE0TIGLEz1eXLLgip/1RHOG0Fu77dwWYB9ifgRs/raPd5Jbp5yJfP2gbmge1BWYO8SYtRF2mY4y6z6+9mwj3JpfxUwSFS7jnQGxdB9e8WYIxO06HezMH8szMqWxkaLuJa1RphShk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFQBu25I; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFQBu25I"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-827270d50d4so467484b3a.3
        for <sophgo@lists.linux.dev>; Wed, 25 Feb 2026 02:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772016245; x=1772621045; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dOtyPf4DV0kGbhPpq+32kw+kEiZwwmgV8bS/8w37MW4=;
        b=WFQBu25IT3TGSKGiOJwqrCP5KQvCr4XH9mtDFaY2ICLWrSCuJ/AplVISwf0h7dyqOV
         nKop1W6YMmxbcHsrUzeQt+vGE28mkp1WVl+unPCCAaZ2a1dXtxcRSHaJlntu1Iu/GLps
         33IsZkuHlrpsKbEpD27m+LOTm1ujwXrzNoNif+SYweR5ED3NUDMfGhS/YNahu9EBo7Zj
         RHyim6mQ34EdRU3E7gQkS8zN83ls2QGjvzcpDvY0q2Q4r8foT1Q1oQQ3lRrRzlkQ7R20
         qdmRijwH1dGbYfojoz405RYWi0mgyc5p26u0Kjc/xPbvTFIwFXH+/2luIXu6RwDPdfhK
         dsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772016245; x=1772621045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOtyPf4DV0kGbhPpq+32kw+kEiZwwmgV8bS/8w37MW4=;
        b=VYEemF0uCDa8kAd1V7dGlK4sM+xqy/6pwgAzFScnYt+lMx8j2a0bHKaFND039MOPP1
         SLGw2ZPV1B3SMYX09Y1G22/d3WjEgBO8zCiM3lqunxYK1eywcbs1edowTjsZFrL95S7L
         gmzzm4tMNzOGVw3LGF/ju606jHHIdQksDozGwLXh+wRNdnY+peUrVU78CZAUJFs+7MM9
         H+xhn9TysXWfMlwJ1npBXxi+5SJnH3g4USD7e5gqXag5oO1OpG+FW3+DMG9ZmbMyjtY5
         7SPB+v1jKT2BxZGY2CcrzLO7AfakI8XTXQBrp5M+HlKBfIsQU+aNr7qSJvAWVueU2/WD
         KaNA==
X-Forwarded-Encrypted: i=1; AJvYcCU5CFRN3538ET1Gff8iQ7Lj/U4GNUSuu5CgsldioLlYEnTFNVFX/+ju/7OmEThxKpX3u9c/Vcw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy506hIyvbG9Q7HhBQdvR3PvmW+wLDMDORXYJ7zMjMfbLT0mn8y
	TOzkp2bhJq3KXzIV+zyg8pxdknRIslAKbzOpWMP49iZmAkWagXAb5FLJ
X-Gm-Gg: ATEYQzyRI8DsuCapu1tdP/GDE8/fmNeI6kOAWvndTbVWECkqdFq+tYL9s9ZAnfmf9zB
	JUVDwyLdXRbRGEwhnkPFGNuA5raf6AelbboYjtYtz+KliOx5zHgO6teobHpPiHhpCkqsrLP2Pvp
	JklN+QQIs/CBlfSwtyxnqFtVKaSrxEIhU4wAmmsCkjjlY3/p3UoK1bZPMB7s1Hl3bXoGplN6Qs1
	kfdVRJz84kHejkX+blE4ZoBxW3aQnAQzKUvBYKm2VIkqIgmEgV02i94lGfZnXAoLzC+GIjg9TQi
	3XDG9pPVmKKWw8q5R5WMDfemGCGsCJS0i8C5imGbdT7Yvxa0ZX5Km6dZnF6cE2OTHo4uBJGxljc
	4GSWVFarLvEyI5FOWA4tUecJUhI41mzc10HvA8nU9qIreD7HDsvj8/Itlcu6mMXryCIG3/wd2fC
	c5Kq9fdaLN6UCZTaiDxvlE9w==
X-Received: by 2002:a05:6a00:b8c:b0:824:a4c4:3b3a with SMTP id d2e1a72fcca58-826da8bdbcemr14510549b3a.7.1772016245518;
        Wed, 25 Feb 2026 02:44:05 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd86c93fsm13820247b3a.38.2026.02.25.02.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:44:05 -0800 (PST)
Date: Wed, 25 Feb 2026 18:43:42 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Longbin Li <looong.bin@gmail.com>, 
	Ze Huang <huangze@whut.edu.cn>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B
 compatible
Message-ID: <aZ7SHVTkDeES_r72@inochi.infowork>
References: <20260120013706.436742-1-inochiama@gmail.com>
 <20260120013706.436742-2-inochiama@gmail.com>
 <aZ7PLPFVnWjaBDpa@vaman>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ7PLPFVnWjaBDpa@vaman>

On Wed, Feb 25, 2026 at 04:00:04PM +0530, Vinod Koul wrote:
> On 20-01-26, 09:37, Inochi Amaoto wrote:
> > The DMA controller on CV1800B needs to use the DMA phandle args
> > as the channel number instead of hardware handshake number, so
> > add a new compatible for the DMA controller on CV1800B.
> 
> Applied this manually, please check if that is okay after push
> 

Hi Vinod,
 
I have send a new version for v7.0-rc1.
https://lore.kernel.org/all/20260225104042.1138901-1-inochiama@gmail.com

Can you try it?

Regards,
Inochi

> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> > index a393a33c8908..0b5c8314e25e 100644
> > --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> > +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> > @@ -20,6 +20,7 @@ properties:
> >      enum:
> >        - snps,axi-dma-1.01a
> >        - intel,kmb-axi-dma
> > +      - sophgo,cv1800b-axi-dma
> >        - starfive,jh7110-axi-dma
> >        - starfive,jh8100-axi-dma
> >  
> > -- 
> > 2.52.0
> 
> -- 
> ~Vinod
