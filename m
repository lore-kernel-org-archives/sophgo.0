Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DEA456E0B
	for <sophgo@lists.linux.dev>; Mon,  5 Oct 2026 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193099; cv=none; b=KPpRmUEW/vc/nS/mkupayxn2y0Gy3xi05XKgIR+u7MV4E8SN3ZTEoRh0d3nomoVKTY2eq9v+GIqWVzr/u4IWIzO35b5QNPHNrQGqgRXMl6Gku2LStkwS/i99WEXci8SkIYOpgc69OgTzPIf04Vu+brosP/W+ro1JLpvwRHDVUHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193099; c=relaxed/simple;
	bh=xqP/CkkXDKW6WUx5r2Zm/NU9mTw5OptnDKy0fMjk3j4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SzgLKT7KPrGHcWL3RgoRVzqY4cUPsssjzWfr4T0LbBLqcU2HRADL5U3TifSKMKAZtyD/NqdXTEOBOV/Td8UjhMPZjL8JtiZwgIKnjz50md/bbltGXqBZKLFqSuzlFJSlO8VxY6ksDZPKrPSpwuBW19DTxlDDiZoMEJCaRhpCi8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mL9B4Q3J; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mL9B4Q3J"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4c5c52d46so88438a91.0
        for <sophgo@lists.linux.dev>; Mon, 05 Oct 2026 02:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193083; x=1791797883; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pizd1CDxJLDh2tlooS3lUpX6Wou0K6RZNg4IvzQLo10=;
        b=mL9B4Q3Jqv4uQxIreTT2p2hnLojWn8tTVumdGbLnmlbF4q3PSOPOv5g87A1tSNKVs4
         amc0qawCHWRNZvkGMc03dcJnByUS7tdQKkfM/PSG5hdDrrLan/I/7tB5CJQi2mxOKorj
         6KasSuUQw4Oy8Ne2SoCvPVNepI9QUUU0iSXdjBw9D90fwDrPEJXHcCbnTDH3b/Ew5OPS
         q6ttgBTi1EwdfkB8WSiehbV+TOrWK7JVpJVA8LK1rPdqWsfDXTQFeTIhLAWiIpTW31A0
         BI2zL7a4D3TjQ7C6ivFMHkU8Fm8qozjztuaqJJionmNbtSWuFscV3ZxgolJ7yANZFSIR
         62vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193083; x=1791797883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pizd1CDxJLDh2tlooS3lUpX6Wou0K6RZNg4IvzQLo10=;
        b=NSjgfA2QekReGnpVyUKDEpnA5Z+FrzQPMJpJg1G9fV0VwDIOIaE/Je46aMvaY+qdv9
         OL64PR6kW1wqJZU5H7xnj6E31BIgU8CU/DjaHkSv8j90UKd7hgRkNrR4xiCaF8NQKU6D
         +7lFzrN3C9ErJc6uHEAV3n6Cp4cu544jrg/lepowARLMm5HzczknDuG57Rp+Fp3rb++L
         n5L0/OZXBvdcvkh7GaNQuNbhXINo74pdOrB/TEHiqfo8wumLSM9Ah9kF46zh93JGnOaf
         rPngdSWEDAZpfkJqKekElnA5Mqo+LHj+JXKbE3wC+dkEIxOldnwsz9yqwup7be86pWq5
         PcIw==
X-Forwarded-Encrypted: i=1; AKwUvBzcl/AxVBtT7u7M26YNgx+lD6NlePBk2eaykEtuZFf7/JIAiYEgbG23s34YJc1vfbypxQKnXqs=@lists.linux.dev
X-Gm-Message-State: AFq9FYIOOZCnWuu4jjbkWF0+9XId1oSNKNu0cYSdVnQxhXNKnSbsppll
	aY21DsPY76PclPehZdeIAFU0JkOrVakdLwaNAYome+e3NKz1mGoFAeLP
