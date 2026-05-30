Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC1133E344
	for <sophgo@lists.linux.dev>; Sat, 30 May 2026 22:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780178574; cv=none; b=AICnHnzQ6fd/fZ0j1OkeZI6GiXKSwsUMBcFnLeWNDX81ty902rquM5WgT0x4HHDfhqPIOB5KpVWNVwWHy0tDya0+kyVNAI1WgX+jayx4LouEffjfayVheSa3cTbvtjSRjaeeTs8WAj+wC6+9wgpdYGw+tqUDWePHBupG7XygjRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780178574; c=relaxed/simple;
	bh=+kFVi5e+KrpIAnBeeaL5fnu0witbNMz2wmBVM/PoMKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTENHwcF42lqtHkQPx4TkA5BVcMviFlaboAVMarU3dmH3lV6ZEQ/TdA6SVFOnTsJ9NtdOZhbu6Jlt/98Oh1N1e5o5mnl5pb4e02HYwOVvd1Qm+mm3zuCbZ6OmsOCHURMeL7fGfLsDaUDDB1ID8+Cf3e8sPz3vM9+ip5aWbBH3sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3ow0tkQ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3ow0tkQ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84230ab8857so208708b3a.1
        for <sophgo@lists.linux.dev>; Sat, 30 May 2026 15:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780178571; x=1780783371; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jULRM7QTG3bd40X4f9y14bjufv7DH+YwiBBgZzfKYuo=;
        b=F3ow0tkQU8Uk4BulvTsVPIvAH4+x/mKSwtlHFe6ZaXWoQtWg1Fuwwn6GDgwkXkgJFU
         FhsZ0MpTH44WRHfxj52he8Lwc3geP/STXm7tGKFmMUsSbuZEJ50P/eArN3wRPDh+N+4L
         Pnx7in2u6DTqtfS2rZ2jafiwJBO5l8g08IGQiQYeIPVCP+BhxqTejJgfQAWfk7LSDm1M
         /Xwrd2TzkGXCMAOWOMIxPfGHZZ7h+z8EpZprpMkH5TAoMXpHkiMbRK+M75NiZRdSpzVb
         Hnq4sXVWt4aHO0WmPiiUY6jNyaGnV5sB3z6ehzMZEXOZEkAP0JX30rPVcmVHCFN/RQmO
         6sUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780178571; x=1780783371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jULRM7QTG3bd40X4f9y14bjufv7DH+YwiBBgZzfKYuo=;
        b=G5KBL6FAXazSrM5RyYUjiroDXXkNqg0DInWPUyRDUGV3K5S1yzuysbTeNSZhMABeuC
         Y79DLu919XW6Kg8JIPbIh43DAcAGE5kJShaRdqODvsHWXApPsJoIck33/z26FIHxmeZn
         tSierOxjTMTLAIX6UpjXEB5M7oYztODAKGyqNQ1TVPthshTE7mdnnh0IAMWZsaUtc4fO
         RdRT/PgUf1G2lICz85/+OwbupWW04Rrf+cnkhxEqjpEPm7qKpoVzzPzDsflx4hzHoiqt
         pK2TF/ejvx2Q8c82ify7rQiG427gAeYodv+LSY2hBkmT/sVzXHj7dqKSgFDC19HtFC30
         fyPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dGn7MoTrpzkBtVYdCZWVBNeLHz/X7vDJmMYEi+JqEJfNNshWQH4Gl7Xl2Ayh35SH6C37ADvE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyka2VPSOzoycdcwIDQBiMd25KbXpba5yfLSNgjdAAkOxuy5hV9
	dbGhzCVZURhrGXaAY0dtuqpaYBR3R+cT5te6AFJWEZ50E45mK5xZz2O1
