Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACD52620D5
	for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 23:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740613379; cv=none; b=raJy0IJeeaJ751q+00/zxfA8ro5wlvwLLwdgQPUKePe6oKq2tBhD4YC1wqbGA2tI8VbL8uzv4CZdRUGeBIj0vsV8J5J8ewQg8bi/GzsLj0KSW1NCqiBrJX8VM8TlZT3+JjP7KkW6eOjTycwApyx6dM4HBOlqZUMRKTc/NVxSgQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740613379; c=relaxed/simple;
	bh=zKs69zuJTCMuJZx3kqjoXzCIAA1mJhuLMYaLs5UHP2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q4Ly+ifgs0EwmrothfWByA5JjxioEd22yMgbQp4rBEyu3PCbJkHpMA5cOrhq/oLFsCFNlci0JLYhqSd8TTPIsofUXzAJZ9ByaNnaFrzNU5OMp6BukofOs2lK9E28IOz3ZaMmQt57bEcPLrIuKTG6jrkDbMwxN8Znq36nFkQsKuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPzHXTv6; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPzHXTv6"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c0848d475cso51617885a.2
        for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 15:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740613377; x=1741218177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YCkbkcOBVmYiyCJMExAY8OQtnZbeodmQmHyD6JqPePI=;
        b=VPzHXTv6+Gv1fThAb75BUgd4AHPhCz4OeE04KPARt4ZehHKz3DTOpJ0DLIGuj07FtW
         +X+SQnRL+QByjaOEwD9/HLRm4vSQHWx9cWBSdG9Jy8VQSZWLoofNuHFhyMw2ierLgroH
         CTDUB61gU6RDjg6U32XlcdfqsNiKExTOtNU8I3KUuMl5DX/4VfWey/Qu2QkB2vS+XisA
         yZrlACiZy6TW3EFdG1XTZ9bue7jJHH2nTE4TZ/V5MgR27BVAjJjmOn2Ao2sGqkeLK89V
         sK/HrZGKaXMB7NfMyqD06mAPUc26s5QNht9snNbO6lyxjaeYsVylMaSoc9Ph0UFJE8RY
         k7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740613377; x=1741218177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCkbkcOBVmYiyCJMExAY8OQtnZbeodmQmHyD6JqPePI=;
        b=fDW9YwlHXq+bE/x5oW1QHcGmlrsuQynDLZ4XgVTdkR1ermoMUIVrTiDneAxy925ZNP
         CEpx7ph3u+g4T8Q4sPZeIFlyoDmpRMHX+lSjdQC4zgYIReDE0Upn7dqhz4LP1ijTv4Pf
         hfz4HQB2sy74eb/aj9rpo1yXWIXgCtTIE+6/CyhQm1Ss5A2PbboQVGTTMVcdDPNKKfxz
         rRPFHxp2mkGcRb0c/rY351BqlO2WP9Iylw2HarVy2eW57Ao130ezLCikZr48PqgLqVK6
         rUppp3CpdybteGxw6vfuxez6oIgyFlYJpp4pZvebv2oMyMvfLvLJBRnVRJI9xKbugPAl
         AUZw==
X-Forwarded-Encrypted: i=1; AJvYcCWqK0pTo2Kkechk3CtYIrVCNUmC2wQmeCj2b6L9pcYk8IGjKN/J7J0oOcxcS78KecCQdEJoltA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0SpPHdy/GbFMPOk229yJb5h9B9Yn9zwYuborY/ddDzF27bYyI
	6pp5sNIo1FNE74bwjWWoEVqteQaap5JBWkqCXaFRXeVDBI3lBXhu
X-Gm-Gg: ASbGncsMq9OtiyexrVRK6HewCSsgVXKZvkGxg/eSxHpYW/hfS1P/0Xls0F+b/owYPYe
	HSkAelTpaIxgy/G2jd+nyrPD5Q2G5or3GskI/MLdOb2fdbKAjiNhaMCQPaOpu6bY0d2gjhEnqYh
	7sWLhkRNiFZY9t1ayDyo6hoHSabL8JoXzmhmfvMQRTBeurJiEAHBFR4k3ae9ovR+NINFAYdFQNO
	keI9VUOMBHPUVgmG9d7viLYvIp7vHeu9fq0c0PoztXhq4agVLI/K3upMPblIDG7vUmDjLg6sfn6
	jA==
X-Google-Smtp-Source: AGHT+IEE0yZnL/j3TfydHcx27TvYZq4HNVlRTjBaZb6s+lcBJ8etFGkpoweqrr6ivN/gIINJcC1idA==
X-Received: by 2002:a05:620a:2914:b0:7c0:a46d:fa92 with SMTP id af79cd13be357-7c23be11a85mr1282129485a.19.1740613377053;
        Wed, 26 Feb 2025 15:42:57 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c36ff0f1e0sm24115785a.52.2025.02.26.15.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:42:56 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Guo Ren <guoren@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/5] reset: introduce generic reset-simple controller
Date: Thu, 27 Feb 2025 07:42:28 +0800
Message-ID: <20250226234234.125305-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many SoC have a simple reset controller with toggling bit to perform
assert/deassert. It is annoyed to add device id to the reset-simple
driver for each device when coming a new SoC.

This patch series introduce a generic binding to collect devices
match the following requirement:
- There is a single, contiguous range of 32-bit registers.
- All bits in each register directly control a reset line.
   - There are no self-deasserting resets.
   - There are no timing requirements.
   - The bits are exclusively resets, nothing else.
- All bits behave the same, so all reset bits are either
  active-high or all are active-low.
- The bits can be read back, but the read status may
  be active-low independently from the writes.

If the device follows the requirement, it can set the compatiable
and reuse the provided "reset-simple" as base compatiable without
changing the reset-simple driver with unnecessary new device id.

Add a generic reset-simple controller, and migrate the Sophgo
SG2042 reset controller as an example.

Change from v1:
- https://lore.kernel.org/all/20250213020900.745551-1-inochiama@gmail.com/
1. fix title to mark it introduce new generic device for
   reset-simple driver
2. add "active-low" property support for the generic reset-simple
   device.
3. patch 1: update the binding description to illustrate the
   suitable scenarios to use this binding.

Inochi Amaoto (5):
  dt-bindings: reset: add generic bit reset controller
  reset: simple: Add active-low property support.
  reset: simple: add support generic reset-simple device
  dt-bindings: reset: simple: migrate sophgo sg2042 reset controller
  riscv: dts: sg2042: Adapt reset generator for new binding

 .../bindings/reset/reset-simple.yaml          | 66 +++++++++++++++++++
 .../bindings/reset/sophgo,sg2042-reset.yaml   | 35 ----------
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  3 +-
 drivers/reset/reset-simple.c                  |  7 ++
 4 files changed, 75 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/reset-simple.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml

--
2.48.1

