Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803985;
	b=vScFwi4FMTLwfOzKxCwLFU3lsj0ieQ2gMgl42+b6I0b/m2hTfpBFTjoMVk47ovuv/zq1
	 kO+FNHuFo3oJC22T9qP5wjl1N/n/2OKu0tScXPfI0RCic1fL3LiiF6qzpG5F9ILwHXuvS
	 Ct48xJygLGE7+bpaxz6Hwav/9En6Ig44xiJWMfdUDjkofxVq69UJUa1aZdCQTZheFEAi8
	 flhEIGZnoqGCtO1LkkiFmKBFDh+ELOGKxoxASwm9y8wcJsGwRYygYIsiDV6MTXpQdQiiQ
	 ofc8wakTw0IKwjT7YAo1teDFT94GpQh37Rz9RK8XwJuj7jnV52x+YhFJo37aQvKNhCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=OtVIvE0LCCTII+h8nC0irSrmpYrzDs5fgAChS99QN9w=;
	b=Xc+juckQ7boNN+U/Xb2MVftBumlCJTodkbOT9jDANWSXylKXD4G/KssGpjEHGbjt1s9D
	 rdzchsfkLhCqPP7IFoKDFdPbmbiBo835wsi43G2sSXr0GN13o4xJfnrSTNOfL4q9D/pV0
	 1BgSR23Zq6DVb8ro8hxsanuArb9pimmjEuFF7/43EHMipNCmOnGmBU+XZ81bTmc5Ab+RT
	 lSIoLksFUOVjvJcy45rTfxuErifDRZ9PYlNb+NE8qYLjSGAKqwBT6QtHrscLuQ2a56vIf
	 nQJ4rKVRmQx+y6+1jGeGcNfn+iG+PCVzLE5bOruSlsGdr3To+gPW+Cpq4lYCxUgDJ0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=f05soiAV;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAAB606A31B
	for <sophgo@lists.linux.dev>; Wed,  4 Nov 2026 14:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FAAB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=f05soiAV
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0d63f60bcso11261077b3.3
        for <sophgo@lists.linux.dev>; Wed, 04 Nov 2026 06:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793803983; x=1794408783; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OtVIvE0LCCTII+h8nC0irSrmpYrzDs5fgAChS99QN9w=;
        b=f05soiAVzWy6zC9Iu9C1R6L0iMWS3IiWRR9eprcxAohuSCeM2IsKYcbe0ElMxrMp9S
         X37hb1WrISYLvLogKkpPswtsHSvAcNGPYUzDT0el78kR0XxNz3qhiunVSfCHPvlF8+wY
         eiSK84Ye4sjUq0fIH3yaPrdXLIcS4ZeXu7c5305Gi6pRJjHAignxTpHbysngZFGFb43h
         XG+pv52sYZyKW1TQcXNzyDBv9xkoQjVpicmrblPWhOk6qa8ehR7+s8TEm8BQe3j185Np
         mLDAuVVyFGVYZ4zYpF8ItWqpDjetqLHndvFQcCBXiU5UOGlREwY0rU30BD97bYA8hyqG
         GukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803983; x=1794408783;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OtVIvE0LCCTII+h8nC0irSrmpYrzDs5fgAChS99QN9w=;
        b=JFMS5AKFt9BbOoKtSUW5NfflH+E6CfsdfQ9XwwFKW//NlygjxvVifngNTU8C0cJt3z
         qwkI0qm6gVIJ6mqnXNz3fQqkS4vLBqkNP48G4u2lLBi9q+g/ZUCXQk6yxt8GfvBnxb08
         f2pwwMf3gRP2PvMCfEiuHEHjhRy6J3LQ4MJM/6JD+csLR4mm8sAS78XRTHk1E3jfNFP0
         Tu5P0nnCw3xlmFiJmdmh1tSP5mt/0v/57q20hdsjZS00vU4paUpLtIgYr9bTBoGM0a2Z
         kON2qx1la0XD0R0v0Qa7Vo4D9IcSNSbCoY4d3TjSwvF95kPe+rfbdxDiiH/3TDeNPJDD
         R1Kg==
