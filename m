Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB3C30ACF6
	for <sophgo@lists.linux.dev>; Fri,  3 Apr 2026 11:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214961; cv=none; b=rb9MXv67IoVNosQoimhheUPbE03IQLg92MARlXZkp3zAmszK6yleNSjGOXGCcGrHhUTSg4q2CpUnyAPkJ8CyMXiC4RQT1I41np+5uu6BMsoD2Af7DQTdQgGBLvvShwVWm+EVUqAaTAadgAqGpTAA/jrwShRVTOMlbOWuEhf0ZqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214961; c=relaxed/simple;
	bh=oFEYEJ7SA8sUm/pXg5pC1/BYgPiYYcdFYQGF/ujaB4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r8F/bSG5T1aGx+a/9KzDP6/Q+SraOwl2piGhykF5ESTGoUOLbjkWh7hV1ysWuX4FrskAOZMkcoPHVBJAUC171FPpeHQbXfCK/KzK0N2w/ywKrf2p9dxVeoQQNDcNPvmslItTM/TiCykvQoD7nHLX8adwJTNGItbHJQj3EmiI4os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kK/KZI2N; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kK/KZI2N"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8a032383008so24344206d6.1
        for <sophgo@lists.linux.dev>; Fri, 03 Apr 2026 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214958; x=1775819758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VScxEqB1ufMX1zFMz0Kwtu1aZDayJH9mecM8OM4h8BQ=;
        b=kK/KZI2N3imqQwWY+XRyAvfUcENGLpmHdjj3fNQd+6DRKXAny1584RI9+rfrzRkNyx
         HHzIjx6/dUj4nKG2FPVc2uF1hiPeW5qfkzF4Fh5Aek6rDZj7bsgELVlbpkGLZmPsdH+y
         v/s1gx8JOEdlhSbex7QcOMT8FldmYuLlhBKdwNjr6qME4sjT8sFev19ERidan3nSRFcv
         FxBZECD97knDHGZtE20LRnY+5oLrijmWJpEecH9/61znC4y0OBjnVAec2nH+IBsXEJnt
         jmIQ/jUyfuY8OIj45lz8fTjx1Z+qKulrQr+bBCCOpwNsmux5Gy1fVJH06eChz9jkxWl3
         z0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214958; x=1775819758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VScxEqB1ufMX1zFMz0Kwtu1aZDayJH9mecM8OM4h8BQ=;
        b=rR6lhLjy57FBI3OnP7jzjvuObylGMruSkN1pCU+C86geLNzGq96ohxkGigEmiBta8f
         2XDmSgnxuJ8sNHb8vXwjZgUOifRn/EThVRBRz+dUoB1Io0r7/9E5tNlSBHp+DmPQNaF7
         XfeMBfLrzvZJvoV9VUwymfy9/GB5kIyzxr7AsOWjhn8XrdKdxkWCwwVTwXOj+yNqnTEl
         BlFv0l6JdlKiNeZBrZZdgBNBZfNqMXiS/Iv5nJqVOr6z+B87t6vlME5dJ55KGllSPVw1
         f51ROmu9JxVihQD2e8d5MIbD4s5xFAq/mZugT3lv62dE0Jv7m5yuncjrAsek2nD0xFOa
         8QmA==
X-Forwarded-Encrypted: i=1; AJvYcCXdXIruJDA3wAKYQLhStEcObJgdqv7SZQ5Rewrz7o6i+8aaR9XcOF7AMYEEN2a7Ji7iK6UZ3XY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQHUgqfjNw++xi2B5tn/jnvdfyOcxzjDBIW8kuBrLxA+o/N+qO
	6zo4wKLaZtD0MRDl8BQjKN2pKY35svBqiV50h+OqDePlMzBVHZbAhGip
X-Gm-Gg: AeBDieutbwHRf+Y3uEvz6moExcx+t5FwcK6mUBIOvYW7149+O7caSG8ixgq7VpUGu/o
	zj1YQ4AkZBvFCOtJecRLR2SBSoGesH7rc2inn2UMa+emL284CpiGf/Gbe/73ShTECeY93XoHasY
	jrt0yQ1mBmEEOYlTJPSeg1LAkCmfg+CBPwVmEqh9ysPSR6mJDsYZL++l6Atsm6Y6LtiCffy+nnv
	n3uMxirrN13WSY9+Fvb0oUdyA10Oaz0Xt1uy1dE6X8cl54HYGsbJWvgNX6bZOzW9iJPxi+5x0Ew
	7Tvk6AdA8ItpDqYKLsK+Y/tmiS9IqftZ7YqvdeFCuRWDKBv3TBZBETxQO/5i6J5cmGsKVFECmpF
	Vl/t2OZDzN+A3Holu5/Hu68N2L6b6veFT5BEhzJJ9C3aWQMVDPkyw8Pi+puKOP9xF24b0yqg64O
	J0pdWK6O7GkroAsPED7qoi7cLte357HEroGMcH2Wk=
X-Received: by 2002:a05:6214:226c:b0:89c:d7e3:7f01 with SMTP id 6a1803df08f44-8a704ea730bmr37757456d6.48.1775214958204;
        Fri, 03 Apr 2026 04:15:58 -0700 (PDT)
Received: from sleek.hsd1.nh.comcast.net ([2603:3005:1473:4000::71a3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974e8e8esm45319836d6.43.2026.04.03.04.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:15:57 -0700 (PDT)
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
Subject: [PATCH v5 0/5] Add initial Milk-V Duo S board support
Date: Fri,  3 Apr 2026 07:15:11 -0400
Message-ID: <20260403111516.379795-1-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
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

