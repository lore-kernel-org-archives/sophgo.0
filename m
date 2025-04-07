Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38A711CA0
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 01:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988016; cv=none; b=cwEPSuHRbRHwEGgJQlXThPwS6E/LLvSiUfQKqieNPig5lGMyEPXMlMO7EZ2eopW7ozuUFy7Vpc2T35OfYFfKAaHEHq1RrFHAnEqXLps+y+6GGqMmjUW5/jtvPuABiOJn7DE3rNwW01I6mo0sm+iKhfqkjagEMuxo6BExwLZN1bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988016; c=relaxed/simple;
	bh=sdp+G67QR0HwPQHeagpP0IIY/Vorgo7L/yl/QyQQ2Uo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uVGBq1u04GEgdxjWbkiIrNr8ViLBXRXL4hlucksnwswKZb9x/mo2luan1e4fAQDU0yZFJJ0rV6Rn8Lv+uoBVMGFYTw55SVpLFIBuCbJAnbhpAmbCsalYZ5nFLpKzAHRHvkhB+HW7S8kooQkv/CbgeqLfqeMOzy1Um1Qh73Jv28c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpA0VBBz; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpA0VBBz"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e900a7ce55so59599016d6.3
        for <sophgo@lists.linux.dev>; Sun, 06 Apr 2025 18:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988013; x=1744592813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4a6js1q8OOEGyyd0wjaSrE6JWZSzZDovznFnBmj8zs=;
        b=FpA0VBBzKeVC0sdVZs/h1g+Au1XyQ0kovAFPJMUaOdKu3PII5RJ/6cWTtCyb/ifzqi
         bhIk00o39Uww6Q3WAZQk3YoFf5gQMJtlDhECBpxXsIAHDnYS2epnkMOXffRrd5T+zNEh
         I1vAlAgmmCTOWXhwCSdbvVqoTdDR6P+IuUeB5s5N2+M3l5Aau3q4KU40s9wm39aWfYMO
         P2/GRggGfvIJwSywmxgkmjJw+P4mTOBjXo8wVWKCXVNVBmqNRNzC/fGEH7KSWrT3Qknp
         pP17S3YxhKDRPdpmmE4frRXYLR8560MkxUxSwuX4oFikLrZSKXgAKycRKYg3cXLhnVQV
         SOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988013; x=1744592813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4a6js1q8OOEGyyd0wjaSrE6JWZSzZDovznFnBmj8zs=;
        b=uxQTspjwNX8y69jJX1Kcm2egoUUs216uFQNiwOlsrvTUTVxecth8cV1rl7qiOgbAHM
         V42mzIIHqEpl4Df9x8k+I5uzh+9HLaDxRrYqKcmdZeLGp6S75eqPDatRfhbfSyPGsy+7
         2i4cVcQtbeHLk00dfD2b545xk/YLhsUE6ABruyGOJn5PoggHx2otLAQUSEvSmfjT4Ill
         ZFPaz8bk8RJ8xqq/QcIxFQX70qxcZPu/y2guqYYnkULoq0w9HZD05oONbRCyJnI18glZ
         oLW5Nswv+yAMmSIRzFYuY8KdbCH1g96Biv8Ht+zHkG25PYrJzodW8KuEl7iMjMPiszqW
         Z9NA==
X-Forwarded-Encrypted: i=1; AJvYcCX2UJBhUn64j9vAl+CHEePZXzhR6iGMbjJ0hORrBqJitWLXerSJR/5qp5WAqhtqBuD18wgKVkw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHu6hffZZo7p+K6bjyyC3KLzVWg+KKUwPFyiIW2LgHvhp9QBvm
	vHeCOwKT4MVLVYxetwaVzuJQCN5e63P2WGTtM3f25wUmgQMo45+K
X-Gm-Gg: ASbGncsIPvtKHkIiH1zT/8XAU8GyAk8ukmwcj5QJX1AVozA93op9Pl+j7PBIjs2wOTt
	R/LRQWbfMSEMI5QLdsijle74CdwO4AZNGBSjF8qfPU/Kt7nYdiCEdUUZLzz/QFE1vzpXuIPBtep
	Ppcfe2SUnqoaAr3/U1pKoaWjVpbIGKRc8jRw6V8gq4Z8bBtMHJQNgDdJJsqI8TqxxHa/CpAEAN2
	g/41vt5qNR01OjEPw2UGOXSq2/wLqhil3C/bMI6Y3dmPdqVUtzsJMkkaUlBZw42urYBXXOGTHt3
	6KnQK3pWZuxt6k62/TlN
X-Google-Smtp-Source: AGHT+IHkC+AE89umfaDeyIGjjiCSVOcB7pf9Ijef1ekZ2c/N5mi+YxnKKu0aH8SynK3OvfNoFND1bw==
X-Received: by 2002:ad4:5d6e:0:b0:6e8:9843:ec99 with SMTP id 6a1803df08f44-6f01e7996demr163789416d6.41.1743988013630;
        Sun, 06 Apr 2025 18:06:53 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f00f09fsm51936316d6.48.2025.04.06.18.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:06:53 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/9] riscv: sophgo: Introduce SG2044 SRD3-10 board support
Date: Mon,  7 Apr 2025 09:06:05 +0800
Message-ID: <20250407010616.749833-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo SG2044 SRD3-10 is an ATX board bases on Sophgo SG2044 SoC.
This board includes 5 uart ports, 5 pcie x8 slots, 1 1G Ethernet port,
1 microSD slot.

Introduce basic support for this board and Sophgo SG2044 SoC

Inochi Amaoto (9):
  dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
  dt-bindings: interrupt-controller: Add Sophgo SG2044 CLINT mswi
  dt-bindings: interrupt-controller: Add Sophgo SG2044 PLIC
  dt-bindings: reset: sophgo: Add SG2044 bindings.
  dt-bindings: hwmon: Add Sophgo SG2044 external hardware monitor
    support
  dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2044 support
  dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C controller
  dt-bindings: riscv: sophgo: Add SG2044 compatible string
  riscv: dts: sophgo: Add initial device tree of Sophgo SRD3-10

 .../hwmon/sophgo,sg2042-hwmon-mcu.yaml        |    6 +-
 .../bindings/i2c/snps,designware-i2c.yaml     |    4 +
 .../sifive,plic-1.0.0.yaml                    |    1 +
 .../thead,c900-aclint-mswi.yaml               |    1 +
 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |    7 +-
 .../bindings/reset/sophgo,sg2042-reset.yaml   |    7 +-
 .../devicetree/bindings/riscv/sophgo.yaml     |    4 +
 .../timer/thead,c900-aclint-mtimer.yaml       |    1 +
 arch/riscv/boot/dts/sophgo/Makefile           |    1 +
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi   | 3002 +++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2044-reset.h     |  128 +
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   32 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        |   86 +
 13 files changed, 3277 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-reset.h
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044.dtsi

--
2.49.0

