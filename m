Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5AB3093A6
	for <sophgo@lists.linux.dev>; Thu,  1 Oct 2026 01:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790818056; cv=none; b=Tw4FybpOY9UtRoaPEBjjI7ow15O17TlD0Vb0+BA8bJ4WzYdLk8+BV1b+pcYDLE2Wzg4hJD9qLnSpaER1wwa/qDiNNvwt9zz17s159zajX9KuUhILXuPu8OrXxtOCLhDWM7NWXGXdgz6BPOclWd8gzM2Mo61uZ4pXiWYSN3N2oYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790818056; c=relaxed/simple;
	bh=lnDe9unyJFbdpHrGquGQ4OrAPZiUzsxp5zW2uX63dLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UuUQpFehZiLPXq148X8pm5UWRQUlVJ+gwMBzxZDRhYFdow8y54zKVBSdrzZzWl3avEXIhf97ONJ36J1iE4MkYyJ5Pkfblfl/OvW3TGkbBmFqRqyzBCE3aRcRTqlyFugNPVD0miDWcq7Ak1VU8ILpYiiFyzDZFQj8pGWzQUe8n34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YqAGcQw1; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YqAGcQw1"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c83fbd23a5so263288e0c.1
        for <sophgo@lists.linux.dev>; Wed, 30 Sep 2026 18:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790818050; x=1791422850; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Nf26PtyZyqNQ8F/dA4/jfbxWwkqjE7SC80bfURzMGRo=;
        b=YqAGcQw1jxwIPUTte8fBOQD+Vyo0Tm6UfOAKtx9zR6mEJeKlbKB6WQnPbtm6V7dHoo
         Ee647RnMld0ewcj6ZaXs7GYAzrrB1WKKEHWUe5u8KAWtgy++cZw7SAx0YrVSyLzncHt9
         Jkq+tCOs2CHlx3dX+I5CpWlMn3FjTyuhAKBFt6+Qc3zdgdpW2+UOwJNXT80Jto9S2uwz
         iwqhYIGGzwLOnmwk76de60YJjGpIo2qj31BB7hdBqRoHKhniB27xWqLZNd/jHo42yeOJ
         O08k161X7w7DBTDB/OuyLMa942C8EMKZf7U91llR27k+Q81BJKZaCzgv7xeGMg1AdDrW
         A6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790818050; x=1791422850;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Nf26PtyZyqNQ8F/dA4/jfbxWwkqjE7SC80bfURzMGRo=;
        b=pTL46eTMuaaTefopVDZXEUehedXqGpLazzcNfUf0Te4LB/9Kwmwdalkj/N2/xO592R
         D1S93XnuRonWVu58YzSN9PoPhYGVvCyFPGt1lztn90JUwIVyhClAzxJ4FBAzvs5T3Y4k
         tWSdiXA3ZKWy9apV1OzWvxxYrwzKdIOj4XCXeEm4BbM8Di/eBZgwqKwvQ1iWJ3vEdJR/
         l9h/NoXssvIq5EXRFZA7Fu9ETxWc6kj95aZ4YNHNmY5Hc3OSvT/Ht9LbgC0v+cbL0i4t
         sKOFEnIsUh3GqwG2IO2L9DFaAJWPQXRaIdEt1NXRKiUbNBKUx6TuIvaPG5qe8QRA9r7i
         fTEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRlb/+dtTC3gQzBI1g/2wlRCPN26jzgPT6VOK8TXFmoqxx8cuXFO2bhljioZbmlPHRotfQ2R4=@lists.linux.dev
X-Gm-Message-State: AFq9FYLDJMKX6W1jRYLktG2j1LuCdpRzL+sSxVsAZaBU5VkmOYaU3EC1
	PMArlLFbEs391BpBfr0U1AooJPP9AtRBf6w4oywQGgJRaE/LwMEjoi1T6BdpA8YFjUs=
