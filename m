Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBC6801
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 23:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068897; cv=none; b=DyF1DYvNHaGy4fV/3DYZPgfkiu7f3MieqADcqiTKlYxqUCTjLvsuklZhbrRX9I8h1DaFZZvY5XUNMsX0QYPZ0KniDs79LhZiCy1p01XQu1IjSJ1mh24JWxwdkXKafMnHODO8pm3J+65N/eCIvmhfoGKkaqezE5lsxW22js5PRcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068897; c=relaxed/simple;
	bh=HxTLhR5YyazcUPD3RztBrMcbn+ygyOpA405ju0k0ryc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKZrZHXajvIZiEC07tib69Xi6q4HAdXWWWp7jOhYup89QQwvPtrRr6eBXcy1/fPuIHw5RlIc0GQ/4DMEU91auzhdeUF2MpActdtOz4AGgMk5gSPHPWd5I0/FT35yNQqtUtetHGn7oENttkK1HwO7BgJadhER3jG+5XJsbZL8EzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xe+wtN0F; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xe+wtN0F"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c5e2fe5f17so496325985a.3
        for <sophgo@lists.linux.dev>; Mon, 07 Apr 2025 16:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744068895; x=1744673695; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zpdIhZyR7Jkn/zvOFh7pNcs0X66PCzAzcCsJZ749W4g=;
        b=Xe+wtN0FUYUVMB1tJSgXDp9tSns/zRhEEW4Mf1BqvGE6G9dkGkCyDMTck9ddxUOkg6
         howQUVmiORUMy+SPIr6mrjxh4NRqRZzFjU8h8zWV/lb/XfFqkiZ9lBfwDJyxjtvSroaF
         jtJNxYl5kyjMfk8sHVTsRhf2oSqu/kx+my+6MJqImBLP/FeKIIuyUaDRL+KK82bYRmEX
         rHnDzp2CIZwJxZh5iL6OAJmjVY61TNsVJK0G62+x8Bag9oWEpZDqsFvklPrnu6fFNL2x
         uSLSWY/I/SfQs7NRfsCPhELoSmbtkkvvJXixfSSUF1VYfIEsW6t+xkhcCgaKhabVBgKN
         +4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744068895; x=1744673695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpdIhZyR7Jkn/zvOFh7pNcs0X66PCzAzcCsJZ749W4g=;
        b=LoaKUTf3ypXE2uhF//MWR+i+waZ165Qrvw4npo1Mdmb7lZ88waSrJj+z121FOgR7qn
         C017N0aYmZ8v8T9biLA5jfKCGRPSy8e+jzQCPfNsqFJiIur5pBL+/9DaYL2R9Ca9gmuQ
         Ap+WymMx+dFApFK8hNwWRpyUv11nLgRYbv/oEQ1qO6SoO4T0Zwy9+NZPn/Ep7iX0okL0
         Myc/AkH19LnIG0FVs0R7KD1fmg9g0ISZLw5iGeTgwysDZWvWKRqAJDeTNlxFvkUjWXVG
         +zm/moSyonyYHlGUquuEqQZFyQdzEsYRL3JaaXRjTtFB5wIQEiYKdvCmRUwk3AgxntVh
         iZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs3gmB47N+EhmLu5SbFnjwdpTDjrypPCwQwwcpHCMwrIfVtumEYEjDt0Uom2OoNOd+EntKFAA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHBit/DAxooTRptJOe9KdjS9JkQpHM8K835NilIL3aINcJG18t
	rwRtmVYtpNEIOjonR0vZ1IJOAYeR5ytHPBVR1B2wS9E2PFHJoEQo
X-Gm-Gg: ASbGnctTA1+H6AHLsglgBM0ZYMBdXSiX2BYxrVZqJstsI2Qe4dOANAxCRhZkKu/w0t+
	clQtjPey0uN51rE1sqJYub0MJZVUdxDKhNFnH9SsmBd2stQ3qr+uNdmINi5brIysGPubLc1olRg
	KGC+3AOJIX0VGDNjYFdDhsX/XZQbSntHCeLimz216sMQlXICM529NaYKPOyFRuNDsuaxnGtiF5F
	9CruranWN6D5DYZfZClG6/RdVrObZo7RL3oS4AxaIXcAzXdYv1kJi6LjRfTnbJlAx8NOSgfpP1p
	0gNLGO/rsz4KrKyB4zfJ
X-Google-Smtp-Source: AGHT+IELDfTjNUKlfaY71qFiTkaQeFH6uko8o6VC0/566T+WMs+1ocO1EyyVXl92Tw31XsERKCllmw==
X-Received: by 2002:a05:6214:212c:b0:6e6:61a5:aa54 with SMTP id 6a1803df08f44-6f0b754cc60mr157396126d6.44.1744068894916;
        Mon, 07 Apr 2025 16:34:54 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f00e585sm65551266d6.27.2025.04.07.16.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 16:34:54 -0700 (PDT)
Date: Tue, 8 Apr 2025 07:34:19 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, Yangyu Chen <cyy@cyyself.name>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 1/3] dt-bindings: soc: sophgo: add RTC support for
 Sophgo CV1800 series
Message-ID: <tay4sxc6vx3lgwywlz3nefxo3tlkj2lm6qwdozogz5agao2djh@wt2qtruopmy2>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
 <20250309202629.3516822-2-alexander.sverdlin@gmail.com>
 <vxjtdvy5vxhmqldgvt4mgeuor36gdjriiai7y3rej3tevuwisa@wpupxzhvc3tt>
 <a691fe4864debf7592010bc892066beb439c1740.camel@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a691fe4864debf7592010bc892066beb439c1740.camel@gmail.com>

On Mon, Apr 07, 2025 at 07:29:37AM +0200, Alexander Sverdlin wrote:
> Hi Inochi!
> 
> On Mon, 2025-04-07 at 09:09 +0800, Inochi Amaoto wrote:
> > > Add RTC devicetree binding for Sophgo CV1800 series SoC. The device is
> > > called RTC, but contains control registers of other HW blocks in its
> > > address space, most notably of Power-on-Reset (PoR) module, DW8051 IP
> > > (MCU core), accompanying SRAM, hence putting it in SoC subsystem.
> > > 
> > 
> > I think this is a mfd device, so why not moving this into mfd subsystem?
> 
> MFD is by far the most tricky subsystem to get into [1] ;-)
> SOC looks much more realistic [2]
> 
> [1] https://lore.kernel.org/all/20250306003211.GA8350@google.com/
> [2] https://lore.kernel.org/all/20250303-loud-mauve-coyote-1eefbb@krzk-bin/
> 

Cool, let's keep it.

LGTM.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
