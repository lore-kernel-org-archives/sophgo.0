Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11221293C42
	for <sophgo@lists.linux.dev>; Mon, 25 Aug 2025 07:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756107305; cv=none; b=opv77bF48I8cSC2/5HU+agy2maqJjTsJYA0DRKmai/G6x+CukJIjatWV54l1WRhbLZTvskmzJ82W2xAhLdl3/8C3k+m3Tz063c+1jnF6zU/cqfJC6pgPdfm0xG3YV08c28GbAnF2zdodasKwGUFpOb5/E8i3hAUoCttf+iCH0mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756107305; c=relaxed/simple;
	bh=8n8s0vL0czwCbBZJyb4R3SyME9JrMHVOESs2i7aHrl4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWpEF1VGlS9+V83dMEG0jgWF07evKLRdzFi15QLQH3IsrszoYCLlkckqw+cl7/idUyUMlaoFkI1cLtnbAiH9WcZ+UdOXt4pCvUxvu3NtVv6WxBBDyZPillhBUh3FqdUiaY3eky7jGGYrgiFNKHUjGar1IvMROFjGu/7DijcCGXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrCY1Iv0; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrCY1Iv0"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b482fd89b0eso3270153a12.2
        for <sophgo@lists.linux.dev>; Mon, 25 Aug 2025 00:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756107303; x=1756712103; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lvp5MBsT7YhMVkgGMIsz2MCxt+BzXm3dU8zTzzspkLs=;
        b=IrCY1Iv0V8NaTQ30Frq/xPN/oB0t6Dp6OTe0ySp1AYKEPrXc6ReC+VYsVMajvwIhxv
         uC3ylk8BJQ7vm3S2SzrE0Nd3zG2vAqDjFkA6Nz2IXDja+/5iL7OSDjwRG0hX+Q0UNKsJ
         CKxGCVJF7tES/bYOW3MAWWPU84RgVtKa6XmmM79BaA6Q8p+DyrD66wwbHvaJAkBLPO0L
         yf1uFxshQT24P6/nwdbolTvNGca5IgL2w53y+viV2/Jw+K7A3/LcUKY0JOVCvXgfPgLn
         +842/pqeRhMQIPODiuyDKDoMQScNkUQJfz2BMImG1PpobZLsS9K7KVJqO48awnCwRO1I
         YbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756107303; x=1756712103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lvp5MBsT7YhMVkgGMIsz2MCxt+BzXm3dU8zTzzspkLs=;
        b=fFRNsp7BPx0andxAxXE2dx1ZV7pH4rSxPBO8Cla9x/dqjlX/2lHH/CBSJ6r+wFdky0
         YTQLMB7Bq4+g+04Q/Ssak56aZEsu//DAM/x+GJYhw2WerhfenXSSNvLKqOaPMoTUEL/z
         XDb5zxfF4IJJaPfPEiszde2GqXvGQWczQPRvcA78vG4rZm6dSYDXJv0XzBjm9mALSBaL
         hxjXg/79T0ZZlmHnMSvM3MYYxCghU/3PUngirrLjeiBmqLUNwHN0P+1JWPl2biXzinks
         7JplmfNe/nGDTELg8aAj4VYccU7E9goGyUNAyvbqzk50NQqya8l3GG0/MOczeA6wHM5b
         ij2g==
X-Forwarded-Encrypted: i=1; AJvYcCX+3JHsIf8tYMAm5QEFaOATTizaf7tVj5ct7FWCUdCe/r1tH0yOaPXvVY65WMmkcPd5VXE4rLQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5kdjky5l8UBDwTznW48bPEg20of/+Xy/42XbTo8wtpwDH0V8n
	fFy5tPnMcjNeTSzMYBZW4JVn3zxpTzE+bgR0+B0AIA7CTAz578nYRc135SRTr1omp18=
