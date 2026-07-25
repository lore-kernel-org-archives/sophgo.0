Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D90386455
	for <sophgo@lists.linux.dev>; Sat, 25 Jul 2026 17:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002043; cv=none; b=T+sYeY2mdmJkSn7mwUWkBHvVyL0QZspUGfEY6ihINzcnPbu0KuW8Zut/MvZR4Iu2P2RDJxA7tgqzgRAcVmwG8uhg9HMpE/HnDls4TUFT6nw6hZWv9Fwzp0uF+E3Q1KWB0cGZCYHBmr/nfmfvOPKBbBcOX0QFYvalkdPk9yIWqPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002043; c=relaxed/simple;
	bh=PgY5V9wkbclA+xJPj1VTGEdLzAUS075xKSE9DUA5oFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lweb6z0jiZt/Xv+oK3yGtV09q0JssIq04onXM9doleU0s3n6/9Oc+J3kJB8Q9jC8VNTRsGM1fRxdgGYH8XZfcqjToIhn9QX6Rq27ivVZwWc5JfBuwjd3d7hifJlJu8ZHOMWS39sj2JdEy6N3pJHs2UZH81HWlgzHjEycJ4j1fz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7j8k/ol; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7j8k/ol"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca957338f14so175467a12.1
        for <sophgo@lists.linux.dev>; Sat, 25 Jul 2026 10:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785002042; x=1785606842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=arLGFyNMfHQJBHgn81ki2JloWGKnqNII6+t2+DnkNZM=;
        b=B7j8k/olfKGN5l/OsBDI+qVTYnm41YEnRfVxIdKO+p2G5Rmp4skhT5sQV4VjE/W2HZ
         7OCm2oVJP+7h5fN9rsqbRLd4oNtPOwzirC+w1eI0TTEjRi3IGxqz4jxNc2S3F9NHU6df
         8WLJ+Kw0JHaoPKIurZfh7280eAbzUq6eUiqggH5L6JpX513W9il1EviyV1b48ElOQWu9
         KTXz3Yu+K91lpNrf7GGsj/PhzA3mn+DU3vVqCFr58Ps+syGxNTdLoMLRNqXB1EnZcYdY
         pkqagsOgekgyxaj9HGcoF4tj41SEkkby+Ht5fe+BDM/F46IGekLFvOBAFrgwHnWz1eoI
         uYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785002042; x=1785606842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=arLGFyNMfHQJBHgn81ki2JloWGKnqNII6+t2+DnkNZM=;
        b=V3g0ncvjtwLIU/vEQ9BZCzQp2cHGf0PRtLs4MJl+XkjHUR8w1+r2yB6vGGRGMZ/9Ko
         9dB62xwl25E6wK+hEwpyrnEaDUT9GNqTLUO9Kx5t5wg/5VUByWBRlKDe1k4fSiCm7HN8
         c8zlpbSZZIbsXRExa9m33W7JaIViYdsphkhUSwD3QYl/l+TDL9hwPWt+0zZwUYVnyUAm
         Yn0RdOz2UT9XQc2yDwEQGh5A4bvGsitztw6tke58rxSHopi1+dLtEoN0XRSiWLb3hH6Q
         6+w1icpElMthpCRv4mPi4QdruyjazeTlQi4DMUgVTJYlmHPOzFoLwM+V8DG//8joP2r5
         gJIw==
X-Forwarded-Encrypted: i=1; AHgh+RoSFPfdtg0l6DWc+J4zoIffJGcpaLI3AAN55mX4tgtdcMp74hw51wMqJNjzNui5bFAqWbCVN38=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuvA+gkOoFkkXE7kqH4n02PTNY8tuZ+KgYJOcUbnNWA/mPlK9i
	gLw/LlIFmc2dVf7DWgF1wjyEDhc+4rxligGYEumAzOTmB71D84ZXs8lK
