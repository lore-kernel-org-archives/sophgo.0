Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53EE242D63;
	Thu, 12 Jun 2025 13:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734917; cv=none; b=l5n2x0ysx20zTSSxYuN0ZG/Vj0KjlS3cZRp+6yWj9GJmpvBov+duaMY6Se1l8suVH0mv9fjv1nnA2CuKyh6ek0fIhzP3uEFQYgv5+fuUulvJgoSPGgUlsRmf9480TAdtyQXkRiXnreWFOPf19XVnahxZECDsVDRMq5lSeEKmNNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734917; c=relaxed/simple;
	bh=YGCT0mEop+BF7S0MMmBTGuFsJXd8WC1JtAscvw0A+n8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fQGUNtl/ItdaxeXuL8lTUhQx0ldNv5xOIoKfMuN0e143sy7rYbPvSfL0lu4SFFuw9gGgvpJqJ5O/WwhtTDfyR4Wn19dPQ8DBh5Jp9kSTHYbenA+RhYev5FXERKZwWUqhbShPSDpCi8J71ez101WNvFkCAwPq9zsEudCxEbUw1aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dpi2lpL+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dpi2lpL+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so6150175e9.2;
        Thu, 12 Jun 2025 06:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734914; x=1750339714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MLRgP3IIDXezaBsOM8+vWEmARGcut96oeFGa111PeEU=;
        b=Dpi2lpL+wNdqVEojlaKBR+3zXBJHJNTzdYbrlqZTekrBMlCy76rzJ+dmDu78R0xTWW
         iboJSw1FMAbiSWwaw+23HYsnCpjp1EOKvpbAVzWrNCRQAgjK5mDc1Io8IfXRQopJAv8b
         t8qP6URttQBbF/sljoPemiQkGxqlazPgfkwcPJ9SPB68+ysSxs5f5SNC1T2FHx9p7X8b
         YAYjGLbPoOuiDcGSInX0a2a6BmJbgvELAtJSt4o1tNB32BRA6b2H30ANaX6Gmo4iwvgQ
         Lyieb9mKw9uDlf2/wSUbsPzupq6x8+OfuztUFgKkqVPtIHQH8mDjajeepC1PsAcOGd3T
         ZyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734914; x=1750339714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLRgP3IIDXezaBsOM8+vWEmARGcut96oeFGa111PeEU=;
        b=RjKS+1Vl+h0zOx3FrKA1UnewgTIEcIonvBw7efpVQlDYha5RdP8jQuxVHMS3tF73n6
         Cck7eg+6cFoOCV6BC9QwIp7t0u+sxPwUFfXlSMP6wi2v7XrCUShKuRV/ufTIKr6EGXjr
         dugR7CSoLhTsDhMrSq1xOC85uwDZHkERLorwyg4WXyC2Sm8oIVcj5AWnM/OvHe3/vwbj
         uWvHrh3c8rFqESdz169Vm3ogg4fV0g3uVBAS5uBtHZ0enw45ctjpa2VW7TdTDr4/M3bT
         6U57DpsFUvkRkZDKGPd+Y1sfjiY0bNGCtkqoawcEWkZWgtMvtMolQvaIZxE2J0t6zv9d
         +xGA==
X-Forwarded-Encrypted: i=1; AJvYcCVCTOX45lwg/sI0WVOyfBSWwDulDsyuAElApvypeo1xcPcb+RIVbgbaaS50LDOAUl3yC+M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl0x136OEhsqHCyCdVnzlEdCmJz5ubVS3BaO3n61sUS7koI84B
	JgZS/MU4CDsxYVdHVnw+y5Ag2GFBTkaN/81RhBd9ABJ2PBX8YouVZDNitYajIu0gMQA=
X-Gm-Gg: ASbGnct4L4J9tGc8sqwqA3qW56wbALg1OmLJ+8lhmi2ryCNoN1GX3lepIH9tzT86EJt
	qXLKl07ojz07wgkVQDkpTfezFhOOXIs5q5Px7j9JlKuRrzJjFVOlpQhl0UUZ7YkCfCnE3W1hdSk
	lyApdRD1aGPmEzEGzB8e/gMhLuX0TvfbhOOKhwxMFP9lhqYiQPq/+QDyaR7WIYaq6iQIpdBuCZz
	A4ROCxRoga7Xo43DrfgViE4iTFzEoqu9Jg+T2uT1fFUuWjfNF9YRl9nlnAuA5EDNL/6ZUfPJ8m/
	uHHz9w2jMdySVNrPX0z1N6Ua+amQ0HcIlDa0JE57aacNFOyLSvRrtfxV7rzBbetPeoa/vcCXxYw
	=
X-Google-Smtp-Source: AGHT+IFpZt9xeRACCbkBph/0b80F5G96pQJWNHfEEsFXmXUcl680bXAt70dE6+INj00D/baZ5bvXKw==
X-Received: by 2002:a05:600c:1c19:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-4533332161fmr1421105e9.16.1749734913718;
        Thu, 12 Jun 2025 06:28:33 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:33 -0700 (PDT)
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
Subject: [PATCH v8 0/6] arm64 support for Milk-V Duo Module 01 EVB
Date: Thu, 12 Jun 2025 15:28:08 +0200
Message-ID: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
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
v8:
- moved sdhci0_cfg and uart0_cfg pinctrl nodes from module into board .dtsi
- dropped Inochi's RB tags from the patches affected by above changes
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
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 76 ++++++++++++++++
 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 40 +++++++++
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

