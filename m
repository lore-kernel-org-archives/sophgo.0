Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0681DF994
	for <sophgo@lists.linux.dev>; Wed, 29 Oct 2025 00:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761696707; cv=none; b=aOmMO4ThPFUG2GMPNCy6Zd27q7swd25QxMEEhEeaDGJfm6AVweb4YudKfLfV6eoEVw+lSKdf0L79yGOwVyY1/cnTb6IjlePjaAD7L1nS8+wp9jzVRZTEGXsLCEMuPzQ62UNrjQWRfCRtwZsf5Oy4AWWWZSXbaAfZkzzPjY2/VoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761696707; c=relaxed/simple;
	bh=BtXlcRBoAhNxkROveqqzl9jSeq3ICUd7+68jZ/irMY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RqY/+Yku25hw8P76GZXxLylP8LmlMXKd6DXjqICcZwTgrNOj5GpO0LmfIx14s0TKYpNmXmRYYFlxktYitBFAyz14aLE1Jqt8rDGL1rpCmQaAVZJSQFDZP2WUiludAoysWY8A1RlIefq3b+N3evhxqUT2jvXdTgh5xPNlCDOP7YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZNs7HuU; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZNs7HuU"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-87c20106cbeso97587786d6.1
        for <sophgo@lists.linux.dev>; Tue, 28 Oct 2025 17:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761696705; x=1762301505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SY8bhJKucZnnINBzQA9olEneaOdGJdRswVhKUMSP1Ts=;
        b=NZNs7HuUmzvAFu/o4kDrprqEvCY/2+oR6klfIDs0pp5/EF/O+H6dCO3TG3Npt1CvUk
         QnANogY3VlUvXQuYT0kgP/3o+WVlk8kFcdruZu4Ikl+bRm5gMWoMaX3bmpboqSOn8YhZ
         P7NkLGhXGcQYVhb67DGSpLAyP4cbqmGK3zS2NidAR/rhjEyH4WDZyJo57fq2QPeVMcu0
         PUWiBFJxvxm09eUa3Fru6LAIadlZIDJcpoVFmCKOveDUBZjW5hZowAmQ9Ym609AEYkqM
         BK0hKBq/naIfD6wc3leysdkCNCga5R/8T93C1t1DQWACUcoErIqSLEyqpCqIFQ3r/5Bb
         k0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696705; x=1762301505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SY8bhJKucZnnINBzQA9olEneaOdGJdRswVhKUMSP1Ts=;
        b=NiIItEKYhUVNghQNiCfCBq9JuFJB5tPck83NN8IW9wfy+p+Uqh6igL5AOEZfwbhvwL
         BpQjPpMSs1Ag4fF+ODDjLg3As03SVNhWNi0qkTGzQlR3ZuVO8F1kRZiX/I8aGhAWYJ/w
         hQyb1NatYZyN7X7nXSnnE39JJmEs3x/ieb1SQkj0jdl0sQhLjLrq9c841GY2WVmro3m9
         AHf8dpwJfvLkKSO5RENkik5oEEfOpyiVLuVwd4plFdS70IRbuWBZ1YNP8i3UPOzL7I6c
         avh2COpnOK7bp/R3xv6olrjXW0fwMqoCChv36H/OJD1bzuCzxQicvrpfoUjcwMD0VGIY
         aQww==
X-Forwarded-Encrypted: i=1; AJvYcCWrWJY0gYdP2NcXWe8G3gGu+Xp1u31HS1F374KWx4k0c93OWQKfWqD//9RzO+f2kAwrMyViwAI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSYVjo020EjIl/5idopmOmQvVLddEO6LtnJm9mRc6AxPgl4i2z
	KQTRK+NnFRQAPLBgFFpt/SW5md2rg/MWkUHIYSSJG50w/ZURM2X6iXlQ
X-Gm-Gg: ASbGncuZ1bifvTGdvFqN39ZDNdArizkri7ek1stEL77DycngiLvNJ1BXFQytPWcL0DK
	DpYetpImDbR29lzDAGMyBqX/YasKvDd6Jk3HqYgTwhW+P9GJJ+pblxAFXGw2xAiXN+OEJCCQ7u5
	u2zDmRLKp0TP/1yGHdbihJhXBr/ZAxSPxXoIYVMrRyNqp09CfM4GI3kxl2VrccxK9Q2ZJu1IGos
	6xYijdCIf7PI8STrG/ycoR0wNWaZ0f4FS8cA6EvHtPMB+0rjshCksYPFjyqN22f4bGd7SaBq+P1
	x9rH5jJylFslECVEcMs0SR0a8gG7bV4O9qpG4MkOjaCq9JJUj5GbWAP3eL2U9yr1x2OcgfTYMDA
	DFfi8uvcfmUgwZII1l4wXpt911ZbCREoqsKlOgJivbof5v5yiju4EXrg/mXofIIIWznFkt3/JdO
	KETHGUBDwHLaYLe9ohc8R6iW2TBBG7FC+6zCrTXO3tx+it
X-Google-Smtp-Source: AGHT+IFN5MZFLx9fkQvrL/pSdC8MVt0wRfB5OAM1X9WBFBf8yJncnQ4OXZoamPK6a6ubNICmvj6aog==
X-Received: by 2002:ad4:5be5:0:b0:87c:a4f:afd3 with SMTP id 6a1803df08f44-88009afd0a8mr14232506d6.16.1761696704672;
        Tue, 28 Oct 2025 17:11:44 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48dee2esm87255906d6.23.2025.10.28.17.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:11:44 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
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
Subject: [PATCH v3 2/5] arm64: dts: sophgo: add initial Milk-V Duo S board support
Date: Tue, 28 Oct 2025 20:10:49 -0400
Message-ID: <20251029001052.36774-3-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251029001052.36774-1-josh.milas@gmail.com>
References: <20251029001052.36774-1-josh.milas@gmail.com>
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
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 80 +++++++++++++++++++
 2 files changed, 81 insertions(+)
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
index 0000000000000..174c194e1301d
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -0,0 +1,80 @@
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
-- 
2.51.1

