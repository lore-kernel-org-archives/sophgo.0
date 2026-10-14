Received: from mta0.migadu.com (out-131.mta0.migadu.com [91.218.175.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EECF1AA1F4
	for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 02:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791945431; cv=none; b=BHi/l78+A6bj4QjX2zh7Pp5tJrLeCtXAb8YRdQA/8mmiNxkwO9mig82a8gpF6WcoC98+Ks/O8vcGNgXRnj9hSiLTtFT6MhVIRy5/SP7Pdlq7SyUp9eDdQJEkpTq5o6yj6cYVrf65RhUDh/1rYRrHfVuB7QtgU/d6Ws5nFeqSANY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791945431; c=relaxed/simple;
	bh=rcu2ev6aRiLQER3EqchCr6nlVZKfHN6ekGIlBz4deNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=taQzpDU92dVdytZv1Xs8xQpmIs1ZN7LXfEHl6INUQE4vuA4uYWWR0ok+/1+IiuUB9EtOXqwVM9RrUy4VYO+N2K8iKhoWBQJ7c+kGkPZcmM6MxpP7RFqqDvW3X5D+K0RP3hZDqVTVGn0g7iaiSLRzT+zki0K9cXz2vDiSdCuPnR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kUe59qsh; arc=none smtp.client-ip=91.218.175.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kUe59qsh"
X-Envelope-To: sophgo@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=rcu2ev6aRiLQER3EqchCr6nlVZKfHN6ekGIlBz4deNw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791945425; v=1; x=1792550225;
 b=kUe59qshkpgocgXyobORa+u+44QLg+cLI1lPpcPmIjjr7+XMbxwtzUfZPxxb4ZCjmN3fLzK8
 gIMt5talX6VEEalg5lodACiMeT+Z/zXrjt4q7wHayqxCCu2O1lMpdmBIdnVdedsniSqTU2ob63y
 j2HUUXTsAtS459ehp5tMW5h8=
X-Envelope-To: sophgo@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 915bb62124385542;
	Wed, 14 Oct 2026 02:37:04 +0000
X-Mizu-Trace-ID: 915bb62124385542
X-Migadu-Flow: FLOW_OUT
Message-ID: <6067ebd6-83a3-4ba5-86c9-a66c3348f8e4@linux.dev>
Date: Wed, 14 Oct 2026 10:37:01 +0800
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: add cv1800b ethernet support overlay
To: Hiago De Franco <hfranco@baylibre.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>, sophgo@lists.linux.dev,
 Inochi Amaoto <inochiama@gmail.com>
References: <20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com>
 <as7OCfOlcnqvvE2y@hiagonb>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <as7OCfOlcnqvvE2y@hiagonb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, Hiago,

Oops, it looks like I missed your patch. Yours was for the Duo, while 
Chen-yu's was for the Duo 256M [1]; I conflated the two and ended up 
submitting only the one for Duo 256M [2].

Since we are very close to the merge window now, I don't plan to submit 
any further PRs, so your Duo patch will have to wait for the next 
cycle—I'm very sorry about that.

Could I trouble you to rebase and submit a new version after 7.4-rc1 is 
released (this also serves as a reminder for us)? We will then include 
it in the PR for 7.5.

[1]: 
https://lore.kernel.org/linux-riscv/20261005093749.645014-1-chenyou910331@gmail.com/ 
link

[2]: 
https://lore.kernel.org/sophgo/aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev/ 
link

I've removed some people from the email's "To" list, keeping only the 
relevant parties to avoid disturbing too many people.

Regards,

Chen

On 10/14/2026 8:35 AM, Hiago De Franco wrote:
> Hi Inochi Amaoto,
>
> Just a friendly ping about this patch. Not sure if it was picked up by
> you already.
>
> Thanks!
>
> On Thu, Oct 01, 2026 at 04:38:30PM -0300, Hiago De Franco wrote:
>> The CV1800B SoC has a DWMAC controller connected to an internal 10/100
>> Ethernet PHY. Both the MAC (gmac0) and the MDIO multiplexer used to
>> reach the internal PHY are already described in cv180x.dtsi, but are
>> disabled by default.
>>
>> Enable gmac0 and the MDIO multiplexer to make ethernet work.
>>
>> Tested on a Milk-V Duo (CV1800B) with its IO base board. The link comes
>> up at 100Mbps/Full and the interface gets an address via DHCP.
>>
>> This can not be enabled by default as others may want to use the same
>> pins as GPIO, that is the reason an overlay is being used.
>>
>> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
>> ---
>> Hi,
>>
>> This is a continuation of patch [1]. The same patch was sent before [2],
>> and an overlay was suggested, altought it was not sent. Therefore I am
>> sending this overlay now.
>>
>> U-Boot logs:
>>
>> milkv_duo# setenv fdtoverlay_addr_r 0x82480000
>> milkv_duo# boot
>> ** Booting bootflow 'mmc@4310000.bootdev.part_1' with extlinux
>> 1:	Poky (Yocto Project Reference Distro)
>> Retrieving file: /Image.gz
>> append: root=/dev/mmcblk0p2 ro rootwait console=ttyS0,115200 earlycon=sbi
>> Retrieving file: /cv1800b-milkv-duo.dtb
>> Retrieving file: /cv1800b-milkv-duo-eth.dtbo
>>     Uncompressing Kernel Image to 0
>> \## Flattened Device Tree blob at 82200000
>>     Booting using the fdt blob at 0x82200000
>> Working FDT set to 82200000
>>     Loading Device Tree to 0000000083560000, end 0000000083568fff ... OK
>> Working FDT set to 83560000
>>
>> Kernel logs:
>>
>> root@milkv-duo:~# ip a
>> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
>>      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>>      inet 127.0.0.1/8 scope host lo
>>         valid_lft forever preferred_lft forever
>> 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq qlen 1000
>>      link/ether 22:9c:5e:8d:3b:0c brd ff:ff:ff:ff:ff:ff
>>      inet 192.168.0.124/24 brd 192.168.0.255 scope global eth0
>>         valid_lft forever preferred_lft forever
>> root@milkv-duo:~# dmesg | grep stmmaceth
>> [    0.580448] stmmaceth 4070000.ethernet: IRQ eth_wake_irq not found
>> [    0.587750] stmmaceth 4070000.ethernet: IRQ sfty not found
>> [    0.594165] stmmaceth 4070000.ethernet: Hash table entries set to unexpected value 0
>> [    0.604856] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
>> [    0.612359] stmmaceth 4070000.ethernet: 	DWMAC1000
>> [    0.617641] stmmaceth 4070000.ethernet: DMA HW capability register supported
>> [    0.625189] stmmaceth 4070000.ethernet: Active PHY interface: RMII (4)
>> [    0.632191] stmmaceth 4070000.ethernet: RX Checksum Offload Engine supported
>> [    0.639720] stmmaceth 4070000.ethernet: COE Type 2
>> [    0.644915] stmmaceth 4070000.ethernet: TX Checksum insertion supported
>> [    0.651995] stmmaceth 4070000.ethernet: Normal descriptors
>> [    0.657911] stmmaceth 4070000.ethernet: Ring mode enabled
>> [    0.663737] stmmaceth 4070000.ethernet: Enable RX Mitigation via HW Watchdog Timer
>> [    0.671939] stmmaceth 4070000.ethernet: device MAC address 22:9c:5e:8d:3b:0c
>> [   13.104870] stmmaceth 4070000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
>> [   13.125037] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
>> [   13.172421] stmmaceth 4070000.ethernet eth0: No Safety Features support found
>> [   13.203664] stmmaceth 4070000.ethernet eth0: IEEE 1588-2002 Timestamp supported
>> [   13.229963] stmmaceth 4070000.ethernet eth0: configuring for phy/internal link mode
>> [   15.278278] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
>>
>> [1] https://lore.kernel.org/sophgo/20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com/
>> [2] https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
>> ---
>>   arch/riscv/boot/dts/sophgo/Makefile                   |  3 +++
>>   arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso | 17 +++++++++++++++++
>>   2 files changed, 20 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
>> index d5c80d4ff005..adea990ad912 100644
>> --- a/arch/riscv/boot/dts/sophgo/Makefile
>> +++ b/arch/riscv/boot/dts/sophgo/Makefile
>> @@ -1,5 +1,8 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
>> +cv1800b-milkv-duo-eth-dtbs := cv1800b-milkv-duo.dtb cv1800b-milkv-duo-eth.dtbo
>> +dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtb
>> +dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtbo
>>   dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
>>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
>>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
>> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso
>> new file mode 100644
>> index 000000000000..52c85b4e0155
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso
>> @@ -0,0 +1,17 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/*
>> + * Enable ethernet support on Milk-V Duo (CV1800B).
>> + *
>> + * Copyright (c) 2026, Hiago De Franco <hfranco@baylibre.com>
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +&gmac0 {
>> +	status = "okay";
>> +};
>> +
>> +&mdio {
>> +	status = "okay";
>> +};
>>
>> ---
>> base-commit: d24e8ac715de2e16a53c144005b1863660a5fbea
>> change-id: 20261001-milkv-duo-eth-overlay-cf7738449a40
>>
>> Best regards,
>> --
>> Hiago
>>
> Best regards,
