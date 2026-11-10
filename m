Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294584;
	b=0rU1P8YokSelp7ZKJDZvIFnibNS2b64m6WzORbcdMBhXFPcR7w4Hbwq0gpp6LCnF5TI8
	 q5elteEji2tFJCneGBrT7LQPETeZHA8Nh6kVckSb3p4qr3s8KYZ+CzvLMz3CkDyTolStY
	 sam6ZcfGntav3TmBAJbkDIFG/a8S7ih/7Bcr18824M9Ve0XRneixF7LJ6IZH2ZDIdNwv1
	 wicMpFgUjx8j5N8murXwy0yiaxheKG+cZuxUXdmfyguJcCUYYf7fObcOLfPgs95J5mrBs
	 mIi/ULAIFVvsNBZvGWql7V9xFEt0M2zyGnEg+34MYJldNlPRXJWx3ELE7O4mzpHxfNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8o8wjjmrwoQdO4Xnhs54i8QvAQRlpkIVByEC39d22TI=;
	b=KXJn0DU8kmXfIf5PAT1l9r985VSYlcrqr0VIheGzRsaEcra9Ry8lZveJ6a6ZwmmTfkgN
	 PceU2M0u92TPZxy7rj3m6bScED/lZ3Qwc8VsbO8Qskj976H+EypAxFSVSr4xlVrDO8hSc
	 dVJijPJ45GmAV/q/6zwQO3TTIsuYe1LdGEVOwgGMSarLJxd9f5ckSNEErEefZTtzUVvYz
	 XlQTV4AKHTl4HGJ2oURSTKT2QgKcxkuMh8x1z+Vrz1V3x+taRnwMaUCh0PmraiakfCP0T
	 jMEqyc4utSwqas4f5qqKQFF2usKOgWcHUDKrz6uFu/uz6a01JWCIR54yaD1IEZuWsJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XTf69syH;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DA4606A326
	for <sophgo@lists.linux.dev>; Tue, 10 Nov 2026 07:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79DA4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XTf69syH
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e987b4a710so7996535ad.1
        for <sophgo@lists.linux.dev>; Mon, 09 Nov 2026 23:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294583; x=1794899383; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8o8wjjmrwoQdO4Xnhs54i8QvAQRlpkIVByEC39d22TI=;
        b=XTf69syHzbIoTgyjrZ25e5sHcRAP/ObNuR1FU6AUt7zrttrOJKAR1st9Hg/TjnMw8h
         evgi5Z49JYt91dIh2dTrdTUb3cccbRhvOiYoJctYOLFD3jqWDxVlB5RlIYPNGixFuVgB
         pdlpF4sMPvIP2SnREde3vWwxhtbhfmCrHihTX59a6LfYx8zKfm5t1Od9EKAovxngP7bP
         EzvuT+F3tdxmty1R8QvcJzID1kg4O6LixWx01J5sciJiVhYSNHccNdgnOamyvPBw5+sb
         Qv60V8LM07nQN65+gsc2w1ApTQve5jzdgS8/puAkXA5O0o1HJz1inES7D2lMzFNkRkTA
         4XEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294583; x=1794899383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8o8wjjmrwoQdO4Xnhs54i8QvAQRlpkIVByEC39d22TI=;
        b=ZbqsUJ4bLEz4zJNgY0Kz+mJ5U/wRVdGum0iMzrE1mrluzBvueJLJmpUJ4Ml8+SBOFP
         Ka7i2I9ZJHr4XDw62XeIUUkwB/lJ6w8o8PpHuhSlq2vEqWYrRH3SN/aTm5URQTb64lAd
         /e+5zV8zo7HUNjY6sOeMreEFQrSTWR7iaWhmbVdqa5j81g3FV+9ZTkkzVdgKOY5iHh6W
         4PQ/Hj7ALXKAIYm9clYLoCblvU40UJOJDljqB1gPLw3V8pTNEeNRua3gT12Ld2w0Lvvz
         i7itRQTz/jVv4OOGnJsngcr6oGA5z3wcUXPSZaYXaAiyPHUjRszcvdCpN4Xkn6o4U0d+
         6BXQ==
X-Forwarded-Encrypted: i=1; AL+hErHz+x2Cqsoo8Kt75ULGmFEW/6vIgJ8JmOS8sW2NQBqCAvswVRDs4nx7u+fOW0fzbGPiDhIg1xg=@lists.linux.dev
X-Gm-Message-State: APuU4Z/E763F85w3B2/7ne7aVLwEm0MIY1YvscdQSo4e7c9YA21yPutf
	yqWeJviZQg+BdH65P2jjvo9lv5snk47VeUG2H1FVgaaBA74SK/9qtFm9
