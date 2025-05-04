Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0326C2FA
	for <sophgo@lists.linux.dev>; Sun,  4 May 2025 00:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746319485; cv=none; b=tRKUDIJuu1Z0J3qAnJKf4Ut7fBQ6lTDqr07hkC3XV78q6vXe+Y0U+jK5iN3x/zWn+Nmc2IlYxgH71HRCX+CsSXM7lrtr/qaSUi0P7ifPOJoVPcTdFYz5eCYh+RN4mQwODQabV5OxKT+iD0bTiZhaSGv6hmOndPmAMukDEQTqkIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746319485; c=relaxed/simple;
	bh=qEVm2sg8MGW9YD9CRvOyiYXTGUY5l70qN8vg4+ORMPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ou+B9GTkcGtRJ8ruw3KSwidu0PB7tmBdTQiaAorgP43fWdJj/nxIOY/5TPj1/j9g29uKM9CcMDajDDvLRMlbViKCJDlzVBAokD5/4167QFs0oFtGbTAaOR2ajkAOgB+XdyW/Set/l/z/M7awQ5KFjRK8s4hfxsk9dOTowtpsRvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUtM13Gf; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUtM13Gf"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6ecf0e07947so35218286d6.0
        for <sophgo@lists.linux.dev>; Sat, 03 May 2025 17:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746319483; x=1746924283; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lBTdU5/DczpzT7bxTMClec5iVTOpUIHz+Uhri46H47k=;
        b=XUtM13GfWvP5IpNsGzSkl4hY129ybdVIBBgXmX0I3xIdjuopntNleF4WElDxOkxJZf
         Os35t1OuGEhSv5ppBH+iunm7ZlsWpmjy05hUuGO6rG6kNEz4xcT8BNN0oSWC/sbqy1mJ
         l3zhEJ6c9BLhERO2JU3XxL9RHuHGbSovlyF8n5O8Eia6B4ErF2gQIWH+eGLz52hsP2QV
         YfwxDHYhzc2Fbp3NN4vXM52sJcXeDhgk1NfZUiBpqrQPF14IoHZixfS7MXq5WG08LCYQ
         goIuOnbttY0Q6IGiJ1hsdrw6HSUSKWe38ml0ZR20CSjCfREGCt6qzakCD8axs2aJk1bl
         7XBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746319483; x=1746924283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBTdU5/DczpzT7bxTMClec5iVTOpUIHz+Uhri46H47k=;
        b=I/peFi97qM2nGUsO1kOQEze58WnE4JJ+X0ROXcBBFhrCYjNgXVIwLGTsQJGScuydk6
         okXFKGjg7iWDJPUO/FrQVOnGLbpG6M490szVrCXBu/EIKNz4wyEnG5aOCtuXou4S7OA6
         T/I8MjAum5NCtv/uhMeQKWVsPcMaaWNTW5AZsIZSSVHR7zHxnzrsRSdIvkMIrywdbOqc
         mB7tL0DY/t0hhKp2AtQAYqbwt7iE5bdbp8hcz1ZGlRlDVHe8IM8fIwrNFnu/pgVJZAGN
         PdCFsUzPIQDF/CtvSDW2FsNfr+Kb468d+gBC2d/5yOJZNWlIjtprlwpVewIEBRNNG2Da
         k50g==
X-Forwarded-Encrypted: i=1; AJvYcCWVN9z0OAxVHy76cubFfVEs/UHXfutJnwZJJ5iCutcT65ptmbSbGfDbpmamBoBNtmWnex3W35Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYZi/dCg8YxEWDnJnCcrIOZd+Y+ZMILdoGQVVrwGMbKdb2PWU9
	hEuckH50JnEmD2yatrwrEtZndBO7u6FRYnh7ixltmNqoRh5XvTsz
X-Gm-Gg: ASbGnctz1RB3ciIRNTTE/h+RCfFKKUkvWsgi7vzW64u7uVfvEnJh0MicVQUi4FaqXbo
	dXtv6eKfUzp3mb9T1EEAvGlbIU4E0h0cpxhlqmI2H49rg1YmcLxs8pD0pHbA+4l0J+ISDHctj9g
	aDLwjSiYMWu/ndRrvQIVW8NEOLVNUrzWAO5Pc452OJ4OXvmx4rBt0KNTOlksEtZikN4BfGLXuNg
	Ykc+WVwj2/bg/BV4Cp8Nr48ka+tvHKbnm8qBWApaFXBksSjbatOYEX3gghI4+9t/4h8uGtRd7dx
	ZcRUt15HOlh/HGY1
X-Google-Smtp-Source: AGHT+IEDwbk2Ni1OGcnEfuTByVJGsVIbn0PVA4xwx3Q1aAWNwQLEX82DH4thMivs0ayFz/by16ai8Q==
X-Received: by 2002:a05:6214:20e6:b0:6f5:dad:5a60 with SMTP id 6a1803df08f44-6f515264f21mr128971706d6.3.1746319482732;
        Sat, 03 May 2025 17:44:42 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f50f3b05efsm38597456d6.23.2025.05.03.17.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 17:44:42 -0700 (PDT)
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Niklas Cassel <cassel@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Shradha Todi <shradha.t@samsung.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 0/2] riscv: sophgo Add PCIe support to Sophgo SG2044 SoC
Date: Sun,  4 May 2025 08:44:17 +0800
Message-ID: <20250504004420.202685-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
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

[1] https://lore.kernel.org/all/20250413224922.69719-1-inochiama@gmail.com

Changed from v2:
- https://lore.kernel.org/all/20250304071239.352486-1-inochiama@gmail.com
1. patch 1: remove "|+" for description
2. patch 1: apply Rob's tag
3. patch 2: remove empty irq_eoi and use handle_level_irq as the right
	    irq handle function.

Changed from v1:
- https://lore.kernel.org/all/20250221013758.370936-1-inochiama@gmail.com
1. patch 1: remove dma-coherent property
2. patch 2: remove unused reset
3. patch 2: fix Kconfig menu title and reorder the entry
4. patch 2: use FIELD_GET/FIELD_PREP to simplify the code.
5. patch 2: rename the irq handle function to match the irq_chip name

Inochi Amaoto (2):
  dt-bindings: pci: Add Sophgo SG2044 PCIe host
  PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver

 .../bindings/pci/sophgo,sg2044-pcie.yaml      | 122 +++++++++
 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-dw-sophgo.c   | 258 ++++++++++++++++++
 4 files changed, 391 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-dw-sophgo.c

--
2.49.0

