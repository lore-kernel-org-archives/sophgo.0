Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2A81E1E16;
	Sun, 16 Mar 2025 18:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742151410; cv=none; b=dYmC8gaDwU2PuKzT0nXawSU9NL6+FhTliWrG242oRcKtnhZcPMtX96vmFXPnLMRgg7L56TcPob4WcfaERU6JBH4HtwNQKOzBAcNlFPdBur3E49pFOhHSG5NDtcnp2XdLhrMByb1aliHqJAYFHLQ0WAQW1V40SKr7Cy3AuHmL0KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742151410; c=relaxed/simple;
	bh=tglxEmuWGw4akNornBWLCQKajr6P9iy15vqg5vSmx9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D5YEdLRHk4l5t+58WGpTPtlkFX6v3D9LXyOkFQ0w01/olwN1SHeQ/juc98C0+bYp6/sIw4DfhIKEyJRDKsj8uzfMleIQuviGsSgO5GLPv9S1Z6QlWnGikJOpeuEDy9CiQusif3ZZEAGNyJRSSy2rY+BiuKgKen+uxnGYZSC48zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4xKup6D; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4xKup6D"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so9646725e9.0;
        Sun, 16 Mar 2025 11:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742151407; x=1742756207; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoyZXAvqNe6CuejKxIry7Yi6oQs7DU4ZtubzPJeO22A=;
        b=k4xKup6D2AUDXJrAjZtkjE7brwjXFl0tAkXNPae+0YEkeBTXim8Se5rDK+4Ef7np22
         Qrmz1TFnmG12ASwsQFvqwuimlqWsNFPNV+e1P1V8+3DW/q2jxfSDQKpK2th+OuocoRCi
         dGoW650cvNOMJqIqqslNH1o7VBkhcFNmzDPcAUzUO2reaKINXdaX5YgBmZa/Ssf9P/SM
         ecRZj2wewUTrmydR7b5tVN4LzhmCXFOH/O484mlUDqdAyEvizyNJvNKTbxGMTLdFzOzW
         MJfByp7DYZZESThRML+xupR+nuiTfZmKBDKruDKc0JgDLXMggLM/VpIW53nQ0aGOJKlD
         2IBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742151407; x=1742756207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoyZXAvqNe6CuejKxIry7Yi6oQs7DU4ZtubzPJeO22A=;
        b=c0z3fnicIMRyQNdakN82ctJkcxgSIAUqG44vA9VapLespaLaLyZLnMlDV3xzLr3yTv
         nITgdMT/aZufeSRzdZrvOLQfvWeX8YWTAuHvZ2JZLDUHWhvtk4GlO6lHLs60Fx8Y2pAG
         NcLG6uX1pEnXIEGsw0hx+YMGXrKiAEvAf5NGybNFfnRj486SmCSsErPfnWO7RSTRl2nq
         q7bMG5511xeXhnL4BuuiZT/qGW+XkvCiFKv+XtAJdI44HZB3oKu5NkwHZjpbEh4FOet2
         /jP1tt+6eD6RtPTTLXSjrZO8lUZafZHg14bm47gRY2kgjRTv7ublOwx4N5hFCJCTBqxZ
         RlRg==
X-Forwarded-Encrypted: i=1; AJvYcCUOnMDFcBzcakzJoXx1yFUsAWELLviTyj/853kV0D/fh7feGv6MAYHw1Fk0ZXP18OcdNGI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgjpBNQg+fPx64yEYGt8oIZlL/3QFY1yfR6V3FrLYQndQRVFLI
	HMXUdaTIr/b8Qga49jxzacD9GfMbDYxLFtehhkuLW0snlbTOuYa3N1NNwT2x
X-Gm-Gg: ASbGncukD85cfFL9jswrnEIJWt38hxlt8Er4a4/CCSksthdbeBYLzfQBGaBxRBUuCc3
	rQJzl8EV9e4en6wDGu+8GFpf/yL9FjBkldnvr/6H3VGTB639Nj5Z/daS6sDEb+kEY/FNqWqEiRX
	WJb/oUdwkK3ag55Q1o8DNBD4P5Rai5GCIqXjDjCrRYaW27XANzqRgCHP7NvGP9D5b7KYEhsO9bC
	ZHyD3RAmiCBdtJCvlmZ8ahg94tgXfxevag0euaTA301Y91T9tEn7aTEcJ2Iz9kUr6oL5OCVs4x7
	m4ROHIQyAHYBS3lrdKrqSQbXvzud6MxS/6u4LrOR1XoORPsBBLxixYs1aBggX0zp/VHw
X-Google-Smtp-Source: AGHT+IFMni+9tePO5dcXTTurbNOrImHaypczvIJOW+fllny49duz6UAc34isNuZiUTsLUl0JT/kiSg==
X-Received: by 2002:a05:600c:1553:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-43d264bfeb9mr56204255e9.29.1742151406643;
        Sun, 16 Mar 2025 11:56:46 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb6292sm84692335e9.1.2025.03.16.11.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:56:46 -0700 (PDT)
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
Subject: [PATCH v5 3/7] arm64: dts: sophgo: Add initial SG2000 SoC device tree
Date: Sun, 16 Mar 2025 19:56:33 +0100
Message-ID: <20250316185640.3750873-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
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
Changelog:
v5:
- PSCI node and enable-method
v4:
v3:
v2:
- relocated "memory" node according to DT coding style;
- moved GIC node into "soc";
- referring "soc" by label;

 arch/arm64/boot/dts/sophgo/sg2000.dtsi | 81 ++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 000000000000..7051007ec7ea
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <riscv/sophgo/cv18xx.dtsi>
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
+		compatible = "arm,psci-0.2", "arm,psci";
+		method = "smc";
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
+
+&soc {
+	gic: interrupt-controller@1f01000 {
+		compatible = "arm,cortex-a15-gic";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		reg = <0x01f01000 0x1000>,
+		      <0x01f02000 0x2000>;
+	};
+
+	pinctrl: pinctrl@3001000 {
+		compatible = "sophgo,sg2000-pinctrl";
+		reg = <0x03001000 0x1000>,
+		      <0x05027000 0x1000>;
+		reg-names = "sys", "rtc";
+	};
+};
+
+&clk {
+	compatible = "sophgo,sg2000-clk";
+};
-- 
2.48.1

