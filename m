Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE28329114A
	for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 23:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750202064; cv=none; b=aMEaUxN5qdAeOmriSsAMWfMVNS94aB1MKZ7WB/nEBfyne/lWwb/KpT+MKwJzrV+o5fwQRoxpIMRSF0akTSa5khAn4elk1wPHKa2GiHinef5UX5vLbJ4+vNQvje6BgbEd9RPXOIYZnL2A2MnX0Qs3t33YEZfD/POK/ghixeA+ZJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750202064; c=relaxed/simple;
	bh=Cunbq/fRkIIK20gW7uYxC8XS+0I3YTwbTImpnDIBVeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVZF0JXngt2Fd06tOygqWe9g+jNvXCsVmYe4Ja7phCBgCz2zsXHqLeVr3xSbjEt1CUrimRHSWcE5t7Bo5r8cUt6agJrIzPUZjgXD77sqmMqWdG6qq78Ju6+hXnk5NNo6VplMI/Mnp3bRJki6JHgQygzLwLLC1JCmahB+Y4oRLzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k03zTeFY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k03zTeFY"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2350fc2591dso1487335ad.1
        for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 16:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750202062; x=1750806862; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EGBYSwd2ZHfMGSOUy0pV5HM6pjaKicXfvLPu6XGQKPg=;
        b=k03zTeFY+IOXZ3uErJcTisLoCSx7c+ospl/xRTBPVueT7yssaMSJ2WYRttHZbsL1Z5
         PDlYJBEwUqUyu9juafU2M8eQ47MR+AB52bNu7RFIcgUg1yWAo06KBBtXuKDOyA6L96dR
         cG32tU4nhRF/4VSmdZUfoEyFIIsAx71QGxmEk5qx0nkZauD9BFatvURnCtNbUlJ9zMxj
         ipOExFLzKEsgowKI+bTHWFNIcI70moGeIpQzO/qFnvZMovo9jgIDREM/BHjCGIvI6Ltt
         WNpQGIgSPqZY6WUn8RG2vOvwuTqECfsTrwIRLH4W63FAL7b6IA/70zg2gjqqeBoaZ24E
         Jm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750202062; x=1750806862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGBYSwd2ZHfMGSOUy0pV5HM6pjaKicXfvLPu6XGQKPg=;
        b=mjeiNKu6J9+D3N6HLuCbWpRib1yaeDdmDfN8A6et1Bz9D4YXDrhdR9Th8RhkhV5/aB
         usgcV/BU1zh3b67LzL7gZCUmW26N78ik/LihhMFTisMRkXJm48xVhZ+knUtXtC2Vd7hO
         s99kLMKkftE+Q9+AZQ8usvJCVoDchgit76u0o0CGmIugPH42Kh617g7SPzwVI2G538tu
         wMFRxKHSaOJjeYslzPqw7pwEszHZrOatV47BvkBhYn4UJdlEVFwxC7nhxsRnzPC9BUgM
         UCBXp4Pc7oCmCzcjZNWojpTurwlwFnTAeS/xbVd7Wz8T88uhHtU0/fk7y6Ilj3Mm1zXk
         +klQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP62d1za4HU6h22Bn+TOgG4ZlQA8puQOhsas9qycoCh9m7cgEEedLCf+5XYUreCfROqL3LUCU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjV/4aNTGYwWh5GrBttHbG7xq5MAKcZtqmkNjrGF3gCkqYzs3r
	VmksUq/LjnYVeCVG/DBq0ytqEDycbFriFwB0jqXEmdrOvUQCInKRh/xc
X-Gm-Gg: ASbGncv9QsLr+G5wVrBpr50v8kyagdEejGen3mkdFOs7Tz/GIoAu9MCJl3OgfPqDuK/
	oF4s3lGuoJk9ae7LFtKafyj+d0/1TUOptMwVSErqgl34P42Qxok9OO4+JoUu+qH9c5l4E0cGaI3
	vNe/nxXdinMhNAEuTCIBU1xN7YW9CxbI9NgFiayDMVycg9DV2SPAvI09Mwiw+BvqQo7mP+R18to
	OwIplS5aCmfgWaZpoCMGyy6fsQztGjUIcpYdX6unTsnx9fA+VgrVoXVcZDRRqliXrp+M4OveQdf
	s17uo7ASOZEL5In1pmeSJGQBJ+kADC+EWXMBX4P8ThxKzs5gKNviToWWyiGSUA==
X-Google-Smtp-Source: AGHT+IHV7psFrMmfaxJ1IV6J338iQx2HCKSnK63uEQGDNoDbLglPoYovMqJVxLQHE0+ZHMqLW7PAuQ==
X-Received: by 2002:a17:903:15c7:b0:235:1b50:7245 with SMTP id d9443c01a7336-237c2047aafmr5335835ad.7.1750202062010;
        Tue, 17 Jun 2025 16:14:22 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365de78169sm86179965ad.123.2025.06.17.16.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:14:21 -0700 (PDT)
Date: Wed, 18 Jun 2025 07:13:05 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Ze Huang <huangze@whut.edu.cn>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev, 
	Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Message-ID: <jwehvuaywhkmrnmjxz4s6vv45seof5aihvb33upwbjv73bt5ak@e6yt2wdo2mzd>
References: <20250617070144.1149926-1-inochiama@gmail.com>
 <20250617070144.1149926-2-inochiama@gmail.com>
 <175017325268.2418026.3599473248491336605.robh@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175017325268.2418026.3599473248491336605.robh@kernel.org>

On Tue, Jun 17, 2025 at 10:14:30AM -0500, Rob Herring (Arm) wrote:
> 
> On Tue, 17 Jun 2025 15:01:39 +0800, Inochi Amaoto wrote:
> > Add bindings for the reset generator on the SOPHGO CV1800B
> > RISC-V SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml        | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 
> Missing tags:
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 

I removed this tag due to the the small change to use enum.
It seems like that it is not necessary for such a small 
change. I will keep the tag for the next time. Thanks for
your explanation.

Regards,
Inochi

