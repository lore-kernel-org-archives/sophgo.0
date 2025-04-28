Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C31B1D6DAA;
	Mon, 28 Apr 2025 22:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745879755; cv=none; b=YAjgIbHAn9fl0G04GYGdEDqHkr0WaMTeFZf6XtH1J9FGe6F7FdWZjkCIQkU1vNW8hWMe+xAc1fFXFmNU4LZnQ16GcvmaREPHgTmDNWaKw8rj+9kJ+f2r7gcMcm47MHTOgUk4F2hQlM/sTkBz1d8AQr7aQ9uX8c8nILS6sUBAVoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745879755; c=relaxed/simple;
	bh=dsHMaLy+Slj0qyE+mOUjzDl6VBT8UBQJQxWjTqxbQxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VB7C6S8tZ7sb/5EGahopXi+P8pU2oC0TWCHzXNa9zWVu6oBA/1Um4W3TN4D9BXmiIfXtyVXYcfBAxHHuxCn2FuvA9ACulEM9zB4poUWIExvxFva+X8+TEBy9N4/cNlvrXYAVEGvtXav2t5MGCPydRugOVpa6dp/aorhsAt6BMkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pb8aHXV6; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pb8aHXV6"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4766631a6a4so65259311cf.2;
        Mon, 28 Apr 2025 15:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745879751; x=1746484551; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X/kdZu5lZfOsUl8WyU/NEfAG1LYXxMtniBa4sTIJjM8=;
        b=Pb8aHXV6R7Mo8upSRb5yCegk+aUUF0rDHxCv9cscwo+b1vmbz7eVdf3OMNu2gxILly
         4f1wEEgMAL2tWZLl/fESApgw1ID1xZvORfvqsh9kt3UrAMa/aH0AsxE5zBeXiJ8JNZDJ
         gMJEZxWyJ/t+DXpmdWh4TezxEQFZi1GtzXHxxJILrpMb4xeV09FgJPvQ0Db+HRhantu1
         VraPq0buZ6D58/dUgSlflfZrjlo1kAcmyhu6+YxKF541zIC9NAN96fskm+7LzVzx5hUE
         rTbX4mfwiSzVzwA/jshbdzYWqIuGl4egVbeHN36pry7kNbJpSjcnJB6aWuW/Ziqsi6jU
         84+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745879751; x=1746484551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/kdZu5lZfOsUl8WyU/NEfAG1LYXxMtniBa4sTIJjM8=;
        b=HuaPAZotag7ASYSftfpFP7y+DUS4s82u64wc0XagWuEEbeOV4Or1J7jxbW6BeeJa8c
         ltXYwClJ8fP1cUA+NNuv7Gzo5q0G4OQS5zRDnRjrRMv74wfFnsq/g9r7gFyipkNrf/l7
         NyfbA/0Nbm5/C9sOXGnjqj6CGqMKy2wgPINjXJ50zesnD8nDbcKk/aSSJrexEPetoNIU
         hNNwjxM9h0YjkMIRwAC17c21L9nCtKPQAy5Bj1sS71CiL2X0jwvYt6hQvSe6LnEUFJl2
         Tumz6qhPoqRNooCpnU4vn3b06b9j2oPqzDqFfWeokszP+SIE9FGKLx1BT5r4MF0ZarQw
         2U/A==
X-Forwarded-Encrypted: i=1; AJvYcCUT5a0XXBcBAT2jFmVjwIVhf35Sr5NEr4vKeEMsI0+UcymbZyrF3tj6kuU8lQZPiXi5gzg=@lists.linux.dev, AJvYcCVt5x6TkeRkb6UPZqln8cD5RcsY/dFsZcHcvwUrICMsXD4chWrxtNGHyP3+jK/Z7nQF2TkEhNLO@lists.linux.dev
X-Gm-Message-State: AOJu0YwKmCciRZxJCKbl9DANSpZ3C0+BrgJvkeyil89sxNlyLTLUgmoW
	/TjYWWD5VINoHOgAYhWZ+x/Mp5qB7iQY5lgCoYW8EBjE+Y8q+G8e
X-Gm-Gg: ASbGnct2I1Dsp9p9G0dwMYyn0T5gr9amae57J5FHdA9TwOzflA8tKClyqD2uhBfXqOx
	envWFDa4DSxp6v4UO9YqvOpTbh3bZCdobo+iZ2MBiZnNAECfJlgNkv30drIK2NrJRNHlNErm7Il
	6s+P2IkJ7/syOZMX5lzxTB5yPeli3x8yOk81rBz+ZvJRyJ5V0qdXd4p5FY2UKZo60aLCPtRIGM5
	rkv5Tt0kK/GeOlWQ2ZDkvazzm1oFxZuv4BwYiSf6U39a3bG1I8j9ya3IUQ32BVpzRYxUKdDqRB7
	YyjRIs9WXT8ijp+h
X-Google-Smtp-Source: AGHT+IES8nRDFDh7fd98mGNj9hoSaWm8gTLVtNkYmiW/3xaJ8gUBVINczQj4gDLHG/EkZEFrUlpH2w==
X-Received: by 2002:a05:622a:1f17:b0:477:6e8e:138e with SMTP id d75a77b69052e-4886ff51bafmr17662271cf.2.1745879751334;
        Mon, 28 Apr 2025 15:35:51 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47e9efda2c0sm73859921cf.20.2025.04.28.15.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 15:35:50 -0700 (PDT)
Date: Tue, 29 Apr 2025 06:35:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, soc@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jisheng Zhang <jszhang@kernel.org>, Haylen Chu <heylenay@outlook.com>, 
	Chao Wei <chao.wei@sophgo.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
Message-ID: <6wlgfvc3rkhv4s3ou67fjl6j4a26vocqck5727cg6muxlz2erj@kivndcjcqc7m>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
 <20250316185640.3750873-2-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250316185640.3750873-2-alexander.sverdlin@gmail.com>

On Sun, Mar 16, 2025 at 07:56:31PM +0100, Alexander Sverdlin wrote:
> Make the peripheral device tree re-usable on ARM64 platform by moving CPU
> core and interrupt controllers' parts into new cv18xx-cpu.dtsi and
> cv18xx-intc.dtsi.
> 
> Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nubering
> into "plic" interrupt-controller numbering.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v5:
> v4:
> - cleanups dropped
> - cv18xx-cpu-intc.dtsi instead of cv18xx-cpu.dtsi+cv18xx-intc.dtsi
> v3:
> - &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
> were moved into cv18xx-intc.dtsi to reduce code duplication;
> v2:
> - instead of carving out peripherals' part, carve out ARCH-specifics (CPU
> core, interrupt controllers) and spread them among 3 SoC .dtsi files which
> included cv18xx.dtsi;
> - define a label for the "soc" node and use it in the newly introduced DTs;
> 
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |  5 +
>  arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  5 +
>  arch/riscv/boot/dts/sophgo/cv181x.dtsi        |  2 +-
>  .../boot/dts/sophgo/cv18xx-cpu-intc.dtsi      | 54 +++++++++++
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 91 +++++--------------
>  arch/riscv/boot/dts/sophgo/sg2002.dtsi        |  5 +
>  6 files changed, 93 insertions(+), 69 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi
> 

It is a hard time for now to do some change across the cv18xx 
series, and it has become a mess. Due to the fact, I think it
is time to do some work like split some device (clk, pinctrl,
plic, intc) from cv18xx.dtsi to avoid override, and make room
for arm64 device.

Since this change contains some change similar to this patch. 
Would you mind me to take content of this patch, and add you
as the a co-author?

Regards,
Inochi

