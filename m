Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3FB1B0F23
	for <sophgo@lists.linux.dev>; Sun, 26 Oct 2025 09:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761472059; cv=none; b=RGJBccxQ4NOegvayYDVloH1sMyQUPkrjt7S6sSEhSFJAy2RkSzBFviCwaWhmCiGGZcU6xDPHyhSuwYxTUQJBZ/ns+7IlO9KcafVLlZFYwWCiRyzuhVb45I3Xfyr0QxfjL29lozIShaA6M0xc5rTD6jW0oyQJx6pGBqv23Jedo1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761472059; c=relaxed/simple;
	bh=qcYvH9Ptny0DNh/rzoeTiiivcuo/PRAup2s+HOtuycw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=piaxSCoGrqKHn+70s91eVGtrqVyJoPQt/gILEBrQrJ7MvxEhP4Yvud7BDPa0Zqch1inZkh4A7ikBMv6h+8gTkzsi/a3fUNCQT3XuLkLcmzlwoR5RwFZDFEbPYdx8ELb2lbewvxAZfxXObdFmobd0CI1pekFeQEkxVRMe8QlXvDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYpf+iea; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYpf+iea"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-339c9bf3492so4318309a91.2
        for <sophgo@lists.linux.dev>; Sun, 26 Oct 2025 02:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761472057; x=1762076857; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C91HvAQxwR7B1bhgRZq1EXx7cSrqAYa22OF4JmCWXOg=;
        b=AYpf+ieaUzpk9ONZLEbrbd/bikN/+L6hfQh9xrj/6iAJrMm9Fg3hyfwA7+TOY1EiX7
         3z6MiWCd5e1eDABgHrkwtKGeIATNL9fVartZJCjFiotlwT3joCIyGcr9e/fDWXNWcqn1
         idYLF72NW/rQoNwFeX4QHcs18o3decNntCH1LUnJb1JJk7hSyOiCjAbqBWQoaJtQ60Bh
         D/JdRdVMh1zmLT28CHrx9GqnLajMfS/CKrhUezFi2ehMXFshWrDYUcG5AAhT/WxWNavT
         MFI3lttsJNWrDUQaXG0GSiZ5Jz7yGUCHEhDwhJ1mmzYeQTqHvJhxhQUe0ollYpUJKDQx
         q9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761472057; x=1762076857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C91HvAQxwR7B1bhgRZq1EXx7cSrqAYa22OF4JmCWXOg=;
        b=ckqa4Z3Yuq6uhU/m3qmw36BMPRi200KLXHvVUJeJRyrph6Sek0ATJWMiqJSMA6mUlj
         kikxeLCT3ZUk010Q4RvyQ4uGslhJk3F7XJ5355kZ/iehlCTdK+xAs8viiCWXuX1/a90v
         DP7J3Z3JdErZhMcyMHWCy7ALBDCNpStPbofC+kmT8R4TpOiOv5O/73KHpli/NVfPHPrv
         akQg1I+UCeIddnzsrcW3gmSk18VdqHRGMWQGX09uomP8AR83Ggj/qubaEwTwt7lrvJdQ
         cq643wuitZlbZCWTPo+lgP8HyS7noJrEFfsSxi7anwbqqthPvF78Rj+9RYZzFrkLWuCZ
         gfbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIrU6kS6frXsBrmh5W024m0AspYtITfOnYhbsuJ6ZwqkzlfIPu9bFvTRC9xQ/eyFIDhZ5/cuQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy3OuS7xDUkcAr2XfgD+BZy3Ripl9AFMOV3DTNIqRWb2G+prkK
	Jfh7u1D2ecaHmuXudpBRiyfvorTaGaI+eQIXCw9px5q0vrtha4+Ruu0A
X-Gm-Gg: ASbGncv13kz0KyzL8D/YFWlTXrQBi+WTuiBejqZ0F9u4PJIejunHfvof7rUH79rR5q2
	2tyAdKtMVLCpIyxWuMFXVv/w5/qWWDgdlIFhHp4449EKcN8EipA01XONtLXcX7lABI+Te8+Nsya
	TnlzrfjKaThZaVHh2Ld0hnKLondKHfYR3mketAgc/fGXPdAqUEpBwnXgVTa1VxkIC9b+lAnspkY
	hWOvBMToqV+zyy2sosgbvfmDKtnPL7O0avsfypIGRZ3H43iYfSqvEt7KMXBvV+/KwG0WeR6D6ZA
	PWGQMwpfVdxQ106se3AH+NeD2wZk+wQyzpEkuNg8vL15fw9LTIu96foZyeAvXvRFqAPJKVMQmCt
	DtukxWgyiB9hFHSMlBpKhA2YR7vg5LuiNg+9R/+w3rGW9z5RHZubeX7N66FlzmTN1BvjQUq/gF1
	iI
