Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B541DE3C7
	for <sophgo@lists.linux.dev>; Sun, 12 Oct 2025 02:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760235996; cv=none; b=ke2ioq8+I6HbvDSnFnROcj71i+z58m+NKFCcn/bH/k59EUk7qzTrUh4aUqt87SWePIBbbraV0nh6YmExHoWu3Y6xuiF4rkNiYOeY+VZRiDUPpwssE0HCwcir5q3GrBeARl2i61LEVJPaue13A2Bzz45cDFePSEIKv1d2QAO/LTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760235996; c=relaxed/simple;
	bh=T3O+FvgSCE0ciL32Lxybza6PkMpzWQQ+tRJLN6YZEiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSooNQ/uMBn/e2jtg8R5Ww72G6ImgvQQSA/UkI39os7pnu3pQFWtO0vN9bkemMF9sRrBALgccQ0o46qYYkv9MT1tux64fblAcUML9lklOyXmXaxrvbEC9i8+G0uObEnzFbQZRZPsksm7XDdgYaE8To17x9ifuQT+gDFB33tD9pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKyPPGoa; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKyPPGoa"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7835321bc98so3102495b3a.2
        for <sophgo@lists.linux.dev>; Sat, 11 Oct 2025 19:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760235994; x=1760840794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfXUkC2C3C9BwOnkDvFBK7i0+SebLg1iuS2buoBW7lc=;
        b=IKyPPGoaYoPSgca0wGIxLDW1Y0JEPkudy5s7ODs6RP8b/PHrqZw4TOgYZmkDm4Urbj
         TxNfCAjPGHhJNRCNeZHRLIfpWkcOoDAi5Fw4VFQFY1w3aT5CDx6BrZ9xN7ijJGyl1uyL
         OJaIlYd7M2L80Xah5UEyF+pKlk7Ye/bTSJIcmqMabYm9lI8U5yRO8zLYVOD6o8vaHamL
         FJ0cx1JgMLfLAGKIXxg1gudusxmERb273DKSVitZVi5/bd8rf1TilWAA/XpO9p1mErz5
         /Ut5W3tge79wgEgS/7KnO/gWaa4gihQBYcMIFILDcymZ+j0inVWLIb3BupCQP+QB9ux+
         NeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760235994; x=1760840794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfXUkC2C3C9BwOnkDvFBK7i0+SebLg1iuS2buoBW7lc=;
        b=qBGr/nQR5wD4TrTqyovsY2hgse99t3ti0iFyI9dqANbvzktuaGpmx6H2Vn6s+UYvlW
         DF8tqF2zuTdbPku4SgxegWNx3tBJ2W/rPbUkPRk2F/AFtSZz73EcU9UAx06NAKeMb/gb
         OV7b9mN6W62NUVxMhztmEEcgp/MBoux3ub/FF+iY1xh7iD/J9fKTUv7KK4M0lKFZVzAQ
         YQUOg1yzT5R3LI3M/tA836pSgaF+TNIh1kVRTF8y9F+FfmYLDRijjGCHsVUfON4o5ICy
         oJIm3Ok0U4g38ARUTXAIwunO7Pa2jkMn8YOf7iOI3OesoMdG8Tl29Kx/IXJ2pTRdoV5s
         NwCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAzlcJArSiVxmvaXnwks1eedDN2oZq9fz45ZXk6UMzfbOxMLAdNlvJZxBDWwsLWV4E9VlRvjI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4081WeihrzyjkUm9Uvtlyq4SjXSYEHHqbTrAdKpriNT7EQtWI
	LWitBHIm4tcZUp3T2PXIcRzEAxr+sHVZunxDFbyU33WEyhwjD6oaWcgJ
X-Gm-Gg: ASbGnctQkEC1GvPB2PznUqmRfrQkWqkrcverYbKx2lRPceHfONaCBuWRUbC8TN9tf1T
	/iR9aUKp6Uov4iJhSGXug4JIItdJidNni521tr8aswLfpP4A4NjcpXZsZNi7MUhOcVBJz7+u2Eu
	s3Fr7Y6nHbxC74NTbQ05UmsjTATB4zpLBwLOR/w5tvWasCknAbVeJz6eY1eMKxV2xFnLcomIk3H
	dyZVv3ElqWGf3u/sPdnJ/e9CrH29lVtIJcDlh42+zOwEVsZLavupUddP0679KZ7koVzWe415zA8
	vEOcTdjcH8kFH3axTHm9FFXidyxVKYapIh9IyWeNXrShuyOD+cIakf6FjSmUEOvpUd2b5P8E+zE
	yrWiCcBncLC2xYcOUGELjLUlWhlieg9szQbPxC6E1dOmp8kzyOLx7Iu2E/BmYF03NY8Dh
X-Google-Smtp-Source: AGHT+IHZ9NyGaDIFzKfo3jw9RHib9r8nk9b6aSs/8IZVATsbwnwanfHCirNVwYIHZT/pMIdteZPgFw==
X-Received: by 2002:a05:6a00:391a:b0:77e:8130:fda with SMTP id d2e1a72fcca58-79385ddc9f9mr22273636b3a.13.1760235994437;
        Sat, 11 Oct 2025 19:26:34 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9992ddsm7180489b3a.80.2025.10.11.19.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 19:26:33 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 3/3] riscv: dts: sophgo: Add USB support for cv18xx
Date: Sun, 12 Oct 2025 10:25:54 +0800
Message-ID: <20251012022555.6240-4-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012022555.6240-1-looong.bin@gmail.com>
References: <20251012022555.6240-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add USB controller node for cv18xx and enable it for Huashan Pi, milkv-duo.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts |  5 +++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi           | 16 ++++++++++++++++
 .../riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts |  5 +++++
 .../boot/dts/sophgo/sg2002-licheerv-nano-b.dts   |  5 +++++
 4 files changed, 31 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
index 9feb520eaec4..0e6d79e6e3a4 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -100,3 +100,8 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 42303acb2b39..1b2b1969a648 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -432,6 +432,22 @@ dmac: dma-controller@4330000 {
 			status = "disabled";
 		};

+		usb: usb@4340000 {
+			compatible = "sophgo,cv1800b-usb";
+			reg = <0x04340000 0x10000>;
+			clocks = <&clk CLK_AXI4_USB>, <&clk CLK_APB_USB>;
+			clock-names = "otg", "utmi";
+			g-np-tx-fifo-size = <32>;
+			g-rx-fifo-size = <536>;
+			g-tx-fifo-size = <768 512 512 384 128 128>;
+			interrupts = <SOC_PERIPHERAL_IRQ(14) IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usbphy>;
+			phy-names = "usb2-phy";
+			resets = <&rst RST_USB>;
+			reset-names = "dwc2";
+			status = "disabled";
+		};
+
 		rtc@5025000 {
 			compatible = "sophgo,cv1800b-rtc", "syscon";
 			reg = <0x5025000 0x2000>;
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index 4a5835fa9e96..aedf79f47407 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -86,3 +86,8 @@ &sdhci1 {
 &uart0 {
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts b/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts
index 86a712b953a5..b1853770d017 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts
@@ -93,3 +93,8 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
--
2.51.0
