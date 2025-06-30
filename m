Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A57125F784
	for <sophgo@lists.linux.dev>; Mon, 30 Jun 2025 11:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284200; cv=none; b=huFIMdOxBL8mZpgYltGzAIAiV7Fdgc5Abw6hQlIlHxEzZsck/lN1zVVU+NZMCMtDzIZ70iO7VJPiHIXclnBoymQhsH+jeqlRXRicuqHmsQeoAtZjOpvnv6Os1MK/zcpj0TTc/ZyXGeE2pqtOA9Q6afRMNIjqYXMmQ1aXJ1ZU8ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284200; c=relaxed/simple;
	bh=qqNIeRCf19Ug+nbDmeAEBTRJ5RiReN0RZNqWqx0jz/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMCUy7be9TBBSHkBVOHAirJweN23lPYfgDLC7Ohyy2QFC3CXkX9fhLvqYkVSdh0+PxsimpfdS3kYxwaOAkHSYKYyLOoA2GH/y3rsSbBez6KaDTulSgorNCXbM9Gfwu7tWQQVWSmc5PbJ+ZA8l9zdyM+UvLnn61DIB5KLUR4I6is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5vhB8Fs; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5vhB8Fs"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-236377f00a1so40605725ad.3
        for <sophgo@lists.linux.dev>; Mon, 30 Jun 2025 04:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751284198; x=1751888998; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P7L0gD/O+S1jlluxpetyO6tXkKKPauMUBX5PO0vsdCY=;
        b=R5vhB8FsZo0t115JlXgGVhev1Uwp6UJTvP6lwHiXsL7Gda7y7hMv6phDyctmJxqmdB
         J/LCd81m4LQcwjgi1jh9gY/YAdYoEW9Ac09Nh8Hr0pRpugKhdbsODbsiyDSSKOOFBqPj
         5RWRSIsLYAVsH3bfnRzknhXlvkrknAkq6xpdr5rYd580YyP4anpiPMtWFLOB3RvzCnV8
         jZp5AgV8SUb8s3TEmxJN385OSwRS77ZgqQiSwiT7OfTrg/IMaIboLEmDTxerwHZdLB7z
         XgPs0Xg6SUEr6jMW3MVLSHiik58FQ1TMiN5bVe+af8HyBn0NVaHPKyklLHKgU5FUVQyq
         x2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751284198; x=1751888998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7L0gD/O+S1jlluxpetyO6tXkKKPauMUBX5PO0vsdCY=;
        b=HZzstWUufta+6uFgtCh1merIUHTO9T2PfwuZDgCtxrnltZe+SPYUq9z0Ij7srqFf4c
         KcPMeOsIguFIGxAxLLgLrXPY3RBjOm6FoZt7CzOBuyck10WgM5yvjmLd8WggazvFJwuy
         KiakThQKEG6LdzSlgtxEWfUIit2I2KfS2Y+sWxHNkflgHxo0UuVXT83fZ+SBs/IPpfc+
         QNaC/z5iYzymIyyCGa7He9Iyk7Umn2PiZVHsLG1irHnwZFDLD+qRd7YPoVQr/9EnsiiP
         czIcEwncxIgFt70C5x4mvPPg8AJrBbLVjrHdjwjEELQqDxbRH5CTjwR7Fta+Tk7QLiqi
         2z9w==
X-Forwarded-Encrypted: i=1; AJvYcCUpgxqyyQDtMgS5ahUgw9J1fVbg+ZIOVvXYdjc1JEZLALon0bztVHglQnBytGpRs7BK5GLR3qc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNJm8t8pl2wmKAmP/lwM0zrvRatrwJKW/bjp3lnSc+EUnmfcCq
	dpSmZEOlz+aVsQrxcVMXFKNJpd6Ov0ZyCpcNW+et09UTuiCku2WyHBpZ
X-Gm-Gg: ASbGncsoolMyWokC3SELVzUGZIW0JzXqddo4V7homeUSUNs8u/R3SbFEBm0A7Nj3eqe
	O5x2voEF+XDGIHLYq02VvTxBj66oFMSybVVUo0zdF4kgug5Y6/20oRZxxKAAU3Tle4lntERIf99
	QZJU4Za7X1zREXQsT6oWqYnN+4GI1o4bVJJK/YA52/z/dWB1eGbm9nxlsiSrRccwm9PDvNWNeqE
	D7FlW/YuG49fV/XaU4cDtAuKOah8NUSyHp3pydKbsjelht7eC3cdC/h2ICM7voWabU3W7+JIhSI
	DdsiTne0FOdLb9dJAAGfrMsWVYEqwahGSblGNdKNGeBXLktAJYo=
X-Google-Smtp-Source: AGHT+IGRukL3IXabxcCFKZppPUsWom7Io06VY/r+HS4hnkGjXR5xf1Ph8KP/wp7fO5A2N87ZPa2p4w==
X-Received: by 2002:a17:902:f745:b0:220:ea90:191e with SMTP id d9443c01a7336-23ac3cf5451mr179954255ad.4.1751284198016;
        Mon, 30 Jun 2025 04:49:58 -0700 (PDT)
Received: from localhost ([2001:250:5800:1002::cd55])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b34e300d808sm7928785a12.14.2025.06.30.04.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 04:49:57 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:47:40 +0800
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/4] spi: dt-bindings: spi-sg2044-nor: Change SOPHGO
 SG2042
Message-ID: <aGJ5XAYZ1nmQyBQT@calculate>
References: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
 <20250629-sfg-spifmc-v3-1-28db1f27e999@gmail.com>
 <20250630-ancient-quail-of-joy-effd60@krzk-bin>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630-ancient-quail-of-joy-effd60@krzk-bin>

On Mon, Jun 30, 2025 at 09:17:09AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Jun 29, 2025 at 04:23:10PM +0800, Zixian Zeng wrote:
> > SG2042 is not fully compatiable with SG2044,
> 
> Typo, run spellcheck.
> 
Thanks for spotting that! I will add spellcheck to my patch checking script next.

> > So it is necessary to become independent const
> 
> No capital letters after ,.
> 
Ok, thanks

> Anyway, explain why it is not fully compatible.
> 
I have asked the technical staff of SOPHGO, the SG2044 and SG2042 are indeed incompatible with each other in some places because of the hardware details, regarding the configuration of the OPT register and FFTrgLvl(fifo trigger level) bit setting.

> Best regards,
> Krzysztof
> 

Best regards,
Zixian
