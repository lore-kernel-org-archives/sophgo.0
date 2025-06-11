Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9D814900B
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629965; cv=none; b=KCioXK59gPNsABlnrEzTN3lpAI4UrOd1XhpSjNb6yVi2Krfi554QEs/RktEiSVbRo2dvcf3RToDp6EZbFSsZiGUEkVRkf1W+vWL2zX19fmtuQX88BjyyC1dvOcEiEg8bXQKrHcgeK0iy11rbgxZbasPKRpfOFEo0Am3BdcgFzco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629965; c=relaxed/simple;
	bh=BgskhzIjhoBBKnyDbYf2UllhqZ0Rn5azDGC2A7sKqU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WDr3Q5avq9m+3/uutbY/DEKHg2Hpd+OD+kqPbMQXocZJcvHrTtnMrttqXXyvz2Y6nXk3BnGGuHmHjcIaGKAk48rK+r9lvKfmpM8kfyh37oaX5yAGAIDxffhb5vXIyJdmOynXV3yXvSVYLeC+TEAS6Vpx3JyKrYhXs4BFthYCgUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b25Y9kuf; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b25Y9kuf"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fb0eb0f0fbso7651576d6.1
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 01:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629963; x=1750234763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vfmr4VZFRC3blHBv6tjDEsekB2JKza+TxJ7wwghY+Nc=;
        b=b25Y9kufOy9eW5cLOEduH1gaAOtb2krDYBoQL347ILSDR0Q7szOqwLxmlzAQAUE63x
         +gn1o0YSowjL1VV50S+8feICfZVYH35l5F+fxd2rQzIm2Lo0NJMzRhrsmHM8KyZDt02m
         WMR16IWFXkMmT/JCU8LDK2pW2JYzwtVeTsdYbf+qqHYT5AQNLBltwl7HsvjoeutldKrJ
         ejugogsjK/VssqprAmOjGpN5pe2s7muhiB6JTPKu3DmINm5BGmwg2e3LjVTLKPtQTWX7
         7h4JHWmhVXYigC3ZF8P/SiTBV4cyoAsXYHC3f2OB0na3wkTjC8Uxi2Q7NZ1Jkv0qvHzt
         ayYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629963; x=1750234763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfmr4VZFRC3blHBv6tjDEsekB2JKza+TxJ7wwghY+Nc=;
        b=BAmIu1+OaK9HQJDXWw47svsMgr9iq9r24Soe4/2XEikKcx/RpHnUVKjSCILQ9n/tC/
         jX0FTnGrar5QNXFjYPOKwpy6IBm+p6XB0rb1twBk0/IWu7uUJTYQEYZsvAEVgwk+LF1/
         zN+/XZqhVwPwoV7Br7APxyoUNrIkAffe3gtX7QW1CzSrtvLfZ8IcIjiHFYCjV2m20UXx
         9qLl/pV9j2q9XhIBGdzuk3vXUFXSHTMElyjOGuMQdqv/vCCbk5Fgtu70K4kO4KQcdnFX
         Tp79qsAEFOXMhHUwxVKhbrYWqAz0iKd9XLSUlJmJne+d+ru9jE4K6XqqjPIigZgX40+M
         u4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5kaA7fLI6npEICp7ujImaDfXwkwPffZk0KGwgt9OGThaIBIVzHNn2/hrulpsspL4hXSGT5gk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAyrT0gbRDKnK16kFafluhzjw19tdReuOwFWD2TYoqZvrxg9+f
	ulrY/v4sTrjFM92pisvqVrTmf5F3xatd5+r3Y+zCCNR6U975pI1f3SfR
X-Gm-Gg: ASbGnctcyQL+qCl1woitJ1Pvg1XL/32mqjKt4t8odAbf9gtw/H0m/ldkyOdPPU0Nj35
	m+lhkXAI75iUangvxeiPCQ4rAHyb9DBOnuHyMmN2WsJcbrqcZD3TUtIdsr5108yWJH9brAghwrQ
	FfDHhBGD+3ZPvxtxmcod496YlocFxts27hAeefzijyVUWYa81tAkpDWvS5EAdVGiQJP2/UnoSR5
	XJVUe7tYzj9uRDRkGrGQ+qSJ8B9K3ubPiApy6YDvfaJfhRSilNulS22zAuvV299GVpI68Yu6jh9
	0MxwRdlWGe9UZSn5a4WuH6eNP/6T1HELfZ2CMw==
X-Google-Smtp-Source: AGHT+IHLmdiPK1/hfZ3hYVAS6e/Qa18yyzLJzaoN2F5VMxeq5n4N2SYxR2jD2YHscybgUqgzRxu9HA==
X-Received: by 2002:a05:6214:226a:b0:6fa:a65a:224d with SMTP id 6a1803df08f44-6fb2c37a204mr38375446d6.4.1749629962729;
        Wed, 11 Jun 2025 01:19:22 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b366easm78768726d6.114.2025.06.11.01.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:19:22 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 0/2] riscv: sophgo: add USB phy support for CV18XX series
Date: Wed, 11 Jun 2025 16:18:01 +0800
Message-ID: <20250611081804.1196397-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add USB PHY support for CV18XX/SG200X series

Changed from v3:
1. patch 1: remove vbus-gpio, switch-gpio and dr_mode properties.
2. patch 2: remove all logic related to the bindings change.
3. remove the syscon header file.

Changed from v2:
1. add item description for switch gpios.

Changed from v1:
1. remove dr_mode property and use default mode instead.
2. improve the description of `vbus_det-gpios` and `sophgo,switch-gpios`

Inochi Amaoto (2):
  dt-bindings: phy: Add Sophgo CV1800 USB phy
  phy: sophgo: Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X

 .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml |  54 +++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/sophgo/Kconfig                    |  19 ++
 drivers/phy/sophgo/Makefile                   |   2 +
 drivers/phy/sophgo/phy-cv1800-usb2.c          | 222 ++++++++++++++++++
 6 files changed, 299 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
 create mode 100644 drivers/phy/sophgo/Kconfig
 create mode 100644 drivers/phy/sophgo/Makefile
 create mode 100644 drivers/phy/sophgo/phy-cv1800-usb2.c

--
2.49.0

