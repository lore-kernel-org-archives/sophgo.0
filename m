Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77416190696
	for <sophgo@lists.linux.dev>; Fri,  7 Mar 2025 01:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741309960; cv=none; b=RMojOITkmuMLIkiMVyrLZDDSD0lHg6gD2U47jhMBMQxjH1qctZcwxfYyXYXsiwJ30bxxC2rajP+rWDJ4/nvZ5Z3XqkC4jHf4t+me9MHFHXc61ymBa+9bD7jUgq8o3wT5+9zUAsGLnVAunBniTbYrtP/3WhvgFUN0iwlbQaM/NqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741309960; c=relaxed/simple;
	bh=BrW1aIZtHKo41y17LJzfr4co8/xIvNXDluaIYdF+m9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9KV7oiCohgKUtHU3BQwskO4kCNCSosEWSwRou9ozA7PX3LKeVdJs5K4lAYKhARRckESGRknTMwBOzR9HuPCjojp4xpQlZ95S8WIk2N6bA2Kb75yRMMi8BVHGn+fOGjHf/Vy5/wrXp+dqa+/YA1c/ZavrE0p5DtpXJyPduV5EA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtAJgI82; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtAJgI82"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c3b63dfebfso143237685a.3
        for <sophgo@lists.linux.dev>; Thu, 06 Mar 2025 17:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741309957; x=1741914757; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RoTiwV/penO5v76PscVulf4a30dmwygkJIwyLi0333I=;
        b=XtAJgI82DL39Z6kLXr4F4fQs2ThqXDF73yuWNNG/9DW7b7m+ULF4iNwFWlwEF5gnPb
         qFft+z5RUhCDp2xx91++c4K/OQnR8C6jyXPgpTfepdpKZrugpd4XZ09wlluBHvI5kDgf
         rxZRtoUwNwoUauEQ3T0zcpj28ZnshRyJxVDscbc7EM+Az44Qwc+Q9+fy+BBUjKu+j9fk
         iZ799S/TmgWuuYCXfm5S8vrL2syuCdP/W6yDPm8d9uhSjVkT5uv3JT4zZlkHf6hxxgVk
         rVa/azlPNPRxhKoL9Csx/PqaNBPutGoNsFrHTfPATbUggWVFU1gGm1bTKrQ6PZOYToRk
         Jxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741309957; x=1741914757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoTiwV/penO5v76PscVulf4a30dmwygkJIwyLi0333I=;
        b=fWWFGSVtMO5n/U3vmHveiqoj1yu3GmhBxPt+N1WOzyt06KA6WafA+SgOh4FpwXqrBx
         7DOr8IZHSJIFoACRMSm+LuZHo7HThl7iQSvsCvz+A4MqFf1oGYqfKGHZjdyHmPh1D7MH
         h17gsjsJDQOpx9ctwWneOICK4oh5LZH/LNrDMmI72/SzQXxacTYC2V0BK4ioefmnAo14
         erzKQku17oc1tfTNeYK0OgNkLeH0dZ/wA7vdeWZSlMfyCDxpD7Evn8Dq1vC9F9YkPJiD
         sn4diaDEnveKvBo5em/wphZYbOXe5f4dBzjSZfSvmWExly2vzJg04JPHA4mdIK7zuQ5E
         w4Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWwRboXShacQiZ7uIFGm5noiqcTumwmd7lZAx+ky31XdjiPUnTbCpK04MnwE/AOLoNsyVIU9YE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTGZ+ExxnWPSA0+8Z34tMsYvCpR7Nd/cZd+sNqYLLC2NX3PHz2
	mNyJFe89UYZKcVPq9P6KlSnz3AQLnnhVY56fGKPDLasdFzULe4E1
X-Gm-Gg: ASbGncvdeV/3qOx7WvXSFjliubpcMHwfan3o6A+f3QwkBDXBix8+gKCuaJe8Ie23/13
	dt5j7xWdOfSV6FKxae1J3PAO61OaZ1OtNKZrqwQn1TmLmrpihkRyTa32eYyUXnl/FxMghV+fzEU
	LRAzjkrKexYK/M/1Zhoul3lux1UWfKEJJSWKZ5vbQJ0pIAhtsYI7lA3256kzyMOzI9/rVdV9icd
	8B2YWZJZ2yH0Nyd9JjYiTbpQhXCsZKEK6UYrzzM80s87kWZFZzajm2k5S6nVxe6is96tF0MQ6rB
	jRHIWNXxkrmvlTpTB3KZ
X-Google-Smtp-Source: AGHT+IFUBVq3F43PYm5XLqPTMM7AQh1lBI2X72APqLeXMYlSNYjEqY6EGkejol6T0++oyIAOjKb56g==
X-Received: by 2002:a05:620a:6607:b0:7c0:ae2e:630d with SMTP id af79cd13be357-7c4e168299dmr213772785a.16.1741309957325;
        Thu, 06 Mar 2025 17:12:37 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3e54ffa6bsm163770985a.80.2025.03.06.17.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 17:12:35 -0800 (PST)
Date: Fri, 7 Mar 2025 09:12:33 +0800
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
Message-ID: <ptq4ujomkffgpizhikejfjjbjcg44vyzw4pwbs7kureqqndy6e@alxgdc3qkm7q>
References: <20250305063920.803601-1-inochiama@gmail.com>
 <20250306165931.7ffefe3a@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306165931.7ffefe3a@kernel.org>

On Thu, Mar 06, 2025 at 04:59:31PM -0800, Jakub Kicinski wrote:
> On Wed,  5 Mar 2025 14:39:12 +0800 Inochi Amaoto wrote:
> > The ethernet controller of SG2044 is Synopsys DesignWare IP with
> > custom clock. Add glue layer for it.
> 
> Looks like we have a conflict on the binding, could you rebase
> against latest net-next/main and repost?
> -- 
> pw-bot: cr

Yeah, I see a auto merge when cherry-pick here. I will send a
new version for it.

Regards,
Inochi
