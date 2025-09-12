Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D3B1D5146
	for <sophgo@lists.linux.dev>; Fri, 12 Sep 2025 02:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757644524; cv=none; b=DuqGq3ZLWHHpuVs8tuFoyrOR5TEFlC5Hpz8Q9coP59BBt8MLdRvcHxKjcrcKuFXRi7x9M3XQLezjUfU1j4DB51yd2zbYXcMye28j2Q0iC6oTHdOyJknNeIo4xo4SQhg0o5rANeU/5rbLwKWo4XhGaAkrwpHplWTwt/XkioYvMU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757644524; c=relaxed/simple;
	bh=gH9mXsZ1NreP7BRLCz/KnwpMOnnbb5r27TVVPsD+/H8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=PAIGgkaZLEIrTUKDRHCdRUl3RF093Nth3P+Lxccfk6859n13WRXxDkoJ44JR5WLUA1pTtEzYi3bP3IakqdYSER3pyYw8JjCrsjaujQ2yGqaE7wlq6+KUWOOZGwyD+GWnwAMckEURbw4ZfcPgtipXynfm1WJvXr7M659vLV/vyE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8QoFdZv; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8QoFdZv"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7459fa1ef2aso1442127a34.1
        for <sophgo@lists.linux.dev>; Thu, 11 Sep 2025 19:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757644521; x=1758249321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=adSqTL8NuaakTvHTADgBkkDWAaGQjbxG9j1BynMCSQU=;
        b=Q8QoFdZvi7nId/FysvGya0Wge6qv9uPy7hys5XD+h2iKz1kOQRldnRAuTvDMzRF0eT
         5O+9VqMYiaq1y0wsGA8wQcd0g3daGiYRBoRbSbDYykdJyHaZoMgyDRnxv1E+erIlwovt
         1UX+Mc+WWwzgbpkIrM2KPAU7ZhZiedg9g295nnFcUvYL4s1D4HsqN5iN61OPaMwAtuac
         6WX34u/OTbZG0WYTc/k9NvTnmVjOUmcvbHV3vk/X6SK2UztjmluOvfNJrjbUvbJhkaSK
         tdfJmKfjCOlsdNM1Yod+lvdnGUOqpnojxOuw2wOjEXtwU81luw/G1XRB2xihols+ws6B
         CYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757644521; x=1758249321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adSqTL8NuaakTvHTADgBkkDWAaGQjbxG9j1BynMCSQU=;
        b=dEn+sH93Kz0/0TSskNRp1qPgwpJyciuPw3F04ZP/4PbZPmLX/OiZrqNiMPrzQIFFv5
         srvi7XX+aK8YXYHq1EqUo9vm0Hduc4TjiLmD/hM65fdkLuVRAMWUrfcgtXnVmk8X5PS0
         BShgxwpCTq/HAPMpTeDZVhH+qRSiICx7vfGPCwBmsqjNEknkIrRS8JTJcVG3NPSh85ED
         DlMjTiRpvH2dUGqII6lUaK2Relfcb49/TQUxrR/Tib8XSu4RQ8DaGzbECM/5nvdmAXCt
         37DNiaM8aTzwi8gIO59kfmM12PJ/Es4xBR2sgD6bqO0DZJFrEQxJznOtZknPYSG/20jh
         8owA==
X-Forwarded-Encrypted: i=1; AJvYcCV7gsmPhCxVGHp4UuvRa/eUAvDjntKSS36dMayo9rIjFQcIJJcZQuSHpfEm0iWEyItO1DhfbUk=@lists.linux.dev
X-Gm-Message-State: AOJu0YymIAcN3rkH7NFjyfMWHrSkbQ6UKZgnNqaMqttz28fpH1avJ8Xq
	5IlW6UxYeKUEUJ9+ImOvGX9ul4xTCXOQlM5bBYGVOfuHpyvYUdiOMknb
X-Gm-Gg: ASbGncswhCEtW7AtG6mG3T2rcWpeGOcqqjqfWBWd0r314AEKlOLLSZVNp9X58ntJX94
	ag21PcBJLpqyAMh0aodm5cMkRrvcv5SNtQSsZaMFBO4f+7mmqikJUJvcodh1+K0NNFwp84Gn2Oc
	KUo9p3qFd3XJ4uoEtyrPkekxRNJEe0AMGLV/yibytMRhHeEtSjTBUhysmbX35EER8ZxnNNoIJqE
	u4+crzFxl8WrYbab4UsCpZEnHIDGqiAxRsyiNGoi+Pu8Joe4OWAX/dry/+HJwgKdESJ9pfSKFr6
	2lVIqJZz6qerGnSudNuGca+p5hE0t1R9yHB/jFdw+s5wdNbKhFMWdv2NTbccPqYr4miGfokDpwt
	TAJ2avy+WgcOxs4tNxUVnc3nRwmzjGkE/
