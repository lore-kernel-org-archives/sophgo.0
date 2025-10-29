Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411792D6E71
	for <sophgo@lists.linux.dev>; Wed, 29 Oct 2025 00:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761699380; cv=none; b=p9qGlKkzimGuaf/49iYjGd3JeRmx1G9u4Ky/Zz7BRJb70kPuPNtaiEsHZ7ovQfZ8KqisH71ZQwQyfZMXRNx6wIU1/ooOVo1HyqKTjzAXmxuFrFFgxH0HvfjW94fr9ZMhE2+5d2MwIRhEE+qUslv8aVMiwAtfhGbvPpVXybi9ZkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761699380; c=relaxed/simple;
	bh=QLSCmp+DageXB/lbgTmmOjvd9XJyigv0R3q9m8lS9aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUqPPJ9xruChSXWbEXwIUz31BfrsU0BSK1o4UwbRuSMIRM5OmXIwkkHTQZxDo+4HuXTgyW4H/5FCpEgjlui+mJTZzsDn5EGZAzdvJuNQfhtcfXbee6dneeILi+YvJZ3FRIw8jikRmmlxT8OzibIweFUeVpJAiN7u9UCCdfR0ivU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqWT0oin; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqWT0oin"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b6cf30e5bbcso318628a12.0
        for <sophgo@lists.linux.dev>; Tue, 28 Oct 2025 17:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761699377; x=1762304177; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pezF2VK8RuTzI7DSs1mIZQ9VJH2IBGxZMtiOZQj+jXY=;
        b=HqWT0oinQ1Kmdu/RvRCakvKGSVtx+yFSWXJEgx/Hqi8D7pJbz12qa8RXkrPcrt4iwf
         daJ2CbEJlXy+4lSA9JNEL3IPaGLtfkcJUzuiv0/S1wGJ4/a/6WsJyvGv9+LKUb2K3Mdk
         rKsNBVkFIP6VASy1pk/iyflIqgrgWRN45QWkZi7sUt2QQhTQoXKfOnbcuZEyrLzSDqZ1
         FqqLnxLh7+IzRBc450k979sWOp+H6G84k3lyXrzAp042+p5In4IYvV0qnNhKw1e/k71w
         qkgmBaLqerTyBDD4lpLfozD2Vvics43jMQfrebiDIxtNxOFFcBPpwcNqecJIWRtey+ep
         SFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761699377; x=1762304177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pezF2VK8RuTzI7DSs1mIZQ9VJH2IBGxZMtiOZQj+jXY=;
        b=sdrRd8NMU5rJYQ/Z/u8ovyMyggYQ2cAlok/wYYNKKKKkCq5oGO8C5mlmADhhTyq/wo
         nkRhYzkD0tSYCOEJHDDnmAi/pLa3FXPkp9KFkAcw41o+uUIbjZHiOIKksW2uR3hmA76/
         bq1uqCPUb8nGTFB7DuvGs7AXqo/QwLjxo3Sw0A9kjvYxd1UKDIrfiHZelCcRIN0N/iGS
         H3kpEoFn/tJlZTJTyLFOkAmY8N84GrZvLJi6g0dBk2HYAkdlxryh7sHgSTO3B1P2cCWk
         dDqWWLW4OE5vqH0Qq7YdlJEmN77ldalqZx4yKGFdh7v4FWH8s5hhYi+bnfNoSsc7iLUc
         2NGA==
X-Forwarded-Encrypted: i=1; AJvYcCUS8miKsU5UpqCspidsdXKS3LtTJgBeVBSGrmgMGhECyBy76k2uC+00Z4ujds+Xi1u5D5240ik=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc2/hWIzTYGKKXJBDm9W4jo228MiF2/XxnywS5wkPNbqKEbjme
	d40/+h58G/pFQLbYnx+0X1lzLO05Yb23W0tNybCHSdrEafujksRW5fr0
X-Gm-Gg: ASbGncvVV5idhKULcMeuirQLCU7IkrYMDW11MIGiyom59pz3J9WAPcWfUkU8+V50ztm
	NRs8GnkMbsqjH7EhUG7piCUXlpf2mpdmBjywwUpsH24+QHUVzQ0Xmz7v/2uScaOUwgEUwwwpj1s
	rlbls8TrXkDXBOnoOB3yK6J8w3N1Klyo0NXCR21pYcas+op4hH65Y9cYS1nnUQCzD1goivcV6eE
	mircRgF+xDus4onAkSwYDNEi+w7D4/Pw22753xDp6IsCwaAeetWl8ttbR+z3C/V8ox0NUabfVLH
	AQHlh2PZujhdBUcFJcojfz9x2np7Btq3AN0AdKc9v8JGKnZZIsGIpfD4N2pnHp7gCPWRxjHTqxc
	nSRUkB8KTbynzCFmuMd+Uauy8aK3CMkfETpbfgRG2Tt/c6258i6muLVEEufJbpCFbk4JeWyimla
	s=
X-Google-Smtp-Source: AGHT+IHOlz4wCJmTj/zx16kQtcK3MAOTVFHMVAoc2+es1wdMlMVDqBf6QFztVnrfW0sWZY15JATnUg==
X-Received: by 2002:a17:903:41c2:b0:26c:4085:e3ef with SMTP id d9443c01a7336-294de9f7ae3mr12621045ad.21.1761699377445;
        Tue, 28 Oct 2025 17:56:17 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d230c5sm130960935ad.47.2025.10.28.17.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:56:17 -0700 (PDT)
Date: Wed, 29 Oct 2025 08:56:09 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy
 mode restriction
Message-ID: <rclupbdjyk67fee2lgf74k6tkf7mnjcxzwcjvyk2bohgpetqt5@toxvy3m5orm2>
References: <20251028003858.267040-1-inochiama@gmail.com>
 <20251028003858.267040-2-inochiama@gmail.com>
 <20251028-parka-proud-265e5b342b8e@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-parka-proud-265e5b342b8e@spud>

On Tue, Oct 28, 2025 at 07:22:37PM +0000, Conor Dooley wrote:
> On Tue, Oct 28, 2025 at 08:38:56AM +0800, Inochi Amaoto wrote:
> > As the ethernet controller of SG2044 and SG2042 only supports
> > RGMII phy. Add phy-mode property to restrict the value.
> > 
> > Also, since SG2042 has internal rx delay in its mac, make
> > only "rgmii-txid" and "rgmii-id" valid for phy-mode.
> 
> Should this have a fixes tag?
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 

Although I add a fixes tag to the driver, I am not sure whether the
binding requires it. But if it is required, I think it should be

Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac")

> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > index ce21979a2d9a..916ef8f4838a 100644
> > --- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > @@ -70,6 +70,26 @@ required:
> >  
> >  allOf:
> >    - $ref: snps,dwmac.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: sophgo,sg2042-dwmac
> > +    then:
> > +      properties:
> > +        phy-mode:
> > +          enum:
> > +            - rgmii-txid
> > +            - rgmii-id
> > +    else:
> > +      properties:
> > +        phy-mode:
> > +          enum:
> > +            - rgmii
> > +            - rgmii-rxid
> > +            - rgmii-txid
> > +            - rgmii-id
> > +
> >  
> >  unevaluatedProperties: false
> >  
> > -- 
> > 2.51.1
> > 


