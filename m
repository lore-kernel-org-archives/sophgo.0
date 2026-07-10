Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C103DC4DE
	for <sophgo@lists.linux.dev>; Fri, 10 Jul 2026 07:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670369; cv=none; b=G3noLvyO0jkB/fpqAD03H7OcrYEL+++FheYkV8WCCmSAXbUkJnCHw6Dlj5iNJz2zmpPAh5JgDAhyX94hJdjlaJ/6TQ3PdXk0RydWdRsuNfgancS8OlqQHsHN/1ZXydtKIO7V5aHa/VDLplIS407ej5aoIW1gQwwiF8gUF2ttBEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670369; c=relaxed/simple;
	bh=aOfRpLqaJPAJe/Il7ITGiReMsqW93goifJWQbOYSJng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qxRdYG5ZrFjSVV+pUJzf8x7ElpAuiwWILarXnopI9r6KfhyudrmYbcDAIJ9q+xEHUN1bY5+Gv0Abtc8QusRWiMeDM1BjtkGleBOIkRNIilgb+itbmTkkAfjPSnpdPG6cVof6/KgBCleQJlSbfMdKPiR9CnD69sgOPmB6W/XJcpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYg/DDgu; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYg/DDgu"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cac39b729dso1544415ad.3
        for <sophgo@lists.linux.dev>; Fri, 10 Jul 2026 00:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783670368; x=1784275168; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1LGhozyiYsWCt50HZ2wp+cS9ho+JbwJYDGpb0yWaMYc=;
        b=LYg/DDgufyj3mqN77WC3+xGsh3ub1zJ8LfHDmT47lnh5XhUIiTIDMrHatD0aUAiZ4m
         HbEL7FPowMhOTcR9Q9XpHP88sG+MwERMqEF/W/1u2rIv/xvEpm9L+6T7sFRL7q6iB5pn
         vUmkF/WbFEmuuPl6pxxBbesnA3wWGZq3R+lMkHRreD6KnIOglEwVX1V4RVMOhFSK5coZ
         tevQN9l7hmCEcwmkOdVJnc5eylO3VnGxsNqbVq9WKLL72XdOtf9j5GihpttXntz1Lpaw
         N3EgFgSi+0x99V2GmfHbSzH85MSDcXcKLlEqexDOeWC542F7zQnlYb1ZD9O3EzcrlUzs
         OFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670368; x=1784275168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1LGhozyiYsWCt50HZ2wp+cS9ho+JbwJYDGpb0yWaMYc=;
        b=KUBh7zHqeWF4eTxSi8nSR03aL3zGZk/Hw1I5Jqu2jsAmtttmkUZ98NvUacAGCnUZzi
         48OFfTqdWe7g3YIIa5A2HbMZult5DXgL04dTq5Kp1kpDJ0BctkDdb1oW0g7g5ftdOeRV
         xC91uGJAe2h/aTc+x2yarTIqcEbjH4GcefIg/DTgLBBc6IsOzy7d/JPwTGj5S4FlUQTO
         QR0M1WikXJJnIl5mUVu9OFkaIeKPZg0UawXsc2DhPZzumPDuB1RMlv7wgos0sfOLTgWV
         N5U9bQ0Csyn4EprDEhObQQXfWEvM3xgbWseXKtSkMYDj+AdruadMBZFYKBLPRtfdca29
         CKzw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9MgFkYaMFnoPmQw1+sRa7Jjf0y1JYfvAK9lBe8fBj3sngFtR7hARIglYBHBwoc+jBaL9s3LU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwchM+PPQqz1+/GSowIuH85gBgrtQlKnZouUKcyaMpJkxYFv4zs
	OJOuaDWBQ+YQv3ukJYuDSCm4uIktuDmcWbrTVMcf4tlZtQu7oLSWksmB
X-Gm-Gg: AfdE7clsMAEUdg/wEqL4BO1z9qQDGhXuAUymV9VlANQPrurPveLwkmDqqC6bcS0+Ppk
	IN4n3DXuOM2nBw68YOSCH3jIr71MAGpCu/ysy58U6ZuGkzxE6w+A1nznP+8nuLC9DYhpGIFGQ6m
	F0bF+LnHVUWF4CtptJ70byigfKZEYLwWJB91TAPeLVQy3Ke9Cbn/ol6xRww5GZ9vKprneoqWRTB
	mgYJEmMThH9fQ1Tnfgr+jqJuFDm/LtJwNlAQDwA3Fm+wb46Rt+pXZUXQeNx/NLXmkNTgSevVNw1
	EUkUd5NNwJ/W4zW+Lz3iG1Q9lLPjweM5na4cvUfmqmb6L4z3J3FlS6NDqL67dYZNIZ03XcTlHNQ
	QafryhIaEQ6Spvep2QWYXEa9BhN4JapXVw47RoIZQxL/mf5HMnRlEhygDR1OMG1FX1250KxYz4f
	r/teyS2csI4mU46zs=
X-Received: by 2002:a05:6a20:12d2:b0:3bf:a543:e7da with SMTP id adf61e73a8af0-3c0bce50f42mr9139492637.3.1783670367797;
        Fri, 10 Jul 2026 00:59:27 -0700 (PDT)
Received: from chenyou.. ([140.116.78.205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm19044999eec.26.2026.07.10.00.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:59:27 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 0/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Fri, 10 Jul 2026 15:59:14 +0800
Message-ID: <20260710075917.159969-1-chenyou910331@gmail.com>
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

Changes since v2:
- Add the PWR_GPIO (porte) controller node to cv180x.dtsi as a new
  patch, instead of dropping the LED node (suggested by Inochi Amaoto)
- Restore the gpio-leds node for the onboard blue status LED
- Add my copyright to the new board dts
- Drop the unrelated Makefile trailing-newline change

Changes since v1:
- Removed the leds node because &porte was not supported in
  cv180x.dtsi (reworked in v3, see above)
- Retained the &usb node because it is already defined in cv180x.dtsi
- Cleaned up the trailing blank line in the Makefile

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


base-commit: acb7500801e98639f6d8c2d796ed9f64cba83d3a
-- 
2.43.0

