Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A33C22F747;
	Mon,  9 Jun 2025 23:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749512516; cv=none; b=uo8TJ8BoVjBAtFWdmGacwP0rrKTPBxWBqnqDrOsL+OoiNyWZMKs0c3FPUa0gWeBFXVSvjWzL0ySGvfmRXy2zA51xnQ/HNNumR10YGKGs6paazONV5jdrKkOhd/8P/xi7jPrVb639yqHraBcrdbDDd0VREuYKxp7GKo2XITW2BUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749512516; c=relaxed/simple;
	bh=hmPduejP80SEZYrzL0CO06DrhaexK+gwyvfe6CwhzqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eUn3cPCG8BMUpkHPwKAY4T4EX9yOxNGBQF8whr0A4wtkb9eJ4p2dlj5FcJk4iM58GtR5hdKNwrU9QKRQHWMY19O95B5SjSBoGSK1+RlVblqd83MI+qDlwY19R1CBApQXnjNlfq/94a3c+dm92raC8RR2KlyK6CB+JuVeAsS3SJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDUarsQV; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDUarsQV"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a54836cb7fso1082405f8f.2;
        Mon, 09 Jun 2025 16:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512513; x=1750117313; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqgDsCG6KOcBqitJq9JMX849ZPDRQzOs3fqgijVu2+M=;
        b=jDUarsQVS2MLJBkyKEHoNv9LX0g8ey6tO2EvkLoQsxBpDRiamGXgepBroDn+uxFWXV
         m9GgsQY4QF8ta3Xaj3E/734EVXGtjLByR10s1+nM6njBo5YdFnoTDzwWORcKmJDcSSWj
         AqmjHVI8wPyy4FcKjU7bUIBAbWZSs9z5wXmQuQbKB6LwmNidYgfQEfN8JJHqZw9+STBc
         k6GESBKRFdZaiAHDBteYFpKnjBXG6brDZlCvokMJT3E/2g4m2/z8xWTVlqAnh3p/qqmG
         oxI47ubDMYVPQUIREeEQLsWKeIlK1C4MFsLcKWWBSq8W1XMSWV59ogxwusj2o1qVQ1Yb
         9Emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512513; x=1750117313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqgDsCG6KOcBqitJq9JMX849ZPDRQzOs3fqgijVu2+M=;
        b=vLEPPHb0dMA2YmMgR6SIrfd0+CluJl8jYyRx6W1oOAlKs/KzuzLQVT8tVVB2Mum3Oa
         2/u9v+L1lnyMm3z74ec9zI95lFeioiO72MGEMTCU6RME/CJ28W+JuRFhwW0VPM30i5zm
         x0ytPZ9rASqw49cqVziB9kquVFcVLMPkJEXWO61OKwW5lC2PrPm1+BhJcSmu1y5WlYiM
         zhfQ+Q3StpzmGJdeRGlhm2FxgHwK6BCm1RvIQtXnX12nhAPWz50n+QIhnFdB57aCMIcI
         8AukYSLco7YpScwBFATAA16Y21u8rRAIsdpYDqRePRR8YMDerCsc7dyoCtt55rckSdhw
         9KxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWg0D5S4sD4r8UD+yeOUNMbe0gpuWn+Z2c+KrGYS6SFncAF8n8eV/zvAbVIkxzVB6Tm5A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmIb9N9y8VrmTMM9osE29ZS4s/MN4maFa8pRXWw18ctTQIIVpE
	o2FdtdfwY1Sv7iIXTKSL+e+yz4PeW8XU46a7E3xSUJ5aFMWmc2/ajCoWTRmuNNb0NFA=
X-Gm-Gg: ASbGnctIeiTHxP+eMHTXnKVP7p797VMlAR/SlQ+WJFpFhD6ADK6nTQXd0Splu6Oih+F
	EHUMU56yKI9NYhywTyhQLr6SICzj8dAwMF9v8NfkW8PnheKk0Y2OHAkQB6TS08VgQEf+3QobNMp
	WTeqLLuYIwYAlwBq1oUFOuIg/4AsCFauKFDgPWGJkng+UEt89PkjyB/zrZhAMA56X3cK4qhA4Se
	OzWZdxATJnyJYfhpgI8QcHON2RNS00AjvXSL21SWblylf6ryc2EKMLzGxOt0WpOYaFPKstOcLf9
	yQMi4COPjl2m8pPc0uA5ehyyS2ej9vZg8xQKX8oH4V9SeTgWpW6bDCghxITPJvAaOhzJSnHLW2c
	=
X-Google-Smtp-Source: AGHT+IG5E01PKSBDa2CpXIcLDEcgVeBGbKs91/xwnRq5LzqDPbtpo47hhaQbCqu4sMTtO6Hc0+CScQ==
X-Received: by 2002:a05:6000:250f:b0:3a4:dd00:9af3 with SMTP id ffacd0b85a97d-3a531cc1d47mr13174436f8f.56.1749512512569;
        Mon, 09 Jun 2025 16:41:52 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:52 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 4/6] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Tue, 10 Jun 2025 01:41:15 +0200
Message-ID: <20250609234125.722923-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Duo Module 01 Evaluation Board contains Sophgo Duo Module 01
SMD SoM, Ethernet+USB switch, microSD slot, etc...
Add only support for UART0 (console) and microSD slot.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  2 ++
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 79b73a21ddc2..3a32b157ac8c 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -28,6 +28,7 @@ subdir-y += realtek
 subdir-y += renesas
 subdir-y += rockchip
 subdir-y += socionext
+subdir-y += sophgo
 subdir-y += sprd
 subdir-y += st
 subdir-y += synaptics
diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
new file mode 100644
index 000000000000..94f52cd7d994
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
new file mode 100644
index 000000000000..b1f8a5787861
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000-milkv-duo-module-01.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01 Evaluation Board";
+	compatible = "milkv,duo-module-01-evb", "milkv,duo-module-01", "sophgo,sg2000";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.49.0

