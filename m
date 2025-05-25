Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E911F4CA9
	for <sophgo@lists.linux.dev>; Sun, 25 May 2025 14:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748185186; cv=none; b=FKmoG5YsfAu5QK2aQQkuffjPCqc1v5QnR//Vuz3VsgzuDZ05mXNYpa0ZLXu4g6LEsZFZIGSyUe5BavJMCXjHTEAkf9EPhjvIw1d5RngVSQB/KecwmkmCjHwwC2f2fa24E2RvcjHAbb6WJplH9SxpUFc3/OeWEkG4kLQySIYQm64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748185186; c=relaxed/simple;
	bh=NWZjWwn9bggPj1MEcmOLOCAvWAB+LiAQaYSOX4JjTAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T1bbWwoctbBLHrK0dLLy/UUEtMMT4pUca++MbhTPY1L/xUl7wFfqcEvEIdtVrX6BBnRsDerX8DUNat7nmavL+G1ciTIDKhSgokHLNdNUdGZZZ06a3dltautSNfTpELrViwy+in0LFyrO8qv0Cm9DP77UuNysBMmU1HAjhi+CToU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z68CN0qw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z68CN0qw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2341d29c3bcso6270145ad.0
        for <sophgo@lists.linux.dev>; Sun, 25 May 2025 07:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748185184; x=1748789984; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXejBFEj6FRPX9mWDkSnn+w1UiFxF9d3DIj79kC12jY=;
        b=Z68CN0qwWVcAaQg7p3NoXO4LlJ3UTIgK2y/ugAy9h/S6LgrSb5fCnigSz7jkyEHuY8
         4uOzw7SFzHar/a2ZuZUk4OP3Z0RwEYspzlJDLSpz8rLUIvRCzVRjsx63H+pwYRrNnIfB
         PNvepwWScoxt5VCVYHX7KBFbVM5Z/nOVGVsCEKkthBvB+7OC/ns2eiiteVNExW8wNZ8a
         xCOrXpr7h5mgh7Ejd6t+0rrlFcNjWiPixJT4zcoHgqWzREsTSEDWIqrNa3ud2+DS1jil
         fHb2lkvGs5l0yagghQKVIJ3uqBfQkuMc2qxKFP6Po3Rj16ttcMIVl1cLE5vqkxst5nvy
         cKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748185184; x=1748789984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXejBFEj6FRPX9mWDkSnn+w1UiFxF9d3DIj79kC12jY=;
        b=Z/AOtCPMVASQKyr2WUcQNLdsKK27tsTtE/uInNe99AtdTPvgm9pZqzS4s8OKht+Vq5
         H8CxFr7L35RibIGTgZ/CdwPM7WtN3YlqpzwekF8x5OcNsguAM0uTE9D+TJWxArEByaPT
         Xrae6N1y5sTTupkL61DdnMJX1FEbctwJs2uZ0Sbx0nxe5pfgsmUacD8Hi14/C0C+SO0a
         eL8rlVUuTuUFugI8p7F/I7anloSbJAdR3JY+GfN72JAE/EQtO+plr8PZ4vxkV/ZLD1JH
         h7lWZA78AqIXdavb4z3jjdV3aPUA4XJpT7iiK71xyDBVOXzkEJE1C9HFtPzSn8x3WWyV
         PfHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTNZJhPLwkThJfn0OBGbSst/Ir1wWPUrz8/ZBMbb1bQ1XeVWZw+OEuuLzXCqxe/aKaW9O2c9k=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXTZZAjDWEYwi6V4kykiDikjoZVADH4y9DsilAc2Br4wdwKAli
	A6gr4bb3OJnZ0+Thh9pLdQoc2i3mg/shnlP5tcLO7q5DJtTQvvCZswzi
X-Gm-Gg: ASbGncuRKTx0bAgHeCpp4MvDa1E1CWzA3+4Dzs4WGxEwdjDpqEw8aDP9TNss2dONfvj
	k5TrFxzRT2amzfmrGaEezJmr+UM/OfxrKKPsq5hwMByrhb1fsMqob69gONikmgnSxUtlmdbN16m
	oWvM13pbzBC0YG+vRIWDgCIH/JDe1KYGWbmcVH0kMkd/PH44KxKRukKiVBHm510yqYqP4Bwijhn
	AFzhDc214NpWFzJjl934QtdgrY6OS0Ayl7YoXG2NHFqhfAspA4oBSIkWqovWozq1+6FJiDjqECU
	QYQL91Z4MrU7e8RC/bp+1g1W2/TDa2dgkmKeNbT2aHo=
