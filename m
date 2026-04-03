Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBDF3750A7
	for <sophgo@lists.linux.dev>; Fri,  3 Apr 2026 11:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214964; cv=none; b=oKVLNKzatzZofCqiKAMV5rLZafXoCPVdE4XikrUyGvr+sdoOhvApLEvgyIItLgcN9vNsYyQYXkxGMrHyi84c6d6Fo+JGJUIy/xN2t4vwuohBSxwfF1THCz5FgNnpv2a+OdzdH/BcTuqZXLtiHtnYR7Nn7ykYFU6lt+9a8zqnIDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214964; c=relaxed/simple;
	bh=VJhjDbD9k93v4xWoMfUMeJOvaM+SAKtvPHI+Ks7kzIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYQG9st58eYzKmF+lk5QZLph5JZRefS8J7LYS05kKeumzi6xeKPVPSpl191yVYWciK0Igtw/Uqu8xotBk7ek660fyNsBN9kgFsLp/zJtCSw0YxzvEFqhTRFKMlaGGOnE3m+esOHsYD095/SNjyk/FanJfsHjyYzaeGG7NEvwGIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n+ATC9QK; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+ATC9QK"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50d2945e6adso29785131cf.3
        for <sophgo@lists.linux.dev>; Fri, 03 Apr 2026 04:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214962; x=1775819762; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1iXfEJhkoJc89mTL/JJu7oRdlYA/T+hX/oQJz+ARaI=;
        b=n+ATC9QKavyc5cn/W2fto74Ei2F9LF2eyqBD/ssCNs7AizSmaqk05J+2ozZLFtJ5TL
         f5fD2kTMPk+CcWOEV7KnC9WfJ3l2r87xadfKzugQ+jHUV2LjP9dhPcbdfEdn75dY88RK
         Ytoy2nBw4Emfbb9ZETSY2yIZRPTSVMeAIm6lNyLUyzBS6M5ehivovH5u7YehKT5ltGcT
         iB/p2LFG56tJ/pHY4lJBegGEJCxIzVhvRGaBkq7YofDNQtSkYxzyR/LjS8pmg4+lNFKU
         2dnMIxTAzfg0bBk4FI0e0ts2P/MNfio8It3ngGNgYbbx9iaU36Dm/O42nwXjrOxwOsY9
         YNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214962; x=1775819762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e1iXfEJhkoJc89mTL/JJu7oRdlYA/T+hX/oQJz+ARaI=;
        b=s57hqO38JD9lUsIqvIAtEMoQzdOGIEPkziune3IXsTbeg9wznKTgxGoYKdBgJOk+QR
         3+6skcrYbMcQN5RfTKRgtkiweiSfW81Q7eX2X/Q5kdU+aNLNS1lr1YTxfhyCpbAPUJke
         jIGkjYoxFST39pWBx4KUoRziP0Tlvl4g4aep77bYbdQEALyBhF9hUbwSYNV47YrpGiqz
         xTtUSIu6E2tX9VIt3hUK0Y0LOmxm21Rvv4VXeKDleIEUg6E0ewiT7Osi6+9sBixKyBc7
         xH4zyJe3+wX/Q6DfZZO3YWIngFKt6nsHIylr+XxPVcwedNGv/TRsJ5qb0zf+bhEjgBfA
         3bLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdEpFOLNJE4nx63NhS2blVrcn6+N7PWaCxaYd1gNiPblNkts/XZsewzxlfgEXYpRwFcG2XzuI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVnwB/00AsB1eowsfjrBPJlGYuyzawoEgccAXkjoIQgSW3zy/r
	Ar+JivPVx5SfAUzwePLT1mTPHeLMr+DuMkCY7yA3PtGo5QkQPI2XoU41
X-Gm-Gg: ATEYQzyEDj8ZjeFGX8bRQkS7wKBElU/pACNaLbxgkfKI+OKJHBX30kaSPRges6va14D
	7D4sMOCTbJzo6W2VOUwA0YVpv9id/uLEs1XaEBuwRlw4KitnPeOZ7JwQkpizd15MW7ide1lJ9PE
	tXrtNT3mt2nLEPvqposI6AuPm9Gl6NkiBjZP+9lTMM6Qxhv1cRntvUQ9wv3N87LPmnvp4TbOwJV
	6LqHLmZYg7mhPsOI8nPrgTUdzq4uWDLQilkQIl178ZXmHXgUjAijs7cmnLWCrkf/EH2/6jA9iAh
	eUs/fPSaqoi7Scx6vAGFCk17EKXiZHoSImDvdg8qo1uFTZRVwlP99qJC7qxugd5MG6/zqKq7bwn
	w17p+xGPctVfbOO7hySWfrU7DGE5CcqiSqOBqUZ7G8EmwEeed9KaoWZvQ4wW52DKFqNgOdDL84m
	ZSXfFJe5Aqn7LnwySyRmFKytrVUYGj
X-Received: by 2002:a05:622a:244a:b0:509:4342:9980 with SMTP id d75a77b69052e-50d62a3e46amr38156841cf.33.1775214961635;
        Fri, 03 Apr 2026 04:16:01 -0700 (PDT)
Received: from sleek.hsd1.nh.comcast.net ([2603:3005:1473:4000::71a3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974e8e8esm45319836d6.43.2026.04.03.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:16:01 -0700 (PDT)
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
Subject: [PATCH v5 2/5] arm64: dts: sophgo: add initial Milk-V Duo S board support
Date: Fri,  3 Apr 2026 07:15:13 -0400
Message-ID: <20260403111516.379795-3-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403111516.379795-1-josh.milas@gmail.com>
References: <20260403111516.379795-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds initial arm64 support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/arm64/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
index 94f52cd7d994b..68aace728223a 100644
--- a/arch/arm64/boot/dts/sophgo/Makefile
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 0000000000000..8632470f43ab0
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
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
+	dr_mode = "host";
+	status = "okay";
+};
+
-- 
2.53.0

