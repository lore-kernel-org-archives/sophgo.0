Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8476B34B40F
	for <sophgo@lists.linux.dev>; Sat, 30 May 2026 17:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780162539; cv=none; b=KiCcDXL2jIniaXqgncojBM1E5ZeEMnITHNSLHyvP98HJy3GmovxuDXLsSfe7Tgn8A6N2gN35VLtvu2p6U+t97l/dn8ggJZyERb90KQt/EsR7e8dGJEQfk/ZwA5hK/Lyv8NGJvmfU19SIV2WPmDadVujeJuoKSk2OjXo9AlhlSg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780162539; c=relaxed/simple;
	bh=ifciZjFJsSlLqvMHHqbkFJuk8b7OaiYXAH2dMXVM6NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyEg1ioYF7JBPSOpVfcHSQ+vzUjPT1TuWTTipA5/C4Ov60/wB1445RAi/8h85vBmVbnJ4n2vrVYOIlxPuWlADM9NFWoEkGNFVPwQH3e6HaLF8VnOl+J+ImEDAVkSg9P6pllWCKHNwRUnssDBatW15TxZjBsjR663JjuuPDPjI1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=modURIpV; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="modURIpV"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9155126daaaso3441685a.3
        for <sophgo@lists.linux.dev>; Sat, 30 May 2026 10:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162535; x=1780767335; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tU9gWymIXZu8VRSy2GyhvjXHSpA4tanwIEBlc+6eVbQ=;
        b=modURIpVj1uVzkB0jDxiOwLpRhnWxm6f5VpVDznbRQNlhW1obW/BHiySNenl/V1RKS
         Q+5ArvubC4rU9xoPT3Sz8VDGa1SvNja5/PCY2IJQ0WUrTytk2R0/QAMcVJUVUNBLqQBA
         /kpAD0zTxf2MgR2bGzHl2tOi7CafxYOaVzyeceoL2qDfX6yFBQ1ZxdHYWqGQg4MnpHea
         eDbXrgfg7COBpEx3PBYt/XwSTA2Xj0phGjHSkOQhcjR64eu4vKSFXJBn3/7hmiByxC+g
         3GLhWno+f1HLnSY40cEkSgGzKyiaow1wfimNbLGgdwFJF0IdyYeKhMEwK6AqIXZMoXoz
         ESBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162535; x=1780767335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tU9gWymIXZu8VRSy2GyhvjXHSpA4tanwIEBlc+6eVbQ=;
        b=iPNWVh5PRi3D4sEma410ohddNjOhstrFiypuuDke/EEyrV75TPuvMTIgX7bvawcfST
         vTnabpNfQZ3HDqw7Rsai/H/DvgLquggWFLnBBtOU9sowC8uW6OGaWO5cTw4samqEPxvS
         KOK7AQc800TuERA8zP8y6fiifGjX6/hKE0dxgniVHBN02D3ZByEq6Fdfb7OR8UQJqpN6
         KAuKoZz6ORRo9z5ZWIbPjeoveFnXFKni8LR5as34UKbWB73XIHE2QXocQn2v4IcoyYcz
         gc+lsZaVJTbUqpEfBXVsdNB+iq3ZsEMGKTt9ZAwd4hWiWOvZw4x1X7pPJxHnUxV0lUhF
         5qfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/J6gnjqFchKh1sq0F2mPaz7VKKboFV71g9xhZNzAO7S+R5X5fdiDxfNovM399I58bdoEr4D7s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOAXU7sP34hjyNuaC3ntH8cI0DsIBM6Cqi6sT3IwLhqjVAcjo6
	FKTgleq55zcpgG4cqvsVRYVYz+2RaToNvnqvX0kccSMUioLTbP+X2AKQ
X-Gm-Gg: Acq92OELk5B7oSONDnRepbVnBUN1ojwVa5/fWdKwlKFT5Nlv8PbX3uzjAesNkYVOoTY
	ACeUBCweFhe0UX75j+bExIS1LF7Scw6q5iOKMzHYEJYDVfG7PNhxs1LfqyDBSMkv3185WIU6xx9
	Q41nOiOv03UU96otG0iNT9nOn8p42vGkRtpsocoEI7Wdg+UCo+FO61vrIuAyVlXWswARUyMp3HR
	vpdO1/XfRzntXgWap4Z6KMem3/wQFSZY0G2hobe9EBw8FzVkNGApBes3Gg0B7eb25p3oOcZpLJQ
	2md8APn4bcRXd486d5UvjtXft1UApOc3/mhLPhS2I2WwnDNc5JfU7KwDzO8S8s9swZkU9rF85Ke
	M3u/qqXYk702i6xSIM30xzt+2SQIUzEkSegdrs9DIR9hqKBeZ5FWQHRXY53UuBdZjTpyA7TezF9
	wAPWf1M5+pY1+YnN6CbZ7YOn4jqEUcJjz0TFPAhmXdpVImhLGJYHRoDW4BuvsBsMTCoALEmpP1Y
	KRHlw==
X-Received: by 2002:a05:620a:27d1:b0:914:e6cb:1e74 with SMTP id af79cd13be357-9153d99de4amr681017285a.19.1780162535602;
        Sat, 30 May 2026 10:35:35 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:35 -0700 (PDT)
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
Subject: [PATCH v5 RESEND 5/5] riscv64: dts: sophgo: add initial Milk-V Duo S board support
Date: Sat, 30 May 2026 13:33:47 -0400
Message-ID: <20260530173347.33533-6-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
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

