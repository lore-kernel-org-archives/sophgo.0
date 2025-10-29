Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6451E32B9
	for <sophgo@lists.linux.dev>; Wed, 29 Oct 2025 00:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761696711; cv=none; b=MZYYt5EHZzl6ZVw/KWIF7je/u6hDdoAgsOTHIup3G7Rd0VfrNVLpEOWIJnucGliQaw6VGQbgo6R9dqwMIVQKtYVwRUC1LEMoefdYLBV2+z+KT/qpUWkKvGQ1d8Sk5Rgj1OoCPPNMWlhygBDXTzbUANSNy0m0F0ffV4FuKQSGf3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761696711; c=relaxed/simple;
	bh=8+c9C1dgyZPtOWEjKCHXXV4k3oa2GtS2iE6OQIMTaDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nD7bPh/30q/k219Hn38I2D3GLjBv6Uo8/dh6MiUI0B9c6LKZajwRsB1UuVKVvOi6vieUDCEmKrjnae6UstftdymIhp9lpu0HmQf1Fh3BRG+QMMyYNZV8KgdpA5OCsqCxBNJbkMewUd8IzQ6J5fJM+wRvHhvu4a6uLkO4NNksyHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvIxxRbg; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvIxxRbg"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-87d8fa51993so76728226d6.1
        for <sophgo@lists.linux.dev>; Tue, 28 Oct 2025 17:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761696708; x=1762301508; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9pgIB4Tz67zjDEuCaou8T/MZSYRwlTrfA6jaD1u7do=;
        b=GvIxxRbgS1cBF5KdWPzVSQTvnhp9rTMU5B5ckvNofbg+YMqe3lJipFMIjzb/toMKts
         CR3oo+SQg0kkfrJdRPivH0I34pC2VmXhB5rEPEXMLjlCgq3fkmJ0gkluU9aDtDacFfBt
         TloOhl/Ltjf/glnO+vvQSEKDFZQ4uSk0r65bqgt1Br+LQltfI5GSfwZdeKXKgt71Syaa
         QEEuhPdfF0QF29zMtbB6JDDnAD28UQ1R3ZUUDSYhn4t5gLbcbZuK64qXzJAhpP8j8o9M
         6pBgn383HSmmhBQGcF4NgdHqF+iOe2zI25Lnhmjd/WUajb4nEwIbsx0icOP4y8zPzXRl
         vZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696708; x=1762301508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9pgIB4Tz67zjDEuCaou8T/MZSYRwlTrfA6jaD1u7do=;
        b=LyJY9pGv07ZZVNnKArUNztK2wuu2J7Y/UwzUG+hwy5sBSBXPV2D+HF+kJJc8gT7+LT
         xYSsQS3ffrXlhXRZfizZU7MK+f1P2ZFdnTzLzO74Xa7CjZQX8RlTyPtc4HbZllFLY59g
         puUx0p4vomf4S190xftOyk3Y42Y2B7tHiRUJYNptSsGU/uOWVAn0bgKymEvZYD1YYwxf
         UvN7YD/i2Lwo+sDZ/PFCcNTRar2B0QNddvmgRLFg/B1KdOCqKYLZyJwjmjdylIPjGpvS
         6v/uCEeJ2snr/8HUEigDo7ulP6PFFeZHUzdrEOeXrlLzlS9/JC5wupIORlJGcXMpxPuH
         Hm3A==
X-Forwarded-Encrypted: i=1; AJvYcCXID8lX/OeoT1yHbHkae2x8AJ6rzSpgVlii04dtdLeoxfyAPvK8m8C8oc8NaVKq70Dj+jeLFLE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYpOdNnoHwrj5MOPl55Lv0Nubyxstc5MZGOstfimImMzXTmwX5
	BrE+3l6ddP5Cea1CBSM4ddGZ99z5ecMn8BzoUkf3ayC2/fDZVF5jxu0b
X-Gm-Gg: ASbGnctF9flDSb5DwKaNNnNxc2/R+myYhjH9zaUj+jbbz8JnQ2LOnkO40oNxoQeSESE
	N6qbGI95X3sDdLlgi8uVCf+1+iHBOHfsr9vpC1MA2mvH0f/7QPJtEHXP2LZyatFcT2Z2t/cLGbP
	y/K4lVKOOy9U6ecuK6+9fywABTjtWugdWkp03zYaA1HS+w/9NNMwOMWuOHTtkgA1nl/qejfjkcI
	mHqD1AMZBxNurTzZVDHxNltgRFXzQud/S2G2rPq4hAcsy8fnhjJs2w633bnZEdNvnlPi3Yzx02I
	8OoeLUjf0RAxF0P3RPmQJ2yeQjHRzj8DME+csmyiwFn1s7keCbL8YEgbkmRMih/oXJUDQtScxDx
	/6n9gmhJNknDRhw4H6RSAK88djBPKnY9FJj7pDJHOF+S+Se9aK/uUpoiF132QjKY+Y51eR6nmVM
	UabeVsDsC4KJwPvvqYc9N/AnSBLe/cdlptCg==
X-Google-Smtp-Source: AGHT+IFyKyBOAZv1RmAbtR9z53jqxuAJGXNiIM7ALtSRjvdVP7EE2a6cy6IFhiNFKgBsewKzfhE7HA==
X-Received: by 2002:a0c:f118:0:b0:87d:fc3e:6d9b with SMTP id 6a1803df08f44-88009bd6efbmr10961316d6.42.1761696708384;
        Tue, 28 Oct 2025 17:11:48 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48dee2esm87255906d6.23.2025.10.28.17.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:11:48 -0700 (PDT)
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
Subject: [PATCH v3 4/5] riscv64: dts: sophgo: add SG2000 dtsi
Date: Tue, 28 Oct 2025 20:10:51 -0400
Message-ID: <20251029001052.36774-5-josh.milas@gmail.com>
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

Adds sg2000.dtsi on the RISCV side.

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2000.dtsi | 53 ++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/sg2000.dtsi b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 0000000000000..412adacc00576
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "cv180x-cpus.dtsi"
+#include "cv180x.dtsi"
+#include "cv181x.dtsi"
+
+/ {
+	compatible = "sophgo,sg2000";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x10000000>;
+	};
+
+	soc {
+		interrupt-parent = <&plic>;
+		dma-noncoherent;
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
+		plic: interrupt-controller@70000000 {
+			compatible = "sophgo,sg2000-plic", "thead,c900-plic";
+			reg = <0x70000000 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <101>;
+		};
+
+		clint: timer@74000000 {
+			compatible = "sophgo,sg2000-clint", "thead,c900-clint";
+			reg = <0x74000000 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
+	};
+};
-- 
2.51.1

