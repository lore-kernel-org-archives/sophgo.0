Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827BD2A1BB
	for <sophgo@lists.linux.dev>; Tue,  4 Mar 2025 00:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741048639; cv=none; b=QKTW01m3FxDZFbWfsd48ipWTeFQIBo2uwDlRfml+GNZwYsYbFsdKDgdRkiHiNhL5a/Z7zJ8D/fIqRISv1Vef8kOvhkesJI6OZZ6uHvnhg+CE5FRzxvoeXaWqrxk2rXZVdyeu96Ez2o4U1X+xeVEqtnYrlQXH4eii6pS0OxXYCe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741048639; c=relaxed/simple;
	bh=8E9k0KWOxAFwiAkcfWmCZQqGYmRe+dEJGe7JMw88EFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MY3i1U+jolMwC7Vlkbg4Fem9EDHEOu7P3SK2ALlW7uMCcDk2Jn8vYctII03klJnznEkcUvCp7ytrSFmBWycohWM0rWPNlcoSvlE3r8CIkU3+18rwoSnZvOU9xAHAiwWHNRqa6mpE2UTKgYzYA/rdc6FumX1IztVTLFpsebkDIMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OL9X+oGV; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OL9X+oGV"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6dd420f82e2so70717156d6.1
        for <sophgo@lists.linux.dev>; Mon, 03 Mar 2025 16:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741048636; x=1741653436; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jkdclXu2BjEaGsp2gaaSDivFgOqo2Ctx5xrHZRDqZfs=;
        b=OL9X+oGVD/7cNE/2VAq0iUMqO5oInxqJSaCePkFp0gwbjfdigyCmk6GuG0SC1WlamQ
         dyNYC3g+d79zBgA+BcOLr1omf2ULFWrs+Nsea4TYvTj4RetODXwqsTSTlcOGqAf4fPV/
         hvf6yVs3sLz9ZXiKfN/dMgqyNE7jID3EP6wOJonqisc/VHlkRUOUyb1rO72nNe7OnwKf
         oZAGzonaGIQlJJFaZ2NMz4XStL+tdVFSO9wPkMtQ4zfxeeQJvpSdnRvOWC9UR9uwoTiQ
         j4cPc5rgvQGq9M+VtrgUTKtrbvbmcGWfGBav/kcIdUEInUSoj/qmHDZWOsn5ap26Zk14
         YA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741048636; x=1741653436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkdclXu2BjEaGsp2gaaSDivFgOqo2Ctx5xrHZRDqZfs=;
        b=YuQrcLIo1yhmDi79oDm8Ic1haJTYmnZSCLKfbfgFZy4DEmbMpLc7wt23aTIdiNqStV
         niaZ1DrKLJy3P3/hq0Tx4nVSS0I53na158YXnHdYchSW7auzHloEmAPGpFkpbosyFnjb
         i7r2B0rT9ROtz6scqdp0ZrPenQMAosTOlSbHP/l9/94qNG+dnsWDDP4wbh+KxVPPZHis
         fBE4TvIl3xvK+yorGIdfZVZWndNbnyEIqYZxgGY0SZ0uLFF5u4ZPpKLd6HAc4S3RZ+7N
         P+mxs7KPOI5/zWXT4jdXQY7ggJYHbBkDOm1Xg4aorGBkwxd5K2VO4BIureTHN66SdoHn
         rUNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+E709EZBfHXy4wAdymplFPdo0JdttyvIR9x0PQGKNGQkPm5+LetqsPgPYkhBavLcoz/Vy0K0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/3ptxY56eq6aciWlH+OPtv09n3m+4FG+R6khuuqkN+dhU8CYM
	6Z82UiQfDU5G53NxkMh1+vafDQr3iNI6pwgrsICIdtsMrIe4SNUw
