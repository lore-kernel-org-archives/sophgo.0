Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B3B1C8610
	for <sophgo@lists.linux.dev>; Wed,  5 Mar 2025 05:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741151928; cv=none; b=KADcYzki2XM6rEWPquin+Oj/LGrHChjg5YZDb6Gm9EgDbHJaV8+zv8aA89+av1r/cZ6bQ6EAa81Xn50iSCWQ64Y3CoGAOCvgM8PH4hzyE3yaYjraeL/HmHHg4IhGMQB9IfHL0AeqixLzWRyoGhdXna9LlMYRTfllfHJg7FHvczM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741151928; c=relaxed/simple;
	bh=kC87oeOMtl04lb5WrpnzUnxVnwsFKi0GNcv5vmYteyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFq0O06BrJKVbx/UTh3SQX3w2lOBRPA54ecxewiJej5JrLMeGmVTtlOEivFMF1EKj0vE4awGq9fSh3fOCtmzQNfA3gm0DiNWAReYGiNfUEq3+0KfDmkcAiVF8oe1rHCQhW4Ay1PH/zZPHjl32udNpfoXn8le68soXFDdIo4nX98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gv+yQmER; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gv+yQmER"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47208e35f9cso74221351cf.3
        for <sophgo@lists.linux.dev>; Tue, 04 Mar 2025 21:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741151925; x=1741756725; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1P3+iYzJ+YpQ9FI2rKYP4r/ocmp23KFw2lq/RJsTz1Y=;
        b=Gv+yQmERpEenEDH0f0/N5lA8CZo7mezHfRpisigdyWKoypPaX650F3JTHpmeUFH6Q8
         9GdwDOChrVq5EA6GpI5GcHHLNIBrNbV6zK6qS/CN517L2uAnoGcgl4f35tPjfWXdTeRt
         nRQIbpbN9vdposYmNVv8enlZsYOXvrg0sNz/F8xHhEDbe0A4gSJOxIrb3682vB2D/5dZ
         oEAY+jEgu2q8bITQM9P3w8+pAd81nIa0UKj/SZXEy3l/XeZR8wgqoF5WkU6KKgfZf83e
         zqE9z3FUozD3EDzEdre/fRTJgnoLU8AymYU4BVyqV3AgbMunPLWa6293ziDoIUG98Lqg
         TXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741151925; x=1741756725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1P3+iYzJ+YpQ9FI2rKYP4r/ocmp23KFw2lq/RJsTz1Y=;
        b=IlRsc3/IhC+Wt8+h+fffQdm5ssMik4hhIiWUxGk9uxaMvyiAs6VZdSGgP93IQNhlGb
         Mb/5D01c3hv4+x7xCXsrVrdR5AP7RKQrMcGNxU/6VDvRNjjTRJZQOHew+SUPUGEcpW7Z
         z6VOvjf7hF0ZfWIS794xk0J/86/GyGREQI+XbOHeWQA3leS0xGvYH8v0HarxJPhjNmrz
         QsiLlboD901TuITto6wGc93K7z1WYdI7dTFPtAttpPDCrwAucLxiDbaXeTesOumk1V0O
         gjSF/wkD5O+z5vUh7nC5x68JDj1xM1UqOyv2tNKLNNIpaMMaFnoYIAXPa6Crcqf7Y7Wy
         RqUA==
X-Forwarded-Encrypted: i=1; AJvYcCU01cLETE/fMQ1KRwdMgQEXex02hVBcO/cUG1zlRhboFDlZGbjQzHlbTnmU4gRJlq3mafqjDDI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9e0H05e2g49bpv0wGllClOpWDIv3whgccjxLhCchPXu6lmsWz
	dvtUoaLLrJv7wx7vHIXc5Dv0hlhHsnCKbvSprATPnhJMGsVdiCub
X-Gm-Gg: ASbGncs4eEcAcjIKxd7wtQzog9YLdQfOSMtWuqspgry34ryMov4VL3FhGdz57kukLVc
	w0adKZzPYzjfCJoeMzcpEQiABnyv8MRPKMBajX64UIGcruH4NoDhowj3gimXyMBNh0SGR/CwvNn
	V8J4E1T7iRmSKTbpTJHqgEbvrn0Nmer+sz4PCF0UEMfJrQ4v3DaRCdJlQL09O9aTiBoF2KrDh0o
	H8Cyk6mExVI186LyKs6ZUAmWY9OYi+91tZlXo7WC508PDZCImubd49GDvqLeMXNVyDp6A+lBBNM
	JZb78EsCU8Choe7wsWoZ
X-Google-Smtp-Source: AGHT+IEL+SRXWaxNqoLf2fRqsU51Nuz6KF+mx2D44cet7M+NDkMLl3pM/VonNiECdPjeLo+ew7jsDA==
X-Received: by 2002:ac8:5715:0:b0:471:bbd5:aff2 with SMTP id d75a77b69052e-4750b23bd92mr21798421cf.10.1741151924641;
        Tue, 04 Mar 2025 21:18:44 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-474f73d8145sm27595631cf.55.2025.03.04.21.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 21:18:44 -0800 (PST)
Date: Wed, 5 Mar 2025 13:18:17 +0800
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
Subject: Re: [PATCH 2/2] PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
Message-ID: <borpjzjwtdeigqs4szogy2ozzqsqj3ucvppl3k6cdzfoukgdur@23wwl55dmrfj>
References: <20250304071239.352486-1-inochiama@gmail.com>
 <20250304071239.352486-3-inochiama@gmail.com>
 <PN0PR01MB10393134B6BD714C1F070F0BEFEC82@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN0PR01MB10393134B6BD714C1F070F0BEFEC82@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>

On Wed, Mar 05, 2025 at 07:57:14AM +0800, Chen Wang wrote:
> 
> On 2025/3/4 15:12, Inochi Amaoto wrote:
> > Add support for DesignWare-based PCIe controller in SG2044 SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   drivers/pci/controller/dwc/Kconfig          |  10 +
> >   drivers/pci/controller/dwc/Makefile         |   1 +
> >   drivers/pci/controller/dwc/pcie-dw-sophgo.c | 270 ++++++++++++++++++++
> Will this driver work for all sophgo chips using dw's IP? If not, it is
> recommended to rename it to "pcie-dw-sg2044.c".

It should. As the DesignWare PCIe ip is widely used and I saw
limit changed across the vendor. And the implement on SG2044
is almost like the Synopsys one. I think it is possible to 
represent all DesignWare based PCIe driver for the Sophgo SoCs.

Also, please think twice before giving some suggestion like
this. Although it is a good practice to keep the driver
specifc. keeping everythings specifc make us miss some common
things. 

Regards,
Inochi

> >   3 files changed, 281 insertions(+)
> >   create mode 100644 drivers/pci/controller/dwc/pcie-dw-sophgo.c
> > 
> > [...]
> > +
> > +static void sophgo_intx_irq_eoi(struct irq_data *d)
> > +{
> > +}
> Why define this empty callback function? Please add a comment if it is
> really needed.

See https://lore.kernel.org/all/bxwsvluj6amgoelk7r55gqhmhjwpewnfyhvvw6zpxen7kqzvwc@fxcebjzo5axk/
