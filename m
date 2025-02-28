Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82BB1DED60
	for <sophgo@lists.linux.dev>; Fri, 28 Feb 2025 08:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740732408; cv=none; b=iCWFkOYvmeRTwwVCxf6n4SHJUFOGrv73mbuzM0WMRMQcJeqo/06GUr8a7y3XySpBsBRjAjLhc88KD9J6Sw2DQEyWtb8S0Up5oh3QakNQjMO0I4LjkE7CjkruyOxN2MRBlLLnDMs8XEcBJ3SAfYjvyxSQARm765YrkKgvPZHW1LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740732408; c=relaxed/simple;
	bh=e5m3SMRr5O4UR7zd4yFRdhL57g1VhnwFolUSg7qB4e4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuslbWbNZ09h2e823c9udEL/P70TCLVwF9xtRaBOY5mtRM9CnrwiEHPALpTC9Y/xVxz2iGTGdp7Ep8eEfe8tyL+SKApm0W6fnI9NRQEWkzA6CtV+D6tqwrNiQXxT7kskdFnYwdmMomopEI5zaFR44gljdPGvZmYbQo5qIrdaWCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6cqcNmQ; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6cqcNmQ"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-471f9d11176so19626001cf.0
        for <sophgo@lists.linux.dev>; Fri, 28 Feb 2025 00:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740732406; x=1741337206; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LLmHR/SpSqY6N3h+Iw3NISXuCevyPVad+x0gw7x/vBw=;
        b=A6cqcNmQGmULG+KYRPX9ZZoV10QNbGgxgCKqQx/TN9BUZ2aPmPGZG9P67Nrc82oJHn
         F+LUrnvfxWhXP0zZhH0CTtkYbxgOtSGq6wTqsG/cjR9zW2YHDTunNE9LSbeyQa0bYhL2
         OC1ijzu9+RcekGobB2pooIi2WtGVxKDZMuoM3mGkPyDOAvlLBb7eRE+26I3Ejn2OSoFZ
         fbzZfm5w8GuFWr+CdFGVGtV9NHupL+wT1d976IOWncH/ewvlF719Qe4uTChneBN89Myc
         iEWs5jsO8DdM13JERBj7ShJNoZ2KjcfWV5+GA6AtcZfMzsTOX0iltoBGiQ//BvBqk7FX
         jhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740732406; x=1741337206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLmHR/SpSqY6N3h+Iw3NISXuCevyPVad+x0gw7x/vBw=;
        b=EEJS+hgzmVCK9FIUIabZLH3GpgdgpSf64PhUavqawUzcheKAVZmZzKl0C1dgsD+Xvd
         2y/1F/BDPhf623bfBqKee6I9boDghC2SVEgxweRdBzmy8aHUNNVhvWU0+CrhisRNoghy
         nxdWXmH4soDIv42BR97X2FcSg1PVJiF/Qm+HFtoLYlmvGASec2Xd6aSEUO6zXwWzwsoI
         WO/RfwmmA6N4HbJGKewmqEBvlSdiDAAwm330Z8gbQhVf+wlcx96ZNg6l4cDVm4Rko3I1
         BZEQhPxzbhgRqhheJHiXRDEeCY5omCo03vhHhFXe0TYlb0JQaMOdntAqsi6LdGX18Wlc
         NvIg==
X-Forwarded-Encrypted: i=1; AJvYcCWvr6Vp6cK6JyAQCM9UHoYXaRAQMRZfQi7nwVhNvYOYoPpt30LRrOGUxib56kE9gt3XPcajIz4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWhoYpm0VruA+6YtKnDZ7zDOAUdawYInkilP5ZyL5KagEQZjgp
	Zc451uXUO+jWPwaGKtp812VS2hqQRN0Pt6Ykb9cLIL0igiBdEN1y
X-Gm-Gg: ASbGncu0l8pbQ1r1+twN46DiG0m2OgEuKjUrbvMmGbZ/mMzahHW+Hk6/aMKp+dF2Bs0
	iWpo1/VPvpijrTKw4wBfhjQSS+9iZexUg4DBvXgdoyC6rNE5QBK4NronKQmnen29fswJq+c91tj
	dZtC6VaLb7QKC3LzDFRRW/oJENawIL8Pp1IEvbtKriOYSKjDGHpvS05XDw89YpNIwx/Sa/h4h+A
	3QO/Yu0S7ZPkbnAfXFyBN2AvDXOJq+EmmdHeRMpIcXJdLCxJrajfV8PjLujem3gI+MH/aZUCa0W
	kw==
X-Google-Smtp-Source: AGHT+IGlyCXuariPZPwL7PuD8T0egLT46qA1ZdYfUWGVbxZHrud8Fu7VDXUjdtaUdRLOr7L0vfkfvA==
X-Received: by 2002:a05:622a:198a:b0:472:1812:23d3 with SMTP id d75a77b69052e-474bc04ec55mr26784781cf.10.1740732405593;
        Fri, 28 Feb 2025 00:46:45 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47472409ab5sm22150091cf.63.2025.02.28.00.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:46:45 -0800 (PST)
