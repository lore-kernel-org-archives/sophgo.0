Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFDF38F9C
	for <sophgo@lists.linux.dev>; Sat, 17 Jan 2026 00:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609754; cv=none; b=kv1aQF8Mdx+cLHqMvOMoujSk4z6WTXuBuCv/F4SWCzDNFOAsy802vnozGXeue1dDT4ja+eGZrwUJDbhwrscJtMoxYUoRRqF/7L0Zboc94PBHSXcnYuXI6B2FanDMLDzS7WFQhttiOecb4rnipqPmOZjscnqF22QMYN5iD72KXl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609754; c=relaxed/simple;
	bh=1zm9T7CaI8B5xZXNRoBq9Dn2BczVK6uVcN3FJffFlDo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVmeDjaQ2Bkam8SmXFkvZralh3t8XR0wFtkZBMoGZuGRjznwnP2zZdpOcipflJ6YEyziWqDmYpttYbQMCvqtRwkfD8E4rjG368AvWsM4BzGvtsgqD4Z6bb+VUytDZnKg7rQOFYcEeLXC6H0Z6raCHZaHlrG8+Qt08Kw1lPWciWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaIRZREx; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaIRZREx"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1233b172f02so3229925c88.0
        for <sophgo@lists.linux.dev>; Fri, 16 Jan 2026 16:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609752; x=1769214552; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mGO1cK4mQ9XzEnYxq1fxs9vwo2P1CEDeSbovMGFFZdo=;
        b=aaIRZRExAsm/sL4jLATqP4mFt3a0Kt0IfIDBTK7n08nNuzqU2HE0tpTGGdNLUxJNNy
         GFfshmJqsbaeNE9p50cFqHcxbsXdFp63lx/tcK7vP8l9YywTmGD3M5xzp6J4JMjDTlfb
         tgzIAP9qEBkdhtAC2Ce3vahk6sgELdaLO7sKwsJtS6743GE3FPwJ2TDY7ryZ1vf+oOFa
         E9Yojv50XVQKUWuarQQvHthPeOkRJN3nKDZDbNuC8Pzmf1LPBxD5KDNMTdLdHtXZrhq4
         6hXlLgrb3jTE594T44GoU83tI8nFOlfdTlFP2dvySbc6anf+MW/I2jRfimDLuXmC2nuo
         nZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609752; x=1769214552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mGO1cK4mQ9XzEnYxq1fxs9vwo2P1CEDeSbovMGFFZdo=;
        b=HUBQfSpBXQ3q/OEKEALNFqI7nwzsl7LADEEEu4uUpLdQmS+cmVE03u1NPV5g0uL2J7
         GO2AQ20f++I2lzPuLV3Yc0Vfe4VBiIUSBBlt1/71e1b42KH5LT0m/4kF5RYokj2rEDqe
         55pDElNAtwE0uy+je10GL0icdfygQpxE7zpXasgKldqASQ2pXnYd30NKNN4vCr9LdI6Z
         MDjh146zKy9kFwPc8MHbF04uUhApY/fu4rkDwWUEEOL0USCIv330kgapVvITrDheO/Uf
         E9Q5wVqlj0o1EdFn6xRkjqbTLqs/hSOZftce1AOpW/b6YhJowpUMfSfcbnSPlV3IsCTf
         VBUw==
X-Forwarded-Encrypted: i=1; AJvYcCWKQKRTqF+e3mZzJsI8B/H8iDWw1lAHsUQEwH7GCbU+/lCh/ORZedxP+fZkENJCp0bzOJa5X2w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0BdIp+Hcb6hmGRMA8cmG7pfrI7rf/UZfygGBySIYxlfgy0dq5
	ASVX6tqUhRsX7IE1krgiQm2NkTi2baz4r9MIWElIb7QqkGuEoikhrFdr
X-Gm-Gg: AY/fxX5g8w5EpGS0tOwdnMuX5MuHJuNRrbloMkfjBMZmNbrMQBj6XCcdtO6vGbSg2Pq
	meiSnJsN66uWKO2x6FiHqODgJBgny3jNquEaIj3jnqHwey8lV5OfJZROwywZYdoXMe6Ln1cFXkp
	V5khjANeEBfGV98Pe1m06toomlGyBjiXF4/q36EiqpBeaJ8uROgaxIpaK4rXiY2Ob5dhCmRS8hn
	/UdYL0QRttQYLj4A1fFiyBJ2mavGV5xNIo88ZBDAfpjF9sNlJHjkX1RvmOokGr5P3IqhRCfKrev
	cYmdSv3F4sn7npyRMra/0jj7Wu1Fsv6x4zuo2gRzVqXwQRdxraS/qKlaUQbonJMq6p82Bc8sI1B
	rLMojqwvASlVqiGLkGLFLg4t5zkpEtntmVJn65jioRAIAR8lySINlcaYIpWAbmTf7Gjr/L0V3Xd
	XfBb+UBe+8mA==
X-Received: by 2002:a05:7022:4181:b0:11b:2138:4758 with SMTP id a92af1059eb24-1244a6f4633mr4974776c88.21.1768609752297;
        Fri, 16 Jan 2026 16:29:12 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac58140sm4235676c88.4.2026.01.16.16.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:29:11 -0800 (PST)
Date: Sat, 17 Jan 2026 08:29:06 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/8] ASoC: sophgo: add CV1800 AIAO mux and I2S support
Message-ID: <aWrXr1aXB3YUPisg@inochi.infowork>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
 <aWl4fvKsUZDg9dwj@inochi.infowork>
 <aWpyLQ6FR8_RsD1n@anton.local>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWpyLQ6FR8_RsD1n@anton.local>

On Fri, Jan 16, 2026 at 09:25:51PM +0400, Anton D. Stavinskii wrote:
> > On Thu, Jan 15, 2026 at 11:17:37PM +0400, Anton D. Stavinskii wrote:
> > > This patch series adds basic audio support for Sophgo CV1800B, 
> > > as used on boards such as the Milk-V Duo. 
> > > The series introduces an AIAO audio mux driver, 
> > > an I2S controller driver, corresponding DT bindings, 
> > > and DTS updates to wire the components together.
> > > 
> > 
> > I haven't see your mux driver, is it missed?
> 
> That was bad copy paste from original version. 
> Thanks for noticing this. Will update the cover letter.
> I want to not overcomplicate already big patch series.
> So multiplexing will be done later. 
> > 
> 
> > Thanks for your patch, for all the patchs, I hope you write a
> > meaningful comment for the patch, at least for now I found it
> > is nothing in your comment.
> 
> Thank you for a great help with that series. Do you mean
> I need to add more meaningful comments for each commit or the 
> cover letter is not describing everything clear enough? 
> Anyway will do my best in the second version. 

For each commit, the cover letter is OK.

Regards,
Inochi

> > 
> > Also, the patch 8 should not in this patch and should be a
> > separate patch.
> 
> Yes I've missed this thing. I will remove the last commit 
> and move codecs nodes to the base dtsi file. 
> 
