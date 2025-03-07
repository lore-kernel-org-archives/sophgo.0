Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1692C9D
	for <sophgo@lists.linux.dev>; Fri,  7 Mar 2025 01:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741310407; cv=none; b=WClFwmrfrGkzG6PovvQhUl0VWalnjl1AnBWPx7UxMpNrZs/IkqFrr6X7enPShmzWk/nZewy1Y/7vFg/JTA104YChL6fJ95HZPf57a0eNZUs+GZSpDPJrsPAjmR4ranxAN/qoMy1oov5TGY4NVa+eWawfC1G/5dXd899L3xclzD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741310407; c=relaxed/simple;
	bh=8GcQhSv2jnHrui9KgDgnUkx3PYLViq3+B67GwCjUl50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3EUxd0wnUsDKpAckBsPXticFfc1A7sFbVzZvXQTKjXb418Z7FhonfBXKxdU+/9+Qx+soXNa+KL+MtrU7bQZkcmQW9Wirp05ZkZphguh6dWfUqHubZ3Rvwi5avRqseQoA+4zJ3DlRrkTr+SBc3Nxr9A9i4D9dyp8kmxzkuWL0yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCdIhDBL; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCdIhDBL"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c0a159ded2so146827485a.0
        for <sophgo@lists.linux.dev>; Thu, 06 Mar 2025 17:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741310404; x=1741915204; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HxS+VSdF+25Ta0OPbr+oK1VDaaV8dgOLYKtTqCm4wmA=;
        b=VCdIhDBL6V/YgEJscF+SRagAqy0ijKgS7Mf1sZ9oxjUk3MmM8v9i7VjQ06Y4UKJ6IT
         Gbo9sEtV0eo5+vK5Ifx4fFFgmwZljhhimcUUZ9pUF1sLG+ZYgbpLUdesBOJ8nyxeC+Kq
         1vo3z2h35Q2KlHyvNJeddCjCOWc0bRY7+z+CF+0uqBmAMxlkCPJjAbORaiXFygZSgzMs
         Yd5ifcfbkGvoNqZTERKmgHLqsLtTCkMEsEhcurTdup1BSWNhgYzvkNOiCBNr0hwUOPxX
         B1iu81BAPnFAUx8dbHlKgtAitqCUuBAJRYKAurQpPbLoE+MXIfgJSfGSh+ltifRYVbsv
         3Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741310404; x=1741915204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxS+VSdF+25Ta0OPbr+oK1VDaaV8dgOLYKtTqCm4wmA=;
        b=nIPmgAClPyxkjbQG0gjbXP/oBoG1FyT7uiccxI85njejba+wxkR9+vy0pxHu98gD/O
         pa1EtBnzEDzGU+eUkVtNrV3jH6P8wqNe1ig0+Y8Z74KbApJMDyNq7y8QZ/mx4jRy7lSK
         7wpcXrqw5ZMFm2KRshRSgxAwXh6R08A3zxCjjdUWcMjBf4iCVVXK4ugaI5u0TkcqtSEZ
         pXenPfH1f+pnNN25HmJCwyFa1enFXEpxv6t9gbS8OSO3FBFQqbV7yYQG2zODQkZ7WZwn
         gCSgRLpPKUY2fD3rMtK2shDlltCTtvErJ8zeVcz/YYuGNNkfy7yzdS2lEBpHPZ0vU2WZ
         QUTg==
X-Forwarded-Encrypted: i=1; AJvYcCUvcTrqMDGMYpTnk0ApdwLLsnK/F+0LNEfjX6KS0mj4dOvkV/z2vRqaqKd8iYGlmOfEXtzRjxY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3DHkELYkdGDvYlZfmivIncxaf9TQqT5TbuDCYBoNxK+gFg6SH
	XP32DpHFcvymoMK+NZNOoawpMubZDY9RKuH6PHvOvKKWYs5yTRl9
X-Gm-Gg: ASbGncvg78Wi56VqOpwnz72Rk1roc0HkPlc82zUki0dIHs/9EXlRyqCKoPwOwT80J2q
	WAMj0BGE0GZtbvEfKJi49yZdMaNQseIwPOOXh1auU4YaUl6JNRA+ZL1/N9a6MPsV6uPTejZAijI
	qdw4LQSOVK0I0xSYeyNznfXw8kqVJjmchYVG6H33bpuNbLyz85mvfcZAAGhVFeiZEtvl3JnoxXr
	pmExQYrWt8u0Fj/ZJVW1v/FEYBYwpIT4uHShO2PN2Z4viEBRIqwSL4XQ7GrUQFRsh2kt4nA1BY7
	2/G7aLxZa+hAP9/pZysk
X-Google-Smtp-Source: AGHT+IGUO6/phCwAva8wDxFUHQEGREx4oP4CpMn1qmy+ZBLZmOEMjsqOLMniC66oleMf4LpqVxo2lw==
X-Received: by 2002:a05:620a:838c:b0:7c0:a0ba:2029 with SMTP id af79cd13be357-7c4e6178ce4mr254618085a.40.1741310404496;
        Thu, 06 Mar 2025 17:20:04 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3e551181dsm164602585a.110.2025.03.06.17.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 17:20:04 -0800 (PST)
Date: Fri, 7 Mar 2025 09:20:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Romain Gantois <romain.gantois@bootlin.com>, 
	Hariprasad Kelam <hkelam@marvell.com>, Jisheng Zhang <jszhang@kernel.org>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
	Simon Horman <horms@kernel.org>, Furong Xu <0x1207@gmail.com>, 
	Lothar Rubusch <l.rubusch@gmail.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v6 0/4] riscv: sophgo: Add ethernet support for
 SG2044
Message-ID: <w7p3jnevmwumcblrkbpot7wpvajgf6enwpl4db5rbme4322hej@mxm54kytlguy>
References: <20250305063920.803601-1-inochiama@gmail.com>
 <20250306165931.7ffefe3a@kernel.org>
 <ptq4ujomkffgpizhikejfjjbjcg44vyzw4pwbs7kureqqndy6e@alxgdc3qkm7q>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ptq4ujomkffgpizhikejfjjbjcg44vyzw4pwbs7kureqqndy6e@alxgdc3qkm7q>

On Fri, Mar 07, 2025 at 09:12:33AM +0800, Inochi Amaoto wrote:
> On Thu, Mar 06, 2025 at 04:59:31PM -0800, Jakub Kicinski wrote:
> > On Wed,  5 Mar 2025 14:39:12 +0800 Inochi Amaoto wrote:
> > > The ethernet controller of SG2044 is Synopsys DesignWare IP with
> > > custom clock. Add glue layer for it.
> > 
> > Looks like we have a conflict on the binding, could you rebase
> > against latest net-next/main and repost?
> > -- 
> > pw-bot: cr
> 
> Yeah, I see a auto merge when cherry-pick here. I will send a
> new version for it.
> 

Here is the new version:
https://lore.kernel.org/netdev/20250307011623.440792-1-inochiama@gmail.com/

Regards,
Inochi
