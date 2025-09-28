Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF46259CA7
	for <sophgo@lists.linux.dev>; Sun, 28 Sep 2025 04:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759032579; cv=none; b=rDDQHUtNOW08EbF6hDos+LblSFSoc9RznoKwXR4COk58t7p93dQ6o89LgKhKTHYX7DdYKzgyKDM0nPgsSc40U9L+yRaxO1DjhSUwgpZlksonE45WJ8mMuSDKpAeVNF5a9q080MQGA/FK1eV6eF9/6DWg7eqgfahR8DB7p8FpaaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759032579; c=relaxed/simple;
	bh=ppgPIKlu2iwHEjqboBOGgnKid4AqYkM2ae2uE+cqzB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=onhPITTQXsUhvDPFTvbTBcyddMH7gQgta6L8bF66jTV+5qWxoZ0pz1RRtVVB3wsSlkK8jDM+l5k8/DMuDXVPnT0u/ThTfKCeywdl0QrFTZ8yYkPXiLiHnrslx82Uj7L2ubeWbAv7kQ5pryvi6fql9M3DLUjeY1xYZVCuEc4i5sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from [192.168.2.54] (unknown [98.97.27.29])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 99396B2201D4;
	Sun, 28 Sep 2025 06:09:32 +0200 (CEST)
Message-ID: <0f581625-24d8-4b91-8935-685a837ea217@freeshell.de>
Date: Sat, 27 Sep 2025 21:09:30 -0700
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
To: Joshua Milas <josh.milas@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, unicorn_wang@outlook.com, inochiama@gmail.com,
 alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
 thomas.bonnefille@bootlin.com, chao.wei@sophgo.com
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev
References: <20250927173619.89768-1-josh.milas@gmail.com>
 <20250927173619.89768-3-josh.milas@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250927173619.89768-3-josh.milas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Joshua,

On 9/27/25 10:36, Joshua Milas wrote:
> This adds initial arm64 support for the Milk-V Duo S board
> (https://milkv.io/duo-s), enabling the serial port and sdhci0,
> making it possible to boot Linux to the command line.
>
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  arch/arm64/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 88 +++++++++++++++++++
>  2 files changed, 89 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
>
> diff --git a/arch/arm64/boot/dts/sophgo/Makefile
b/arch/arm64/boot/dts/sophgo/Makefile
> index 94f52cd7d994..68aace728223 100644
> --- a/arch/arm64/boot/dts/sophgo/Makefile
> +++ b/arch/arm64/boot/dts/sophgo/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> new file mode 100644
> index 000000000000..94cf89d423de
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
> +#include "sg2000.dtsi"
> +
> +/ {
> +	model = "Milk-V DuoS";
> +	compatible = "milkv,duo-s", "sophgo,sg2000";
"Milk-V Duo S" with "milkv,duo-s, "sophgo,sg2000"

or

"Milk-V Duo S" with milkv,duos, "sophgo,sg2000"

and dts filename to agree.

> +
> +	aliases {
> +		serial0 = &uart0;
> +		mmc0 = &sdhci0;
> +	};
Sort aliases.

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
> +&pinctrl {
> +	sdhci0_cfg: sdhci0-cfg {
> +		sdhci0-cd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-clk-pins {
> +			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <16100>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-cmd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-data-pins {
> +			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
> +				 <PINMUX(PIN_SD0_D1, 0)>,
> +				 <PINMUX(PIN_SD0_D2, 0)>,
> +				 <PINMUX(PIN_SD0_D3, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +
> +	uart0_cfg: uart0-cfg {
> +		uart0-pins {
> +			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> +				 <PINMUX(PIN_UART0_RX, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +};
> +
> +&uart0 {
> +	pinctrl-0 = <&uart0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +	/delete-property/ resets;
> +};
Needs parting of resets out from where it is now instead of
delete-property here. I don't know if that can be the same series.

> +
> +&sdhci0 {
> +	bus-width = <4>;
> +	no-1-8-v;
> +	no-mmc;
> +	no-sdio;
Unlikely to need 'no-mmc' 'no-sdio'. Test without, and drop?

> +	disable-wp;
> +	pinctrl-0 = <&sdhci0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
Please use '--base=' with git format-patch so we will know the commit id
your series is based from.

Best regards,

-E Shattow