X-Gm-Gg: ASbGncu8A9x2+X9tLtXrb5Kp99IFr0/zAd+JlcXkhpHl0NpsP0U7oOuvsK4G+sN7xsX
	PNicg5f4SMt4Al8j0KaMLtc6GS6ARpB/5Mfe8fTkj0Ce1hr7M/kEdm6HZVxx6AE8wEnr3e84Rft
	8/Hu1FPuf80YOkPbqNxNCgIPCTpLOTW62/jiuIQInjdac1iN5/9idEX5FAW6gYyyZRr2ztZU1oI
	AeOdiaMcf61NDNnphECmpv6w52TtZQciWP53VS4+MX3C+t65Xghcno9t5km0LXwZMBz+GxSXXro
	K4DS9q43Ak7ojDjLRzHZ
X-Google-Smtp-Source: AGHT+IGQbwXba2MFwiNePHYnLnKYFfggC79zX3LMmSKQG33QbOsKtz/15wOdDccKw9clJ6yC4X6TZw==
X-Received: by 2002:ad4:5f07:0:b0:6e6:5caa:e5d with SMTP id 6a1803df08f44-6e8a0c8038dmr239929856d6.4.1741048636326;
        Mon, 03 Mar 2025 16:37:16 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8976da321sm59229366d6.99.2025.03.03.16.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 16:37:15 -0800 (PST)
Date: Tue, 4 Mar 2025 08:36:47 +0800
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
Message-ID: <pgyynmrrtxi2jlrgstcbxh4f2wuxhyulw5gmssjw6rs44nix5y@msi25bjahz37>
References: <20250221013758.370936-2-inochiama@gmail.com>
 <20250221-cavalier-cramp-6235d4348013@spud>
 <2egxw3r63cbsygpwqaltp4jjlkuwoh4rkwpgv4haj4sgz5sked@vkotadyk4g6y>
 <20250224-enable-progress-e3a47fdb625c@spud>
 <7ht3djv7zgrbkcvmdg6tp62nmxytlxzhaprsuvyeshyojhochn@ignvymxb3vfa>
 <20250225-lapel-unhappy-9e7978e270e4@spud>
 <ynefy5x672dlhctjzyhkitxoihuucxxki3xqvpimwpcedpfl2u@lmklah5egof4>
 <pbj22qvat76t74nppabekvyncc4ptt6wede4q6wfygbrzcj3ag@ruvt26eqiybu>
 <je4falvfemkemlvdfzdmgc7jx2gz6grpbmo6hwtpedjm7xi2gk@jr4frv3tn3l5>
 <20250303-aground-snitch-40d6dfe95238@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-aground-snitch-40d6dfe95238@spud>

