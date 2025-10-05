Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAD87261C
	for <sophgo@lists.linux.dev>; Sun,  5 Oct 2025 03:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759635591; cv=none; b=d4Br47iirvM9AGequjB3vE+FZhlnzIDMXTj4opMcaJgKrJ8cQ8INRCW/bErxG+XewndHieDdqoYjx7R78cmi5gXWmcDWn5ZcTRpe8WlLPosHbbfVxbgxvDKc2ke6w+xuWskMQSs5Hm0tYSg2KmF+Je7hWJ/BG/9Xw0uanN8FtRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759635591; c=relaxed/simple;
	bh=5DXVhQJVWPa7BTZiMU1CWGKQEMRR10aBUHK104FQf7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4Fgxmch8G08qZOwpWKBwQWiRizxSbbi/a1o3DAzzWX3AJ7vGaWq+k+NW/f2TlfbSMe1kF99XMv/LWVxYt32o2txqH20kF8i5mGlCFtdD22zWgxMpOtbKVLgtWeRreh1/YeSIi+FSS5DmW8FBebCIRBiMZda+wtTS0gYl4oEc/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cb4W8zsS; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cb4W8zsS"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2698d47e776so28809075ad.1
        for <sophgo@lists.linux.dev>; Sat, 04 Oct 2025 20:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759635589; x=1760240389; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+g7HNgxMDfLXKAWzxyzzrvk58l1g/AkfeI8B7sftDTM=;
        b=Cb4W8zsSuMteAovkXLIzmynz0DFeD7AuUlrIyWatb5cG60S9FB56xopxGDVHhhUuPA
         kTsYPs1cQgD+xnZyZDm1omPxMVmPB6K442pNeVLXBBvvCHWS4U/aZ3R1ZBZaJvuJuvpr
         lgi8qrV8XmFAyyQ0CB3PAo5J0ai0sZ10O5VAR0OsulEVSOtmQRJMOT0aHjaXecxrP2uz
         JlI+2W1wF9Kbzcit4JxJmND62ZSauOrQ3oS4X6x0NsunHlS9ssZ6NwIOUFYKPN1+zOlC
         bYu2YjPD65h0EyPmxIMk8OX51LHPqARG6NgHVPAepUn70mvhs130NbOMClYQL/VqIhIA
         2vEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759635589; x=1760240389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+g7HNgxMDfLXKAWzxyzzrvk58l1g/AkfeI8B7sftDTM=;
        b=VSZs2Lm8ziJkT/G1IIuXlDr66Iy+FcduWJYxpi159Yci4M5gzfSJtB1MayTc+5RRjy
         zTGnFE3oBvIfRri6inCsd+onJzqcH5SrAE41lV0v+0+VbEuHZ78XCHfprITS1JY0b184
         Iox4Wd9Ck5IoyfMSRMvOldrLe4hay/4bnUzdwL3siW/jFC35ut4HsWlNPbV4uJD+rwka
         wZHOXySpNcSydLR2HVBhMtTr8jtr14+lgwoLg0A1ur0KndOw/Cs44biiX6LyhQ9lYfux
         8ROnqV5PS1I7my58JmIl7bBFieu0FJ4L4G279DgREIrBJGo/nyE4/MEN/L73U4cIvNy3
         0OMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO9PPcRFJ7hKNAmWitco/Z+EylInv5yf2CC+eQ+FqgoTlTK+FuRvNHrWu+DMJXymUZcE2qO2g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzslGGHjxOVJJu150yDCvnj4YZKu18bs0kxWjw9ARk+B0VwoX7I
	huqJb1vkI8fk6UvH5no4dC9xTXg+bj/eHFOYy7eQoSeH769NUgQP2d49
X-Gm-Gg: ASbGncuD0kPtoNcgvV7vkjzkVn7EaGqK4bR5YbKwcXVI3WZt/6SSlO+Gnj2gSGKQ5G8
	QoNQDnMDDbCMnjR8cnlAE+ptmMQHO3nnG3DBXramjbLX+7XfzdPz+XaINbDG9Sjr+1GWDwQ+/U9
	yaAL784L0vJfSWqqxFQzuyWlV+bWpzepuF9vEKRPwQw9a6ocot2+M/qcjD7EJtqSQ6pjwYgQt7f
	1qwrOZHZ8xkQmXJykSRiicKBRcjxoY12tzT+8DbLNyrm0CuukyhtFlAH3e27uhm/F4Bskqwvbyp
	YyAfALQmMCIGhU5YdolnCQeGqKv2ZEHTY/kACYtXN2Tndus7FYFKpDyH5d9ekg2qIhi34sDqfM/
	C752wB/GBlF76zvKdmaG/fZxlA3i4/pnFp5QbOguqtBq97x25PfQE0/D6
X-Google-Smtp-Source: AGHT+IH6XtWdzGlhlZv85anzGuYP/KOgTHTcVV5Smrvelg3UJ+cGVAkyZ231iYNJVwr5XleNxsLBQA==
X-Received: by 2002:a17:902:fc87:b0:250:b622:c750 with SMTP id d9443c01a7336-28e9a61ec6amr96084485ad.27.1759635589349;
        Sat, 04 Oct 2025 20:39:49 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-28e8d1edabasm91909375ad.124.2025.10.04.20.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 20:39:48 -0700 (PDT)
