Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D87D280328
	for <sophgo@lists.linux.dev>; Wed, 29 Oct 2025 00:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761699194; cv=none; b=XJvArcRHlPxyuujrhjswVqoWmPyquOytymAPR7xg8DC0x4Q8IBOGCNO/4cgLz+RdKqRc0SERK1SPQzzxVirJLg74+SW3UgaTIx8mNkJKGzqf6IpyIvxMsf9dUKab0oM6UJ2kQrYPiN6xYcI+yzTn7xPe7l1WfJWsit0vvUdd+GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761699194; c=relaxed/simple;
	bh=HZDU3Kuw8nlFpPJ+kNDV41s6nRqGkmewtH6tcnYPkoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQDsGGAd6VGox7W7bjMLC4RxjoqVBu0szgkcXorVP7yMqtuK4SP5DIy/tLykGpLAYW/7/TjECmu8/4PXuTvW8hCIFN54CjRDg5waR4oekJoBEMEML9I+2R7xPR/Qv8+gTuICcl8gC5s3FPO5LtCRz5MvQoB4eTb5tN8yX3CuHwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W63x4EdL; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W63x4EdL"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-33e27a3b153so6511042a91.3
        for <sophgo@lists.linux.dev>; Tue, 28 Oct 2025 17:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761699192; x=1762303992; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m8SBa+XRdCWeVW9AmWkZ3MCowA+/EYnxZNZHdIoneiw=;
        b=W63x4EdLO9oSVBYms5wNq1eUIOTJKdXJEvpkPLb/I+UqNSvIraagazp6FSL/amqVF6
         Obzi9RMPbayAauoC8nAh3HRagW7PS1E5n2PXZo3WXpjYJNne3oBr2C8l4RsV17a1rhRm
         jfhHY77MXE6PjVGAItHkBQDHj5wHAasZjGeMDMF5QkV58ed2AjR+Vz8JRr0zsjtIZSJE
         L9mcw1RqiHQ1Bjt11Y2sXrzi4/qOdyl7iaRFhmSqdUMSb5S3CQ/nFUXAjBK8C/Om16yH
         i3tsgC4gN6Ab/HusBaAwuebASY/decR3qONAW3iD5MhbHwHr69WzCvy0J1bswc8Y+oGM
         6dzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761699192; x=1762303992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8SBa+XRdCWeVW9AmWkZ3MCowA+/EYnxZNZHdIoneiw=;
        b=btEPuMnHINe3MhEPQP7G/fWdkNETpdhxECsXt1urk9gC4TNjU6jyz0xu9ldRXa7l3E
         3ZEMRoMo2GTdQmgSoTUgwQQtQbDIUwxCJipNHPhV+4NTFdE/M0O3n/HNlLtd3eBCe7H2
         RtYj/npuxHOwDlTiIecfte/TY4S8t5Uec4xP56qC3EJ7BYfRoxJjwvdw87e1Y2XhrxpP
         YKwyiQkvOECEBB5+pt2gkP4TjBYcruTykqmmqFUtGkrjwVjCDhUpz55cRB9PJPstx3Xc
         V3LHiPcQD6DFNiujGkvKdwZzgFEvyYHOQVimF0glGqn/SJv5B2p0VTQPPkHkvwZsdO8o
         dtrw==
X-Forwarded-Encrypted: i=1; AJvYcCXC8ahT2xT3qMU6bJ0N+kRZszeI8yf+k28zfTFo7TOxa59AkrlvsxU8BL7RhEJOSBF+ZKtaPbI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzenYGIJrDjs74ZRtSVSMocoAiNjjtmD58rwDEDXRCmfByCF9ms
	LIgerRXBOTUxDzjSdvyo/GQ8KPbD43HQvFm5az02flcLW5q83O0+u4Qc
X-Gm-Gg: ASbGnctYg0foLTKQ/t+Y2r43spKdXu9j+4G+Zoa290T47yzbYOuTajvZ8mIQm1KZQap
	Z6bFZDPMA3UuU68sFalWAXEld3VR3aUkoLnx8fwfyIBzQBHHvobUuctz7n/X2aMXag+B2HqAOzD
	1wca6XLqu/Om46Tv/4CFP3moWnMS92Tv5qShTkJYIVWRYhTfViy8L41Y0mt1CWyiUNjMaF2q0Bm
	MvuUg25PtAv8Aopdf3tRkkkERe61EcAIaUzFrlQhSyydPQU2H46kZm+PJV5QYPvHmbiz9gBAs/o
	Mgabgt88l74DY4trcPsLsKtAWp3OangVambo7Dr9n9Xb/myhpp084Rujn1Q66CyEreOgkzNk7AL
	FARAx9f/dLqskXWpn6mb8IpJZh4JS/yNboPFNS56v7DBdYwTMJ/e8X76FRR1857EblFshHwSU1/
	4=