X-Gm-Gg: ASbGnctdM0aMI5K3L4+LnipTTP10EQrxrI/86NYfGRD4kWJNoWMlmiQf4l5f1GdA0gx
	rXdCN2GVc0ktDHUQJehaGWHRfmfyAfLIwO+1ccWRDAurfHmKkv5b93QmldHKE7gKxsqJiHeVBtA
	Jr/+7vaFkSv3wZVdp8LclYV2SjyLNae6vfvgG9itI9mExnVWhiJ+GFgOfPNTH19Fn+IYicJ+aM+
	BUHOpTYhb5Of8A1Ul+aG8nw1zW+Gf+X5WYX9ZgGC3iOXDwV/ekyY+/omfgYg4beWKKOHGC61xQp
	ERGOWhjzviN+2MsWRU3aSYMQchQyI11FCqkCsk/uQ9vJPzhXRfdkRrjHPSJTECIpmvyG5NrUYg7
	H/lWscCWsFjjieK3wit5ORQ==
X-Google-Smtp-Source: AGHT+IEsuMQF9X71mGIcNScDFx9goLQ7xmHtthjhYeAIT6/QFur1P7fK5isGOF+ZbDuvxs+fIRAQtw==
X-Received: by 2002:a17:903:238e:b0:240:50ef:2f00 with SMTP id d9443c01a7336-2462eea80fbmr175765105ad.26.1756107303209;
        Mon, 25 Aug 2025 00:35:03 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-24668880368sm59546745ad.109.2025.08.25.00.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 00:35:02 -0700 (PDT)
Date: Mon, 25 Aug 2025 15:33:57 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com, 
	aou@eecs.berkeley.edu, unicorn_wang@outlook.com, conor+dt@kernel.org, 
	inochiama@gmail.com, krzk+dt@kernel.org, looong.bin@gmail.com, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh@kernel.org, tglx@linutronix.de, sycamoremoon376@gmail.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev
Subject: Re: [PATCH 1/4] irqchip/sg2042-msi: Improve the logic of obtaining
 msi-ranges parameters
Message-ID: <n7na4pl6xfhwdk3xq3ulwrxm5d32kdub44otuk7avwjgb32sjz@erqbkyzhohqv>
References: <cover.1756103516.git.unicorn_wang@outlook.com>
 <adb383f0f4a3cb588448a5a708fb7a907d5e9403.1756103516.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adb383f0f4a3cb588448a5a708fb7a907d5e9403.1756103516.git.unicorn_wang@outlook.com>

On Mon, Aug 25, 2025 at 02:55:03PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Get the arguments of msi-ranges by specifying nargs directly instead of
> using nargs_prop. This only takes one step, unlike the previous two
> steps to get the values of all the arguments.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  drivers/irqchip/irq-sg2042-msi.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
> index 3b13dbbfdb51..5249afd93b4a 100644
> --- a/drivers/irqchip/irq-sg2042-msi.c
> +++ b/drivers/irqchip/irq-sg2042-msi.c
> @@ -276,17 +276,9 @@ static int sg2042_msi_probe(struct platform_device *pdev)
>  	data->doorbell_addr = res->start;
>  

>  	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "msi-ranges",
> -						 "#interrupt-cells", 0, 0, &args);
> +						 NULL, 3, 0, &args);

Why using a fixed range here? I see no improvement. I think using #interrupt-cells
is just OK.

Regards,
Inochi

>  	if (ret) {
> -		dev_err(dev, "Unable to parse MSI vec base\n");
> -		return ret;
> -	}
> -	fwnode_handle_put(args.fwnode);
> -
> -	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "msi-ranges", NULL,
> -						 args.nargs + 1, 0, &args);
> -	if (ret) {
> -		dev_err(dev, "Unable to parse MSI vec number\n");
> +		dev_err(dev, "Unable to parse MSI Ranges\n");
>  		return ret;
>  	}
>  
> @@ -298,7 +290,7 @@ static int sg2042_msi_probe(struct platform_device *pdev)
>  	}
>  
>  	data->irq_first = (u32)args.args[0];
> -	data->num_irqs = (u32)args.args[args.nargs - 1];
> +	data->num_irqs = (u32)args.args[2];
>  
>  	mutex_init(&data->msi_map_lock);
>  
> -- 
> 2.34.1
> 
