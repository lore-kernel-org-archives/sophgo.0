Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BD92750F8
	for <sophgo@lists.linux.dev>; Mon, 19 May 2025 11:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747655040; cv=none; b=g9RA9nPYYvNSeaHQLs38mTVnfdXk8TFNlvJ0k2DRbel7WV9m99lmrcdF0EW+uJdIOMKndKfwr1AI4pOz1kJUE5WqN8LNa+yxfjtQfBtEw2mqvkV36eA2MAgj9bga4laf9e2uyWHgvHX0MBjnCVndh/AqLf2A5j/D7yxGEAgYzCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747655040; c=relaxed/simple;
	bh=MwH0W3o9aFeqh/fMQ2QtF4mamhL6Gz4btfQV+sSYBk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWVKIaq6QOykM1wznPlXchyC7+VAm9rKrbNd9ASyiw3WE2jsztNTKzYjUEgNyGAWzGu9UUcHmgH6a5/A5U1/cFAcjv0gNLJbW8DOi8w/o/rNpbDeqLG194DwmWdsec4WvhgyW4EfFRsNw88xF0IDzC4tv+fE03wdj/k/SyerXj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpcBx4RK; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpcBx4RK"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f8ce89468cso15172026d6.3
        for <sophgo@lists.linux.dev>; Mon, 19 May 2025 04:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747655037; x=1748259837; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DdHsq5COThnaz/kT2PepDjGRRqibq5HBjdI+te70JDw=;
        b=ZpcBx4RKRO3GyS1iqp6S5P8u1X/ZlnY9G6uXn48eCBMlcwS5nO2T3Y78vSuFYwDEpP
         t8cqhUyNdZFqpgSzS7mmOsGhMDDFRV2F222CoqbczkwcDfuvFjzneEphJwO1Tsgca+Aj
         xahrSVh6BHlgK/Rmk8i8WXrkWO/QCe10sbZyG+rEDFKhnglKrnMng/+RIovG5F5aptvp
         ekhQOya+8r/zabJznVZohfeUlLtdENQ4G7n5T0Q4Gdss3wqSOO1AjDHATAUA08Tp+WDQ
         o2LqZdttC/csZRoJIXPpegNDGTjMjvTjQvL52HXzR0AoYkqDn9TVuCYkH/3oNSMTinD3
         bxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747655037; x=1748259837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdHsq5COThnaz/kT2PepDjGRRqibq5HBjdI+te70JDw=;
        b=SG2JxjPy9FDKHAS4T0Thq+mcoNLmMhRojMbVnSCtwdyHbjgiadM8B+PmBHtH+HB3yj
         kF/l4+iZE0DUob8i5+cneAF/b9z15L4z2eW8flSan/ZbA1XdAWvkFSnDNT2ZCs5IzXsK
         JkEHTsOirjQp2PgC2RYjw0olwMLkorkPov2GqRp2Bvaqdz0yesU81nY5EJ9Eq+edKdX9
         9vx26zb12iEM+yQwzY9akmgekDKyuy2cU/VG2ZnBjEzHSkZQ7CEwhEk3SniQnT7fiLkZ
         Nxn7kiNpk47e6P+szZQwQ9O1KO+8Dl3igI/PJEknTL0dC/lWYiU0q/jw8YHVVupiBsKv
         Cqiw==
X-Forwarded-Encrypted: i=1; AJvYcCXAfcTgMlaiDSnH5DxlWTi8YBLNujHJeDweZnRcs9nO2GY6bVILZ6+wHKZztd7mMax8nuejUvs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVXN4cNPC23FAutooz3iit+GRZOYLHYn8Py2DYemLBFJa5hxPc
	h1WgpXqvH3FtvuO0vm1HZQKTLHl4/3ipyVrz0ccQjOBrPYJ4XFiZnxIr
