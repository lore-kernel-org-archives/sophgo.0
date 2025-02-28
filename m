Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2B623DE
	for <sophgo@lists.linux.dev>; Fri, 28 Feb 2025 06:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740724465; cv=none; b=rQ96A8ifmhN/oi9kKdFsrAN79YVk5tMGY3EMIUuK5JLLggZdmUq1B6zoikW3P5M4KWV2WJ+AKklWF85fIPCC8o3kVTOxwWN0yle8sHPfWcUfLc8ZoBCQNPCm51efJyYdPIiw2qnhp4ILLA4hoe1YwKjl/7pb27N/8u4vkGD/m7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740724465; c=relaxed/simple;
	bh=rzVgtvY1SM56HqPtFVnZDRtqos6uI14mQmNqWNQKwKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o55O3qpZ1cfCzDZQWsDPZhhzm4mcf1dr/lNBzguoVHmJVp7s5YKb8Lmjp7knH1cKaoSStlbiVYK0oTtEhtogcZcqXTYMWTeukczvuuFFFeHE0mfnBfacxvMlT5P+2m71C7n7mo7WvyfP/12+HTUZjA0kRTVdmmvg0iDFclOZFWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMTxSCkW; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMTxSCkW"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8983f631eso10538246d6.1
        for <sophgo@lists.linux.dev>; Thu, 27 Feb 2025 22:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740724463; x=1741329263; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IyxvtTDvP2i08pzEmArBnEwNU9XeUSRwTgWHm1HVVpw=;
        b=CMTxSCkWl+I4clW74/VP6qgz1l5kCdGqujb7Xhx9YkunrcPQH8tK8kZ99X4tZ/tLOt
         bgKbww3WxtAKzcNcQfs+y6qPg9VU+WHJkYiohTuMYFkJC9nfMFvLupyZh/ljKFrNy32y
         eeug9l+pOiLTjvqXl4zxgGpCB6qJ4nl09RH44CfKpaS1mDVdmaMSJGK4n1hxYXol0x5V
         etL3v/d/dgG0EUhbBnQfURWxgbjdItKgpFU50CZLy+EFrjyfrOFISJYvRDvERn9tbJAB
         DD98prVPBeOujRmKgb0otoqJhGIG3GDKTUS1/oOushbZ9aCTwMRyDo7h9NGwjEUJw+s7
         mB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740724463; x=1741329263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyxvtTDvP2i08pzEmArBnEwNU9XeUSRwTgWHm1HVVpw=;
        b=O+8HaFliDCXt05KYuPRmNnTMADInt3jdHp8kQStbltvTWWVr4fnH4fFn+A3ETb4zx+
         KmVmGILQgOdRD05t4H5PVPtKzgKJdPVWeKspURkH6+tLsE797D6HEWWS7v2hoC8uzfT0
         vQmkiHi8sFn/LeE9fIPM3PJYy3RKHpgU3COUA4D+pDj2qpsYhx0AG0LS63pjA9+AXOyI
         UbvB/xYHwAQyrw9vtmE/v7GazN6KUU3teVKGaE/JMIFB1f4brBCPE4vel40Q+lcEHoRg
         LUCzvqEFRboqDdEooc6fRI19Tv0+xR/6T/Slo5/6mq4OQ06OlEGwkMyb4bu8GW8ilPs8
         Avzg==
X-Forwarded-Encrypted: i=1; AJvYcCWUq36KchKVWGzw1p8Vwerv0eTO8AsxdIb92h7l70ecgQ43CzVqbAczVUnat25Tq299+lMx7vU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yya4PNccwO4CPBTkul4i6C1qGtDwI8FdHSJ2GX9qhfkfrPcpFn0
	ttzPfu/Y7kWa/t/zQhF616my08VHz1jwCWEsRzW9bctg0udSZeZc
X-Gm-Gg: ASbGncvmTY2qGh4ZwBs52z1h/dUL/oboNKUZHOftKN4hhlEzL0hPrYVhGOIOx/WUzDN
	aT6875ETDzOa9+BAiTTvbp+D96/EI8q25+tXqsia9OqvJDM7HZqtBGykEK7b8CZ5DCISK4Li91/
	lWzEfwp80WhANFCFMYzP+Xxm7ofmSUkIlj9/TxLX2O92tzkjL6sUU4XHY13svkS8hrCM4Z6I9p5
	NcB9NSv3b76wlKsdBP4BQfiHQsIyzcNWSB0IlKJ8JI5J8QbLKFE6P4zSxIJjIgDuw7+BnSw1FiX
	tg==
