Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205A5134BD;
	Tue, 10 Jun 2025 02:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749520872; cv=none; b=PY+F2yNf6Zs4H1s6XsYnC4WDGYQfG6quQm3h5l9OQe36Ilk6mKkMlkM3PZHzVfbeYVEh2oZbJjXXoqCmivmUaiH90jyh5FPMk+gwl9tnlbUDaRWeDehI6TlzBJ/DJ7kYIb55A2b5Kbc88u+irpx25guGwcBLsgIfUsL5Izh9AE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749520872; c=relaxed/simple;
	bh=CyNwbY6nEr0olQ6LJ2zGtYSCQHhinzwFP0N0A0awhxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqRAW3cqtAxjZRts8dlHGvCE9i2rEmhzCUDl4854nKfu7pdeS276RumbUFbNaio58m2KNRLOCd/PpZOFbDVVyAd8zGlFN0ibrjMwxxmNYu88zEwFWvhyBmNcEv74F55FVXMPKTDxczTOn11IYK5XquD0my1JNPiUTrJ4DX4VsOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqkVKHWp; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqkVKHWp"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d38d1eae03so177744685a.2;
        Mon, 09 Jun 2025 19:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749520869; x=1750125669; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w6JdwJlEWwWtngse9JGszpYE1mZus0TKH2ovIgjd1RE=;
        b=IqkVKHWptxJLFOP2hvt3ul7VEkxo4qD7JYCJ9G/xxdrNk3qrcIYnsbzokF14q+Ieiw
         KqsjVO2V1qQo0e8EDRy0SjztS8L/k8LmvuGnFZ+IjtGZWXEPlhhtdB2fUhBFMyG1p5y2
         PTGrTJ2TdHlZNVVqAjAUkwyesTfzz7Nys3Wic9Q6cIkekgC+1SyaIcADOCH02TICP/Hc
         l/99kxFPV/Zm3WORKagnDJJuFhpVp4EM2Vze66oajkFZaBktkEsX9XfAxwDlFTiYf/FZ
         ake3g6S5XnBlSzubzurZYTpKhr9VnbJS7dU097dfW+CTRWc6S6IUbA7f2JorFGBdPVGD
         ktlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749520869; x=1750125669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6JdwJlEWwWtngse9JGszpYE1mZus0TKH2ovIgjd1RE=;
        b=bHjQb+BODJHcLTV6Uy5sATnL58IZklW2UjPa4yZiyNupwvmWtHoLfrosfkmRMXbQJJ
         7FWFJvcz5i10mNISYzUYXLxInW8XPifyLydbBS5jivDHWps/0E7rmEGS0ciVRplH8T7u
         dfVZ44MhbeD7Pb2Ssw8+l5KDM8whQ+MVJHaa4ancgZzIz1kl7byiRgq1XCZL2t82ke23
         jOXkXRjo9JIAF088ePy23LqR4N7+YvYY5kcpvKuXzhp8pvcxLExuClNrpxgGubHJT2F8
         bHqaNbaVtzfUymv/dAk2U0x/buVggNAlganRh+3kfpBbbXSpMd7HZ5rhCtFst8676/w/
         yxBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX89kadp0zNH8yD9VjPHkzn2J2ylMWm5ekIEHLprM8dhuQoa5MDk/y3Rjsv3cmYGuJq6moFY55T@lists.linux.dev, AJvYcCXHHP4KdOYYtZoPTV24Ol4ggPNABmrLeg4OM8+G6/5t3ReGfG82FmwlP2wDENoz6QDyiyA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRlOpoF6U8og7zEdMt9pa81ktD9xs/+8Jb/5PEBIP2cruaDniA
	R92VJYiXH2aqEaHdn602nCgUomEUYh74JOLYTfEWywbzR10QFeFhrBGq
X-Gm-Gg: ASbGncv30GtGwdMXE/JI5Anmaaw2Hwxxs/i668/TFQROyc35HAAAHBzrexLuyNZk9Gm
	+RUbTgj1Fif/ut3GQGvJitf6EiMzDLRAyP77L5mtAJ7hOsNGfgR3IRbnD9KFKhhJgT12nVm4Ggl
	IFMN5tSmWMNXNaJDT25pOrfkYsZ+sTRM9R1sR10CPtJKP3LqllpKXFvwUmg82Lz9Mm0+MpFoSTb
	ejfQ4KTI1zEEXSL4L+sXGqMs3g7o4e3Wy9FvY6VL5Iba66gs9xCtui+Nzkc1Rq2dtqkADupoPaD
	/GbzSdLeja0LH8aV4BKnq6zOzXTvsLyleHlSbg==
