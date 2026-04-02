Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D263237BE6D
	for <sophgo@lists.linux.dev>; Thu,  2 Apr 2026 22:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775168759; cv=none; b=srixlDwl3BEjnuf3/fVbs2gl1l2bYD78LX72nQX84su4iw9zdbwTqczxRfxvXY9EwK7F1mX1LTLXf2C+YBHhLzH1QlOLSyljwg6mpbWR37NHYlmk+zoKCXLbBn7hmjkZUkHYdqcRbE5kjctxNjFsZVVAX713+WEtJ0oIXkGfnuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775168759; c=relaxed/simple;
	bh=gZ93mT8V+cAjYiB9BrP3gKMHvgP6imQkqZzt4qDVlkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VeIxrCJJfIiSdDDPrLUvjb1bDXEyTlltL/O8S81gqX29Pm2xPOFimlvqPxklDaNRY9mVFWQc2suoZ6aFwRGAuEkquMkaqwXfBEoQ4mkXNhzrNgROdS8PEAw1Lr/7WZLm0bi1WNXdZ5f6JxkUivrpYilS1PyRJ/9Km/WNObRPdFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cx02Vc6l; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cx02Vc6l"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82ce0a9b41aso545575b3a.0
        for <sophgo@lists.linux.dev>; Thu, 02 Apr 2026 15:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775168757; x=1775773557; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bp+NWFpOjfpa5u8dRL+RGQx2iEFp/EihhG2Z7hUjzS4=;
        b=cx02Vc6lYL+7e9thn08NcWiWbx7GR45bRJV98nk6yE/EzCEczIAoz5qRp/fQaE+FT+
         2VXKRi6MYBRhhbm5KBHUetg/35GDHs41gfjuO51tGIoh1xTXUwXvNl8jEP0zvsVntmoy
         Pf4HScaipBhp7C3x5HdYs1C16m2i+j4otnhCQtVxo7hp+rdwNqEpeDRTOUFa0b4tcU1S
         UL0xZUv9Ei+2xbXN3FzlvKKG9VQQgHC3Qw0CP28WEgowiJKFM0XGg4WiUJgvxAnq+Fc4
         44QNYA+99vOmFlJZd+WOIW3kAvqBZtOCkNw5FyTQ6oIDavn0B5yF5p0q0FdQt57irV+k
         s2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775168757; x=1775773557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bp+NWFpOjfpa5u8dRL+RGQx2iEFp/EihhG2Z7hUjzS4=;
        b=bIlQkQxi+vEYrwaS0U4u88iWhTnCv2vLGodaFHtGGICIZ2KK2rhkKgicIw3rPbW0yy
         mdR9xaXjPdl1ahTC1EulBjXp0ZnCpWkS4q0fIvzbXno3HU0s5i0zFBNlmDBG4UME8GxD
         zMz/yFPUzaLHJrY757BvRJeFTDaVfIJVQSZNV4I0rCeDL4ClW6JnQn1BD3pFl3BT11Sh
         b8nDfsihdj4OBM0r1JXUWGeqcg3vLr0x+Ny9v+TcBVxu6tACIowRPnRquBgdo6415Na5
         sLUuOX8yUeu1UwwkTM6gAptvmgBaMR8wN4c/OUGzFK2lEZXVUdWRD6mZziZGIHBcGswp
         NQsw==
X-Forwarded-Encrypted: i=1; AJvYcCUNVBw6YFOIMCpmvjPRRIn5laOhgXbaQ2+8BQe0fdDXakv6gPgraK2xs673v1EhWSw0IfGI3CY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6g5QmbbotWfmI5pV25U/OTNFoIygBDPNIeRy4yIwjO7n/izOJ
	DMZz4o6mshUhJ3ZOD4vWZmw87OaTWDYDDqPJHggVWGmIMwVBm9VBJgnZ
X-Gm-Gg: ATEYQzxNGpTfzcg6yIHvutkZEfPBh4IMJpHSWeFrwJ5tr4lqgK/9wQJjChSUJ28ebVF
	e0S/TX2x2KUh3OXOxVmOcy7/ucHRRRwsZXbubx7R7i9bIpxLOY72Iaqnj/6kvq3/3L1z6qbk+Gj
	SN0aYKVAISZdCTn5/OIA4PQYnJJfa1WIXzqjr9omUhJVfaT5KSRJXSO8q1DtUJ6fNGr9/3T/53I
	GHJH328Y0oHyWae/SZZroi7Pj2r7dUUfV6VENeWqGvo1xqUMKQRFs8PgJC0vjESwIAl6xdDBV+f
	PgVHgB/Utzs+javYTSEzmfsAhZnjJp//CwD7wfe/uybnwRwTfafvMXIX/GiG8ggzNWPjTUrs/5g
	fQqaziX5I+Sa0vIoJ7dqgj4M+g280Pywu5fSbiT23CLFeSyI/HXxYyY+S8g+G7NVS5FoAmDx9sT
	RqaACdxwDrU38DCXIAzTBlI/oKZFGj2TwYrw==
X-Received: by 2002:a05:6a00:a0b:b0:81f:852b:a925 with SMTP id d2e1a72fcca58-82d0da4594cmr742546b3a.1.1775168757075;
        Thu, 02 Apr 2026 15:25:57 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6ad8asm4338596b3a.40.2026.04.02.15.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 15:25:56 -0700 (PDT)
Date: Fri, 3 Apr 2026 06:25:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Chen Wang <unicorn_wang@outlook.com>, 
	soc@kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>, 
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.1
Message-ID: <ac7rV0xGGVmxT-V4@inochi.infowork>
References: <MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <f99471c2-4b7e-4475-af71-5c0ac4c92809@app.fastmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f99471c2-4b7e-4475-af71-5c0ac4c92809@app.fastmail.com>

On Thu, Apr 02, 2026 at 11:43:43PM +0200, Arnd Bergmann wrote:
> On Thu, Apr 2, 2026, at 04:39, Chen Wang wrote:
> > For CV18xx serials:
> > Just a minor patch to replace the compatible for
> > dma-controller to allow setting DMA channel number.
> > New bindings and driver part change are picked by
> > DMA subsytem and this patch handles the left dts
> > part change.
> >
> > Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> >
> > ----------------------------------------------------------------
> > Inochi Amaoto (1):
> >        riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set 
> > channel number for DMA controller
> 
> Doesn't this change break backwards compatibility with
> all existing kernels?
> 

It will break if a old kernel with the new dtb. But I
think this will break nothing since the DMA device is not
used by any devices in the old DTB. And if a user force
the some device with DMA in the old version, it is just
not functional and lead to a broken system.

> I did not take this one for now, need clarification, or
> a new patch that keeps the old compatible string along
> with the new one, if that is possible.
> 
>        Arnd

Regards,
Inochi
