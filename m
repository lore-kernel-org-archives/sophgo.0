Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7A337DEBA
	for <sophgo@lists.linux.dev>; Mon, 11 May 2026 22:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537103; cv=none; b=aTMJ8RopX7htyYa9GNZfo2Pvvx0KWIDh9y1kUSWmibZrPmsIvDA2HTc3snopFwAyzt1h4k8+LDKkssJAREMCs1sLwM2dWg5kRcpGHW+q/WN6A38cvkw5YaafGhTXZ3tVsIuFTpR2YCmt7xkDVNCP7y2olmvjAheJTATM6CPDaxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537103; c=relaxed/simple;
	bh=CIAqLMPPvoM4e+OnpQX7C3aTrPFyWScfWmBqyOx9pzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJhXM4PnkxObXLRZcHOdV0ABSIZ3PytM1vsSmoCiA17ifisTbh7IRD0sWlYfEk/GAfKPSebbwDzE6RunKd2LvTfuVvtiDBHVp6aogM6J2+uSk4xQjGjgbfzaPvbjYjSHS76kWtX3QaHy++FJeCpTMnhyd2R64Ctso62wiaDjL70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cm1iCIU1; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cm1iCIU1"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36523acb0c1so3379345a91.0
        for <sophgo@lists.linux.dev>; Mon, 11 May 2026 15:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778537102; x=1779141902; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TwJIirVuKqVtnnrvOqanwGLH5bXkSp5/1F2o6q3Zsnw=;
        b=Cm1iCIU1w1DG5+gm14MVU/udt4oWjOIkPRYMuPvrgEkcN0JB8etHSMiEduB8UFwYTF
         SA3WRat4xkq6EXPrPuOnGOPpEYvs+kn6qQOCtwjo1Gy2pNbh/+4/+Q3xg53/2WRoadSd
         F94kqyCnRWMDgkPRvJeGmlREOQIPvsdf2b739/4dWVfZgRCPKx3FgbPLcg4SJc4x2nBn
         1FKy66cTpsogVGjBCZavy9cdigDDcOPflCgMFzxU5LLiP+q5+d2A0gYDAR+RbNiJqvfp
         EDtKXAlx/1O1fN77c6ieKrjxuNHTgm7R0NyJMHvqI4yP1VhlTyG0fN9+EJRkzzZgVAwq
         FBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778537102; x=1779141902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwJIirVuKqVtnnrvOqanwGLH5bXkSp5/1F2o6q3Zsnw=;
        b=pH9OsT8uIqWt0pZgX7dyCEb95b/rsUurgYpeMAO+/7flDjAX8Z43PgMLTJj3Cfg9Ce
         UmjRny1EMCx3TwWEtXL8Ye453UwMoGDFDTqI1Mfv0uYUnPTFbkH/sbD/i5OQj+ai4p51
         EMsqyZLMvU0pDnP8KZSMEGFkx//KImXBMHyzUKg7JEvvjxxvGTNyxd47uouWc/F4vNtX
         RCNYHkONVOUTsZDKRfi9esmJzx4pGZZpACFC4vih818/08lyw1KXaF/bPaNwSB15sK8x
         fC9Do0CGd1UocWZQuo9Ny3ZYnTo6ThjHwTNeGoG6xsEwUSOmTe2UeGl1jNx2Gd9do46e
         LgLg==
X-Forwarded-Encrypted: i=1; AFNElJ/1hzuDncLJukvdZpxQxeb/ooHcjSuz/A6NSGLy6p29Au72PztyRVIfTWp4mUv1aW3DuntAXCc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6XgwSxFzIfWcU8fj8/GTXZhpsqsaLYDgXvf/Bwn0Iy3hgYNRw
	OyPXc0TaGSbSrXjV7jKscUbeH9biUw9dAdjGoom/t4eJ9es975vz4Clk
X-Gm-Gg: Acq92OHVhnjhkkgYops/C4jLnPsUmCYqPgzIlniXdzEPMIknTq9R2niARVL1/yEtrd2
	z1vcaKBOo/6D84pwmnRKUImeb9QndNaywhUvWY1u+URzmvFfS5sP/YIIfqZXuRQ/Ywb25ZIAAzj
	eq0VKIqAwwrnPIp61+u2eoAiQn++5Ar7ZLJ2d3IaQxE+1iinKSFgTdMguTNA/buydOt6sx2Kky1
	amAu6EnhefZgOty8cd35BCvkYCXKzRR4Jxk7MOjzfTYPZCACtqOHi9V+lfL9VuqSYU2DiemUK4A
	KbriSq1N28KZfI+F/0veRX2YWQE1c/CZuLwRRBIbnmdV0lONhlt68f9h9xGqIKbeQI6GIsM/z4I
	l7hFrz4/a5PTM7Li6rvUgeIMSfOPeFTcSuXYsRW8e8VZDEGP0C429VEIbt4duWGSrjWi9kehmq5
	O4vHyr/Om154QzbR15BQiRTws=
X-Received: by 2002:a17:90b:3d8a:b0:364:a173:2d61 with SMTP id 98e67ed59e1d1-368b2511be6mr449645a91.11.1778537101695;
        Mon, 11 May 2026 15:05:01 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771c6ddsm9907259a12.23.2026.05.11.15.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:05:01 -0700 (PDT)
Date: Tue, 12 May 2026 06:04:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Longbin Li <looong.bin@gmail.com>, Yixun Lan <dlan@kernel.org>, 
	"Anton D. Stavinskii" <stavinsky@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: dma: snps,dw-axi-dmac: Add fallback
 compatible for CV1800B
Message-ID: <agJSPkA88GcTYS86@inochi.infowork>
References: <20260511063818.463877-1-inochiama@gmail.com>
 <20260511063818.463877-2-inochiama@gmail.com>
 <20260511-crave-sworn-3b43371ce11a@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-crave-sworn-3b43371ce11a@spud>

On Mon, May 11, 2026 at 05:01:01PM +0100, Conor Dooley wrote:
> On Mon, May 11, 2026 at 02:38:16PM +0800, Inochi Amaoto wrote:
> > The previous version of the binding change only add compatible
> > string without adding the fallback compatible, this breaks
> > backward compatibility. Add the needed fallback compatible to
> > fix this.
> 
> I don't understand how adding a specific comaptible affected backwards
> compatibility. Did the dts originally use the snps compatible before the
> device specific one was added?
> 

Yes, the device is already in DTS, and since I find an quirk for
it. A new compatible with fallback is necessary.

Regards,
Inochi

> > 
> > Fixes: be3e2a0419c6 ("dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> > index 804514732dbe..0a30a455b0ee 100644
> > --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> > +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> > @@ -21,11 +21,12 @@ properties:
> >        - enum:
> >            - snps,axi-dma-1.01a
> >            - intel,kmb-axi-dma
> > -          - sophgo,cv1800b-axi-dma
> >            - starfive,jh7110-axi-dma
> >            - starfive,jh8100-axi-dma
> >        - items:
> > -          - const: altr,agilex5-axi-dma
> > +          - enum:
> > +              - altr,agilex5-axi-dma
> > +              - sophgo,cv1800b-axi-dma
> >            - const: snps,axi-dma-1.01a
> >  
> >    reg:
> > -- 
> > 2.54.0
> > 


