Received: from esa4.hc555-34.eu.iphmx.com (esa4.hc555-34.eu.iphmx.com [207.54.77.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8FF24DD1F
	for <sophgo@lists.linux.dev>; Thu, 12 Jun 2025 14:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.77.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739167; cv=none; b=jPA4GzFFVGuWuWlCCwhbOEdDQhdDHEOUcZcGCX2Qg/pfWqK5kpIhtAV4RFBDFZeMEZ6jGC9zt+fC8lhbXAjwD5P9Xay2B8BpPLZ6PlA3zufqoE0n/gebcyY/VrGNvoyW36if1n7QHt9/hWfe85+kZIjiGPTB/UJYMUH0FqdnZxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739167; c=relaxed/simple;
	bh=rJw+iZgSceFPmWQsrS+uwRkcpeIPXD4DqfxkrrwqqmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p3WPe8L40BlAvUt52piEosNh2vdzG2ZlukYDgZKfCXWiltDr0j2TMXUkgaue5egHqqxSlQsTVMsWcZgbsmjy1AJJuwdsOqwIDxeW8WCGNwRxFObmgKlnffAp8MnyvXFK1gcSFg5VerlBvhq3pcYwj5oA5DLSFwskqJbWXs0hdqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=lX7ajbzJ reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="lX7ajbzJ"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749739163; x=1781275163;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rJw+iZgSceFPmWQsrS+uwRkcpeIPXD4DqfxkrrwqqmQ=;
  b=lX7ajbzJAz0Oe+GoQkuD/73LD+TxhWdJreV+p4nnQfeKMPL7G3UCoUf3
   KNDodG7cMPSLrxBZLfk1LFIZSP3tBjkVBSb7u0JkVU2jQvRJm2ZgoXhLB
   jtGGEBfRijhdsTPoSp9xKmWcfDhdCoPQQLcoERHA4q5M/gmlZReiFMZb9
   IWW1oe4SsbKq22KKD7ug+7d4WymYOI5+bkVw7OLmd9u7bFx8/0qeq77HB
   pTTLNyZ4bQvvSFtO38HzWu+O9pyNB+WSj2eCr/UL0OQ+YoN/Gi7gyO1cM
   15SUylikaBm6WZ6zFULoy9NES7FLgwfjr76XjZvA6SxRNLuz4PCxWlJTj
   w==;
X-CSE-ConnectionGUID: kaw0obreTG6pIMrqQh4+Dw==
X-CSE-MsgGUID: wPBrsVp0R0icNVn7tKGFIQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 17:39:15 +0300
X-CSE-ConnectionGUID: ky4FU3/vQr6CUKG7QLpYDw==
X-CSE-MsgGUID: 3aQdNsO6QBmvDScTYdB+GQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces04_data.me-crop.lan with SMTP; 12 Jun 2025 17:39:13 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 12 Jun 2025 17:39:13 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v3 0/7] MIPS P8700 variant of the ACLINT IPI controller
Date: Thu, 12 Jun 2025 17:39:04 +0300
Message-ID: <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

RISC-V draft specification for the ACLINT IPI controller describes
an "SSWI" device that allows to send IPI by writing register from the
S-mode (Linux kernel), as opposed to the "MSWI" device that does the
same from the M-mode. Sending IPI through the M-mode requires extra
SBI call, SSWI is much faster.

Support for the SSWI exists for the Thead board, it is almost as by
specification save for reading one custom CSR.

Soon to be released Mobileye SoC based on the MIPS P8700 RISC-V CPU has
variant of the ACLINT SSWI device that follows the spec exactly.

To support P8700, refactor Thead implementation, factoring out
generic code that complies with the draft spec, and provide
Thead and MIPS specific variants.

In addition, MIPS P8700 uses non contiguous hart indexes, and thus
requires "riscv,hart-indexes" property.

Patches 1 and 2 refactor "hart index" support, replacing
APLIC specific implementation with generic helper

Patch 3 adds dt-bindings

Patch 4 refactors Thead-specific SSWI, adding MIPS variant

Patch 5 adds "riscv,hart-indexes" support

Patches 6 and 7 do some minor improvements for the SSWI

Changed from v1:
1. RISC-V spec for the ACLINT is in a draft state, then can't
use "riscv," prefix. Restcucture commits to add MIPS specific
ACLINT-SSWI variant instead.

Changed from v2:
1. fix path prefix as in
https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject
2. Optimize CONFIG to keep single ACLINT_SSWI supporting all
variants
3. Rename T-HEAD specific CPU hotplug state

Vladimir Kondratiev (7):
  riscv: helper to parse hart index
  irqchip/riscv-aplic: use riscv_get_hart_index()
  dt-bindings: interrupt-controller: add MIPS P8700 aclint-sswi
  irqchip: MIPS P800 variant of aclint-sswi
  irqchip/aslint-sswi: resolve hart index
  irqchip/aclint-sswi: reduce data scope
  irqchip/aclint-sswi: remove extra includes

 .../thead,c900-aclint-sswi.yaml               |  64 ++++++++--
 arch/riscv/include/asm/irq.h                  |   2 +
 arch/riscv/kernel/irq.c                       |  34 ++++++
 drivers/irqchip/Kconfig                       |  15 ++-
 drivers/irqchip/Makefile                      |   2 +-
 ...d-c900-aclint-sswi.c => irq-aclint-sswi.c} | 114 ++++++++++++------
 drivers/irqchip/irq-riscv-aplic-direct.c      |  16 +--
 include/linux/cpuhotplug.h                    |   2 +-
 8 files changed, 179 insertions(+), 70 deletions(-)
 rename drivers/irqchip/{irq-thead-c900-aclint-sswi.c => irq-aclint-sswi.c} (63%)


base-commit: 2c4a1f3fe03edab80db66688360685031802160a
-- 
2.43.0

