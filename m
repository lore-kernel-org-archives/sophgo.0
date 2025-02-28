Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5184224D6
	for <sophgo@lists.linux.dev>; Fri, 28 Feb 2025 02:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740710843; cv=none; b=juLG5pKBfyl3TrPDZr5NUBh2uI/rRNxQ0rbYXMCrYigUZealmbTMODxIACWOeO4HdkECsaEeJLOcMUHbRURVif6M3n7aoVRZZg+Joq821CEc9PSyDetofPsUE80oloKKwCIHIWxwgyKh+8fnBW6f3/e51e9FtIMF4BKY3c1Cxho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740710843; c=relaxed/simple;
	bh=CadUsZNuHdq8T8eYzHT8bwyZSzEW5VSwjR7Y6+NTUvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Nbh9c3kzfwVwad1Ym4DLQO9Qhwd9m2sjMgC/MUVTldVs7eO2MtgSf2dPgyYWuxbTVxnFdSG9rW5fFab7Ge9eqpC8IxbdyrUpOokEBH0r7JddEP6VzRrXYxalAznqtFR9mb2jWGJ5ZjN0Hu6RPFZVQY+ZpvfRfyeZ0SNXvyk4gdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=We6/PNLP; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="We6/PNLP"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2233622fdffso32447135ad.2
        for <sophgo@lists.linux.dev>; Thu, 27 Feb 2025 18:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740710841; x=1741315641; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HNAmch+SoEKe7ryjnsLMCAL7vRLjtwtIKcvaQelbSko=;
        b=We6/PNLPDviHs6onCI4r34Yd+RILMM4sNE8DvGdpL5cjZFJNM+ruoLRM5OgRm6ZICZ
         aZmJ7sHfiLrMgr4pm4mBNTTWmvUSIlVIgUeweKfY9V3ndR1Y1d0TaPEGUHeBMs1wyC6k
         kC02dO5Po4ONLAMPaFdAJ82Lh8PqZVYmBWs8Yay7Iz0fZPPm4li0zknV3EG9bVe/c8PH
         QKD8twMyDxi5GNE9ezYYdYgTc051EXdGEq+YboKSrwH/hIGPEDbAVvqSx2AGc6EX8Eoo
         8ZR5yINBytygeLVhCf2GsqUafu2bz8mSo6BDl5Tc2Ijgiaxx9gQbgth1nwT1qKW3gS09
         cHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740710841; x=1741315641;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNAmch+SoEKe7ryjnsLMCAL7vRLjtwtIKcvaQelbSko=;
        b=XKX6pAwOsUSthl4STl7/YW0jUhkQIuNMluf7mxGmm5J3CNowbUwnn8OGT2PFZDRv3V
         bsrSbaBnEA09lbccCr3v+UTVoCT+Yef50CVCysVQ/mFz9gQN9rg8oJW1XvoOQdG1CBkd
         n/5IGSKpzc4pjLZqDgevh/R6TtDZM3w1+I+/qJKfatR+1LUmNJr3nHlQRBabOQt0b3RX
         Ko9JkHGPxkDGERHYswoGy0SesBELB9KVnhRU1bEJtsSOmYNzgkpB4DhJp9JQdrp7t4Ga
         0Vn1OO/A8OA3kI0xleClvav4H0H+5375/usKPwb1vHE6X3T1ysLaqxZC7ftPWFY9PKeu
         OYAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrnVoo2sa1tI7xiOffsCWzSs3k+dqiXYx5z/MzU6JQlwVwXbmWB/cUD0DceLnilwMi4LJRkDI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuMiSiJa+Cn8k2jHubrG72uYiSxrdRg8XAQZ2/tg1K4gZgs/pO
	Xt7jLggUkx/4Vs1bMZygoaZAc4I/bhhSETsi13gYH243iLtRPRHg
X-Gm-Gg: ASbGncuukhSOfn/eCJSE35JWhBX2P8N5+Libw7cfuggJUNUiuKVDGmXtfDV8yFJNsjy
	T2dkehPHde8b1JZQVPOvtISnGMZV5UiKXBSDYY5BPsYjauL0fgN6eH/JNMjRCUWu/w4V9mB+hsi
	6DfezXFNWtCUIaAEkUp+ehbzY2g4KsVWn8lu3JwAcspYbBzUh4Xg+fz9IiAdOtmKfez0a5MAYJQ
	cxV5i2p4IgGM8omMHs7phBGRDbkij49Bdequem2cnYogI8fYSSLJTdApyAU3OLd1hgSfVF0TvWi
	8NYpQRZB/+ZfG4wUvvCW88P3GFAhHQi5lzw=
X-Google-Smtp-Source: AGHT+IEkm2n2GFsLQr1/cGIFrqEljjG/OBWtdluCiNaPZ5/OZL835Q+L806wLrDE+32pkVJUZep79Q==
X-Received: by 2002:a05:6a00:1256:b0:732:5954:a815 with SMTP id d2e1a72fcca58-734ac4259d2mr2702592b3a.22.1740710840591;
        Thu, 27 Feb 2025 18:47:20 -0800 (PST)
Received: from [198.18.0.34] ([188.253.5.104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe2a61fsm2563807b3a.8.2025.02.27.18.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 18:47:20 -0800 (PST)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Fri, 28 Feb 2025 10:47:07 +0800
Subject: [PATCH] riscv: dts: sophgo: sg2042: Add spi devices
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-sfg-spi-v1-1-b989aed94911@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKojwWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyML3eK0dN3igkzdVOM0o8TU5EQDy8QkJaDqgqLUtMwKsEnRsbW1AMq
 hYU1ZAAAA
X-Change-ID: 20250228-sfg-spi-e3f2aeca09ab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740710836; l=1648;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=CadUsZNuHdq8T8eYzHT8bwyZSzEW5VSwjR7Y6+NTUvY=;
 b=ThU7hdNRi9sZfNgaOFMZLr51i5KJl828qHO66z6YVkz8nA0MlNWjIq98bdnG2Y163XYGVp50R
 7XQ6dEHZAXpARYhDxSXLMK1oHaau0Rj6nwJL94Yv8K6DF2jeJtyD+r4
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add spi devices for the sg2042 soc.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 0fca16c469cc95aa897b6b57e0a287a687b4d251..d413daa47cf081f23284851db1eeceb3a157e9c0 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -800,5 +800,35 @@ flash@0 {
 				compatible = "jedec,spi-nor";
 			};
 		};
+
+		spi0: spi@7040004000 {
+			compatible = "snps,dw-apb-ssi";
+			#address-cells = <0x01>;
+			#size-cells = <0x00>;
+			reg = <0x70 0x40004000 0x00 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <110 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>,
+					<&clkgen GATE_CLK_SYSDMA_AXI>;
+			clock-frequency = <250000000>;
+			resets = <&rstgen RST_SPI0>;
+			num-cs = <0x02>;
+			status = "okay";
+		};
+
+		spi1: spi@7040005000 {
+			compatible = "snps,dw-apb-ssi";
+			#address-cells = <0x01>;
+			#size-cells = <0x00>;
+			reg = <0x70 0x40005000 0x00 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <111 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>,
+					<&clkgen GATE_CLK_SYSDMA_AXI>;
+			clock-frequency = <250000000>;
+			resets = <&rstgen RST_SPI1>;
+			num-cs = <0x02>;
+			status = "okay";
+		};
 	};
 };

---
base-commit: 9ef5d3235d41a6f5230d3ddf5eb994483853b3e8
change-id: 20250228-sfg-spi-e3f2aeca09ab

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>

