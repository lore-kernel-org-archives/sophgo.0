Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE905297129
	for <sophgo@lists.linux.dev>; Fri, 23 May 2025 16:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017145; cv=none; b=PnPY2Yms1hMy+uyo8QiN4PmIgc/5AewK2usj8aYtbDNXUBarXC2rH06A6+eN5fsrvLrq/b2+ivRGvYNRNlskl+FKetaQeQ/uRIjuio9AXD1b6nafOpDIa91CZ8qEXcH2+pwKkaALFT9y0AMLZRDVYslwLgxQ2sV5yCOaBDwG6es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017145; c=relaxed/simple;
	bh=qhz5H1NX5PoQWAXVOCzzDUKrh6tunHADKHJCXYBF5G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tC8efaimHypJ/8dLEskIHm+CL0/gfi+Fm9g11KKcgJeZShOLeg0+aoh3Uf1lgrThOdT+H+kuoC9GC67pzP6M6de4gbBzPvi0Sh/eYu8kiEOx2jbMdrYO4LzmtVeIsGFR0Abse2qrxd1ijHUX3XofxNDmtnFwx4KoKDK8br5ePXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3ts13wG; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3ts13wG"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-23229fdaff4so787695ad.1
        for <sophgo@lists.linux.dev>; Fri, 23 May 2025 09:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748017143; x=1748621943; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GR9c+io02jCTq+nSl/IWIXfnXKi6xCCxyUhr5PW4R4U=;
        b=A3ts13wG/SwS2X8jwzHk8EBPcd+HRteGFYGFKfQ2xMUIwq8XIJVvwx3pMdiA6rWhFP
         v7rsJS1nEpnZoBKksb7cyWBh3P4UU0RITdFa8BJzqC7duXmNnCUSQvEIuidwHwh1W+cW
         iGujG8XJ4QJvn1ghhu9jserqws11d14Rxn+c8mIamW3ePDIIQG76X34dfDsUn1k1vE5U
         ddZjSIE4WaJ+dE1mphD6XuCFmYyWpfpsOKlKNXMc8KdiqubLejmF0rsSzUJm4V8GBlYX
         01UcQLFIBhhTM6B8wlwECCr0wioivLJnT4wMMoRJad6iZYMBk9rYPT27bW1wRfZSOFrZ
         QwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748017143; x=1748621943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GR9c+io02jCTq+nSl/IWIXfnXKi6xCCxyUhr5PW4R4U=;
        b=ELSFd+aXnQz799zEE1RYSDdsiakf4uVS1I3hgGalqxvlQ9jKD9M35zcbGOyKTD/IHs
         H67udzfJagsksp7Z3ac2XLsjhRrUfbGEJ87Qt2Y/0fBogYg/JssHm+pY2pGL7+Z0nkCn
         sI9RY8M+AjAgImgBdwwAd7y+bI7A1H0POn5BnJdHFOwZEPud+E74Z+F0uitigXE4roc2
         aKBIFounykBXwJ69+jBz2x5FFP9AW+lpqd2LwHKnzNvD2pbg7NRbCoe/9OQHweu4tBhK
         vCgEdW2wmvPzplrv6cVSsPjLOirSd+wgJQ6D0WzdIzhkPyd4yyvskfpdQnVwMs7kNvXj
         bWGA==
X-Forwarded-Encrypted: i=1; AJvYcCWIfVgf3D+/944QpXmsCl3tPfyJpL1kWgQpI8MZgmqnO99mRN3X1y/PAug5nbMdBS64ObxFGa4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrWCPO9RWLFnSYnlm7o765xbHuIsHySSWQtnQ8f3x29CJs50fv
	yaEF5TP16nhPyCUSv36+MOdr0qDvJOsoWG7ZaIVJgwNemRAMz8k5zF9n
X-Gm-Gg: ASbGncsoTa1lA4LZejLWWOvwTekEEemGNbzm74NQLOm9SnlhvQWxxHPZoETc/BZvG5A
	2c/kgTsVv44Z7EK4VOXoMlM2sMrDOxyefxFQ+Vvf14t+cYBQRDHp0DMHtzfPiPHE+GBnygzTk3l
	Jm9GUMe5fAu8qDudrpOPyhIi4IrlQzOW3qI7IAyhv5Zvz5Sye9FZTyrda1/6vuL148mFINV0dar
	ExQzPVhvPVFLYkHiEvwROJiDlRQARSKipiYTuT8r58Kay/rfJlIIeEbZHKKTXbh7eMIgCangkvW
	5SzMX7w2hiBOdHKbB1CmUxGiD6KbGjOhQ2I1NQElEQe0Q2xcLRE=
X-Google-Smtp-Source: AGHT+IGVlhz4RAvPDmSsoQifrgEklOGtjfVdQDVUosQRKkGJ73NY9m813v7XM0j4bfszd9ayY9WGbQ==
X-Received: by 2002:a17:903:1968:b0:231:c05f:29d5 with SMTP id d9443c01a7336-233f2189405mr47801245ad.6.1748017142469;
        Fri, 23 May 2025 09:19:02 -0700 (PDT)
Received: from localhost ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-233abb99a06sm50503205ad.254.2025.05.23.09.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:19:02 -0700 (PDT)
Date: Sat, 24 May 2025 00:18:59 +0800
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Michael Walle <mwalle@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	dlan@gentoo.org, ziyao@disroot.org
Subject: Re: [PATCH 2/3] mtd: spi-nor: Add GD25LB512ME GigaDevice flash_info
Message-ID: <aDCf84cRw0tmcAbm@calculate>
References: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
 <20250523-sfg-spifmc-v1-2-4cf16cf3fd2a@gmail.com>
 <DA3HXNN7HTD2.2NUKORU5V6CS2@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DA3HXNN7HTD2.2NUKORU5V6CS2@kernel.org>

Hi, Michael, Thank you for your reviews.

On Fri, May 23, 2025 at 01:16:50PM +0200, Michael Walle wrote:
> Hi,
> 
> > Add GD25LB512ME SPI-NOR flash information
> 
> Please have a look at [1].
> 
> This flash supports SFDP, do you really need a new entry in the
> flashdb? Could you try without it?
> 
> In any case, could you please dump the SFDP see [1], too.
> 
> [1] https://docs.kernel.org/driver-api/mtd/spi-nor.html
> 
> -michael

I was following the testing requirements from [1].
Before that, I have applied the patch:
"mtd: spi-nor: Add GD25LB512ME GigaDevice flash_info"
Because without this patch, the spi-nor device cannot be detected normally.

------------------------------- LOG ------------------------------------
root@localhost ~ # dmesg | grep -i spi
[   10.199526] spi-nor spi0.0: supply vcc not found, using dummy regulator
[   11.206477] spi-nor spi0.0: unrecognized JEDEC id bytes: c8 67 1a ff c8 67
[   11.213691] spi-nor spi1.0: supply vcc not found, using dummy regulator
[   12.220614] spi-nor spi1.0: unrecognized JEDEC id bytes: c8 67 1a ff c8 67
root@localhost ~ # cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
cat: /sys/bus/spi/devices/spi0.0/spi-nor/partname: No such file or directory

Testing output atfer that patch:

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
------------------------------------------------------------------------

Best regards,
Zixian