X-Gm-Gg: AYBFou0EfJei5kIY9DgsvtrLfk846yDgnCI4RCZgXIzzd2mB7tvWM44/KgqHqi+IJm/
	+jhGHN6qcGFPm+I5ap8IF0ArWTA1Uv9oMlUZ/0ktoM/fvWZJds/gPGVRhMMRbxKW+L6dnDoaMuq
	GlCC7PibwNA1z3n25uzgRsCsT5HZ9pd2Jcs8yIWEV/iiOBk+RaaY1J3e4weRIMY5XIBx2T/FrIG
	lVTdaPbfKo2XkcXJHPpu/HAH0Sd+/iEKVDFD6hm/MtmnsvXkXOjrb+xFIU09wAkg8zWkkB850LY
	WjiSaf3PJq2RLPPD7aPIoCzCQ1eAgcREtsHMFiyTVQ8/uOOPK/Ytpz6cM+lGguGb7x/bK3ysKFk
	v+HMG/ygsXkiwh3EA4eS3jDCNx4h2hraDC+1bPakphNpOy6wUtlcD9xQqWgAMtVM0LwlUGwZKKD
	JqIOZulCcFCyqczMHWGR4TJWRZJdQl3HUb2saRxC+Gp5dUMyFXQlmUsGW7wU+20zEsMukTUSqRN
	qxdAtT4imWPqhIhtccgbFXWUxmctRx3ahmEroQnbNLxi3ndiEoPv+MqI0eZEg/7ypH2D2O0k6Ck
	0N3ym/G80h3DC1Ak48D5utAkF5E=
X-Received: by 2002:a17:90b:3844:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3b16797724fmr1270966a91.18.1794294582592;
        Mon, 09 Nov 2026 23:09:42 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16771b08asm2648642a91.13.2026.11.09.23.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:09:42 -0800 (PST)
Date: Tue, 10 Nov 2026 15:09:23 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Inochi Amaoto <inochiama@gmail.com>, 
	Chen Wang <chen.wang@linux.dev>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Hiago De Franco <hfranco@baylibre.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] phy: sophgo: Add USB role switch for CV18XX/SG200X
Message-ID: <avLC68zOj8WKuslb@inochi.infowork>
References: <20261103085847.338613-1-chenyou910331@gmail.com>
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103085847.338613-1-chenyou910331@gmail.com>