X-Google-Smtp-Source: AGHT+IGWQK39i39FWL4qHMCK2JcI2v7l2UTe5cu2Hfp1wmFQwUNAPDH21RFBHh1BoHV6V+GM7HwRsg==
X-Received: by 2002:a05:6808:1244:b0:437:eb1d:cdde with SMTP id 5614622812f47-43b8da33f47mr464232b6e.33.1757644520618;
        Thu, 11 Sep 2025 19:35:20 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43b82aa7b97sm559913b6e.24.2025.09.11.19.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:35:19 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com,
	jeffbai@aosc.io
Subject: [PATCH v3 0/7] Add PCIe support to Sophgo SG2042 SoC
Date: Fri, 12 Sep 2025 10:35:10 +0800
Message-Id: <cover.1757643388.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Sophgo's SG2042 SoC uses Cadence PCIe core to implement RC mode.

This is a completely rewritten PCIe driver for SG2042. It inherits
some previously submitted patch codes (not merged into the upstream
mainline), but the biggest difference is that the support for
compatibility with old 32-bit PCIe devices has been removed in this
new version. This is because after discussing with community users,
we felt that there was not much demand for support for old devices,
so we made a new design based on the simplified design and practical
needs. If someone really needs to play with old devices, we can provide
them with some necessary hack patches in the downstream repository.

Since the new design is quite different from the old code, I will
release it as a new patch series. The old patch series can be found in
here [old-series].

Note, regarding [2/7] of this patchset, this fix is introduced because
the pcie->ops pointer is not filled in SG2042 PCIe driver. This is not
a must-have parameter, if we use it w/o checking will cause a null
pointer access error during runtime.

Link: https://lore.kernel.org/linux-riscv/cover.1736923025.git.unicorn_wang@outlook.com/ [old-series]

Thanks,
Chen

---

Changes in v3:

  This patchset is based on v6.17-rc1.

  Fixed following issues for driver code based on feedbacks from Bjorn Helgaas,
  Mingcong Bai, thanks.

  - Fixed the issue when building the driver as a module. Define own pm_ops
    inside driver, don't use the ops defined in other built-in drivers.
  - Improve .remove() function to properly disable the host.

Changes in v2:

  This patchset is based on v6.17-rc1. You can simply review or test the
  patches at the link [2].

  Fixed following issues based on feedbacks from Rob Herring, Manivannan Sadhasivam,
  Bjorn Helgaas, ALOK TIWARI, thanks.

  - Driver binding:
    - Removed vendor-id/device-id from "required" property.
  - Improve drivers code:
    - Have separated pci_ops for the root bus and child buses.
    - Make the driver tristate and as a module.
    - Change the configuration name from PCIE_SG2042 to PCIE_SG2042_HOST.
    - Removed "Fixes" tag from commit [2/7], since this is not for an existing bug fix.
    - Other code cleanups and optimizations
  - DT:
    - Add PCIe support for SG2042 EVB boards.    

Changes in v1:

  The patch series is based on v6.17-rc1. You can simply review or test the
  patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/cover.1756344464.git.unicorn_wang@outlook.com/ [1]
Link: https://lore.kernel.org/linux-riscv/cover.1757467895.git.unicorn_wang@outlook.com/ [2]

---

Chen Wang (7):
  dt-bindings: pci: Add Sophgo SG2042 PCIe host
  PCI: cadence: Check pcie-ops before using it
  PCI: sg2042: Add Sophgo SG2042 PCIe driver
  riscv: sophgo: dts: add PCIe controllers for SG2042
  riscv: sophgo: dts: enable PCIe for PioneerBox
  riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
  riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0

 .../bindings/pci/sophgo,sg2042-pcie-host.yaml |  64 ++++++++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts  |  12 ++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts  |  12 ++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  12 ++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  88 +++++++++++
 drivers/pci/controller/cadence/Kconfig        |  10 ++
 drivers/pci/controller/cadence/Makefile       |   1 +
 .../controller/cadence/pcie-cadence-host.c    |   2 +-
 drivers/pci/controller/cadence/pcie-cadence.c |   4 +-
 drivers/pci/controller/cadence/pcie-cadence.h |   6 +-
 drivers/pci/controller/cadence/pcie-sg2042.c  | 138 ++++++++++++++++++
 11 files changed, 343 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
 create mode 100644 drivers/pci/controller/cadence/pcie-sg2042.c


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.34.1

