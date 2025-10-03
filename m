Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82921B423C
	for <sophgo@lists.linux.dev>; Fri,  3 Oct 2025 01:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759453883; cv=none; b=HcDWtOZtJ+2lVSTUrsWUomIRFDZLRfAUos5KqBMJRYosBPEnUlPVZWZVhplo7WsKM0Hu4aEdK0M5U6xDCPFwHI2UybqShk131AguZH7gpBxEGDxy0W0XszJ/4KvyiV0TE1rCRUaHlQxoIcvI4TliXy2v8KTQB+RHWQ6FWWO/DlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759453883; c=relaxed/simple;
	bh=N9GazPrt5YI0AJMEN+qVpDTwc+mmy8FLL3tPBD7Nz/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1WFZuDnq6DHwITUI6/O1v2GOUX1CG3P+6c2FOexqrn+VbdCgV94hFKdNXqofULnYwHV23L1gLqUmM7aQ8cfRoMyOUR5/+htVAjqHOPyH5zkwJtAf140w5+EZaFqHMDTG3MFn5nKzWHe43jHoW0tC7zJ3fg4WWyat+toLtruV7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iC3D+j/k; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iC3D+j/k"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7f04816589bso197262485a.3
        for <sophgo@lists.linux.dev>; Thu, 02 Oct 2025 18:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759453876; x=1760058676; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KvAaRy7mKlC1Ciw+3P3SH6DtmjBFBnfiIqdIEUbSJm0=;
        b=iC3D+j/ksB3b+/gGSQvgFsP4P66ULyihMFcQZeGw9vW2SWX7rgZ0+9pfgw5lGHuA7V
         nPJ52nAcsnFmjQwnnPj85hCe+OY6+JwGgNaae5u+VMM0sjmAOPg0VhpZaorrrpXHaqX6
         KVWWfAGZo5SXjvzjeiPXh0xN7XgKbukoN/+W0djxOos7erh9Skosmjt6KQZQoGdke60a
         slSmZnXlULOUC9IEzpx7uY6tshhBzKoodXVbiD5Xo6ZOOvgc+M3nP1PTQyjU8RK+wWCl
         fYWJDHk9lj4KAOgIwro54HNw6UeCqknR5vwR4pOOeeKzYc+YOeZw6VBOQM6bWnnAeQgF
         nK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759453876; x=1760058676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvAaRy7mKlC1Ciw+3P3SH6DtmjBFBnfiIqdIEUbSJm0=;
        b=qAzpxRxzRiHwmL7frbMw3i8OXrfrScJKYsXInHlefxVblFOu55U/L/HYVZqyJUEz0g
         YnT+kU5KKR5Eu5lsJzbvD8jGUXjBDMmxeofmKgPcsfBZObEJcsetBM58ZYhrvV+d1CY/
         AzXyh+a8uI5mmVLN0uEA3yuDYDcm6rBfTe9tITYCTnDHLWGOuZzHNIz90AMq5Hzc4B/W
         1Kj5N+Wojg6wmt0yJOMlZozxZAQk8/W12yuGAOWT+/v0L7c0NuTeobUnv6UV6CD19zXz
         w/WboiKjsCB/6zYsEMTg6TLxe9x/93UtR+fIzC0qS797ur3UjVSWdCLTKFe8Gw+OJ9y/
         917g==
X-Forwarded-Encrypted: i=1; AJvYcCV6UaWGMKwTN9Rh7vZEsV2mF8YP8bq39F1fSQM4Ukvs2R+asoRMKS1YKYuyqPtmG2d1w3J26zQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4cTzGSMWgLjsAo8BZURA19G8bi9Y0gZl8yrVoHZL+oUA18+dC
	jL/2c+6eM9BXwKYxytyDiu1LJg+80AL41v2UJiLApsoD9TF61rlh6wdM
X-Gm-Gg: ASbGncvjlRtz8lcyJ4AAbpY0dh3uq8LuTPbk6M27i8JXRpL+Qauqot1C4su+UdoQAcW
	Y4lwe1/LnA9SWi7WPKB22DZNoc1ax+OH83ARDb5LSSCQgcaVdN3yw7DTfPm8Cc3S5bvW0+FIWab
	1QT5yQhHbfTQg9hLr6J/A/wreWb64OH33T65DShF7LcaoAaWJhWLUtUbKw/jp/xsLOmYP0vUWKn
	0E8GAqh342E/gTMMrqTygv2zKQCXOwzJq8h7qEw2oY76Hlqt0mtGSvQvPaePZmkE1VX4HEo7DWY
	9+tB8fu2tIUK/2KuL5l9sV+60TAzlGwtGaiYJNT0dw8OjR9pH+iWyNMFPVbG+xkqRSBRItrSz2M
	vuguSH8Vd7dRSuQLUS9IGmg66L0oA+PZYAFJ1ApVIBoPZ773aeWD/LEljwFm0WoUzsxiRd5LwD4
	IsYKoD
