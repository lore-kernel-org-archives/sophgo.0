Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696341;
	b=t1JA/4COIZkSF+KVtVyXLqtnzzSwIRirhcWY1/+sLlJrmHSofUNd5o0S0pGsYJ/aEPwK
	 xMRwxWuheaKxjTXMcKH/bk3ZVQc9auFJVtdpnimCeMWKKt4oaAkx9yAxM11VX+IJa3xI2
	 N2ugd0jdPywERfVUn+GE5PicLPHU6EiYt6kLIC3CmlGwgF1mhPwKmSnN1h5c4VpsnlSEI
	 HkJpD22wEEQdd4gb7q+bwFmASq36PEPpobsqshUYGx0Qpx/bO6j03/PSB0lRtHPooDDfW
	 IMeHQSwHPpykd64vzuRR20DHoPajd3VxkHZi/eDMYRxz/HtesMKzmXWFoEZtkv7W7pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QJ9UD3j1pW2fYURqdT7DSwvvSglFpr3UgftmmRZbYoI=;
	b=ZmmN66yokznieqs5oWdX0emrxA/E0GYw10x7WlhBGPnrfHi4wVKmou7wbve1Oe0rF0r+
	 Cu+JK1KCVVfPjzfcpTk52Cde3RH81srkCX2AbyDnuIwO1saW6TJ04NY0+cKzKDTKugeIl
	 BO8DttKnbyqWtQVsjn00mNIepSxnyfJmyjHh3T/P+nfo5vVNrsXAeYPcq1uMTYw2JZbGw
	 NKlSM3Xu2DDUMOMie+q4cEIKIAktzmK82KJq2LPAcIhoMqnaWlPaxWL9wvBxT3Y0hEnvS
	 1abL5abGpsSLJShVQCWjBK3Po0IiDWL0HudsRBTpjV8R/YDcdOtOt3hl2qHtN8WpxgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KAM+qbff;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2619606A327
	for <sophgo@lists.linux.dev>; Tue,  3 Nov 2026 08:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2619606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KAM+qbff
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e93e0d86a0so5426745ad.1
        for <sophgo@lists.linux.dev>; Tue, 03 Nov 2026 00:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696340; x=1794301140; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJ9UD3j1pW2fYURqdT7DSwvvSglFpr3UgftmmRZbYoI=;
        b=KAM+qbff4TKJcFbLmqFyJ8U51TG8Bl0F+zSv3/4qRZmm1FvFVMfbXR3IUXlvCHCZee
         oOSQZ+mJHM58PIS02LQRFNcIu4m2fOwUf1Qb9DeGszYVATWL4nv/vcEpPm6qyG/iNiiX
         TgCusWvc3W0i1rgYOQi3R6J3HzcIKX0isr8qQ4syyk8WywH02yiqbmKRiPt4V2uy5Zd6
         s0BEGcyHmACNJZbmebEpyUQCK4lMOBkpc7bYBlg4MZQ1y+EH+8509b5gGracG07qo8WV
         Uzo9KiZPrZa6K7+0hjjde3HzQGsqigeaAsvbYLzZfiKoSU9fif7Ds05pUCNMly2WcUwk
         3T7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696340; x=1794301140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJ9UD3j1pW2fYURqdT7DSwvvSglFpr3UgftmmRZbYoI=;
        b=xVbRXSQu5yFbKOD773Q3gMMYX8SGEbJqvmMJ+lj5b+7UDM+z83DznHcfVNwtmMexzm
         rRZeCxXMmejTwPbXmlnE6NnZTTcdz7p1cQhtnnRVJL4nubie0dP9LYU3WJ/0YD8q6L0q
         1upWEd3OAB5Sz/I94r7kPpSVnzqTqmQqllvgdh+WAFDwfZj0DogOjOrF95RNqwpMfI/Q
         H1Q+kfbUnjV9vDn3ABC93k3JoQy9+HMjY7V5TUgYo0Spyw329JlS0PtCHKc6xmVwIPCI
         2vqrYYPHhB1aZWldIIMGtf3O9U5DXE4JsjHMh3gd5J7e4mpOh5Bb/n8pF672AvvGPfZt
         iT7w==