X-Google-Smtp-Source: AGHT+IH15GV3DBze0O0Pg4+wloDqugMihWd6D/DIzMiu1G03qL/lbAtUUB6hL47UJJsPSF118+iHFw==
X-Received: by 2002:a05:620a:4151:b0:7d2:279d:c18d with SMTP id af79cd13be357-7d2298ec94amr2846349785a.36.1749520868837;
        Mon, 09 Jun 2025 19:01:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d2513357dbsm625576185a.13.2025.06.09.19.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 19:01:08 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:00:02 +0800
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
Subject: Re: [PATCH v6 0/6] arm64 support for Milk-V Duo Module 01 EVB
Message-ID: <yavt4eztc4n74h55ilqbw46df6hxh4j3uwuefbzcsx7vxezrnn@5mpll7lymyp4>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>

On Tue, Jun 10, 2025 at 01:41:11AM +0200, Alexander Sverdlin wrote:
> This series adds very basic support for Milk-V Duo Module 01 EVB [1] in
> arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latter has
> been chosen because the upstream toolchain can be utilized.
> 
> Sophgo SG2000 seems to be a continuation of the Cvitek CV18xx series, same
> peripherals with an addition of ARM64 core. Therefore it would be
> beneficial not to copy-paste the peripherals' device-tree, but rather split
> the most suitable riscv DT into ARCH-specific and peripherals parts and
> just include the latter on the arm64 side.
> 
> This series adds the device-tree for Milk-V Duo Module 01 EVB, which
> in turn contains Milk-V Duo Module 01 (separate .dtsi) on it, which has
> SG2000 SoC inside (separate .dtsi).
> 
> This series has been tested with Sophgo-provided U-Boot binary [2]: it
> boots from SD card; pinctrl, serial, GPIO drivers are functional (same
> as for RiscV-based CV18xx SoCs).
> 
> Partial SoC documentation is available [3].
> 
> This series lacks the support of:
> - USB
> - Audio
> - Ethernet
> - WiFi
> - Bluetooth
> - eMMC
> - Video
> 
> Changelog:
> v6:
> - rebase onto sophgo/for-next (108a76779829)
> - dropped first patch refactoring RiscV counterpart (equivalent present in
>   sophgo/for-next)
> - added cpu_on/cpu_off properties into psci node
> - added reset-controller node, compatible comes in [4]
> v5:
> - PSCI node in DT
> v4:
> - minimized patch 1/7 (cleanups dropped)
> - cv18xx-cpu-intc.dtsi instead of cv18xx-cpu.dtsi+cv18xx-intc.dtsi in
> patch 1/7
> v3:
> - &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
> were moved into cv18xx-intc.dtsi to reduce code duplication;
> v2:
> - dropped all patches related to the new reboot driver and corresponding DT
> and bindings;
> - grouped DT-related and config-related patches together;
> - added patch moving sophgo.yaml from riscv into soc (to share it with
> ARM); added SG2000 SoC and Milk-V Duo Module 01 EVB into it;
> - other changes are documented in the corresponding patches;
> 
> [1] https://milkv.io/docs/duo/getting-started/duo-module-01
> [2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
> [3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
> [4] https://lore.kernel.org/sophgo/20250609230417.620089-1-alexander.sverdlin@gmail.com/
> 
> Alexander Sverdlin (6):
>   dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add
>     SG2000
>   arm64: dts: sophgo: Add initial SG2000 SoC device tree
>   arm64: dts: sophgo: Add Duo Module 01
>   arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
>   arm64: Add SOPHGO SOC family Kconfig support
>   arm64: defconfig: Enable rudimentary Sophgo SG2000 support
> 
>  .../{riscv => soc/sophgo}/sophgo.yaml         |  7 +-
>  arch/arm64/Kconfig.platforms                  |  6 ++
>  arch/arm64/boot/dts/Makefile                  |  1 +
>  arch/arm64/boot/dts/sophgo/Makefile           |  2 +
>  .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++
>  .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++
>  arch/arm64/boot/dts/sophgo/sg2000.dtsi        | 91 +++++++++++++++++++
>  arch/arm64/configs/defconfig                  |  4 +
>  8 files changed, 226 insertions(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (81%)
>  create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> 
> -- 
> 2.49.0
> 

With all change I mention fixed:

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