X-Google-Smtp-Source: AGHT+IGISZX5hCGeBtad2Mh3HcBYPIE/9ril4UARwLS+NFYZNru7HfBxGLbthbXqB8fmJUSStrU7og==
X-Received: by 2002:a05:6214:2687:b0:6d8:b115:76a6 with SMTP id 6a1803df08f44-6e8a0ad8ff5mr42554456d6.0.1740724462935;
        Thu, 27 Feb 2025 22:34:22 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47472409ac2sm21028501cf.58.2025.02.27.22.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 22:34:22 -0800 (PST)
Date: Fri, 28 Feb 2025 14:34:00 +0800
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
Message-ID: <ynefy5x672dlhctjzyhkitxoihuucxxki3xqvpimwpcedpfl2u@lmklah5egof4>
References: <20250221013758.370936-1-inochiama@gmail.com>
 <20250221013758.370936-2-inochiama@gmail.com>
 <20250221-cavalier-cramp-6235d4348013@spud>
 <2egxw3r63cbsygpwqaltp4jjlkuwoh4rkwpgv4haj4sgz5sked@vkotadyk4g6y>
 <20250224-enable-progress-e3a47fdb625c@spud>
 <7ht3djv7zgrbkcvmdg6tp62nmxytlxzhaprsuvyeshyojhochn@ignvymxb3vfa>
 <20250225-lapel-unhappy-9e7978e270e4@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-lapel-unhappy-9e7978e270e4@spud>

On Tue, Feb 25, 2025 at 11:35:23PM +0000, Conor Dooley wrote:
> On Tue, Feb 25, 2025 at 07:48:59AM +0800, Inochi Amaoto wrote:
> > On Mon, Feb 24, 2025 at 06:54:51PM +0000, Conor Dooley wrote:
> > > On Sat, Feb 22, 2025 at 08:34:10AM +0800, Inochi Amaoto wrote:
> > > > On Fri, Feb 21, 2025 at 05:01:41PM +0000, Conor Dooley wrote:
> > > > > On Fri, Feb 21, 2025 at 09:37:55AM +0800, Inochi Amaoto wrote:
> > > > > > The pcie controller on the SG2044 is designware based with
> > > > > > custom app registers.
> > > > > > 
> > > > > > Add binding document for SG2044 PCIe host controller.
> > > > > > 
> > > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > > ---
> > > > > >  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++++++++++++
> > > > > >  1 file changed, 125 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..040dabe905e0
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > @@ -0,0 +1,125 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > > > > +
> > > > > > +description: |+
> > > > > > +  SG2044 SoC PCIe Root Complex controller is based on the Synopsys DesignWare
> > > > > > +  PCIe IP and thus inherits all the common properties defined in
> > > > > > +  snps,dw-pcie.yaml.
> > > > > > +
> > > > > > +allOf:
> > > > > > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > > > > > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    const: sophgo,sg2044-pcie
> > > > > > +
> > > > > > +  reg:
> > > > > > +    items:
> > > > > > +      - description: Data Bus Interface (DBI) registers
> > > > > > +      - description: iATU registers
> > > > > > +      - description: Config registers
> > > > > > +      - description: Sophgo designed configuration registers
> > > > > > +
> > > > > > +  reg-names:
> > > > > > +    items:
> > > > > > +      - const: dbi
> > > > > > +      - const: atu
> > > > > > +      - const: config
> > > > > > +      - const: app
> > > > > > +
> > > > > > +  clocks:
> > > > > > +    items:
> > > > > > +      - description: core clk
> > > > > > +
> > > > > > +  clock-names:
> > > > > > +    items:
> > > > > > +      - const: core
> > > > > > +
> > > > > > +  dma-coherent: true
> > > > > 
> > > > > Why's this here? RISC-V is dma-coherent by default, with dma-noncoherent
> > > > > used to indicate systems/devices that are not.
> > > > 
> > > > The PCIe is dma coherent, but the SoC itself is marked as
> > > > dma-noncoherent.
> > > 
> > > By "the SoC itself", do you mean that the bus that this device is on is
> > > marked as dma-noncoherent? 
> > 
> > Yeah, I was told only PCIe device on SG2044 is dma coherent.
> > The others are not.
> > 
> > > IMO, that should not be done if there are devices on it that are coherent.
> > > 
> > 
> > It is OK for me. But I wonder how to handle the non coherent device
> > in DT? Just Mark the bus coherent and mark all devices except the
> > PCIe device non coherent?
> 
> Don't mark the bus anything (default is coherent) and mark the devices.

I think this is OK for me.

> That said, Is the PCIe controller actually on the same bus as the
> other devices? (Not talking about the same DT node, the actual bus
> in the device)

It share the same bus with other device, but on a different
master interface.

Regards,
Inochi




