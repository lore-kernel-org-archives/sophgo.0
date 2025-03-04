Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466BB1E285A
	for <sophgo@lists.linux.dev>; Tue,  4 Mar 2025 08:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741075227; cv=none; b=PYOFzYnjNbtrz7zP9WXaKci9nMdG/DNlzyLbyO1kDnbyeGcBR6HQZrJeKyGpsO4dXoQXnNnMbhDdykwTq+2Qd2vxQsznyHNV2WTtNErrNHi9PAUUM4bh1Nr1j8tJKC/1HczSL8XPOt+/ceyIOh4ULZXPaQ14bHWAA9A+kY8G7fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741075227; c=relaxed/simple;
	bh=GM+XFwIWDrH57/HNKb2OKRSk1aCGLqQHfdjwtKYZf9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZBgX1ed2Ru8Pd9dTaOtRzBYJRQi3RlCJhKEZ214mVig+n7SI/7+XuVQR7IDwS6OmOSFMTlIIzvArKI3uMScUoiugZDFpCmVMAHYs35LIuSBYMKXMZHpq4RrqW+di4h3O2A/qtWVcYTDWBWARUNHPH9u3lReAPMIAV2kqhMHr04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEcZRA2R; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEcZRA2R"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7be6fdeee35so969414685a.1
        for <sophgo@lists.linux.dev>; Tue, 04 Mar 2025 00:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741075225; x=1741680025; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q1GaFj1uo9b1rPoRpPsJa9v8kqyTjyZ1mM2gRt9a58c=;
        b=YEcZRA2RvTpvu7sxaO21i94VO8LJ7W9SaNfQwPllJCJ8lJ2vUMFft/DXlFkbaErgSZ
         sXeGFa/PVZ4oYPwwquvthSijkhvIdH2eXOWKE8wv5BekfYfTxUVvUSX6X7kyXe19pb+f
         VMwlQCu9Szh4GfxVEQ3sGPxhWQ0yFIkNcpQ4nFPIkQboNrXuL38aLLFyuqg3P8pFqOne
         VV0Okf3ZEU0RJ9N46cct2CyvsjUkkrV+N6hL+5krzED6FshkoITZ8EoOtMacP6dgPSkn
         +h+mUL/cg64f2YClqMfEf2v3tXKPYAe1hdkjq+3JmVdPSFzH5Kfy7glLn6YdCDrssVO1
         zCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741075225; x=1741680025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1GaFj1uo9b1rPoRpPsJa9v8kqyTjyZ1mM2gRt9a58c=;
        b=Uq04TCwZAVUfeZVPkCTnlNZ84vxipPldkwyosHy2aameNB0HzlUNMS6OdG+0XRWhy4
         FciBd1ubWwlI4aK8fTlM6RsAVjFAwPxsE20S0mHqMP3Box2XDG5e5TQnkvHsOip4Lq9h
         oJ4J7gBa0M8eF8uZ8p+Qt0T419TZZxNSs4xuOIw5FUE+4i3iGnkjgzellzA39+hxePGL
         VmcyvXXfJebgJXRu01RmsccLuGIHOAjOYBsw0XPpZTT5eBZBgBa5JkQNZvFaMJlX1Sri
         Vi4aBN4SA1h+uVE5uLDNhsWH2YolutTpXf5/Vr2rk+3z7y87aI27w0HnkKOPce02KVHo
         vLUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHaQGwcic/u8jJERGzOyaD7nFSCqdDsCEggRRbrHmnxgIP2R5aWFo3XAj0rxQ2m/zz9BtMbis=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0O4VGOOIIGaBHuwyPrYHy0pLY6rY3wKBLwxrsGfyh4K1Fe6X0
	fNziakzMRsZrqbR3nmicrfSmmctHNScRODJSpKcOnBHPshy/Wo3xa5EP/w==