X-Google-Smtp-Source: AGHT+IGpOn2nt4PyX10sWV3ae3HVZcjQVmBHlpCN7r+ofLFDskuKSTxzG6u7YqEh4FeY/mojwGAmSQ==
X-Received: by 2002:a17:902:e78c:b0:224:1eab:97b2 with SMTP id d9443c01a7336-23414fda854mr101170205ad.53.1748185183789;
        Sun, 25 May 2025 07:59:43 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2343f8e2fbesm12204845ad.250.2025.05.25.07.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 07:59:43 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 25 May 2025 22:58:42 +0800
Subject: [PATCH v2 2/3] mtd: spi-nor: Add GD25LB512ME GigaDevice flash_info
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-sfg-spifmc-v2-2-a3732b6f5ab4@gmail.com>
References: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
In-Reply-To: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748185167; l=5052;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=NWZjWwn9bggPj1MEcmOLOCAvWAB+LiAQaYSOX4JjTAY=;
 b=hBZ9eo0GjgMXLNujvFODlvmX5r9TUOBoz1q/wOVzuySCOg8us5GMhMWN2ZdSLtG7KtKdhmW1i
 YzuMbOt+6UhBFuwE+pW+lBOlRNFaYBAQKooQBz4XRnuFNlbPN48k0bj
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add GD25LB512ME SPI-NOR flash information.

The following SFDP dump was generated after applying the current commit.

------------------------------------------------------------------------
This flash is populated on the SG2042 Pioneer board and was tested at
100MHz frequency using the spi-sg2044-nor SPI controller.

root@localhost ~ # cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
gd25lb512me
root@localhost ~ # cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c8671a
root@localhost ~ # cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
gigadevice
root@localhost ~ # xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060102ff00060110300000ffc8000103900000ff84000102c000
00ffffffffffffffffffffffffffffffffffe520eaffffffff1f44eb086b
003b00bbfeffffffffff00ffffff44eb0c200f5210d800ffd531b1fe83d6
1458ec6006337a757a7504bdd55c2906740008500001ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffff002050169df9
8156d9c8ffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffff38ff0ff215cdcff
root@localhost ~ # sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
859eb314b0500aa3e3dc5a1ad514f1013387c7aaa40147ed2d616ffc4b6d851c  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
root@localhost ~ # #Dump debugfs data
root@localhost ~ # cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-4S
  opcode	0x6c
  mode cycles	0
  dummy cycles	8
 1S-4S-4S
  opcode	0xec
  mode cycles	2
  dummy cycles	4
 4S-4S-4S
  opcode	0xec
  mode cycles	2
  dummy cycles	4

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 1S-1S-4S
  opcode	0x34
 1S-4S-4S
  opcode	0x3e
root@localhost ~ # cat /sys/kernel/debug/spi-nor/spi0.0/params
name		gd25lb512me
id		c8 67 1a ff c8 67
size		64.0 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | SOFT_RESET

opcodes
 read		0x13
  dummy cycles	0
 erase		0x21
 program	0x12
 8D extension	none

protocols
 read		1S-1S-1S
 write		1S-1S-1S
 register	1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (64.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-03ffffff |     [ 1  ] | no
root@localhost ~ # dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.0279486 s, 75.0 MB/s
root@localhost ~ # mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
root@localhost ~ # mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
root@localhost ~ # hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
root@localhost ~ # sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
root@localhost ~ # mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
root@localhost ~ # mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
root@localhost ~ # sha256sum spi*
a2ebfaebe38974847a4efb628b29a72f1d50e78c17318869d8954b033dc32e5d  spi_read
a2ebfaebe38974847a4efb628b29a72f1d50e78c17318869d8954b033dc32e5d  spi_test
root@localhost ~ # mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 drivers/mtd/spi-nor/gigadevice.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index ef1edd0add70e6ca501620798a779d621d6bb00d..223b2f598ecd651ce8df6789dfbaf938c534f94f 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -33,6 +33,15 @@ static const struct spi_nor_fixups gd25q256_fixups = {
 	.post_bfpt = gd25q256_post_bfpt,
 };
 
+static void gd25lb512me_default_init(struct spi_nor *nor)
+{
+	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+}
+
+static const struct spi_nor_fixups gd25lb512me_fixups = {
+	.default_init = gd25lb512me_default_init,
+};
+
 static const struct flash_info gigadevice_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xc8, 0x40, 0x15),
@@ -82,6 +91,14 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x67, 0x1a),
+		.name = "gd25lb512me",
+		.size = SZ_64M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.fixups = &gd25lb512me_fixups,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
 	},
 };
 

-- 
2.49.0

