Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C401331E106
	for <sophgo@lists.linux.dev>; Tue, 16 Dec 2025 11:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765883423; cv=none; b=HCzXTliGoD6qvBE9r1ZfV+9+8pIrf37QBCOyfYjW4lPldEChdrkcrBfpXK1PzPd22pDA6eIw5cyPwY/bWuRcRQxcNRSYkSjXmHyL1QJaWU4z/sqhMfkBdGcgZsaD2nDKQtr6gBl7qgD1Zq5dtiYN1m0rutU66ZNsHi6Cz1E65GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765883423; c=relaxed/simple;
	bh=GPn5v6ECMpGz+RtGGw29bhw+BjaX3HOHkO9+4/D4oeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgTyHHP0pKUmKFoy/XoLpZJ11CVeGOHv9U2S43IJ4iPlZJzLHdtKxg5xRvvrUaaxisNRHDq9iV67OEJTV49NWm/TDrwDzVO43XW6WdXrFgupVhMO+yK3IazW103MyjFZMiLDzYIjVzCEXEC4xM5Pm2bKBzVDcVI4p63u3Pdynmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7zj9j9e; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7zj9j9e"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0d0788adaso21659025ad.3
        for <sophgo@lists.linux.dev>; Tue, 16 Dec 2025 03:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765883420; x=1766488220; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ej3ICkCwAh2kwXUgz8fJWzp7gMYAFkjNFgF5UWgoP2A=;
        b=O7zj9j9edY9OcRwH8itTWzH7u4LNAF7u6LY1NtGZ9AQB8agQv2mWJbYi6/yK8r9LmQ
         rZZpulkADL5pjsbnPzKj4z5Zih5oPy0kkXZGhrZ8t7cW6GVkqzm2b+lafAB5MofH3MuA
         rsg885xMrwH6WY9EPHL0NL/pieRoKi5L0xMLSiLiXeSxB4RjhWyQnE/uLf8sCtflqUkn
         53QX6u6JfxlH22+EseDd1d1moxqwyG273KsvTLeJSelr6n5OQDvTeN+iwoagvdJ8mDuT
         lX0HDeRsoM5T6HkGSK4ufVKwvOnOrpqiYH214w7Sf+4AFQjYPJUfDjMIFG5SGZI3gNHG
         Gi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765883420; x=1766488220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ej3ICkCwAh2kwXUgz8fJWzp7gMYAFkjNFgF5UWgoP2A=;
        b=A4d9tg2uR0pTJ/mZ2SXyRmw1vm+G/Qr2inoJef+aVHW11cIs1SWKHg+60xDBVVOtxh
         E/hz6EsApqvyKnvKl7w+o8d8zjyxzVsD1S5bkRBXkd5r9LFsEqTseBeLBHa7UhON2zAS
         prYLJ6p9En7bUeE4tTDMUjs7hurgzx0QajregGz093bQkL7eD2HweZ21xd+pIsRB9n4e
         9iIH24M7bDGbyBeqp+ekJOPfz/WWvVb7+Qy5T9cWeo6TeGhQ0DQtDo/Cig54NqqgYkPG
         I45pgllSrX7wl6OOSwAtLdWWTsJNS7NI4QI1ciwX8lk98FY9Qme1YDOUlztuU7dfHSWM
         H1sg==
X-Forwarded-Encrypted: i=1; AJvYcCV2KHccy+Ph4yiVBfGZojlYhsobjCNr6KDivEm15owmdr8h8tlVJKknwq9glYuCf87ExJtrgDI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5jcfLfj4U6kmL6ju00kTzQRenh8v6JMOu++v1dIf36i1Aavki
	z4oqAv2ZSpufN9POQjylVehAWJOAxjM9PBi8+8Z3ZqBKLns6Z9TTqTjQ
X-Gm-Gg: AY/fxX63ckExAj5mM4c+zng7wrfpnBxSJ1zyNOgBqzKL9/r6odVOadhix2qIW5x49ry
	4yL3YVCnkbB5sGCWwD3e9gr3W/YBejDA1E5BAOljfP/CZOw46UithBn4sk0Vp+84R05tvJikpGY
	3VEcC9OyxQhd6hJmEzGpxYxCIHhsyVFeolsKTnPArnUO3fcUlVaCW5Wuf78dxzklwrASFFZCkK5
	cud+flpMLlJS2ox8FgSuaThJk5oT8tKdJeZpjMx5j9FDvEp9tcZyWW6rXklDIiJ9G1k+JJtwnkm
	BSl07O0xXFqzyUs2LTX7cJoVF5Vu+Ou9ImUTgLZfL0vxQ2Z7OH6F/1R8RNi5M/e4J0c7SrXZer9
	9oclMBpxvCPg/OpscEfKmPd13HIRMZVW18w7tM/q31qcvtv75UnR/9/r4eiSaOrTUfo0gNjKGGs
	QLXalemAR1iK4QNg6MA2nd
X-Google-Smtp-Source: AGHT+IEn5RsKYSO5hlJJgYZT/9nyqBTv5DdsyrL3E95sfCO8MKdD/gWsaEX+ukrp/NOH0Js4gDXwRw==
X-Received: by 2002:a05:7022:3a8e:b0:119:e56b:98c0 with SMTP id a92af1059eb24-11f34c18eddmr9239549c88.39.1765883420209;
        Tue, 16 Dec 2025 03:10:20 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff624sm53688630c88.12.2025.12.16.03.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 03:10:19 -0800 (PST)
Date: Tue, 16 Dec 2025 19:09:16 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Anton D . Stavinskii" <stavinsky@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Longbin Li <looong.bin@gmail.com>, 
	Ze Huang <huangze@whut.edu.cn>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 0/3] riscv: sophgo: allow DMA multiplexer set channel
 number for DMA controller
Message-ID: <aUE9hDtflXpcgGnX@inochi.infowork>
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

Hi Anton,

Since you have tested this patch before, could you give a Tested-by?

Regards,
Inochi
