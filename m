Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1296190067;
	Mon,  9 Jun 2025 23:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749512511; cv=none; b=GlhjDXMVj7Jnc83e6plYpBXNhJpcnmIf0/mFiBQVshBRXC7+ZbIHpMWY8k24ZjKyrXLmgvG3L1O9DDJHgInIZak/ARF3RbmmNYXATFCYI6o800TLET3Is/dzaISVVFpyb5MzlPGW2p0ctzM8dXp8Mdxpe3hkl3Tvwsf91Zf77/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749512511; c=relaxed/simple;
	bh=cDCkk85k3A5R5CuEwbtk6qqX2z5/qKUPNGulxVzNryQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mAKwocW/sqAJy1wr7L8y7H0JgfQSCQleCNYLdzDfkR/QKdKLoV/JJx5pIw4eRHbWTp2fUkYGNGB+6buE/I/qsbmufI6Eko08vIWIUXbwF8x+OCNzkYDZcdaPZ4Pif0CaFwML8EswDS+9KLOzIw86qYZm3HUdAMmMdomZxnIHJA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7klbU0E; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7klbU0E"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a54700a46eso1239460f8f.1;
        Mon, 09 Jun 2025 16:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512508; x=1750117308; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i3uI7neNHCeOOnqy1qi6PTTocqMk/JcRDsziPQgv/O8=;
        b=g7klbU0E744wxAwwNhzpjxuMrZTqi3byfweXUdeiGtl7udmaXeTGj2FdOPi+pUyuFV
         VOhFGRoQOHIybXcv4RERpB5vnF+UEr9NzcSpemXmCFhOhfT+Cz5CrQP7AYcpj1FyYsuF
         TAM4SzutenP0v9Cda3mOc5MPqDvgLJhEqJbi70ylIlG2/GiAUE1NHA+zJKWR3wjWaFTb
         div4bDg7IrGx0UjbS2a5vS6xvRHYeCF2uM40HLZRKg0DuC7sLJkOlHiTSnpVNNKavm29
         0mjm/2H1eN7z9CDHAVPE2ulr/zDs9bM66z2TC/oVL9PNAKSk+UMcg6jVwabNN0+i5GkN
         Dkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512508; x=1750117308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3uI7neNHCeOOnqy1qi6PTTocqMk/JcRDsziPQgv/O8=;
        b=gE23tovnXxoQRvf/IB5U3NWrITDe0GC5MXNB7D8sPilaZY+vaBHPXqSKX6pbw76unS
         ee3pRV87G9nRT38khZbDdxfVCf/5977Zn4cE3ivsbZT8rerepIByTOh97U0dg/DuoJhD
         OFDEXeheCHrcHgb2QRL1At25K/5AaHMYYl8qec2NuypPot7FY0RmH31ak/lV+ZcU0Shd
         NDRSuQpChSLu7lZH2ZSFoG2CJ4XRKJPPjP3nZbA7LGoW68aq/FiTlLM/shpduxZ7yQw8
         1HFyiEVUpHRv9IUGxR6bs9hqReDQT+gRMo+ixl614bblpPm+OgB1RFo7m3iVJDcQ5++4
         ymnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHgFd23FVl+uHbqgnxpNjG6DLnW2GtBPnfLZwrzTflsgdOmloEjeCe0T6TlKHqkOAdRek=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5VvX2ndN3bGfjqsH3pgKyQ4gmJnGj9kuQVEThZove6UnPBwa0
	2qVD6HIyi75Nhrv9yAV9y86xgjGRnTXUbE0bMWA69xvudJ9rRYi6xz9MRCJ1YHD3Udo=
