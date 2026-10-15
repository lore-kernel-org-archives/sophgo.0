Received: from mta0.migadu.com (out-218.mta0.migadu.com [91.218.175.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AE948097E
	for <sophgo@lists.linux.dev>; Thu, 15 Oct 2026 06:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046830; cv=none; b=kx9+7Yr5frH0w1uW8VqFHILdESM5SpVn1IoGetNMnaOZX8CaYu+rKIIoV03zZCILlIsdD0ONlHJ7EW6JhCckfttWGGWHOTZ4P95SL2A2uJb9GtWrOHGVX+Ondq6+TOtUD/+ax9Okgv159XYeQCvm3Syo+qHGfrzhATNgdE9tULo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046830; c=relaxed/simple;
	bh=t0IiZB/Ux47ttYhnh6RR0lffF1iWD71iJlXsK4k5DOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QR9moKkvVFhUMoUYNoaD69Fb6Lve1/FyO4xxyaafPC9T+m7P5KQ5HloH/izM72IjDwsMe2aGxWrpTVcc4obxdCXx08cVGtirc7630ubOmK+tWpUWgBK9bBM60tMVZIsnvauDkErGEh4S52Ofm7Wn77pTWi76y+lBUFKa1wE/eIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qCbV7nop; arc=none smtp.client-ip=91.218.175.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qCbV7nop"
X-Envelope-To: sophgo@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=t0IiZB/Ux47ttYhnh6RR0lffF1iWD71iJlXsK4k5DOc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792046825; v=1; x=1792651625;
 b=qCbV7nopck15dDBycDk8WGV4ktU/jaZd36GDqHO+ZwfXjPbZ3Ws7QazO26FZEgXvBXqhSJ3s
 e/lc4nDhj2vLGL4ExHRL1PwvsuXMdOX7pRY20P+CcZExjFkmr39GvofBf7YvHRKQooHdSyW9VKu
 /zTuwCbx2hP6r3QKcLH57CjE=
X-Envelope-To: sophgo@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id c8ba14fd1bd62bdb;
	Thu, 15 Oct 2026 06:47:05 +0000
X-Mizu-Trace-ID: c8ba14fd1bd62bdb
X-Migadu-Flow: FLOW_OUT
Message-ID: <861d25f6-7bcb-4b04-841e-89ed4cf55843@linux.dev>
Date: Thu, 15 Oct 2026 14:46:58 +0800
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
To: Inochi Amaoto <inochiama@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-4-inochiama@gmail.com>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261014074516.240247-4-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/14/2026 3:45 PM, Inochi Amaoto wrote:
> Add eFUSE controller node for SG2044.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
>   arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
>   drivers/nvmem/sophgo-efuse.c                         |  1 +
>   3 files changed, 17 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> index fed3d9a384a0..1b506972d465 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> @@ -36,6 +36,10 @@ &emmc {
>   	status = "okay";
>   };
>   
> +&efuse0 {
> +	status = "okay";
> +};
> +
>   &gmac0 {
>   	phy-handle = <&phy0>;
>   	phy-mode = "rgmii-id";
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
> index 320c4d1d08e6..9577aae08f7f 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
> @@ -408,6 +408,18 @@ sd: mmc@703000b000 {
>   			status = "disabled";
>   		};
>   
> +		efuse0: efuse@7040000000 {
> +			compatible = "sophgo,sg2044-efuse";
> +			reg = <0x70 0x40000000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			clocks = <&clk CLK_GATE_EFUSE>,
> +				 <&clk CLK_GATE_APB_EFUSE>;
> +			clock-names = "core", "apb";
> +			resets = <&rst RST_EFUSE0>;
> +			status = "disabled";
> +		};
> +
>   		i2c0: i2c@7040005000 {
>   			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
>   			reg = <0x70 0x40005000 0x0 0x1000>;
> diff --git a/drivers/nvmem/sophgo-efuse.c b/drivers/nvmem/sophgo-efuse.c
> index 5f90adaf8e4f..568d17b88ff6 100644
> --- a/drivers/nvmem/sophgo-efuse.c
> +++ b/drivers/nvmem/sophgo-efuse.c
> @@ -14,6 +14,7 @@
>   #include <linux/mutex.h>
>   #include <linux/nvmem-provider.h>
>   #include <linux/platform_device.h>
> +#include <linux/slab.h>
>   
>   #define SG2044_EFUSE_CONTENT_SIZE		0x400

This change is not related to DTS, should it be in patch [2/3]?