X-Gm-Gg: AR+sD10AceUVHm5ElJi9KKg5m+D8NpR72b360602xks1VvktTL7mJdA+QudU4Gi9AXV
	6gVVa2Wb+4MbMzgHt/YPFn/cKGswk+NeKXjZ3NRSLFGkFjLzWd7ChSQoHJw+nuZAoXFrVjE/W2y
	AnjxbunAkegSax/Ljm64asa1fgkSc5grFZiH7N03rPDUmLCKYDTDLuyGpCnzcdu8kc3LJ1V7+Eb
	HpFi1jnkDu6YM1V7dCyFIieWnOrqxXBvYtfSy5HrHv2E0g//7HbBFI9/Y5e2d2duVMsQHgnGwlh
	ZPQAB0agsy5OwHBT6X3F8HFR9Khddipnw5J+W4vp7FLvgOXo1nOplqQJf3jV2eitVdvvgJXAMgV
	gSYYIrJYpEWF+eNnncBKbsCSxtPq48+YsmyhF34AHYSuCvp7jAUNYZ80+MIXIeLtv1ilCKtpUBT
	+ZlBEWZ4EUhPLOAVgfmVO4mQoORK8c9r0Oe1lB9atS84tktM9eFvrZpJbXlxMZrke9j8FWDzoqV
	VyHPVlQ6Q==
X-Received: by 2002:a17:90b:53c8:b0:381:2788:a437 with SMTP id 98e67ed59e1d1-38f293cfc02mr2206115a91.1.1785002041668;
        Sat, 25 Jul 2026 10:54:01 -0700 (PDT)
Received: from chenyou.hitronhub.home ([2407:4d00:cc10:114a:3b0:934a:d409:94fe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f031d1d6csm3005276a91.0.2026.07.25.10.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 10:54:01 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v5 0/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Sun, 26 Jul 2026 01:53:42 +0800
Message-ID: <20260725175346.139173-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Milk-V Duo 256M is a small form factor development board based on
the Sophgo SG2002 SoC.

This series adds the board binding, the PWR_GPIO controller node for
the CV180x/CV181x family, and the board device tree with support for
the UART console, SD/MMC, USB host and the onboard blue status LED.

Tested on actual Milk-V Duo 256M hardware: verified boot to shell,
SD card rootfs mount, USB host (root hub detected) and the heartbeat
LED, both via the default heartbeat trigger and manual sysfs control.

A U-Boot series adding support for the same board [0] refers to this
series as the canonical device tree, and intends to switch to the
upstream kernel DT once this lands.

[0] https://lore.kernel.org/u-boot/20260710-add-milkv-duo256m-v1-0-0f761100361d@baylibre.com/

Changes since v4:
- Fix the coprocessor RTOS reserved region in the board dts. v4 carried
  over the address from the 64M Duo (0x83f40000/0xc0000), which sits at
  the top of 64MB and is wrong for this board. The vendor device tree
  passed by the bootloader declares memory as <0x80000000 0x0fe00000>,
  i.e. the firmware keeps the top 2MB of the 256MB DRAM for the RTOS, so
  the region is 0x8fe00000/0x200000. This matches cv1812h-huashan-pi,
  which has the same amount of DRAM. Verified on hardware:

    OF: reserved mem: 0x000000008fe00000..0x000000008fffffff (2048 KiB)
        nomap non-reusable region@8fe00000

  (Reported by sashiko-bot)

Changes since v3:
- Move the pwr_gpio node in cv180x.dtsi to follow unit-address ordering,
  placing it between usb@4340000 and rtc@5025000 (Inochi Amaoto)

Changes since v2:
- Add the PWR_GPIO (porte) controller node to cv180x.dtsi as a new
  patch, instead of dropping the LED node (Inochi Amaoto)
- Restore the gpio-leds node for the onboard blue status LED
- Add my copyright to the new board dts
- Drop the unrelated Makefile trailing-newline change

Changes since v1:
- Removed the leds node because &porte was not supported in cv180x.dtsi
  (reworked in v3)
- Retained the &usb node because it is already defined in cv180x.dtsi

Chen-Yu Yeh (3):
  dt-bindings: soc: sophgo: add Milk-V Duo 256M board
  riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
  riscv: dts: sophgo: Add Milk-V Duo 256M board support

 .../bindings/soc/sophgo/sophgo.yaml           |   4 +
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  18 +++
 .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 121 ++++++++++++++++++
 4 files changed, 144 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts

-- 
2.43.0