Date: Fri, 28 Feb 2025 16:46:22 +0800
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
Message-ID: <pbj22qvat76t74nppabekvyncc4ptt6wede4q6wfygbrzcj3ag@ruvt26eqiybu>
References: <20250221013758.370936-1-inochiama@gmail.com>
 <20250221013758.370936-2-inochiama@gmail.com>
 <20250221-cavalier-cramp-6235d4348013@spud>
 <2egxw3r63cbsygpwqaltp4jjlkuwoh4rkwpgv4haj4sgz5sked@vkotadyk4g6y>
 <20250224-enable-progress-e3a47fdb625c@spud>
 <7ht3djv7zgrbkcvmdg6tp62nmxytlxzhaprsuvyeshyojhochn@ignvymxb3vfa>
 <20250225-lapel-unhappy-9e7978e270e4@spud>
 <ynefy5x672dlhctjzyhkitxoihuucxxki3xqvpimwpcedpfl2u@lmklah5egof4>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ynefy5x672dlhctjzyhkitxoihuucxxki3xqvpimwpcedpfl2u@lmklah5egof4>

On Fri, Feb 28, 2025 at 02:34:00PM +0800, Inochi Amaoto wrote:
> On Tue, Feb 25, 2025 at 11:35:23PM +0000, Conor Dooley wrote:
> > On Tue, Feb 25, 2025 at 07:48:59AM +0800, Inochi Amaoto wrote:
> > > On Mon, Feb 24, 2025 at 06:54:51PM +0000, Conor Dooley wrote:
> > > > On Sat, Feb 22, 2025 at 08:34:10AM +0800, Inochi Amaoto wrote:
> > > > > On Fri, Feb 21, 2025 at 05:01:41PM +0000, Conor Dooley wrote:
> > > > > > On Fri, Feb 21, 2025 at 09:37:55AM +0800, Inochi Amaoto wrote:
> > > > > > > The pcie controller on the SG2044 is designware based with
> > > > > > > custom app registers.
> > > > > > > 
> > > > > > > Add binding document for SG2044 PCIe host controller.
> > > > > > > 
> > > > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > > > ---
> > > > > > >  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++++++++++++
> > > > > > >  1 file changed, 125 insertions(+)
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > 
> > > > > > > diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..040dabe905e0
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > @@ -0,0 +1,125 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > > > > > +
> > > > > > > +description: |+
> > > > > > > +  SG2044 SoC PCIe Root Complex controller is based on the Synopsys DesignWare
> > > > > > > +  PCIe IP and thus inherits all the common properties defined in
> > > > > > > +  snps,dw-pcie.yaml.
> > > > > > > +
> > > > > > > +allOf:
> > > > > > > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > > > > > > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    const: sophgo,sg2044-pcie
> > > > > > > +
> > > > > > > +  reg:
> > > > > > > +    items:
> > > > > > > +      - description: Data Bus Interface (DBI) registers
> > > > > > > +      - description: iATU registers
> > > > > > > +      - description: Config registers
> > > > > > > +      - description: Sophgo designed configuration registers
> > > > > > > +
> > > > > > > +  reg-names:
> > > > > > > +    items:
> > > > > > > +      - const: dbi
> > > > > > > +      - const: atu
> > > > > > > +      - const: config
> > > > > > > +      - const: app
> > > > > > > +
> > > > > > > +  clocks:
> > > > > > > +    items:
> > > > > > > +      - description: core clk
> > > > > > > +
> > > > > > > +  clock-names:
> > > > > > > +    items:
> > > > > > > +      - const: core
> > > > > > > +
> > > > > > > +  dma-coherent: true
> > > > > > 
> > > > > > Why's this here? RISC-V is dma-coherent by default, with dma-noncoherent
> > > > > > used to indicate systems/devices that are not.
> > > > > 
> > > > > The PCIe is dma coherent, but the SoC itself is marked as
> > > > > dma-noncoherent.
> > > > 
> > > > By "the SoC itself", do you mean that the bus that this device is on is
> > > > marked as dma-noncoherent? 
> > > 
> > > Yeah, I was told only PCIe device on SG2044 is dma coherent.
> > > The others are not.
> > > 
> > > > IMO, that should not be done if there are devices on it that are coherent.
> > > > 
> > > 
> > > It is OK for me. But I wonder how to handle the non coherent device
> > > in DT? Just Mark the bus coherent and mark all devices except the
> > > PCIe device non coherent?
> > 
> > Don't mark the bus anything (default is coherent) and mark the devices.
> 
> I think this is OK for me.
> 

In technical, I wonder a better way to "handle dma-noncoherent".
In the binding check, all devices with this property complains 

"Unevaluated properties are not allowed ('dma-noncoherent' was unexpected)"

It is a pain as at least 10 devices' binding need to be modified.
So I wonder whether there is a way to simplify this.

Regars,
Inochi
