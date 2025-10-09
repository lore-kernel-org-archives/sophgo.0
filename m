Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517C1142E83
	for <sophgo@lists.linux.dev>; Thu,  9 Oct 2025 01:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759974781; cv=none; b=jVTBW4gF1IFqdftIH9+3nlU08MmCthEua6+db3GYiUugigmuV1f5DTD8mUsHT+gLZjaRYPJAoyB6d8035FmwRm4LZZ2v9wndy5Dxx7VHCFPtzyRhdExOhb+WDL/OWLXlZ/aO5u91M2CMwFyMIzPvcUvLzLrHBkVgXyZvmFuQnew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759974781; c=relaxed/simple;
	bh=bkZbpWdGEKj4bz65kM5fy1g/yKb92chEmY6l7l3nY60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHty3tHkLOMosrEunf8ktXuAcDE+KdVONuQeKRjjjB7jSAArTcpJEC3LVxUCG29Z0x/RtfrRose4VM068P3Ms5ObuYh/8fr/sS3phUnWz5nUEROLneKqGxOcfdJWHLgb1TztGzzOCLEB7iC0rKR1osEGDNPeyk7ms/S6EIJP8sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFDGftlP; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFDGftlP"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4de584653cfso6905621cf.0
        for <sophgo@lists.linux.dev>; Wed, 08 Oct 2025 18:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759974779; x=1760579579; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bkZbpWdGEKj4bz65kM5fy1g/yKb92chEmY6l7l3nY60=;
        b=YFDGftlPGml6pfQatgh34T6VlfYaPDrl+phJrWJSmEK8J+o61MfI1d1H66l5x2M55g
         O8EAAptXRW/Siga5CYiOfj1cFkVePFxaQ2V5pcWvFADpRxnZbRz1Hyy8VJz1Oc47XmT2
         XNXLhmfkb0RWUi/kqGEdgUtROSN2HN8qXoxCEdy2XCIQsU+iBa5E6uXAdsTAKQ0ctmIe
         8TBr0CaW2MoAKpJG6O1UsftIob1MBDwvvOaGZ28PUnvsfdWtv0KlKR1/TxXaaKmF+e1T
         v1JQZgBWR4yVmDq6BrdF3IfpoN2sobKOMj00sUMDC6CsUPltPJbjO/QxQbVJqbm1+S/g
         BJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759974779; x=1760579579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkZbpWdGEKj4bz65kM5fy1g/yKb92chEmY6l7l3nY60=;
        b=EZlke6rVhv6CwMREmTFVGvi5g6xnAfIXC0Cs1iTlsxdwmJnMpURetxGWr6PbIZrmu0
         ByqmpR5gMXzsDvTd1Be/MhLJcZL2o1N7KDWwEq+ewh4nvf8xibGvGnOEgvp7szy4hnCg
         liiFURfXiJB4paBf0sPZdZ6A/1qfejjyRVuGiXG8mXMyegu/SJ6uymdpNrP4yVa3HcEK
         O8s35awVzqb/ZtQbrStMuVpZMPa9unIOOiFkwrIfmncS8tRn1OYeWLS7HkdtJTotrBWk
         14eun0yd5IwZpzCLmZm1b9E9ZDJq/0gP4gv5SSMB3rDjYiEYFY6x2qXcEt48SpdTsI2W
         H4Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWVfa/EO9eLuRtsMGniFh6lrEsLfWoYXMlY+3Hs46GkgkDkRB0umuTIN0vfjTAuaOEQL378t8s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOV3xPOJ+IkKlk21R3S4X738YTRO/9Uloo5X99e/xG9XMP/WjF
	sQ7n57g0zEE3y2BrOZf5EVmGLdY/x6drJu36qyUBA8i7JHQvCwgjtiww
X-Gm-Gg: ASbGnctiJ2TnX96sZ1YT5tXASn0+B9u2BopbCpr53hf+LO8BbJpvLfBUV6Yoex32g5h
	nuAXfuBvKstFDh/pVYEGG4twyispMP0vO2AEvnq3wUimU4R2mmZ7p4u/PC94Vq2Fv8M+NsUXLug
	Gd91PUNKs/FRsilrRHzWv1VFuzISKzj7IMc/4JJM9v+ysz3IcMx0PADEF4eNZBOfKLb0UYad0I7
	aKA3oFyopoQ8RtdXiqOOYhNdtVL9AglWpbeoOOBayS/jOGicwkOCou6r5pUFVspwFIG6fHcdh8Z
	IpW+EnGWtzJIeNOPaeDaXBPwEkcrZ/A7odEBrQcR8Z7jdHcZ5fiF8KAH5NhtFZ2HIWDClsUH/8y
	dOylDxbTTsStPfTqZnvILetHF37OCrNplXcuNFVpu3OxhcUbRqrNxoyizBNvrm0tcGrRfTkLYUA
	xg2LXl
X-Google-Smtp-Source: AGHT+IFtsHrv92dAWj8mGMUHYlHjwMt2fYEqRT49SMsyhCpika+TRCqU1Im+NQPWa/hkxKMIgtTTfw==
X-Received: by 2002:a05:622a:5797:b0:4b3:3b2:2b4b with SMTP id d75a77b69052e-4e6eabf9fbcmr77703311cf.0.1759974779149;
        Wed, 08 Oct 2025 18:52:59 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bd783b3esm174593866d6.36.2025.10.08.18.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:52:58 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:52:56 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com,
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <aOcVeFTUx_Qn85cs@sleek>
References: <20250927173619.89768-1-josh.milas@gmail.com>
 <20250927173619.89768-3-josh.milas@gmail.com>
 <nkzpfylhxyqf5u3bjlokhe4udgcxohbaanhwuofjzatan3iwio@45ljfquf5sui>
 <ad86009bff38ddae0b291d3edbf958ce6363ece2.camel@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad86009bff38ddae0b291d3edbf958ce6363ece2.camel@gmail.com>

Hi Alex,

> I believe, gpio is long time discouraged here.

Does this mean just the '&gpio*' entries, or other GPIO
items like i2c and spi?

Thanks,
- Joshua Milas
