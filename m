Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96922E3F1;
	Mon,  9 Jun 2025 23:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749512513; cv=none; b=JvowkqZIfTgtFJeQRd/JoP3vHwDHk8AG5EUvHkq84m6jLawHoKIXuM8zWr4OhSE6dEmjzM9F4kuIMJ1wKOEUt0myWA+IcKKeMNIW4OBBVfuTSEFEca1NfnJJd5Bhx1afANcr/WEmEurx+sADSJmzfyfbn56WAhRfq7k04FDy+TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749512513; c=relaxed/simple;
	bh=0BQ0jgYtqOGhFkJ+r9pdGfm5eWQfAES5BCnpdfrnkdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jjHCO2o5DX8T6KQHHSFzRYKop6MGYOuramSPCbU4Hh0IARYjasfj/TLaD43xB+yWhlTSGSXcr8cpOo3nHT+40GPfQCT3I4q+9RbpmvDs1HbkKW5aWFERSFJ97vmLxqSLC7bsDawze1p2c5OxgjPkthCJfufRoU1HR3S25lTSrBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WW+qRzV1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WW+qRzV1"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so2888038f8f.0;
        Mon, 09 Jun 2025 16:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512510; x=1750117310; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qj6uAG3CR30tPQ3DnBosD5WTRWZkGf0ig2CTTy+EMb0=;
        b=WW+qRzV1XSjLcNqEqrs8xSrhuq5264cKK80DXF4WjTXLR/qtrpffqpCU0nIeFR8mXL
         1pSVjclSr3Mk9GwFQfUolyBXTopm+ozG2WRG8dGv8HdDqYo+xbmOPeHnyo1GXeNlM/Y+
         ww2AivKEkrWoXYaSyU+Mhft54NJn6J7X7fwsd/q1rQVyza8PYk+vLOpUD6N3KGA1NT9a
         tp8R8DyQ4irIjdSf4T0yUyj1g2S5nGOfyJpM5Hfoqp/V3b6pO60U05HPYkZg74sZBuVv
         q5otgdn/9AiQOmrOaqWeJs9T8KdgiU2NhI4/Fns/k3O9yZZWebExRscp4k6o9D5joPVs
         gszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512510; x=1750117310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qj6uAG3CR30tPQ3DnBosD5WTRWZkGf0ig2CTTy+EMb0=;
        b=bHKez9XBn9cFvGRJt6t0Dl4+MCOEAsaVLAGNwA7OJ+MfmhlvwtB087tp5bRTAh5BA2
         JSZogVRhezTHzmE+lnDZOs8CYfPlD5fTGepOo3MNw+V6K34DCC7blqLNsyVo1OgTIkUp
         bA52naJN+xkn2gvehsQm+FobaD17Z8cV+izmDnzwRG4NvVyqg4onPC6AaHekmew2CJTu
         SUyKLzCxiK+Y8/y2HAtWoP3CPSvJV+hVbS9VK3ljdVJriCT0C/zBqpaGdTSDGc35zIsx
         +T6NIoQR1WOKEai+86vpjrJExeMreEUkhkW5XgQAX6vwOzqyLTlCl5YgHrvonmjkLwWb
         VVDw==
X-Forwarded-Encrypted: i=1; AJvYcCWcP4ZpCcxO/Tn+ebtuU7FFNF29pjmOwVueLfKKRToZnNES3Cw6k/oJexdOBJd1oJe3Z0A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqnQu2K4kkwH0NnIj53W5CawSksit7o/igTurOK/P9rMZohcij
	9fbXYVcewje+FwPr2rPFu3PjoZ8OyiWegeBb+sjGJkebZK3H5hNpSql/W49W49BqkGM=
X-Gm-Gg: ASbGncuQ5m3efERvcqnpm0m+c0XIaH7v6OpGLazabW36XZw0gvWQ2YCUNV2zSLNQAMC
	xar9GPtQcO74JVYXzX5rfmsMv+cKYMU+5rEGf7bDZj26Djweua4RaW9aVRi2KDamvmMFxR1AFe8
	YHMQATPfNfD5GOyQv/l1XEf9sZxMUgZpiDEH5zYLd75W0LM+LQS3MIkKrUsWn/8miJ2m55fYxG6
	STuXQw3L5LXOyHIN0AVPTObDdokecpGE/AgB79wxxwVWco+iET8D6t7pWDui64oulWkdSdjkKIX
	wruhS2I6WGZyLkA3Ixux6vLgc0pctWNOTzxgbQRJPprHVYH+rZnwrI9AxYHr2AlCmqGNTiHka9E
	=
X-Google-Smtp-Source: AGHT+IG4HXf2lSWkvDODDERvUtuiIKNnxnMRw35CA2HnDNQEGWGLzxYU9cPTFbmuYxiabH6Od2fB2A==
X-Received: by 2002:a05:6000:4205:b0:3a3:7987:945f with SMTP id ffacd0b85a97d-3a531ced4e1mr11490073f8f.57.1749512510378;
        Mon, 09 Jun 2025 16:41:50 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:50 -0700 (PDT)
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
Subject: [PATCH v6 2/6] arm64: dts: sophgo: Add initial SG2000 SoC device tree
Date: Tue, 10 Jun 2025 01:41:13 +0200
Message-ID: <20250609234125.722923-3-alexander.sverdlin@gmail.com>
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

Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/sophgo/sg2000.dtsi | 91 ++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 000000000000..5e69ccfbab56
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <riscv/sophgo/cv180x.dtsi>
+#include <riscv/sophgo/cv181x.dtsi>
+
+/ {
+	compatible = "sophgo,sg2000";
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <0>;
+			enable-method = "psci";
+			i-cache-size = <32768>;
+			d-cache-size = <32768>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x20000>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;	/* 512MiB */
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+		cpu_on = <0xc4000003>;
+		cpu_off = <0x84000002>;
+	};
+
+	soc {
+		gic: interrupt-controller@1f01000 {
+			compatible = "arm,cortex-a15-gic";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x01f01000 0x1000>,
+			      <0x01f02000 0x2000>;
+		};
+
+		pinctrl: pinctrl@3001000 {
+			compatible = "sophgo,sg2000-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+
+		clk: clock-controller@3002000 {
+			compatible = "sophgo,sg2000-clk";
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
+		rst: reset-controller@3003000 {
+			compatible = "sophgo,sg2000-reset";
+			reg = <0x03003000 0x28>;
+			#reset-cells = <1>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		always-on;
+		clock-frequency = <25000000>;
+	};
+};
-- 
2.49.0

