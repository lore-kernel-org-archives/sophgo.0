Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E50320C47A
	for <sophgo@lists.linux.dev>; Mon, 24 Feb 2025 23:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740440960; cv=none; b=mLHit+O7efTJKVbmFsSFE8CaWHTVwnJmdl0WF8mVAWz6clTgfMzpm3pamyShMw2Rjm+YoY+J08HxpuYwlB3FR6NCkh3x/dm10V4mQPJUr63V4anzAz5D+uiHt4pcPGSaHRLNlfqbjkQlKF9KbtJYaeBFL2jEDCEaiuidG0onrZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740440960; c=relaxed/simple;
	bh=P24KtMme6o5jmQIafJUkN2Tyf2Be/sw+r0h3G0HHz+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKMJxAUsOVAmHbsfw7jCRl6UvJIKh5ll6gt8aUCdN+aUeBndbz1E6qdew4XixCNPfkcP3+MMjG1+ZrAWow7TdWreNsLGmezPIOVMjbnMVRqXJbeSomD6qG0b1rAvoZd+DS7fsnKOWBYFRSLe6CwkA4dBJhr8/3HUf2SVSHc6kNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KT9aFH1k; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KT9aFH1k"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c0c5682c41so339929185a.2
        for <sophgo@lists.linux.dev>; Mon, 24 Feb 2025 15:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740440958; x=1741045758; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EpFPdCKOOzYGkmZbz8KYm8xS5nu6X4mus1CxiMy3hoo=;
        b=KT9aFH1kscJcPvsmN9Br9RDchujPE6oO0ybXegzR19rMH/Gxt41A1D3qVTqazSl3ky
         ku0tQ0qS3t6gwPJSHiBcLdpZ+7o5U2l8MLw2CgMmSxcyj/oq7KzKcB1+Z3NwD5J5lcO3
         plm98xGxrk/e6+gm1hzYCR40BnYOqg/q3qhoYpP63Gsl4Ot6lq0FS35ezF/IJrwsmSCh
         CBF/H8r/sFMii052GPbo0ZVGTkHnoNvLUQgO+jQjq6LHHsuaDDtYI99nWAQB0tcVUvRG
         ybsAnVAUiRzw/6Gy8b+hAtWM6N6L1K1QjyVxttQZEwcByTyMHQKvKDlfu0c96XY9am3J
         CvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740440958; x=1741045758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpFPdCKOOzYGkmZbz8KYm8xS5nu6X4mus1CxiMy3hoo=;
        b=TAj9kacGPOQESPnopGSv+B0j9V1nP9GFdZZcwAXk2HN0ZFEY6l3XkmQOWojEjrOyK4
         eu6lhpsJ1hJ+wDqOoRN5rG/2eeDmATWIS2FqiWN0EBkcvqFowpZHHibtpcbD10CgjBBj
         NQC5y20JpIwsZckJkB1r9cg3FyJtboL64ycjoeYpi5VtRq3lqodY6dulmXXFH1tj1kRo
         UFpsKw6BgcjUyCqibEdvxV8MQOeyUSvD4hpYztBWF/rGiSVMnYSV+CB/YNddG5qB1IWY
         KBB5iMvH1VqfaL9Mv3GaqwB4p0YxgXjJrDUVsQdt4vqKx9Yq4q2hTIL6/55gGDr7U1FB
         cURA==
X-Forwarded-Encrypted: i=1; AJvYcCWped4/rXbJoelnxAL1370bCeqzBbnr0TnEi260lHxtr1Dk8QoOe9p4GzeFdTTwjEJmGRGGw9w=@lists.linux.dev
X-Gm-Message-State: AOJu0YycKMHFjChswiJEFxODLY3m6Z2hJ080EnL+UBD4oGb3tbIz/+zY
	wIpI97IzDWHeFloAqWtaEWHxiRq9Exa2AZkvwvCvu/vbDBImWGU2
