Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1163E1F5EA
	for <sophgo@lists.linux.dev>; Sat, 11 Oct 2025 01:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760147319; cv=none; b=ILVK6/ltjaGeQ8H2JU1zbqjfzg92WVoULalbQrSgZpPQqKuo+EF92joA7xmyNbZGA4l2Y5g0lyGC3RV+kjvAFUeMdJkCuWeKmAQF2R6ioZjbReVyDB4HEtRKozi79q76Y8qGx03BvAG1XqzdAxpIHdJNHfGMOhK6nP7ZGUx2LMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760147319; c=relaxed/simple;
	bh=e3eK14v974jiAnaQHTazc4ydB2CdZXKtN+1/6ZODI4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YsrwF+H+P18x7VVWu52oM3FcAaO5OLfDbKpuA73oAlqBuxJWmbA3eSZKILVqxICJrJX1/DHXJlD5duth5f1aXcwd4chHD3KcHEDX+iTtopSPn6RIi8oF+x6vLCosIVcqyuPTl3uNkhOlMnGG5WLfS1l1aTnSHUUSrGa01QzUKvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5vlyFrb; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5vlyFrb"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-79390b83c7dso25011796d6.1
        for <sophgo@lists.linux.dev>; Fri, 10 Oct 2025 18:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760147317; x=1760752117; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oejoysCyRvNZc8RubBVBc9+bEcKo+X21zvQu6th0wos=;
        b=m5vlyFrba/d0xQdkco2tOPUaVH5/Zcftk8kkx7m4xAXl8N5/nRzjn6WbOZ8hfi4I6D
         8QzBz8tPlcRwhxxvS3vjG6XNxM2szJVY6dyXNwMs4a8hKDE80alKIG0W/wElsg5iPMG7
         YcDRvNcAgNNYMfGBnm9tA35OUY9Odacr4bqHHGKMOgl2RB9OzL1tU+FiWOHUOpDbQdox
         IGDGLStWGXR+Xl804ud7iYP0VyE/5x+woxACo8Rr1sXf7wKrwaF7cjjZSjLxzTRlwtH3
         rczCvhKDhbtsSWj4ikKbgxzft3d00ika1uL1hes0aeGmzKrBRCmMXvqplcift0oEHRAt
         KCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760147317; x=1760752117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oejoysCyRvNZc8RubBVBc9+bEcKo+X21zvQu6th0wos=;
        b=F3JHawiA9pTZv/0DLlnaWU494gv6BQvZULNRsZPavuXGlTMC0Hs3t7zBHAQEveKFld
         D0LZCjt8wMRBodBosdMIBdn9aKkc2kAGWdugRS6xMEb/dLg9GZThkL42cytcn4Xr47P6
         lQKh9nEH8j+jY5sj1hJ2Rt1mRiLhWwCUpzNZe1CC6gWoVVZE/Xyl+2ly7U7L73StRwF9
         FGEO6M6OWFJ0ukNhz5DtBJ+DDYRUdMR5ja0/dBVYup3zMnshKGC46ocEMNV4Nde3mh8F
         mtBz3W608ztqQjdgnp0SCtXoZcosjgT0HyjNs5UyGypVN7AsdAYL9UiZRvnOFoIFn31e
         8waA==
X-Forwarded-Encrypted: i=1; AJvYcCXi9LLTF5A6lX7qgDu+XA4zdDyXDkXk+dd05wjM14wE2+G1KRSwbrjw6BmVCbrNgezFdNHl418=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2qM0+XVja+9NUpX9JFwQxnK6+8jH8o/S+efB70DJJEFxqVgyn
	/OTBb2MC4W94Rp77lGgeeZeNLFGQwtw+lFLdPSs8/uPgKRcYPmKMS35/
X-Gm-Gg: ASbGnctYfihJ1MToZy9GwMZAK6bNwEvUfrqsnFtvtN6gAyG2W0/z6q/Ev+qcbtjG1Hh
	wHR/sCcEu/ztWYYBqODWU7hx+ueLXBfafp5V9VGvBAgJ3DWaYQ7rfMqukMkGDd6TswDvM4K7ZO2
	mznLndSICfzUf8TD858J1aY96tSzVA0gw3EYlxKGz8Y6JxkJXtwmAZLJywa68bUrHz6TRFXmnLw
	WGhSuUUHbT7SfZEY4yKnUKPaoMnvMb54hPCsoyki6XrTO5Uh9Ty9Rmfp5CI9GlpSdCq1TIxJoMp
	zMH8ES59cWI2OKzE8ImIa5bGs4vFKcQTEmJzIO+qO1j+oQOR0G920l0Yo2y1hrYec/ZurNptDVS
	196+ySNFj59UtZHgSnLbmVSQ2JqEIWCx/ObjK2T5tdVT+hrMgmMb1sjf2Wl/FWiOaPwlWhK3mlz
	3kfY29C9sf0A==
X-Google-Smtp-Source: AGHT+IHiXqoUTtOihGm585f96hbBlUqNsgl2OSPoo3E8F3pjHpP/jA9kRegIoSfLchXG4S76xsmNEA==
X-Received: by 2002:a05:6214:2584:b0:7f4:e1a4:e2f with SMTP id 6a1803df08f44-87b2ef93367mr188420836d6.51.1760147316939;
        Fri, 10 Oct 2025 18:48:36 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc3574e71sm25978806d6.36.2025.10.10.18.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 18:48:36 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/3] arm64: dts: sophgo: add initial Milk-V Duo S board support
Date: Fri, 10 Oct 2025 21:48:10 -0400
Message-ID: <20251011014811.28521-3-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011014811.28521-1-josh.milas@gmail.com>
References: <20251011014811.28521-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds initial arm64 support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/arm64/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 110 ++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
index 94f52cd7d994..68aace728223 100644
--- a/arch/arm64/boot/dts/sophgo/Makefile
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 000000000000..e9afad6fd106
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo S";
+	compatible = "milkv,duo-s", "sophgo,sg2000";
+
+	aliases {
+		mmc0 = &sdhci0;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
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
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
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
+&spi0 {
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
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
-- 
2.51.0

