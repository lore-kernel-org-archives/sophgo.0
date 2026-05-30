Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F782E7394
	for <sophgo@lists.linux.dev>; Sat, 30 May 2026 22:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780178433; cv=none; b=cZ8OVx5c8pvYiMzybI7Vny7uRlc9r4hTIMNHdIn1sHoGQZ9YY4Yy3BXSWb8h7XXlYODjlvF0D3lm1jA82MyLtiHhurg/TDzbcSpgTeuy4f5vCSzIDr6JJCtb/3QnIfhSWiN8nSu0i0rO2fR6zp8uHavultL3eZ8uunQdyymtv30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780178433; c=relaxed/simple;
	bh=8ACCvZfQgDoShinwl2YMJesKGGkT1vR9PHtGFuN5urQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vCEg1/IDZuzpVY0qw6Iw5MeV7LiCAXj7BW8v3/CDCVVpfVGViOlLqAFDDwgbV7Lcc6BSQQuAlkRobBDZyEn/TQ+qjxVaP5CjE4jNRhY+ISUkTs8lfVxJGwLPJwFds4/NL+mXRWzcjvSgF0Wf3ZUG0H7eAIAlTWcP62QYO/GaSvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=op3iBy48; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="op3iBy48"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c379e8ffso1023025ad.3
        for <sophgo@lists.linux.dev>; Sat, 30 May 2026 15:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780178430; x=1780783230; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx8cn06GRvGbPjFtz25dkBjZJsL3bsmHBqAxLucbQNg=;
        b=op3iBy48aCfsiQgI9qc5/2Rmo46SPmi+E3g4oVdQREcJ+Y7abvXfHRe5MudMVRtCnL
         L5SveSagn6Vbcsu165Me58+AH8gfROGv/Yhv3NmU7od+8rtLZWkO/6JmmWcsy7A2jCMg
         tPbUOiQ+4R25bAMC3jLV1V5ikl0feUvEmoCeOsCXnyHtKLeJi2BuKLENWvI++B1dF4XX
         6qqA8AjqeFiqqfaZWODy0M1XEPfeS+RemaWXQDObUw3dpb+t+enH5R/CsL0qbxMPj2Os
         DyJwAATdRvIubIObGCyNp+yzhuaWkbZ1PpVzUOFfMGiKBI7P6JTxE0FNgkxXFkaWOrju
         bDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780178430; x=1780783230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sx8cn06GRvGbPjFtz25dkBjZJsL3bsmHBqAxLucbQNg=;
        b=pwtoliWik1Qj+WiaFvosygaaUn9BfVAWSZGaBw7abIdvCL7F7r6nAsQ/0gNMEpk47w
         +2hEYMbDlEp5x/v86UEhUdrVUMK58tRaEstAQtzmABU3ZSedNlILeVfI5AIivO71o11N
         kgEAejc9lLIJQlse1otCIi2ObynA1QtrARAUY8oxUf0dXlAmG24MxCwoLs5Q0jULtwmC
         PVLDgB7k5iGgo40ZOIapm4uttU9j7v6M2nRK1sKJ9iG0SWbGyu/bihOQ4inrGh7ydhkn
         9uwGXCIGQ6uDC31nfeW/Py0OjFmAlNp3+7EGLM3rq/flmNIANNphiN3+GOHUolBoiVi6
         WfyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qfYUZCZphEVPV2NV76OQZQ1VF3zF3Om4bAAiH+W76p6vLP29S2u/m+nUQYN2+Y4N0GxmIur8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRN7zNhV+M2boG9PYCr17wfuvpvdYGk/bCCukENkvvJDZzsGXi
	5iKxH1vZ5oyyHhxWxbc0XpUJxojg/EKg8mm6Oq9P3IbTX/3xp1WEfCEo
X-Gm-Gg: Acq92OGfn/n0gmycQcUZhhdK+N7cFJhV7HUsB0EbG/ftffXp1e+mACSoPNu1zolJQTs
	Xj2HwmSoakri/j0QiwMmmH3znDpQ0OF4/T7ymeUKZ3mfXq3eYM3sukjPc4Cb1on5QHIXqXbT9NB
	zQ9pJ98SdAfev9lsXIvEy/KCmz0xt2f3leex7xZsu+hqlWNXqkeC/GIKChzaPIrHRtK9GoHThTB
	QEHljCgTXssFYtR+FoqlD4BOs02ZVoy5rbJ62GdvkgSiUyaUu5EqUiVOiGxfaWrEfuvAzzfyxC+
	bJJDE2ZcoARCLgE8KqV+otyK0JTsXH+O03IofZ/kAlBdcUVHsXggT58c2QEUzrvMaXdkYX+dDyN
	65Q8veyM9h5U304QnnF8ceO8/5v74ePcfgOXbA7xQqIv12lv0uk6C5wZq6GJjyXmnMfpT2H8elV
	YndnjQX15+kefGfhlGgwv1T17oEMxXAfg5uw==
X-Received: by 2002:a17:902:f651:b0:2b2:5314:e96a with SMTP id d9443c01a7336-2bf3688ab6dmr56121035ad.34.1780178430477;
        Sat, 30 May 2026 15:00:30 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fdf0asm57301565ad.26.2026.05.30.15.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:00:30 -0700 (PDT)
Date: Sun, 31 May 2026 06:00:16 +0800
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
Subject: Re: [PATCH v5 RESEND 5/5] riscv64: dts: sophgo: add initial Milk-V
 Duo S board support
Message-ID: <ahtdkX3ZCraGxVcV@inochi.infowork>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-6-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530173347.33533-6-josh.milas@gmail.com>

On Sat, May 30, 2026 at 01:33:47PM -0400, Joshua Milas wrote:
> This adds initial riscv support for the Milk-V Duo S board
> [1] making it possible to boot Linux to the command line.
> 
> Link: https://milkv.io/duo-s [1]
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
>  2 files changed, 86 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> 
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 6f65526d4193b..58cc6b70d8de4 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
> diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> new file mode 100644
> index 0000000000000..8632470f43ab0
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
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

Adding all the necessary aliases here.

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

pinctrl is needed, ses sashiko's reply.

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
