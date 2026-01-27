Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842A92E62C3
	for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 15:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769527836; cv=none; b=ofjKOaD89DYzt6Iba+IdWa2TxXx4/8gnk8CclP+RPvL9yBJj0BNTMD2KubiYdSgrcrKt80GgA3ibOWdfgW0j1kQ2YZMnED8GR2QVruAi6wE6+caRnvSxLgVAn9yvm2eL3cQUekvGD7WkEr9D3d+25K7cWn0v4+Q+wL6VKq2PwNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769527836; c=relaxed/simple;
	bh=FquAxMyEZUnx56clUpEYy39o5UtF6dOtZ+36u7/JQ9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CU47sIwf65TvK4pDttbadnAYcYhHVk99s3jXdNdggDX9J6ggKdotfKSP8YgqQdou0W3+cpcnOGcgNSTDFznxeAD4s4is5oh2barYGu8kaSOqLok5WC1MT85aXWQ5vS6wNn1W6zU3a16EmCs732rKXEOhFzel/6R2oMpVCUGaDF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OV5ZD+c+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OV5ZD+c+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee07570deso45118915e9.1
        for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 07:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769527833; x=1770132633; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+BzwDOXsuwsKZRnCwm7TR0RjiDWsT5xOCESlbi3ly0=;
        b=OV5ZD+c+4U2II5NqVawttG/jVtKA7Vg3sZEJLVKjOArcPdpz2MOKT3jKyARE5efjEW
         ddlck6/Lbg12ppxIn8bAYLlUBA3KfSAP3wALrCSkJH2Gsz4pedpnQU/xKwXhHjRYSnXV
         JbF+L7z0uEair9/OpJC0vvVCGeVUl9zKnLBYC6m7VxsJ1GqkTkqk+funPOYPhqEKw6Y3
         ermfZx+GWDAfC5Ot63njnpGEO7wUsqtyl+gg/H5d3Dx2sdtKwugn0n8e6An9YKLnIkjB
         b4//zazRJdlW8hYOUvE16wslMRjKNSbstZacQrR3ZywJK/ZJKm9oOatzVS8KH05rYm/X
         RPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769527833; x=1770132633;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+BzwDOXsuwsKZRnCwm7TR0RjiDWsT5xOCESlbi3ly0=;
        b=YbXa+yyRcR0skvu3j1DKBjkIudg7aeq1x7LVPBhrzrIMY3wLCnVJ5ApSWwVNZcgCUL
         gIeDzqSWU1IAnddZ1fywAMivi1onugNkr9lMAp6xJvLo9MXKB8snvb3Ih8edUR5OS33g
         5U4vTK1bylpvDuwhnAfYQ0dlHc4iCBV+drUCZUgQbijRy/RJSVpQyvh1Z3FALBKHPk6I
         WcVeDvnnlvE6Iaveq1zNYV7EQDHkE/hGmS3I4kRnGvpAEMf7/9X69a+GvyskTo/peGsl
         QYvPeyXNp3SlH6tFmMu/C7LsDXud8txrRda2rZaFABZa5TQ/+Cm75hpNgmfsYKW1OTmf
         ebnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIB62Ox30WTtUOmHqRLmRJgmBe6DevirE0QwzMwgFZ08XKTTYvNTsFXRliwumyThonjNYigAI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk8Aca3YAnVrjT6NRpuCWgpGBl9RYv4UkaGcQq/O1+vfmBpxaC
	cTkjLuwIRO/Uc6KhiIFWHQkmrSh2p0NF2q1sBodR9K/5bbIFcjgCzCzY
X-Gm-Gg: AZuq6aL9qQo6uOydw10lBAbVJ4MORVT+GQ0XiNwR03LWAoLIRKrR0uqNPd6iz/EKy1q
	GBAJ9ZHoTrrUcNKP70onnwDc7vgQGfia0GsYWozS7qFvNpN3I6Jf8whUKJr4w3jWzEs31QFKDuk
	shHOiX5EXEFntVa9NEYcYl6RLpELRSIw/N+Fsz/l4mLyn+lE3uTHiVfbI94bndWVd7OikvKQWs5
	em2Y4n2g1UYeNxZS1Kf4OyZD5gNz5fM2Q/dOnEEGQp6g24sPhvBLgHBVc0S7FizyUtm7Me9a7U3
	akXEav6VWLCzpv82E5vseYEGe9UEy8FSe//s2frWUTz1sJOt0lQdVgIfYmG3D1qxBgLkMEsh1VQ
	hC+6oVe27jzVHS9xt0uk9NfrnoQzEZeHHCEQ2+yRWK28HtzK4DpvqGuu1VLLs05zF7wSgWp91aD
	ZcMyP7wCKdJQE8izq0fsgzsjalVji1fh11vFIJjv6oPLjEduT9jYng70k=
X-Received: by 2002:a05:600c:1f88:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-48069c39a00mr29694175e9.13.1769527832532;
        Tue, 27 Jan 2026 07:30:32 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804db63817sm137117845e9.3.2026.01.27.07.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:30:32 -0800 (PST)
Date: Tue, 27 Jan 2026 19:30:27 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC codec
 driver
Message-ID: <aXjZoFi_fq3tzJFY@anton.local>
Mail-Followup-To: Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-5-6ef787dc6426@gmail.com>
 <88ef974b-9fa8-490e-ba19-1fb31ca94342@sirena.org.uk>
 <aXjRx12yPA7QflaF@anton.local>
 <153acfd6-cb4f-48ee-82e0-0a18a4a1e9c7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153acfd6-cb4f-48ee-82e0-0a18a4a1e9c7@sirena.org.uk>

On Tue, Jan 27, 2026 at 03:13:59PM +0400, Mark Brown wrote:
> On Tue, Jan 27, 2026 at 07:11:24PM +0400, Anton D. Stavinskii wrote:
> > On Tue, Jan 27, 2026 at 12:49:52PM +0400, Mark Brown wrote:
> 
> > > Nothing ever mutes the DAC so this is a bit redundant.  The mute should
> > > probably be a mute_stream() operation.
> 
> > I'm not sure here. DAC mute feature was not implemented because I don't know how
> > exactly do that. The public documentation is very weak for my taste. 
> > This call added here to be sure that override flag is
> > not set (override feature replaces the output by setting it to constant 
> > value and ignoring the input, so it is some kind of mute from my understanding. 
> > So ensuring this off is needed be sure that DAC will output our I2S data). 
> > What do you think will be better to do here? 
> > I'm sure that is needed, but may be better to move 
> > it to some early stages, like probe function. 
> 
> It's probably fine to leave the functional code as is but you should add
> some comments to the mute function explaining waht's going on here.

Sounds good. Will add comments and prepare v5. 
Thanks a lot!


> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