On Tue, Nov 03, 2026 at 04:58:44PM +0800, Chen-Yu Yeh wrote:
> This makes one DTB work as both USB host and USB device on the Milk-V
> Duo 256M, following the discussion in the thread "Milk-V Duo 256M: USB
> peripheral mode works on mainline, how should dr_mode be handled?" on
> the sophgo list. There, Inochi pointed out that a dual-role switch is the
> right way and that the default should match the vendor image.
> 
> The usb-role-switch support in dwc2 hangs on this SoC. It clears B-valid
> through the GOTGCTL session overrides while VBUS is present, and
> GOTGINT.SesEndDet then fires back to back. The vendor kernel writes only
> the ID override in the top syscon and lets dwc2 follow the Connector ID
> change, and this works on mainline too, without any change to dwc2. So
> the role switch lives in the PHY driver, which already owns those bits.
> 
> Test setup
> ==========
> 
> Milk-V Duo 256M, vendor buildroot rootfs, loaded by hand from U-Boot.
> Tree: v7.3-rc5 with these changes, CONFIG_USB_DWC2_DUAL_ROLE=y,
> CONFIG_USB_ETH=y. The series itself is based on current master; the files
> touched by patches 1 and 2 are the same in both trees.
> 
> Tests 1 to 3 ran with CONFIG_USB_DWC2_DEBUG=y and the DT properties
> applied through an overlay. Test 4 ran with debug disabled and the
> board DTS from patch 3.
> 
> In the logs below, 
> R=/sys/class/usb_role/3000000.syscon:phy@48-role-switch
> 
> 1. Default peripheral, bare board on a PC, nothing done after boot
> ------------------------------------------------------------------
> 
>   # ls /sys/class/usb_role/
>   3000000.syscon:phy@48-role-switch
>   # cat $R/role
>   device
>   # devmem 0x03000048 32
>   0x000003C0
>   # cat /sys/class/udc/*/state
>   configured
> 
>   PC$ lsusb | grep 0525
>   Bus 003 Device 009: ID 0525:a4a2 Netchip Technology, Inc. Linux-USB Ethernet/RNDIS Gadget
> 
> 2. Switching at runtime, same setup
> -----------------------------------
> 
>   # echo host > $R/role
>   # cat $R/role
>   host
>   # devmem 0x03000048 32
>   0x00000142
>   # echo device > $R/role
>   # cat $R/role
>   device
>   # devmem 0x03000048 32
>   0x000003C0
>   # cat /sys/class/udc/*/state
>   configured
> 
> The switch was repeated without an interrupt storm, then:
> 
>   # echo none > $R/role
>   # cat $R/role
>   device
>   # devmem 0x03000048 32
>   0x000003C0
> 
> 3. Default host, on the USB & Ethernet IO board, nothing done after boot
> ------------------------------------------------------------------------
> 
> Only role-switch-default-mode differs from patch 3 here.
> 
>   [    3.409672] usb 1-1: new high-speed USB device number 2 using dwc2
>   [    3.666655] hub 1-1:1.0: 4 ports detected
>   [   72.484979] usb 1-1.1: new high-speed USB device number 3 using dwc2
>   [   74.804484]  sda: sda1 sda2 sda3 sda4
> 
> The USB stick was plugged in by hand at about 72 s.
> 
>   # cat $R/role
>   host
>   # devmem 0x03000048 32
>   0x00000142
>   # devmem 0x04340018 32
>   0xF300081E
>   # devmem 0x04340440 32
>   0x00001005
>   # echo none > $R/role
>   # cat $R/role
>   host
>   # ls /dev/sd*
>   /dev/sda  /dev/sda1  /dev/sda2  /dev/sda3  /dev/sda4
> 
> 4. Patch 3 as committed, debug disabled
> ---------------------------------------
> 
> Bare board on a PC, nothing done after boot:
> 
>   # cat $R/role
>   device
> 
>   PC: usb 3-9: New USB device found, idVendor=0525, idProduct=a4a2
>   PC: usb 3-9: Product: RNDIS/Ethernet Gadget
> 
> On the IO board, with a USB stick already plugged in at boot:
> 
>   # cat $R/role
>   device
>   # echo host > $R/role
>   # cat $R/role
>   host
>   # dmesg | grep -E 'usb 1-1'
>   [  415.464739] usb 1-1: new high-speed USB device number 2 using dwc2
>   [  415.940738] usb 1-1.1: new high-speed USB device number 3 using dwc2
> 
> Before this series
> ==================
> 
> With usb-role-switch on the dwc2 node, "echo host" hangs the board in the
> SesEndDet storm, and so does boot without role-switch-default-mode.
> 
> With dr_mode = "otg" and no role switch, writing the ID override by hand
> worked:
> 
>   devmem 0x03000048 32 0x3C0  -> high-speed RNDIS gadget on the PC
>   devmem 0x03000048 32 0x142  -> disconnects from the PC, host side starts
> 
> Three round trips were all correct, and ping over usb0 afterwards was
> 5/5. On the IO board, the hub and USB stick appeared after one toggle,
> but not at boot, because usb_add_hcd() moved the PHY to host after dwc2
> had already set up for device:
> 
>             at boot       after one toggle
>   GINTSTS   0x05000023    0x04200021
>   GINTMSK   0xd0bc3cd4    0xf300081e    (PrtInt masked -> unmasked)
>   HPRT0     0x00021403    0x00001005    (ConnDet pending -> port enabled)
> 
> Test 3 above reaches the right-hand values at boot without a toggle.
> 
> Not tested
> ==========
> 
>  - A USB stick already plugged in at boot in the default host case.
>  - Running on a master based tree: all tests used the v7.3-rc5 tree.
>  - Boards other than the Duo 256M. Nothing changes on them, since the
>    role switch is only registered when the PHY node has usb-role-switch.
> 
> Question
> ========
> 
> With patch 3, the hub on the IO board needs "echo host" after each boot.
> Should the IO board overlay (sg2002-milkv-duo256m-eth.dtso) set
> role-switch-default-mode = "host", or should it stay the same as the
> vendor image?
> 
> 
> Chen-Yu Yeh (3):
>   dt-bindings: phy: sophgo,cv1800b-usb2-phy: Add USB role switch
>     properties
>   phy: sophgo: Add USB role switch support for CV18XX/SG200X
>   riscv: dts: sophgo: sg2002-milkv-duo256m: Enable USB role switch
> 
>  .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml |  11 ++
>  .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  |   7 +-
>  drivers/phy/sophgo/Kconfig                    |   2 +
>  drivers/phy/sophgo/phy-cv1800-usb2.c          | 107 ++++++++++++++++--
>  4 files changed, 119 insertions(+), 8 deletions(-)
> 
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.43.0
> 

NAK on this patch, I do not think fix phy is the right way for a
controller problem. See my new patch:

https://lore.kernel.org/linux-usb/20261110070627.217946-1-inochiama@gmail.com

Regards,
Inochi
