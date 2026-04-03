Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7F0386C2A
	for <sophgo@lists.linux.dev>; Fri,  3 Apr 2026 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214974; cv=none; b=iWxxUSADrkYT8sxBq41nUZQO4eCqN7hYscI4UOZ1b4rcZpm/B+UijzOGtVfkcoO7Aw2BjOL5J+k9X3zRVr8JO4tf/N1dg3EgoqwZFP0iYJvMZ4oD9Xjr7kXSFHh5b5MmW8e4Vna+03XY+dkri0zBM9XmYZwPWkOb2VrY5VC/DgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214974; c=relaxed/simple;
	bh=ifciZjFJsSlLqvMHHqbkFJuk8b7OaiYXAH2dMXVM6NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DSzs/FYPBb4ZRDddsHZlqDUyOuyald/keAR4sc2I+mrQSvh2+KmyjjWj60xlfm1MjkC9mcWya3uulTZTQ97Gh5tp1mQ4aaKTL9y29X4pj+dQDftndT+c2/z6A9TRnent6N9lPHmlGCN+pE0JRYYQS1HVuHea1beMjCafdvf6Pis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krFQiMmI; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krFQiMmI"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cfd44fa075so246782085a.0
        for <sophgo@lists.linux.dev>; Fri, 03 Apr 2026 04:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214966; x=1775819766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tU9gWymIXZu8VRSy2GyhvjXHSpA4tanwIEBlc+6eVbQ=;
        b=krFQiMmIT/jLJWEkw40UKMNYbeWKyqgm9zvpDS6zTYPRnH/AJYRmME4x2jJ2nqKeSi
         wNVTFWdm+1TFDLEZe62pDuybzT3jcOcpM5Ga4lX+mj76Ert0O+l9coLUHQyg5guJxNoe
         e8uvX4lsuttryHvFICG1GZK6OThnCvIf7kd2gNjXj+m24WRuA8YaqMry9ulcUabXAAKh
         Z6aOjO1GOFNLCciftE4EdAe1tl9lM1FWT6SL6ZloWfodRGWXTtlvO0Es597AEFKN6xGb
         aHNvtK2unRl+E+3bbgK4b5Jl0anaOgvrMEgmTtkRxTaLQQ6LPd8bKkUk49t6QztH0ixr
         hiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214966; x=1775819766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tU9gWymIXZu8VRSy2GyhvjXHSpA4tanwIEBlc+6eVbQ=;
        b=Kh61NlYwqOhfEIyvbqFXPFxKsA0YqlmxDP6GxZWEjAq8Q/m4aQM2QyUH8hlSQM9hOs
         5jziRcIULJOhnr9T9xO7WMYnOSihetYcBvvh8imBOyPLQ+ZKZDpfNRSG4g7BT4Zt9Rf1
         TLnzAcSCeHz/U0Uy6Eai+Rk0vAEPi+iewoSfcKXGnKfnbVta0n1vbiCx+EIgojR+aXkN
         pq39acobRLCRCciyjGUn4VAvAQmO7nbYUnKDoZC5/OYRes91qBS3cNA8XHCYktt8pUpC
         LiadyscdGxn0NBRLJs1Ox/wGM0sbPt54vwIsIIWebt4J+aYNGzAqrl1FXE/s9W5HK1Uy
         bsTA==
X-Forwarded-Encrypted: i=1; AJvYcCXBbgo3imvQxJhzFZDSiPEcEE0L81bpXe6Orq5tHDXo8QRN1B2FsAWNOZrjZa9/YAlecnajoCQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBCDlwZ9eiCyBoU6vN54hq+GzmbKYGP6FniyD2JRhO7cg09k5q
	aR0kfuMzOudT2kgKAk4OKY8s7oS+gZdH5Sp/nNQyz0SSjb4iF/v6O5f5
X-Gm-Gg: ATEYQzzoi7uKfo4Zx/HIklCUch4+bv2bsOtWJLU62bOS33sVALWnqQIko603UKuAZTX
	mTnuNZcnGfn1D2Rfz7di4pW+ZJRQWavqKvT1M/0hJl2+dL0DKiEHn3sQW7i2C+2u2lh2LmRm14b
	oQ46yDJaIgJLDXWTd2wAX9nFWbe3gFIg6Mqk+V2mV/Kiy7XReDvKaBCznuhIaKB/8VU3iYDs4oW
	74n0P+Zx4AmdlExDL6j5LrwNQQmQMylMLZ3jqpnGLc7KMM3WKhpOQp7i5587hMoNgO+UmwU4wbD
	3ynSe2Sx+h616pVs1sFBffq8jUTUMIfs/IFLgpwwp8eTCkUpEFZcvQhk6j/ghMqFk/LUEuc1JbL
	ZGZkXwYevablQr0oVU3NJEvopBjIQOUSKcaz3vBCrygppcVcXGLqMiloLRSqEulvdmMCUPtL+bH
	2HLTxTFSLIfF6iN91LiJd/Cd0CiERi
X-Received: by 2002:ac8:5785:0:b0:50b:4bfb:1653 with SMTP id d75a77b69052e-50d62cc15d3mr37333391cf.41.1775214966031;
        Fri, 03 Apr 2026 04:16:06 -0700 (PDT)
Received: from sleek.hsd1.nh.comcast.net ([2603:3005:1473:4000::71a3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974e8e8esm45319836d6.43.2026.04.03.04.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:16:05 -0700 (PDT)
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
Subject: [PATCH v5 5/5] riscv64: dts: sophgo: add initial Milk-V Duo S board support
Date: Fri,  3 Apr 2026 07:15:16 -0400
Message-ID: <20260403111516.379795-6-josh.milas@gmail.com>
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
index 0000000000000..8632470f43ab0
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
+	dr_mode = "host";
+	status = "okay";
+};
+
-- 
2.53.0

