Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D4A7260A
	for <sophgo@lists.linux.dev>; Thu, 28 Aug 2025 02:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756347372; cv=none; b=rY6mb4W99ofLyCs3mTnixB5xDZ4KQu4HV1TJ4/m9y/sP2CfuaAPGsMMEND7f+9/ui4cazlqpOE8aJ+VpCvtU2XClT3l22SJ25sp2tQ+xqmZGwHrLswSD9ELUBy17mtRlpSZeMQeCULkgOjZZilH53KaALJwZ9bLkrG+WhfuGvtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756347372; c=relaxed/simple;
	bh=hQA5+HMhBQRr5xtsFYZe4R2Zx9gyn1TFM720u0MLzb8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=k+RZNN/RN8267XypVR+ZtnSv0OD9HBIT2c5dHTT90u7CiuG+zQMtAjIcGie3E5L7ui/wyAgW/us+uXkqzVUZ0yxmsQJPJl5eP99p1ug4WswC6a6d3vqzxNGzD5qWP+RQKY7CjHGdJsemmHFIlz65XdA+bGwps7Ayhs1BxSrHhUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bj7IlXt5; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bj7IlXt5"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-74542b1b2bcso499412a34.3
        for <sophgo@lists.linux.dev>; Wed, 27 Aug 2025 19:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756347369; x=1756952169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KyDnSuhDjQ8VOJ+mJFnTBacGVMg4yY+Nne4s1ctZDzo=;
        b=bj7IlXt5G7siq4XoH5kT9dcE4vETsJIeC2rKyJfs3lx9eyPDDw+sOBkwAPyqfOxmXh
         W+dATAEJTXDGN08msMhYQQ2dZyshHAmrspFsTzuSYZexZ7SY6hzIx9G2Aig+bVd8VbhR
         fryD5OHuI1ldmNsZBaNOWvRTEWyR4uAPXoQ0WXBMm757EhdEk8no6oNUmhO5ZQ7Txhv7
         gghmNZmtmt+wa2eMJIOEyi9GoVGtstjD25rG/8sikJ+iJpCwTVnUlI355rZLN2QL1Bso
         HExktO+ygdXxx2KLjws565RGEq9P5RmLLWOQRezmI+ManiJMOHdV8LLscyy3d6jb3Ryb
         DZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756347369; x=1756952169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KyDnSuhDjQ8VOJ+mJFnTBacGVMg4yY+Nne4s1ctZDzo=;
        b=sJOl1MfYLHCK6dHg2zbmjFAJ3zp3MZkpmAgHo8w0EwHPNZrCoKNmZAivQPKQqA3ZyW
         yooQulE1pXbJwyI95jVoq08nxsaWaAOtlsUKLX2+RdzT9ZthWNay+XILBbVZoiRzPn+D
         ElvpvLCzVaRnZuK/JpGPmawj5Maxhhie784TXfGtEgG2jzhc7+BamS1d2VvnKNggsDLt
         LDEVZceVNE3AAlmrQONcTDLsCpBKSUYjC9eQGYGUt6VZsD1VpznKIMe7ue6DGJGzLNiJ
         Jw/scI4UCHuiO3D8afZwNMjiotAa6bKhhehF4HKuIVwnqF8+A9JXoRjBXleNTI05yLX8
         2HQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9aBGMZf6NKMdXxWM59+RhuZJutCp9w/uLwwwARsU12RH/Nq8sAOQsC85d41AkDyYdb5DNTaY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwH+1uzxD9w0ZKf47/C7KCMylYTKLPvDjbPD2BcodbFeIYhfI7T
	3ksEOEy017qnA5lcrbkVxyGpO7FrVx//+cvSPqtwLFTThVVyU3iMi8Aa
X-Gm-Gg: ASbGncv1palINx/M4HY2tcW1O7aYHQauw1sYqlev8WxHcm4PqO0BGryDNOYUhsRrig0
	Qyd0S7sBsLryhTGPRoVR8I0Zmgdavex36zX/hVKz8aBJ8e7Ad/pMWBfAYYckSDcyhi0yR48UIWx
	T5h9UM2+HW5Gnv0d6ldbdssiALwjm6PR9CUFpdWepzg3pfG6MjEt0qAX6Of2U8TsogEiAIpARcJ
	rvLMUcDxo4gUKCIkC2lsTxLwR857o4Lw7yAXA948LB9f6Wc1LTfXT3MdCphmsXoVO+4Zbg7SWYW
	fXL3DZxVM4e6IwyAEQUA24W/IgRmBZc/Cn5wRynJMFSXIz5+KqUXv/eT87yB4IlQQXIjgvczb7Z
	HnZgaTcrRdLjizWG3vETkjD6qyn/Tl7AxRWlL6CFXvR4=
X-Google-Smtp-Source: AGHT+IGTwvNOSas/djEs+uapV36wAJNWQmeyipG2QXZwMOf63seTufF1qhsaw+7FW+qp86Wa2UCa6g==
X-Received: by 2002:a05:6830:6b0f:b0:745:2adc:af4d with SMTP id 46e09a7af769-7452adcb1admr5051880a34.29.1756347369587;
        Wed, 27 Aug 2025 19:16:09 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7450e474c97sm3505230a34.23.2025.08.27.19.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 19:16:08 -0700 (PDT)
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
Subject: [PATCH 0/5] Add PCIe support to Sophgo SG2042 SoC
Date: Thu, 28 Aug 2025 10:15:58 +0800
Message-Id: <cover.1756344464.git.unicorn_wang@outlook.com>
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

Note, regarding [2/5] of this patchset, this fix is introduced because
the pcie->ops pointer is not filled in SG2042 PCIe driver. This is not
a must-have parameter, if we use it w/o checking will cause a null
pointer access error during runtime.

Link: https://lore.kernel.org/linux-riscv/cover.1736923025.git.unicorn_wang@outlook.com/ [old-series]

This patchset is based on v6.17-rc1.

Thanks,
Chen

---

Chen Wang (5):
  dt-bindings: pci: Add Sophgo SG2042 PCIe host
  PCI: cadence: Fix NULL pointer error for ops
  PCI: sg2042: Add Sophgo SG2042 PCIe driver
  riscv: sophgo: dts: add pcie controllers for SG2042
  riscv: sophgo: dts: enable pcie for PioneerBox

 .../bindings/pci/sophgo,sg2042-pcie-host.yaml |  66 +++++++++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  12 ++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  66 +++++++++
 drivers/pci/controller/cadence/Kconfig        |  12 ++
 drivers/pci/controller/cadence/Makefile       |   1 +
 .../controller/cadence/pcie-cadence-host.c    |   2 +-
 drivers/pci/controller/cadence/pcie-cadence.c |   4 +-
 drivers/pci/controller/cadence/pcie-cadence.h |   6 +-
 drivers/pci/controller/cadence/pcie-sg2042.c  | 134 ++++++++++++++++++
 9 files changed, 297 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
 create mode 100644 drivers/pci/controller/cadence/pcie-sg2042.c


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.34.1

