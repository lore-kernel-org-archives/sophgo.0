Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A1713F434
	for <sophgo@lists.linux.dev>; Wed,  5 Mar 2025 01:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741138168; cv=none; b=tKH1SunOAx/IDDBEcKlBvBja2nCgtsoTIv/oY+Ewx+5BCkV1u9cPyU2++TgRfcHWmioq2U4ReVwkJe6ZPcxurUmC+//EJ6SgxGG/X4UmLdl6rNG9zQf5M33ANTFKrg57K2vNAf20cBWPJ7R1oQwPBxP79/aqDKzywyXkNpfMJFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741138168; c=relaxed/simple;
	bh=Mkts6pb/AOEqCXZVNVRMrjdozYBbwYAMrEF68H7BQiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODwnrsq8KJnxnLmpqeUK2+/9AmensZqFECNeoqglr++EGxi74DEAIoMs4KzskIN6JyhuEk/fftIDzWyq1gp53/Sc4Vq355As5baJHwO5WYSd9iueW7OaRcFWRtcKmWp/ualiEL2HGXM9GHDGDrrjnvsbaI8fHyR1dBb8Fa5InD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XihcQ8gA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XihcQ8gA"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2234bec7192so109707805ad.2
        for <sophgo@lists.linux.dev>; Tue, 04 Mar 2025 17:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741138166; x=1741742966; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lMhzBhCrPjIqQGQg1Wg59vv0ddj0LU+xkyGOMArKoKg=;
        b=XihcQ8gA1sCeDwcTkeXyT3RiQfXghXhzYvPwLcQC5dGn3DM5/aKy0AEkDWvwVo/zTD
         yvXYyZhdjX4RfK2kQV+/prxc+NVhh0dfdyuN10xvR5Ci3tc7+BJOl8vxUJzUmBHrmw1j
         eEfszsK1boX1wyk7b68vgWJew6rjgfPMlNE9X9XfAbXTWU5aLgT0vy+xSVcg3dISAI96
         +MdxgYV3SQr51wLG67o1B/ff3ywxeo4N+Da9FMO4deMugsaZpsi+A2/EAQLL2pUrPsbb
         E1KRpbHOEW+rbUIIm0oNouzIhe3rb++DnWZtPEKiRoNGKTz+36ab0hf7lFeA7Ab85G7t
         Q+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741138166; x=1741742966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMhzBhCrPjIqQGQg1Wg59vv0ddj0LU+xkyGOMArKoKg=;
        b=Mk+G/fWkI7MirRneLA4LnxpA665eaXi6hBdSNWBR+FeW45QyVemznhYssRbWV1/tYO
         /6BWMyFTFRzg3f0yji18svdD7aLuNfwvoQn85K3SolCPN8SPFNKsIE72+XwexDf4kH5h
         83hnE/kbRPsRYNwj9IYRzw45oyxnxCgrHBdIFdWtJmSLaZ10d+VJ+cviwm7xPcPyL1Hp
         1nQbHA8ZoQgg3ONmmxFvD5XO+HzBzgfw3eUv6nKljZ1vvRipWOt7yxeS5BXxgbilkIc4
         uTLboox9tDwgKEbvEB6HDikCj0RABw/QA7GFq4NLbeIya90/j6u1EX5vaatY+gBJlezj
         J1wg==
X-Forwarded-Encrypted: i=1; AJvYcCUXKEdFGHthjtHqaVjFQuggpTtIDMqs8eY5OfWDFDvCEYrPMSgcoxI/11OnrkUF9D4IIPTW3ng=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8im7nnnZth/fZjftRPCGko15D/hyVflTL3du3FlYYJteYIRMr
	C6ykWHzedppazJpYFMNZP0dNV5vLWQ7XRCdy4jCjd/RdfSY97FIz
X-Gm-Gg: ASbGnctVwxXVWVMdhvUGTtRKZMNxjCGM8ImdWhLnWCYxV6prjLra2sUKt8/L57NUfYZ
	jQkadr9XHIHcAecgjFdcA/rjYxZYO204bkOufBuQLzG10+qnUlSBFgsM0e+g3wEceF4/FyecfeH
	5Nf9dJT6mfdSVRmrmTU6ECic18UNZo0Cn1XMmwlahTo/WeVpi6RP7+gjucISykPJUkxit+ewg9Y
	TJhrFhs74OIsS3Yx2pKpdU+LMNLkpK9D1lHBnk/2Q1ktxlzwWpnYZV0Bzrf8PHImTuJrh9BRceZ
	08/C8Tb69X3aKNUS27F2PFw=
X-Google-Smtp-Source: AGHT+IGMYeB1wOukNuf5Z9VnV6HZIq+bca5LXw8M9agga6DcCzRyxOH6Zle9qOflX6ikXDadlX9ecg==
X-Received: by 2002:a05:6a00:1788:b0:736:533b:f6fa with SMTP id d2e1a72fcca58-73682bef664mr1796095b3a.13.1741138166235;
        Tue, 04 Mar 2025 17:29:26 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::460])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7362c92271fsm8578986b3a.1.2025.03.04.17.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 17:29:25 -0800 (PST)
Date: Wed, 5 Mar 2025 09:29:24 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Inochi Amaoto <inochiama@gmail.com>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev
Subject: Re: [PATCH v2 0/2] spi: sophgo: add Sophgo SPI NOR controller driver
Message-ID: <oghkqkoilkg7ny5saa4fi77hcawkdbeih5zg5aaliv6kf42jee@2nmyxje7itse>
References: <20250304083548.10101-1-looong.bin@gmail.com>
 <PN0PR01MB10393099D28CF3DF75A0F414CFEC82@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN0PR01MB10393099D28CF3DF75A0F414CFEC82@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>

On Tue, Mar 04, 2025 at 06:14:54PM +0800, Chen Wang wrote:
> 
> On 2025/3/4 16:35, Longbin Li wrote:
> > Add SPI NOR driver for Sophgo, including read, write operations.
> > This driver is only suitable for NOR flash.
> If there is a next patchset, please also replace "Sopgho" with "SG2044" in
> the cover letter, including the email title.

I will correct it, thanks.

> > ---
> > 
> > Changes in v2:
> > 
> >    Fixed following issues as per comments from Yixun Lan, Chen Wang, Inochi Amaoto, thanks.
> 
> I feel like you left out Rob, and you also left out his signature in the
> first patch ;)
> 

My fault! I will add his signature in the next patch, thanks.

> > 
> >    - Replaced "sophgo" to "sg2044" to avoid conflicts with other drivers.
> >    - Improve driver code:
> >      - Improve coding style.
> >      - Removed the [PATCH 3/3] in previous submission that based on the baseline not submitted.
> >      - Added error handler to destroy mutex if probe fail.
> > 
> > Changes in v1:
> >    You can simply review or test the patches at the link [1].
> > 
> > Link: https://lore.kernel.org/linux-riscv/20250224101213.26003-1-looong.bin@gmail.com/ [1]
> > ---
> > 
> > Longbin Li (2):
> >    dt-bindings: spi: add SG2044 SPI NOR controller driver
> >    spi: sophgo: add SG2044 SPI NOR controller driver
> > 
> >   .../bindings/spi/spi-sg2044-nor.yaml          |  52 ++
> >   drivers/spi/Kconfig                           |   9 +
> >   drivers/spi/Makefile                          |   1 +
> >   drivers/spi/spi-sg2044-nor.c                  | 500 ++++++++++++++++++
> >   4 files changed, 562 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
> >   create mode 100644 drivers/spi/spi-sg2044-nor.c
> > 
> > --
> > 2.48.1
