Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0F6314D1E
	for <sophgo@lists.linux.dev>; Wed, 25 Feb 2026 22:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772057629; cv=none; b=uch0XMuIjHUlAJDExYcFkdyUGQa04JZ+1MAGCbh2Eue3sF/aD3g2SVxodwIN8qU4sW3Mu/vsstn8zU9ZI/T0Mjbp/QhHAUo4SLoE122ualp3U+EWzxPnDB32tdInxxNgQnDC/nRqw7lSxzqu3phvsEGPJNxzkvl9O3/JW/Kd6N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772057629; c=relaxed/simple;
	bh=TOgbNBbKU9iPOcuckC2IVjsArS+79bW2WQ2DfWtt9Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVfq9F7n0V82F3STW6XekCCR94W4pvfzmATHtWXbpYXQzQOSqcXaF139KdBWnm6ueuDn1N85HEvswADD04f16aqeN6AyRSNjjZp3B0wxrYDrtpVL66idwtGpgNDre9pIULjXbsC8lYohv1Dz7LhG2MnbIqodLXSTYpW8ffzF48E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWoVcynv; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWoVcynv"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-824484dba4dso269739b3a.0
        for <sophgo@lists.linux.dev>; Wed, 25 Feb 2026 14:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772057628; x=1772662428; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5aiKwhpHaGzJ3DICfSZzF0PjdBtray3xMHDXBsERpgo=;
        b=NWoVcynvjBJ88EWVOCexDIIYz3U9t96rdNt4MvdeR2sB12MA5QvHwweE6qQga0lAJw
         lOzqbgpabZwOsydU6mMfzcfvG1lXYzYor3+DBAmkb5P3y9VRedI8isVq2Ic4t2DVIyY5
         xwZS+A5uqnqT1S1L4INd/Ax3fWEu8ZcP0sQxhqmYAT7030dlPAKjSrCKD185rq4ncpjQ
         7fawL6V7WVb+Xjpk+t7zHdoBvmM3nYRzaefc0P0VTuu9C0jrCUmWU447a3LOyBsaq2Cz
         NoQAimFpYTFDeP9ejjKanTszKwbI4R3OigLPsYovdAuzKsm4LKqc9OnXvbkHgBHjwEdE
         hlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772057628; x=1772662428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5aiKwhpHaGzJ3DICfSZzF0PjdBtray3xMHDXBsERpgo=;
        b=axjPEDA7tkDjBqQomEc5GUBZql+rFGlmtzIYcjeOGUZxsD02xBwbiqqiGEGtqJC1z5
         1a/5sk8hW3JPXCg4Lsz6Q2h5WnbRyPpfoJoqAqlUO1jtTLo+ksloz1q7KuhbTk8mUctf
         uDxWVJlL2y4XQYNM1m5AmNqkuQH3V7NasYjon4sktG1tQdo2QRLHIJzMK7RRJ0cN5imc
         IdVFeZn7vdBX/ovTaOzLV8ijPQnfJq8OOVV5i3AFXdlhrTjR2l/1ljNUIw/9KKiphHq8
         pyjLhOxl7EQh6sW9VfStrQOWAbCWYgATmLzD8JIELlysA+2F+blSGppfHRvnzPjj2zTb
         lK8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtMWVvLbmhyjmZGpdsfdc5pA6xi9Nz9xP1b453OazbCvhOtyOzL0v4+MdSxyemjeKyfyJeQXw=@lists.linux.dev
X-Gm-Message-State: AOJu0YynKGbJJ1SBuEHbse2qsFOGuR8YHdysuwVux0h+ahnN5xfVzdmT
	CeARuLOIym3+yIuhxewiDzHvg/fKNT/CY9DhYqAP3/HbDEbi02mXQ4zK
X-Gm-Gg: ATEYQzyjALd8B/lNYtXDxTEV2W1hjeuLEfWV5G4kEcDZOtRMRyoHHEoBl/sgUpD+G2f
	slo7JkDUKufbbHXrGq1hwXdMzjK503AdQG187kEcqX+svujWCihyNATFeRpduTyO7Dfy0kDenb2
	jb1WtoScngbrlMaizy9RGBbnXk9mYF0CenK88iDRiKmGz+qOcjQF4nifkti+vnVMCe7hpFYNAmR
	XT+W1dZutvpktvoBxfkHozo5c31cUMTtH21HGK5iV+pRJsLW+6t35bwx1bANPLdBf28yJKbWy+Z
	8lpjnZGgg61RJI7dDzRp/5FfjIlRSX/IwSE6ZW7E+rARWrU3fM912G7CKHbLXDtAJ/IenO+f08r
	Pb7mMhQqFseNoo4vUMH9mpiKQzuG1KoVSXQ/6obnsIKiYzzPiPPbjhANQaPT0Rww9dbfxJvvE21
	FJVRDDQVlV8ara2y8/U+JvFg==
X-Received: by 2002:a05:6a21:4910:b0:34d:d030:6739 with SMTP id adf61e73a8af0-395b482d1e6mr88993637.31.1772057627939;
        Wed, 25 Feb 2026 14:13:47 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359130719a3sm1267511a91.8.2026.02.25.14.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:13:47 -0800 (PST)
Date: Thu, 26 Feb 2026 06:13:25 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Longbin Li <looong.bin@gmail.com>, Ze Huang <huangze@whut.edu.cn>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@kernel.org>
Subject: Re: (subset) [PATCH v3 0/3] riscv: sophgo: allow DMA multiplexer set
 channel number for DMA controller
Message-ID: <aZ9z0gV8ZrfpL2JG@inochi.infowork>
References: <20260120013706.436742-1-inochiama@gmail.com>
 <177201865381.93331.6104381063514168222.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177201865381.93331.6104381063514168222.b4-ty@kernel.org>

On Wed, Feb 25, 2026 at 04:54:13PM +0530, Vinod Koul wrote:
> 
> On Tue, 20 Jan 2026 09:37:02 +0800, Inochi Amaoto wrote:
> > As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> > the SoC provides a dma multiplexer to reuse the DMA channel. However,
> > the dma multiplexer also controlls the DMA interrupt multiplexer, which
> > means that the dma multiplexer needs to know the channel number.
> > 
> > Change the DMA phandle args parsing logic so it can use handshake
> > number as channel number if necessary.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
>       commit: 5eda5f42d2fee87127b568206a9fcc07a2f6eab6
> [2/3] dmaengine: dw-axi-dmac: Add support for CV1800B DMA
>       commit: 02a380ea7ed2d737a42693d7957ec8c33a92d9fd
> 
> Best regards,
> -- 
> ~Vinod
> 
> 

Hi, Vinod

I guess you applied the version 4, but replied to the version 3?

Regards,
Inochi
