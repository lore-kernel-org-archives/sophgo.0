Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963A524468D;
	Thu, 12 Jun 2025 13:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734921; cv=none; b=Y+lp7bKXfEQ9TItgTxpguyMaFU2ZoPMJQtX6otEPO3FbFJ4+A0gM91pPKZ6LE/2M8w14O4fEu+40cEaNEl/GN5FuhbE4JnoLw67CU+ycJl9YiwG0yrrtAj8OlzxjAxlrcmQRgG2fq+gbvF4HIsYthY9/ySJbdPSFQtccaO1Oj8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734921; c=relaxed/simple;
	bh=RFCbFn5e77YVAf4a9A7CVRPUtquiepb4jkZ5TxMKZeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qf3ARCQH8O3LcjQzd0EIJ0qNmC2GoWHsHB0FOypsptuxqnHgmCPku7hM0pNnB9gO8+c/QFdLriusN8jTnKWiw7c5qxY6+XxGatcp5Q3fimE6zXZW/GN2Mh5Q1+GffMnWlOwWjEm39TrTlRPL6L3hrDBiA71OH87HSQPrdozz6+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PM2EiHqZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PM2EiHqZ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so556544f8f.3;
        Thu, 12 Jun 2025 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734916; x=1750339716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sCYZE5IfgD4vq8LpQHj7/SMtKJgfoiLAqLcowjxSDE=;
        b=PM2EiHqZO4dE66Mlvl2ZJQZcNQFs6KN/+nQ3dlCgMuPxpplL9ss6uJLe3bOQ1qNsnq
         Kkqua5heX6SYD1YpjZet7WAbnULZMrB1QBd0CvcX4F8tpY+96315QSHo/XfN+BvFXnZS
         l3TjyyOfbUTv6R5sQtW2r3le0TPvL2eem1rcJpln4c4FW7cXKR0wk0Bf09p2LSIxwYgh
         kEmnSxxVOnYcycgXot6WuIPZzKtBL8VzYDGQ/4PJA90lYKop0BZ08ugUHun9PHhTdIYT
         hFx/EMguVFSzNuNT+tuJilx+R2eUcOKwnfWopqsdsbxFVqhIXOfaXm4nWQBwFLVvEmyH
         9BLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734916; x=1750339716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sCYZE5IfgD4vq8LpQHj7/SMtKJgfoiLAqLcowjxSDE=;
        b=Zue78ISHTxa6BPe4ALzT+kbTq25a2ObfdADrWIZdDU4258LfXe6+PpEvUtn4u/5h7S
         Ad3lPZ57gqE9UbJOYktXAEdfPZwxt4FS3nzyRV9vKEIjO8m7PXX+gqKwYkovF2+xXsZS
         7532CdYT9CEpx/AWtuN752Nx59axns/LF0IEjbyJ2SlWe3zFxKiVKkPlnnsY/cNDeiqu
         yA81MgSsVGfOPvM5GM5AuFYMGUqKABLDrVwvsuvWxbfF3YEYNo0HU7Ixvuqf0K7a/JBq
         aUMsUP+jbeAludci8haSbesR+MHDsI497paRoAxyhTQIsZuzqWvlJTbA3SJYUiq9G9Zn
         py2A==
X-Forwarded-Encrypted: i=1; AJvYcCXtR+gs9B1OcBnfgg7WNnPJGP71jw4PItNdWxOJXWtpHq+dE0y+RpFcxLTCgRlO8D68AqA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPssYCUDi4bltTRJVPiscXLknH4hWKGKL44BlgmL2gBhYNRlvx
	Fn9pHgajTmRv0FVyRYrux8u2c8Q9griZA/T5vceJbjjH/EZKarEa5dWYcyxZl2OnYhg=
X-Gm-Gg: ASbGncuzNpFCtnWt2kQydDKIm6rejRzvrw5s1UZjVM11Zf00Jl5qKY8tMr8bH3UvYLt
	D/ffnjDnPLJPTJ00nm5b3tzh/SVXWUu4OjE2IYJ5CnFz0gJgVzrBjDVXL4Pm7s0+tuyht/a+9nj
	hBuvV7u0phnKUYaui6DAcpL/BQeHoJRrh6SnQqsvHNdWhaT8F3g4cAk8P8j+juAQ3vOTLz9JpTo
	UATxTgc+V9luOs9UdrLJ38M6hAqqk58FZKcA2Fd539M2JTC0/BKbfQ/j62llvB9l4KcT0RYTe/A
	lEU/3EV5ivObQ23WeprHruh4hbGeItAOnKI+GSv5OMJ8RakvxgApoorMYXD9Oy2cSl13rDdL1LY
	=
X-Google-Smtp-Source: AGHT+IF2Rk2EMA7CUDmu9RW+8xww+gs3Pr2zOlxJ5syLEar+9EgPxlxS8SPmYN1F0YFp/SKDPm47gA==
X-Received: by 2002:a05:6000:258a:b0:3a4:f00b:69b6 with SMTP id ffacd0b85a97d-3a560760e2emr3033081f8f.54.1749734915582;
        Thu, 12 Jun 2025 06:28:35 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:35 -0700 (PDT)
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
Subject: [PATCH v8 2/6] arm64: dts: sophgo: Add initial SG2000 SoC device tree
Date: Thu, 12 Jun 2025 15:28:10 +0200
Message-ID: <20250612132844.767216-3-alexander.sverdlin@gmail.com>
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

Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/sophgo/sg2000.dtsi | 86 ++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 000000000000..51177dfe9ed2
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,86 @@
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