X-Gm-Gg: AYBFou0MAEdUDZtJKUJTUe3ftSC+RP+hfxF+zaYF0GLmWJgwkOn4HdXP6lojY8Q5H6m
	Ddnyuq/l94EdIPQtaCDARzJvqCKiqL47xZtyMz52+0vThaal+RIWTdTK57xHJrRWsJOblHYMGGM
	MEVIqwIxXpVcDMAOVFnVbLBWVSqkTgq2+/5qWdIKa9LWi9hoNXlqe+nHIidE7xazhSp3Mowzs5u
	WphD8/O04uuesGWA8frg4+ez8RnOOPKQaAmDOcJR/LDBtmfbkPNBHJFu2o3eSlIynUshcGp6d3u
	y8i6CUl++zmXrLlC9VyP6+oSBYDl4r7/cBeuWAkEd3OjBCvQj4zVRFU8yUvsis5HbTuyPpKyKCh
	ODHwImYoyqhgcdp9YCCGq+g4I2nltybOHSe13CAq70Mj1FJAOtbQ+H1nwurRyhda4trbB/PTwNf
	YKWxw53yCn4gWSUxii+BsMl28WKp4wIWbrdc7k3AcLkaVp6QYQy8HKRL2aFr5WNgqIltnxS8R5F
	BqhWlVArFUQI4QOw0obnTn1xr73udUg8myyYSjNH1GYeD3t
X-Received: by 2002:a05:6122:e41:b0:5ce:cdfd:89c6 with SMTP id 71dfb90a1353d-5d7b414cd85mr351702e0c.10.1790818050509;
        Wed, 30 Sep 2026 18:27:30 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14c:4c5:9534::ddab])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d7fa498de7sm1536275e0c.4.2026.09.30.18.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:27:29 -0700 (PDT)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Wed, 30 Sep 2026 22:26:40 -0300
Subject: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CMBBG4Vchs3aSyqUEX8W4EOYXxkshbSEkh
 He34vJbnLNRgFcEumQbeSwadHQJ51NG3XB3PVglmXKTW9MUhj/6fi0s88iIA7xDZCt1IVZMVbY
 NpXDyeOh6TK+3v8PcPtHF34n2/QujMlumdgAAAA==
X-Change-ID: 20260930-milkv-duo-ethernet-6d73d6d054b9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

The CV1800B SoC has a DWMAC controller connected to an internal 10/100
Ethernet PHY. Both the MAC (gmac0) and the MDIO multiplexer used to
reach the internal PHY are already described in cv180x.dtsi, but are
disabled by default.

Enable gmac0 and the MDIO multiplexer to make ethernet work.

Tested on a Milk-V Duo (CV1800B) with its IO base board. The link comes
up at 100Mbps/Full and the interface gets an address via DHCP.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
Hi,

This was tested on MilkV Duo 64M (CV1800B) with the IO board, to use the
ethernet connector. Log:

root@milkv-duo:~# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq qlen 1000
    link/ether e2:b0:30:2c:e8:16 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.74/24 brd 192.168.0.255 scope global eth0
       valid_lft forever preferred_lft forever
root@milkv-duo:~# dmesg | grep stmmaceth
[    0.583766] stmmaceth 4070000.ethernet: IRQ eth_wake_irq not found
[    0.590691] stmmaceth 4070000.ethernet: IRQ sfty not found
[    0.597211] stmmaceth 4070000.ethernet: Hash table entries set to unexpected value 0
[    0.607833] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
[    0.615538] stmmaceth 4070000.ethernet:     DWMAC1000
[    0.620820] stmmaceth 4070000.ethernet: DMA HW capability register supported
[    0.628360] stmmaceth 4070000.ethernet: Active PHY interface: RMII (4)
[    0.635356] stmmaceth 4070000.ethernet: RX Checksum Offload Engine supported
[    0.642881] stmmaceth 4070000.ethernet: COE Type 2
[    0.648072] stmmaceth 4070000.ethernet: TX Checksum insertion supported
[    0.655153] stmmaceth 4070000.ethernet: Normal descriptors
[    0.661063] stmmaceth 4070000.ethernet: Ring mode enabled
[    0.666880] stmmaceth 4070000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    0.675084] stmmaceth 4070000.ethernet: device MAC address e2:b0:30:2c:e8:16
[   14.965810] stmmaceth 4070000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[   14.986562] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
[   15.050700] stmmaceth 4070000.ethernet eth0: No Safety Features support found
[   15.092635] stmmaceth 4070000.ethernet eth0: IEEE 1588-2002 Timestamp supported
[   15.114625] stmmaceth 4070000.ethernet eth0: configuring for phy/internal link mode
[   17.193586] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
---
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
index 0e6d79e6e3a4..6fcd1d1f451f 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -35,6 +35,14 @@ coprocessor_rtos: region@83f40000 {
 	};
 };
 
+&gmac0 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
 &osc {
 	clock-frequency = <25000000>;
 };

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260930-milkv-duo-ethernet-6d73d6d054b9

Best regards,
--  
Hiago

