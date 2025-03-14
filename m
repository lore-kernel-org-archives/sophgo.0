Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79E42E3383
	for <sophgo@lists.linux.dev>; Fri, 14 Mar 2025 00:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741913666; cv=none; b=orAxkP/J62FZYKgFk+t2nl8UzR4FzGiik3QFGZpcdDub8/CtNgZQ9iUQ0Z3a6FT5+Gc8Gypt4S5NqFt2tQJlbBzAwc9HLPsxOfnSCNOJF/KGcDBp439QQLX6G/dev4F9KGk+Qdqnlt3h3uKZTzxwqhxDwKr6K+DzFbdUM2JdJMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741913666; c=relaxed/simple;
	bh=lh6pHlP7Gdy+8Zq9852ntDG39AgnWyWeyktDzx6mXyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izJwfWiB8s2e7aHajnalS3wJRqEArN75u66talUj6SarCUKpnyAACbywEiabz90w7DNjM69IoetYreUOfy9A9IrFupai0Lkdw8tbifdMRXMB0vS6rRafIxe/8xk5oStf8MZKI/zWHhUd19oHYjxkW1w1rpSZDsHxhx/4ltXRWgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dT9yjXVs; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dT9yjXVs"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223594b3c6dso31409245ad.2
        for <sophgo@lists.linux.dev>; Thu, 13 Mar 2025 17:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741913664; x=1742518464; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UmlUQi/jXNfdANS2v7/yKDDCGx9y7VIZYSFeIy2bFvk=;
        b=dT9yjXVsa0OGh/+0WrMg99Y2Y+a86KE46rx7sRWUVpVh89fdaMt+fiuzkdVby4O3WF
         +YBi+08c+UtmJeLOa5M9+y/WHDUk7JvhIZp44tIlFNukc+2S+BEU5VMy81NgEKnTkzYZ
         OBpt2epnVa873IKrYgoyi8jhejZFOZd94BCFeN8f3sCMbbpuk/YOyfXF97wwo88l4RJd
         1wE/t0bd9yYubM5bpelLuaF3i+peCX6mxwhfq+StQ13zQm6aYSxgB5qU/OyB72WRaVLE
         r+GwWZPpH1uECUXFnUksENwEM4NAmv5NUluTqHI50sNHMH2bNoWeUEyu2qnhgyL0fQkV
         lX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741913664; x=1742518464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmlUQi/jXNfdANS2v7/yKDDCGx9y7VIZYSFeIy2bFvk=;
        b=LgJI8PBkEsS6SEpBwGDQ5yjVvpLtxQ13kC85BNNySIFIWkpgV0GDWetMgHKJ0h/d1X
         70APKPX5UiK/JrTtWWB6BBc8ayD4K6Jxo4hxo69VxTvRMEizq2oG+iWLY+sHSDsSJnm/
         v011OPMcaRYAgLZDIf1ls4UEwunycjICAvt0SUzdwOROq+aRFU6FnXEvUF/djSKxgeyy
         U6UpHpV/sV0LlvUzYIJTL1LzBgsQFS//2N88BuUZn3Z4hte8iZKatKofAa0tb0fxhWPU
         3uCV/Juf5wapx0+zk+2Mw5Kz+7Ga453KGH1oAVbRg627z5SK1KEfDFYHU8vVSuWrf+fs
         wEfg==
X-Forwarded-Encrypted: i=1; AJvYcCUjwGyTBqfOypGm70XaJRlMpWVWo751gOgvFzSm8HeQ27TWPfwuTViRh9ILJeQBj5kcCApxacg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxodGm/edPxcDSCUsRNJrZB6Ub5NOuyN2Vb+JAeTsX2f3mcuI8P
	Lky3LirMYJHYGTnZb1XH/Yy+SNZSPOp/7udI4Y15OvNsCTFh+V2E
