Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BB2427F9C
	for <sophgo@lists.linux.dev>; Thu, 15 Oct 2026 09:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055015; cv=none; b=lsF+T5agUO6mFgEMfuwaAyDAsxnM23aaZSqbyzuE0Z0/rMPbMNAegrvQHJ+lIXZy9UTXsSWuPEjmvKwAUIsU7tMcxM/gdZHM9DeWSt6LbezPhW/Cvugm4RUD+vei4pou9KcKQEyeRsMWUc2+I/uvGSvRiiDfA+nEoi4XoM+ytz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055015; c=relaxed/simple;
	bh=UdeR4k+OIEWzRfcj2vsrG7FM4TjcNSgKCI10q+XC2l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QshWqV+MYiI8c99oZNNfEkwLTIPzwW1uhodW7t9Vp9WYs/AXGtHgNU88lDdKrjeA+ra2mTKG9AzWx/90pSOsz0lci5NQafQtqRos4VgILz+mkllDeiStbOptaCs/Hagx+AtQ1FDYRshEP7EuwAz8ZORkffZjcXQhnL7qp3JNTPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieQWigX2; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieQWigX2"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so2280878a12.3
        for <sophgo@lists.linux.dev>; Thu, 15 Oct 2026 02:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792055013; x=1792659813; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KUIkGkj6B9Tv+hZUqi/sJY1ZKDxkj40BHrOHpN+3Sz0=;
        b=ieQWigX2hZAkLW4tRM8tantuo+gk0W5MV1z1iIvQV/RyrWt1fKwupv2dXWp8qGQOWA
         oIXO0dxm3HziRMg4C4yFypV6HDl3Q3Q4Xun7+N5Jd86BCzvlZsB6RSYoXBoKJrIjINp+
         y+0fWgWoZxwRDUhhiCZ4OmQj/ELvaAboD+KB+/cxZGX1UANDsJ7Pvl9qjkW21L/oShZM
         F3KF+dMs6FfpAlzLxoQTCThVSIOE0Dskr5DZ28VzjANBAPIlniFPeyK/ceh/pQD/gq/a
         k2m+q+BrISQ7x8Y/1FFNY/NoouRvzas3Q+LweTRH8JDOuBs52qwwPMd2mS9juTHEIC0F
         7ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055013; x=1792659813;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUIkGkj6B9Tv+hZUqi/sJY1ZKDxkj40BHrOHpN+3Sz0=;
        b=uxJlOS5QXzuA5Q2I3r1Dq2J6TmtuM1tQCP/LglSKlG8S7hKubriA3PHxvqeBTgSmF5
         jVJZXFUBqcBCxhd9gKY4NIxRQOW5cT/R9s0NnCGtltMsirVbImisxGqT4ABtzsLKxjtB
         8VzS6TPQi3HqQRWZJOBar+CPXLTIFqhru81YCpNXts9U6IabGhqh1WtQfdWJRRkEV5hm
         CKew/p7rVyKT8GNCBtAepMuiUeQP/UoDxkdVBjoiKcA7+d6D2IhhTxvIbDRAZFztVPk/
         d0qs923NHWQMDb71RBEeelyWb+BnhIhCdF9z8Tbn1LW/RHIA72GSA1IB17RtuOatxaLQ
         6MeA==
X-Forwarded-Encrypted: i=1; AKwUvBwkcNgquzXGa9kaS1NQYTNKWVVbbWckkbEdNwzceuVCJNmje6dVn4awReudaU2rwNSLx0XIge8=@lists.linux.dev
X-Gm-Message-State: AFq9FYLz7auziSSCFWrRHFOnSH7JaGAA1yxIGUi9vnpkge3tI5gm3gnM
	3IGg9iPvctvOfR03hqOMCDbZBETbTsT9sIM8xiARQmAGrdnpfnTUcS/Z
