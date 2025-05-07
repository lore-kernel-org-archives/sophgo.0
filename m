Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C232281370
	for <sophgo@lists.linux.dev>; Wed,  7 May 2025 12:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746621946; cv=none; b=KTSaOW3hmw6si/qEcO9byKSv6ql/ncu7otvQLlOomj6C9iFC4rTN5z01dPfZ6Oe94u5die5r2emEYQqdIxlM0LuUWHX+VhukqiRQMhgZxlAcRPa6qi7RBAM+Kvvd2hhc0yjkIzRBcggTlG3HAcRFG/v7wlEQZLmLIoxZC5vosW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746621946; c=relaxed/simple;
	bh=9DxzN9AnLFsBNzZZdwpy9vlafkqwBrDUBdeLAzxHO7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZFP/UzWGQMluT/iQWlnVj/g+f/MrwW22bpkaQgmjcB/CawgtLczWpGuRtFwrbba+tSF0Rw8CCx15kayfa6rqiiSY9d3E3RNaIiDJWZ4FGhzvL8KMF9U1ue2Tx1loibmJ2RzpkXV3jeLvDPajddMoyvKxUpaILoJaEtoMmZZfQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGD444C+; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGD444C+"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7cadd46ea9aso728297785a.1
        for <sophgo@lists.linux.dev>; Wed, 07 May 2025 05:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746621944; x=1747226744; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M2zV074M+6nwcpFqf4vrNr7jLnOtispGdjqzYB/cGTY=;
        b=LGD444C+wKaogv9mIfGAe6Eg8YAHeeNdNXgpbUl8iEIzXhT+X2VGMgyXe5Ic4Chpgq
         yca0jBpd9F6ALhg+6Kb0p9wPrfwtbkhoJ28B98YY76nWbX0WPjVrBHGVq1/B/tl2v88Z
         e1OvugrTb83gwEInUx78w0ZFnHBvlCiSjMNSaHNDcZP+wI7DcSzbtRKGruXfGrwKCEUP
         De+9xTRDjWSjyAf4HSOePeXoYJRcMHlVmqOo+kF8ToDaYnrvJdbGbV0+1FDPH55UaCJJ
         X1S/sJPYcBOTbwIT84lRI+xXnzZMkLVpsUYOVeuwvOrmWf+ChHtllhIh1mrevjYF6LFf
         i1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746621944; x=1747226744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2zV074M+6nwcpFqf4vrNr7jLnOtispGdjqzYB/cGTY=;
        b=Ossp+MmbtlK5NKvsb7ARiFi4+moaM3j85uNHARRJoEQUIiRqYWKu0t66JeFdDsk8f3
         Nn+bYOyCAoD+vJV+J/cBr+q62hQ/05TXIbV0nC87kKLEKne863xGo+V8F3BaUy67M3el
         ALcNZCID/F6JzFkXTnbIjK3uiDI9zSTtvD5yIF8XnVMeMeVMvhzJjJBaxGcQ/wf3zEBy
         4r5VaLxTucgI1CwVcaoeUKCvxAeNLqbnPT4h5oo8lmvL8lWYKIdfwfH3Yjn/bJHsBb1B
         Xt5g6pmm5Hwy9MQl9c7Fm173/b8wxJOL1LFffWwfDwqh8ZNUlxyf0x0m8SI5TEUQMrkg
         eVcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFkpcmgTFK+xF9kwEAambmb0S2au2dswJBZIA1I2BgQFnXC9wb8HNFlsH3cgvLtp7TednNh7U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw92k6UE8j822gtFTgzEca8/zxQGrLlPbsCzClv1N0kH6+Y6GsE
	P7By+rJvmG79R3hSM0YUvcdCbrhGNIcB+RoXuc2iMh1/xjutWyIN
X-Gm-Gg: ASbGncsgnPTc25InlH8HGQhqnkKMoDqt238b8f32R8qttOihtqKRiql5MM7Q8VmoFj0
	EHEtnawvlQhzWPsrg8i4ZHvwR1qep8FyljjffNbEwVv5SATAYUrbIP20171Xer3ZJ9GeJD3rkj9
	3BrF9W6egWliFGQpeHHj9seJdhU2k+xRuTLbHzmUtRoFJPxECebrpH9m616X2kMJHClXNc3p2Az
	9nNMe+OTQ0JD5B9dkNJaqumqXMNxL/QtHF+t+/KSXSY5QOBocbxMB7c42RMVnTeOF45BS9QnmW6
	OvMW0JUuAYv1wF/U
