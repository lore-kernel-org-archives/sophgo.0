Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5DF31353E
	for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 23:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768519739; cv=none; b=rvOf18R2sAkY3NUVugAhvuSvORUJ1jBYKAUjTon9WuCGr4Iox+bGlMEkg6UFyAXje8ld5BtwLTAGNW280E9OarDUXbxojH4Qi6qI1JzxaWMUAddS0oQCc+d5QCeODyZ+l/qjl0y/ADtGozv3Q9u+aPffUvW6myotA13upDT+058=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768519739; c=relaxed/simple;
	bh=txanPurl5++EfE1uW4IYSyRpUU5HE1HGm9IY19TLNDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAdm+7DyO+m/6rFu3RSC3e6djOBCoeUFgQ2asiDIfgcmFoz5JYR+qeoLkBF3Op01sOKK9t22LLJyuf25hcUrMP6f/cNDE83WxijI64uvgewyPVSeba4JC4nC5O7XWglq3vdsWGtKwTOQpojE68HFn4+9OBDi5I6FceQpJXge8BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bs7FTeAY; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bs7FTeAY"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-121bf277922so1952305c88.0
        for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 15:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768519737; x=1769124537; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EE4G2+Ee4dVjEHE+oRCN2fxuWRapI0YlnZyPBEUQyIc=;
        b=Bs7FTeAY2Gr+/y2pawRwJV+6OPIKLXrv6XqkxmhQUQ9ctBuSrHn5NDGxF+AqlnKKJu
         JplYgJQgkPqLBRGfSzRZ9IVL8sIEBAD/XzIu28i0pjBiD782RTngGslk6OB7HwsuZSXV
         o00AwpcwPWMxtWN98lAaIemXn1bfPhwI9hzYXMUm2Ok6uiWqixjhymNJpREOOD59r3/f
         rA8p77ZZNhQbuanuXiE09unB1p0cGbdd8HVpl+6llzqOoHKmIHndGJL0qMgrhVbOec8s
         fDej5yiLl8K9hjSpmSvOeH9DXWH76rpTXrkzEYLIzAwSdo6Xwz4g6cHlgojpSSoeTmww
         A2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768519737; x=1769124537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EE4G2+Ee4dVjEHE+oRCN2fxuWRapI0YlnZyPBEUQyIc=;
        b=E5SvE2wJ1XG0qba1zVHw2Yj+txU5XMBFQApbnum80zAINvhZKwSwctrTWjwUQBsGE1
         HmIH5b8n9l2uefqV71OPTOKvgNBShYXAG0WyBgfsavQGIP1mc0gh8eY+JD2+GmLUeznd
         WUhofVy0SqgBJNfam9zSvxxsnGNXCGxm5xWAIKI80WrAFgyNTBOVDwqJBbRPByxoETUQ
         KrGzonMOPoL+ipLacuOjTiJaa7s7jr3BBj8nw0hXhsTaa+xaVXg14rDZaTLMTuzBeICd
         C3nrBEsfYZFPcnugFCRU+cigNHv37f+V/nefbHHU6fqvPc4h/wKH3fEcMsKJxRIqz4Sc
         519Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9JyamMQFbmNj1qs+a5Z5zU91zGqT3Tawh+MBSc31hc/ghUpanwo933lKtztjRCrd5I+IS7rQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzG05NTW4L+W4TFAdx4hfI35VA4kq8Ly+VElFBzfcKmlNmiPLh2
	AZPhYrHMGzRACWbU3NVFZr6yQlk0iNhY6Izi7lEfakLafUBfe++8JVeY
X-Gm-Gg: AY/fxX7Dab+IGjcWFI+filNj4oLndiJX7eKL4t+LjPygZDEeI67W2b6isy2xDFAClOt
	MCGIfPCncQS2MwbnjiIBgKV5BFBFm73WTL3gwjCUyTXQCDMJDPDtuT8dQKnnJfcmx3YFASuvpIM
	uMrVe4k6+tChavBvVym82KQXWryQL87HrHtciEXuvqsog96fvcJgxAN12Gq5PCqTYtPo/mtBsah
	/Z5FUKBIS7TD1MbkG8xcuUL1lTy9alWv4IIXjoZnmeC9GWkpubfPX09CTA5j5sXnRQup5Tn2pB4
	QTPQKp3sU+tboILiPqOMxDKEEs0GiLyJO93Ik9AxF7/poaKhT+eppyDm8JD+mrjuZTvIcUsppPN
	ROJd00UVjd41osoUUb+gZI019ug8zjLtVYPglChg2jCIvdZx3bC74ZWF4DmV0azCqFgit842vlU
	78Qs7U4qXMyg==
X-Received: by 2002:a05:7022:628c:b0:11d:f440:b757 with SMTP id a92af1059eb24-1244b35ad1emr888785c88.26.1768519737468;
        Thu, 15 Jan 2026 15:28:57 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac5842csm1005165c88.1.2026.01.15.15.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:28:57 -0800 (PST)
Date: Fri, 16 Jan 2026 07:28:52 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Longbin Li <looong.bin@gmail.com>, 
	Ze Huang <huangze@whut.edu.cn>, "Anton D . Stavinskii" <stavinsky@gmail.com>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 0/3] riscv: sophgo: allow DMA multiplexer set channel
 number for DMA controller
Message-ID: <aWl3_1g1Fw_50Blo@inochi.infowork>
References: <20251214224601.598358-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214224601.598358-1-inochiama@gmail.com>

On Mon, Dec 15, 2025 at 06:45:57AM +0800, Inochi Amaoto wrote:
> As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> the SoC provides a dma multiplexer to reuse the DMA channel. However,
> the dma multiplexer also controlls the DMA interrupt multiplexer, which
> means that the dma multiplexer needs to know the channel number.
> 
> Change the DMA phandle args parsing logic so it can use handshake
> number as channel number if necessary.
> 
> Change from v1:
> 1. rebase to v6.19-rc1
> 2. patch 1: remove a comment placed in wrong place.
> 3. patch 2: fix typo in comments.
> 4. patch 2: initialize chan as NULL in dw_axi_dma_of_xlate.
> 
> Inochi Amaoto (3):
>   dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
>   dmaengine: dw-axi-dmac: Add support for CV1800B DMA
>   riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
>     number for DMA controller
> 
>  .../bindings/dma/snps,dw-axi-dmac.yaml        |  1 +
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  2 +-
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 26 ++++++++++++++++---
>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
>  4 files changed, 25 insertions(+), 5 deletions(-)
> 
> --
> 2.52.0
> 

Hi, Vinod

Would you have any suggestion on this patch? Or this is OK to merge?

Regards,
Inochi
