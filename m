Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE5F418A48
	for <sophgo@lists.linux.dev>; Tue, 21 Jul 2026 23:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784676907; cv=none; b=OnhNfp7KWxpL/zhP5anP0G4p3d0vrBY80vlBkmUxYlOPRk+zKeP/0eaJEyzTF1YVyMAE7GVhmjbetNy1Egcnt1puKoBDEotAL3KB4oHQGOc6se8HzPyPVstFg1JchD+JAamFdGKP0fn2zbvN6JUBA7OfWbubAY8ex91Gy8mVrRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784676907; c=relaxed/simple;
	bh=ha28AegvUEWHPsWYRgUtYFMp/UMSXSRJ5XZ23jkF38I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GxmgSwazFOObuxZozKs0xT1fiT6MdcXepXPc9bmnAcahdnqP6oShqT+qpHXOZ3EiaNCnZrbmhrYzlTjCACtIQNm12LNt03ZV11mkgR2UtX/55kEmhKHT8+jShNPTc1K97ubWgxz68zjZssuNRAvkcFMBabs0tV1PSq8vbgA0fI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVuJt7Ci; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVuJt7Ci"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ceeee8c46bso22322535ad.2
        for <sophgo@lists.linux.dev>; Tue, 21 Jul 2026 16:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784676906; x=1785281706; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=44FYsvelFg/ZZt8P6qAAoFOauHqEtOhIhSjgQ14AYP4=;
        b=JVuJt7CiTTwl8oHWh8Sp8HBuYOluhdLgESA7TBVev7NSBN5muWhJVsKFt2kQDTKdml
         Kk5FDHw6pu7N8wzehBGaQZYVWGwt9fwsuf39+XL865CF2VTUttxK5dmTStx0Iyg+2o7e
         uH7720YOOQbfPLO5YXqBrMh7gCOsYedQP9DfHyEKt+8IRyq+IXRmYXaafk9w8+rGxwUC
         ODyVggpdawqqI2yXYBFViBZWEP9FMaIfYk7QQiI0Bd3vpOoOiqeOpDFaIh6t5pTpMriD
         gHOv1flSvTqRIWHttmEF3RnL0nq955TjdOBgpZX/dOGWcbDJB2af92T04lXRONzWfo3A
         C0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676906; x=1785281706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=44FYsvelFg/ZZt8P6qAAoFOauHqEtOhIhSjgQ14AYP4=;
        b=l2E0/UoaV/4ITwnsrWDV97YxUX7z9OkndXqRhrSHFloSyaOIudmI82L7u1dUUa5NQs
         rc/CHD0fpa6FW2gYx7gtERVsy+kcHSduCXFdQt6npthyASqsVf/iIeJOu3MNW10miCm2
         hqoxtWmtkQuztUUpBwX2WaSQMPFS4/zLJDr3D5Kx92L25T78Ou9P2x5VANDX6CKdlXqG
         eVBV6OgfW5iuxrg0ZF+tuoqLoUNpwp3zsEXh14LEHikpOo1ucgGqtaMEN5ZKvZbypoIC
         /OW19NDB32ioTZoeRoWDRPfpGyNYeDSJc6jhqaU6ReRZ37R4oQ4/ipJIgxeTqSGnRlhL
         2FnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpE4GKUPQGgnf5KDKYIHEYyQAKfXLbKup5fUbEtfvbBz9d29dRQ/Exx2ZfUKIlO5YGLZ6k04GU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuyBgjBLCXK8a+A9SXosA5yo5QXhfvGeArlRdEBtIPodmRI80b
	q9/LoYWldCMlXpJbqXq1HSXpN+fD7DQvxlYhMPa7ZHWAHj8I7VxqeTq8
X-Gm-Gg: AR+sD106/1vC6fLuIHgKViigeuSsERBbU06be37KMnzk9QiQz8jPtSu1aLXA+KYzR4H
	kyN+NJC98V5Ja8P5Ci16BChxOv1pqlSEKfp9tQFNU/K1oKciRFFnEJv+hNoB2+ktfu1UTrkhouR
	QZJaiVFfovJHyldyemOI9oHAENLmtGwMs6HW6BNrDJ+LKdC6yn52Po/oxBHFihiBWfVHPoDOuOp
	UHK329pxsnIGVuibvEp3w0BO22YX8ygzPNuU8j9ZXfC+DXaO5YmZBnK3Y4fbYi7VFultiMp1elP
	cDbuZokfTlv8mMuoJ/kK8Vq6+Xenku4S7/FizsrCSAuGC7rsSzgZpecVwTw75GuXxgVqbPH8WkO
	3QPJgS9LqG4+ginpkYHDc/YRKoQhX5LnqvCojv10etEGPI0wc+AWGvCQrp/9Pn3DDE2oHmO2iJj
	DNowO6A6KrKuzlzIvPzfUGTb3SPs6RlE3UKzvKfj1TSCKbOuZYzkpb3eq2Drr5jcv/piORE16yY
	fCpSRdbhO++0UKv+YEpz/8bDR60B7QMiIGS6Xnu
X-Received: by 2002:a05:6a21:9217:b0:3c3:8d53:373d with SMTP id adf61e73a8af0-3c40f9efaa2mr4810951637.3.1784676905564;
        Tue, 21 Jul 2026 16:35:05 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ebfcesm245353a12.11.2026.07.21.16.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:35:04 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: chen.wang@linux.dev,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS:Keyword:sophgo)
Subject: [PATCH v4 0/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Wed, 22 Jul 2026 07:34:41 +0800
Message-ID: <20260721233452.112204-1-chenyou910331@gmail.com>
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


base-commit: 980ab36ae5972c83f683b939e50c469c4947229e
-- 
2.43.0

