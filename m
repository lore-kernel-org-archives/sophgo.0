Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9672DA765
	for <sophgo@lists.linux.dev>; Mon, 11 May 2026 06:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481637; cv=none; b=hEZjnWygM3OL7cTdpl3VgA/M8DP5RZfcIcteltnozEtXtbMflkyqy98UMZNmeYyMiU3b/VpheN1flT0rs9RB/78eyYkfYoXBCzBUoVPjPRI3dBOhzEo5b8HVQzmBQqQ5aBlHk/qqkQykXqvEx12P/Y304rlPrPg9y0fe6Jr4XZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481637; c=relaxed/simple;
	bh=NmkPyrRTIjWyClkVXUQzYwO7m/ITRKRWvNzOoU9dgQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DABalNwpXADHlcqlpxVV2691/Z7FVwsLOGI+D6qJDkcsJ7qolPTwMLCmNISG01Ah5x+y7wWSp2zYEMT7phffFm7J0eCqKSiaoiUYgAtjTFT2Zxg97BLFtKA0hIfXDk4JhzUWciCz1CjsOB65GXdYXh492D+ytfxTTLaLeCpT7mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ojeXWXMh; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ojeXWXMh"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c795f441ff7so2910532a12.2
        for <sophgo@lists.linux.dev>; Sun, 10 May 2026 23:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778481636; x=1779086436; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bp1SzHVVQniSVO1ea05q69qwUsggmYx1Vtvah/rM9Og=;
        b=ojeXWXMhg3LqpF/N1R/GV2vPf7B5zQuvQK8SGsAXnwgkagVulumVTtBhMrM1uEpx6V
         9jm+hATzJEplCod9hgrOFb/85RUIhUOPwEzE16D26xQCwII7BI3dDI98lWCrV8h5j/Xc
         nmsloZzz8xDWEyK//yfIvYHnkEPMZ03grZVyAdVgpAkMa8Dkf/05JirJZ0nl9Y3pBL5b
         u+JCHlJF5LLEdwCtvVOuJQumeIasBmmAWKfY9+u8jjBH4vhxDzXNT/DHW9CvL+axoQoe
         uGOPnjygCbDLQE4NtwT39PKVNtPZIIxnadhhfac5VC97tIFKJZfC+nsYqSoD5q7ug+2Q
         aQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481636; x=1779086436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bp1SzHVVQniSVO1ea05q69qwUsggmYx1Vtvah/rM9Og=;
        b=INfi+AyT006wI0NwOqBAYQuhECp5+QQcdxC2ORWIrMKtHGrCjMc0Gp6JxLDWizp8dh
         A9qYfV9DBEyHoMK1m4j4rICPTqEY/CbR7mb2E+oNihrInBKMnnDd9FkaTM3JRAvhZ3Le
         XkMZ8UFgDZ48R23yEcg/XRIHNR8N7M6Zk0c1CE5e0m5ZXXwMnVQ4e2tbdyLD6QMHMazI
         y0LJuWFG4715WapidiYHEvKQ+zjpkPGJmiSjmDf0NH8CxFHnSumcTBdK4pbj2oTsuuhk
         19VkAGM0jQWMIQIlW4U3plb65yn4OBUty2Pg668GaitVgctZewpYoXNQ/afjbGh/LpEq
         ujWA==
X-Forwarded-Encrypted: i=1; AFNElJ+ncFYyq81+ZOBv+oV/tfLkGBW9PnjwMpkgwFgdR1E9bXMevzwPPJLVMokhJbOaGMmp+zfIbM4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6ewuAOIHwFmImQd32oo8BstA0LnDS/NmDiWsAP4JxXaz1Kaqt
	VEyUi9xeHAaY/c/F6kddLWnZkFcxnNlPYKdJhLzrETjSCxkdxBpzGheG
