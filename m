Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D688228CBE;
	Tue, 10 Jun 2025 20:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749586359; cv=none; b=B5I7EEwtlA4lPy7zUwwyzBal7I7GirB8jnw+L6G1NM96JcrmOrmEj469tWivmjf2CVovc+P3PvqQHYGUZz73zB9uyjN6oALx+Yj0vyDiartGIa7w+AQSKRJ05XG5f2TNRNQTngO830h9A54ru2U1VKYkSfDAxfF1+C0857NSqT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749586359; c=relaxed/simple;
	bh=dRGYA29R0nHCfdeul2TQ9F7JoFvBPbdmzyiO2CDhfcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FDGzlKXvHx8dAc5gBHKovgA+ZdqHIkWPO97RD5EpFIxXSEHQcsJCO0VQZ/dTQP9TxPotT8URgIazbYR4fjfhg6iIr8JKvjwrCvvWPE3afaFnsq8kqHVHmLgIC2u+EThKM1WkqmKfC5bK7tbrkrXRCn6dsv7YiWFXGSvVbE6Mmuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1IPijsv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1IPijsv"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so4935804f8f.3;
        Tue, 10 Jun 2025 13:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586356; x=1750191156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6wXuQ0VlRw4xeAGCSUgQnm/1pPPb1xh3dx2heNqSZYs=;
        b=K1IPijsvMd046oUfOgwM5JyXerGp3auEgoqJ/XaRXzG8WjCI9fvZ6KQkEe6taGYMbB
         9fHkwg6k0f7gdV8dq6R2n0sGmqlkUGsm5DC/DD7ZhGoAmHUPl7XQ8mf8m90Yh7SQ4bmG
         Dm3LiTF8Z1wxS5jrs0OlV1OcNftb4GfaEjwHlnCXY2yCnoFHT/p6a3V57j7EbbCT/Egi
         snVFb4YF77ZJBjFRhH7fGa8o3GWLF9p+xRgtyTmht/GRV1fKI5HNKYXWY+bcYQ2F4MOF
         v2xvQMtGhIqe4fe5T22dyYXH6oPlGI28LVf3XmwD2W9BDjo45oVBevRV6vCoocP80MNS
         NSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586356; x=1750191156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wXuQ0VlRw4xeAGCSUgQnm/1pPPb1xh3dx2heNqSZYs=;
        b=stq8r843NQhyqbUnXLXcO+UF6oZET3IZ+wXJSB4wX40JqZ3eJyuKiPc3QBYOwGQdw1
         LYITlgSvkfhxroofIXZ4ImXDPOmd/jGNjmp9sBNppmDhTNYEv/WOqSUdPfdwryfjR/xK
         pr8bCgo74XDeQP27aRCBZE4sNFmHp6VVueNIuAZQmevhNXyK3sb+XK5i6uv1NTW20W3h
         Bd6rnnJbS6O64ufrZBjD9K86+p3IjoSBt5rWoKxUW4Buv4U9JxlnqUtOD0+xez4Byeyu
         5d6CeJBYXQChcZiocmbG0hQ5hyvYtQJg4eU25pbux5DCD8lI/KnR7yLg3rJZMN05kC+h
         Ohrg==
X-Forwarded-Encrypted: i=1; AJvYcCUCk23wHQJXVhf4JxL3xvhlqU8J+yX6bDnSJ3XLGnUG5BU7RAJWTtWOeqQb1WdxWu9QRxk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrMYt9gXZH6It47kTqg3BIBe6L1cFv86GOSfm71zQ/HlK3PJxc
	KHsgJsW9QFC/5Ky8koS6vZqlmshDAM9Y5juPzRo1YlCXk9yNCC56/ninra5cukv5qxM=
X-Gm-Gg: ASbGncubYKeCiemFf4vvB7jMyze527BEAq/xlNY1csCwt8J0tFQbMsrkC1hUyh0VsJs
	5IKaEjt0Kl+OdBLKNZ60Yg8cDzMi5hbYhsrVDid81zRDwXKhyW3jBHQY8UyxciavTs6F8AONF7W
	e4uIh0tE9dF5PRc7njZRMkOcEWp2Aj3ONgG3yAp9S53ZxK9OVD0d30DwlRMO5QN6zN8B36U3ITG
	WlyNxOO699dunV/6qWu+DGPn+kaKah3EF26N1hqGZGVHKRhQ/SCjP0+Ws3Act6F6z/8h8retple
	QU7M8A5MqhjzRLJ2/VOk9XMXj8gZV1lhZr17mUtdyjg8lqGKsBWFfhBMUJqFz0x/OtP2R1mvIqw
	=
X-Google-Smtp-Source: AGHT+IF7ZtZQchjXHit9dQu+Isc3qU7RROUr0beDeSQ4CVfjUtS/qF2Z56VOPyuF7ZV8Vzq7V130lg==
X-Received: by 2002:a05:6000:40d9:b0:3a5:2e84:cc7b with SMTP id ffacd0b85a97d-3a5586c30a7mr339272f8f.11.1749586355592;
        Tue, 10 Jun 2025 13:12:35 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:35 -0700 (PDT)
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
Subject: [PATCH v7 0/6] arm64 support for Milk-V Duo Module 01 EVB
Date: Tue, 10 Jun 2025 22:12:13 +0200
Message-ID: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
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
v7:
- dropped all reset stuff again; it will come independently in [5] and is
  fully compatible;
- rebase onto sophgo [6] for-next (3a8cef361be5) (almost v6.16-rc1)
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
[5] https://lore.kernel.org/all/20250608232214.771855-1-inochiama@gmail.com/
[6] https://github.com/sophgo/linux.git

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
 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 ++++++++++++++++++
 arch/arm64/boot/dts/sophgo/sg2000.dtsi        | 86 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  4 +
 8 files changed, 221 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (81%)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

-- 
2.49.0