X-Gm-Gg: ASbGnctkrIJqz+iLoPyWcvw+n7mvl9UutNHW1phSaqnlYEbzLf4FaNdTYE9M48REd/R
	7poCZNwXakDbzJUrltga/XhfIW5ue4wRS+kg74OiEnX3FAwXmF5F6jN5tX3LVK4FdBr5YrrWxdq
	xEDhnakqQlNZDxjJXuW2foBsM/wuo71/Nms59ysTTPFS1ecCuupE2GCTpiEbJQMa+STQRZ+jOsn
	Vrft02DbMVAT4l8QvVsJQweoLZFJUpKzu9tzsyTCIk8v3Jz+kAw87yYkh7w8rqEGVaz04AaFjOX
	OBsOfk1QTHnoeGU8bXsNVuh1AcO8q/mev7Ix1g==
X-Google-Smtp-Source: AGHT+IHzi+wH4LTGbbgm7Y4TjS58PZ5Nah+7v2/J250yJ8XpMnfpx1miscgVUqmQCndfLGxyKsFvKA==
X-Received: by 2002:a05:6214:2344:b0:6f0:e2d3:66bb with SMTP id 6a1803df08f44-6f8b0887e10mr173576876d6.43.1747655037154;
        Mon, 19 May 2025 04:43:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f8b097a0absm55522516d6.100.2025.05.19.04.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 04:43:56 -0700 (PDT)
Date: Mon, 19 May 2025 19:43:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Niklas Cassel <cassel@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Shradha Todi <shradha.t@samsung.com>, Thippeswamy Havalige <thippeswamy.havalige@amd.com>, 
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 0/2] riscv: sophgo Add PCIe support to Sophgo SG2044
 SoC
Message-ID: <77tip2z2mmuucsi4ackwubfdbyzgg2soaosmvbyrfl3iwrmmp3@icjunp4bsske>
References: <20250504004420.202685-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504004420.202685-1-inochiama@gmail.com>

On Sun, May 04, 2025 at 08:44:17AM +0800, Inochi Amaoto wrote:
> Sophgo's SG2044 SoC uses Synopsys Designware PCIe core
> to implement RC mode.
> 
> For legacy interrupt, the PCIe controller on SG2044 implement
> its own legacy interrupt controller. For MSI/MSI-X, it use an
> external interrupt controller to handle.
> 
> The external MSI interrupt controller patch can be found on [1].
> As SG2044 needs a mirror change to support the way to send MSI
> message and different irq number.
> 
> [1] https://lore.kernel.org/all/20250413224922.69719-1-inochiama@gmail.com
> 
> Changed from v2:
> - https://lore.kernel.org/all/20250304071239.352486-1-inochiama@gmail.com
> 1. patch 1: remove "|+" for description
> 2. patch 1: apply Rob's tag
> 3. patch 2: remove empty irq_eoi and use handle_level_irq as the right
> 	    irq handle function.
> 
> Changed from v1:
> - https://lore.kernel.org/all/20250221013758.370936-1-inochiama@gmail.com
> 1. patch 1: remove dma-coherent property
> 2. patch 2: remove unused reset
> 3. patch 2: fix Kconfig menu title and reorder the entry
> 4. patch 2: use FIELD_GET/FIELD_PREP to simplify the code.
> 5. patch 2: rename the irq handle function to match the irq_chip name
> 
> Inochi Amaoto (2):
>   dt-bindings: pci: Add Sophgo SG2044 PCIe host
>   PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
> 
>  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 122 +++++++++
>  drivers/pci/controller/dwc/Kconfig            |  10 +
>  drivers/pci/controller/dwc/Makefile           |   1 +
>  drivers/pci/controller/dwc/pcie-dw-sophgo.c   | 258 ++++++++++++++++++
>  4 files changed, 391 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
>  create mode 100644 drivers/pci/controller/dwc/pcie-dw-sophgo.c
> 
> --
> 2.49.0
> 

It is a long time for this series without any comment, I wonder
that this patch could be picked for 6.16?

Regard,
Inochi