X-Forwarded-Encrypted: i=1; AKwUvBxm/KpLYl2qKpncf3lr3BYeF9cmNpPTnxIFdiNK5KsFdJOd/ESxp7H8oXH62/MQo+YKo6/dQY8=@lists.linux.dev
X-Gm-Message-State: APuU4Z9KXMJATOIjnOJFvkNRk8c0Y1ioQ5doKVwqrp33YX+t37pRE/QE
	xg2aeCBKgdjYG+1tYUPaQTdxs/IXgfzR6dlHPgDskDA/113xLYbAurMd
X-Gm-Gg: AYBFou3dP6VHBAvscLN/i5cFv8MHb/FTsAyx2VuV04LxyvZnLzEvXoLgqKA8odTpEvJ
	EvUFbHoJQlBSikmDn72MGbmibLiehfbixUo4GzIipCGBY81bYnTmfxEN+stxFhWXDRYq0Us58u5
	aDCWHrl3earLyX3ipFSCsfz1CHDJi5NhgaUkpGsfDlwfsiq9dMoaaFWGMTg9mXoMNvyT77m4/oB
	Ebm9AOk137Yp9GClf95BVy81+tE1A0iuqrYaM+cXKLFFOr61vVtCKV/H4JAsK/5ZZUX0/5ZYZPl
	LExlXvVmKHQFV7vhZFFD4UaW/3StztEmoANIrsJ9n1zB908Wlu4Y0JdjEbZJRrR5OlJtYFypk2U
	+D6kpUsDv21m1DFcWrXLNF5N41vC4Gk49tXSrenf6Uwa3Jr+sJd/ee0XouQotcCNq8qtvyItXga
	K/dj+RUzM6sXqFE0f30NhOyG9ynLD5HdsefnA7L7tbROJjLY9HKl1AIlIbAgeOTaZ4C5pVzQdfl
	BaAmhp424LQbRXDv4rwTRPZ1mbiU7MXcPl8GxyvRdXUxS8/NW5c5xwiKcDLPBBBRNqq+9O/XbS+
	2yMa6LWTLoVc5P1Bl1omanAgLO0VTcfgiVBpYGzJu3CVKPwd2+ggKJeq5TJPLhjnBCTG6lLQkP4
	oC3NWILtYogwtlQ/nvg9neHcCSEbLLTrviA==
X-Received: by 2002:a17:90b:1652:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3ae895a0406mr17203844a91.1.1793696340127;
        Tue, 03 Nov 2026 00:59:00 -0800 (PST)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3345662a91.10.2026.11.03.00.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:58:59 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hiago De Franco <hfranco@baylibre.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 0/3] phy: sophgo: Add USB role switch for CV18XX/SG200X
Date: Tue,  3 Nov 2026 16:58:44 +0800
Message-ID: <20261103085847.338613-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes one DTB work as both USB host and USB device on the Milk-V
Duo 256M, following the discussion in the thread "Milk-V Duo 256M: USB
peripheral mode works on mainline, how should dr_mode be handled?" on
the sophgo list. There, Inochi pointed out that a dual-role switch is the
right way and that the default should match the vendor image.

The usb-role-switch support in dwc2 hangs on this SoC. It clears B-valid
through the GOTGCTL session overrides while VBUS is present, and
GOTGINT.SesEndDet then fires back to back. The vendor kernel writes only
the ID override in the top syscon and lets dwc2 follow the Connector ID
change, and this works on mainline too, without any change to dwc2. So
the role switch lives in the PHY driver, which already owns those bits.

Test setup
==========

Milk-V Duo 256M, vendor buildroot rootfs, loaded by hand from U-Boot.
Tree: v7.3-rc5 with these changes, CONFIG_USB_DWC2_DUAL_ROLE=y,
CONFIG_USB_ETH=y. The series itself is based on current master; the files
touched by patches 1 and 2 are the same in both trees.

Tests 1 to 3 ran with CONFIG_USB_DWC2_DEBUG=y and the DT properties
applied through an overlay. Test 4 ran with debug disabled and the
board DTS from patch 3.

In the logs below, 
R=/sys/class/usb_role/3000000.syscon:phy@48-role-switch

1. Default peripheral, bare board on a PC, nothing done after boot
------------------------------------------------------------------

  # ls /sys/class/usb_role/
  3000000.syscon:phy@48-role-switch
  # cat $R/role
  device
  # devmem 0x03000048 32
  0x000003C0
  # cat /sys/class/udc/*/state
  configured

  PC$ lsusb | grep 0525
  Bus 003 Device 009: ID 0525:a4a2 Netchip Technology, Inc. Linux-USB Ethernet/RNDIS Gadget

