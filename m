Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3937A3E558A
	for <sophgo@lists.linux.dev>; Mon, 15 Jun 2026 12:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525040; cv=none; b=rsIDLSgIEAm2qrsNQJqGtXefDJWOpCG0FIBSIg2x3RatmgIgHwVtIpNL9Us5xxTyqG58q5aOXvVOHWDP3xJAPXL2K3j+V7rPfpiSw+ggz3oADmTOmlq9HGcEUjZq4biBMnaK458fnuw4AE/Z/0+0KNQJgAcZHOrwpB+i1ZEn1pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525040; c=relaxed/simple;
	bh=q8hyA2uw+AulAXMplBR2AFo1kCx+r49U7bh2hgrXIiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hMWqAt+beD8IHropqBYStYdwbKUavmLhliwpjsuTTFydlV5bT3IAnBhgCxucWzow1oVag/7t5onRme/hK58mq6y45mU8ABPrf3gY9G80NBmASoPgF6L1y3Mn1pk7QD/NkhKoTeXIHdC+PTgViZufwZjd9SKxKkSy3sCRwl6KdeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUFpcH7c; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUFpcH7c"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ccf181a52bso35944066d6.3
        for <sophgo@lists.linux.dev>; Mon, 15 Jun 2026 05:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781525038; x=1782129838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HVy9GUueUnFuoBBRJmJSO6EMQLHH087G7ntPfjHp8FQ=;
        b=HUFpcH7cXsKICZ7U5W6NyHAuVxXSjSI7o88xjJ9Owz+jMD6vV9sgbB4Jedmu4qPhPs
         OgrTr0rjkIuoK0Da/akr6xRgXpB0coa9+LbeV7JGs77ex8YNtQK1onLSFeR5kQs3ytQA
         cJ7Oju+PAtlpBDUobyAfWp1fDey3RJTxUlkB3WRtvRCnfIncU3o3ccs+5VhZEF0hZXjV
         6uWsfnTU2oEQip8C9L6rb3F3+QQpMLe5NPZcxr+irjbGo0YlRudyVavFOtqI/vDtPQl5
         2qnPXsvo7l1lpmdJc7rX78u7yK7/nkSnquHfRQJ6vJZpRCffjb47dWgsa0PjyRuKPGkS
         FIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525038; x=1782129838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVy9GUueUnFuoBBRJmJSO6EMQLHH087G7ntPfjHp8FQ=;
        b=aG3UhUa2tgubJIxemaKBxGNVQz6wnVPireuCw3ufAk+YTpgeUhy1PsoaQlSpnPK170
         MuE1gxGs4+uQLmm0yNc6Z0fO6t5/Y4ifPoGitiDPTlEiuMzV8IqcHXnCivAcNhO5H+EE
         MkSZnzp2AYqTadUMz7+4mtgw+/htlz6vcRDHQreQM1aguPuPFTxewjJ/YrePPdzDhZAC
         tisVv+/x9nSLN5l1jsSH67zzcDhcVhC5u/iFUhdvkeNe61J89XzcWTP1/6KnuxidzYhJ
         aoaz62a8ygzK4kBPsLPe7Lbae8de1x3gty1vw4QKm3eEh0wnaNu8aOTNH8C60tL0a3zG
         rcOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jcvW/5ozqTCVGpUXew2m1uOzs27vxVKPvVBML/2xlz+vZVd+1Hr0mONWpXzjqx+xB66qgXXU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiDpRjEe4fqlfSeaVWLC8U5m3d7S8cjr6G/fX/v1HAsSnnE52Y
	VIFHix66CUg/tO5vNockBTUav/9c5lErvhjzOMfve87ZYltMMAfwkpX+
