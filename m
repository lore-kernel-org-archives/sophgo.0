Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EE616F288
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583753; cv=none; b=Gq4w/cS5vsRUnMlKimoyVF5NqXI8rVDLyl2QChu72f04EbHLiUeYEeyHzD6xNI5EwYZi5UbIZnhm+5YUL4r8eZzvHkG0IsC6lWRHal+v5xZhQQdqW3ZNrWjsfzvznqw9cEKS5thL2nkRCx5TIL77xTJCZWlcHu9Ro2nPSjwREp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583753; c=relaxed/simple;
	bh=INPGhkFetjITTXnuZyQwyYqly3zYX7iaDoWJaIaXge8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pZeHLfpqVPNoRylhbyWNFvedwGSHKJNkPScuNrhYP5L4pPuxEX+mWlFZHftPyo1F1eMcuJdvRAIHXO4AEITDhJW6QTYlP22JVF0mWtr8/rpLHig9nXTwfp6U2kTfyUtNSWsjiy2HOg9iiAnx1VLxxNRAFoXv9Anq3iq0RPjpTpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkCsKhAf; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkCsKhAf"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c08f9d0ef3so222194485a.2
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583750; x=1745188550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q5YjA/KfpvY46CadYlUcHuNncn9tBNGFY7tmTjqFT+k=;
        b=gkCsKhAfUCABa2QMkwG2BWzL9hRk8eKVO5TBOYJcWvYy3qb/MVGzxoYc1m9vroaFxb
         xtIMbzNmPnQwszVDT9YThdp1KY66Xux1tBbS26T50XczTcLpH1c3hG49yDyA1xVVwAk1
         fE80MvRYM9Gwf2iswe+z6SBJlh93jqg3NJgTizFiPIL7JfXoah4I4Jqe0Sw9nyOBGWtD
         gjoKPlgS6udHE76om2AcqKq/b6l6Izve7+E0vR7FnZGdZ45wCMoOL9f6DboFN3rINBDK
         3zzT5BLqP6IP4LFFUgSfuy84DMG0fM2o1/TDWTNP7lSRqEwcfle24zu00Todbj36fu+S
         CeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583750; x=1745188550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5YjA/KfpvY46CadYlUcHuNncn9tBNGFY7tmTjqFT+k=;
        b=wj6p/bunkeZys3OwuEy2cHNRlxp0SKQH7XrCXnoRNxXTSZoctHt7IXo6QlCg4BMgAf
         3MrE/hmuCfBmbjUdbTnoFPrQTuzNgoOd7T9JDRqIfmNPlh5U9nWhasQ84jpUo+XJlQII
         gjAmTP0pW4KR5BrcRNhSp7WgPWzE4IO/RIFfLjFawQMV+lSaxC+lsYvQ3eNW4lzKTLoA
         dnT/M46kjnKfbOiqu5dY0jtja3+Jxac4Md5/f59hCN6ntHy6OQeQMWfow2TBYKkLKzuE
         P/uU5LQQ2mkCGTvY75lpvDSfb7FAPcOPTyZOCwi/ySK0aHM943SeUgjXFoeyfQc8TI9Z
         B8pA==
X-Forwarded-Encrypted: i=1; AJvYcCX9Zs3+9WDS/0fDquvOyFq4KhBvYTid5GXZjnfdFZQQDl2za0AarWX5TnjwKUTswHbTaBsauL4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3Fi4TDxxOah1REzg++f3yCIivccc3TD1aSRZZY3fdYAulZej6
	grJ1fVfZf0T1RnTNeYV9M8N8nRRuxr8ddQbDBFM6XDONeDXMpSJr
X-Gm-Gg: ASbGncvPV+LUZLC09QFlw2ac0IDc43Q5e74O+MgTFQm8RgFZ9x0WxEkvguNhXBB48+i
	ELVOvBBtovU5erE+7yb6Ldt2lISv4UFgc/zbAlNwSYO2d9n0PiiHUe11Fm/PfRyswCuaCtqxOki
	eSG2resvd3ICRVFYhagQ6hG2crUlDPKzwgMVOiULOGeSDZU1pNPCRjV+8tZVjhaMEuLDGRQ7HUA
	febxYOeMAqGfNF3eHhHMtCorl3DjF7/BjZplhTAun+1JXyhN347YrEt0gQ8Cs2ptXgYoklts4SK
	lWG9q3n9aj+aqvHI
X-Google-Smtp-Source: AGHT+IF4AYfNDX6fmR9rMqMQ3rY8l2Lo4PsLhdNiIgvJGGBJRv29yNF11cYAsmD/700LbzKyzcIlsA==
X-Received: by 2002:a05:620a:2586:b0:7c5:9b12:f53c with SMTP id af79cd13be357-7c7af0b97femr1590502385a.5.1744583750449;
        Sun, 13 Apr 2025 15:35:50 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8942eb8sm617762685a.12.2025.04.13.15.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:35:50 -0700 (PDT)
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
Subject: [PATCH v2 00/10] riscv: sophgo: Introduce SG2044 SRD3-10 board support
Date: Mon, 14 Apr 2025 06:34:54 +0800
Message-ID: <20250413223507.46480-1-inochiama@gmail.com>
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

Changed from v1:
- https://lore.kernel.org/all/20250407010616.749833-1-inochiama@gmail.com
1. apply Rob's tag
2. patch 1: new patch for grouping all similar compatible ids.
3. patch 7: remove unnecessary compatible check
4. patch 8: adapt for the new patch 1
5. patch 9: fix copyright e-mail

Inochi Amaoto (10):
  dt-bindings: i2c: dw: merge duplicate compatible entry.
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
 .../bindings/i2c/snps,designware-i2c.yaml     |   12 +-
 .../sifive,plic-1.0.0.yaml                    |    1 +
 .../thead,c900-aclint-mswi.yaml               |    1 +
 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |    3 +
 .../bindings/reset/sophgo,sg2042-reset.yaml   |    7 +-
 .../devicetree/bindings/riscv/sophgo.yaml     |    4 +
 .../timer/thead,c900-aclint-mtimer.yaml       |    1 +
 arch/riscv/boot/dts/sophgo/Makefile           |    1 +
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi   | 3002 +++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2044-reset.h     |  128 +
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   32 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        |   86 +
 13 files changed, 3275 insertions(+), 9 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-reset.h
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044.dtsi

--
2.49.0

