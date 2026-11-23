Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423268;
	b=q7D46wJ6qzdSp7vvOC2f2u7vkKBZtZk4FQOFXoVjVG8KwgVIIbc852jVG2XMcjZcMZQe
	 fSMW4HLN6FNeEhtWamFHj+kqe3IRGyHNzbP3Bg+5j1Yoz7FEhN/tq7sQj55JeksMe1jQf
	 zVSj1SFHI59XQBRi5wos+snQQRuI3zOEeaTe842Arw0g2CkKv5dPHut7WCqq2bNsJOHjz
	 Be986wM2dUubkG4GGSAsuiMv7/eCXOu4jVnhL8sR5dx55m/mJSXMoGhstVCfWBuvFDP+R
	 zuQZtYp4uESsZsVqDXC3NAkYhxfpdgY7BP/K+yGDsQVu1PnEUsiSmd8ym9SfnsMNfOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423268;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=weS4nh8yzJ9DgJBIRpH2X6+13bRBxiBauBejFD0MyZ0=;
	b=nDqOpBlUWYW1xmj2nFO54ga/WrRP5lIUTi45UrOEHf8un6PP0ZXzc/q81HLWRv/3YQ7y
	 G4QRCXEWA/bCp98rH6XpBvh/r0K7WLfRf+BswAxODg8as1lWutdfx7D2P2AIxnikClxKT
	 O0JODc/BAlgYa2o2WVUtDeEgpykETSvVSWGuKzu4erucin4ZOaNSRnRBsylBGcGaIWQ7d
	 09hvZ+UGaANYhvBHjSVnsBYsvH5RztU8wDG0ZKlIB+4MbnFdcdZpI94IfTjEaZBE3rm/K
	 E+dNo2GCi6MAXa3pG9yAQ7HgZtSw1T18Tg2jZtD7CQOkR+d9TCODlrUiACc8ygBqBGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bk0ytuA5;
	arc=none smtp.remote-ip=95.215.58.222
Received: from mta1.migadu.com (out-222.mta1.migadu.com [95.215.58.222])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65697606A31F
	for <sophgo@lists.linux.dev>; Mon, 23 Nov 2026 08:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65697606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bk0ytuA5
X-Envelope-To: sophgo@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=l2DP2WRCJyIifr/DPGizDAIwXyQaHH94kdBlyIJQkXM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795423265; v=1; x=1796028065;
 b=bk0ytuA5taDoTGgVafhhlm+v9MxLzRYr/Bloib4ufR6eML6dAvXr63wvEXk/tuf2ctjwJPuy
 HX2P6VLK2TeDCq8Rq6h2ECB6MQNrcsOBxT5RKiFmCoEM1KYRcS1Y6Ne/a323HlfDaCmDO2wFhAm
 8pWhr2atTDrYTbBvfDkZrVSc=
X-Envelope-To: sophgo@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 49510743510806cb;
	Mon, 23 Nov 2026 08:41:05 +0000
X-Mizu-Trace-ID: 49510743510806cb
X-Migadu-Flow: FLOW_OUT
Message-ID: <ec584c15-c49a-499d-bd79-a9f48f54dad5@linux.dev>
Date: Mon, 23 Nov 2026 16:40:56 +0800
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Enable the RTC on SG2042 EVB v1
To: gaohan@iscas.ac.cn, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261122-sg2042-evb-rtc-v1-0-f222c64cc7b9@iscas.ac.cn>
 <20261122-sg2042-evb-rtc-v1-1-f222c64cc7b9@iscas.ac.cn>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261122-sg2042-evb-rtc-v1-1-f222c64cc7b9@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/22/2026 9:33 PM, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
>
> The SG2042 EVB v1 has a PT7C4307 RTC at 0x68 on I2C0. Enable I2C0
> and add the RTC node.
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Reviewed-by: Chen Wang <chen.wang@linux.dev>

Thanks.

> ---
>   arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
> index 9f403e564694eae14913f6ab23080a6333df15ae..6ddb16eabc48a51f457449d245d63a3840b2fdef 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
> @@ -136,6 +136,17 @@ &emmc {
>   	status = "okay";
>   };
>   
> +&i2c0 {
> +	pinctrl-0 = <&i2c0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	rtc@68 {
> +		compatible = "dallas,ds1307";
> +		reg = <0x68>;
> +	};
> +};
> +
>   &i2c1 {
>   	pinctrl-0 = <&i2c1_cfg>;
>   	pinctrl-names = "default";
> @@ -201,6 +212,16 @@ sdhci-emmc-rst-pwr-pins {
>   		};
>   	};
>   
> +	i2c0_cfg: i2c0-cfg {
> +		i2c0-pins {
> +			pinmux = <PINMUX(PIN_IIC0_SDA, 0)>,
> +				 <PINMUX(PIN_IIC0_SCL, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <26800>;
> +			input-schmitt-enable;
> +		};
> +	};
> +
>   	i2c1_cfg: i2c1-cfg {
>   		i2c1-pins {
>   			pinmux = <PINMUX(PIN_IIC1_SDA, 0)>,
>