X-Gm-Gg: ASbGncscWQQkZJSJkm9LFjXXhypyam7fs/pT+0q04ICvFBY+/thdguxHAfkSibFjoTb
	yAbxTTg6hy7YuQe+jIf5xdPgzxUGiHUx5i1A0CrfnH7ZwTkwu1v65zYGjHSeHjRtPGtOhIkr5/c
	KLCG4UvyjP2us5fjlm23gI2xVUzoFq6O1KCrqAukaIpPFEarGT5feGmvSTnEjl7mbTIGLIAS3QC
	ej7UlW2ENT4vkzWPFFmLPLWrGNWDXdS5BR44Toq7r/2rKXrMYwzaO4rf0FU5YuNqCNapZXF97MM
	uWgoeIlkmlS0/UAiZSe0mdViwgL+y/dVbhKJlpp77vZxbx9JqLRvYf8HloAfcd3DihmeZd0MeSg
	=
X-Google-Smtp-Source: AGHT+IEsAqVyl21nrnHMCcfk0whdunesI5czCGvugVWSJ+BoAoNWxpXOTu6PD/8F0KK4s/GGTVK0tQ==
X-Received: by 2002:a05:6000:1a8f:b0:3a4:c2e4:11b with SMTP id ffacd0b85a97d-3a5522cc60dmr287159f8f.51.1749512508160;
        Mon, 09 Jun 2025 16:41:48 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:47 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 0/6] arm64 support for Milk-V Duo Module 01 EVB
Date: Tue, 10 Jun 2025 01:41:11 +0200
Message-ID: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds very basic support for Milk-V Duo Module 01 EVB [1] in
arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latter has
been chosen because the upstream toolchain can be utilized.

Sophgo SG2000 seems to be a continuation of the Cvitek CV18xx series, same
peripherals with an addition of ARM64 core. Therefore it would be
beneficial not to copy-paste the peripherals' device-tree, but rather split
the most suitable riscv DT into ARCH-specific and peripherals parts and
just include the latter on the arm64 side.

This series adds the device-tree for Milk-V Duo Module 01 EVB, which
in turn contains Milk-V Duo Module 01 (separate .dtsi) on it, which has
SG2000 SoC inside (separate .dtsi).

This series has been tested with Sophgo-provided U-Boot binary [2]: it
boots from SD card; pinctrl, serial, GPIO drivers are functional (same
as for RiscV-based CV18xx SoCs).

Partial SoC documentation is available [3].

This series lacks the support of:
- USB
- Audio
- Ethernet
- WiFi
- Bluetooth
- eMMC
- Video

Changelog:
v6:
- rebase onto sophgo/for-next (108a76779829)
- dropped first patch refactoring RiscV counterpart (equivalent present in
  sophgo/for-next)
- added cpu_on/cpu_off properties into psci node
- added reset-controller node, compatible comes in [4]
v5:
- PSCI node in DT
v4:
- minimized patch 1/7 (cleanups dropped)
- cv18xx-cpu-intc.dtsi instead of cv18xx-cpu.dtsi+cv18xx-intc.dtsi in
patch 1/7
v3:
- &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
were moved into cv18xx-intc.dtsi to reduce code duplication;
v2:
- dropped all patches related to the new reboot driver and corresponding DT
and bindings;
- grouped DT-related and config-related patches together;
- added patch moving sophgo.yaml from riscv into soc (to share it with
ARM); added SG2000 SoC and Milk-V Duo Module 01 EVB into it;
- other changes are documented in the corresponding patches;

[1] https://milkv.io/docs/duo/getting-started/duo-module-01
[2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
[3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
[4] https://lore.kernel.org/sophgo/20250609230417.620089-1-alexander.sverdlin@gmail.com/

Alexander Sverdlin (6):
  dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add
    SG2000
  arm64: dts: sophgo: Add initial SG2000 SoC device tree
  arm64: dts: sophgo: Add Duo Module 01
  arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
  arm64: Add SOPHGO SOC family Kconfig support
  arm64: defconfig: Enable rudimentary Sophgo SG2000 support

 .../{riscv => soc/sophgo}/sophgo.yaml         |  7 +-
 arch/arm64/Kconfig.platforms                  |  6 ++
 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  2 +
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++
 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++
 arch/arm64/boot/dts/sophgo/sg2000.dtsi        | 91 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  4 +
 8 files changed, 226 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (81%)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

-- 
2.49.0