X-Forwarded-Encrypted: i=1; AKwUvBxq/J6i5l9mrHcbphz9SZlef70wcvXKRzq9jN8sXZ4xSnfK5BqOBwFQgYXr8dO7ybOoyH4nbQk=@lists.linux.dev
X-Gm-Message-State: APuU4Z9+gwe0zoewDYBz3SLVOT1AiXHRyiQOL7igaW01cvKlw9Ftflek
	IIJz+HouGnApSz4hapSUoLOfB4ZpEofRlg5xJxIhDsxm8UN448caPWm3UbyEgOOdL4I=
X-Gm-Gg: AYBFou2gDJDt8WIY/PaRvYruhaWwS9dr+sPJy/CdO6ruyTh8UlnUzIDDW98cJJw5Xn/
	YF3mFswL/lFG6/xfv9JgTGgzi4QaAGeFTWgAdj2ESMkq6Qg2LyhpuYZdywX5xZhVfFx2br0EWeq
	z+tAzBt8P0g8CtEjbx087jFgLV80RFUQbkC/v8WMWW7l2he9AM1mgGgLg29hdQPuutZaer10gM1
	p/VX4/WD36FkfW2Rr6GCdkxTROz5+L4EULt1HoJGcf4dQokt5995gIJKqe+WyxEf8hiQk6cI2da
	dZVq/YXY/7lJMSHc/nF4P5QLOICJyghnJNZt9PSW6QqIJfldtltLiJkgbkHiQM5b24PE6IdMbdS
	goe0QHRC0wod9g5UrkJbEr9ajSRNaPGmAe2rTV6Ln0I/fV2yYOWX+fZjl7g/RAeXsGpFrifsQav
	X4vtaaDveOGuPcP2mtZ3ZvNTXKu3p0MtVA+0GcKkhmhMRwXqa0X6zuRUpxox6CSIcK6t9UVAPfy
	he2YEnc9wmI6UphHoUEHC/RULnud/ohZeIRaYBlFvQr980y1nza43z387uh5VEMH/krkp10ZKKb
	d6TxjOUsryiSBLPe4YttRiMfUrPryldaJakGEe5s/Idg+uYqXNj5Vwj2tR8pHEbCAlG6
X-Received: by 2002:a05:690e:80c:10b0:67a:7b76:a5b2 with SMTP id 956f58d0204a3-67ba50235b4mr7893297d50.99.1793803983078;
        Wed, 04 Nov 2026 06:53:03 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee24498dsm1569080d50.10.2026.11.04.06.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:53:01 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Subject: [PATCH v2 0/2] riscv: dts: sophgo: add cv1800b ethernet support
 overlay
Date: Wed, 04 Nov 2026 11:52:32 -0300
Message-Id: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr2Jm7ZgWiqAr72FYtGWQUaCmhUZCu
 LuAB3D5kvffnyGQZwpwPczgKXJg16+QHA9gG90/CLlaGRKRnKUQEjtuXxGr0SENDbpIvtUT2jr
 P00Kpi1YC1u3bU82fvXsvfxxG8yQ7bLHNaDgMzk/7cZSb9+8jSpSYF8ZKlak6zczN6Kll4+lkX
 QflsixfiH8Pfc8AAAA=
X-Change-ID: 20261001-milkv-duo-eth-overlay-cf7738449a40
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

Hi,

The first version of this patch added a board specific ethernet overlay
for the Milk-V Duo. During the review it was pointed out that the Milk-V
Duo 256M already has an identical overlay, because both boards just need
gmac0 and the mdio multiplexer from cv180x.dtsi to be enabled. Instead of
adding one overlay per board, this series makes that overlay shared.

1/2 renames sg2002-milkv-duo256m-eth.dtso to cv18xx-eth.dtso. Only the
file name and its comment change, and the composed DTB for the Milk-V Duo
256M keeps the sg2002-milkv-duo256m-eth.dtb name.

