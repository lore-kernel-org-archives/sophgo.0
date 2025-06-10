Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECC626560C;
	Tue, 10 Jun 2025 20:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749586366; cv=none; b=qq7VAtVJ1DYcYqW0VJ4znsutMk2+oBatiCDq/qKnfC4yplbHcT7lKFltDO93929ID+7easeIkxcoExfPGzQyIWtUf342/OmvJjddGcCN2TdPozDppKO1Z2dBLQ8NtX/OAnW/a97aqQfA3b6txvei5seIIZsdCfdDWVuSnddnkEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749586366; c=relaxed/simple;
	bh=hgmwqVh9XIhlP7omZsMBOzfBNE3pBOvKp0NYjLwGgnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ty/AuybDGY+JaF/Nlh7l+L20pE6Q9azNFYsGSwUfM7Z6Gq5jjqdVxAmMbldz+HB3khZ4ifVM14Kh8q0J4j4iuWggKdC6CKmHwEon17+e9zjZQ8v337iCrN0sU5ng9pRr+dZxaoCzBG4Z8om+SBM+z4mdmEaezgBw229l93P0yv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JstYxlPA; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JstYxlPA"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so4935872f8f.3;
        Tue, 10 Jun 2025 13:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586362; x=1750191162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPm0e/JJXYmTtXoApki92fg4KK/rnmg1MG8vP8qKKeI=;
        b=JstYxlPARmZ0TEf4Setb9DqApK58UEcn9I473t52R5TfTAgmVEW/OlHnXXdp2+x2O+
         zqTIJCDNJSq6iQQrEinwU3FDExFUGDQQqDF/jHXYI/aGo8Z4Z/f0vL1ePoQK5f7oFohM
         1tJ0oadRfICfLpXO/PlKd7MDEDJLFsKrtYi16l88cfCf/C+A+vYPsiMykau0qVC3FYdj
         D57OkBidhF2b5FuacsIqGl9W7C+K0SHLH/ZsrKOP8eHnFvzZADNC2VH/kW+rKWDdBNbk
         tE/8lwVd2Jiryd/j4zNAwou3cJhQN1Mz+TMEY2AO6QgKtlYQSE1rPDVZ5n5nw9k98dc7
         9dwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586362; x=1750191162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPm0e/JJXYmTtXoApki92fg4KK/rnmg1MG8vP8qKKeI=;
        b=XY7wq385Z20YmNFqkaLk7hLq0W6qkjX0FkvYOzUXhcb9YHbusVucmJ2+pZmPyxIThH
         sA4FNWnEWv5ZM6u11yk4TZPm12LFzCDLMFOqmPiTK3D0Jvi5tPSxUx2QvSFEg6MJ0QLE
         ievfnOGWsbuUI/M9H9D+mkYSH9aWVjCmlvs3HUNwqvWf2DfbcsL7pfz6sfASweRBwfjH
         RVfhKZq9Fhu3Tb3P4U8HdSKnkPGXE0qil1CTfyAyE/ALVB1BsR4dA2kcohvFdytLf48G
         tJuBWWy0XuSMWk2ykoaFc3l43NZw2tczsYHZO7e8zsegekfZsNQcpl+GTwciT0l4tyFt
         7DDg==
X-Forwarded-Encrypted: i=1; AJvYcCVqPPo6pKqFC1hy1guv9/sHw7RjbjCwmDDJB/korIaA43qmH8rDy1jDV6LYJsjCgqVuHWQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzAT+9dcTQ7C4/BEQ9dVZNf/raxffOSwdVhOf0wuJ11sUPZ9OD
	QZKC6FvgUJ0h2jVd6631yBd7iVryV4hruschk8omCKj3+R5BzzdPFohHm5vLLIvYDUs=
X-Gm-Gg: ASbGncsg9QWb6OEj1dmUp2a3wu3L3iB6l/QQlTvgbF+FM183qTLEj8Ux/+ALr7RSAsx
	5HMaoDlUO1y9TfWRY/PrNuU2IEcgyBidBx7ZoS7UYIjeeuEvb5DrV3UWx3gbA0O0XM5ywl/WWuY
	Bp/vYyaqE9bERlfIGaS9Z+vyGyzM3GQOK18o7Den1pPcZr8KcaMjm4mHHGwbNxgbD5RcJZB13t9
	ksNDBB2roqKs34r2SSvfWvmf8vLrOPDdRKBigE3X7S7fLYpqAJY9jAItMhGKseP4DzxQS2P+s63
	R83wT0pvAbpygWOwbwcQ+/hSdU4grQpRdWjQC4mK9dUEgR4u50VuVx+n5fPxUsRXMLCHtK+L/T4
	=
X-Google-Smtp-Source: AGHT+IGeIgB5Jm3zvzqrQCQ5YAuHI//D5pyuMaTvzBfMR1wJ2aI2COqR2XOMS3IGrHzzEanCXEJOQQ==
X-Received: by 2002:a05:6000:430b:b0:3a4:f71e:d2e with SMTP id ffacd0b85a97d-3a558a27aabmr309671f8f.56.1749586362120;
        Tue, 10 Jun 2025 13:12:42 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:41 -0700 (PDT)
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
Subject: [PATCH v7 3/6] arm64: dts: sophgo: Add Duo Module 01
Date: Tue, 10 Jun 2025 22:12:16 +0200
Message-ID: <20250610201241.730983-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Duo Module 01 is a compact module with integrated SG2000,
WI-FI6/BTDM5.4, and eMMC.
Add only support for UART and SDHCI.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
new file mode 100644
index 000000000000..bb52cdad990a
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01";
+	compatible = "milkv,duo-module-01", "sophgo,sg2000";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
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
+/* Wi-Fi */
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+};
-- 
2.49.0

