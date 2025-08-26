Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C93C26A087
	for <sophgo@lists.linux.dev>; Tue, 26 Aug 2025 01:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756170566; cv=none; b=UYiIw/YY9UalZKvfv/dqZF5QeXCEX9LPw2he3vhbadUIqvhUpuqda+Vf2QwiJPrU6AUX2y4RPTabBQm8WrG/6XWo2XmEyhy87EAeX5vwXQTRLpdfDH/ydf4BaU1+mn3aQcOs1XvrR8TQ8qMdl18jNGjNd++wyFcv4ChIc2gAXJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756170566; c=relaxed/simple;
	bh=9O3lc/9bQ64hPLns61H0Mu3QkW7B+M2abebASMpzows=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=FJ2d+WxcYVX3KHiXYcIh2EoA8iaI0IPNX7DaHMpsvSsnMGgBk6AEfxKUX7McO8d5B8el95+HFKefINKU4VhRCmMgEBkinW8kEf/mavAZMERjXdAO5PY6GcJCC/HmeiyfCTH9Vc9aRS7O6wCB88UMN1hwRY4QTsy18zNDD8FcZWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NstwrgaQ; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NstwrgaQ"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-61bc52fd7a4so3503489eaf.0
        for <sophgo@lists.linux.dev>; Mon, 25 Aug 2025 18:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756170564; x=1756775364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jNepx41UElk7QS0w0sFASE9HqsxLVcmPU4Fw7Uj0xgA=;
        b=NstwrgaQF+D7zr/hXQ4GZWLts26cH6jiGpQoL3AIq8xlXe/s9kvVVH9uk3paE6OJKq
         9ukMGI5YzJNeBaURfCc9Yaa+c5uKFjho7k4jBWO0u3tx7wK/OGykvF1RXKSy+L8rGFI+
         ARVPY/w40b3Ka49YxpZB9IM2F0zBQq41tbIwDDwDG8Fdn1QWAfVBs0vhkhkm+FBNl5WY
         +QMd3DVQYfhvziJBTBVlSBBZo/9SLxO+uyHBQOZWEFUR6ohcZRII1yIQxqIfvcJrsaqh
         D7XzM/bN1yknEC3PETrrFgUHvVxWvfZn9LfmJOfLrdax20KJSsAd1tW3T5xEH/ZIfsru
         RLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756170564; x=1756775364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jNepx41UElk7QS0w0sFASE9HqsxLVcmPU4Fw7Uj0xgA=;
        b=KRq5ftm2FLMnK9vhJTjtQHKwwW/e13YwE6zK5UtJ1LiLxlIrYo3FyixaSLBzvcSBtL
         2XRZg+mfb8CYUJY7732txzffYiM+8lupW4FUGxTMGwwbjqgEsFzt3v/NF2ZEAMsfHvjo
         vrkW8kr/M3Y6YzuC5UzvMWjan7e+G79En+Y/K+fvXgmtOFntk2hVevUqKMZbnPdy39ac
         FZjSevWJgZrxB8PH3QTPIwFGuiwCEIVk1LENCf1DHujGyCt9qnEFZI726lgskZzSJYjK
         3nFEPqi4l/JMN5spV0cgYA7FeDLwszRLQXsfTNw59VpkQzCgxhf4fcoM9tQzJC5ffxce
         l1sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvhwf520Hnfdj+WfYcFcuJVtrfY5si7qDI+KzIbF82Rfyc3w0l5nTkkQmbw5L2kGlZy04w6hQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxT3nwCl/2ETncF3+3OtPoemtuAErAEXUmS6Ept86yR1ELziPs
	TWdP4jBsdW4OUJsgxTsKQ2MIiDa/x/+F110KiNbX0unfZtLhO6LfwIbp
X-Gm-Gg: ASbGncuSHo5t5KNB1hXD3RDEBS6iZxJXzpr/5xik5o1tpDE/mg9QFzzr+5JJm30yEZn
	CDN3tRAdatH+fe8+70lb2QseNJPfGfXN1c8vmK27mzrN3uuRHlRQK8YMJ4bwgX3jBqa34nZPYVX
	E7b0dEELzxLF3ZEnMuABfx9xA1px4k4jRRdUXUEnklXo72hlbpDDDjO2dbXlVtQaiDOPJhJ26e0
	KVxK5Kg+3zAeVXhOISaZhQgHazm2wJzh5bv9+FBwcSopwPydetWTqeIlx776YHDN+9FwPPk8V+I
	/GYqEKBNAsSNYiB2YDYExXU04a6AyXD7OG3b95yAeugVbvgXkhVWUOl4tuRX4Nm+p6FBymxgOSX
	dSIQ9vLDMlTvxjnb0P2iAqlmRttiLQ2K/
X-Google-Smtp-Source: AGHT+IGBtMv/0WW6P6N98C1dIhOAFBvRCQyuAP3X162OIex4ax2CK73yYgTB3SfjwxO4OMw9LImXvw==
X-Received: by 2002:a05:6871:3a11:b0:315:3dd7:91be with SMTP id 586e51a60fabf-315439e84c7mr937923fac.16.1756170564040;
        Mon, 25 Aug 2025 18:09:24 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-314f7ca7ee6sm2168480fac.19.2025.08.25.18.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 18:09:22 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH v2 0/3] irqchip/sg2042-msi: Set irq type according to DT configuration
Date: Tue, 26 Aug 2025 09:09:13 +0800
Message-Id: <cover.1756169460.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

The original MSI interrupt type was hard-coded, which was not a good idea.
Now it is changed to read the device tree configuration and then set the
interrupt type.

This patchset is based on irq/drivers branch of tip.

---

Changes in v2:
  The patch series is based on irq/drivers branch of tip.

  Reverted the change to obtain params of "msi-ranges"; it's better not to
  assume the value of "#interrupt-cells" is 2, even though it's known to be
  the case. Thanks to Inochi for the comments.

Changes in v1:
  The patch series is based on irq/drivers branch of tip. You can simply review
  or test the patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/cover.1756103516.git.unicorn_wang@outlook.com/ [1]
---

Chen Wang (3):
  irqchip/sg2042-msi: Set irq type according to DT configuration
  riscv: sophgo: dts: sg2042: change msi irq type to
    IRQ_TYPE_EDGE_RISING
  riscv: sophgo: dts: sg2044: change msi irq type to
    IRQ_TYPE_EDGE_RISING

 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 2 +-
 drivers/irqchip/irq-sg2042-msi.c       | 7 +++++--
 3 files changed, 7 insertions(+), 4 deletions(-)


base-commit: 8ff1c16c753e293c3ba20583cb64f81ea7b9a451
-- 
2.34.1