X-Gm-Gg: AYBFou1ymL4Vg1c5rppf0idGUTxtGOeNoMwbf8SaoUMI1/1HKGlk+vw4AO/Hfleeh2v
	uQLqQiBOhcBjpRy+64RPAiUAd1KLETOVCOr9zwqpXYOKPF5Joscz4DTcsQBRb4Cxnzl3f2BP/8x
	2KOtNoOa7LWv1MDK8vs7gdw1fLWPKoG2X9nLmzWifrct3+h/V+mJKM3qWdX0uGDI0Q6/1VGynvU
	NcUVclS0Rokf7so6U1QzbVrQRwZx6hEuaLoJ3buMnMaiVkH2JmR3zgqrDOC4bNJZr8TmSqjm9Ve
	zx2FNByI03aTSJV+7SVR9ioVIKrw+jRClINuK+A5aBb3+PrE7D3Y+2ISUFwgtMDuYK9gzlrySCA
	xAr0T4lF6fmT8hhVpBUVgPTfq+ANuRr6RBBfBrTJ0YidU85AJ6RyOscbIeWFEPBgoG+iiLq7X0M
	NxOOnr5Kg18V0o0JJDSIqZjVGTYicLx8hNlaJoI3viYdu3ZOq+vfdSe/qf5A0+MuZyPhdf
X-Received: by 2002:a05:6a21:3944:b0:3dd:a196:3091 with SMTP id adf61e73a8af0-3e16bef498emr14329973637.65.1792055013262;
        Thu, 15 Oct 2026 02:03:33 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635cd3b34sm962553a12.28.2026.10.15.02.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:03:32 -0700 (PDT)
Date: Thu, 15 Oct 2026 17:03:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Message-ID: <atCV8NsJc5Oatoo0@inochi.infowork>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
 <fa4253c7-3b17-4b20-97b9-eb37f218a4c8@linux.dev>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa4253c7-3b17-4b20-97b9-eb37f218a4c8@linux.dev>

On Thu, Oct 15, 2026 at 02:43:40PM +0800, Chen Wang wrote:
> Hello,
> 
> On 10/14/2026 3:45 PM, Inochi Amaoto wrote:
> > Sophgo SoCs such as SG2044 contain eFuses used to store
> > factory-programmed data.
> > 
> > As for SG2044, HW automatically loads the eFuse content
> > into shadow registers which are organized as 32bit values
> > exposed as MMIO.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   drivers/nvmem/Kconfig        |  12 +++
> >   drivers/nvmem/Makefile       |   2 +
> >   drivers/nvmem/sophgo-efuse.c | 176 +++++++++++++++++++++++++++++++++++
> >   3 files changed, 190 insertions(+)
> >   create mode 100644 drivers/nvmem/sophgo-efuse.c
> > 
> > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > index c36c2a4c2a0b..a7936dd65bdd 100644
> > --- a/drivers/nvmem/Kconfig
> > +++ b/drivers/nvmem/Kconfig
> > @@ -465,6 +465,18 @@ config NVMEM_SNVS_LPGPR
> >   	  This driver can also be built as a module. If so, the module
> >   	  will be called nvmem-snvs-lpgpr.
> > +config NVMEM_SOPHGO_EFUSE
> > +	tristate "Sophgo eFuse support"
> > +	depends on ARCH_SOPHGO || COMPILE_TEST
> > +	default ARCH_SOPHGO
> > +	help
> > +	  Say y here to enable support for reading eFuses on Sophgo SoCs
> > +	  such as the CV1800B. These are e.g. used to store factory programmed
> 
> Why is "CV1800B"?
> 

This is an old mistake, this patch follows Jishengs's patch in the first
design. But then almost everything changed and only thing for SG2044 left.
This is the thing that is left to change.

I am not sure whether it should keep this generic name as I see it should
be compatible for most sophgo SoCs (at least it should be for CV1800X, 
by just change offset). Feel free to give if you have some suggestion for
a better name

Regards,
Inochi
