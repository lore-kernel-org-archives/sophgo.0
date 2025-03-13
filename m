Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369A32673A4
	for <sophgo@lists.linux.dev>; Thu, 13 Mar 2025 14:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741876474; cv=none; b=R/vwQu1BMqadStINNDGMHikRjrDeWcyBaOtDx2tcGuf1y/0go5RhE8uLZi4tImCJgMtuSE+N0EjWDo3h56oHqGxYDk6cguHxEcY+rY5uAFg0nOUO5WoYTEI63CXe4t5NPkOf8QOvcbOS12hrkWbaH532DpedRlHD/KxUxDKk24g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741876474; c=relaxed/simple;
	bh=UazzsAUWI6GAw0njs5UkMNVIT1Mhmutw/miu7AFOpo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6pXEadQt+7fkMid8rCqcgfarId2OLm3jbBQRfQ2xG+/OHNHeX0du5T6S5qSlxUHR3xXMGkX+IxsSr9DXtCzxKsY4uLNJgb3glfiZoZ1d2+8oP/LgycokMOGWl6caXOrp9x5nm1S7ycRc3Vxa/63qpKUMJWf8LCgHqGIogUbhBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZtM6o+a; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZtM6o+a"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-301302a328bso2168627a91.2
        for <sophgo@lists.linux.dev>; Thu, 13 Mar 2025 07:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741876470; x=1742481270; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GICFi0VoA04wMmuC8eF7tQ0MeFnd48JKTtPTlIjvHiI=;
        b=XZtM6o+a+cQ4lh5BDcV2sCgLXFlZN9ir8j6pZdFYVhhzeqd+F2Rpx/r8Q5n1qIO71X
         /vyAGkn8UgoJuslhu0QdX4lEFjf1O2YIpXexGlOmvMo63jCy66F1WKG90buF0ppzty2X
         GQxI5KloPrQNT7bsItxsMhVnqlHSK/ypscNpmKKaszJ8G8uAVKN/6dq2YUiAfLp2hHbM
         FVaYTntlAnQd6M5ub7XawPx3uj+F5+oB7HkltXICPo7NDUNpncEWmK9G9G8xIJ5e7OAK
         KH/BcV7Qj1t0ehXdOBlHmkV72XqnoQGUCfbGYCSMNarodPB9HxG0fybWpNjhQ732E+rq
         bKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741876470; x=1742481270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GICFi0VoA04wMmuC8eF7tQ0MeFnd48JKTtPTlIjvHiI=;
        b=cTqmQLYygIWWCsaBIq5sCwYb8WQqCSpWrcZhLdmeSMWsKAH7zkJX9n/ZU4/HVpu7/z
         pNqMgrdeEZHkhzeDTFRi5UwwJzOQKhvJcBmpWNLSLcFh+6CPrFQBYXYwJe6NWMdBUNxj
         OfLtMGEBVWCPuSw1Y1GR2/g33EgcVJF2kXvFtkfE5DVZmtLwh0/HmLBjb6YNI0/mWcwG
         55ME7D6V9P8VlWOPHhFhONuqcHF6qxlBNS1kEHkRsmRPBPV7UbV/qptjinCvwVdz5Iwg
         M/fwBumrXjB934J816pPZiMVxUjLs2H+fa62MwnLY+CeYdYkraIfECFA7HD5hoJvXtrJ
         QsBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPvfDvWBV04ux7h5BRoppUwlg27/ckpAbNESjRXreotFEL+KGN1SIMzezbs7dO62aCGLf3uj4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxE29uEIXgFXGz+eZ77y2LrHm9GfOqAh/aS/0VibrfL/sLexQpQ
	fLYGF80pfS3N136L0IaLyYTlutzZ4E8jt2qQ9pKr1bsW70uhx949
X-Gm-Gg: ASbGncvHte3u/WvjfdGNxt+4cRDlyF6aQAaUQO8mmu2h1eSewhWTPT03NTvo7sHBQ9A
	9aXmKpCB2P786SkMvLl3AmwCPjz25lw+jM//wVJc2POo5qQhflaDiZISJ4UmHm1kNYJpNh91GxR
	v9kW+yXSWcpvh4cybJT2Gv3hcX87/Bg51VMeyvVf+nzd6Hyb1ruYmT2nWcTSMtnWRiZ9BoLa7G+
	vRVTiePUoWUieErw0PLlsy/V23m1dMhoesa027T45FRuFTm4zY0ZlLE4GsunuoZW44GqyaXKQhU
	dfXQjg4cm40SbQX0NQPq7ziy1w5xMgk=
X-Google-Smtp-Source: AGHT+IGfaVAk+c9RAVXj/AWvec/u2Em3Jena5j9eOn/cnAaGId16whELS7F/FD8YOMC2w8PrpvsyVA==
X-Received: by 2002:a17:90b:380e:b0:2f2:a664:df1a with SMTP id 98e67ed59e1d1-2ff7ce594ccmr39877404a91.2.1741876469920;
        Thu, 13 Mar 2025 07:34:29 -0700 (PDT)
Received: from localhost ([2a0f:7803:fac5:a7b6::1])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-30119265943sm3891865a91.36.2025.03.13.07.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 07:34:29 -0700 (PDT)
Date: Thu, 13 Mar 2025 22:34:25 +0800
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, dlan@gentoo.org
Subject: Re: [PATCH v3 2/2] riscv: sophgo: dts: Add spi controller for SG2042
Message-ID: <ujqeq5do2xqf5jvepxaynaxridccalbjows7gid4ehyj7jduyk@2axt2thtet6z>
References: <20250313-sfg-spi-v3-0-e686427314b2@gmail.com>
 <20250313-sfg-spi-v3-2-e686427314b2@gmail.com>
 <6262dfd2-9e0b-402e-bb03-a2174d544923@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6262dfd2-9e0b-402e-bb03-a2174d544923@kernel.org>

On 25/03/13 02:43PM, Krzysztof Kozlowski wrote:
> On 13/03/2025 14:11, Zixian Zeng wrote:
> > Add spi controllers for SG2042.
> > 
> > SG2042 uses the upstreamed Synopsys DW SPI IP.
> > 
> > Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/sg2042.dtsi | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > index e62ac51ac55abd922b5ef796ba8c2196383850c4..9e0ec64e91a2330698aea202c8f0a2ca1f7e0919 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > @@ -545,5 +545,31 @@ sd: mmc@704002b000 {
> >  				      "timer";
> >  			status = "disabled";
> >  		};
> > +
> > +		spi0: spi@7040004000 {
> 
> Does not look like you keep order by unit address (see DTS coding style).
> 
Thanks for reminding, I will read it more carefully.
> 
> Best regards,
> Krzysztof

Best regards,
Zixian Zeng
