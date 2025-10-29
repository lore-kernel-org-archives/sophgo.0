Received: from rusty.tulip.relay.mailchannels.net (rusty.tulip.relay.mailchannels.net [23.83.218.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD73E340A62
	for <sophgo@lists.linux.dev>; Wed, 29 Oct 2025 12:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.252
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761741360; cv=pass; b=bUybc9ieAP2A4+Uw1cXw8pxn9r9fmM7Sl/x4HTq8DbVcPUEshQWHL1beoH2NLHweQ0R+feVWbQtG+HT2IjLdiA/RKEBbPzfzM3Jq7e1O+KdPk+Oviu/NIEVU+86Ss0ZgU56WLTsHyMSu9gCVCQ/0lOh3ADelO2QcJpsPnruIyAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761741360; c=relaxed/simple;
	bh=02dEesbYfF9Lb3UCqLUaeV5MqepJFchgx9QTccnHX10=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=jYE4Ab3MxvBOMw5L6XIq1ZySSeffAAYBiVzj+cWQWX3jmkyjvAeshaNuEd928f5Kvz4vuaI5ibwu741ug6qMJpBhWLUCO8DavM2ylaFb08JSRCVRHXhIHeq3BypaJrlgkslz8WLA+iOoWj1dFbvp5gSgJ2/HTNHTBH8ENVIMVno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=QqCFy9dd; arc=pass smtp.client-ip=23.83.218.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="QqCFy9dd"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id F0E8B4C1FF0;
	Wed, 29 Oct 2025 12:35:50 +0000 (UTC)
Received: from de-fra-smtpout10.hostinger.io (trex-green-0.trex.outbound.svc.cluster.local [100.121.87.184])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id C55B64C250C;
	Wed, 29 Oct 2025 12:35:46 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761741350; a=rsa-sha256;
	cv=none;
	b=40AG28293lcDTnU4EkGeWjThsQv2Ycj7di6vxoaJB/Y9opRIhEx84gJhpug6FOLk9wAKDl
	Z1lIzicDSaht6T/byvPkykL+mD9tUR5FRBb86xGPit0kOW/nzzaq1tQAv/tBXZAVhuL/pj
	wybJCbB9qmlcPi1M7JK+vdacB0uMC+fflIPlC7inMEqjZULAx2gsSYMeUIgLVHiVWxJbYz
	fx4GpocbHc6WG/TjsqgZN84LCSW6Kbjshn0qc+UN0RQA08EwaJc2sa7q6OOW3GW2LfwZWM
	J6z+9EZntUNQHYt9BPXEoxlFUCz4Q3N8W8UpRJ33rE5FrVOBRsDeWp6ieMAHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761741350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Oe4ZxNABvSWDZwn7RexTLvMDd+wgT6cbVoGwGOqVxHg=;
	b=5h/1kphtPwN3wdEQwmqweaw5bDMC6d/36MrPpD09VaQjP/R0wsyTrHxki/7PMjyM7nc1GM
	LhtANWRCuKZljOlyVNYq94T0ntE9nQjFM3NeVh5TrfXIaUn2CfKzhjTDO4wfzlKjg3MRM6
	/7jtswoycquPX/TxEr0oj+RvC2yhzxLAriyBxMjqpsMSdjxBL/Efhzktnt1HYDLXpsjaUC
	LSLmXVm5gky6f0gmbNSImDaUAA6ryasDcP1OOOxUPxg0GSRusC51d+vHbvQMy38pHW2oJj
	s4pzyLIJmOEs29Q9Nf86e0/4CduBUyW96uedxwX8met0fDVdDf8aM02v6TsIXg==
ARC-Authentication-Results: i=1;
	rspamd-77bb85d8d5-bws2z;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Reaction-Whimsical: 5225e7ec7f8e8d96_1761741350820_2222081920
X-MC-Loop-Signature: 1761741350820:903895263
X-MC-Ingress-Time: 1761741350819
Received: from de-fra-smtpout10.hostinger.io (de-fra-smtpout10.hostinger.io
 [148.222.55.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.121.87.184 (trex/7.1.3);
	Wed, 29 Oct 2025 12:35:50 +0000
Received: from [IPV6:2001:861:4450:d360:2406:5e25:7480:5f0b] (unknown [IPv6:2001:861:4450:d360:2406:5e25:7480:5f0b])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cxRYC0mFQz3yqy;
	Wed, 29 Oct 2025 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1761741345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oe4ZxNABvSWDZwn7RexTLvMDd+wgT6cbVoGwGOqVxHg=;
	b=QqCFy9ddIA4yBphJF9vcN8yRLz1amgW53X5uZ/GZbSSfH3tAt2r2FUlpP0iCF34YwP40Oj
	sFAfJ1/S0R/rremkxFEv3QLx4517/PdZl2e9RIw50J8ZiUlSbqsXiiZN9jifSQ4jHqaZW4
	i5iS/hBagb67/uCzOY2u2SCTRhg1kDGrErO3t405GwQLnYya7gsBXH3Te8QeMypEuulWaV
	05TJL41XUVjk4yBRtr9+xX2L4OGyx+4WXTBWTD63hcNQIQeYtqN391MEugibgbysEAuk4J
	9Mj7euBsD/kG0vNLuWeBUlrRrDU/uIYFIto7kkx4SVuGo/+Gkc94eIPXFoT+jg==
Message-ID: <4b1b2580-63ce-4ce8-b4a9-1763d3d3a253@rootcommit.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/5] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
To: Joshua Milas <josh.milas@gmail.com>, tglx@linutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com,
 inochiama@gmail.com, paul.walmsley@sifive.com, samuel.holland@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
 thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
 liujingqi@lanxincomputing.com
References: <20251029001052.36774-1-josh.milas@gmail.com>
 <20251029001052.36774-3-josh.milas@gmail.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <20251029001052.36774-3-josh.milas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 29 Oct 2025 12:35:43 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=69020a20 a=wUKD9753dquIziLb6m98Lg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=YzZgpwwcAAAA:8 a=d70CFdQeAAAA:8 a=pGLkceISAAAA:8 a=rAE3ZbY7XHi-JfuC7_kA:9 a=QEXdDO2ut3YA:10 a=diELbSsDbaqdzccPbx55:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfAJT8EYqOXdyz75oxkACxsC0KJle9H+fVC0/lFHJ+Lv3v4L4AfKpVkFcFE9usfuSP33PfbJ396kKSwkJh363efFWzJ3RY3cLSBia1MzzRzFQ2zltbyX+ vWFcj5/jxXq8Xq+Dar3KlbCpBxnrECoGVNnZJjArKGmx6bVJYcclK1o9GM2aG+0359splJMr6JCVNQ1GAoczWYO73jGlmrwTYR2pbDZSJkycSSlM05W+W9cl RKsAXbnx38+H6b78+18fqqNuY6t+Z3qbMkrPnkdAMw7n7omyOxg1Dg6pQ/BILK6v0PU8FzLIG8puGMQ97m0H2AWzmy3DLQudAB04+1wFZ71eBGIzTsqKioAx +SL5YNUedMGsnXT9hmiNf/YBm1zcHyySmmv0DoD4sHskKHprwdBQ3kwScgP05r3CINkFDrIty5yLqLtVUlIAyOBczGx+rPl3Gz1tdw1caAiazacaae8sClTl usb62n5/lh2DDzzYN4u77WsCBUgiG3hZFJRVgxItacp24eqDJ1GqFyG6NT5mlUVn8sUGrd69Uox8wpvOIEUbiTaxSOTk/jcE7fj/BtdoWkPObS0+GvnRSgYS hm1ByLIKEy03qbnRNUozyHF2uN0vNRW5t1UkRNv+PrrtNEseWcO5hPpJ4UDsYNShyebkNuh12ShCgo2D1vQLjITN5JoJtJAcmfNoe+QqVRr5jknIhl/9wSs7 S9jpDkI6Nw12PJ4S/vDod4X+Ly8UncV6ep7vtOPHhZik97kSMcPbBz+SJBI8+Sk5Leb/jKY83uanH0buHkkV970sV0ye6A4TbWvoHdVVk9VnpZbo2g6qDJjy GFSaO/WMlRzVMVyN5eb24+WII2lh13uwsKjMMtvY0eotLVjKrcQzto4Phlf2oEBg1S4zo4l8zog8mCeIvn1ACFIsiM2eeKw8EEazWPcjTX+lhHatx4YZGzfb KcdUGJnPRVrDdBs
 yCIWrckQzm7W+P7JjDnnU3cnmds21ljOM1MX2HiwMuj1V67WAX28JIg==
X-AuthUser: michael.opdenacker@rootcommit.com

Hi Joshua

Many thanks for this update! I'd love to have this board supported in 
mainline, and when this happens, I'll add it to Yocto's meta-riscv layer 
to make it easy to use.

On 10/29/25 01:10, Joshua Milas wrote:
> Adds initial arm64 support for the Milk-V Duo S board
> [1] making it possible to boot Linux to the command line.
>
> Link: https://milkv.io/duo-s [1]
>
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>   arch/arm64/boot/dts/sophgo/Makefile           |  1 +
>   .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 80 +++++++++++++++++++
>   2 files changed, 81 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
>
> diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
> index 94f52cd7d994b..68aace728223a 100644
> --- a/arch/arm64/boot/dts/sophgo/Makefile
> +++ b/arch/arm64/boot/dts/sophgo/Makefile
> @@ -1,2 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> new file mode 100644
> index 0000000000000..174c194e1301d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> @@ -0,0 +1,80 @@
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


I managed to boot the board and run tests:

Tested successfully:

  * uart0: boot console
  * mmc0 (sdhci0?): root filesystem

Issues

  *

    eth0:

    ifconfig eth0 172.24.0.2
    [ 48.893725] stmmaceth 4070000.ethernet eth0: Register
    MEM_TYPE_PAGE_POOL RxQ-0
    [ 48.903077] stmmaceth 4070000.ethernet eth0: cannot attach to PHY
    (error: -ENODEV)
    ifconfig: SIOCSIFFLAGS: No such device

    I believe I have all drivers enabled though...

  * emmc:

    [ 2.730194] mmc2: Failed to initialize a non-removable card
    [ 2.764843] mmc1: Failed to initialize a non-removable card

    I tested with a board that has an eMMC

  * i2c4: detected by "i2cdetect -l"
    but no devices found by "i2cdetect -r 4"
    I tried both pins 3/4 and pins 50/48, with two different devices
    connected to the bus.
    Which pins did you use? I could check the SoC pin muxing, but your
    answer will save me time :D

Would you mind sharing your defconfig file ("make savedefconfig") via a 
private message or through a link (to avoid sending the entire file to 
the list)?
Thanks again
Cheers
Michael.


-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/

