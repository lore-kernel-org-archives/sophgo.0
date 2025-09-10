Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818061DFFC
	for <sophgo@lists.linux.dev>; Wed, 10 Sep 2025 02:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757470047; cv=none; b=W5D9jDLCudPcZu7h5zyJrItAC59nCUh2jgsV9TZbhJdjvZjkdZEtxeHLyjHm5nkFr4Vx9DnF5tvZ+HuBbULHH99yQkfzBe5/C/9aJnh8EBlIfBqK5rjEPN0NvfBGRBkedqjW0G1aOXCPJJeRu8Dgq8N03U+4GRYE2wmDnDHz8GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757470047; c=relaxed/simple;
	bh=Qjlsg5Y7usK9zBPXnwvbzpofibaz7RXIvBEDyIrNx6Q=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=E3pn1K/VVu/Cw/T6WVml4ndKnfOWBoKs9TY6JUCyZc5Pres2OYXmOv91wwzW35D+MFjqmQUnbr2k+mRqB63YUtODtdzihhUfwobe4DynCt1hyAKEgCH7y+BodNHCdGDzfnayy+g//L732d0Ex/EtNnKku6JH0rgvJ/+xg21qcmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDzuK3jL; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDzuK3jL"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b5e88d9994so43642141cf.1
        for <sophgo@lists.linux.dev>; Tue, 09 Sep 2025 19:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757470044; x=1758074844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JupvMSKgb1rw1zIHQW+fGueHkoJ8uYm/8I5zPauDxTU=;
        b=lDzuK3jLdphhmtrX3w6q0w3vOR0SiSBLqZ8fXO6Z6sKEXz/zSdamz1Kn9nkv6FeS5c
         xxV9X8e3IZNrbKGT1/8XLiGxLCc8bNlmf5hOLgdB17njKyZ30438eAPBG0AXsKTvpOCo
         MIR7dJnjAqMms38is6OhC7ZPu9liMr6mYxvdgmjOcW0zZrPgx4DVfwZzq8gg5FxxLe9z
         itTPjOWCYP1ZpVbV3szpClLa82tHlph2PVc1mZS1WuafztZmNqEwUjwGF9Tg8gP+qqxT
         AbnCzTfD4HfbaVUVd9S+VZKjGC3h0dfy+oh0rJjswS0OY/nLfGpIaNb8iz8F1fSSzgM/
         Isbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757470044; x=1758074844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JupvMSKgb1rw1zIHQW+fGueHkoJ8uYm/8I5zPauDxTU=;
        b=Ib20DzxFNUhA1omuXvzdpgBtlt/yyDc+n/3hSk6ftli8040/9UdgG1nvMvrfkBRPGr
         FnCU/l1SlblAuAJz7Fj95O06nMPvYJ53fjoJArb982kJXva8Nt6T+IuoVOBmlxj0DCCo
         c3J9SEm1/G2QR+8TUHiE+CxS9uG60Pwq3t0Mah/sf1EY8mbd27xmG+Tp3DP0Qvvpuzme
         WymGNFW5ZYpFgdzNnieS3b26/GvI4m3BIOrkwcfr51y0iDdr+gEE4ESNfWhjFtqSfxq3
         BW9LbGyHwi+2thM0gxwFGbf92/l3Cu+A1A6/gsOwsGvg0XTkDYdowkLKRih0lJQyVJWK
         iDEg==
X-Forwarded-Encrypted: i=1; AJvYcCXah8UTXvLJV3xNjfN/+PZJX0zB6w2RgTgwwDiujOHAs+ruAIMVrrQ7O8xItMSJdV10XaasdI8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk/CVwSvKT1GxXpamcyMfvCY3PBGjo98dLNIhvdIWKt2o4MLyj
	Q1S6fgYnaTn0feFUgIJdVeyCZzwsw1G9Jl+XVFflmjH1/uPzTqiM8y0o
X-Gm-Gg: ASbGnctmO/VmKbRM14n1SF5abbGQhXapGpNwDU/kbAuNvsz8R5x/KpxHEAKPd2S1vTE
	VbMDmmgLBPV63bCicyE1rSWXdAXJL/z69F+2DhJDHZBYrMdRujkuqylk8EMDaFxv/6ZZscxZFD6
	aNpybjpPXVtjkRh+nNzV6XTKTiA2AtswlFxlxmkuEwbtgaRy1Erxiv/K/vj7w+V9C/S88tsdmEU
	qmO8u8d2octZ+zyfspHSbanV7076FLuBhB1bIcxhNBpu3Z4DACgfAu+bzmcfWZj/WMaLA1kFN1H
	BdID6x7ajpu9EtzBaY2BT2UKJf2C2wTdABL7g/s1bT5vNILt5jIuwdatOqJOD51EdEO3pE6Xdk1
	YhFTFzsUjx1X96ugLOluRCjBdceKGaGSm
X-Google-Smtp-Source: AGHT+IEjRNv9cyUm69QgMJCJnQnyhEp01tNG6SttjuPNziAGSPXCkaLL31LMoOKqtBh6Pvi3fZ7WJQ==
X-Received: by 2002:ac8:578d:0:b0:4b0:80c7:ba32 with SMTP id d75a77b69052e-4b5f843c29amr155667861cf.38.1757470044192;
        Tue, 09 Sep 2025 19:07:24 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b5ec7d5d1sm212773085a.48.2025.09.09.19.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:07:23 -0700 (PDT)
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
	fengchun.li@sophgo.com
Subject: [PATCH v2 0/7] Add PCIe support to Sophgo SG2042 SoC
Date: Wed, 10 Sep 2025 10:07:11 +0800
Message-Id: <cover.1757467895.git.unicorn_wang@outlook.com>
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

Changes in v2:

  This patchset is based on v6.17-rc1.

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

---

Chen Wang (7):
  dt-bindings: pci: Add Sophgo SG2042 PCIe host
  PCI: cadence: Check pcie-ops before using it.
  PCI: sg2042: Add Sophgo SG2042 PCIe driver
  riscv: sophgo: dts: add PCIe controllers for SG2042
  riscv: sophgo: dts: enable PCIe for PioneerBox
  riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
  riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0

 .../bindings/pci/sophgo,sg2042-pcie-host.yaml |  64 +++++++++++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts  |  12 ++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts  |  12 ++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  12 ++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  88 +++++++++++++++
 drivers/pci/controller/cadence/Kconfig        |  10 ++
 drivers/pci/controller/cadence/Makefile       |   1 +
 .../controller/cadence/pcie-cadence-host.c    |   2 +-
 drivers/pci/controller/cadence/pcie-cadence.c |   4 +-
 drivers/pci/controller/cadence/pcie-cadence.h |   6 +-
 drivers/pci/controller/cadence/pcie-sg2042.c  | 104 ++++++++++++++++++
 11 files changed, 309 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
 create mode 100644 drivers/pci/controller/cadence/pcie-sg2042.c


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.34.1

