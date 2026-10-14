Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D7D348C75
	for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964597; cv=none; b=rm7VugYF9s4lEoxhSrZ83X9hglccEc+FJjsYvmVGqm8tawM9wuZ+j1aSe4HNNAFTqlszsnwCivLYajaOyvZPI5LC9DoyT35MtQeYb4+m+4Uirymk4cRkli81vuvN+Z/3eJHMlo55XNkll3O/RAu+PYP8sVJidQgoNB6k0kq0dro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964597; c=relaxed/simple;
	bh=ujaHNZ0HxNM6b1uDSvp132E7v7OAmZP6KruVp066fyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j88fHGBZiQkXty697WQ4aYBZAlCq5eIpKJldB87UFVDx9XfYa94dAi+YDC2NrEeLmEmIxrOKKKelj58DClgoHVOtiQ3yZcyl3lO7MCbEVhgum+3X6yWKXbe27MKODxp6xOycnnGLTg1oLYPhtq4r5jlkGG1entPhK17WsVyY5Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPFM6p7j; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPFM6p7j"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so278828a12.0
        for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 00:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791964595; x=1792569395; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Re3PCxszI+ACi6vQTpfH46ASd+7EB91GQY8/HhKgesQ=;
        b=EPFM6p7jUmXdzTIJrbg7mwpVgP5j2SL1+NP4SZ5o6ctVnajLFb5CPY89bh5bZbk3uE
         uRqBYdzL78aQnFN8KXEwcUeg4N9OwuOQR/K0S//W6fCOVIlH4aYpbbNvyoW9J3zb5zg4
         nqyHCZmaJuKrFYadZxdJXK5cJyijx0VUSUEBda/NmVnlCa/rGrFhwVZkpcx5aD2trvAa
         yOm/JM62/CfOp8zKIVL4lzUN6nqbGXxphKk8fD2MWzWMmHEB8obXPI2Npqf7aMrsOKCW
         BWVV+nm3Nyorz/7cVlSf6VwLchKlynv7gB89A4U0rP/yghzDfUm8b4sOUwfNv3tHJ3iO
         HcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791964595; x=1792569395;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Re3PCxszI+ACi6vQTpfH46ASd+7EB91GQY8/HhKgesQ=;
        b=GSgB0ySzLizSN8Z5GqFXtYbVy9UmGBADwu7m2RtFwqSIE/1N/epVPc5jXKUxy5+mFI
         EEoKHk3JDKjTMLTW+HXbdwxkEC3e3LLWmJvLgBaGUiMqIua78R1r94QjQ85pJv2GbGMi
         EFIHJ72Ky/H9V9bz8IHtqMBqDy4wDj/Upo4rlxEbbynEkSWejzlPcoNLEffPT1Iy9YT0
         YEZ9cpNzX6unMp3DIU0IQa51dkgK/ZeQT432uu0tI9phTISrA9QHyC28KdDRVE8Quu1u
         p8gHN8aGS0tqrDHtV3a7ezgri7WFY4yJF/h5Cje4A/yxdDzO6vzcTs8tip/N3wTJEyR/
         kLtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDnWdzYk0cpy3cjbSOvFBukRVRzerCjgIMDGGA9BWf9UnPQdHNyZf/m0bfTgGtsknCVwuTig8=@lists.linux.dev
X-Gm-Message-State: AFq9FYJKEye1A0/dvnVlf8iyWmS7nDgJbn0cboJp8eirpnXcnSnvBxXI
	fO75IPJMpMnnfQ9lrHtCaM6CkxGmMhIOL87tUitCIt2X2gIKOwOsjfMW
X-Gm-Gg: AYBFou306MV275f/tdT7Ks3SKXaE2D5GcU+jKDeAC+RhxXTjJxbq5mOGWyvN8D+XJtH
	6hBVqjsSPhBbwFSsG3nu976do4PilALcCJf6TDVMR3gqkyqVhb4fk8KPnCe9HeWrYD5fOsCqIk1
	jfSS3IAtrmECblxL13zkSdCuypsfjxMgY9ACujbNqRoe1hvcD2+AJ3lulyBiVnTR5coQUvZp3fL
	qJSGAFVhuE/5gQzSD7dJWh6djhDfYcdFgqoHMArNVUuRIyZUr8HflrAX3YlDYrNm1I4RzCvd4sa
	/xdsX3eabsmhHd7AyGzosE6VyM1Eax+DhZNVd1w57+c01pBMHD6KAuIgO/NKrMkEzoHHJXJI6/x
	KtpnSOFaXEHPtIDZDOnHuWLaHjtBr4NoXtBhIR6oyWm8+9kUWBt+uF51jtnC9mWBi8rolGwVWyk
	7+AUCdJZg5I1iYAQPitdqE0e2eA3IrHwnb3vJkZjDBxV3b6RaOPP6f4DclldGkkQb2Ds4b
