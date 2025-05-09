Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807E0290083
	for <sophgo@lists.linux.dev>; Fri,  9 May 2025 12:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792928; cv=none; b=U0KBpQaeUhLJ45VGYvlE5qj3EKLCrFCiZk0G+ts3kl6MxxVCq2r6Uqd+DT0E8bhr5J8nGXH9Ge1NJlMJtxYh4wgsySIN1qtO6go9dc2akOmBThgLtpsOhqRZ0RK7OQw76xHmvxa/tOH3TZurN74pslEy4VnUW+7+8hr0P2yGQdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792928; c=relaxed/simple;
	bh=jdDwlEDN05U0AGWNi15ITRXxy0SmyKbmQQzX7OkEV4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRyIHW6ry8CMsL6yFVmNlg4p1hIdvsF/ipnwd9+j+9idiICr21UidcyiR9xF8wgpn0918TNSpJv/9UMcIrDIu43FCT1iCyXjIa5bxckEs/ROyU60i/zD7RjJ6lSTG7YE2tAvnPhnN4TbkY7mIEdmYw/W8aH9fNVM/G7XLRjaRgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLlk8FMM; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLlk8FMM"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f5499c21bbso40056966d6.3
        for <sophgo@lists.linux.dev>; Fri, 09 May 2025 05:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746792925; x=1747397725; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PgRuZAJGVmPbGddsW8s6rmMSC40r4mQ4B4GOLIObhOw=;
        b=TLlk8FMMD5wHJfzqEudtKAp7VqUnvcH0MZgcEtIe6y1WNS3N+n8tJsKUvzjuq9c9DJ
         kgQ8+4oezMO6GGBY8gRqiG5heb3PJdG5k4j41R8E5w9fDtDS7r71YHnpwYIuwXKNzx6a
         Hc5p0+TXnrMjJeCP31tUl9qYdDFptFUbvMv97AhRLXg1UoAVayref4t5pXt6wMJD/H89
         kHhd++ZaIvG/pJ56cGX06W/25Y6d7fywSq+90V8HO5IeGrtYlODLDd4Qwe8QA/VdIGVr
         uqP7zEn6s4bW3qkUx8Lu5arTQPJNgtif5GNs1LNRUamiz9snkR4frliFXg0USMpo6exT
         GbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746792925; x=1747397725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgRuZAJGVmPbGddsW8s6rmMSC40r4mQ4B4GOLIObhOw=;
        b=hx6iCdu1fMXf8Dfoxr97dil7u6Wpm8owVqBjxQ1HQErYRprZJRYgU9jzfuiIPZJhP8
         NxQK7Fri+ujng1WNUp5A502KTdhyDSj0oHeWswPORcZb8R5qD+do9vFpm5I3oQiOfR0K
         vp+XfnXCyN+/WcXHWkLE8eJrOAXD00oCrK7LglfF4oMz71iFhepeSXDGappQ5FC3jFwr
         y4QBSf4g22l0axmhus0b+Hh3MOHuTruw6UegUY5B37pWe78qq8Utyjs+CaK1kjhk4rfL
         8LvZcyzemInu2K6o0Sv2yP8umEHBe6lgGdaeinCqRVINTfuaTZObU1Zega9EHOuA1mhA
         VwgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIM5TDMdbgGb+bIpx6VQFUuQAGzsXbbHfP4Dc7vLmACMLEef97tNvXAiQ6mY/Dr8yzTjCrkgg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ7AG9EidPlvjXomVu0zxyHuIZ46cr8+i8E5pOzrK2wjQZR4Br
	SsA4FDzxCOOWA1vR2WMY/Jw6nnsXbME3QJYTrltLKkfCEIXIBt9L
X-Gm-Gg: ASbGncvQiXlLZfg2ZxxTTjHjP/+RQwOqjKhl40TiR8v4qUtLBwImkYc10XF0iRCAITB
	xNmbOLYFnz+CSKK2eczKmdacZMcyZLnGTpg4ufyOJQ7vFzZ/2O0Uuj/5VWjTIUojEGLMfXdkY4f
	+Ih0E3tfxh3zBg4lYOi+WecyFdD42b4uVQQCyKqUwk+QSHOPKv6rTZQR/ZIgyf7gZGcOcKTEUNf
	5e5SxhTDVFIjuBdq7sPbfDWhJHBziCDJX+/yNz/rUs0gcQxuGO2AkXyL1wXjmp34vIloTdB9428
	oRAp6Ee+DNhckO0V
X-Google-Smtp-Source: AGHT+IGlDl+KwhD+opMZqZ8CkvISLydM7AoDmJhojnTg5u8fwNB+nRJ38uGYL7LaCFZ4Cmf7wUWC6w==
X-Received: by 2002:ad4:5aa5:0:b0:6e8:ff2a:a658 with SMTP id 6a1803df08f44-6f6e47cafc3mr44984176d6.5.1746792925233;
        Fri, 09 May 2025 05:15:25 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f6e3a472b3sm12728456d6.77.2025.05.09.05.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 05:15:24 -0700 (PDT)
Date: Fri, 9 May 2025 20:14:57 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v8 0/2] riscv: pwm: sophgo: add pwm support for CV1800
Message-ID: <sfqdke7xkxg3sr2acber6kjzbcnoay6bnu3enda2xe5wzdi6id@eqiqmkdeovlb>
References: <20250509-pwm_sophgo-v8-0-cfaebeb8ee17@bootlin.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-pwm_sophgo-v8-0-cfaebeb8ee17@bootlin.com>

On Fri, May 09, 2025 at 11:45:42AM +0200, Thomas Bonnefille wrote:
> The Sophgo CV1800 chip provides a set of four independent
> PWM channel outputs.
> This series adds PWM controller support for Sophgo cv1800.
> 
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> [Thomas since v8]
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---

As now we have pwm support for SG2042, I suggest sharing driver code and
binding file with SG2042.

Regards,
Inochi
