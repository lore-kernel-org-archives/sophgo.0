Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246BF1BC41
	for <sophgo@lists.linux.dev>; Fri, 20 Jun 2025 00:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750381140; cv=none; b=DJpfxfpU1RvW7z3O3HV/DbMgzlXUcEnKAqi2XuUtbJmnfsFa9O/EvF8+hGwio2XkMOh0WNI10Z4Lw1AYgEcBJgWIRrXczYgchsivHYLAgtzbgGG0kmSWynxqfwvvAVuahogmB4GZdPPGKv/rFurme+TdsYEqYDaT8kAFFVf7xDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750381140; c=relaxed/simple;
	bh=q2i8Qs3911Kk0ltdtj9t/YiGVSyWNAeuUcRyaXFa/hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ko4IkAXsRLOloFJvxUxSqiHadxqKOJSkdzYh8B5O2NxHSeZBVptDY1ErBk/bzhT/UKn7JwK1PKg28xxO0Dryoq3YKVL86UQsyZFqVThQ7nowmSx+q0J3kWlORyShjUgEsAxFhoq5nJxr2HKePHdkX96SXd8pX9CIMK6ppgrPCVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXOmEHdj; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXOmEHdj"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234b9dfb842so11852635ad.1
        for <sophgo@lists.linux.dev>; Thu, 19 Jun 2025 17:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750381138; x=1750985938; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gNfLmL2GJ/LJtjmF47jC/MYcsOmvEuwoo9HPi2OM56c=;
        b=kXOmEHdjQutF2UgsINB8I0u0XzSYpnpYWEwcY0Zq2tpy151ssL3ulyVJWi0UxnZ45I
         qpG3Lvnm9ftmKKY9EsXJD8FKvql0aEC0MIQGxVu7N1TX+ndSkR+B0Nuv76WN+FDOg6Vo
         WhMxSU+Dg/hznsIjDwwdqhC45JEOwCOBfDaHVBnLFhhkzdchA/NBHPhcXySC2N1QQHoI
         fW58yL3DnfGBZDarK36wx4x1fw2LdIscRCxf2FCt93XDtbeBhz9bwApyogDgyAzgRNwZ
         NlJbqx6COFRafSnZGV+sT3EOe3fvWQYZtDH+36NWxM+MUsONahw1ervOTSA8N8zDGHgk
         2iDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750381138; x=1750985938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNfLmL2GJ/LJtjmF47jC/MYcsOmvEuwoo9HPi2OM56c=;
        b=DLX23lKHxevScGQs0v+pfUQ9D8/0wtMvAJSoMzULCOp3MS0UQgAJAJ7Cnk7hO/VSCg
         0SSUioq9M/cXoy3lH9ybX/QIH6iKJ5y5DgxDytpAEdN2ED+r6R2onbMuuMPorh4eT2yv
         RZUxsCqJA354r0pWFdo02e+6gbpUeHVcLsH0HggKgh9HfrYOo+KRx2hPJQFC1wEmnKx9
         nJb/MM+kDC0lNhHYRU9RYpBIft9cZZfTvwNgFq4ZMerqdBhRDk/ejOAlAAISBGfliaqF
         ahf36V+etdeb0X9Rc1m8lwDkilE7V0DDccrEywSjNqYZa5Oh+OSlqcT4sjFZxOlklgbg
         jqlw==
X-Forwarded-Encrypted: i=1; AJvYcCV3ATi6aV44DvJJyL4rliUCJ2wrZyRm3ibtVTpUJLgYhZQWg96mTF8BhtXY5tL1EKD/NVC0Utk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzThxgwO7GvtgWEMpj869sIul4lC5qfuDn5YHmzCrXt1jv+DGTG
	De+n/qcf0VxTOnXSe1NmJFJdJ+kUTY7mnDf4zD2hmXSv0n99By6QpYdw
X-Gm-Gg: ASbGncs1atLqEksdpBnwU3weBa3aFzzvfCrQEaoh1Mysa8/30K2IavSlXIGy2JuZH8A
	SIfWb7pG6bY9kZVAIXsIVARQXvEeBWTQ2nnt2BJjGgwzR2Y4cmxdG/GF/o6cp6N1EmxSkumIxg6
	yckXK7MWqayAwizYMc2Ac/VHb0lMrgXE+ztxNw87MSIaROKmIQ+ZUB7Chq83MTDHzDo/rBGse2i
	cT29Hpr2LnEOTKM1U15MB0y+UciqfmIyIxcPoYXaXoLWTtUyBVlEpdN6ACzB2yDN80JZdJNzXGj
	MPHQo+DDxL83walLu/826/hH24SYuxCC+siN3qvdKcveK3JCLc+DfunHXr+bUw==
X-Google-Smtp-Source: AGHT+IHi7aECeHZRnPC7vw6NES/MMPC6y4QJZ8P+xcgs4+ESGezFPvNV2kX2PNH9co3DTZQXCAXUPg==
X-Received: by 2002:a17:902:f54a:b0:235:f3df:bc1f with SMTP id d9443c01a7336-237d9ab626bmr11772325ad.36.1750381138271;
        Thu, 19 Jun 2025 17:58:58 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d83cf981sm5109995ad.59.2025.06.19.17.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 17:58:57 -0700 (PDT)
Date: Fri, 20 Jun 2025 08:58:55 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: sg2044: Add missing
 riscv,cbop-block-size property
Message-ID: <os55zbba4lz5dkbrejz6pzsxn3o2brtchxvp5sdjrqubavwoxi@ktyfnjaqchwm>
References: <20250613074513.1683624-1-inochiama@gmail.com>
 <175013680588.1018298.10559632401541865399.b4-ty@gmail.com>
 <MA0P287MB226203FCCC7A25D2140ACE01FE7DA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB226203FCCC7A25D2140ACE01FE7DA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Thu, Jun 19, 2025 at 03:30:31PM +0800, Chen Wang wrote:
> Why not apply this to fixes so we can pull this soon?
> 

It is not a critical change, just a forgotten property.
I think it is OK to leave it to the new version and
reduce some work for pr.

Regards,
Inochi
