Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CD8267B90
	for <sophgo@lists.linux.dev>; Sun,  8 Jun 2025 23:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425395; cv=none; b=RhybvbHfjg+LEzR68Mvpk8ZaS//xw8/IRKRc1iBSUoJoAPk6TjqVVDzhhjg9UMNbh6ORHVmwsuUNdLSZrUBPvQo5pKAPRAhmcGHd8awjM6aQqKSXbwo3yr0SPn8NJIgVMmJdy4V64K5stdOWIUjqVh8eQGF6fHxgXpc34tD9m+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425395; c=relaxed/simple;
	bh=IPKyQjpwy+vLXCBDiOQVfNpLKtpiZoWJuJN0aCh8Vw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rauF5JSqQeYE+mufQ65jkFcWUZIjnBH9PvQdJNKJOgICzGX6Mgb9/nOPNrM7avCWUKUOKJ/a19+iS5HFQgkWEA8TcFlq4YZnRMeaJzgGqacPhrahP1F7dSwkGv+gdeZB80RLYxI4M4W7vSKMqBgp9Dy6GpFMuS7kLqlxp+NqJlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKSw3J+R; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKSw3J+R"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fa980d05a8so37335616d6.2
        for <sophgo@lists.linux.dev>; Sun, 08 Jun 2025 16:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425392; x=1750030192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e01iukVTtzr1W38d9A787H6idtfIXQJY27IM4e3no+o=;
        b=VKSw3J+RnEIkojpm2HiKngvtp9L9Fs47lJivZL0yC52jWlBctl0uqdkijR2ktpH3y+
         7Xb0tY0P5WhEyWDgGsPgtbZM6jjBCqr1iSnBRqrARoTY8t14StEPStypaIGXBspVKPix
         f4nb+Rc5muWWyI0anslE7/i72PUBCudGwAP3kLi/t8XxdRXTitUIe68gysiv473aff0o
         Br9MWNbxtVMifEvFiZKW++3xXKXEOyW/nXMGbdd0UBDsXzmLaj2TufQNKcrQIlZwE87A
         wjTt2C1cO0iFJNYFZ82y4DestKWAS80ITVzaat1ibUBCILjmZnXWwQ/ISgrXvQsia/ca
         jsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425392; x=1750030192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e01iukVTtzr1W38d9A787H6idtfIXQJY27IM4e3no+o=;
        b=M0scrqg6NRhWIOspko/IpuUdXzjOOJqnym9eRXUQbgEAYgARrXjywd1YqQe2WlkrLV
         rIPYdoYoss28xJ6iTknBOiaNSjkuD8gfvnPnPcM9GtyofoTq4nri+x2Gb8eGpB2g96ab
         DhqmF6ng7dIzgQlYx2AtlfxHQGCIJC2lbJfZTBky5+CL069DiztHIr9XjvorqUcABZdU
         IEI4hIc79kthVyP9VdJXCqemwZTt+A41x+lfdKxE8Z6Y5y2sj6HPiMfMT47DXshdiJ4r
         JVG1VdW4Z8Aws0SielB6e0aGRvNK6U0ZOKVn8GnHNUVT5CNpgeiZTe8nGCFow/8QmqfE
         nCSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/+XJG0oNaye/aUuVSV8N2zChiAyJHnZhPUDBLwU9ZX65SjEa15jpWkT1blQiTi0U9wSv0Azg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhEFdC6i6mudvSOg+D23gEzYntGXeFozMM6U7wPWDDBkSHqE/4
	jE46QQFPtpFSpmObkElE2wDQ2HnRm9ki1We6D19XmWjU+GDawxjw8Ywf
X-Gm-Gg: ASbGncsxvxIkjq3FrJQ3WYc3peRa8qAvfLELrnYmHGvy3vVSCwPC52+W6GlBS3+yU5a
	ygZjM/91UQ+QkiZdHnIMo5GOtP31sjY/rWQuUYP3FfVuBiczVDwgbpA6GbSCyczEfwAGwcXnJdb
	CS1RZEqSAjcFAFw0qWfHK16tT9QOZk5xh2MfBJTrxXZ783t/F8yboemWa5xaKUyjkN4Gi7tfMe4
	HBEDmsa94grair7VNqLG11/w14myemwcTpGmSfgS+lULuRc9JdNJH9V3tdrsiVrSwM5X4k9qbS5
	cyHphjH2mRVJk2H0RM/Flqeo00uqY1Cc3a30KQ==
X-Google-Smtp-Source: AGHT+IHI4CDrPXFr0/NZvPWIdM0m0CmSVQ7zO1EJkq9vwOjsqhwAlmzwrnYunhr2lKOAZxXLpMJWNQ==
X-Received: by 2002:ad4:5ced:0:b0:6e8:fe16:4d44 with SMTP id 6a1803df08f44-6fb08fcc15bmr200667496d6.31.1749425392442;
        Sun, 08 Jun 2025 16:29:52 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09aba066sm44196886d6.17.2025.06.08.16.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:29:52 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 03/11] riscv: dts: sophgo: sg2044: Add GPIO device
Date: Mon,  9 Jun 2025 07:28:27 +0800
Message-ID: <20250608232836.784737-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO controller is a standard Synopsys IP, which is already
supported by the kernel.

Add GPIO DT node for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 70 ++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index d21a59948186..70d1096f959f 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/sophgo,sg2044-pll.h>
 #include <dt-bindings/clock/sophgo,sg2044-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
 
 #include "sg2044-cpus.dtsi"
 #include "sg2044-reset.h"
@@ -90,6 +91,75 @@ uart3: serial@7030003000 {
 			status = "disabled";
 		};
 
+		gpio0: gpio@7040009000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x70 0x40009000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_GATE_APB_GPIO>,
+				 <&clk CLK_GATE_GPIO_DB>;
+			clock-names = "bus", "db";
+			resets = <&rst RST_GPIO0>;
+
+			porta: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupt-parent = <&intc>;
+				interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio1: gpio@704000a000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x70 0x4000a000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_GATE_APB_GPIO>,
+				 <&clk CLK_GATE_GPIO_DB>;
+			clock-names = "bus", "db";
+			resets = <&rst RST_GPIO1>;
+
+			portb: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupt-parent = <&intc>;
+				interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio2: gpio@704000b000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x70 0x4000b000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_GATE_APB_GPIO>,
+				 <&clk CLK_GATE_GPIO_DB>;
+			clock-names = "bus", "db";
+			resets = <&rst RST_GPIO2>;
+
+			portc: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupt-parent = <&intc>;
+				interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		syscon: syscon@7050000000 {
 			compatible = "sophgo,sg2044-top-syscon", "syscon";
 			reg = <0x70 0x50000000 0x0 0x1000>;
-- 
2.49.0