2/2 composes the same overlay with the Milk-V Duo DTB, adding
cv1800b-milkv-duo-eth.dtb.

Changes in v2:
- Use a single shared cv18xx-eth.dtso instead of a board specific overlay.
- Rebase on v7.4-rc1.
- Link to v1: https://patch.msgid.link/20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com

Testing on a Milk-V Duo (CV1800B) with its IO base board, booting the
Milk-V Duo DTB with the ethernet overlay applied by U-Boot:

U-Boot 2026.10-00013-g3c998cf93c4f (Nov 04 2026 - 11:35:44 -0300)milkv_duo

DRAM:  63.3 MiB
Core:  22 devices, 15 uclasses, devicetree: separate
MMC:   mmc@4310000: 0
Loading Environment from FAT... OK
In:    serial@4140000
Out:   serial@4140000
Err:   serial@4140000
Net:   eth0: ethernet@4070000
Hit any key to stop autoboot: 0
** Booting bootflow 'mmc@4310000.bootdev.part_1' with extlinux
1:	Duo-OS (Milk-V Duo Boards Distro)
Retrieving file: /Image.gz
append: root=/dev/mmcblk0p2 ro rootwait console=ttyS0,115200 earlycon=sbi
Retrieving file: /cv1800b-milkv-duo.dtb
Retrieving file: /cv18xx-eth.dtbo
Retrieving file: /cv1800b-milkv-duo-led-blink.dtbo
   Uncompressing Kernel Image to 0

   Booting using the fdt blob at 0x82200000
Working FDT set to 82200000
   Loading Device Tree to 000000008355e000, end 0000000083566fff ... OK
Working FDT set to 8355e000

Starting kernel ...

[...]

root@milkv-duo:~# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
    link/ether 0a:6e:82:b5:51:74 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.68/24 brd 192.168.0.255 scope global eth0
       valid_lft forever preferred_lft forever
root@milkv-duo:~# dmesg | grep stmmaceth
[    0.500755] stmmaceth 4070000.ethernet: IRQ eth_wake_irq not found
[    0.500827] stmmaceth 4070000.ethernet: IRQ sfty not found
[    0.501156] stmmaceth 4070000.ethernet: Hash table entries set to unexpected value 0
[    0.524693] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
[    0.524795] stmmaceth 4070000.ethernet: 	DWMAC1000
[    0.524819] stmmaceth 4070000.ethernet: DMA HW capability register supported
[    0.524838] stmmaceth 4070000.ethernet: Active PHY interface: RMII (4)
[    0.524860] stmmaceth 4070000.ethernet: RX Checksum Offload Engine supported
[    0.524878] stmmaceth 4070000.ethernet: COE Type 2
[    0.524896] stmmaceth 4070000.ethernet: TX Checksum insertion supported
[    0.524916] stmmaceth 4070000.ethernet: Normal descriptors
[    0.524935] stmmaceth 4070000.ethernet: Ring mode enabled
[    0.524952] stmmaceth 4070000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    0.525082] stmmaceth 4070000.ethernet: device MAC address 0a:6e:82:b5:51:74
[   12.726604] stmmaceth 4070000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[   12.752406] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
[   12.792299] stmmaceth 4070000.ethernet eth0: No Safety Features support found
[   12.826448] stmmaceth 4070000.ethernet eth0: IEEE 1588-2002 Timestamp supported
[   12.826535] stmmaceth 4070000.ethernet eth0: configuring for phy/internal link mode
[   14.892433] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
Hiago De Franco (2):
      riscv: dts: sophgo: make sg2002-milkv-duo256m-eth overlay generic
      riscv: dts: sophgo: add Milk-V Duo ethernet DTB

 arch/riscv/boot/dts/sophgo/Makefile                                 | 6 ++++--
 .../dts/sophgo/{sg2002-milkv-duo256m-eth.dtso => cv18xx-eth.dtso}   | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261001-milkv-duo-eth-overlay-cf7738449a40

Best regards,
--  
Hiago