X-Gm-Gg: ASbGncuQRll+lY5cumw8CZ3LScKmEcZURMCftGitl83bReUDYksXY/bEldmaXiL7Arz
	ckSZeimrDUiIhjxBr9kLeQmGQPg48CfESWcRrrz9MhrkYFJSsxvBdN8B6VKprW/aiypushZTWJd
	U+g7fzk2hPnk+er2UCLiGDi8ToRVCA8gqMt3kuO+Ysp3R8o0j3RSIkqZzKI8joH/K10arxzb3tF
	N1Z5wHlLKvboUgnrkkyUOGCqV9DvhNnGRrpodqGkIfeXvL+1+PsZOpVa4+0p10K1/+bPp/4rvva
	vQ==
X-Google-Smtp-Source: AGHT+IEb4O7bqSxdD9PsVnrPdjDODk+0ZRgqEenGZhUD0ccL6Bcsf2l6qeul83BCvsR9I1s84A5TWw==
X-Received: by 2002:a05:620a:1a1c:b0:7c0:c024:af with SMTP id af79cd13be357-7c0cf8e622cmr1919031285a.26.1740440957990;
        Mon, 24 Feb 2025 15:49:17 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c23c2c514asm36530985a.64.2025.02.24.15.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 15:49:17 -0800 (PST)
Date: Tue, 25 Feb 2025 07:48:59 +0800
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
Message-ID: <7ht3djv7zgrbkcvmdg6tp62nmxytlxzhaprsuvyeshyojhochn@ignvymxb3vfa>
References: <20250221013758.370936-1-inochiama@gmail.com>
 <20250221013758.370936-2-inochiama@gmail.com>
 <20250221-cavalier-cramp-6235d4348013@spud>
 <2egxw3r63cbsygpwqaltp4jjlkuwoh4rkwpgv4haj4sgz5sked@vkotadyk4g6y>
 <20250224-enable-progress-e3a47fdb625c@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-enable-progress-e3a47fdb625c@spud>

On Mon, Feb 24, 2025 at 06:54:51PM +0000, Conor Dooley wrote:
> On Sat, Feb 22, 2025 at 08:34:10AM +0800, Inochi Amaoto wrote:
> > On Fri, Feb 21, 2025 at 05:01:41PM +0000, Conor Dooley wrote:
> > > On Fri, Feb 21, 2025 at 09:37:55AM +0800, Inochi Amaoto wrote:
> > > > The pcie controller on the SG2044 is designware based with
> > > > custom app registers.
> > > > 
> > > > Add binding document for SG2044 PCIe host controller.
> > > > 
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > ---
> > > >  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++++++++++++
> > > >  1 file changed, 125 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > new file mode 100644
> > > > index 000000000000..040dabe905e0
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > @@ -0,0 +1,125 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
> > > > +
> > > > +maintainers:
> > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > > +
> > > > +description: |+
> > > > +  SG2044 SoC PCIe Root Complex controller is based on the Synopsys DesignWare
> > > > +  PCIe IP and thus inherits all the common properties defined in
> > > > +  snps,dw-pcie.yaml.
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > > > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: sophgo,sg2044-pcie
> > > > +
> > > > +  reg:
> > > > +    items:
> > > > +      - description: Data Bus Interface (DBI) registers
> > > > +      - description: iATU registers
> > > > +      - description: Config registers
> > > > +      - description: Sophgo designed configuration registers
> > > > +
> > > > +  reg-names:
> > > > +    items:
> > > > +      - const: dbi
> > > > +      - const: atu
> > > > +      - const: config
> > > > +      - const: app
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: core clk
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: core
> > > > +
> > > > +  dma-coherent: true
> > > 
> > > Why's this here? RISC-V is dma-coherent by default, with dma-noncoherent
> > > used to indicate systems/devices that are not.
> > 
> > The PCIe is dma coherent, but the SoC itself is marked as
> > dma-noncoherent.
> 
> By "the SoC itself", do you mean that the bus that this device is on is
> marked as dma-noncoherent? 

Yeah, I was told only PCIe device on SG2044 is dma coherent.
The others are not.

> IMO, that should not be done if there are devices on it that are coherent.
> 

It is OK for me. But I wonder how to handle the non coherent device
in DT? Just Mark the bus coherent and mark all devices except the
PCIe device non coherent?

Regards,
Inochi
