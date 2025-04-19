Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E7CF4E2
	for <sophgo@lists.linux.dev>; Sat, 19 Apr 2025 01:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745024517; cv=none; b=c1Mof7/6HZp+aY0O2PIoevgOBCCElMI4+/GAjbdcgpT1WIH0b6LCcM4xJJidIpCAja34DV8XpUQSMbw4hI4FRoHcIwT6ZPFd1wThrYDHEya7LA/AcKhdIrL7UrgHtFOOA0bQB+ojV/mfBv+ctyVbegv60X0WI+m/cgd9gAC/5+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745024517; c=relaxed/simple;
	bh=mwx8+qlWcBVd/c0rg7GGsFD2kt1ft438nzJO9RD5/Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=my3COVFoOePZEMSL91IfDBjTg7if6CMfb80sXHbmFUYaNHZWImGGJUUXMUBuxj7JwOwx5sd03cWfv818jl7sqrJEQTRk5DjIYfjW5IojyAuc4mZ54pTaCEFukxkg9I0Qq+Bm9zZ3mRzh7RxDgwJ7rdxXWLENGaQ0Awau4hhzOtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaoYm/ND; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaoYm/ND"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736c062b1f5so1917162b3a.0
        for <sophgo@lists.linux.dev>; Fri, 18 Apr 2025 18:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745024515; x=1745629315; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ujUghSXI3lvU/j4kBychDVllaVMcrvSdA1dMJsQgYzU=;
        b=UaoYm/NDMTSTv1zW0tYqOWgQD3H0PqTjjVyZe6h9Q9Enh7SKO8ym52zcqS0UQS+6CG
         wmNbHb6xI2eCv9VeV/wI+bIvW+TjjFTf+gyOnbug7yMJQnDA5GZLGq2oDvZzhp1HV44u
         LTe1xQoZh3TnI7e/pdXYn6xp9NyT53yxOf+v204V7EOthuRfe4FU4zxZ2r0vzHAcyRj2
         YOtzN3fpfFeNg2zsATPxzbpjZlOwLuNvxkNLRyC8iP9resGuTKEIExm8QXdF/K1d5h1V
         xJJB54GKd9OZJq4l7mLDs65rUCcrL+dLrst1iUAH0Au8U8nLIeJ4dQ1HcdTAD4PRfCGA
         yznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745024515; x=1745629315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujUghSXI3lvU/j4kBychDVllaVMcrvSdA1dMJsQgYzU=;
        b=Tlpj85eAIA75o2uLPc6BzD+GxmFBkHWPMmhvOHcxsjA2pxp5Er+aK2hnKdst391mz+
         OC9E2YD/FtlS14rRhUP47YN+CJwggIw+EO5J8+z2dXlJjVD3UiPB+DmjFAMRB/O6jW9V
         KpHFD96JT0HmL4sx8L4ayz99/u12/t9phZ4QuvV4M3CbJV8OWyioo2CPOrl3CUK3/PnS
         aOLmyhF/437klzObqZEW2E5EX2SBFK+25FtKoB5qKHly29xmJv/7vRfJtPAvty4wUWq9
         Pe0VkSwFKfAFOxkKBfj4SydPmtw1yd2Im5uYzTJ4/7cG+bCF5uZDSqNz++pueLG048nJ
         p9nQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5zSZmQn0Ku0yUyolTqbnSQV6HQ5aMs8UEugyi1IJtnmKJZJyYjp/EkMKs6Nf9mq7Qh1pJX/8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeKWCch4QW8eJ/CpAvsYp855j6BQLPtNeF7da09KlX1a3WgX93
	sA/qyXGrfZW8KjqF1/I/hHk22jsSSq+kVh3WL9x934UXhzv8yDqi
X-Gm-Gg: ASbGnctU5oT7FDFXjXRGGkqu9rrqECoPrkJhfXatQcPiRlJRio8qY9TexLVztExP/+U
	pHfeiNdNzg3btKakny5sjdfAGR8uzqyYTPS33z7N+f5uEWpZ02UfCILByos5fDfLaX2Zo1Tu2qi
	X1IjqUnm/TWCmz5DvIz1s8P4P6pBr4TT882LHAZcnnn1u3D90+0RWx+6EbD+EytrhvVidEAoz+5
	+KSxWsOdosUvRoiZkjwnCu+kKdfJoJ8Utnvip2H4JJe7RdkGyYdjGOzkPVXY7mNuIObv25qStM5
	yswHX+iG9xlI7Xccx3iu7al4JJ7fBnee1awY7rUqHw==
X-Google-Smtp-Source: AGHT+IGQtEfItXobFcuGDvqDRwlUvs2hCkTSpl7TA3j+71VHIPX2W4+6Y8A6gmR3Z+xQLeYoCXICrA==
X-Received: by 2002:a05:6a00:4acc:b0:736:b9f5:47c6 with SMTP id d2e1a72fcca58-73dc1566938mr5879716b3a.16.1745024515391;
        Fri, 18 Apr 2025 18:01:55 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73dbf8e3d4asm2248487b3a.70.2025.04.18.18.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 18:01:54 -0700 (PDT)
Date: Sat, 19 Apr 2025 09:01:52 +0800
From: Longbin Li <looong.bin@gmail.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [External] : [PATCH v2 3/3] pwm: sophgo: add driver for SG2044
Message-ID: <telzh74wfpenbhtpnkd74hfoqt3fens35xvftgng3agvaj3xoa@geocy2uc5nfs>
References: <20250418022948.22853-1-looong.bin@gmail.com>
 <20250418022948.22853-4-looong.bin@gmail.com>
 <a0d63c0d-7f17-459a-9ba1-6532a986c8db@oracle.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0d63c0d-7f17-459a-9ba1-6532a986c8db@oracle.com>

On Fri, Apr 18, 2025 at 08:41:04PM +0530, ALOK TIWARI wrote:
> 
> 
> On 18-04-2025 07:59, Longbin Li wrote:
> > +#define SG2044_REG_POLARITY		0x40
> > +#define SG2044_REG_PWMSTART		0x44
> > +#define SG2044_REG_PWM_OE		0xD0
> > +
> 
> please use lowercase 0xd0
>

I will correct it, thanks.
 
> >   #define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
> >   #define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)
> 
> Thanks,
> Alok
> 
