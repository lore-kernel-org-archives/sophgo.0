Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12502DCC0C
	for <sophgo@lists.linux.dev>; Thu, 12 Jun 2025 22:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749765860; cv=none; b=ozKU8Qbahd0qzvLCPxbpireCc1dx878LT1fwkI5Nj9sMaSTW+12w7cRQRWoozlYPYwYS87IyjGuCoirLE1ZBQXuoXRThQUk6YQxuwostjfY64aar3m1hYlM4pcogXguDsbzFlZGx764goUEZuPgZhLfzBHSBYHuWyx7AuJ97CCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749765860; c=relaxed/simple;
	bh=RfJASzZb1qIDSgBLejNVBaFi6NPTYNHOZJlPRicbjt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+R/yqV88QP4PQ5uBPTGhSsTRIUkokctcWvTcf0d5/wzhZeNGnBJEjT5dwMxI3I50mrP1EPrBfuOajRWTpEhHMJ8xkIjjBoTah2RqZoIIgb2ybXs7mv+3kmekMzmyuCK/ZwI0bVZlfSyeG9xI6M05aAAYQTztfnewjpJ7E0TLTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yn6urUcB; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yn6urUcB"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74800b81f1bso1328999b3a.1
        for <sophgo@lists.linux.dev>; Thu, 12 Jun 2025 15:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749765857; x=1750370657; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr4KrCMJQ5nXA8cX+HqskZUQjva7UZ3MKq/H78lqt7M=;
        b=Yn6urUcBpOOyNN0sTCr0GXX1VwQ0LUMVXW9vsT9Io0Et+3Qx+wLxeOF/6dvkgewQpf
         bkQZnlKygnjtYCcKcB6irFWzGjdDNdeCQ51Sl9wj/h6ONiHh6AeOL3v2DGHJSpPLCS5t
         ASIQ0IhYPtXXYruMse5CC4ZY8SZYhg90DCevxfrgLiT3kaU+RounRNrEXSsAZzOG3Mdg
         likht2a3iQoroZK4VcqDRdpafTlqhhX2fL6wGBsrK/irD3DVn49eG5Foh27RoidtIV7G
         PMfYo/QZVmoOEgpwKyWs//eqpRRUwuUvF9tOPJfharDCfuynX5WyGrEIpcOSIf+QE8Mh
         ax7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749765857; x=1750370657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fr4KrCMJQ5nXA8cX+HqskZUQjva7UZ3MKq/H78lqt7M=;
        b=dmiGWAOynVUwL4PFKwVobH4NkR7v4rzz8a2pQJojs3JQ8etQRGweiNQNpW9nAmptIK
         OX+lztBR1Rd3z29P3IkilQxcWxCij/jvuaL5p5V7RBx0bPjJK7w0ixLKyUNXPFjrwaOq
         lVMc1I4F1iBUqO1W/jfTlcVpq/T/ztdPKibIttETM51Ue/sZQzQv6fI/oawrkkKsjloI
         3N7a9nfwgEh69FwJ74bIuTcZVkPuPtbtLbO6Bh7Yse1U1g3CpOqSvd0APArzbpSIYs1J
         1YkaKb9tkv2cJBWJefE/8mKTs42j2lv85Nd6YYb1P8QAgdEgTzdMw22tNcMziv2ztb2H
         +sNg==
X-Forwarded-Encrypted: i=1; AJvYcCWDLY7T3v6E2KDOqwWuNAzCXY7q+YL03kiZ11kjuA7+aW7YjJflKEJyvl+hnkzLtSZekHnEJWM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUu0rK4nOQwRmr4g7fllBeuAW/y/ozIMR0xHi2K8o9g8R/P376
	6eWBPztUPwOO0MINSKQSZe5whM3+OdREWyVZXl0orh+0b2z2VupJpEw0
X-Gm-Gg: ASbGnctAhau9iHAbhqOEyXnhXcGZ/BZc/hKg7y5fCW4fK9EUsja5GO+db/Hb+L9O6pz
	li1qlvtZtFtE4Y/xNf8qRNhjiwrRpixpd3v2wXWz6Wy1lwfoI3QYdv14nD5wb3quMVGpBUmo8of
	me52WgYgdES6QZzLRMJtu3qhegkKlOnPDkIs/wVeR4u6ui2TcyEsyysV/xdCgT+TjUl4KFQFsi/
	0/R1kofcE+uGYvC6T4Dp6maXypPfh/D91Zpes8FK1gLVGHFHyvWw9zalVr3cttWpOQGxymkmDAh
	Ey9TdezKifegZNIVhOituwyqCnn/S1582nauDddieAGixNUDTp/iWH81oy+s4JxUsBzc3BE=
X-Google-Smtp-Source: AGHT+IEBFgndZ4ma3VrBmFJWbwgQqLDt8H4cuSSrnRjAzD9LoUAsVC3TnK5FcePSUnq9KPVeQ5WVFg==
X-Received: by 2002:a05:6a00:3a04:b0:736:5438:ccc with SMTP id d2e1a72fcca58-7488f70d83amr1057601b3a.9.1749765856965;
        Thu, 12 Jun 2025 15:04:16 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-748900d1ceesm230724b3a.161.2025.06.12.15.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 15:04:16 -0700 (PDT)
Date: Fri, 13 Jun 2025 06:03:08 +0800
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
Subject: Re: [PATCH RFC 0/3] riscv: sophgo: add top syscon device for cv18xx
Message-ID: <wyidzvmwepooa2pnmceea57x7ggvar6vyowgom47qgcjbhf3dr@2hxq466muptb>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611-doodle-storage-f1f23230adee@spud>
 <t26cj5xhmkqro5wgf3vqycvgwqhtwv3x6mo25hde3zretbl5uu@xy5igj6vqejx>
 <20250612-specks-banter-adac9a126ec4@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-specks-banter-adac9a126ec4@spud>

On Thu, Jun 12, 2025 at 04:58:39PM +0100, Conor Dooley wrote:
> On Thu, Jun 12, 2025 at 08:30:17AM +0800, Inochi Amaoto wrote:
> > On Wed, Jun 11, 2025 at 05:14:59PM +0100, Conor Dooley wrote:
> > > On Wed, Jun 11, 2025 at 04:24:48PM +0800, Inochi Amaoto wrote:
> > > > Add top syscon device bindings related DTS change for CV1800.
> > > > 
> > > > The patch required the following 3 patch series.
> > > > 1. https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmail.com
> > > > 2. https://lore.kernel.org/all/20250611081804.1196397-1-inochiama@gmail.com
> > > > 3. https://lore.kernel.org/all/20250611081000.1187374-1-inochiama@gmail.com
> > > 
> > > What is RFC about this?
> > 
> > I use RFC to ignore the patch check, as the dependency are not merged.
> > This series itself require the binding from link 2 3, which provdes
> > binding of the USB2 phy and DMA multiplexer.
> 
> In the future, please provide a reason for things being RFC in the cover
> letter or patches themselves. 

Sure, I will.

Regards,
Inochi
