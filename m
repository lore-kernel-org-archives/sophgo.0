Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D80F211F
	for <sophgo@lists.linux.dev>; Mon, 13 Oct 2025 00:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760316246; cv=none; b=M9m98g/d3oqF/lJfPQtNqR+iYApN/6wtitKz73ksASvBYK2vMD/CZeAa2q0C+txApB4iHWos+VShTEx/8OsGwbpn7fc/WPFixsVkFcoaz2BH99Ro1Vn2LqRn+CUVx+sKoHYb2BLTOizBDIrSX9oo76hJlL4fxhGc5nqspWpjWBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760316246; c=relaxed/simple;
	bh=ua47nQqcjG90ipA1ouLjou96IW22yuNv/8wyBnPHseQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfHw7uGtaHC4OU0Cgh4Ly7/H8FmaE6bpwPQW2ZJ+LoH/KR3WlmrjqNznrTP4bj/oGTBjNcu5ygZLH30Qw4yA7JX4utBMaQpQHB3a1Zs7FdgzooXvVVmOuoTnmdyYPfUYFC+49tDjA5vUQT9Ous+CBtlk1KgxThxQMmwy3pj6DcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9r0qntK; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9r0qntK"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-78af9ebe337so2837077b3a.1
        for <sophgo@lists.linux.dev>; Sun, 12 Oct 2025 17:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760316245; x=1760921045; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yPwgPz14QMmJyiGXqsXB/z8FmJN7/401xIlwLm/DIq0=;
        b=k9r0qntKFjT4GgrIeWG7ZtXxiKanZXtg6VJJkRt/xhPmEdtlYaTrPULd+UF8sEE3Nj
         YdKATCEcqt5PhCS1eftiGQ5vYarwWp1mYCGIN6R64yu2yrngqY63+Va7CslJ/3uOpMhg
         2aVjpC1b5OrG7lpd0GfzZr/1BmX+jXYH+fC65HgQjYgDsiNGlgtfgZLvmpfOTBp6+Ca+
         S1ZB14e6nYFkG4SVI1lPhETZ0XRMucQqWf71TpON6Scbk0WGYV07tQ7vCkvcU3ISJTdm
         ccXgQUdAo0nm0tetr2Oj/SP0WXPrDipYuD62rLEmC10jB/aWEkVBUZOCl+7bC7C4BMnU
         g2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760316245; x=1760921045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPwgPz14QMmJyiGXqsXB/z8FmJN7/401xIlwLm/DIq0=;
        b=ruFUH44ULr0/Tla4ye3DXOmYllUGauKWV7LWPypUXf0Q8AqHOO7GEXGuGgttIaHCgr
         YDnQ5jxpVye5JRWr1zccASM2+q5W0hTS72Mqm7+5lzKNnSjPDFI/nsrcC3qdejuW6l81
         0txMQ7vA3PbrkMoWDv4LVfsyj4WGem0YdyIG/6Gqx4kq4s5BVpFmAXW8a9PPNKKpx6DV
         CJK/7LTOoVwr4mMghXekZOc3Hfbtz4VZ/5xjHv8ndmr4o7Gw4cKX/MLvReSVTGyCHXnu
         O+AAyZemISfC51EbN2e4vhVy/m79GQu7pZCfIIhneL0BfyA16hKNVK5WmVOcRXkVvxRX
         +EuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDVXxUZHBO31msW37fZY9Z3JdbZOEfrwN89m40yncx5vEHuPuQMf7X6NLqJPkSYnN5VQ+sZfU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4t5g/6SWzf+orxuSFLGQdl7pPI2pjRQUFLjpPS9p1y6oMtRML
	ZDHjJrqe+H/ZseL/J+S+WU5gM4boBF9fPY6hqltCu7JqL3ErJg2iN4xe
X-Gm-Gg: ASbGnct7hRPH2ENERWUJwxxEcnxZkUz2eOtVQkggUpOM3iuuxvyZCrz1bMcPK2sYAmP
	sX2X0TBRp22OT6fCnVZgSxLrJgoWDrtXIklpWoWVVZMS3sK0qWRQrSGS3quihq8fv43TnRKMhLc
	qXy851DJhI1eqMWUa6uTELUJulgpmwc+qXfu4txZC6Kjf1aINpfkxYaGNfyHLwj13UaZi2EUXVx
	ZTbaDESLP+RTlWrNm93LxDdrfHN7BsjiSsg7VTsbjv+uOzyT/QCs7wCSPBjbK8g94hCGQs4nusf
	9PPcyeY/FauanTjf7HeUQnEGyhjMhwcFAHT2vhLPUHQPBuIJJ3FEuLROpILAM7/U2JQQG+/jW33
	I7kDQtc0jMl+RUpGUNwmvc37vNRoywUUczFiSUjLz
X-Google-Smtp-Source: AGHT+IECq70NJ5A63ESJRalAid7RnpozwDsfbFxId8ZL43D2ZxgrEq0z+oLu5gMzH/ZQF72Zp3uEIA==
X-Received: by 2002:a17:903:948:b0:249:37ad:ad03 with SMTP id d9443c01a7336-290273ee21fmr266565455ad.34.1760316244858;
        Sun, 12 Oct 2025 17:44:04 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-29034f9d177sm115904685ad.123.2025.10.12.17.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 17:44:04 -0700 (PDT)
Date: Mon, 13 Oct 2025 08:43:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joshua Milas <josh.milas@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, alexander.sverdlin@gmail.com, 
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com, chao.wei@sophgo.com, 
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <bsol3uim4brrrsdmvuk6f3uzampbki2pyhziap6x4rw7txl435@rwoxrnctkf3y>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-3-josh.milas@gmail.com>
 <hkdnjyldwr4watvizsju4qcvpvkb3mtt5rathaooembpceyufx@ega5xrqj6v3y>
 <aOqtt7BDXxItrs7W@sleek>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOqtt7BDXxItrs7W@sleek>

On Sat, Oct 11, 2025 at 03:19:19PM -0400, Joshua Milas wrote:
> Hi Inochi,
> 
> > Only enable device that can be accessed directly. These devices share
> > some pins and only one of them can be used. I suggest enabling devices
> > that are accessed by default (which means it is compatible with the
> > vendor kernel).
> 
> I decompiled the vendor device tree and will match what is in that.
> Surprisingly most of these are enabled there. 

Yeah, the vendor enable almost all, but it can not access at
the same time. The pinmux control which device can be accessed
IIRC, milkv already provides a tool, named duo-pinmux, for you
to check the pinmux.

> I also tried to check the pinouts [1] but didnt really get anything
> out of it.
> 
> Link: https://github.com/milkv-duo/duo-files/raw/refs/heads/main/duo-s/hardware/SG2000-PINOUT.xlsx [1]

You need to dump the pinconf register and check the configuration
with the document (the link you mentioned).

Regards,
Inochi
