Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67163BD62F
	for <sophgo@lists.linux.dev>; Sat, 30 May 2026 17:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780162536; cv=none; b=ICSxAh4KUOjWtYfs6oIzWcCD7M8u0MpDQzewpS3Rfi6ip37DmQOBmT3FCzre4z4tl6eApOGSi9XM+ECy/Dph7CdmUqGH+tfE8mEpxf6NsZzodR+laIc/d98BLGfz7X7XIIgZeQwI1CJvyvCIHvbmGikJxF6GCvcXZJf/7i5PHPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780162536; c=relaxed/simple;
	bh=tFW3YISywSwOMjdHnG6FZDjw1jg1AF8WKQoGy8w1cNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRIjJbY4KgMoeb1c8IZ8POs/rdL/Lc204LQSgCRY2qZfdg4K6IP1gX4Qg77CcaPwunXHO7RhPSUMsa5G92R5XjBZ/rl30A3jCbMAdLHIhDL5T2IACJHEr7B6Q7p4wa4fSprKFCL+Q3OqKocfwdE3NO0po3VjkZR7S4rNNlytJaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jO2guoTV; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jO2guoTV"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-91550dda53cso8979585a.1
        for <sophgo@lists.linux.dev>; Sat, 30 May 2026 10:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162534; x=1780767334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJAPLXH+JSPAdQeklsWr8qGoeKpyEbUrtjYWuQxTQmo=;
        b=jO2guoTVKCETTXuRG2tKquF6JoX4nGKkkUVtUrg5TFuYuP/7/wr7/6L9rkwbulUaUj
         u1mPnkc//kOV84oxG5kTZY/KeDjQG+GtuNRyUvrzZJe0ODatiONfouv+JpMPNV4XIGey
         ZaZlj9eReohwWaXJa99xXj4KaeMdswW5GXqmaYZ6znyb4eZKanM8K1r8gx7QEGwyo7pY
         JUdjyzflKMPIXsllDrs1isMwE4nYT0JxscGPmDPKD91P28mgzeSMHSzkXTRroCE/JDQF
         fANzvlVTJV8/7ezOkFrYvY95FlTqr+mDFyb0wVQskyfpX+WBH3GmWBTuYBYuwZCfL5YJ
         8R/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162534; x=1780767334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJAPLXH+JSPAdQeklsWr8qGoeKpyEbUrtjYWuQxTQmo=;
        b=iHtlYOVwSCct8w97sjdY8fBLiQzJ1R37ao5PebZdnjnuRrAfarEMthjmXdAEnFan8t
         BWLBR3iF2COuNnXfFgevQYTE0LLQ1F/8u8fPUgwtyKgy57pQ5FNhnnZRflKJr5WxxM9v
         k6G/+YsdGk7EYgA4ymn6otR5X1WTy3E/rFX4qil+7ZpjcKSnlZ53aYBRruX9tBPcI8oz
         nQ/RZcacxs9qmI0/UjHRihdrXm3oRLDgFMZzMYT4nY5NTypGNApFTW+42yXq3aACm4Mx
         AM/nBHJe+DI+bZ4TDNckB4WzfRFY/Fr1NVU5MXu+RtuK+KroAsMK3fyNSUC5/dkD5sLW
         QlKw==
X-Forwarded-Encrypted: i=1; AFNElJ/mV3BvQMcYDjfF7R4KsIzGvbCT2it/GAmtzHKBZfDV7SB3YIn5EQc8tqudea84qCm8VGa1kkU=@lists.linux.dev
X-Gm-Message-State: AOJu0YymVhPxcOsfEjUkYuyE+97eu+HbV3Hh0cMh3sq3widG+lc6dIiD
	yVwYvhWPcl9vlJT4OjjsV8Jl6MTpLyPj5ajE0pvhdfJ23cwGqSbe8hjg
X-Gm-Gg: Acq92OHqX76A7M73S9rcskbq2snbA8HVDKtAvGFaosA7t8oIFc7SOE/ineKh3g+KFIl
	BKjqcsw6l624efuR1wm/g7WngFDxwODt5sEZPG9stGREcPIG96+fjFW9f0o5oivN5xPBGt1IdYE
	l/C/uyqeOaslRBBaC5kxq2nlnZ/mCeMdCbqZLJWRO8iKYoGY81jZUtJRX7Dl5E3gXmMUY7aqqWA
	mQ2pPy/a7hxBdJXbFk9xKP9hrdcnKihnmiKcukCmsIOqNYt0CNKc/Ryvy9Gz3sIv3dgsEAnK04K
	k2HsAGkyqkAC0YEH/O9Cj8oEfOIgSUy/JHNPjyJLEAB6O3SddlYMaHNmXUrCGYVxHeMVxQ4FE0N
	4+8zZmY8XExndWtdCHlg/T9oujG7Wn5XLtmoLYmxazTGysjunXkk+SjDN2nFF1oVpf/0FcJEaDQ
	NcpsZ2u/UkkguL7KQ7LOtiCviTv1W2AcY8B+xWjvn93lbKxHdEx56+RPLUkw6srDZhX3kgRXBIK
	UVfnQ==
X-Received: by 2002:a05:620a:d93:b0:914:c82c:7a12 with SMTP id af79cd13be357-9153dbd5aabmr664027185a.38.1780162533921;
        Sat, 30 May 2026 10:35:33 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:33 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 RESEND 4/5] riscv64: dts: sophgo: add SG2000 dtsi
Date: Sat, 30 May 2026 13:33:46 -0400
Message-ID: <20260530173347.33533-5-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
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
2.53.0

