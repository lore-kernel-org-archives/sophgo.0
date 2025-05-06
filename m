Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D258B157A6B
	for <sophgo@lists.linux.dev>; Tue,  6 May 2025 22:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746570295; cv=none; b=genM2HU98L4V4uCe2rZTmFACBfuRHVLs98auaCMNFsRyPJa6QUAQ823GMlHVYkXRH+2v5VUAmlSCI6yzau/LifjYC2VcObzPdrLc2CqVzkX8wlzZi0KUoU5d17fgrGp6uhrOpOQCXezJqetiKR5DeA6TV6K6YkkjGpktnDkIhF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746570295; c=relaxed/simple;
	bh=pGCW6+4GYSpPWrxlBu87gJhu5P8X0pt7xGbhx4iMxbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIKtHyoWxouaOwMtgqdCd4a2OJ1jRjoGhm6B0CdW+Ku5LdxyDPsgwtBYgN0AkbwJE4y3f4sgcBOSQI25uUhHfJ9jH8W9B7h+w30UpPozjekl3PDVUNFyhyfsnQhtjcdmJl0dAzdRlZhUGpv/gE9z4uC9NtIGv/KUH7Bm2QAp6aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYNH4xUr; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYNH4xUr"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f0ad74483fso71524796d6.1
        for <sophgo@lists.linux.dev>; Tue, 06 May 2025 15:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746570293; x=1747175093; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S6PuN11kmLGkE9CdpXY3LsP08NiwndWR9cFcKMuKbeQ=;
        b=BYNH4xUrDUNFmMSQNuDJ1xEAlov1NMbwdtrm4tWKT6gULRlrGN+CjIvaUjBdIliCu/
         qDmU/sFObmsWKBYY9nC30QyQXPp4tTnL5DE1DzG5yEXYuN7ZQLJtt6zy6wzh2LQhCmuf
         jg8XPp+GEaTMbiaFornClAtNkTd4vO10IEZEyVBfH2E+nJWKtBTCYfnZaIOuRWVf+dx/
         BMbvOrEraBTgGAuS/kdYiAfm1E0RjBot0IugM8CK5EUFJFBAsoI1AVb3vvNsZ1To7vMj
         59xU5xUKZInVzutLE3/c9ch2stqMleWjoeKpPrfmYLu34y/9sb18m1k8AZWt8+m0vALb
         BhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746570293; x=1747175093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6PuN11kmLGkE9CdpXY3LsP08NiwndWR9cFcKMuKbeQ=;
        b=JjtWKXY5x/aWJbiZe2hi4XdNsbLygz/kVgJfe9XpWmNhKmDMTVUvR07MSW2kBAjPD6
         1Z7hjqu8rWVcleOp9bqAPh8Ch4r5eS8dpRZMJOatbHOUhalws9bSJU/PpI2Q1+KPVGCK
         qFbKnchNK3yJCmIsvqSpbCNLl3tikhR9KL5fykKZJGKHsJuIBI85ih2rl0NJLlEBOa8X
         Pgje6F9BlrmHXmGh+1oSYPbE8cGxX2hXghkliMnfsd3xTALEUQf2bPP9m8VeiO6hOUSV
         0zMOLoKX/mSg13rUALhJaB2lrptjP6M9WOYRoD9+mjeopOStZJNBHlqRtyf89mTwbYET
         w8WA==
X-Forwarded-Encrypted: i=1; AJvYcCWV6835avN5h+wEMOfhnZXeqNb4pXHXmnuZK1m3/oWtrcWezlUiGcxHkVf0WKOCEeN3S29a+4w=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywemz3ex+8E7RJx+UIYe8MDX6Q4Dc+N/LHlT3M4oLFqHHvvlRld
	alb+uZwW+tLyNLcUzR9mHIHDURG+2ypuSLhHRfeaP6JEQm4/2EAn
X-Gm-Gg: ASbGncucZQ5YfqbvSqc8aCT1CFujv/ZvUuFowjTY2fUmKP+jheB5Gq6SqhxsTj5C9VN
	P9yUtqEu/2bmtqWRMb6nakmAegTXXrA4OfPLsIcAy83ciVy/B3E6rsAK8wYXHqCMOjRKDr3cpmZ
	MrPjkc2jEZ54UCFWgZCn+J55FOFTFTNHtKW4HBjyTs66KV9x98XNQMQOiHIJ15IsxUx+qn1MJ3o
	AeV70DH92PuRo5u2S5YzEoedy1U8YgVwdd0EKpbTZwr4xlDYaBs9lAiBXy5FhNLWaAiqUHpLcLK
	t43khfdt6McGVp8J
X-Google-Smtp-Source: AGHT+IE/HcOkUaQ1OjeZ76XLCIoAMcLQ4gb8y3bZBjcdCFJTsGZuHVr3Qr8wRx0H5mUFdFynUfAxQQ==
X-Received: by 2002:ad4:5b87:0:b0:6f5:3e46:63f9 with SMTP id 6a1803df08f44-6f5429afe88mr16025426d6.7.1746570292605;
        Tue, 06 May 2025 15:24:52 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f5427b07e6sm3118126d6.106.2025.05.06.15.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 15:24:52 -0700 (PDT)
Date: Wed, 7 May 2025 06:24:29 +0800
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
Message-ID: <fgao5qnim6o3gvixzl7lnftgsish6uajlia5okylxskn3nrexe@gyvgrp72jvj6>
References: <20250506093256.1107770-1-inochiama@gmail.com>
 <c7a8185e-07b7-4a62-b39b-7d1e6eec64d6@lunn.ch>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7a8185e-07b7-4a62-b39b-7d1e6eec64d6@lunn.ch>

On Tue, May 06, 2025 at 02:03:18PM +0200, Andrew Lunn wrote:
> On Tue, May 06, 2025 at 05:32:50PM +0800, Inochi Amaoto wrote:
> > The ethernet controller of SG2042 is Synopsys DesignWare IP with
> > tx clock. Add device id for it.
> > 
> > This patch can only be tested on a SG2042 x4 evb board, as pioneer
> > does not expose this device.
> 
> Do you have a patch for this EVB board? Ideally there should be a user
> added at the same time as support for a device.
> 
> 	Andrew

Yes, I have one for this device. And Han Gao told me that he will send
the board patch for the evb board. So I only send the driver.
And the fragment for the evb board is likes below, I think it is kind
of trivial:

&gmac0 {
	phy-handle = <&phy0>;
	phy-mode = "rgmii-txid";
	status = "okay";

	mdio {
		phy0: phy@0 {
			compatible = "ethernet-phy-ieee802.3-c22";
			reg = <0>;
			reset-gpios = <&port0a 27 GPIO_ACTIVE_LOW>;
			reset-assert-us = <100000>;
			reset-deassert-us = <100000>;
		};
	};
};
 
Regards,
Inochi