X-Google-Smtp-Source: AGHT+IE90UXiGYJzRQ58CyS5PxlflDC8vEvcklnc4McQT7Hk9PgOXlQ2qQeKd9vAUAOVnUzqvljQKw==
X-Received: by 2002:a17:90b:2dcb:b0:32d:d5f1:fe7f with SMTP id 98e67ed59e1d1-3403a260a68mr941140a91.15.1761699192237;
        Tue, 28 Oct 2025 17:53:12 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed70a83csm13316804a91.4.2025.10.28.17.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:53:11 -0700 (PDT)
Date: Wed, 29 Oct 2025 08:53:04 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Joshua Milas <josh.milas@gmail.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, alexander.sverdlin@gmail.com, 
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com, chao.wei@sophgo.com, 
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <7e37k5hdn7nnn7cxnfrzqfy7h7a3ofnaf4r6rgk7exehrhsn2i@rvxjxvh2sodw>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-3-josh.milas@gmail.com>
 <hkdnjyldwr4watvizsju4qcvpvkb3mtt5rathaooembpceyufx@ega5xrqj6v3y>
 <aOqtt7BDXxItrs7W@sleek>
 <bsol3uim4brrrsdmvuk6f3uzampbki2pyhziap6x4rw7txl435@rwoxrnctkf3y>
 <aP6UJFPP-ReYPzmq@sleek>
 <4bdad288-250b-4e94-abea-eb231fba5beb@rootcommit.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bdad288-250b-4e94-abea-eb231fba5beb@rootcommit.com>

On Sun, Oct 26, 2025 at 10:48:50PM +0000, Michael Opdenacker wrote:
> Hi Joshua
> 
> Thanks a lot for working on support for Milk-V Duo S. I'll be happy to test
> your V3 :)
> 
> On 10/26/25 22:35, Joshua Milas wrote:
> > Inochi,
> > 
> > Thanks for pointing me twards duo-pinmux. I was able to use it to get
> > the default config which is uart0, spi3, and i2c4. I can change the
> > dts to match, but...
> > 
> > > I suggest enabling devices that are accessed by default
> > Would we rather enable anything that can be accessed by the pinmux?
> 
> If I understand correctly, you can't do that because there will be
> conflicts.

> From the Duo S pinout diagram (https://milkv.io/duo-s/duos-pinout.webp), on
> headers 41 and 39, you have to choose between MIPI, I2C2, PWM12/13 or SD1.
> If at least 2 of these are selected at the same time, there will be a
> conflict, and I assume that the pinctrl controller driver will flag it.
> 

Yes, that's true. Boards with CV18XX always require setting pinctrl.

> Then it sounds complicated to define a default combination for the whole
> board, because it's like a default use model. Who gets to choose? What
> Inochi suggests is to follow the vendor kernel choice, which would
> correspond to the way the vendor intended the board to be used. However the
> community could choose another default way to use the board, so the choice
> may be up to the first contributor to the mainline kernel for this board,
> possibly revised through later discussions.
> 

In fact, I see the maintainers do not agree adding every possible
configuration to the DTS, (especially without "omit-if-unused" flag).
And in many case, it is impossible to add all possibility. As a
result, I prefer to use DTS overlay if there is something custom,
and keep the mainline DTS minimum.

> I guess there are cases when the choice is easy:
> 
> - When only one configuration is available for a set of pins
> - When there are important devices on I2C or SPI buses on the board. Then,
> you want to find a way to prioritize such buses. Fortunately, I guess the
> board design also guides you to the right choice.
> 

In fact the priority is the thing that is hard to decide. This is why
I suggesting keeping compatible with the vendor kernel, as many people
starts with vendor kernel and it is a good thing to refer.

>
> I was facing the the same question today on another board, and that's why
> I'm happy it's raised here. As thousands of DTS files have been written
> before, I'd love to hear from people with experience on this topic. Are
> guidelines written anywhere for board DTS creators?
> 
> Cheers
> Michael.
> 
> -- 
> Michael Opdenacker
> Root Commit
> Yocto Project and OpenEmbedded Training course - Learn by doing:
> https://rootcommit.com/training/yocto/
> 