X-Gm-Gg: Acq92OG2c9uXDv00zQp18II9cEaNzn+0PrMf5Rp82uartcu8veQf0LxOb5spjs4OHgI
	ZJmU/+bouzxqJlE1SOYPTAIOLgPugPpjUGoDkEcqzFelpuPl0gmt6oAIQJJGKdLfolhkStFSiQO
	uctmfAATL52T010NMRV+cM530dEzwZmYhoPo070ImakNRCoLREjXF0LniXs9WkENl4T5cYbxWA8
	D2DYtnTvXhLFz4usEfuG46WCQHeUmkgyQP07DDGHooPHxdgzIuxRhKTr2jhoYMX35F0IXMjOkEK
	vQIPCj22lOvpGpL3LHZzobWN+WbKfW0ZArWAKCpSWb25yzhIUUUu44vz2y18mcF6WqzKXvnvboJ
	0mYTWAKek9OCaSik7TMU9nQRAt7LzkkIZI6uzlo4mo7Jrah+1SLwRAQFBUmUTqyCkQdIsOdmXdO
	adVmDVYJC2hQxoxTzW8zjrf4+oMRtV39GOFg==
X-Received: by 2002:a05:6a00:8cb:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-8422543dc0bmr4619329b3a.27.1780178571566;
        Sat, 30 May 2026 15:02:51 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214ce54b8sm5485197b3a.48.2026.05.30.15.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:02:51 -0700 (PDT)
Date: Sun, 31 May 2026 06:02:38 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joshua Milas <josh.milas@gmail.com>, tglx@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com, 
	unicorn_wang@outlook.com, inochiama@gmail.com, daniel.lezcano@linaro.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, 
	dlan@kernel.org, chao.wei@sophgo.com, anup@brainfault.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, hanguidong02@gmail.com, 
	michael.opdenacker@rootcommit.com
Subject: Re: [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board support
Message-ID: <ahteTfYC5QMlpjF2@inochi.infowork>
References: <20260530173347.33533-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>

On Sat, May 30, 2026 at 01:33:42PM -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with ARM64 and RISCV64 to boot from an SD card, have networking,
> and read I2C slave devices over i2c4.
> 
> ---
> 
> v5
> - Fixes spaces at beginning of line in &usb node of DTS
> 
> v4: https://lore.kernel.org/sophgo/20260328173450.219664-2-josh.milas@gmail.com/
> - Rebased to latest sophogo/for-next
> - Added usb node to arm64 and riscv DTS
> - Removed sg200x link in commit messages
> - Added missing change to v3 and removed link from v2
> 
> v3: https://lore.kernel.org/sophgo/20251029001052.36774-1-josh.milas@gmail.com/
> - Added sg2000 interrupt controller and timer to documentation
> - Added sg2000.dtsi for RISCV and moved DTS over to use it
> - remove devices from DTS's to match what is available in the
>   default pinmux config. spi0-2, i2c0-3, uart1-4
> - Added i2c4 and spi3 aliases
> - Removed milkv,duo-s from sophgo,cv1812h in documentation
> 
> v2: https://lore.kernel.org/sophgo/20251011014811.28521-1-josh.milas@gmail.com/
> - Made new entry in docs to avoid DTC error
> - "Milk-V DuoS" -> "Milk-V Duo S"
> - Sorting of aliases
> - Added uart*, emmc, mdio, gmac0, i2c*, spi*, dmac, saradc
>   to device tree matching what is available on the pinout
> - Removal of 'no-mmc' and 'no-sdio' for sdhci0 as it works without
> - Added riscv device tree
> 
> v1: https://lore.kernel.org/sophgo/20250927173619.89768-1-josh.milas@gmail.com/
> 
> Link: https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/ [1]
> 
> Joshua Milas (5):
>   dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
>   arm64: dts: sophgo: add initial Milk-V Duo S board support
>   dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
>   riscv64: dts: sophgo: add SG2000 dtsi
>   riscv64: dts: sophgo: add initial Milk-V Duo S board support
> 
>  .../sifive,plic-1.0.0.yaml                    |  1 +
>  .../bindings/soc/sophgo/sophgo.yaml           |  4 +
>  .../bindings/timer/sifive,clint.yaml          |  1 +
>  arch/arm64/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/sg2000.dtsi        | 53 ++++++++++++
>  8 files changed, 231 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi
> 
> 
> base-commit: 9aa6068586a9b4cd34cf04f8dee72a7283ab4ae4
> -- 
> 2.53.0
> 

You resend drop all the tags, always send a new version with
all tags applied in this case.

Regards,
Inochi