X-Gm-Gg: ASbGncsHDZuoWtQQi93BiQ4dIElpXrvvXHmAOSl9k0snfxHQLR11Rj2ljn7mn+B27g7
	9kulgLTL0erTeU7kf//5T89hBjGcf0bGxtOYpS0HLeRgwabECVCyxWMcKkf+n6QSEnDdj0FEaXg
	Saxe78qtphCDTTIbOR2RoHYQky688xmrydeRsPMzfc9Tt4H6nWXoC+WpytS/PdnfTxOvLzzdKpY
	5HNPrjtQ/uh1e2M1LV9/6yF2Of9aEgbNHZDn3lw9ssBNpLuGb5eY89JJe6HMBfouSkFZ1DBDbhM
	Qfq8nu5FwwwHNzOEFBt6B2fM3QI68uN8EUh0XMEYyg==
X-Google-Smtp-Source: AGHT+IH0Swi1/WNTSoqeJPbcXP7ZXkJSO8ITb6Auxw31i7YlapXfDM5K9EjPsYO0yRUETWHGvbC6qQ==
X-Received: by 2002:a17:902:ebc8:b0:224:c46:d14b with SMTP id d9443c01a7336-225e0b2f418mr7120275ad.52.1741913663119;
        Thu, 13 Mar 2025 17:54:23 -0700 (PDT)
Received: from localhost ([2a0f:7803:fac4:6bd5::1])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-225c6bd4de5sm19856935ad.230.2025.03.13.17.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 17:54:22 -0700 (PDT)
Date: Fri, 14 Mar 2025 08:54:20 +0800
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Inochi Amaoto <inochiama@outlook.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com, dlan@gentoo.org
Subject: Re: [PATCH v3 0/2] (no cover subject)
Message-ID: <x4mmgsllwusayvrtoq2yhgkpo5wk2hqb3xex3dzqve2xwggouk@6se57braliw4>
References: <20250313-sfg-spi-v3-0-e686427314b2@gmail.com>
 <PN0PR01MB10393B82EB1038F184FD18894FED22@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN0PR01MB10393B82EB1038F184FD18894FED22@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>

On 25/03/14 08:11AM, Chen Wang wrote:
> Hi, Zixian,
> 
> First, it looks like you forgot to write a subject line for your email.
> 
> On 2025/3/13 21:11, Zixian Zeng wrote:
> > This is tested on milkv-pioneer board. Using driver/spi/spidev.c
> > for creating /dev/spidevX.Y and tools/spi/spidev_test for testing
> > functionality.
> Second, why is there no description of what was changed in the patch set?
> Maybe it was missed.
> 
I was intended to avoid duplication with commit msg, but it seems unnecessary.
I will try to write a better cover letter next time. Thanks for your review.
> Introduction to testing can be used as supplementary information, but it
> should not be the main body of this email.
> 
> > Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> > ---
> > Changes in v3:
> > - disable the spi status on sg2042-milkv-pioneer board
> Not "disable", should be "Remove", and please capitalize the first letter of
> the sentences.
> > - create dt-binding of compatible property
> > - replace the general compatible property with SoC-specific in dts
> Another relatively important change is about the clock, which you seem to
> have missed.
My mistake, I will add it in the next version.
> > - Link to v2: https://lore.kernel.org/r/20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com
> > 
> > Changes in v2:
> > - rebase v1 to sophgo/master(github.com/sophgo/linux.git).
> > - order properties in device node.
> > - remove unevaluated properties `clock-frequency`.
> > - set default status to disable.
> > - Link to v1: https://lore.kernel.org/r/20250228-sfg-spi-v1-1-b989aed94911@gmail.com
> > 
> > ---
> > Zixian Zeng (2):
> >        spi: dt-bindings: snps,dw-apb-ssi: Add compatible for SOPHGO SG2042 SoC
> >        riscv: sophgo: dts: Add spi controller for SG2042
> > 
> >   .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml   |  4 ++++
> >   arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 26 ++++++++++++++++++++++
> >   2 files changed, 30 insertions(+)
> > ---
> > base-commit: aa5ee7180ec41bb77c3e327e95d119f2294babea
> > change-id: 20250228-sfg-spi-e3f2aeca09ab
> > 
> > Best regards,
> 
> BTW, I suggest you wait until 6.15-rc1 comes out before submitting the next
> version, because I have already sent a PR to Arnd for Sophgo DTS.
> 
Sure, I will keep an eye on the release.
> Regards,
> 
> Chen
> 
Best regards,
Zixian Zeng