X-Gm-Gg: Acq92OHehj1MSj/1/uYOHPsudas21Ze6Le9d18G0ZOwYaFO257iZkg9LvP+voMq0QL/
	kURz4SPJ2VzW+5299/fKeQ2yEFkTcqvT5ZG3k0XOglqG/6Hl7eGUxjbUwxtiPeLAfaRUEjag2jI
	f9ed/C3PGZUhYiSL3Jy/pQ2PcwJXwrnTOJ5dYWMkdnnITtIBEfcdnsStcEdKcwhp3wsw4mRGJwV
	FMfdOzKXAYoRxB5LzRTG+rKhtphICd6NSdgvE6SlTXREN/JosSJD8Y013GybzYPOcjrnLEM+fQy
	y9QMbUC4QsfYmSu1zCtrxOjP5lY6q3IC9D2b14WTIm5jD2T13U9pU5dk1+0X61Cs7XmfEs0sNvR
	TX4pvZqdi6IHTY1DoPKox+04PiK1+XRtwsqtXmEV083It4sEC9nU0DmtQUkK4psm/cua4iM/4cT
	MODDMdDYnedXpaUDpXWRPW0JY=
X-Received: by 2002:a05:6a20:1582:b0:3a3:a6fd:7fc1 with SMTP id adf61e73a8af0-3aa5a8fc80dmr25500333637.14.1778481635951;
        Sun, 10 May 2026 23:40:35 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267689d76sm7967107a12.11.2026.05.10.23.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:40:35 -0700 (PDT)
Date: Mon, 11 May 2026 14:40:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Longbin Li <looong.bin@gmail.com>, 
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 0/2] riscv: sophgo: allow DMA multiplexer set channel
 number for DMA controller
Message-ID: <agF5dRASi8ombhFM@inochi.infowork>
References: <20260511063719.460049-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511063719.460049-1-inochiama@gmail.com>

On Mon, May 11, 2026 at 02:37:16PM +0800, Inochi Amaoto wrote:
> As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> the SoC provides a dma multiplexer to reuse the DMA channel. However,
> the dma multiplexer also controlls the DMA interrupt multiplexer, which
> means that the dma multiplexer needs to know the channel number.
> 
> Change the DMA phandle args parsing logic so it can use handshake
> number as channel number if necessary.
> 
> This patch series add fallback compatiable according to the disscussion.
> 
> Link: https://lore.kernel.org/all/MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
> 
> Change from v5:
> - https://lore.kernel.org/all/20260426012921.673953-1-inochiama@gmail.com
> 1. Add dt-bindings patch for fallback compatiable
> 2. patch 2: Adapt the binding change.
> 
> Change from v4:
> - https://lore.kernel.org/all/20260225104042.1138901-1-inochiama@gmail.com/
> 1. drop patch 1 and patch 2 as they are merged
> 2. Add ABI break statement and clarification for this patch.
> 
> Change from v3:
> - https://lore.kernel.org/all/20260120013706.436742-1-inochiama@gmail.com/
> 1. rebase to v7.0-rc1
> 2. patch 1: Apply Conor's tag
> 3. patch 2: Apply Frank's tag
> 
> Change from v2:
> - https://lore.kernel.org/all/20251214224601.598358-1-inochiama@gmail.com/
> 1. patch 2: rename "AXI_DMA_FLAG_HANDSHAKE_AS_CHAN" to "ARG0_AS_CHAN"
> 
> Change from v1:
> - https://lore.kernel.org/all/20251212020504.915616-1-inochiama@gmail.com/
> 1. rebase to v6.19-rc1
> 2. patch 1: remove a comment placed in wrong place.
> 3. patch 2: fix typo in comments.
> 4. patch 2: initialize chan as NULL in dw_axi_dma_of_xlate.
> Inochi Amaoto (2):
>   dt-bindings: dma: snps,dw-axi-dmac: Add fallback compatible for
>     CV1800B
>   riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
>     number for DMA controller
> 
>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 5 +++--
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi                      | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> --
> 2.54.0
> 

Please ignore this broken version, the right version is 
https://lore.kernel.org/all/20260511063818.463877-1-inochiama@gmail.com

Sorry for this noise.

Regard,
Inochi