On Mon, Mar 03, 2025 at 05:04:28PM +0000, Conor Dooley wrote:
> On Fri, Feb 28, 2025 at 05:20:28PM +0800, Inochi Amaoto wrote:
> > On Fri, Feb 28, 2025 at 04:46:22PM +0800, Inochi Amaoto wrote:
> > > On Fri, Feb 28, 2025 at 02:34:00PM +0800, Inochi Amaoto wrote:
> > > > On Tue, Feb 25, 2025 at 11:35:23PM +0000, Conor Dooley wrote:
> > > > > On Tue, Feb 25, 2025 at 07:48:59AM +0800, Inochi Amaoto wrote:
> > > > > > On Mon, Feb 24, 2025 at 06:54:51PM +0000, Conor Dooley wrote:
> > > > > > > On Sat, Feb 22, 2025 at 08:34:10AM +0800, Inochi Amaoto wrote:
> > > > > > > > On Fri, Feb 21, 2025 at 05:01:41PM +0000, Conor Dooley wrote:
> > > > > > > > > On Fri, Feb 21, 2025 at 09:37:55AM +0800, Inochi Amaoto wrote:
> > > > > > > > > > The pcie controller on the SG2044 is designware based with
> > > > > > > > > > custom app registers.
> > > > > > > > > > 
> > > > > > > > > > Add binding document for SG2044 PCIe host controller.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > > > > > > ---
> > > > > > > > > >  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++++++++++++
> > > > > > > > > >  1 file changed, 125 insertions(+)
> > > > > > > > > >  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > > > > 
> > > > > > > > > > diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > > > > new file mode 100644
> > > > > > > > > > index 000000000000..040dabe905e0
> > > > > > > > > > --- /dev/null
> > > > > > > > > > +++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > > > > @@ -0,0 +1,125 @@
> > > > > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > > > > +%YAML 1.2
> > > > > > > > > > +---
> > > > > > > > > > +$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
> > > > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > > > +
> > > > > > > > > > +title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
> > > > > > > > > > +
> > > > > > > > > > +maintainers:
> > > > > > > > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > > > > > > > > +
> > > > > > > > > > +description: |+
> > > > > > > > > > +  SG2044 SoC PCIe Root Complex controller is based on the Synopsys DesignWare
> > > > > > > > > > +  PCIe IP and thus inherits all the common properties defined in
> > > > > > > > > > +  snps,dw-pcie.yaml.
> > > > > > > > > > +
> > > > > > > > > > +allOf:
> > > > > > > > > > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > > > > > > > > > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > > > > > > > > > +
> > > > > > > > > > +properties:
> > > > > > > > > > +  compatible:
> > > > > > > > > > +    const: sophgo,sg2044-pcie
> > > > > > > > > > +
> > > > > > > > > > +  reg:
> > > > > > > > > > +    items:
> > > > > > > > > > +      - description: Data Bus Interface (DBI) registers
> > > > > > > > > > +      - description: iATU registers
> > > > > > > > > > +      - description: Config registers
> > > > > > > > > > +      - description: Sophgo designed configuration registers
> > > > > > > > > > +
> > > > > > > > > > +  reg-names:
> > > > > > > > > > +    items:
> > > > > > > > > > +      - const: dbi
> > > > > > > > > > +      - const: atu
> > > > > > > > > > +      - const: config
> > > > > > > > > > +      - const: app
> > > > > > > > > > +
> > > > > > > > > > +  clocks:
> > > > > > > > > > +    items:
> > > > > > > > > > +      - description: core clk
> > > > > > > > > > +
> > > > > > > > > > +  clock-names:
> > > > > > > > > > +    items:
> > > > > > > > > > +      - const: core
> > > > > > > > > > +
> > > > > > > > > > +  dma-coherent: true
> > > > > > > > > 
> > > > > > > > > Why's this here? RISC-V is dma-coherent by default, with dma-noncoherent
> > > > > > > > > used to indicate systems/devices that are not.
> > > > > > > > 
> > > > > > > > The PCIe is dma coherent, but the SoC itself is marked as
> > > > > > > > dma-noncoherent.
> > > > > > > 
> > > > > > > By "the SoC itself", do you mean that the bus that this device is on is
> > > > > > > marked as dma-noncoherent? 
> > > > > > 
> > > > > > Yeah, I was told only PCIe device on SG2044 is dma coherent.
> > > > > > The others are not.
> > > > > > 
> > > > > > > IMO, that should not be done if there are devices on it that are coherent.
> > > > > > > 
> > > > > > 
> > > > > > It is OK for me. But I wonder how to handle the non coherent device
> > > > > > in DT? Just Mark the bus coherent and mark all devices except the
> > > > > > PCIe device non coherent?
> > > > > 
> > > > > Don't mark the bus anything (default is coherent) and mark the devices.
> > > > 
> > > > I think this is OK for me.
> > > > 
> > > 
> > > In technical, I wonder a better way to "handle dma-noncoherent".
> > > In the binding check, all devices with this property complains 
> > > 
> > > "Unevaluated properties are not allowed ('dma-noncoherent' was unexpected)"
> > > 
> > 
> > > It is a pain as at least 10 devices' binding need to be modified.
> > > So I wonder whether there is a way to simplify this.
> > > 
> > 
> > Ignore this, I misunderstood the dma device. it seems like 
> > only dmac and eth needs it.
> 
> Nah, not gonna ignore it ;) You do make a valid point about it being
> painful, but given you mention a different master for the pci device,
> having two different soc@<foo> nodes sounds like it might make sense.
> One marked dma-noncoherent w/ the existing devices and one that is
> unmarked (since that's default) to represent the master than pci is on?

Yeah, That make sense. I think it serves as a better way for SG2044.

Regards,
Inochi
