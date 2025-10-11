Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5DC323E
	for <sophgo@lists.linux.dev>; Sat, 11 Oct 2025 01:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760147321; cv=none; b=HxEowObL9c8R5VDMoywh5wBxyOj2UmVhZ0aaaT7R+2A8DoTqIjtE+Vk0Pvp28MWFNagRoh7m+OhwV4yhiY/mzniiDWtaE++NHWijbkDK8AYiZk2/XdR4yixdgu5l9ToH8WrOsxE++B8gk812DS+OEndyyP0wzgQdWy6lRZK207w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760147321; c=relaxed/simple;
	bh=LnPNf0xfrIsyQ/vYDHJ9VebAUvNWmPNttCPTwfhjIhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tDukGmtSTL2X440nan/Ny0hoG6gZigUfZE7eVHUKMirsRcA2nfYMq49VG46fv6YdEhXOwVuPpXqn09vMLl///bDnokhVwmEW8tx11K40AV3dpZA+zvDZ3rMRsc4E+3JytdcoQqm12eO8Y50pPOasfBVCrcmGDbNJXPnOLR9/6G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOBHZJGy; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOBHZJGy"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-81fdd5d7b59so32106136d6.3
        for <sophgo@lists.linux.dev>; Fri, 10 Oct 2025 18:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760147318; x=1760752118; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIx1itjFNeOuO9y5R/ZOGp9p0NGiRIG2Jwe8FwimfPU=;
        b=FOBHZJGywgyDTi6YeTV+k9h710hpYN1lo9TgdMMnpKH+RBpo33hYas3etbP36NI2TL
         2DBYRJBzZcekFboNLZlFuy6EOddEGTh6XlbhrNwkxYGOLnUui9xYWvTtG+4R9qyoIWpX
         lw2iSUniPyEK9twPThmjRqyQabj6ye4Qr1DIQhko4Z/K3vq7E4RpZ2eH24Hs80UuJdhD
         NyMb3COA6l1frgv5WDvxmanmOLnVaxXa5ztwynrgAyGmlCEC88E5FNHZQQa3mD81cIQZ
         GRsF32pQywrnlP8glOumDfG0/4ehcD8DbpticzvBvUO2BxadqO8c3IxzJ30wdAdj+yug
         43qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760147318; x=1760752118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIx1itjFNeOuO9y5R/ZOGp9p0NGiRIG2Jwe8FwimfPU=;
        b=ngj4pPaNqCMzu98PFPnIniCHJ6T8USLUOfW5qYXjHFsIgvPF1f/AyhjvPgot9BccqD
         yTAy+93s7Jz8kYA78dfrZBENzpl77NbakAALGZ7ZUWcBKLiOQ2aKV3sfIiAgCbFbSOrp
         eJgCi0o6c3PdXIDbudgDmlG3eKsqGQMQYgayP0e8+g/v8qL8FED9ugEBvI/YeG6utkcM
         0DcHMfnpUXFv1WWz2IEcjVPzfjc5fQYxF63ShqQfbTL88v/KCKBXwpXJLI9ZY3L4RkV/
         7aJm7K5kpbDHW5wskdGtl8flCS5VUiaWjmsOLGVCXU1L+A+W+6K2HkdRvEmf5gNMezGM
         +F5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYunVMoNq4mhjtr/C9aeshyZ8yUk3TuqF+ERQpqI0gKyAbT8Zap3vbfmqERI5CtW1UiMAdXG0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDdG+Xkza6KlTZPLTRtzdPhY63MzTkCO27s4qjPN1vfW8xRL9M
	XMLrS7FGwtTdUvUTtihWVhV9YuTRPSS64O3lwUJnsjH7yOuWjxMd7QkE
X-Gm-Gg: ASbGnctV7uoCPa1/n8FSa9Vh3n0onjIUDmQXaXpX6hNibhXsxCYMeLG65ZpsAZKOVXh
	adhF5avNwLXlAIbi0jc+kzcYbiXgFGDVUncyfL4nwYlJ7XuJShtL+PWn/joGRBw3/4uOnBURZpG
	kP1FDIoMHIKZUjEg7oJwqIBFJpU2EywK6OeqjK+oKGhSENQZL2l9TlyjpDaca6dA5f2Q0Vy+1i7
	FOEaJPYwDUtM/+YQtVCooGzoD2yL4Nw7SdUyMXPufR9jHm6zV6Fm9iom2grzf97z57mFu96dmje
	8Qre1bzBm5XyQNPBh3zthlSmRIEg86Jo2gQkKgBcvOYUBIkntRMa6/20NSFhpFM3uM2rivSLXoW
	UFNWgoTQpyiMSpZpP8CJFL+33d7iKLfXNC0NLHxQh/6QAG/GmOkuV4AspyeXH1i4Sk0Ce/gLJu3
	ob71TqAc7O3g==
X-Google-Smtp-Source: AGHT+IHsJX5xKPE9NIlN342PbeK4r3FqiE68JLAtPVlnnBojsMsq6v3jWNk3iQRbqde8hfvSUe7K1Q==
X-Received: by 2002:a05:6214:4114:b0:78f:145b:56cc with SMTP id 6a1803df08f44-87b2ef4e9admr185883456d6.51.1760147318377;
        Fri, 10 Oct 2025 18:48:38 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc3574e71sm25978806d6.36.2025.10.10.18.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 18:48:38 -0700 (PDT)
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
Subject: [PATCH 3/3] riscv64: dts: sophgo: add initial Milk-V Duo S board support
Date: Fri, 10 Oct 2025 21:48:11 -0400
Message-ID: <20251011014811.28521-4-josh.milas@gmail.com>
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

This adds initial riscv support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/cv1812h-milkv-duo-s.dts   | 110 ++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193..49d6ae4724ea 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts
new file mode 100644
index 000000000000..2ab46ec1fc0e
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
+#include "cv1812h.dtsi"
+
+/ {
+	model = "Milk-V Duo S";
+	compatible = "milkv,duo-s", "sophgo,cv1812h";
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

