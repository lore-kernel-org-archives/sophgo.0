Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F05E221F17
	for <sophgo@lists.linux.dev>; Tue, 28 Oct 2025 23:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761693842; cv=none; b=BSEWBsEbuCANnUQSyaIgkBWN0qBmkZ9i13LiWFCjeYAIHi74D+RS9AxuQJp93x8gj6GxcAUSMieSze7pXLG2Wv4PRf1dQE6+CmdZn//Yd2yDNpQWGHv96BRfWKFuZxdiVXIMIJV+cwPhh9TgBGgoRUteZ/cCQSYNyV45gzf97yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761693842; c=relaxed/simple;
	bh=TNW+jdMT4hhh3TmJ2jO7B8JrIZfypTmPlWlWhLV1ke8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPPNSk7jreu/sZzwlS9mOz2GgnyN3kdMKeyFKVWs4/Y2453P1v36fooyifKkxpIuTC/Y0/Vydufg7gahsMk/TxX5MDrYn4DUUhBryaykXz1gRlc6A77lwZ3VuVNn052BXcWTS+0/0dGWoDYyNJs8XKTkgHIc18jU0IyfAKvQb4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkmTWh1H; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkmTWh1H"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-89c81839de7so347357885a.1
        for <sophgo@lists.linux.dev>; Tue, 28 Oct 2025 16:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761693840; x=1762298640; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2OTfru6F2MqwOi8D04rM0pc9yuTPYWyscODXsRwOPaw=;
        b=TkmTWh1H75xWXU+2zhKrypTV5EHg2bEzdyaeSjCuOI4WI90Q6BKGIxS+g3FSKiCwmy
         37VAR+eUAjNkc890+Ch7YYZL99IaRUhzrxgUtorS1DJfzrH9RSBxao86eg20HV+gbxDw
         1sUM275ceG3iTdYWZ0AyidihMbl/YcQ2VYqOtzBWg5ozz6+nxn2z0a5HzOagBbly1bzF
         02Qg1ONuAGz3y7B4qbcGlou3ZKGb+2QCv5mCw6Fz9ahSJ3s5maFYEpTMQBou1Ga7V0fm
         7UHe6mbeg5WUBG+Rtw65IL7HDE/YZBAmG21ZHebfyl8w1ZwVbwU+IgpTiEfI/4HwFoeU
         Itzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761693840; x=1762298640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OTfru6F2MqwOi8D04rM0pc9yuTPYWyscODXsRwOPaw=;
        b=TzcMtA0sw0NdLx7tnISUITvc9wzCoHOSqtSm6dkvjsLo5YmbMA5vMNjFYU/W5/PFxR
         mut6Rk5t7dgc5hJQQ+wzWGKRhIAen/wxdb31PuJdrputNVrcc7fkpzpFBYtQLFtkqieV
         Zynw2QTYq5RHq+VQ++PhLR5/+yGJSP6jxro2lkEQEzQmB/cnMhNvIhcC6nZsRSeP+6e1
         t/zhJ2AvdWqHteXYDMzvJnZTaALTwl5A06XXHT4VKQsxOCQYpkAQg8IjhvDz6koZgL0e
         ycqxTVsRn0aSHz2sMKpMzO/mAHAdoq1nv4eOeZ7vhDd1anREczQSjlle6N1Dsz4ZDOgs
         UIBA==
X-Forwarded-Encrypted: i=1; AJvYcCUc8jOHawq2CbCnlv6Yv/PvYugTUI40OlS+pawREzhyQtH+HHdzND58GELgDSJwSQa3bX0D8XE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxD9tyh9BH4YIch/AbB6UjGKlcotmtyfdbe5GCia0DQP83IVl9y
	WdPQblVI+O1q/PeU14Eks/mFycR/YpvpuW+aAzq0/JhXlev6GUZkU+/P
X-Gm-Gg: ASbGncuVwOzxqLZ6caR8geQWTOlqX0j4F5Grdd2N4ovtx6nyzGQxUmk6vF7IPDf5QuK
	e+Z86xtHwnxti7V6m+si/RXBuaP2xx2CHpGVosATqBFxYP/vcTqTJJTivdrFMGAu7KKKwwMLVIu
	jN/ETtVatts1/Dpw/Bd8J06zK0/XQKKwsBXrD/X4rL0IlyVZLCZVj66IYU3xfNNc29vnZhqWnbw
	VjGRtH/CKc7hnesugGjGq9NkgIXCvpWkYuKESpaH9qmpZstk4t+YdxoBEFSP5l5nJYgmviCnL1E
	wNUo02jc3dyLe7diG2TSNWNy0kuMCYL/Ayx8j8YfgqiVOuPf3GUOWGQj4BRxVT1qNTtr7ll9vCD
	VL44WdgUvdYdubLGHHL2bfGaHSOd0q9HwmMJVVhyhPIlwIAd5u9ZxBXOUaif8DZGwfnzeaw/Vvk
	RlJVS0c0HARsusFUMHW5fiKVfUU12mnR4CBg==
X-Google-Smtp-Source: AGHT+IGl/mFFQsS3epO7xa4Ze0vaEzgt45AdQHMyUoXToezCc+n8l4Ctnz9kWotaEaGAlioq6/UHwQ==
X-Received: by 2002:a05:622a:a10:b0:4e8:a254:c771 with SMTP id d75a77b69052e-4ed15beace8mr15238211cf.54.1761693840067;
        Tue, 28 Oct 2025 16:24:00 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eba37d68e9sm81382761cf.8.2025.10.28.16.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 16:23:59 -0700 (PDT)
Date: Tue, 28 Oct 2025 19:23:58 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <aQFQjnbfwU6pqUbu@sleek>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-3-josh.milas@gmail.com>
 <hkdnjyldwr4watvizsju4qcvpvkb3mtt5rathaooembpceyufx@ega5xrqj6v3y>
 <aOqtt7BDXxItrs7W@sleek>
 <bsol3uim4brrrsdmvuk6f3uzampbki2pyhziap6x4rw7txl435@rwoxrnctkf3y>
 <aP6UJFPP-ReYPzmq@sleek>
 <4bdad288-250b-4e94-abea-eb231fba5beb@rootcommit.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bdad288-250b-4e94-abea-eb231fba5beb@rootcommit.com>

Hello Michael,

Thanks for your explanation, I didn't know it might cause an error.
My plan is it enable i2c4, uart0, and spi3 since those are the
default on the pinctrl mux. I have tested uart0 and i2c4, but I am
getting an error with SPI

[    2.423553] dw_spi_mmio 41b0000.spi: DMA init failed

Not sure what is going on. I have the DMA controller enabled and it
seems to be initalizing correctly.

[    0.732791] dw_axi_dmac_platform 4330000.dma-controller: DesignWare AXI DMA Controller, 8 channels

Let me submit v3 so I can get some eyes on it.

Thanks,
- Joshua Milas
