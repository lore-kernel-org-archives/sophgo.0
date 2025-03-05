Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2C21A2C06
	for <sophgo@lists.linux.dev>; Wed,  5 Mar 2025 05:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741151426; cv=none; b=nEev2k6cnMNP7NsAJIxLSDMtqz/pPhwfAmyuvjzj4pjiAEiYkxEBlSaUdzMF1Cxr7Z+9UYtmhqGpEbZQaV/1aeUBUXsFrlU8cRLJOyLUDMrS5hf3QI3TImrdBrzRZD3RdoFdZeEYsk7iSFvUmDjPMlZe6uLvTkXWoW8t8gCLpEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741151426; c=relaxed/simple;
	bh=p2cw06SZdXu8fyNDhTYJkpK63ATQR1w191Nw7/Rk8qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kR8+B7VcEtZlOkDq/AZaAHhYzByGrZUpL0iGrdM+Ygx7mXX5q/yHj4y9yw3vKAJI6IHpS28LXQMfNHC8g26XpUfYjmwIfjKqmgaDsXsQs2PE3x5soPN3lrIlRjbWoCplDrGnLTAATaM55tbRSppWzawnipsIDuqF4cw6G8FpPT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4X8ryIJ; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4X8ryIJ"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-471fe5e0a80so58097551cf.1
        for <sophgo@lists.linux.dev>; Tue, 04 Mar 2025 21:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741151424; x=1741756224; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4aXc+eFaQqactfAjsWukq5bexYGgg4h92obG4bg34aA=;
        b=B4X8ryIJoI+hJzdT5IGtJoO9Cz0ybXHfT+u1ZDYUGbu54OHmTmJV6kqxwpqlyjy9St
         A8BpE5HT8mCepcG/WXci+rMFJBjGycmAZq6gpQkinNouhBhVNfYIHhLBVelorxoI/9aA
         XBYXrYwAoV1hdyYvob+qfcmH0zbpjpI5uf+UYOWHm8Qqx8b+TLGbYcCSnU9zPIbps2TP
         EtQCCyiq/79J5j11nvjiEbbSV2I7hLvj1H9FB+GKnNVR2ssM+SLG71r9Zdz+TQ0uenPm
         mkoXkco4lPIb+mPZuFTeUZwdz4Hh0lH3dTlSSNbscwLXrtDJCQDEk4XmtmUg49emnASG
         2GbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741151424; x=1741756224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4aXc+eFaQqactfAjsWukq5bexYGgg4h92obG4bg34aA=;
        b=a/6Lw9hlnLAwkOS1DG5HQ/kQ0EBMrouDm6e2pACH+3B4bLZ2Rswmk0OHbTltGYQYH+
         QZa9VDvGOubdoFHLDaZFLk/HMMYXIJRAFsDEG5DBxfvQoJlTSQL42GXVkaSGe7s4gJh4
         FmGSTE1XyIsP6Lp+2IqKJAMJqGWlAJGFM7pK45v/QS3zABkKpgNK0Mz9UoaMjNewxBRf
         guIOBHUA2slV03nobn4GKBMGYoDWk/TNX1UbGTDWdj7Kt1jIOUgUzlEEMaknDIjz8g19
         aw5Dj2OEupUAuw0iq4XOxJfsqhnmR/ybJ3aMj6aeH9wocT/dFlj9NTattnnhnAiWy3TM
         NXgw==
X-Forwarded-Encrypted: i=1; AJvYcCVk7Sind7ZEAn0rZQVnt7Kd28Ye6ATwsFxvj5nBnPa9LGsDyjv9go+nSAeLkZLE+tNmwvXU6S4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyP1kYQLx2BY8pWFyCAEUxbI+eKcA1gkl2fu3/lqQ8yKKkj/9iH
	dXBVCvuah7zFEQUM6ecBY6Hop3q4G9ujSIRTqqHm0fIa4tWuj9lK
X-Gm-Gg: ASbGncvg75LJJbgA4Yl13uZXYBZ0vbS7qfv3vpR5TM7NQeSzh1D52racf9my6Bk8brd
	YwCf0e7CHYJ24zOAQALOcv4PLJ9uMiNXK+0tYQ37TooEbbEfbRPCcLBhjoI3j92GWNKh6L7XptL
	8NQNewEgmb4M5UwjpGcctvEh1/0kG7H67LVdZG6QAb1v8Jm8R/8BM1t4QbQgC+Mkev0Gng+xAr8
	nEti6YEiHNrYkDhstiCaIAI4lZvS77MbL4rlNWes7rAKAByqZCZ0Syx6cEaerQfBJ8Ssf8L3oqo
	oRmlLSqAsUATKXXQOlLT
X-Google-Smtp-Source: AGHT+IHU4vogNMuRCH0tVBz2RJOUF3BRl3lUNyiWVLGC65w1tNpBCw5qZt0mtmykFYE9WEb3N6Pl9g==
X-Received: by 2002:ac8:584d:0:b0:472:447:ad7d with SMTP id d75a77b69052e-4750b4c3f0amr21880881cf.32.1741151423766;
        Tue, 04 Mar 2025 21:10:23 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47508cfc40fsm9857171cf.34.2025.03.04.21.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 21:10:22 -0800 (PST)
Date: Wed, 5 Mar 2025 13:09:55 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Johan Hovold <johan+linaro@kernel.org>, Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>, 
	Niklas Cassel <cassel@kernel.org>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
Message-ID: <bxwsvluj6amgoelk7r55gqhmhjwpewnfyhvvw6zpxen7kqzvwc@fxcebjzo5axk>
References: <20250304071239.352486-3-inochiama@gmail.com>
 <20250304173632.GA243820@bhelgaas>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304173632.GA243820@bhelgaas>

On Tue, Mar 04, 2025 at 11:36:32AM -0600, Bjorn Helgaas wrote:
> On Tue, Mar 04, 2025 at 03:12:38PM +0800, Inochi Amaoto wrote:
> > Add support for DesignWare-based PCIe controller in SG2044 SoC.
> 
> > +static void sophgo_intx_irq_eoi(struct irq_data *d)
> > +{
> > +}
> 
> The empty .irq_eoi() is unusual.  Why do you need it?
> 
> I see that the existence of chip->irq_eoi() makes a difference in
> chained_irq_enter() and chained_irq_exit(), but I'm surprised that
> this is the only driver in drivers/pci/controller/ that implements an
> empty .irq_eoi().
> 
> A comment here about what is special would be helpful.
> 

It is more like a mistake that from the vendor code
that I refer to it. This should be a level irq, and
I haven't tested it as I does not have a device use 
INTx. I try to get a test device will replace this 
empty eoi with handle_level_irq if I can confirm it.

Thanks for pointing to this.

Regards,
Inochi