X-Received: by 2002:a05:6a20:568e:b0:3de:964d:662e with SMTP id adf61e73a8af0-3e16baab719mr12332244637.6.1791964595526;
        Wed, 14 Oct 2026 00:56:35 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d8052ba4asm760936b3a.60.2026.10.14.00.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:56:34 -0700 (PDT)
Date: Wed, 14 Oct 2026 15:56:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <chen.wang@linux.dev>, 
	Hiago De Franco <hfranco@baylibre.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>, sophgo@lists.linux.dev, 
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: add cv1800b ethernet support overlay
Message-ID: <as802eClIH7MpxBR@inochi.infowork>
References: <20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com>
 <as7OCfOlcnqvvE2y@hiagonb>
 <6067ebd6-83a3-4ba5-86c9-a66c3348f8e4@linux.dev>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6067ebd6-83a3-4ba5-86c9-a66c3348f8e4@linux.dev>

On Wed, Oct 14, 2026 at 10:37:01AM +0800, Chen Wang wrote:
> Hello, Hiago,
> 
> Oops, it looks like I missed your patch. Yours was for the Duo, while
> Chen-yu's was for the Duo 256M [1]; I conflated the two and ended up
> submitting only the one for Duo 256M [2].
> 
> Since we are very close to the merge window now, I don't plan to submit any
> further PRs, so your Duo patch will have to wait for the next cycle—I'm very
> sorry about that.
> 
> Could I trouble you to rebase and submit a new version after 7.4-rc1 is
> released (this also serves as a reminder for us)? We will then include it in
> the PR for 7.5.
> 
> [1]: https://lore.kernel.org/linux-riscv/20261005093749.645014-1-chenyou910331@gmail.com/
> link
> 
> [2]: https://lore.kernel.org/sophgo/aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev/
> link
> 
> I've removed some people from the email's "To" list, keeping only the
> relevant parties to avoid disturbing too many people.
> 
> Regards,
> 
> Chen
> 

Hi Chen,

Instead of taking this patch, I wonder whether it can be converted to a 
generic DT overlay file for all the supported boards, so we won't needed
to merge many duplicated patch for it.

Regards,
Inochi 

