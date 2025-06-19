Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4D9230BE0;
	Thu, 19 Jun 2025 06:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750313821; cv=none; b=Yh81ek9GTM9/y9nwud5CXoMlNEQA4fNDzkl5Lp5rU8Y3peS6+4hgcIeYGlA6XChMP5COYWJG21LvLulXhtWx0BGkId5Trdb2gg7z+aQCEjrWeENWNd/ErpJcne7ax617CS6Vrs+h0z+xSHp5SKki4zsoPIk7hmzDNO9CMij5WqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750313821; c=relaxed/simple;
	bh=qynEUGa3E0KYY4SJT9UtHZj4PK+o7fRsWecXCsOl9Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvlYOUAxwq9VbTISei4/ZjSCl85Qn+wA57vHirUuZpCNEn2DrUwpUV2G5ili5MupyGNmLWMy1J9/XF2SaIPsA/OUWmZZ65wyQnAWvOdlM3nwU9d+xzjdHvznTJKhqy52Vn1rMiTghUOp6WNiCpLWXvmMdaQscPQWKZvVwk3j8lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAks9V+F; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAks9V+F"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so330017b3a.0;
        Wed, 18 Jun 2025 23:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750313819; x=1750918619; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=18Q33uiXFviW8mwo3GHO1W3hkitH238h+PF/RLg6pMk=;
        b=KAks9V+FhMtMbhlEYYLUql1vtLQJLOOIB0KvX4qA2UyXUp3jg5ux4ZcPon50SoNXOs
         QMAJySJR0KCvHOAESzaL0c7OnbiabOg7Cf5rGTbDy82yMhQ2GMUGHTqCv6gBt6lXsQWX
         LCm6hZo/eSzD528cLE/3pQmR/QCv84zfwqQX92BF/FWCXReTJTYfHTCI9mCRvR/JnV+P
         RYwJba4un3peZHTP/2zYJi+i/4Rrk/YhM/h/Bwyyz//SGf3xWvwspowDJ2kuufm2j550
         grusKUENyn96vItxu4Y3W22QjWxIzI+/NTP3sx4e3hSv34OsaX0a5RKPm84dJBtiQKxb
         nqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750313819; x=1750918619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18Q33uiXFviW8mwo3GHO1W3hkitH238h+PF/RLg6pMk=;
        b=GSW9A9ditJC6thpAOLNxXf4FFU0IKtloJmq/VOBaw4IBRlWgEuJqelWdhpEJMwn3iS
         6e9hIK+liUGkqPEOmHwZ1S+r5YAvBjgirFSB4EyLDAkWqEdVSVJMvRkEV1WqtdhXIj26
         yIFGGxr74v4SwZEQ6Zpm0zSlAyher6ywPZT9mq8mHmkIIWyw0yxvT3e9p9lPbfqL4YUF
         lEdO79R5YPxiaEeg9XXEPWTkr9Qrxlh09DV8UVlNkXiD4tKwk0Ze3viAhMQ+Z6KSjxe7
         PW3buh904b/yl1fNuxHz+c6vTLDqN1fNe9wlFXACpyefvPXfqxdX1isv62kc0pBM53kG
         T9bQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/XJRN/SyRQRCQ5Labx2abu7HFGZ4pgrUxJ0T4S+Iws+gF+mtVXuu6lUGijC90EsGnxr9bpgqZ@lists.linux.dev, AJvYcCXoEZpL87sXKHpKeMsEGObdYbnUgxWMa+7UmAB+Lo3VOu3qMcjYGkWlrBlL4StG7xyZJFs=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk2vgDmWsC2THNZMaoRkQLHn5+r2LE2hfHOxoXnOy6IrEiCFIE
	MpGeiZN9uBm76YFPcmSrRL4LhRYnzOkSzg441JmiTU/CHMcMcnxD/HXw
X-Gm-Gg: ASbGncuOYVCbCiL4O/5zksOeu03ZQQPN8+HaSRopm8OPwVACBJn8KQOEgLV91CWNH6r
	1H6y1MV8zBiM2cZ4KhsAslUtl7UaUd2gem2usaqMo52tdAbOH95yemoXvl1eSABU9qlEnoU1Ytg
	a+x85KkV8L7Q5NacX7maw9jafioMp9t7lv8q8in9oqMvUpgEKLPPkIm/VuM8e4tBcXqAHt++aD8
	ELB69rJnZvWu4J+tMV7OENgFu+0BgE9VZlZaVvRk/gu1mFrkKV4UdMxBPXeIjtezQoD/a22h2Lx
	/YsAm8CLYMeunMo3R4olxHTXa3QZ0PFc/HRVp10+CYC27KBGy8WC9Ifj/Zcz5g==
X-Google-Smtp-Source: AGHT+IEXzCCiubt81RW1wi6RFEHYltK/oaPaOx3dmFCiO+oaQEWxGttGT69QR500LAaVhusnkX27aQ==
X-Received: by 2002:a05:6a20:9f9b:b0:21d:98c:12c9 with SMTP id adf61e73a8af0-22011301db3mr3894104637.21.1750313818767;
        Wed, 18 Jun 2025 23:16:58 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-748e82ec1cfsm2985599b3a.91.2025.06.18.23.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 23:16:58 -0700 (PDT)
Date: Thu, 19 Jun 2025 14:15:40 +0800
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
Subject: Re: [PATCH v8 0/6] arm64 support for Milk-V Duo Module 01 EVB
Message-ID: <u3lfltybaxk5uwilajx3qx2xh4b6izrjzduzepbyn27sym2kqz@trabsvy4mdl6>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>

On Thu, Jun 12, 2025 at 03:28:08PM +0200, Alexander Sverdlin wrote:
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
> v8:
> - moved sdhci0_cfg and uart0_cfg pinctrl nodes from module into board .dtsi
> - dropped Inochi's RB tags from the patches affected by above changes
> v7:
> - dropped all reset stuff again; it will come independently in [5] and is
>   fully compatible;
> - rebase onto sophgo [6] for-next (3a8cef361be5) (almost v6.16-rc1)
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
> [5] https://lore.kernel.org/all/20250608232214.771855-1-inochiama@gmail.com/
> [6] https://github.com/sophgo/linux.git
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
>  .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 76 ++++++++++++++++
>  .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 40 +++++++++
>  arch/arm64/boot/dts/sophgo/sg2000.dtsi        | 86 +++++++++++++++++++
>  arch/arm64/configs/defconfig                  |  4 +
>  8 files changed, 221 insertions(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (81%)
>  create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> 
> -- 
> 2.49.0
> 

LGTM, I will merge this patch next week if there is no other
comments.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