X-Google-Smtp-Source: AGHT+IGrPCS2A1xaxD+NT2pS1Wo5vKnVoemfXFHvdjgwkCSU8FnmDVxqfEdaNGA9zE3GdjsXrVMAjw==
X-Received: by 2002:a05:620a:28cd:b0:82a:930:9cea with SMTP id af79cd13be357-87a3b89132amr197471785a.76.1759453876489;
        Thu, 02 Oct 2025 18:11:16 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-877725550e5sm308746785a.22.2025.10.02.18.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 18:11:16 -0700 (PDT)
Date: Thu, 2 Oct 2025 21:11:14 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	unicorn_wang@outlook.com, alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, josh.milas@gmail.com
Subject: Re: [PATCH 2/2] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <aN8isoQpdENTrxNJ@sleek>
References: <20250927173619.89768-1-josh.milas@gmail.com>
 <20250927173619.89768-3-josh.milas@gmail.com>
 <nkzpfylhxyqf5u3bjlokhe4udgcxohbaanhwuofjzatan3iwio@45ljfquf5sui>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nkzpfylhxyqf5u3bjlokhe4udgcxohbaanhwuofjzatan3iwio@45ljfquf5sui>

Hi Inochi,

> Small suggestion: please ensure the pinctrl is correct, different
> board may require different configuration.

Is there a certain way to do that? I have been checking it against
the board schematic [1]. It shows that it is using UART0 on the
pins defined in pinctrl-sg2000.h.

Link: https://github.com/milkv-duo/duo-files/blob/main/duo-s/hardware/duo_s_SCH_v1.1.pdf


> I suggest adding all the support devices instead of a minimum one.
> Like ethernet, wifi, bluetooth.
> In the next cycle, there should be a patch for adding USB device node,
> as the driver is already merged. I also hope you can take it.

Lets do it! I tried adding the following but could not get some items working:
* emmc from 'sg2000-milkv-duo-module-01.dtsi'
* sdhci1 from 'sg2000-milkv-duo-module-01.dtsi'
* mdio
* gmac0
* dmac
* saradc
* i2c*
* spi*

I pulled the following logs of interest:

---
...
[    0.647426] faux_driver regulatory: no of_node; not parsing pinctrl DT
...
[    0.732380] serial8250 serial8250: no of_node; not parsing pinctrl DT
...
[    2.418965] sophgo-cv1800-rtc cv1800b-rtc.0.auto: no of_node; not parsing pinctrl DT
[    2.427695] alarmtimer alarmtimer.1.auto: no of_node; not parsing pinctrl DT
...
[    2.441722] sophgo-cv1800-rtc cv1800b-rtc.0.auto: hctosys: unable to read the hardware clock
...
[    2.525580] SPI driver fb_st7789v has no spi_device_id for sitronix,st7789v
...
[    2.555363] faux_driver snd-soc-dummy: no of_node; not parsing pinctrl DT
...
[    2.767235] mmc1: Failed to initialize a non-removable card
...
[    2.900631] dw-apb-uart 4140000.serial: forbid DMA for kernel console
...
[   13.058020] stmmaceth 4070000.ethernet: IRQ eth_wake_irq not found
[   13.086915] stmmaceth 4070000.ethernet: IRQ eth_lpi not found
[   13.096993] stmmaceth 4070000.ethernet: IRQ sfty not found
[   13.105407] stmmaceth 4070000.ethernet: Hash table entries set to unexpected value 0
[   13.115751] stmmaceth 4070000.ethernet: dt configuration failed
[   13.127832] platform 3009800.mdio-mux: deferred probe pending: mdio-mux-mmioreg: failed to register mdio-mux bus /soc/mdio-mux@3009800
[   13.142739] platform 4070000.ethernet: deferred probe pending: (reason unknown)
[   13.152434] platform 4000000.i2c: deferred probe pending: (reason unknown)
[   13.161898] platform 4010000.i2c: deferred probe pending: (reason unknown)
[   13.171078] platform 4020000.i2c: deferred probe pending: (reason unknown)
[   13.180353] platform 4030000.i2c: deferred probe pending: (reason unknown)
[   13.189629] platform 4040000.i2c: deferred probe pending: (reason unknown)
[   13.198817] platform 3020000.gpio: deferred probe pending: gpio-dwapb: Cannot get reset descriptor
[   13.210208] platform 3021000.gpio: deferred probe pending: gpio-dwapb: Cannot get reset descriptor
[   13.221737] platform 3022000.gpio: deferred probe pending: gpio-dwapb: Cannot get reset descriptor
[   13.233111] platform 3023000.gpio: deferred probe pending: gpio-dwapb: Cannot get reset descriptor
[   13.244422] platform 4150000.serial: deferred probe pending: (reason unknown)
[   13.253971] platform 4160000.serial: deferred probe pending: (reason unknown)
[   13.263513] platform 4170000.serial: deferred probe pending: (reason unknown)
[   13.274037] platform 41c0000.serial: deferred probe pending: (reason unknown)
---

I believe I have the correct drivers enabled for everything. I'm figuring there
is some pinctrl configuration ('PIN_ETH_*'?) I have to add to the device tree
but unsure what it would look like.

Thanks for the feedback,
- Joshua Milas