> On 10/14/2026 8:35 AM, Hiago De Franco wrote:
> > Hi Inochi Amaoto,
> > 
> > Just a friendly ping about this patch. Not sure if it was picked up by
> > you already.
> > 
> > Thanks!
> > 
> > On Thu, Oct 01, 2026 at 04:38:30PM -0300, Hiago De Franco wrote:
> > > The CV1800B SoC has a DWMAC controller connected to an internal 10/100
> > > Ethernet PHY. Both the MAC (gmac0) and the MDIO multiplexer used to
> > > reach the internal PHY are already described in cv180x.dtsi, but are
> > > disabled by default.
> > > 
> > > Enable gmac0 and the MDIO multiplexer to make ethernet work.
> > > 
> > > Tested on a Milk-V Duo (CV1800B) with its IO base board. The link comes
> > > up at 100Mbps/Full and the interface gets an address via DHCP.
> > > 
> > > This can not be enabled by default as others may want to use the same
> > > pins as GPIO, that is the reason an overlay is being used.
> > > 
> > > Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
> > > ---
> > > Hi,
> > > 
> > > This is a continuation of patch [1]. The same patch was sent before [2],
> > > and an overlay was suggested, altought it was not sent. Therefore I am
> > > sending this overlay now.
> > > 
> > > U-Boot logs:
> > > 
> > > milkv_duo# setenv fdtoverlay_addr_r 0x82480000
> > > milkv_duo# boot
> > > ** Booting bootflow 'mmc@4310000.bootdev.part_1' with extlinux
> > > 1:	Poky (Yocto Project Reference Distro)
> > > Retrieving file: /Image.gz
> > > append: root=/dev/mmcblk0p2 ro rootwait console=ttyS0,115200 earlycon=sbi
> > > Retrieving file: /cv1800b-milkv-duo.dtb
> > > Retrieving file: /cv1800b-milkv-duo-eth.dtbo
> > >     Uncompressing Kernel Image to 0
> > > \## Flattened Device Tree blob at 82200000
> > >     Booting using the fdt blob at 0x82200000
> > > Working FDT set to 82200000
> > >     Loading Device Tree to 0000000083560000, end 0000000083568fff ... OK
> > > Working FDT set to 83560000
> > > 
> > > Kernel logs:
> > > 
> > > root@milkv-duo:~# ip a
> > > 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
> > >      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
> > >      inet 127.0.0.1/8 scope host lo
> > >         valid_lft forever preferred_lft forever
> > > 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq qlen 1000
> > >      link/ether 22:9c:5e:8d:3b:0c brd ff:ff:ff:ff:ff:ff
> > >      inet 192.168.0.124/24 brd 192.168.0.255 scope global eth0
> > >         valid_lft forever preferred_lft forever
> > > root@milkv-duo:~# dmesg | grep stmmaceth
> > > [    0.580448] stmmaceth 4070000.ethernet: IRQ eth_wake_irq not found
> > > [    0.587750] stmmaceth 4070000.ethernet: IRQ sfty not found
> > > [    0.594165] stmmaceth 4070000.ethernet: Hash table entries set to unexpected value 0
> > > [    0.604856] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
> > > [    0.612359] stmmaceth 4070000.ethernet: 	DWMAC1000
> > > [    0.617641] stmmaceth 4070000.ethernet: DMA HW capability register supported
> > > [    0.625189] stmmaceth 4070000.ethernet: Active PHY interface: RMII (4)
> > > [    0.632191] stmmaceth 4070000.ethernet: RX Checksum Offload Engine supported
> > > [    0.639720] stmmaceth 4070000.ethernet: COE Type 2
> > > [    0.644915] stmmaceth 4070000.ethernet: TX Checksum insertion supported
> > > [    0.651995] stmmaceth 4070000.ethernet: Normal descriptors
> > > [    0.657911] stmmaceth 4070000.ethernet: Ring mode enabled
> > > [    0.663737] stmmaceth 4070000.ethernet: Enable RX Mitigation via HW Watchdog Timer
> > > [    0.671939] stmmaceth 4070000.ethernet: device MAC address 22:9c:5e:8d:3b:0c
> > > [   13.104870] stmmaceth 4070000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> > > [   13.125037] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
> > > [   13.172421] stmmaceth 4070000.ethernet eth0: No Safety Features support found
> > > [   13.203664] stmmaceth 4070000.ethernet eth0: IEEE 1588-2002 Timestamp supported
> > > [   13.229963] stmmaceth 4070000.ethernet eth0: configuring for phy/internal link mode
> > > [   15.278278] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
> > > 
> > > [1] https://lore.kernel.org/sophgo/20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com/
> > > [2] https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
> > > ---
> > >   arch/riscv/boot/dts/sophgo/Makefile                   |  3 +++
> > >   arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso | 17 +++++++++++++++++
> > >   2 files changed, 20 insertions(+)
> > > 
> > > diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> > > index d5c80d4ff005..adea990ad912 100644
> > > --- a/arch/riscv/boot/dts/sophgo/Makefile
> > > +++ b/arch/riscv/boot/dts/sophgo/Makefile
> > > @@ -1,5 +1,8 @@
> > >   # SPDX-License-Identifier: GPL-2.0
> > >   dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
> > > +cv1800b-milkv-duo-eth-dtbs := cv1800b-milkv-duo.dtb cv1800b-milkv-duo-eth.dtbo
> > > +dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtb
> > > +dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtbo
> > >   dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
> > >   dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
> > >   dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
> > > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso
> > > new file mode 100644
> > > index 000000000000..52c85b4e0155
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso
> > > @@ -0,0 +1,17 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +/*
> > > + * Enable ethernet support on Milk-V Duo (CV1800B).
> > > + *
> > > + * Copyright (c) 2026, Hiago De Franco <hfranco@baylibre.com>
> > > + */
> > > +
> > > +/dts-v1/;
> > > +/plugin/;
> > > +
> > > +&gmac0 {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&mdio {
> > > +	status = "okay";
> > > +};
> > > 
> > > ---
> > > base-commit: d24e8ac715de2e16a53c144005b1863660a5fbea
> > > change-id: 20261001-milkv-duo-eth-overlay-cf7738449a40
> > > 
> > > Best regards,
> > > --
> > > Hiago
> > > 
> > Best regards,