2. Switching at runtime, same setup
-----------------------------------

  # echo host > $R/role
  # cat $R/role
  host
  # devmem 0x03000048 32
  0x00000142
  # echo device > $R/role
  # cat $R/role
  device
  # devmem 0x03000048 32
  0x000003C0
  # cat /sys/class/udc/*/state
  configured

The switch was repeated without an interrupt storm, then:

  # echo none > $R/role
  # cat $R/role
  device
  # devmem 0x03000048 32
  0x000003C0

3. Default host, on the USB & Ethernet IO board, nothing done after boot
------------------------------------------------------------------------

Only role-switch-default-mode differs from patch 3 here.

  [    3.409672] usb 1-1: new high-speed USB device number 2 using dwc2
  [    3.666655] hub 1-1:1.0: 4 ports detected
  [   72.484979] usb 1-1.1: new high-speed USB device number 3 using dwc2
  [   74.804484]  sda: sda1 sda2 sda3 sda4

The USB stick was plugged in by hand at about 72 s.

  # cat $R/role
  host
  # devmem 0x03000048 32
  0x00000142
  # devmem 0x04340018 32
  0xF300081E
  # devmem 0x04340440 32
  0x00001005
  # echo none > $R/role
  # cat $R/role
  host
  # ls /dev/sd*
  /dev/sda  /dev/sda1  /dev/sda2  /dev/sda3  /dev/sda4

4. Patch 3 as committed, debug disabled
---------------------------------------

Bare board on a PC, nothing done after boot:

  # cat $R/role
  device

  PC: usb 3-9: New USB device found, idVendor=0525, idProduct=a4a2
  PC: usb 3-9: Product: RNDIS/Ethernet Gadget

On the IO board, with a USB stick already plugged in at boot:

  # cat $R/role
  device
  # echo host > $R/role
  # cat $R/role
  host
  # dmesg | grep -E 'usb 1-1'
  [  415.464739] usb 1-1: new high-speed USB device number 2 using dwc2
  [  415.940738] usb 1-1.1: new high-speed USB device number 3 using dwc2

Before this series
==================

With usb-role-switch on the dwc2 node, "echo host" hangs the board in the
SesEndDet storm, and so does boot without role-switch-default-mode.

With dr_mode = "otg" and no role switch, writing the ID override by hand
worked:

  devmem 0x03000048 32 0x3C0  -> high-speed RNDIS gadget on the PC
  devmem 0x03000048 32 0x142  -> disconnects from the PC, host side starts

Three round trips were all correct, and ping over usb0 afterwards was
5/5. On the IO board, the hub and USB stick appeared after one toggle,
but not at boot, because usb_add_hcd() moved the PHY to host after dwc2
had already set up for device:

            at boot       after one toggle
  GINTSTS   0x05000023    0x04200021
  GINTMSK   0xd0bc3cd4    0xf300081e    (PrtInt masked -> unmasked)
  HPRT0     0x00021403    0x00001005    (ConnDet pending -> port enabled)

Test 3 above reaches the right-hand values at boot without a toggle.

Not tested
==========

 - A USB stick already plugged in at boot in the default host case.
 - Running on a master based tree: all tests used the v7.3-rc5 tree.
 - Boards other than the Duo 256M. Nothing changes on them, since the
   role switch is only registered when the PHY node has usb-role-switch.

Question
========

With patch 3, the hub on the IO board needs "echo host" after each boot.
Should the IO board overlay (sg2002-milkv-duo256m-eth.dtso) set
role-switch-default-mode = "host", or should it stay the same as the
vendor image?


Chen-Yu Yeh (3):
  dt-bindings: phy: sophgo,cv1800b-usb2-phy: Add USB role switch
    properties
  phy: sophgo: Add USB role switch support for CV18XX/SG200X
  riscv: dts: sophgo: sg2002-milkv-duo256m: Enable USB role switch

 .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml |  11 ++
 .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  |   7 +-
 drivers/phy/sophgo/Kconfig                    |   2 +
 drivers/phy/sophgo/phy-cv1800-usb2.c          | 107 ++++++++++++++++--
 4 files changed, 119 insertions(+), 8 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

