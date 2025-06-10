Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90C4188580
	for <sophgo@lists.linux.dev>; Tue, 10 Jun 2025 03:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749527244; cv=none; b=PVFn6e+Eg3OTvJPDqdu5NWuPDVbOsdPxKU/iavJDsROL+GSRZeDe8CGU47yhydEy7CnxxJA9yf7cToxsI7xCIiy+Q/4u7C8cz/VjxC/cRrEYl8Ua2C3zpX0LqKitWXWjCCIz+2/gzVQ+ofr28JuNFXXdFx0MtlDHx4lU/sPkgfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749527244; c=relaxed/simple;
	bh=pMkBGxYpFaHIEwycJ9b/MJ07k3/wrKnc9cEFEsenxrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJqK1mGObQu5IRbyKUsXdAvBshS4S0P5Qu7vUpyS6ZbCvk386KXwBwnWQnGcoRWnlPks8OAT0Ndxb62djqjeTttfakAplJyH+zBtjZbVKtOeXjlB0Jv0g+2WLZVLj12xbqfiZqNAUKsIAitwCyV6gQvWJqXAAEIPTv6Qlepn5f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbbAqbE7; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbbAqbE7"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6fac1c60e19so67701826d6.1
        for <sophgo@lists.linux.dev>; Mon, 09 Jun 2025 20:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749527242; x=1750132042; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zDCiCjFRxyiCWt4jIH5Z3HVu6j2gY+Qm8orsgIXQqP0=;
        b=nbbAqbE76WM0SQokBiD5+bPcX0azrH+igxKWEi8dx3lUEnzA9Hjnv/Inw7iYUkZ6Ny
         0wNnzmgHlHmQSGf0DMVscuYRDO8PY8QgfcLIIi/V8RRpW9lzBY1NHSyySER5C8JhZYPQ
         VsvnmpNuBKIp/MVlQuJt0tlqDcdPLQ4dVVJ5YxVwQVvPs3UXQYm7EJe7guaxQzD4BbTC
         EO8uPFWFvsbvgyXtiOnkyqbDLG+c7GpG9NG11mVacmGwvS/f0rRmyiB4opoiL0kMBuut
         qdF8AuQKzi0scWkuqQSTm50dFZsLtV9MJEc+o+A63m6Pavvka922/o3wuMOIrddvMBsR
         HS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749527242; x=1750132042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDCiCjFRxyiCWt4jIH5Z3HVu6j2gY+Qm8orsgIXQqP0=;
        b=ZVHEVUlDAE9cUukJ4kdKFUsNACamEhPBQhk9lKTXZCv750b5nOpTXlQshZCZ0Cs3oI
         gyLXmlypK7XKXd1MhpxTky1tiZXYUMNpBk8tPQ5SYfPg1xVqWRZrtwSxYJhdpUso1GEo
         zUU48/AIFXPboLkpcmyD7OqGp8+mpGcfSVT6XqJ/5fD671DC35YTr4VBteOrFwqDH4Jy
         kvdk837+vT8sdsV2PkVEYngyMTfuieQ1AS90h+aSXnHqMf5j9JnIcPuka7eFilaAwDcX
         j6SXcTZgwF0D2oTswGfuAcyACKiRiy8d3/ZUf31zSZNJrJjkSqgw8mxf+rXij51wQIOH
         Qdzw==
X-Forwarded-Encrypted: i=1; AJvYcCWx1ejgEHhiR5K9wfdtboowXNE6ATLX5wy7wLXmRSDqQ0ZVFhK2t+Rvl9yS6XeNgOgIXsu1Qu8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzvq02z6Wefxvpp2GJZbvCmvt6dXPFp+oav3+bdBvlrtezKC4E9
	R8K8FI9NIu41fIVkKvAnb7+NxMtnTIWNYJ0+1D0cJS3pFQC092LiWnVS
X-Gm-Gg: ASbGnctJYCKIU4/r8DV24JF7l8vKUX6QtiGdd4kmGPwy4KUCOnHwyRXD3UxuAWAJ8Jg
	XAQ1FdjkMbSZjm5WX1fdPYcmKBlnCTrXIeCft9I6fbhY4MuKK8UXQF+tnRhi3pnpUypTGLl5F3v
	nwr16pFTvsx/KNIuSX4PbIDlUwyMY/VobDr0DGuvn9/bq2X9hSxDSh0fPeZOX/uW7uCYpfZnHOp
	MyDgSAW+niaOmMnOdIQRR+hNxsveqiEolAQJSPJeisigECRVtivp4nrslqsyjcvAARsNL1VRo/n
	gtVCght7fm7Q8t/wDeoZv0O4g5pGkl6z9WRztw==
X-Google-Smtp-Source: AGHT+IFExzcjd3nECuvCDrhqt2cMUduWzh5W32C4n8+lgZH4pHu74tz/o2U2TyL8FHM90amPFhcd1A==
X-Received: by 2002:ad4:5ae2:0:b0:6fa:b467:aa67 with SMTP id 6a1803df08f44-6fb239acc8fmr32720396d6.20.1749527241748;
        Mon, 09 Jun 2025 20:47:21 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b354aasm60401156d6.108.2025.06.09.20.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 20:47:21 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:46:14 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: sophgo: cv18xx: Add reset generator support
Message-ID: <p3fgduezi466wxyc7d6z6msmlyzwrriuwfha5xny5bd4qwzbah@zsgdahiylooy>
References: <20250608232214.771855-1-inochiama@gmail.com>
 <MA0P287MB2262D3E1D44D6B4C5E9A06C1FE6AA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB2262D3E1D44D6B4C5E9A06C1FE6AA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Tue, Jun 10, 2025 at 11:27:01AM +0800, Chen Wang wrote:
> hi, Inochi,
> 
> Judging from the title of the email, your patch should be for supporting all
> cv18xx series socs, including cv1800b/SG2002 (formerly CV181xC)/SG2000
> (formerly CV181xH), right?

Yes, you are right.

> I see Alex is submiting a PR to support reset for SG2000 [1], so suggest you
> discuss with Alex and merge your work with his to avoid forking.
> 
> Link: https://lore.kernel.org/lkml/20250609230417.620089-1-alexander.sverdlin@gmail.com/
> [1]
> 
> Alex Sverdlin, I see you are also in the to-list, what's your point?
> 
> Thanks,
> 
> Chen
> 
> On 2025/6/9 7:22, Inochi Amaoto wrote:
> > Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
> > Add necessary code and bindings for it.
> > 
> > Changes from v1:
> > 1. rebase to v6.16-rc1
> > 2. patch 1: apply Rob's tag
> > 2. patch 4: fix wrong reset ID
> 
> two 2's, makes me confused :)
> 

Oh, a small mistake....

Regards,
Inochi