X-Google-Smtp-Source: AGHT+IFe4p/E5mc6ZXdUskO144UfSWaGztqfNqrlmQcNmUMrZJzV/ph5M+fDa1Vi9KU3agPcMIiCzQ==
X-Received: by 2002:a05:620a:40c7:b0:7c7:bbc9:aba0 with SMTP id af79cd13be357-7caf73fcfb1mr554734385a.35.1746621943769;
        Wed, 07 May 2025 05:45:43 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7caf75b3a6esm145729385a.89.2025.05.07.05.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:45:43 -0700 (PDT)
Date: Wed, 7 May 2025 20:45:18 +0800
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
Message-ID: <tgqngwc7mteczfzhuyguy3jojnqhdi3ecaqhupuq5lhhhn3ve4@n2gb4w3pc7va>
References: <20250506093256.1107770-1-inochiama@gmail.com>
 <c7a8185e-07b7-4a62-b39b-7d1e6eec64d6@lunn.ch>
 <fgao5qnim6o3gvixzl7lnftgsish6uajlia5okylxskn3nrexe@gyvgrp72jvj6>
 <ffa044e2-ee9e-4a34-af6a-2e45294144f7@lunn.ch>
 <2tu2mvwsnqdezjei5h43ko24vfave4c3ek2fjoatwsg72p6lpz@3vbtpmm7l73z>
 <b4ce3e35-9255-4fc7-9c8d-4078b24ac3fa@lunn.ch>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4ce3e35-9255-4fc7-9c8d-4078b24ac3fa@lunn.ch>

On Wed, May 07, 2025 at 02:37:15PM +0200, Andrew Lunn wrote:
> On Wed, May 07, 2025 at 08:01:29PM +0800, Inochi Amaoto wrote:
> > On Wed, May 07, 2025 at 02:10:48AM +0200, Andrew Lunn wrote:
> > > On Wed, May 07, 2025 at 06:24:29AM +0800, Inochi Amaoto wrote:
> > > > On Tue, May 06, 2025 at 02:03:18PM +0200, Andrew Lunn wrote:
> > > > > On Tue, May 06, 2025 at 05:32:50PM +0800, Inochi Amaoto wrote:
> > > > > > The ethernet controller of SG2042 is Synopsys DesignWare IP with
> > > > > > tx clock. Add device id for it.
> > > > > > 
> > > > > > This patch can only be tested on a SG2042 x4 evb board, as pioneer
> > > > > > does not expose this device.
> > > > > 
> > > > > Do you have a patch for this EVB board? Ideally there should be a user
> > > > > added at the same time as support for a device.
> > > > > 
> > > > > 	Andrew
> > > > 
> > > > Yes, I have one for this device. And Han Gao told me that he will send
> > > > the board patch for the evb board. So I only send the driver.
> > > > And the fragment for the evb board is likes below, I think it is kind
> > > > of trivial:
> > > > 
> > > > &gmac0 {
> > > > 	phy-handle = <&phy0>;
> > > > 	phy-mode = "rgmii-txid";
> > > 
> > > And this is why i ask, because this is broken. For more information,
> > > please see:
> > > 
> > > https://patchwork.kernel.org/project/netdevbpf/patch/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/
> > > 
> > > 	Andrew
> > 
> > You are right, the right phy-mode is "rgmii-id", the delay is not
> > added by the PCB. It seems to be better to ask for the vendor about
> > the hardware design before copying params for vendor dts. Anyway,
> > thanks for reviewing this.
> 
> Please do figure this out. Since you are adding a new compatible, you
> have a bit more flexibility. If the MAC driver is doing something
> wrong, you can change its behaviour based on this new compatible
> without breaking other users of the driver using other compatibles.
> 

Thanks, I will check it out. And adapt the driver if needed.

Regards,
Inochi