X-Gm-Gg: AYBFou0fZ9XPHfBVuLGMC9GCnf63dWNLlZKMwiAYDTqwge+j5n3WmZaXfwYn8Kwt8eF
	SXTQaZmYdzy0d0b8rGmsr6bV037avtN3TdZXTi6/eRFsnlnbPAlseTt47ucnxfpACsIf9bo/csH
	QxexJVO88SpbGtvTisS3O1ibeX3ck//Jkn2fukyIBdaVAHcc65MWJzHDITzE4pzgXCxtl8a9nQx
	el/INiCFwjdZrTP1uZKeqlgIBJVo9qNmYPRkaVDeDi3g/IW6aPCBMK4ukIysNWi0TsnCtCDblzO
	vf9+Du17uMFZZiKJs8nY509a0Q7bTa6lHJZ0ucnM++0NfEdDQthF9bolFUCgEU8FmEtcS/2/gJ7
	NE/RD13d1ZBiVRxakC6QCgyMYRM8WTUZu1rQuXiZhw+pGPB9F9pxIzDM/eVJKmox3ZP4ft3q6wP
	hK3EqouULubUE37blviC9snwJacmoCBMHraZN4Yx5SJqDd82DljlpL4OkcXNZ+XAgomGSccvz4a
	8Pkm6f939Skh99YAdFdeUVcOfe3G/xECHw7JoGmFvZaWHPxwoLp8vRf1w==
X-Received: by 2002:a17:90b:4f87:b0:3a8:1759:2217 with SMTP id 98e67ed59e1d1-3a81759270amr2038440a91.2.1791193082911;
        Mon, 05 Oct 2026 02:38:02 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e42026fsm10568067a91.3.2026.10.05.02.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:38:01 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 0/2] riscv: dts: sophgo: Milk-V Duo 256M ethernet support
Date: Mon,  5 Oct 2026 17:37:47 +0800
Message-ID: <20261005093749.645014-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Milk-V Duo 256M has no Ethernet connector of its own; the SG2002's
internal PHY is only usable through the optional USB & Ethernet IO
board. This series adds an overlay for that board and fixes the name of
the internal PHY node it exposes.

Changes in v3:
 - Rename the PHY node to ethernet-phy@1, as the commit message already
   said; v2 only changed the unit address (sashiko-bot). dtbs_check now
   validates the node against ethernet-phy.yaml, with no new warnings.
 - Drop the blank line in the trailer block of 2/2 (Hiago)
 - Collect Hiago's Reviewed-by
 - Keep Inochi's Reviewed-by on 2/2, since the only change is the node
   name

Changes in v2:
 - Enable Ethernet through an overlay instead of in the board
   devicetree, since without the IO board the pins may be used as GPIO
   (Inochi)
 - Send both patches in one thread (Inochi)
 - Test link-up and traffic on the IO board, which v1 could not
 - Collect Inochi's Reviewed-by on the PHY node name fix

The overlay has the same shape as Hiago's for the Milk-V Duo [1], so the
two boards stay consistent. The PHY node name fix is in cv180x.dtsi and
so covers that board as well.

Testing, with a kernel built from this branch:

 - sg2002-milkv-duo256m-eth.dtb: eth0 comes up at 100Mbps/Full, gets an
   address via DHCP and passes traffic
 - sg2002-milkv-duo256m.dtb: no eth0 is created, and the gmac node
   reads back as disabled
   
Kernel log with sg2002-milkv-duo256m-eth.dtb:

  [    1.426499] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
  [    1.426536] stmmaceth 4070000.ethernet: 	DWMAC1000
  [    6.052829] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
  [    8.138131] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx

  # ip addr show eth0
  2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
      inet 192.168.0.47/24 brd 192.168.0.255 scope global dynamic noprefixroute eth0

With the base sg2002-milkv-duo256m.dtb:

  # ip addr show eth0
  ip: can't find device 'eth0'
  # cat /proc/device-tree/soc/ethernet@4070000/status
  disabled

iperf3 against a desktop on the same switch gives 94 Mbit/s with the
board sending and 70-74 Mbit/s with it receiving, with no
retransmissions either way. The receive side being slower is not a CPU
limit on the board; I have not looked into it further yet.

v1: https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
    https://lore.kernel.org/sophgo/20260803163427.74445-1-chenyou910331@gmail.com/

v2: https://lore.kernel.org/sophgo/20261003084627.353899-1-chenyou910331@gmail.com/

[1] https://lore.kernel.org/sophgo/20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com/


Chen-Yu Yeh (2):
  riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
  riscv: dts: sophgo: cv180x: Fix internal ephy node name

 arch/riscv/boot/dts/sophgo/Makefile             |  3 +++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi          |  2 +-
 .../dts/sophgo/sg2002-milkv-duo256m-eth.dtso    | 17 +++++++++++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso

-- 
2.43.0