Date: Sun, 5 Oct 2025 11:39:13 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joshua Milas <josh.milas@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, 
	thomas.bonnefille@bootlin.com, chao.wei@sophgo.com, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <oxke5yy22pb7nqzlbjsvhcq32xz77pmmxkcrnxr3lxqvhe6cxp@n43f2yngnfcc>
References: <20250927173619.89768-1-josh.milas@gmail.com>
 <20250927173619.89768-3-josh.milas@gmail.com>
 <nkzpfylhxyqf5u3bjlokhe4udgcxohbaanhwuofjzatan3iwio@45ljfquf5sui>
 <aN8isoQpdENTrxNJ@sleek>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aN8isoQpdENTrxNJ@sleek>

On Thu, Oct 02, 2025 at 09:11:14PM -0400, Joshua Milas wrote:
> Hi Inochi,
> 
> > Small suggestion: please ensure the pinctrl is correct, different
> > board may require different configuration.
> 
> Is there a certain way to do that? I have been checking it against
> the board schematic [1]. It shows that it is using UART0 on the
> pins defined in pinctrl-sg2000.h.
> 
> Link: https://github.com/milkv-duo/duo-files/blob/main/duo-s/hardware/duo_s_SCH_v1.1.pdf
> 
> 
> > I suggest adding all the support devices instead of a minimum one.
> > Like ethernet, wifi, bluetooth.
> > In the next cycle, there should be a patch for adding USB device node,
> > as the driver is already merged. I also hope you can take it.
> 
> Lets do it! I tried adding the following but could not get some items working:
> * emmc from 'sg2000-milkv-duo-module-01.dtsi'
> * sdhci1 from 'sg2000-milkv-duo-module-01.dtsi'
> * mdio
> * gmac0
> * dmac
> * saradc
> * i2c*
> * spi*
> 
> I pulled the following logs of interest:
> 
> ---
> ...
> [    0.647426] faux_driver regulatory: no of_node; not parsing pinctrl DT
> ...
> [    0.732380] serial8250 serial8250: no of_node; not parsing pinctrl DT
> ...
> [    2.418965] sophgo-cv1800-rtc cv1800b-rtc.0.auto: no of_node; not parsing pinctrl DT
> [    2.427695] alarmtimer alarmtimer.1.auto: no of_node; not parsing pinctrl DT
> ...
> [    2.441722] sophgo-cv1800-rtc cv1800b-rtc.0.auto: hctosys: unable to read the hardware clock
> ...
> [    2.525580] SPI driver fb_st7789v has no spi_device_id for sitronix,st7789v
> ...
> [    2.555363] faux_driver snd-soc-dummy: no of_node; not parsing pinctrl DT
> ...
> [    2.767235] mmc1: Failed to initialize a non-removable card
> ...
> [    2.900631] dw-apb-uart 4140000.serial: forbid DMA for kernel console
> ...
> [   13.058020] stmmaceth 4070000.ethernet: IRQ eth_wake_irq not found
> [   13.086915] stmmaceth 4070000.ethernet: IRQ eth_lpi not found
> [   13.096993] stmmaceth 4070000.ethernet: IRQ sfty not found
> [   13.105407] stmmaceth 4070000.ethernet: Hash table entries set to unexpected value 0
> [   13.115751] stmmaceth 4070000.ethernet: dt configuration failed
> [   13.127832] platform 3009800.mdio-mux: deferred probe pending: mdio-mux-mmioreg: failed to register mdio-mux bus /soc/mdio-mux@3009800
> [   13.142739] platform 4070000.ethernet: deferred probe pending: (reason unknown)
> [   13.152434] platform 4000000.i2c: deferred probe pending: (reason unknown)
> [   13.161898] platform 4010000.i2c: deferred probe pending: (reason unknown)
> [   13.171078] platform 4020000.i2c: deferred probe pending: (reason unknown)
> [   13.180353] platform 4030000.i2c: deferred probe pending: (reason unknown)
> [   13.189629] platform 4040000.i2c: deferred probe pending: (reason unknown)
> [   13.198817] platform 3020000.gpio: deferred probe pending: gpio-dwapb: Cannot get reset descriptor
> [   13.210208] platform 3021000.gpio: deferred probe pending: gpio-dwapb: Cannot get reset descriptor
> [   13.221737] platform 3022000.gpio: deferred probe pending: gpio-dwapb: Cannot get reset descriptor
> [   13.233111] platform 3023000.gpio: deferred probe pending: gpio-dwapb: Cannot get reset descriptor
> [   13.244422] platform 4150000.serial: deferred probe pending: (reason unknown)
> [   13.253971] platform 4160000.serial: deferred probe pending: (reason unknown)
> [   13.263513] platform 4170000.serial: deferred probe pending: (reason unknown)
> [   13.274037] platform 41c0000.serial: deferred probe pending: (reason unknown)
> ---
> 
> I believe I have the correct drivers enabled for everything. I'm figuring there
> is some pinctrl configuration ('PIN_ETH_*'?) I have to add to the device tree
> but unsure what it would look like.
> 

Weird, I don't see it in riscv build. Can you post your dts here?

Regards,
Inochi