X-Gm-Gg: Acq92OF01GcyKn/hl2QJbKFphP8DsmmbjVL89SKIL170S4Y/1NBNNXkCrwXG2Vw73UG
	E/2uiEruVWObj+oj7boBRd6mTLvHfTj6bYFgE2HDMHp3TujsfI1jOaRMQIpAG1B6bmYRbPPiHQt
	NlCNBqBHSsuMjDRUIuhqZ2ToyxTjAjUZOQCaApbn/s5G7MDHq51NrW+MqzvA5Ff3QeIzCVK/9wb
	n0oRpTLTfRvbHShWlBjGM8lOnL8/8erGT6kZd1h2RusUxgY4NXhKzdZacyvAFTz8O7XXsT0gW6Z
	lPk6ifLp4LgEGsv0Ar8jbNxgdX/V12pHz/xIfI1hGR1YLabh49mQ4XiBKb/YPO70VQISN+xIiKQ
	vOaeYbXc4RqgEmTJTnpesk6V1nkA9z5VxuzWnaIJJJb2Sy8KFuDoweep7NXSvLvl8ytoTC9PpO2
	CioaN/9dhrRutLtfLFxrPhV/QJV5E3domuYPj6lTEDqEiH55Bk6CxPERnF
X-Received: by 2002:a05:622a:e14e:20b0:517:71d2:37d2 with SMTP id d75a77b69052e-518e47232a5mr108016231cf.0.1781525037993;
        Mon, 15 Jun 2026 05:03:57 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51975955956sm25184311cf.17.2026.06.15.05.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:03:57 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	chen.wang@linux.dev,
	inochiama@gmail.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	hanguidong02@gmail.com
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v6 0/3] Add initial Milk-V Duo S board support
Date: Mon, 15 Jun 2026 08:03:21 -0400
Message-ID: <20260615120324.1527881-1-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds an initial device tree for the Milk-V Duo S board
with support for reading from the SD card and network over
Ethernet. This is continued work from Michael Opdenacker's
v6 series [1] on the ARM64 and RISCV side. It has been tested
with ARM64 and RISCV64 to boot from an SD card, have networking
from ethernet, enumerate the wifi chip, have bluetooth, and can 
read a I2C slave device over i2c4.

---

v6
- Patches 1,3 from v5 were applied
- Rebased to latest sophgo/for-next 
- Added mmc1, mmc2, serial4 aliases
- Removed spi3 alias and node as it was conflicting with sdhci1/wifi
- Added wifi_pwrseq node for wifi chip
- Added pinctrl configs for enabled devices
- Reordered &sdhci0 properties
- Updated &sdhci1 node properties for wifi chip
- Added uart4 for bluetooth
- Changed memory from 256 MB to 512 MB on riscv side

v5: https://lore.kernel.org/sophgo/20260403111516.379795-1-josh.milas@gmail.com/
- Fixes spaces at beginning of line in &usb node of DTS

v4: https://lore.kernel.org/sophgo/20260328173450.219664-2-josh.milas@gmail.com/
- Rebased to latest sophogo/for-next
- Added usb node to arm64 and riscv DTS
- Removed sg200x link in commit messages
- Added missing change to v3 and removed link from v2

v3: https://lore.kernel.org/sophgo/20251029001052.36774-1-josh.milas@gmail.com/
- Added sg2000 interrupt controller and timer to documentation
- Added sg2000.dtsi for RISCV and moved DTS over to use it
- remove devices from DTS's to match what is available in the
  default pinmux config. spi0-2, i2c0-3, uart1-4
- Added i2c4 and spi3 aliases
- Removed milkv,duo-s from sophgo,cv1812h in documentation

v2: https://lore.kernel.org/sophgo/20251011014811.28521-1-josh.milas@gmail.com/
- Made new entry in docs to avoid DTC error
- "Milk-V DuoS" -> "Milk-V Duo S"
- Sorting of aliases
- Added uart*, emmc, mdio, gmac0, i2c*, spi*, dmac, saradc
  to device tree matching what is available on the pinout
- Removal of 'no-mmc' and 'no-sdio' for sdhci0 as it works without
- Added riscv device tree

v1: https://lore.kernel.org/sophgo/20250927173619.89768-1-josh.milas@gmail.com/

Link: https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/ [1]

Joshua Milas (3):
  arm64: dts: sophgo: add initial Milk-V Duo S board support
  riscv64: dts: sophgo: add SG2000 dtsi
  riscv64: dts: sophgo: add initial Milk-V Duo S board support

 arch/arm64/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 245 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 245 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2000.dtsi        |  53 ++++
 5 files changed, 545 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi


base-commit: f7337210bede62fc7c6230ef58013dddf7e0a921
-- 
2.54.0

