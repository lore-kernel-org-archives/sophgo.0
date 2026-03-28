Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B3B3A63F7
	for <sophgo@lists.linux.dev>; Sat, 28 Mar 2026 17:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774719473; cv=none; b=RWNE46x3WfvHhblafEE7848XTFFJmkNDCXAkNlnhCKq5X0DZHtHR6UKqnmiWbmFXFHm5moxRr5Sunidf1AuId6+x4Feczi5WOUg9uxgIEACStq/XbF1xkyg3zv8f4ou0WAi9gcuUp6CNcq6M3XHQdOb4kM2v+jK/PRrnefUBNNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774719473; c=relaxed/simple;
	bh=vrfhOM3+ysvF/Ll57Tf/JoWnf8bZUNDlRILzcG8aTAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1kjG5/q7EnovBColiBmfA1zmZzEphSa+U9AehsSC/QZ6jIdwZxs2zBSmEsYqbRAv5iZ+o9Jp+zoyt/jJJFZxuSTtwd7ETxxVeMOpRx+rXIEZOpZtW06VSAkYzBPYl8jG804pHB4c1MLDX2mxXZzA5hYPUDtYIR9TJSyCJXppQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHZoEGvB; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHZoEGvB"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50b69bf5638so35344161cf.1
        for <sophgo@lists.linux.dev>; Sat, 28 Mar 2026 10:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774719470; x=1775324270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8SWLbh0z3f3RIAwmimt4X3yZVlmYvxXaXaOJWp14ng=;
        b=LHZoEGvBppu3yO8dpHIyUkCLtLfEGphDjDjKWD8x1+SsssOmgwFU2Yn+wOdqi2Duzs
         kgyy2LpPl0NnkjH+I5GV4XUQMWnCpTOp5sFDohsNniaCC8w5GoM6/2S9zjtxDmVQHmfY
         ynpbNCBDuWUr+89tH5VyYy1XZA65gi8nAPFcEmVWv1iL+NEGuzb4yVb9v0OewAVf9e0U
         cO0yBAxEB0iVkOoUUg+BMgjQK3pnFu51F2ZaecKwflewf9IoT6jQ0RjxZJfYqlLZhH6P
         qnXa8oqZXaji31qSCttPDk3mpAHNMWETqoQ4EAoRFTTgQ8/DBp3uXR7AGfUIULLY1dlm
         gjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774719470; x=1775324270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/8SWLbh0z3f3RIAwmimt4X3yZVlmYvxXaXaOJWp14ng=;
        b=mDc61tz8bTTqckf7vWmUOot/nUoDBKddzobbVFHm0NdrjUriXDF3rPqaIHrnELxo2P
         dHtQCi7qVLC79wGUtLOSNE1AAWJfwiNFa6WzWon/RMqhdXpm38xXwoCA2zxU2AvxR9vj
         gjRsAIjX+25/zk45yT4S+rMoyKUJuawC9ZmYQAYkOqClNTJcej5GUWqIoYj1SvVXzt7h
         Y8AuBQ33bMPrtXnquFZCCcvIxHgthat7n+h1YtRK+NJys2dXIgcVyJNDn0/hFySRc4Ks
         qf4+dYD27Lnt8CYh2J4+05n7uySXdGYPD9ycIu//LMGNuTTTG9manpF7JeM3e9uqkErZ
         Xsxw==
X-Forwarded-Encrypted: i=1; AJvYcCXToKLQxgKtM6DzBjEahrOD4oUTuZd4rCeTytXkzXhnVsf+VW3soLB3lzdXKAftVPhsB8cBU/A=@lists.linux.dev
X-Gm-Message-State: AOJu0YzITTP1JK63UVC+VedYcnl3lvX5xUn04VUK6aHHO/syUU/7sASo
	e0yNlnVB2a2XzuiKKTszJ9dww7vspMfJhIz0FsQNJFf9it/FfBoLRVHT
X-Gm-Gg: ATEYQzxes5X9XoHKLQK/0RekK4c0yhFAEWv/y0I1XGlf+h59/veCTWhmOa2WewbW85B
	MH0+Uh3w35oa9UojkTgh7Wku+CjyDBj2JFEsiFY0C+gd352nzoEWvm5tf1VVzRcrbC89m0zJxcG
	HMAsF77v4V86wf1lhY7JeZsBUUSO8ttgXkZYe/8GE64LQ+GFoYMvlnDJcZrgg5VZPLE674XPSfQ
	VgL82U2v3SzyMPCbmP4wKfehFpEpA5anAKZWLvN31LdCTLs2MQgv17YVi50UAwxrHTFIEKMoAWu
	ywuL54b34LtI6ww3u6al3khPOsABr6R/WZ0H/UeY7UEttlOqKmUX9oGpJtKCQ3Hji1CZ5883hn4
	uBKZtDc67f+j8B1QFOgbGDG2RvZBY51lkN6Lbn0sTx3B/Vri5QU+CwFphVZlyqjiUPbf6k5LcIe
	dwiepr7zV+6ClFDz3Ses2V8rkBtZLRzRrKH1o/K73byTsv3ctyadwMl6B+WbUiInEl2rE=
X-Received: by 2002:a05:622a:1e1a:b0:50b:37d5:67a4 with SMTP id d75a77b69052e-50ba385b769mr93585621cf.27.1774719470058;
        Sat, 28 Mar 2026 10:37:50 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm26629641cf.7.2026.03.28.10.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:37:49 -0700 (PDT)
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
Subject: [PATCH v4 2/5] arm64: dts: sophgo: add initial Milk-V Duo S board support
Date: Sat, 28 Mar 2026 13:34:47 -0400
Message-ID: <20260328173450.219664-3-josh.milas@gmail.com>
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
index 0000000000000..4ae44b40f9edb
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
+       dr_mode = "host";
+       status = "okay";
+};
+
-- 
2.53.0

