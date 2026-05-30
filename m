Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5E2341AB8
	for <sophgo@lists.linux.dev>; Sat, 30 May 2026 17:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780162523; cv=none; b=pvh+w6Q9q4gL8t//Oj3M3Veu/ZtZmkEavmlymL7Ni3JvJvD5TzgnRpYSQraSNuK0UTACSrR4gHmdGp+K6pq5lQQiUFW9s8VWCqAIk1LgMYQe1XvHEwIJ23NZnAHPauXezES9XtRBY4DdUOz3ZAAt8jE88EOe0l++R8oqpury5xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780162523; c=relaxed/simple;
	bh=oFEYEJ7SA8sUm/pXg5pC1/BYgPiYYcdFYQGF/ujaB4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J3XMRq+Xo2ifVabs726rJxCbU8/ySTV9SzN7j13nwlrKzB/wNsqZSVXLt02zmf3ZlUmNJtXmhi0FikTwN86ZhqvxdG4UkROUydg/yr/3AnPOM15sq7L7HmTN6RtlEtL+17+k06oZ+n4/f500SNWvZGizwfTGJIV60dfqAt/r+9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fo0N7vhE; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fo0N7vhE"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-91550dda53cso8955685a.1
        for <sophgo@lists.linux.dev>; Sat, 30 May 2026 10:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162521; x=1780767321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VScxEqB1ufMX1zFMz0Kwtu1aZDayJH9mecM8OM4h8BQ=;
        b=fo0N7vhEDRjfaLE8NyKSa1hFNUY+5mzKTgpXyDmfwdQi0QmvCVylnw+4reQXLmt7H+
         8IV6Ke+LnhiToRGOxGzi8QyHUZBIS85HmEPyaQ302cGiGvQqIc6vXc//Yvov+vMZMiWL
         1PGSI6E0DpqhGZvMwzVuMprSUSKI3nuNJBtj8+DLTPeQqmNwGn5weaiLwVPGqKcRKNai
         DY3yps7V79hqnXpJBEcXWBOrErKmKKdNMWCMvsRQKltz10iJQgCZy0vf+gDg+tvhWIYP
         FN1cOY9qxNJkyotovnJ9ltOF44e0I+I5EXmm4L0qcxrBxgumKgTMuK9MtUcV07mDy8kw
         T5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162521; x=1780767321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VScxEqB1ufMX1zFMz0Kwtu1aZDayJH9mecM8OM4h8BQ=;
        b=Pqs++TKIbaFSJXZUV+PWwaLXhlakxA29L86yFmGcienGPpHkiz8HqrV4SqE6Ssw2h2
         3WRPqnd8BcnbinxNGDocShVOQX76aWBf17jVfsg+0uhBXEGTn+lFZP4SBfrymCTXr2QA
         PeJiY7qBecBe6y8yPDwjF8YziJrn13nf6xJSzXMC8FFCo4Ey/+zwMo3zr6upryM64UBY
         wk1C57bMShz6qQuO7YtiqEgGlqp12Ga6X1DovcYAiMbJyRjl+xDN9BtgAGOG+GC4i/Dw
         IAnlvVl3Lqbies28lsfjSUQsvGvrCWnkVhiDfACejj2jbpNa9w0scdXhFECNzyX0uqHk
         S3mg==
X-Forwarded-Encrypted: i=1; AFNElJ90SGY2oPmTG3fbJKXh3X1tBI2UrbxdMMBhfYQS73+azgG/LS2K5sxiLxdGXY8zWBOBMm+YN0s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl8asAoEg1/6HvpDzZfZMJCIoUn1T/RSD0RZmVgZisKSJSdxn5
	U0RCuXJ8hTFuO4afplgBJu2+2pwwRAD9IVO+U5+E7YboLwZ+gLKtRbnf
X-Gm-Gg: Acq92OGLYr9LGjUF3/hzfsaEc2zmajnSoxIamBWj8d1kL0YAFtlIQvnPhisXX46SOHw
	oWd5vyRVY8WBME0GNahZkwSQ+tnOzEaA7xbR1Jml+GLO4luWVVKSO6xfuiZ5IjU51890ak9BNSH
	XdmoERn2q5AF7/fckvNowjsvECLzoUZSAiPumWhtg9y+LF06mJSgV9j9L/jzTf+OX4nehrzkn6Q
	0j8m9bAoPj33g942vfFRZij2pKSrs7+/tSiy2dYOg4rWXZ+opf805hitCym0+TXU+Bs6p3DjHbP
	ldbnhBlo3+crCEQEML2J31PARL1gXMgTdbWRRJwePuIACoYJ/fOB/nRfLvhwRtmBcRCdHAUI9Kd
	3gqwewNk01C7av6TB9CYrnWDwYDDuujrwn7tU5dync7rRK/llJxvolKhBcfs0awkPMBI2O168O9
	pJRwKnIbjMfETWu/KsZ9f4QjRofwD1Rs4doBTO2C8zQFv0KZGKQsZYm2if93f+MID8gGw=
X-Received: by 2002:a05:620a:708e:b0:914:c226:ecae with SMTP id af79cd13be357-9153da04456mr673431185a.24.1780162521335;
        Sat, 30 May 2026 10:35:21 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:20 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board support
Date: Sat, 30 May 2026 13:33:42 -0400
Message-ID: <20260530173347.33533-1-josh.milas@gmail.com>
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
with ARM64 and RISCV64 to boot from an SD card, have networking,
and read I2C slave devices over i2c4.

---

v5
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
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2000.dtsi        | 53 ++++++++++++
 8 files changed, 231 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi


base-commit: 9aa6068586a9b4cd34cf04f8dee72a7283ab4ae4
-- 
2.53.0

