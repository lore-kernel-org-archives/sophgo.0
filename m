Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66E010F9
	for <sophgo@lists.linux.dev>; Thu, 24 Apr 2025 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478587; cv=none; b=TNN/rpKaMkA7y8625xNs9ZHlchjxbiC5TXKRr1mMnj7PSMHRUX/KwQTiBnqWbIM0NJueawEQiu65fhy3E1Je2U4HubqgOmBZZBOhEJTpbg4Qea401pVjkFKeh59d5nRiq73E2g69C0eW2M/gemu5JQiPH/wPgNRJ0bYMgwggimY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478587; c=relaxed/simple;
	bh=UuEiPUkTylj/qy2WlmonUTfYQxAcxdMagrpv3K72TtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AltRmtmsGfhDtH5GyUZRY0/sAZyUox5hfpQYtL5kKMM5A/sPq6zFY74keGY+wFcAEuh77ewXz6JhDnk46vbI//aEHZT7JKhGhrEmkaxe9W5XZEbP9T9TeBmHi4SbB+f3p5fdUKqqfXvW4HGeZQlFHJ0+QHKkPKSG0HJfe96kxwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgtnxvq8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgtnxvq8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22438c356c8so6921185ad.1
        for <sophgo@lists.linux.dev>; Thu, 24 Apr 2025 00:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745478585; x=1746083385; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3EUZgQOVtgxwPj0Cm4KzOqZ3U97D0/GKNyUNvaflq+g=;
        b=lgtnxvq808ShChm6N9y3KTUZrn7y5pAHjGEDWxS/AaZV/hKUKEO1+vP4+bs8OPyqA8
         q2XxvUEevFL/njiSz3H0PHzKE38BBQQmeDhQg7K2V1IrUyZaa0LhV4yMELp7ljlj9PRo
         D6YI0Qnj9a0C0VnnBNj6NRdswPl+xF4qCbm2nh5zPG7rTVvi6Lf4EL8n4CZ2J3atMLEH
         X1kLdqCgeisOLqDCzLZFHltTDCSP431FDdXknCHR3l5ErAdQjI1FkkErHS3kXljm342Q
         lOe4PTWNQxNe/MIoxP2Ih6y34ViV7qSH43Ok7gNyAbqJfnGyiekqMuncoDxi4jpQukF9
         UMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745478585; x=1746083385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EUZgQOVtgxwPj0Cm4KzOqZ3U97D0/GKNyUNvaflq+g=;
        b=nWx8dyaqgdyU/S++K0as6OAL6zjSRctaDDhQayQUeKFVN4PNmCvylTsBFknS3jyufM
         IVpTeJwfMZF4xdO4WVO+5SBXl/0gj8lE+5RDNjNWXt0NWPvrG/6BG1qb2d5cDN5qXJYL
         vfTvh84imEBlltCj2sjrrViRx3Jjw4uTAmtfwrurVi8kXpdwtBAizjCmVGtggTfFlSMH
         QFs2fCC+zKltUWCI+fDXGIsiojQc3zc2XqBD+6eqhl6+Blpx3WERxXT+3I6yWM+YB9JO
         e/2Dw7eOiYph7e1NRAHmShIWj9q3yh9aExE4qG7O33SeLBA02MOgiyFJ+gT5S1VCNmQy
         eSDg==
X-Forwarded-Encrypted: i=1; AJvYcCWOJa0rXKnHgP5fDDrY2A25xiidF72+DWn4tN/C45itJ6IdxXiv65kBstS07r+5YKhh9MB2eh8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJGcI/gh14ruohtdkQ96SwVVwbqvR+Ip2Q/dkOvwfsMCSR4UCz
	bC0disep1PDMEWV0gy9dFeembX0s5+TFed6ZgoDWm6huB67LuWxr
X-Gm-Gg: ASbGncuk+HqWxKftSnaXvxcA1CHwKiRQL3gAL5p9y6tSZZZqBtgQr6bsox1gGRBMY+e
	uM8mQqt/hcLHt8ce66X5P0WjBopM+HW+JzscOlhJIQg8G+U3GX1QHCdBIzMqB6H/0ZXhqKvOaBZ
	8Ir5jhnksw8xqEWGF1C8VdYGM+FplJkzG3EsgFBSQk0lQf1tklbtETqI6dVuAtwSBkKg3RWqIJ2
	NzY2OljjmXAfW4+PSfC1Oj+lFpmB3zNLec0g9LUHd4/0cQb3AVQTio290oXANb5pyRd0G5qPM8w
	NnZAbqDcXFVmpFC4rgmpvj6lNerfeM+qpayzddKJuQ==
X-Google-Smtp-Source: AGHT+IE9LsCk9tmFZI/PC5UZGmINwk24jJUeXSF+9kMM7rkzh8Y23OYpJUYh4V8Tdm5IfIlvZOU+AA==
X-Received: by 2002:a17:903:1b23:b0:224:826:279e with SMTP id d9443c01a7336-22db3ddbea1mr20093095ad.50.1745478584913;
        Thu, 24 Apr 2025 00:09:44 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22db50e7cf2sm6038875ad.154.2025.04.24.00.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:09:44 -0700 (PDT)
Date: Thu, 24 Apr 2025 15:09:42 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pwm: sophgo: add pwm controller for
 SG2044
Message-ID: <ikq5pa74pk5e26m2vinye4wanauyzwqlxrgyx7hwr27k5dk6dt@ibv3o476jrpm>
References: <20250424012335.6246-1-looong.bin@gmail.com>
 <20250424012335.6246-2-looong.bin@gmail.com>
 <20250424-bright-vague-finch-57fc38@kuoka>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-bright-vague-finch-57fc38@kuoka>

On Thu, Apr 24, 2025 at 08:47:38AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Apr 24, 2025 at 09:23:26AM GMT, Longbin Li wrote:
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

I will pay more attention to that, thanks!

Best regards,
Longbin Li
