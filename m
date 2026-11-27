Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745363;
	b=VKpA1lyzvHrKyzWvdGBR7LZpTFkhaKhGrncvpm6qYF22piO7g6DxsAayAARzRkF3yD6U
	 sG0tziAsebgIJ3ZnB7a9xRZjGmuyjjyZD4Kzk1cs83fZ2kdrfAZbjY+IfWOeuBJ/VoGwz
	 bC31mIcPtvT0Cx29yPRxB392sVMucQlyrCdVP2u1P4CwO2gZaCsIhSWFhkp5iKIpvJ9dE
	 ek7yKDKsOMRV9QqS5ddq9kdVeikLLZV7IKq0Fuxed/Jsc1QlWEP1JQ1cYFtnSpKS7Wzyc
	 RMlrtn3FLQkqMB862PJ4A7MYX2nEI+srL7RIVj3fhwg3heAf2fpqPvllJNK3lPL7rdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745363;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5xyVLo4aVAhuN/4bcfJ2QmgXh4JbtBXdir/K7eNv9sA=;
	b=KLe8ll1luxj5OihcSzFY7OkPK8H5uP+6OQbQ+f0K6q0pKM2ehiFDvPohvAbuOEpF8LYn
	 UidWIfKYOZ91VKDGr937ovlWH2B/fHSJQ9nhE6fREqzAQ6to+j2bOyYw7tYI4iyaWJgvJ
	 YvpDctwHzC4t8vsRWyniQ+Qp2n8hzQtDDqFsEVUNExmCTXmZ1EdmOj+U/9XbpQFndlj86
	 SVyuoceuBmmQ+WslNMuFDth1QKghIEUdLlzErhfxxfONHTQePF37wkHjUYCSwKIzA/YPG
	 jtrjgUbGBkjbtK0c8JZVFw5fB+mJpk8BmApokrSQjGrfRyvI3g+NxxCfEEwMrw65Skg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FNAiH7zv;
	arc=none smtp.remote-ip=95.215.58.212
Received: from mta1.migadu.com (out-212.mta1.migadu.com [95.215.58.212])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42BD606A31C
	for <sophgo@lists.linux.dev>; Fri, 27 Nov 2026 02:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B42BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FNAiH7zv
X-Envelope-To: sophgo@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=Uf7+w1e7MQPsIY8E6i2dDUScKwSbx/Crv2mQM8Yp0N4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795745360; v=1; x=1796350160;
 b=FNAiH7zvlZWALGKcW6PBGr8sdZzgwk0jgDLPoFgTQiu/d3Qg9B9iWCFE1434sGI1AwLHRyrc
 bIVWBFIZE/GkCzw7Tqaw6YBIOcn9xNNWX8AQMFh1DzDvFgPjuioMyfmOdwLm8jd3VE1l7NDCCni
 218/Czs2nx6htif30iGjf2LM=
X-Envelope-To: sophgo@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id e910dd3bd499a522;
	Fri, 27 Nov 2026 02:09:20 +0000
X-Mizu-Trace-ID: e910dd3bd499a522
X-Migadu-Flow: FLOW_OUT
Message-ID: <bc9c017c-5ae8-4946-9e68-acbabb266173@linux.dev>
Date: Fri, 27 Nov 2026 10:09:13 +0800
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
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
To: Inochi Amaoto <inochiama@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Han Gao <gaohan@iscas.ac.cn>,
 Hangfan Li <lihangfan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20261124072924.556678-1-inochiama@gmail.com>
 <20261124072924.556678-4-inochiama@gmail.com>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261124072924.556678-4-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/24/2026 3:29 PM, Inochi Amaoto wrote:
> Add eFUSE controller node for SG2044.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Chen Wang <chen.wang@linux.dev>

Thanks.

> ---
>   arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
>   arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
>   2 files changed, 16 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> index 88ddc8e793f6..2f9fca6bd110 100644
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
