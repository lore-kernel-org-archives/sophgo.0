Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEB62BEFF6
	for <sophgo@lists.linux.dev>; Sat, 30 May 2026 22:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780178506; cv=none; b=mF1I2l8db+/rmLp9ekRRIqHCn5CrtpWhjqz6kSGdEE2rbgM2JzJCY9VwhdmWinegek1hCJnMWeKSMz++7r29MIDOOQ4u25TWB7sJS0pYPVyQjAmruqJNvvjcHE7/+Ld2fLMFSGtJd53Fv5MGOzGSBrxTMb0SLfTSd0HRkPkwiG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780178506; c=relaxed/simple;
	bh=4DVUohzAaXwz3eVrtrKvme/fPS4PAOQR1+cKdCnuB6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTlOk4qf0LQaae/M5lF3g2dxpJJtFhX7nDr68eeh+0OsB0fRAooSuu7MtyA/GKTGum3efjXDtlxLs0LgabCBDPhdYLDPw/jaQP4ljhQaauooODt2VdyMu2uzKfDL//5ZOSfZNug3d4hR+s5It8/uZj9H2ZhRVgqKH/yBq7or55E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IjpWtHNM; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjpWtHNM"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3698e34a567so13659128a91.2
        for <sophgo@lists.linux.dev>; Sat, 30 May 2026 15:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780178504; x=1780783304; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7n4onNHcUGonSFh3iTX+9p1SOqH/aLpn6mI3I4XkfLM=;
        b=IjpWtHNMAfx7Mrfllwf6gxbJ+C945da+YhjiAPZ6Z/CXSltmDhJix2mUp20Koi+VJk
         QKg4f8D67p6AZbTy0WdxVP6BMqbzPdGB8P6HXpgtSDNq0hbiXiJajwp/HQULvyRGBnU7
         bMgXhyLEmTRike/kd29s4bw1PwEBZukvnuJb38gjWkxKQBFluQBDcTVOg2olkvZM/uhk
         2jicGF6HXqxewp/wQRudeKhGS2JCtkGwmmKULE/LWlAGPhMgUJKMTA9EgFrdBJbq414b
         JjnwgG6p2XzmnOaZ8wyaqs7qZCRsbW3BgkxopiDRjQCJOClaB65mnLnH5wyDKDMKM8K5
         6X0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780178504; x=1780783304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7n4onNHcUGonSFh3iTX+9p1SOqH/aLpn6mI3I4XkfLM=;
        b=BJ2JKF6NnQTEWVyY9q6uqBWqoUJ254VSSQpMCwFsPnJ7GECVDWMgfe9Eci61l+3BL5
         ZBpGtf+9AKueCuRHOdslk8OGZC8PipIt35OmYXrWPYAwPWBoRpSj8Zg17oXT6JltJggM
         lyMa0ID+DFGS4S/kh65D7a5z/wO2T/M711v8emypMghVel+Qu71fMxjw1P9Ma89mG3CL
         LBbLV01TTOsG3wRxFGLFb9CQ/rOqNPKEsdwVPaS9IyyjoHPYaa/F1UM8fwyYyn/C2szQ
         JNHvRtC55WeqH2/XPwC7UsGV+ZybNGazEVlZ8VVihBXxXSCZGQ/byF0+e+1T1E+yg64N
         kzpA==
X-Forwarded-Encrypted: i=1; AFNElJ82xQaAXp/dcE6pJKd0TzUT4+zEULdL+axM5ZpmQnzW2exhsGrwcni+eG/UPnZKVftOyKryX8M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTlWQ3Qmpfh9lxlinpO2REZDvaI1eNcmXx3KsUvAZZsWpod8dW
	2w/zWwPAuGupAFlN7kg1+YPsNxuLdWBs/Ca8naNXCOOK5Pe9nWndcneE
X-Gm-Gg: Acq92OG26UQZ1EKHJEnVLlngT3fYhBxLlZE4NvYCVcnr6zIkcVbOSADHB9XCjzDY/s9
	PoB5piE6Fb57GUa4esnRxVVC/aOIReg833tf3IzAMz5oE0Yrgr+gMsd49xNu2+OnDvz0YM71R/s
	0YvKUhM4/DWK55mzHHW2KyMH1od1MsXl+ZmB5UknsDWuIrDdG3Ryn4U+HtRnBEWRDdaRZ5h1rkA
	7jKk0W8EbouPZoDRzGKQtvg7XMDecZiKBxLsAbtheOhmBk1xO5wVd1fEhiYQg1KePnF/0ejJw1y
	2pqb1s855xdwhXRfpEhkAEXgVZNLUTXGJMGpnxrBFyHxU0v8sgasUO73C1NfPn7+rQgGfL88dhy
	pzm+tebWH8fqfQaEDRHJqUdmVQc20y5l2i+1n77ttIzMnXCdHKZXSFK7p3Ac2Ma3JOpPfQBdVZ/
	FHvXFsRQYCtS16kEZKnjJjMRE+FwThXKd+hQ==
X-Received: by 2002:a17:90b:2383:b0:36d:6315:1de5 with SMTP id 98e67ed59e1d1-36d63151e6amr2613775a91.18.1780178503719;
        Sat, 30 May 2026 15:01:43 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6b7c178sm5814986a91.15.2026.05.30.15.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:01:43 -0700 (PDT)
Date: Sun, 31 May 2026 06:01:30 +0800
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
Subject: Re: [PATCH v5 RESEND 2/5] arm64: dts: sophgo: add initial Milk-V Duo
 S board support
Message-ID: <ahteG0AtGbTLexVu@inochi.infowork>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-3-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530173347.33533-3-josh.milas@gmail.com>

On Sat, May 30, 2026 at 01:33:44PM -0400, Joshua Milas wrote:
> Adds initial arm64 support for the Milk-V Duo S board
> [1] making it possible to boot Linux to the command line.
> 
> Link: https://milkv.io/duo-s [1]
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  arch/arm64/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
>  2 files changed, 86 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> 
> diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
> index 94f52cd7d994b..68aace728223a 100644
> --- a/arch/arm64/boot/dts/sophgo/Makefile
> +++ b/arch/arm64/boot/dts/sophgo/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> new file mode 100644
> index 0000000000000..8632470f43ab0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +
> +#include "sg2000.dtsi"
> +
> +/ {
> +	model = "Milk-V Duo S";
> +	compatible = "milkv,duo-s", "sophgo,sg2000";
> +
> +	aliases {
> +		i2c4 = &i2c4;
> +		mmc0 = &sdhci0;
> +		serial0 = &uart0;
> +		spi3 = &spi3;

Apply the same change for the reply on v5.

Regards,
Inochi

> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&dmac {
> +	status = "okay";
> +};
> +
> +&emmc {
> +	bus-width = <4>;
> +	no-1-8-v;
> +	cap-mmc-hw-reset;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&gmac0 {
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +};
> +
> +&mdio {
> +	status = "okay";
> +};
> +
> +&saradc {
> +	status = "okay";
> +};
> +
> +&sdhci0 {
> +	bus-width = <4>;
> +	no-1-8-v;
> +	disable-wp;
> +	status = "okay";
> +};
> +
> +&sdhci1 {
> +	bus-width = <4>;
> +	cap-sdio-irq;
> +	no-mmc;
> +	no-sd;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&spi3 {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&usb {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> -- 
> 2.53.0
> 
