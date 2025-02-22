Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C9B335BA
	for <sophgo@lists.linux.dev>; Sat, 22 Feb 2025 00:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740184470; cv=none; b=my/ZXkzZQBK7GesKCksPRWulLQi2cnTyhgvcv3imt7KMDg5Uc6LA/mgZU0fbCY7qQR33Vbp5ekhPAnbgvQ5TrKIQIqshjbLkhW0gBWKEqEUwRnjMOHR72PUM1OGh+zZY33TnFcOcROMdxiJSylHrXLLRQkcnen4ltJT8Mlq+/us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740184470; c=relaxed/simple;
	bh=f1vgxh32DbPx0po+Ss3wIsjqVbC9YsEogM1Sg6vonzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbiRR/VsW9G830I8U6kCm0/EXISbhwjHaou3t8B0gqXiOlkLPSH6gWfVlBgeJxAUorCzoRnedRawDi+Py+1/f5xyUKUuYlvLNIqk+XC+1SLsNbF2pN47zWeaXaslMxjXJVsxUTEoudgn6KIj7JeIokROSxGCRY7jh0Opk14NjQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gx3G6cpi; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gx3G6cpi"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c0a1c4780bso273001485a.3
        for <sophgo@lists.linux.dev>; Fri, 21 Feb 2025 16:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740184467; x=1740789267; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wStl+6IKZhys/kjLjbrppMxAjOWicsS14gQYbb4jIcI=;
        b=Gx3G6cpiVf/bWQ+BYE/Ya2/1kgT72wAVBuStgIWdb+l9/tdgZMyhVqwia6DnajIFZe
         ncJiy5oNCR70u10KwcVXOHLZqfFJanlBowe6P6zS8emu4cRoyxPF7i3BOR6ErySWMcrT
         Ts5aWkiA60uORRI1zTNT6cQU49XC8TcUWF/Xvl5IyIY0aZAcSdorb4r9fsESQxdDUYl0
         e68Oe7q0QaI52AFuNWdb2W/Yna7bos22pnJcgenJuIB9bouzcPFiJkx3pdwX5lAab+zq
         UgUVAa9ef45o9HzARRNqVkfMip3BJ19Ix0b/boBA4jlN7J7U7La2m8K0+btaGZGyOnvt
         yFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740184467; x=1740789267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wStl+6IKZhys/kjLjbrppMxAjOWicsS14gQYbb4jIcI=;
        b=WaYyq3QLOimoBe/FSdk90I5MVLDqVZd1zdFg7KlGzXOSEJCLQHF8lHf8OmLswcNfYC
         Su4JxZmp9Q7L1F4hCgGhhl3Qyr04qy0S4P3sJ2L7jhbH89bM2qlGq5fVTUkFcC75WJlw
         /qe4AWS9Y/X2wFXoEvsy/N0eM62YFd5HgZlnKxrIYdHmnG5VL6gkGAiGYL2OfwYT5p2D
         hQXVwHWTnhscMpHeDIF3yzUO9qXE81m1WqfkSJ7IkuwWuh/cLRJd0t0AkRLtASpEZOuj
         9TVVYhSpraKgJsB4L2alCNSOWx5S5LdQfGo2OYHRrJnl7aCytov6nupg1LqRmn9l68bK
         I4bA==
X-Forwarded-Encrypted: i=1; AJvYcCUjBVsUojaDgT1C22PTqQFTpCGcNvjO0s9KU5p2Kbex8xUZIEeaU5OokDyGnfNLoCDoz/EL6LQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRKFvyBDTQ9hNRJPwneuw2UscEsOZ8fplyT6abbStA//o1gfiI
	gD+fAhG9/78zXgalBQByjOGSWpGoFoGHLly1ZrigvbdFSqv2MWl9
X-Gm-Gg: ASbGncsNqfuAdim5DvN10zBJaD8QojIzm/wIyWq6MTfYVe1CkOvVT55t4DCW9SPqPpf
	LDeIcXAydd/o/pnn3qI2vaYI2v8DrXKLJjyooXDV9sV11aXO9NKA8qg2ezSFG2frJ7oCrOv5Uds
	p1oKh90sJSF9aaOUPX9OaVCI8h98C6Ls8mE+iVQAq6pY1wE5HsjA2KqAVIAX/G2qd2ZcC4ShUq3
	0QFcn4adQ95Aek61E0A4vK48OX2iiH169VjnhKuLETrkK4y1cJ7AQljb5GnKMaDi1Wfd8OtWct7
	1A==
X-Google-Smtp-Source: AGHT+IFHrDz0qc8zD5XdcpfmhF3hdDGMdxF6JouYGWlJZR7lIXsOACUUisCSrhGBpwJguI83XxPhyw==
X-Received: by 2002:a05:620a:1910:b0:7c0:ad3e:84a7 with SMTP id af79cd13be357-7c0cef1255amr657209885a.26.1740184467296;
        Fri, 21 Feb 2025 16:34:27 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c09619fbfesm721817485a.18.2025.02.21.16.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 16:34:26 -0800 (PST)
Date: Sat, 22 Feb 2025 08:34:10 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Niklas Cassel <cassel@kernel.org>, 
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pci: Add Sophgo SG2044 PCIe host
Message-ID: <2egxw3r63cbsygpwqaltp4jjlkuwoh4rkwpgv4haj4sgz5sked@vkotadyk4g6y>
References: <20250221013758.370936-1-inochiama@gmail.com>
 <20250221013758.370936-2-inochiama@gmail.com>
 <20250221-cavalier-cramp-6235d4348013@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-cavalier-cramp-6235d4348013@spud>

On Fri, Feb 21, 2025 at 05:01:41PM +0000, Conor Dooley wrote:
> On Fri, Feb 21, 2025 at 09:37:55AM +0800, Inochi Amaoto wrote:
> > The pcie controller on the SG2044 is designware based with
> > custom app registers.
> > 
> > Add binding document for SG2044 PCIe host controller.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++++++++++++
> >  1 file changed, 125 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > new file mode 100644
> > index 000000000000..040dabe905e0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > @@ -0,0 +1,125 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@gmail.com>
> > +
> > +description: |+
> > +  SG2044 SoC PCIe Root Complex controller is based on the Synopsys DesignWare
> > +  PCIe IP and thus inherits all the common properties defined in
> > +  snps,dw-pcie.yaml.
> > +
> > +allOf:
> > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: sophgo,sg2044-pcie
> > +
> > +  reg:
> > +    items:
> > +      - description: Data Bus Interface (DBI) registers
> > +      - description: iATU registers
> > +      - description: Config registers
> > +      - description: Sophgo designed configuration registers
> > +
> > +  reg-names:
> > +    items:
> > +      - const: dbi
> > +      - const: atu
> > +      - const: config
> > +      - const: app
> > +
> > +  clocks:
> > +    items:
> > +      - description: core clk
> > +
> > +  clock-names:
> > +    items:
> > +      - const: core
> > +
> > +  dma-coherent: true
> 
> Why's this here? RISC-V is dma-coherent by default, with dma-noncoherent
> used to indicate systems/devices that are not.
> 
> Cheers,
> Conor.
> 

The PCIe is dma coherent, but the SoC itself is marked as
dma-noncoherent. So I add dma-coherent to the binding. I
wonder whether dma-coherent is necessary even in this case?

Regards,
Inochi
