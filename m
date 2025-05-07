Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BD115B102
	for <sophgo@lists.linux.dev>; Wed,  7 May 2025 12:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619330; cv=none; b=kS8kl8VHHt/KPTC6VlKS2CGOtXxoz6DlJlO1jNZ581Vi1XBXDRpgvgaMHg1Z/EP+vKNN/5PIA4Z40ERZDRELnJYItMQ3NWPs97gE/RYH3OQTJUlinPPx1LK0Pq045Q+A0VcmSSR3HFox4xxgEeKbrZnrzeLQDHcW5/g0PbIJyEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619330; c=relaxed/simple;
	bh=G+gGUFnonfHfqvLJtT3/rMFE4bMTKjw81qinxKZTkP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVJ5vi1PcGGDHoGyhfPdY82HFxn3wH9UzVKLCkdURp83bQm5l2j9fNWOKNqWjEPJ2TOyYNQT1MutScbrYsIa2TadyjemYeXW0Mt+Wcd6xeBNDBFjaFPQnmfL+7vF4hzRprfNsay13MdRE9X8IvP078gNiN8x/5NOZJTQjKNVJ8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQznUXOO; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQznUXOO"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ecf99dd567so90856246d6.0
        for <sophgo@lists.linux.dev>; Wed, 07 May 2025 05:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746619328; x=1747224128; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cB9Vli3Xxo4KwEG4QM0VC4PHMgHe2AYxc+yOmxy2QWQ=;
        b=QQznUXOOJaVFWC8vk9hvcWgOcWgDWufZjcjoi7doWng4/cyq/UXaTNoTuPeifml0bH
         5VZE0e9BqY/VbADMfOlkZ2KQzWttbDjMGLq3iwLKVJhsq5M/IyNfGhiSR/pJQsXCQFFa
         0x65uju1xEmjdTyxyeuBSzBiik76B3rFYn4kBrtX1BxdbfSjbPXBlspR0kjJ3kvhHT6C
         q4dZMBFODBvhOQ9lPMIybQwbPx2BbH+tROqKNW2CgMrgR+8GPJ5nHwYXH2msNDGHPrB/
         17J0YMBTOqHIJl25NchldV0F1LEvHKSy7Jqbk1pYoK9TNu2ZXV/oz42d0beIbiukQeTP
         cGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746619328; x=1747224128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cB9Vli3Xxo4KwEG4QM0VC4PHMgHe2AYxc+yOmxy2QWQ=;
        b=BqExZV9RQIQ2UKJw7+NYvOue4KdTH51+1KKcU1oyefvueMZK0gGDWW5OlXa1lKFajG
         Uo+fmXMIPdsRybjgiaYQXsqYvXSlphd9OxqsiOBIrxnbfbbt7ywLnJYg1tOvuya3ndzQ
         GL45lvz8fy1Bp1TijESfx+jU0y8LmxMdy6YxZ0TpyjDEdKzaelEgfe8Ea+W4N5xr2kkw
         QrnUG22laaVrzry7ZddKBCRu5Ul38JLdC1KECGHhoqsuvEiUoB9H8sTlRfsd0rXv/Cjk
         C7u+bEVgqJrmgaCkCbrtkyHA83Ifk9NJjOQFxFJFHYrl59Kpj1TRc7YnzrqvjKC8HvTW
         jWhw==
X-Forwarded-Encrypted: i=1; AJvYcCXrEEQ+SxJFep1YJ4W7fDEGyErJDcCRkA2R2VVZXeYL2TFJhCK9gpG/6c17eNZJMgD9M+EWwM0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1/DrbGR7f38ChARkCK6Sd4JcusN0bj+vpXcDwwfNx7UNKsHc3
	3dWiADROm0aI20FZc0gRfjeWeqgTnw6l0yErXvbfuLvvgs7QkMcaCQ9qwA==
X-Gm-Gg: ASbGncswbLHfHYIsKQ1UTQ+hE+hvzU3POl2vm2uBf2yDyxVR9CtaA5/xa9O5nEDf5Og
	s1fMPa+ki9Wg89/1/xoKUUHH2ZgNsY64lvOI1F6qArmq3IsttnbCUmGhqb2Pm8WDEatnuzseVQN
	fJDpf0tmU5jGVHiKjXjrO83nCpFiH92Vcwc30Et55LDxglYZoq3NSpdwF4g1RB5w1kEdDgSpuh0
	ahQu5RFPqGs6crEW1JdL8dKdNXr2IqfATKJRVmeSb9bR1mMCIsgKPo4kG8cQ5R+KycHALUboOkN
	04WpFNYQ9GHVufnK
X-Google-Smtp-Source: AGHT+IGRl9BUi1WrHprzmvGHRtZmly2KUBbHCnPcITRG9+w3NMHRJoWIA8I9LxLmf29VDGt76SQFqg==
X-Received: by 2002:ad4:5dc3:0:b0:6e8:ede1:237 with SMTP id 6a1803df08f44-6f542b31434mr45097126d6.43.1746619317492;
        Wed, 07 May 2025 05:01:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f542647e03sm13464756d6.29.2025.05.07.05.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:01:56 -0700 (PDT)
Date: Wed, 7 May 2025 20:01:29 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>, 
	Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Romain Gantois <romain.gantois@bootlin.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Lothar Rubusch <l.rubusch@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 0/4] riscv: sophgo: Add ethernet support for
 SG2042
Message-ID: <2tu2mvwsnqdezjei5h43ko24vfave4c3ek2fjoatwsg72p6lpz@3vbtpmm7l73z>
References: <20250506093256.1107770-1-inochiama@gmail.com>
 <c7a8185e-07b7-4a62-b39b-7d1e6eec64d6@lunn.ch>
 <fgao5qnim6o3gvixzl7lnftgsish6uajlia5okylxskn3nrexe@gyvgrp72jvj6>
 <ffa044e2-ee9e-4a34-af6a-2e45294144f7@lunn.ch>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffa044e2-ee9e-4a34-af6a-2e45294144f7@lunn.ch>

On Wed, May 07, 2025 at 02:10:48AM +0200, Andrew Lunn wrote:
> On Wed, May 07, 2025 at 06:24:29AM +0800, Inochi Amaoto wrote:
> > On Tue, May 06, 2025 at 02:03:18PM +0200, Andrew Lunn wrote:
> > > On Tue, May 06, 2025 at 05:32:50PM +0800, Inochi Amaoto wrote:
> > > > The ethernet controller of SG2042 is Synopsys DesignWare IP with
> > > > tx clock. Add device id for it.
> > > > 
> > > > This patch can only be tested on a SG2042 x4 evb board, as pioneer
> > > > does not expose this device.
> > > 
> > > Do you have a patch for this EVB board? Ideally there should be a user
> > > added at the same time as support for a device.
> > > 
> > > 	Andrew
> > 
> > Yes, I have one for this device. And Han Gao told me that he will send
> > the board patch for the evb board. So I only send the driver.
> > And the fragment for the evb board is likes below, I think it is kind
> > of trivial:
> > 
> > &gmac0 {
> > 	phy-handle = <&phy0>;
> > 	phy-mode = "rgmii-txid";
> 
> And this is why i ask, because this is broken. For more information,
> please see:
> 
> https://patchwork.kernel.org/project/netdevbpf/patch/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/
> 
> 	Andrew

You are right, the right phy-mode is "rgmii-id", the delay is not
added by the PCB. It seems to be better to ask for the vendor about
the hardware design before copying params for vendor dts. Anyway,
thanks for reviewing this.

Regards,
Inochi

