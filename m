Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B5D34A3D0
	for <sophgo@lists.linux.dev>; Sat, 28 Mar 2026 17:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774719467; cv=none; b=hDdci5S7dpSv7duvn4KV6taQrwriyftwgvmmWbYeLSiJuv+6RYnLNNawBZJnWS0QpuMlROX+G0+k+PtTVMAF2VBSBEsUJ6ncUb8XJk2VwW4Qi7gXYYvPGD6hL3tk8vme2eBYzy8FyPWSvXgxhexnsfH3oQB/3NB4mKGY0EfbKLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774719467; c=relaxed/simple;
	bh=parGt3tZhlgkG7Tyg0zyRirZEztjPzzRxqDmCM7EM5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uk7NvB7e9K3S2IdA56MS4xeMThEwR7VZEr9I4BXFPY8hn8Xrad+3pQRRRKfP+sypWO+7oTHvZrVf4gLqH/y26zQu6kffxCOfqHQ16VGCUHGFTcJhsaAsb9zgsRavGcnteiUBNAP8s/w32riietZYdq7Mniq2oAxZCIPtWngeN08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSdfl+Yj; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSdfl+Yj"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-506a6cf8242so29781251cf.1
        for <sophgo@lists.linux.dev>; Sat, 28 Mar 2026 10:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774719465; x=1775324265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FO8lTdaN+rEnKBFSO7tgtF4+ghONTKCteN9CF0ffLO4=;
        b=kSdfl+YjsMNYkZcfO/HG4IABpAHJuGEuQRO4xDZ2XFc81ZXkK/d7qa5qnw5a66Alg1
         uRjxVWvj85KTiRe61n537gsvCpuafzd2KKdkR7T9inrTpVm2FiYzjp56UkjENwpBkMUZ
         7x/JFknCElErZn8TuaE+iM85qaINsidbT+IYTm3DzC39XLizWzlieIOpJtAp9SFJzOln
         CsBb4bffqYoSKzx9E40QRmrmfmtCFTjbbOHac5c8oq5ml94IR/B/CkOKPPos36ZZkVmt
         d57ap80qaT6sIwGZpwZzIcTfYPxaP4EwFjOHU6DhM/Z6z3zc1DxSlwnwmyhF5i82sRI5
         OXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774719465; x=1775324265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FO8lTdaN+rEnKBFSO7tgtF4+ghONTKCteN9CF0ffLO4=;
        b=ToIoOdVfNbdDpeWYxddeFCg8QeOv6X2nLzd6I1sMpGCxixO849MNbj0aiooHuu+ndr
         Mx7eNanCjeTol7X1uCRRPsrwGVNwIgHIpLIozOiiefYKlu+7rUk0qoBsaKxySL3Rs5m7
         OGR2yTbAZO+yh65fHSEuuXFJAStQpx2M3C79/hKx5QqqdAJpsO3gFoIsmr278ywY3gTI
         bSlGzlr/lOoYCXwPPI1Ye+YuNm0e6aje+NavpS27K2Hiw3//dbvFfXx3FpNYuBiLL+Bg
         TPq5QE7VPYtvdTO76+ouDCwEf7j1ahDeDrfre9IITCQ7hVkWRTysdZwTXU5u+Ymvz/vy
         bMyw==
X-Forwarded-Encrypted: i=1; AJvYcCWIlAy2hZNsFedLYIUDslpU9fh4b/4MqSxoYNPshk80fCtRg2DdDF1JP8UcHJmaNrtxwmro/+g=@lists.linux.dev
X-Gm-Message-State: AOJu0YywknD2IH1BFXvqPAU7HQ8xYyBZg+MHhrmszJf+sEqN9me367Xu
	RzRU6EZTfi1X0iJrZLRWoC+fRuzC/m1+r342Fvs9Q6c9ny+ej5r7Mnbz
X-Gm-Gg: ATEYQzwExKdbi1xLrotTmaulY0W8LAdQjhRNsxcCS/OCdkjbVbRcLgPiDcQvYk/fvck
	7J1Rs0kWefLL1TUeb6pcuQoJ9QEgLw71Kra8bQJNQy0PeruwY7bgZSSO3Z/MgfM2ObUAT91PLUa
	aPl6/axV6vEu3C4hqAcbg7hN0Gk6t2jWdcxmx7Dwxd4b9DPYA0B/Ue6bnKttoGmx1Pt6Q3EqGwh
	VpRTCNCvBOO+7z6AmEGAPjAUWCqQfZ1InvsCvFtMfcGKE+8EXGu2zQSEHSL1Z6SGPgKDjUYOMYK
	XPK+BkPztarsqpSbo4h+mxA9ZDrF01WJIePhapwi84p7PWpQ2tECcNjtym8T9Hbmhv7x1VCLmYm
	ycKG3QIyJDIkgdXVgL4zU28oX1udFT/75lKcxsKPbAeGiANMEcGwymFnX0bxCKti4VQDYRMMDre
	tsSY76dtdAFnISgzERjwep2iQudsopG+VdP+fkAIIbIfZNBuX/S++Y6/ywtXFSRTSCY2M=
X-Received: by 2002:a05:622a:4807:b0:50b:3a6d:db5f with SMTP id d75a77b69052e-50ba39bae92mr89481621cf.64.1774719464707;
        Sat, 28 Mar 2026 10:37:44 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm26629641cf.7.2026.03.28.10.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:37:44 -0700 (PDT)
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
Subject: [PATCH v4 0/5] Add initial Milk-V Duo S board support
Date: Sat, 28 Mar 2026 13:34:45 -0400
Message-ID: <20260328173450.219664-1-josh.milas@gmail.com>
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

v4
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