X-Gm-Gg: ASbGnctrgJo4kCFK3hHuOk1RAPTS84s35PreJvcvRzqPl9ZBeUyM9qGwyqx/VjNT65J
	eLIMSZQ2frr2IWzyg+p/Dpn6nUM9DZme7Ktx/mXA8cnVZKF/Ax2DWq7zF+VzskyYeyJsnHFs+FP
	xyoZVxPlQEgvKViu5Qrkik6hAGWQpI3sfZsJQ9Rp2LIeXrbly9mkDlCo8Tvw275z9BP0yFtGkNe
	U0el6QW+xf+D6hDqx3ki2MxoJJFr/M9e71B4uFN7eXqXB7WAiYjG0tvza5haKKXFO+MHEs39Mm8
	4vnLDJNr2hHE+bbKVR6o
X-Google-Smtp-Source: AGHT+IFdkylbVxqjDte09eicMFW7LnS9CUylFe+DIP4qpzozVLfERjJXNp00RzgPd4cBPvEXx1CsRg==
X-Received: by 2002:a05:620a:199a:b0:7c0:ac2a:ed0 with SMTP id af79cd13be357-7c39c4c6b8amr2201869485a.30.1741075225155;
        Tue, 04 Mar 2025 00:00:25 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3c57684dasm161673585a.77.2025.03.04.00.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:00:24 -0800 (PST)
Date: Tue, 4 Mar 2025 15:59:57 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Johan Hovold <johan+linaro@kernel.org>, 
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>, Niklas Cassel <cassel@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 0/2] riscv: sophgo Add PCIe support to Sophgo SG2044 SoC
Message-ID: <7un3pk7ukjay6ntbnlvif7mdpdfngtvbwrkcsresxmmtaxah3z@mrfezotyabsr>
References: <20250304071239.352486-1-inochiama@gmail.com>
 <PN0PR01MB103930AC8CABC36771EAE089CFEC82@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN0PR01MB103930AC8CABC36771EAE089CFEC82@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>

On Tue, Mar 04, 2025 at 03:53:57PM +0800, Chen Wang wrote:
> I think it should be v2, right? :)
> 

Yeah, I have made a mistake. This is v2, not v1.

> On 2025/3/4 15:12, Inochi Amaoto wrote:
> > Sophgo's SG2044 SoC uses Synopsys Designware PCIe core
> > to implement RC mode.
> > 
> > For legacy interrupt, the PCIe controller on SG2044 implement
> > its own legacy interrupt controller. For MSI/MSI-X, it use an
> > external interrupt controller to handle.
> > 
> > The external MSI interrupt controller patch can be found on [1].
> > As SG2044 needs a mirror change to support the way to send MSI
> > message and different irq number.
> > 
> > [1] https://lore.kernel.org/all/20250303111648.1337543-1-inochiama@gmail.com
> > 
> > Changed from v1:
> > - https://lore.kernel.org/all/20250221013758.370936-1-inochiama@gmail.comq
> > 1. patch 1: remove dma-coherent property
> > 2. patch 2: remove unused reset
> > 3. patch 2: fix Kconfig menu title and reorder the entry
> > 4. patch 2: use FIELD_GET/FIELD_PREP to simplify the code.
> > 5. patch 2: rename the irq handle function to match the irq_chip name
> > 
> > Inochi Amaoto (2):
> >    dt-bindings: pci: Add Sophgo SG2044 PCIe host
> >    PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
> > 
> >   .../bindings/pci/sophgo,sg2044-pcie.yaml      | 122 ++++++++
> >   drivers/pci/controller/dwc/Kconfig            |  10 +
> >   drivers/pci/controller/dwc/Makefile           |   1 +
> >   drivers/pci/controller/dwc/pcie-dw-sophgo.c   | 270 ++++++++++++++++++
> >   4 files changed, 403 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> >   create mode 100644 drivers/pci/controller/dwc/pcie-dw-sophgo.c
> > 
> > --
> > 2.48.1
> > 
