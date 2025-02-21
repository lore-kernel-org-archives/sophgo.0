Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18676088F
	for <sophgo@lists.linux.dev>; Fri, 21 Feb 2025 01:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740101898; cv=none; b=P39Ml/+6EcoJXf1Dp9G9tfGz3bb0z0aHN11DAkECkDcGyMBexu4b6N7HgcKUSNK6qgxm3vDkBgNLjh1+kuL9BxK5EgYqh/RnRM3jMVLRuhy78oF93wSazP/GTZJ3G310BHiBKnKwAEnfiLAok3iotquBVTQU1isbcEx6E5/dBiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740101898; c=relaxed/simple;
	bh=Zln9SAxKxXkgQiUdBxJ6k+hH4AwAQ92Yze1/59N65gk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HxGR/jXtmLLDEuOZxyf88cbwUZ8WN9wdVQN+8qXtLnbzpmZsWd+ClIp5hEM8VInKjPsTc4TUPeZ96yuII40oJZPPQ5U8YWiVftUMC4yMCtkfwiZ6Hyx0yn1A18Pd1KXIhDdfaAqKjKR8vUv/zOIyUDYwR6dfPVQX5N6ZZGrhDFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvBzCwpX; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvBzCwpX"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e6827984b2so17572176d6.1
        for <sophgo@lists.linux.dev>; Thu, 20 Feb 2025 17:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740101895; x=1740706695; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uTSidftreS4QFmmprzmQTP0Ok8hTg1K/MceCazw94nA=;
        b=RvBzCwpXZCJyVLUIJBDpkcS4DvnSNll91TGTjZjpQrEyGEZSUS41CvaUYPZuMklMCH
         UhhkIXG7gfW13a0Zj7Y64h9hCwfRFVlDL9HMhpd29N/0dZvgDiuPXxu0hd/xwh0CODcn
         sXDlzjLA8u/Q8LAP9eYIChgAhP78TQumjBVCwiH+zcZ7OvA/VnDQ/ZDa+jc2vknraOdX
         Z5Thv/CDxjLB6y6kGEX6IJb91n1wlL1zS60HU2RAawJFm943gdBZQTfqlwC7MZTsllqm
         UTNRm24auAtSqXgHeUwrYFBxvpaOEW18NYcTYJlOCAdW7yL5ucDsAi0LfGuGBsHpQbz/
         aHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740101895; x=1740706695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTSidftreS4QFmmprzmQTP0Ok8hTg1K/MceCazw94nA=;
        b=T5jZ/+ISBgSqPEI0HKOQ8Aycq0cxiLR6beYSR82uFuUC6ZbMQpPNQwrJPjP/EzMb+c
         Sii07bAwGY75nm4sN24i9uTbujeSPm+AWCfqxFQucIY2PiJSql/dYDRakTHsnrlH3BKq
         LmBSNcoWr2u3uA6DXfBf0cEJXvIyyPNe9tLeRlYkVhllojyCYBEzu8sK+cY2TIWavt9w
         /dv/71yv0P9RooSM/+mkdQucuk0qU4HPmfAav5fTGUFFuTqY9jYXjC5/421QUVE77KyO
         TIEnBfLj32PhHWNgOOeVfK+6hvFPVQA81UMm+IjoG/L0CU3wWymBVW4lJE0Ko6lEbqDZ
         V28A==
X-Forwarded-Encrypted: i=1; AJvYcCX8MTgwza7r4ggH+VIpwBwXtn5E1e3WtTGqpPAC1E9xpvjFEfApd5BSfjR9nk/dBEp03hnOs98=@lists.linux.dev
X-Gm-Message-State: AOJu0YysITE5PMQ2tMVD9ImgXCC8oppvxGGAScZIbgK32vNd92Iws+JI
	UQGOwqzMpfHT/M+TlbqC4cWxTaEWpY7Uh4nQ1MDgcpl77nmksSZN
X-Gm-Gg: ASbGncscyKDNvr3cFxHVzOizRmd5IA/0q3R1iQKlynZSNK73+c+c2ZmuTKiHD5U8z3Q
	Yji7B8y1HrY+RTgurPWeei2V7EvK1Dq8LNaEK2QWVrZMfu+8vZFbm2JN0RqFoC4CEx/D8NKZV/E
	2y/PTy1d1pNyCrkENFUeNFGCt47x47hOb21yql1p8WoV0PfmOLD+xR5yJulQ/aFl9J6w2nhqdKA
	FwNw8RIqhsPdqefBScVIz5VBhBgvmUNgWSSOAjNorSagD8Ks+3n9m95TRjM0tWwgAe9BWWrpGEh
	vw==
X-Google-Smtp-Source: AGHT+IHhua4oxHyol2HKv9TAxs1TEtTYZXq5TSxXKdjQrvU4ioWpfZxfRhn7MqQPrbNidkwG52d/Mg==
X-Received: by 2002:a05:6214:f27:b0:6e6:5ede:7d83 with SMTP id 6a1803df08f44-6e6ae82dc98mr20922326d6.25.1740101895447;
        Thu, 20 Feb 2025 17:38:15 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65d785d12sm91995966d6.37.2025.02.20.17.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 17:38:14 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Niklas Cassel <cassel@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: sophgo Add PCIe support to Sophgo SG2044 SoC
Date: Fri, 21 Feb 2025 09:37:54 +0800
Message-ID: <20250221013758.370936-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo's SG2044 SoC uses Synopsys Designware PCIe core
to implement RC mode.

For legacy interrupt, the PCIe controller on SG2044 implement
its own legacy interrupt controller. For MSI/MSI-X, it use an
external interrupt controller to handle.

The external MSI interrupt controller patch can be found on [1].
As SG2044 needs a mirror change to support the way to send MSI
message and different irq number.

[1] https://lore.kernel.org/all/cover.1736921549.git.unicorn_wang@outlook.com/

Inochi Amaoto (2):
  dt-bindings: pci: Add Sophgo SG2044 PCIe host
  PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver

 .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++
 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-dw-sophgo.c   | 282 ++++++++++++++++++
 4 files changed, 418 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-dw-sophgo.c

--
2.48.1

