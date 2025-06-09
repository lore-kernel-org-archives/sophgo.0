Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7FC22F147;
	Mon,  9 Jun 2025 23:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749512514; cv=none; b=JDbntN8Qp/h+F+se+Lt5djHgd00QMxB2BNyIuW/orFpqrPT9gYhEJaWZUimYvK92PaQUE7YJuWADNJ+s4SPLvJrz42a9unBEWSek702QbSgaZVc6VTGofnkgfM9J2b8nr0qE1WDWiXk70q9Lb4XO6yl3mFyfvamBaIdudAsBceQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749512514; c=relaxed/simple;
	bh=pwi6o6ww6dSkF8fNqOT9t3Uh8gUsHMUCgpjs0IyKqIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RT7bNjx1n1U+VBqhJaI5/qKAYOk7tqBRCdZykcvxy4Axsxpc1f4eiDNp7M9ASw5S+/Z5ezQTkhtipEVjhh9BW/u9R9/u3KkwxDwSOhgEO269WPaEgTnPaM7JxlcgeIovS0zSMrsAkNw5BPQF0A5j/7rlXF1y24LlwtZ44w+yL7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQ5Ia/nw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQ5Ia/nw"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so39899395e9.0;
        Mon, 09 Jun 2025 16:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512511; x=1750117311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo1dYTSb5N84GQeVh5+0QHCVJJnsbzuqHcvvt9y6zKY=;
        b=AQ5Ia/nwq/qv8MHEDyLzENWcOWr5o1siuhPJKsfdbIsIaSwoS5Z0H6ByVXvBzZ0Gl/
         WFQfUsVEXoziNs64KMt4A8HFEDi1je7uOXs74wAOuD9YGS+KvfOu/BXZcr2FdgIDtmoT
         rx6SwEjoZwCslcWjXl6L9nM+txg7gRSmgUlBTI8AwB4P9fLxzwEiQt51Ca5pJQexKLmH
         b7NSOVQ2qSLQJrrCPpEpsulvPUi1AQE8di7YThuZv0a0yc+dO4GBuGXyP8E3BkyF5vY9
         nimKZsLu/8e7BJmAEidZeSuJuYfYgTXDf1TMkskFybt0mDpg68Wxp8ZfX/5E/4/1KhlO
         2OVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512511; x=1750117311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jo1dYTSb5N84GQeVh5+0QHCVJJnsbzuqHcvvt9y6zKY=;
        b=oz6IrYt5eF9xNbG6LdMARNkWhnxqaFgjBLZUhFVQF6mStOUnmdqEnZPZHTB7q4CdrO
         EG9HjkhDO3KwQ5YNOPfOJliYOJojTZ5Nv+moWSEct5jAKCYFmto2+diRZi0AREyaoKTP
         bBPlwj7ajnkULHJXl2hm8m8P45JaxS4RA6EE5tbk++miFcX+5+uT6Sql74rGZB3s5b3a
         hs+ismTPBnD8HZXEJhW4fCI5tTDQvZgXR8XZ8oJowAgDGxb9ZlpMV3m6y0gU24yUsqU5
         hz0DDKyxQVbGxZK8N8Uj9yRhiY0Rd5LwvCowPTVEqY/ytiyWnFw2BwmYflR2LBS73F7T
         r4jg==
X-Forwarded-Encrypted: i=1; AJvYcCW9G9FeX5JHJZ5wmScFjRonDesQ3QRy3/80sNa2Ww9QDhLtpvqpoVZKOKzAgxew0tI88aM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3bqeyLJI4SubyfT1/bdW1KlCC+f4zXVyquzYHxvRATo7NZ3TT
	3IatRyroxBuMfTD+VywJH2T7aicN6W5fAPy1AopvQ9sW6VoYci4E4WfNEx0U/KWdmak=
X-Gm-Gg: ASbGnctiaRX4ArUnHMIrUyyhwToTshaXL1JGFPhh7DAOXkx6Txu95jnl/JmedIuz61U
	zVTPmnZnyX18PTvDh3CknnCj9IqWeheaUX2wZ0biEEtGfkkMGg5TEBOepCOGZViOFjVShVNgLDN
	uM/AiGwIyVrBaBJVjmrwDFbSJRO8Eh6fnCG5mCbyvVOrilQUptvbCr0lVaYpQyxfsjVVkOnNVxx
	5E0mhTW63nfWoaMk/U7ccSjTOiS/bahKSLcAjigJpeU77Xs2pImBQ85Z1UF61R2KYydNr57fM78
	Git0jCwgih8dnvXqvOHvdQ9BrDy2evYgYDq8F03QfPELGM8k+dY64TkkzQkLKq1UhIjImPo05GE
	=
X-Google-Smtp-Source: AGHT+IFApIvy4cDz1KO3QF2Y2DufyzGd0D/WiNt6nw0laf5Xpx85PGR9pawpRsdmsQ43gv8vaIkl8g==
X-Received: by 2002:a05:600c:6205:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-4520140c06dmr126096785e9.21.1749512511504;
        Mon, 09 Jun 2025 16:41:51 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:51 -0700 (PDT)
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
Subject: [PATCH v6 3/6] arm64: dts: sophgo: Add Duo Module 01
Date: Tue, 10 Jun 2025 01:41:14 +0200
Message-ID: <20250609234125.722923-4-alexander.sverdlin@gmail.com>
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

The Duo Module 01 is a compact module with integrated SG2000,
WI-FI6/BTDM5.4, and eMMC.
Add only support for UART and SDHCI.

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

