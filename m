Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2346C32824D
	for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 18:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540271; cv=none; b=O2FeV8yQ+HYxrH2KqeRM6+6phg24OX6UrY2Ta/PgcYFPZm+c+oH+ovayylFszoyje1yCVAskoAda6egVWe3W7SXx7VfbDfKHc/tKj3o5Su/dZ4KyfFLA5g4zcnVCRggx17nUkeRA4RBtqBiEx1APfe9w3v+FhIyPiCWCUUTEGeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540271; c=relaxed/simple;
	bh=uYbromIJd1qoItwR5l+155XDps2hGe/0NlPufen/DR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkI40BWjwxyEoFO70BvJGqlZjajQe2q6eVkjCh0O5A5Fz58laqZckzxg/NqzcdCtp1/gy0aUUaopwKF0d8sv0UvP/KSuUiD2lGw00P9M6Se6X3us2TVnCE0nolL9U7AONTYCVn+Ufoez0itEx6/xbCQSeVZHhpTQma1zEa8hnjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7aRCpRE; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7aRCpRE"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-42fbc305882so3692966f8f.0
        for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 10:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540268; x=1770145068; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdwQ2scCPfsVRQpzQa7WUXDRNsFh0xJvA20rZizqUQI=;
        b=E7aRCpREWIgnc9ZmSCZfn1yyx0wPEeo/tnSoWXjeNudoyAG8pfrvy2PTZGDZBIUK8h
         VbLz3rBi7aSBg+EjxWVg1AZCwZyKLGRI8fVyRd3lpmaOcfbZY0KyPOFEbvSdH+9B1Z4N
         4hNryXN0kCDxIf861X4uzApVCvtH+wf+lfWCLTBjxP0o/r2MTZP/zJtiDjQq3O4pF9Z/
         RnL4NggPPX1g1+cFTlLw7uJiGLDn0w30Q9g1x9EfI/Y3embmGHIAtHW3mmnzxoIJ6arc
         olLM/V8JbXyG+cSrN9knOcnQk75zE64EsngXAt6PpTgNaPi9wQUX5axy/NXu9jMv9G37
         Y+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540268; x=1770145068;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TdwQ2scCPfsVRQpzQa7WUXDRNsFh0xJvA20rZizqUQI=;
        b=p8bew7bN7llbXGFgXdr1Dk/UmMcbv5GRIuLcaNksr3MkHqpazfutQrWEBhEUvwRnH4
         7QzM8e9SAjrWxnVqrVsHYSo2cnNgZVm77XfUoUXwr7lWwOWCJls04CDRLKH4pY1hbwmZ
         +eVtJK22taNTBmQ19uDROdlP0XuWiZ2u2zaZPdlsMeZRdmlnw4clnxwpDDnbsyI/UlFY
         3M41ODx4jTo0Bk8bTPQS53dsJEuzykfRAyCwsE1eitTqKBmsKhznvM5788JtRLzUsRhr
         Q2lqym+RDbPkkQch4ntT47Tu2C7V4x9HJdZSnLNdiFoqI0FtGwdUUgTyQ1CuXNWbfvkI
         ZVfw==
X-Forwarded-Encrypted: i=1; AJvYcCVihEiwYCB0VGmnHDYfQxA5TR1FoYp9tSS2F+WBWJu8Ce2OZDCyjPon4pQHFVVhVXReRGudhoY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx53zQcXiQGBP/+tsAZJyjJanoLvuaCHpWIhDKo8Y7tZ/Oe5pOM
	iRA/DDXA7M49R4VOKz73R7InhPbqYRPEM53DQk5xnmaRL8tY7/gcPtHe
X-Gm-Gg: AZuq6aLakz9EbE4yGIpWob6Krf96bzkbeN+lxMykPYDrl/mg95LU3MVlHKOqUCoGzpB
	VsSPYVM+5FFUy5wLB0ypvZCqShBCQ9LCpO99w0KRaEz2aOuFgspju/ieqcAFdbmu2UNpB/BRGmc
	/fUaVV1SJLFwf7fJsftIyJOGRRv5KdcdVW2JO8UfeVSnsmjVGgCAIjbjoj5Qry2gEgsQt15qgGs
	+a9QGLCYcF/VTA0VPtMgKPoDP4Ttvf+2a0G5F51qHkxIbD77wSq7ZWKHUNF6XV0do5P02xrYrhD
	d86uXUPNfA6F0k66mjIwUVFkvgAvqTTk5blqEHlvX7UH8kVukOtjN9zTjW7/91PDE1hC6JhYcrr
	GhAjw/WPi1ijWn9CiU/L+MO8wcS/v3R/XuV/zpwMJvKCaX23GokaXcfwd7/WQElObRg0bRpbBoO
	5AqzMmBg56p08IJCwp2Kwoz/Lqawtcj6j2jJb+rWUl+3a6z7uzp7r8+08=
X-Received: by 2002:a05:6000:2885:b0:432:86e1:bd34 with SMTP id ffacd0b85a97d-435dd1c0c54mr4243073f8f.39.1769540268233;
        Tue, 27 Jan 2026 10:57:48 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1353ac2sm785036f8f.38.2026.01.27.10.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:57:47 -0800 (PST)
Date: Tue, 27 Jan 2026 22:57:43 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] ASoC: sophgo: cv1800b: document DAC overwrite
 handling
Message-ID: <aXkKfZDyG1uxDsD0@anton.local>
Mail-Followup-To: Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
 <20260127-incremental-for-i2s-dvier-v1-1-431b809c632d@gmail.com>
 <6f1d8478-c2b6-4966-b339-47c4d55fe7c8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f1d8478-c2b6-4966-b339-47c4d55fe7c8@sirena.org.uk>

On Tue, Jan 27, 2026 at 06:49:14PM +0400, Mark Brown wrote:
> On Tue, Jan 27, 2026 at 10:48:07PM +0400, Anton D. Stavinskii wrote:
> > Add comments to cv1800b_dac_mute() and its caller to explain how the
> > overwrite mechanism works and why we force it off before playback.
> > ---
> >  sound/soc/sophgo/cv1800b-sound-dac.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> You've not provided a Signed-off-by for this so I can't do anything with
> it, please see Documentation/process/submitting-patches.rst for details
> on what this is and why it's important.

Sorry. I was relying on b4 prep --check. Looks like it was wrong. Should
I resend as v1? 
