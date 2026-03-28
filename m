Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA673A63FB
	for <sophgo@lists.linux.dev>; Sat, 28 Mar 2026 17:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774719480; cv=none; b=BMvlryskaARkwu8YbECNqVGfM3ZP6mzG3zzH1jw437EyGig3YSHfIyAoLh+LvFEh90rdNt3xb9b/mdLnhcLf3gaSkxbfDguNfIsi6+3+FM24jNsI9OW1wcV6ro/UxJB4VUTcg+Ap6WgSL7ksrGscLswt0ng/9ASofR5tN64slto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774719480; c=relaxed/simple;
	bh=iKIxZqfsu+EMIToJywvJpH4PHUmMH3CHONIBEcDeehU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Khda7HvG6WPX7TQ0Yvb3XVuFOydYI7YFRmS/U+ZjvFTbNrwXJdUuYDEOhgT3zlgqnUxp/Rt1396azGQMQXX/X3CCdMKJKcBBCGHqx4NEUKkylXmQKxUCANzrRdfJP0ibAeqIlLpjVulgheDS8Bn9/XNZP+0rBYniXSeu4wyeAio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FC1PG5HI; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FC1PG5HI"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50b35f3e489so40174211cf.0
        for <sophgo@lists.linux.dev>; Sat, 28 Mar 2026 10:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774719478; x=1775324278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agtwMzvvo2u0f9LDYXhcZeX3VFLC8FECckVchUC5F9Y=;
        b=FC1PG5HIbPz/+qlBp5AU4df/LhrQ3xjXg3+yTiMqMrOUrhqLZ+XE4PKG+4u9+s9atI
         JrIFpUY3lk9UK/QRCBwf0kfRsc03C+6GlvSiXSX5YDHNgZkspRbvnl53LOXZYSa9am4Q
         ++4itnxnSesul92cOcuv/BeFdTAfhFpetHKRbZbA+2t+gwud7iL6bNKQcuabYLmlmvQv
         nBFYHSWNFNEYxLaKzjWD9FTJflxmEjxyB4i74SPeR87+ixGOIWvGsNF6624gq9VE13ho
         iMtBIgcLM6ZejOTu2JmII5ZbsQMbonBEfnoI5HDzUwKMvSdKYuj3rdXN43qQATssRcG4
         FZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774719478; x=1775324278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=agtwMzvvo2u0f9LDYXhcZeX3VFLC8FECckVchUC5F9Y=;
        b=NLLkoH7qRZ5AMlMAjR2MFZydoDCovm7kG3FCFazYHw3IyXYx/EsxQaZw4MlQOVR/t/
         5jea37EHNL3Nw+ArgHiueE8c0jjNMeised7m8nZHD7KvO7XV5WBrYWrvt8ZVQZy//e3D
         hvbHNFWr2k3v9O7wK13rmyzr+v+kcjCI4/6qZnUQE+3iV+U8vErInX/HU9p+8tM0zqLo
         JwiuOjfd3P9SfZksDx/u/Q6kXCFt5JnR9GHO/sZT7QBbvG3JEk4rOcyas8Q7855n8vmd
         zRqsxZcWxHaRYVwhf6O3/MkKPalfjOko42jGbR5qqxfNJ3jnrHOIjGVQlvK/KWlAjM3R
         92/A==
X-Forwarded-Encrypted: i=1; AJvYcCUV089BFhGb2o3eWm3GGkTszkb4wy3rRNVkmo+ETSv50teI+QHq2AgWEwvEW0kSYF9VF7Derlk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0192QD6H5/oQGL55BP5aOjEHUEkDbrAcO5b5B4AEdoPMNrC6I
	fEBSnpUZOsQYnxl/tQMwy9bk96ezx984dyMHqDMKTOHADShJk/k6ac4L
X-Gm-Gg: ATEYQzz9nM5S80RGhf6+rhrKkvrEtPWxMxnFPMJOVk8+A8PKOg7xwhllWZG6oHxZ2NV
	xHStScO08kI33ODDJ4bhajXTDX8hWBnJGCUp29Q8Xe7zfXTwA6s6RpTqve86/+9TJM5xHvoE309
	MQUIhh5bkGgEQVTPdOX9NLp2S8w1vRSHATz+7d86HDSQZZbLg7zUkPz+pWNcsQWIZaTvzw+XHO8
	SX5GEj/CCuwIhRQxLWf3VrdxakOdd+mbaX7RZQg7Z87bsaxSD/Ss4PQU81m7lBKLJuyzBc9zbDe
	vPAkv9w9Fm+m9uxmQjlBWI2jSChLfcY+2W7Zv9hIUotEVk7Kk0RYgZOIXtVnrJJN+Poo0XTMO37
	UDOA8jW7XQzTbP+V/bqNOYk/pSPiO5YjFcFbaciu/c7WtYpnG8RcesN55T6cAupBnDVeU71sM9a
	HY5cyc8pXMQg7De97uIjvHxuuGiEqGWqoi4SP5tV4qgnUN3KcisgVTCe7H
X-Received: by 2002:ac8:5e06:0:b0:50b:292d:94e3 with SMTP id d75a77b69052e-50b995b5a1fmr123076451cf.42.1774719478554;
        Sat, 28 Mar 2026 10:37:58 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm26629641cf.7.2026.03.28.10.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:37:58 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v4 5/5] riscv64: dts: sophgo: add initial Milk-V Duo S board support
Date: Sat, 28 Mar 2026 13:34:50 -0400
Message-ID: <20260328173450.219664-6-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328173450.219664-1-josh.milas@gmail.com>
References: <20260328173450.219664-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds initial riscv support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193b..58cc6b70d8de4 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 0000000000000..4ae44b40f9edb
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo S";
+	compatible = "milkv,duo-s", "sophgo,sg2000";
+
+	aliases {
+		i2c4 = &i2c4;
+		mmc0 = &sdhci0;
+		serial0 = &uart0;
+		spi3 = &spi3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&dmac {
+	status = "okay";
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
+&saradc {
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	disable-wp;
+	status = "okay";
+};
+
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+	status = "okay";
+};
+
+&spi3 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb {
+       dr_mode = "host";
+       status = "okay";
+};
+
-- 
2.53.0

