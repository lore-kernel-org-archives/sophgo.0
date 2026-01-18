Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A842D8387
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 12:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768739900; cv=none; b=VAxhmc4auyDhbZc566ih3c4CtWO1W4tF2ZDnEDz/FzkRkR8kMP54tT/E9wsGE27aAmLCrL83MD+7+ek9DR5RN8t/rWtAKfm/vZdmbWlgcK5F/L3Nw/hevYIOGAHAWHSc1NdgS6YtW7NhH7qkSyQ2tbcQnWPfm7u52z0wbNInp+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768739900; c=relaxed/simple;
	bh=0hVyA2PCi5FEsxNH21GdDW7QN4jM9ZNzdMJ6AOp9Qh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X18sTi0VNnmAX3YV7iCWVcN/l/BPCficnyDEv6SZW/8LyhPDUoRnbxmMsuot78Fz6kJwVKEVHG01vvnKLTpnSWsP21mrKxoEtS0iomav+6JSU0tdHH2EA4BPmxoMyC4F0IoPkuUkf3VjVUkaE+ZHzEzA4luB96uzkBglxomV2gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+MEb/Iu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+MEb/Iu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso30485375e9.0
        for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 04:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768739897; x=1769344697; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Suqn9RTje01PunnIGGFhUEA52WhKnlG0PrdrAwNU83A=;
        b=G+MEb/IuyGgoqfuwq15yxPigT1EXRTsocgt7MAIGBI+PtTsJMUY8wAX8mFYZ15f8vp
         9AbRSJcSUeuWD5AIk/Q4RTGTlt0ff8rPyxHDp3jnTbUFftDX+5pZINWlHKXTutcf4I/V
         DkZXJ7w/cpBD0xDlZmTAldzS7UIyi+yT+QakuVrmFBuU1GzbQP+1UTFuFvqG7di8Yx+x
         SMeR7TZt/6TcK2XPeeZTH5OHhWMSBwKksCHouKPkYFe7/FFLurp27QZTot6CXnIwSOFp
         vPN7gkuaWEOl2+GqUvNz3SuMdfWZ7wbttMzoR6nniIU3iSo3xBPGLm87lErhJS7jifzh
         Q/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768739897; x=1769344697;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Suqn9RTje01PunnIGGFhUEA52WhKnlG0PrdrAwNU83A=;
        b=KcnYN/FCooiqS+a4x+VICu6DniiL5qSDzwZeiP3xKeW4hP/pWED/zWD3zGeYsE8cxi
         Q4RByi15lK2k9+SjJmTC4SkfTIiX02nTyr8DsoACcTmwGYZHmsy3s+LtM7LQeHH5DBb8
         0cmRdGBjuHMX7roBOyOi8LnbZNZrtVvCKXtNxsngHp/1UJjGzQzMj6BVvSvOfO9IPg/X
         HeNkZvKZt09vj45CdvxjUs/TjyBkVqIUEn+ZkQr0DKC2jhR1PQ9ly4XcOZAS4VBhKBK2
         DrT6+vrmwYShEOvRAIgjxsMCGwfJxa6tpxkq79fxywRMF8kQ43O5r+Dz3bb3o+duVaKN
         2g+g==
X-Forwarded-Encrypted: i=1; AJvYcCUjbhLGdhxMRk8BSUhTeTAOVM/4XrxElxiU73ZReDmQzGvWYsh/KP2zbBcuDW8GsENakjQ0O4Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJgWTJJ6mwFxDMJjA4IfmVbyqMAuEa6GbaIxP9tJnKKkA1k99q
	pGABeNdj8wspbCl6ZHB1Vzc5LK7IFi2g/i2u4/WOBlEF1xHExRjVHSub
X-Gm-Gg: AY/fxX7J30CWwFUMC8N9iP3zZlQYNFXMMih8Q8PjkRQjbaInNsj3BEc2ghz1GTHyxHm
	exBLlCC7ZMMRW2zBTpNq91+MiU/CiZhyl5Ub7QE067yIDqCFbwvaH+HFRW5qn6QZ1KDeqbw+Prj
	N2yBSi96lpVmrfyKYU49wJCk7FHWQG7eShoQmtVcFEPAvUc74GI7c7odNxLwW9lY/UokYm2CscQ
	MOwDNuoT1Bkj1yjRBrthsf9SruTyMMymqEUkCPMxjaxwWEBAktT2IIHaEEXxQiBgRE9sSqMl7Iw
	1D/574kg0GtKhiWQSglFZGwxjVlUo3+tqcAaci2OPbiRI9gb3JSEXOXAibG/txaWvL+/E25z7yW
	yQEnCLBaOXrMVM9kteXoOtgjBEZ/4+BDyfoOUHXDN6IzCXbWJ7wLk/2jivH9L3ogaeGQwl9I9TM
	1V21pCkG6GY3FEB2hNpLuO/Oa28RC0A624y4HJzzlrgmm/lMzCRaalhQ==
X-Received: by 2002:a05:600c:3107:b0:480:1a3a:5ce6 with SMTP id 5b1f17b1804b1-4801eabf6b4mr95429315e9.14.1768739896538;
        Sun, 18 Jan 2026 04:38:16 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8caceesm138596495e9.13.2026.01.18.04.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:38:15 -0800 (PST)
Date: Sun, 18 Jan 2026 16:38:09 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/7] dt-bindings: sound: sophgo: add CV1800B internal
 DAC codec
Message-ID: <aWzS4y82qkzJ-xkI@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-5-d10055f68368@gmail.com>
 <20260118-magnificent-horse-of-warranty-e5fdac@quoll>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118-magnificent-horse-of-warranty-e5fdac@quoll>

On Sun, Jan 18, 2026 at 11:16:15AM +0400, Krzysztof Kozlowski wrote:
> On Sun, Jan 18, 2026 at 12:18:57AM +0400, Anton D. Stavinskii wrote:
> > Document the internal DAC audio codec integrated in the Sophgo
> > CV1800B SoC.
> 
> Squash the binding into previous binding.
> 
> > The codec doesn't have any special configuration at the moment.
> 
> At the moment? Hardware is done. It does not evolve.
Will reprhase, thanks. 
For sure hardware is done, but I'm afraid I could miss some
functionality because I have access only to public documentation and it
is not full enough. For example there is some kind of amplification
limiter register field but there is no information for now how it should
be used. 
> 
> Write complete bindings, see writing-bindings document.
> 
> Best regards,
> Krzysztof
> 
