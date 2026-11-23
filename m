Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795395466;
	b=EtSlGUhWpgbZNSPUEGecfopG2qKc/YLB54fpoBpFhssQBZqYtKLY319hMjj9WST2Exmf
	 l5gdeUgAqC1zK3sEnDsJyquMXUXcZwJ79fA3XUNwKdXDx9VF4WMlmOGUMCG4dni1QQx3e
	 sVtX8LLZjV4MRJe4iWfIrPNEHBMx43JhDDv+AsPoNRrcEH6GvxPGDS/C+5xIryScUPORk
	 53UdYXCEDU6Nk2KoQPvr8qdKWQ5oscfdngfezN/c38nqIcUFrrjMStf28WjDx6fvvswZL
	 mZz5mjyN0Ua5YaIBxBDRa0UYTO+BSnqpAnIcwvIFZ1SmyqnIkZEHEx33WR+yK3KVP4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395466;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fc8Ar5aH5Y5otKVLEatz4wwbIIdMLZtXZ0Vqbo5bjHo=;
	b=G6B9hZDxniiZubSYyzXk5I9vbBKNoGx3Q+mKOPGgnRmeMt2lFvREcWarZTdY4HFw5Ivz
	 mlCPhtxo/HfQkq3XfT2LL7G8Vh+gEB7JYAtv/d6AkvEqjd/RFgoBd5hA0Kwui4B9h359s
	 wX3vr1tbyo8eF989zS50wrsclHotAqgH0CxM3s97g4Q9DOSkY3BWL63F8qo6cdzYQvIiV
	 RG9zP/44R37U813c1JEdOkHErxVjDRvL7FwbhU6KDiTod5L9Pb7LBlAV1iJGxwgXaO7g4
	 Ww5xWyMDvB5VOVwwwQCm32yg8y16IKtN4XseTw3w9MC5nf1ekWgd4oSAPQY/tXWAoEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cgRXkngm;
	arc=none smtp.remote-ip=95.215.58.6
Received: from mta1.migadu.com (out-6.mta1.migadu.com [95.215.58.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B998D606A31A
	for <sophgo@lists.linux.dev>; Mon, 23 Nov 2026 00:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B998D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cgRXkngm
X-Envelope-To: sophgo@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=1Z+IV195TFBGbtanyq4aEdiPJ9El2Z9WkuHp4Wlnj24=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795395463; v=1; x=1796000263;
 b=cgRXkngmMNtAHuGqTXs8XGGOeo13Ta/LeISW26FYOi7oQg2o/FIQD+M5e2Iv2N9nxKZU/Gw9
 Tra2kEqSDA88+2cbvS7rvxxFriipPUP3dM4G6NWEM4MR6+TCKFZV+d5ks7t7mW17RbXy5QKFhrC
 y0kW4ehzeuiQPWRO17s7cBec=
X-Envelope-To: sophgo@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 6ddd898802172db6;
	Mon, 23 Nov 2026 00:57:43 +0000
X-Mizu-Trace-ID: 6ddd898802172db6
X-Migadu-Flow: FLOW_OUT
Message-ID: <f611948c-0462-45c3-ae69-2ae083231f2b@linux.dev>
Date: Mon, 23 Nov 2026 08:57:37 +0800
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
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: add Milk-V Duo ethernet DTB
To: Hiago De Franco <hfranco@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Chen-Yu Yeh <chenyou910331@gmail.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
 <20261104-milkv-duo-eth-overlay-v2-2-e3d2d39cf229@baylibre.com>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261104-milkv-duo-eth-overlay-v2-2-e3d2d39cf229@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/4/2026 10:52 PM, Hiago De Franco wrote:
> Add a DTB that applies the shared cv18xx-eth.dtbo overlay to the Milk-V
> Duo (CV1800B) base DTB. This enables gmac0 and the internal PHY MDIO mux
> on boards with the Ethernet IO board, matching the existing Milk-V Duo
> 256M DTB.
>
> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>

Reviewed-by: Chen Wang <chen.wang@linux.dev>

Thanks.

> ---
>   arch/riscv/boot/dts/sophgo/Makefile | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 440acd0aa55a..3c9f3530526e 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -1,5 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0
>   dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
> +cv1800b-milkv-duo-eth-dtbs := cv1800b-milkv-duo.dtb cv18xx-eth.dtbo
> +dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += cv18xx-eth.dtbo
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
>
