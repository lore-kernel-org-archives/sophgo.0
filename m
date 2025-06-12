Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9014124BD1F;
	Thu, 12 Jun 2025 13:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734921; cv=none; b=ji7fpEV6FDFq9aqSRZRWC3kuJ0GK5E33gKdUiidB530hiuOmi1OUzKWB5xfeUEe6mnm0C76CFwzzwG/zGV56fG4b9RCwSiiqjs5TU/Ur49d1HdLf0oVgWwrPPFk/26/znE68W/Z0sxI8k0lRZa6A4qZyVHBBZ5NJJsjXt0EJIFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734921; c=relaxed/simple;
	bh=t2nf0lajDWGRipKPfRSf0DKe7OZxH36nB3KP+NgBn8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rcTa13doxcrMwlLzOntxQkClJszvJD3b8qpybP5re2Ok9kXWAEQdIa9XEH4UOnf2YuAYNHEZ+kCPPV8eZK3/bxa2gJTWLBBCMKgRusykB20GegzU6I+25VXZY8uXq5GgTPxHlaGUUf/atcpYogOSiqqbdRCWBZzful4mqtUuciw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjTsa7iD; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjTsa7iD"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a51d552de4so643851f8f.0;
        Thu, 12 Jun 2025 06:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734918; x=1750339718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJWz9vWJiXDPslvRljzbQ2vAHgr8xWbGQ+fUKxXPUgM=;
        b=DjTsa7iDxmYg8LQ3UYaV2RrSklz5wn+vJUVB57TilvjXQbIrd5xeBt1IecdJpi1Tz+
         wE+aAChOrWAFWYNmDXz1UOpkP7HI50C6Uaw+FtQSpDWkHA2JZn247MlRLJ0iPUHi0OEw
         D6SOfHCUTCL7VahfkgjC/yZT+GilELfFKK9kbkeUEkZQTSQb2ClOQY6h7Bb9JGPOEbpJ
         VTKRtGA6jzo+CaoxvIUZGhiFmx7HP3B1+QSEsXmF/FZJvfNA+OQQrKtXTSPmCaXRn89w
         QJayada3KrDkoQAzz+OoFkvgp40US3iT1er88wGbGe2+56RP9t/SHiayreAf+/RsIV9g
         Cq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734918; x=1750339718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJWz9vWJiXDPslvRljzbQ2vAHgr8xWbGQ+fUKxXPUgM=;
        b=r73a5Ohq31R1VK8TC02HQXXEBaSzZ26UUUmt95CPnaLtm8EJMyp51T2kDW4e3Ajqyl
         J+ANfqE2NqC9FinUFnUCHf0ENmhvr8+MGPn4hXEKcCtp4q5HExc8Nad+psv39W9s/rSi
         /uRCicSgv7qEDA5FZ+wNrvdnpbaOxz7+uiUd2BA274DwBQ4cVex1Ldgys0TWKxNPOyVg
         qEEYvhefwRf/6WSASKpmbPwkcbuXsuLEDDaxGyid7PhvkazoOednfQ2AOBIMLDAzYzvw
         d0UIiJqgspI2Y4ShPe8OFyTF6kHnEH5c7zuwvhFp8/RbFPtJcoeEY/aPDhZXmweoJY20
         BAwA==
X-Forwarded-Encrypted: i=1; AJvYcCVfgGKuPKCdh1Fo/GOmyTE2RHN7bkyGGRIy8JwSUTE23zC8aMWmiwIia+PiHCe4oGmgKjc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoA6P0szfY6QGXMTHtW40OYMnAUI1O1lEHl+ev2snj4JgIvj37
	nyYZlWxrjpJBbqkN3HK7z/FGYKehmnAJDyy0bJuzLKybEQgAdAwRR1FEhLo4TOTNktE=
X-Gm-Gg: ASbGncspIBJk5r61aPJkPGnbYpK+EJPp5d/1fiEBHq8DfAI5l1l8UdI7h59d/TfYr+O
	v750sd6pw0SH8xVfZxK8RQyvHDubc1Ao1D1NZqJ3yx8ZY5mW2j8Nww016sjm16+ShUTje0NBwXX
	IzGnKW7pTlNOnC5xIqsnc6eKc/otVsW16g+iCNnceXvscPzhY6ujMpUYeAe86XwLMUPpornebuU
	yZH9+tyPaVV9syBd0IkQXINIllEniHgACHcfU8MBOQ8fxsG2i5hK2w8PfcLqfgE8tzrkFb+I8Cp
	mVcfU0a4l8vBno+NraEFk86lryyyo+9KSm5wjMzapIzj5yWBI/TP6vwqRHm0Vq23EcD9h4pQhT8
	=
X-Google-Smtp-Source: AGHT+IHh97fti/JWAbGW2t2YuMyXXMtMWtB9nKhN92ggDlclhSDS35Gf1vxm+RRU+a8WgbLT0c7WzQ==
X-Received: by 2002:a05:6000:2c13:b0:3a4:f902:3845 with SMTP id ffacd0b85a97d-3a5606e0b54mr3212419f8f.21.1749734917376;
        Thu, 12 Jun 2025 06:28:37 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:37 -0700 (PDT)
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
Subject: [PATCH v8 4/6] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Thu, 12 Jun 2025 15:28:12 +0200
Message-ID: <20250612132844.767216-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
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
 arch/arm64/boot/dts/sophgo/Makefile           |  2 +
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 76 +++++++++++++++++++
 3 files changed, 79 insertions(+)
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
index 000000000000..a281fee0d76e
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
@@ -0,0 +1,76 @@
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
+&pinctrl {
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-clk-pins {
+			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <16100>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cmd-pins {
+			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-data-pins {
+			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
+				 <PINMUX(PIN_SD0_D1, 0)>,
+				 <PINMUX(PIN_SD0_D2, 0)>,
+				 <PINMUX(PIN_SD0_D3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
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