X-Google-Smtp-Source: AGHT+IGBtA0xQBuD4uogDvjIhQK7Qhr4z8CGsMy+ULWwP1OFvRuXkY87KrHlWUr9Efn6GjJx6fmMdw==
X-Received: by 2002:a17:90b:3e43:b0:32e:7270:9499 with SMTP id 98e67ed59e1d1-33bcec297c9mr40598008a91.0.1761472056734;
        Sun, 26 Oct 2025 02:47:36 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed807dbasm4802556a91.12.2025.10.26.02.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 02:47:36 -0700 (PDT)
Date: Sun, 26 Oct 2025 17:47:32 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <ugmphokne6ssc7ou7apvbldxg7xxk24wp5jrzdasjiplnu6gfy@ebbuxnjqlsw4>
References: <20251024030528.25511-1-looong.bin@gmail.com>
 <20251024030528.25511-2-looong.bin@gmail.com>
 <20251024-hangout-designing-33e96c0d35fc@spud>
 <oymxspgopaqja63nipufgzn6kpobkdopemfaw3azhom3ikvk5f@e7cg4lq64j2o>
 <20251025-shakable-jujitsu-3a5e9c8895a5@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251025-shakable-jujitsu-3a5e9c8895a5@spud>

On Sat, Oct 25, 2025 at 01:44:00PM +0100, Conor Dooley wrote:
> On Sat, Oct 25, 2025 at 10:27:13AM +0800, Longbin Li wrote:
> > On Fri, Oct 24, 2025 at 05:46:03PM +0100, Conor Dooley wrote:
> > 
> > > > ...
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - const: sophgo,cv1800b-top-syscon
> > > > +          - const: syscon
> > > > +          - const: simple-mfd
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  "#address-cells":
> > > > +    const: 1
> > > > +
> > > > +  "#size-cells":
> > > > +    const: 1
> > > > +
> > > > +  ranges: true
> > > 
> > > Do you actually use ranges?
> > > 

Actually, I do not use it.
I added it following Rob's suggestion in
https://lore.kernel.org/all/20251015134144.GA3265377-robh@kernel.org/.
Should I drop it or not?

> > > > +patternProperties:
> > > > +  "dma-router@[0-9a-f]+$":
> > > 
> > > Do these actually appear at variable addresses, or is it always 48 for
> > > the phy and 53 for the dma router?
> > > 
> > > > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> > > > +    unevaluatedProperties: false
> > > > +
> > > > +  "phy@[0-9a-f]+$":
> > > > +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> > > > +    unevaluatedProperties: false
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - "#address-cells"
> > > > +  - "#size-cells"
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/clock/sophgo,cv1800.h>
> > > > +
> > > > +    syscon@3000000 {
> > > > +      compatible = "sophgo,cv1800b-top-syscon", "syscon", "simple-mfd";
> > > > +      reg = <0x03000000 0x1000>;
> > > > +      #address-cells = <1>;
> > > > +      #size-cells = <1>;
> > > > +
> > > > +      usbphy: phy@48 {
> > > 
> > > Drop the labels off of these two, since they're unused in the example.
> > > 
> > 
> > Hi,
> > 
> > Thanks for the review.
> > 
> > There are a couple of different opinions here.
> > Could you please help confirm which approach is preferred here?
> > 
> > This is Rob's reply:
> > https://lore.kernel.org/all/20251015134144.GA3265377-robh@kernel.org/
> 
> I don't think that Rob and I disgree about the example, having child
> nodes is good, having the label on them is what I don't want.
> 
> Re: the child node patterns, I was not looking for a return to what Rob
> didn't like, but rather a move to just making them normal properties
> rather than a pattern, if there's only one possible address.

Thanks!
I will drop the lable and move the child nodes to normal properties.
