Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4030113FEE
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 01:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745976434; cv=none; b=i3VN3QOzLrHcAnlllcZVlY8TpJeJryORFCSnaYFQqko49pel28eFIuYHlV50VbUGcuYp/CFfyADZhhZJRbq6hAcjDCnWTmG/8+tWTQ6qm+ggmBnU+Fp99A8/gkvNXjG/DpVqhoLiIGrUyqgRQ4caZVKHINfcGns02foXkqr7NSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745976434; c=relaxed/simple;
	bh=FNCl1XiuX89EV3IZ+zbzjjZCqp5spzRh1uj7IBRBvTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HL5EeESiCnZjFtCo5PFADmWcNMpR2C/hWF8BMNxul1S4Hc89+bCIc78RG/M2ExaQdgfV9i/BthZqXsIpUCKe4NClIGuffNQBDJLAuP0hAYbra7J/iJJDa1Znzh32fSZGPrfxRxq4hrAwBizPs03PVso8diVQNxdOlhWgNEcS9k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Flc/4VhY; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Flc/4VhY"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4775ce8a4b0so133013121cf.1
        for <sophgo@lists.linux.dev>; Tue, 29 Apr 2025 18:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745976432; x=1746581232; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+qO1MORlZvAIzRB4tDNjI13tses6Kydhdwj9mXuXFn4=;
        b=Flc/4VhYBp/HjEAwnXP3zdxaI92ECtPpnfQtx3Bc8Kz2WzqCpGtO4Mz6zRIupViLcK
         c0KRXj5vCvUYcTmkfFgWlFAMC0BZXa9mmE+E8K1nvdXcElQjWrNDpxoN+UNHUSBL7LQr
         SZP7VxdzMTWmcdOocoXr3tCEUCVcs6iDHpUK8HPBjbUCsAhVY06FY009nUsQFuBi0j9M
         50mYdZmKLH3uXEJpi6cCZyul042Kr/0huMKHFNAuXT/FPUj5QbIKK+QiQQVMQF6jMmUI
         lIgEyDkmfyA+FaDln6kmRhxNz5m7wI3Hz8dyESFj+DJ9MjjbGV2tIuhQ3YxOt0LsYnft
         scLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745976432; x=1746581232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qO1MORlZvAIzRB4tDNjI13tses6Kydhdwj9mXuXFn4=;
        b=WGt7IHbgWkRPHh3aCXTDTa7qIQSgk/cqHhy6eiCjMyeyLXIYNSLZAjX218AVWamZ9I
         XHKusCGNlrmYvRzVEROOaDvyZjE8F4cP4Utt6XPVLi5Y8SwZD55cbjuvqUxNifTOQ7M+
         6DvHnReVUM4kMGVa5f5QkunEP33NjZpZdDrcwkiX/8e1rqbhQLW2k5qm6H0t8SicO4im
         pbE/FMpA/fWzsNHGyv4DBqXqPXMFY14NBA18lrUCMdnh1+HtPYbtNRwp3GSAT8u4BWvX
         QfpI/4wis1lhf0ZHQC5GuVhBzFg45J8u2+K+0+H0V/sogNfpTMopFdmvVVJuvfuWUsKR
         /xNg==
X-Forwarded-Encrypted: i=1; AJvYcCV3j+EnPJo16ul4U49kvOrLzBbd1rFkC53ubCB71TFOykA0ldw+bRVUTAU3cmE2WP25IH33DfA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3YxLmlj8xzh8tseSVV3lw2qmp8tNsYN2LFcLoadamTHeKCpqB
	7VXTogpKNVtLxOr4Jwxk7yVJ2mi9e0AwE7pEfZoEP2omlOCLNfXp
X-Gm-Gg: ASbGnctz7TJROW0vAmQGqnwVT71fOCxuHPL3iUj7N5mwqLTrnSrZ+WHeYhVuSE6BhJF
	baSlOUgepyCqt00OaOKS7cV04nHI42lqNruMmMk031Z+VVZqNTIM+s0LYU0ak1fSfkQGzPn9Qm+
	IVo82leAiYIBrMTSYACpJfqKmTzEOxrdJlkyKPforEzxacKXZJ9etVTRu0oJkPLQa9oPQ0nDyUh
	QeGZQpHqlrOguVRMtHdrlCrbMDK1LmkpPEGa8BY27Xv7PCj6jXWYxTt/2p6LQNnAD1DsuDaUvkk
	sXfMju/z25GPB3iQ
X-Google-Smtp-Source: AGHT+IGMsLOIjeNBpHyXV8xdTCJ6Im3aMfl/H6Lvwc9epi9BhN+OPpNVARbbu1gwO2GJsJc9Sc/T6g==
X-Received: by 2002:a05:622a:5a06:b0:476:97d3:54f with SMTP id d75a77b69052e-489e4991b10mr12935231cf.14.1745976432132;
        Tue, 29 Apr 2025 18:27:12 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47e9eaf4d46sm86963441cf.14.2025.04.29.18.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 18:27:11 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/4] riscv: sophgo: cv18xx: dts rework, part 1
Date: Wed, 30 Apr 2025 09:26:49 +0800
Message-ID: <20250430012654.235830-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is a hard time to maintain cv18xx/sg200x device tree file, as
it uses something that dts override, shared peripheral header
and something hard to migrate arm64 arch. So it is time to rework
the device tree file and reduce potential problems.

The part 1 change mainly focus on the format of the current dts
file, and try to make them easy to understand and adpat for the
arm64 arch.

Inochi Amaoto (4):
  riscv: dts: sophgo: Move all soc specific device into soc dtsi file
  riscv: dts: sophgo: Move riscv cpu definition to a separate file
  riscv: dts: sophgo: rename header file cv18xx.dtsi to cv180x.dtsi
  riscv: dts: sopgho: use SOC_PERIPHERAL_IRQ to calculate interrupt
    number

 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 43 ++++++---
 arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi   | 36 +++++++
 .../dts/sophgo/{cv18xx.dtsi => cv180x.dtsi}   | 95 +++++--------------
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       | 43 ++++++---
 arch/riscv/boot/dts/sophgo/cv181x.dtsi        |  2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi        | 43 ++++++---
 6 files changed, 149 insertions(+), 113 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi
 rename arch/riscv/boot/dts/sophgo/{cv18xx.dtsi => cv180x.dtsi} (75%)

--
2.49.0

