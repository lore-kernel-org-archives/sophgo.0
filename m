Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DE01DDC28
	for <sophgo@lists.linux.dev>; Wed, 29 Oct 2025 00:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761696695; cv=none; b=BK2HF+6D8R0pXrZcLcoHEcT/NS9lTrKZo8FzIR9IvrtWdpoHWa8bSYD6auAJbQiuiVsJn2BUhjKIbQl8Jtla33CK9HKkpC/b26x0YMLv8gCKjmbNECbVRxPmieDRoN2FLi8k8zguuIvs27Ezs3EELnt0M1sUliCDklZV3icVjxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761696695; c=relaxed/simple;
	bh=7hd5coJwbQGsAi8TU/A+6KQnWACya3DK0167CVMNCgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lMYpb3G8OO1kqybwigsNYz9eNiYU2FAWPIGotjIsztYQmG4rZN3Zd5m+Ny+reo9h6WeMZioadk6NUXKqyVIX2er8YNjcPAo4Xia2qWBNpcOXn1ieZcZIUBOwzxBYai69/B6yp8vMW2ladJrgJLvEdit2wgYniaAR5q03pWsn+o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwok/dtA; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwok/dtA"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-87c148fb575so66361556d6.2
        for <sophgo@lists.linux.dev>; Tue, 28 Oct 2025 17:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761696693; x=1762301493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QCyTfqDCHwiXjxLeCItWxd8e7Ei2d6bvYTfbpnxDRG0=;
        b=mwok/dtACE+ZTxL83r+EudYsw1AhrUA4fpOAZ/XzSrB1F8l/H3BUGS75nW26DAYQxK
         8rkpK7oMiD7xyoVF9maHgYk0MNBScF4RCZ2Y60rg90doNEod4TxzLYPCoiRPpyJ8el5B
         U6EET693QxosPalVDQRUPqJcddr3A5c8umt4zoSiPVR7IuuMcSrJ21Y9KuM/8RZ2mRsO
         BHLtpULQ5/GK83tOh/M+FpN2Sr1GaJwuZyPar/LMqSsW82OxMSUZtb5jeLuWLbK9ZItZ
         bb6euKc3XZGdLwSJ0AKwLD5MQJAlxuytZGvDYN1UMgVNhVykO51XFa6MxKLyc18YPqhd
         YLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696693; x=1762301493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCyTfqDCHwiXjxLeCItWxd8e7Ei2d6bvYTfbpnxDRG0=;
        b=hrwuXk60QtLhXJJMR0N/1IXjH5i5eR95V/NuHX4qx2h/yMImq87gyMiaFGEKYI4XeV
         br5eY/1NGg26C++iCeuE+MK3DrW2pkd11cKWaBvQ9AFeFXmI+8tE1UK1FAK/vznCwMAW
         zRHgy7F7I1XaRxzCc5h/rjAN0xCJmhFJ7CEZ7ahBVeAYa6Eoyix395oVB4LwvB2bXnxk
         i2AL34QWBYahvnf4I1aEHNOrHEEfhi7Uie9v/RDXFPrDQQXSxOBih1QQEjKCMhFX/mwv
         s+zQ+eL+T0GevOisAh5iI5xjpC8gLEc61Pf+bsiJirC5FRY+JPjTy9CeIl4sRYDoyxUv
         +7nA==
X-Forwarded-Encrypted: i=1; AJvYcCVO/No0LKXT0YE5lMQbPcjunL7s+Vc9MoSZN6dqIO0vKpbtEmDjhtYk5CeonNA3LiIiwU5nkds=@lists.linux.dev
X-Gm-Message-State: AOJu0YyF5On+KIFdtx0ENwCsMwe5+vTiVH7i56A0FRu/wNUwr3U2ImTu
	BNQTZLjNouCItEjj0of4eTtH1CvNvXBOZNYe1HSCCRwu9gIbUC1tp67a
X-Gm-Gg: ASbGnctUkydrxvc1HWN7CNku8eV95rZP5Qd80ewnpjp6LWIeBw25PtZUXRnCbqqlvDb
	Y/QDI8G4/esVGoRSDpmNuQLNNky6TeuxaHvz8+H7ri1+pJDWGDq0Y3knA4uAEbms2MwignRxqKo
	+ijWIAkLv2OMcC9R7Bx8bV55qHlTzF7p3CqsW8KbLQkueznTa3U5GvxAwplG+hyewP4j+DF/dPc
	nFl5oehTzJkgYZoKjodnA+F6FjnxNMOPmCqHyeqU3Fk32BzQMh3jeP88qbph6BbXAUHWxZ7y0rE
	+vrBgelX4UenE+2Zywvw6cDfLupAxntAtvronsykBgttunE8WpFQ5SVJqIMnpo1B9ydoRZfnU0m
	45KEfSZlsGc7gDKxYnxP7LZGxRKBs58psOA3drOR4iKlD3TTmF/hXrkOF2JDrSb1czk8rrI2JVK
	W1UY9FBvlWZxU/VEZ8iid0DrsgoJk9mdh6gA==
X-Google-Smtp-Source: AGHT+IFTRnQ6IrBjTxaybv1yiOJZzNf1V38jNNEKvU4+MUeC78yIhbKYR0O/Jah2TP3guOgTGOtWEw==
X-Received: by 2002:a05:6214:242f:b0:87d:f2e9:488 with SMTP id 6a1803df08f44-88009acdd94mr12733766d6.11.1761696692917;
        Tue, 28 Oct 2025 17:11:32 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48dee2esm87255906d6.23.2025.10.28.17.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:11:32 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/5] Add initial Milk-V Duo S board support
Date: Tue, 28 Oct 2025 20:10:47 -0400
Message-ID: <20251029001052.36774-1-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.1
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
v6 series [1] on the ARM64 and RISCV side. It has been
tested with ARM64 and RISCV64 to boot from an SD card, have
networking, and read I2C slave devices over i2c4.

v3
- Added sg2000 interrupt controller and timer to documentation
- Added sg2000.dtsi for RISCV and moved DTS over to use it
- remove devices from DTS's to match what is available in the
  default pinmux config. spi0-2, i2c0-3, uart1-4
- Added i2c4 and spi3 aliases

v2: http
s://lore.kernel.org/sophgo/20251011014811.28521-1-josh.milas@gmail.com/
- Made new entry in docs to avoid DTC error
- "Milk-V DuoS" -> "Milk-V Duo S"
- Sorting of aliases
- Added uart*, emmc, mdio, gmac0, i2c*, spi*, dmac, saradc
  to device tree matching what is available on the pinout [2]
- Added riscv device tree

v1: https://lore.kernel.org/sophgo/20250927173619.89768-1-josh.milas@gmail.com/

Link: https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/ [1]
Link: https://milkv.io/duo-s/duos-pinout.webp [2]

Joshua Milas (5):
  dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
  arm64: dts: sophgo: add initial Milk-V Duo S board support
  dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
  riscv64: dts: sophgo: add SG2000 dtsi
  riscv64: dts: sophgo: add initial Milk-V Duo S board support

 .../sifive,plic-1.0.0.yaml                    |  1 +
 .../bindings/soc/sophgo/sophgo.yaml           |  4 +
 .../bindings/timer/sifive,clint.yaml          |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 80 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 80 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2000.dtsi        | 53 ++++++++++++
 8 files changed, 221 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi


base-commit: 0251a1deaec78252cb311fc8305d3670bc5eee0e
-- 
2.51.1

