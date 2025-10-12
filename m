Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62031D5CD4
	for <sophgo@lists.linux.dev>; Sun, 12 Oct 2025 02:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760235988; cv=none; b=m2iUKu8QX00Zoaxl9bRp4wnwldvmKAi35CUOazwZ4ZOjW3picD5X1532aBzUjbEAgJRGXVh+Pl0CeFDEyK8OMMlvBsWNwyIA/vD+fWUyBRRNJb70q+0ikd+0kbdWtIKy5QDyl6f58ZYzZ1VzjkAe5dzHKW4Y637R/JU8cF/SEqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760235988; c=relaxed/simple;
	bh=PFIur9yyt6yU7rC5ueBW+ZogapM3+73LNvnZQ9/MQtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mmyh1C4SqVkQrRoSCO7S9cwxO8P+90nNLSKimhzS8KIsTBCQeCTXl3YlIk4T4/mInk0BX74YVj+vY21qr9xNJHG8fQwwSeFUHj3lAM8VdoCU3QjpgPEpRx3h9Z6e5GaIaSBED6hSg4Lyo0ajwWQRICDbfNRy3PfLwPgO7NqeycI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GX1PferS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GX1PferS"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-79af647cef2so459750b3a.3
        for <sophgo@lists.linux.dev>; Sat, 11 Oct 2025 19:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760235986; x=1760840786; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oeNoAqAwXapHedMDzgCFy5RYkdc7bA8wxszUU7mEjE=;
        b=GX1PferSj04i62YuQmNiWPukXnvZYIIPwNF8IG4NS/Q55EbxrleBA8PS3VrfO4XgCJ
         AgghZdQ/o/KzTzrQLpB7wn6BjIHrf+lfXPR8sDyQyFws7S+KyobkQf+AWTlk+UwqRWw/
         U2lcYtWveFT90dFMFBcif1zJ5/SuZ14Fk/2CbY7wfaVQ5qYa1JU88zSCQxFzHL7qWdmd
         8tLtM7A9NJmo8ofID7y8Sdt3MPU75yiGJkrVbSj82kyOGeCUvuztpUqzPl5DqMO1zb/4
         9IJGf755xCrIE1qiWafoqP9TZb83MxEHilJrzy+434SmHqAt5CQ9vit+fKuxsWRU5Btl
         Gbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760235986; x=1760840786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oeNoAqAwXapHedMDzgCFy5RYkdc7bA8wxszUU7mEjE=;
        b=rEyITfV8shYNCytAUn8F8O3PEE2MXLASwzINuuDTH7MwqRqYnrlvJXMkk+Zf5cdJSa
         dW2dGSb3aey86BxRcWPbYexc2Ib0EUvH6NqTj0bHP8gQ5t+RTAo5DXyob475kDlJoqco
         FMnGv/UH3J3w11Gaq6BSNPDAwpiz6cfPqe6lZM6Gp3m9Et/3FZj5MC/Niwq7mytou/hC
         EzDsEMnbYGumF+lgL/b69t4ma5Vob2LaZi8uYruQz3W9eUsfF9Et9+y9/JdeLYHqSKax
         1azlkxLxvhiVqodPtP2MCYJUeXQn9leZbFx2RdGsr7HozjsjWqVr3bk8nTW6ScFN1nVQ
         r9/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKAc61h0rdOvAp01Q1M/iDzJGBP8A683t/EnUW7hBZnLZxUdZsaWCB8b57tGPl++CAK4w2Ri8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1fXOg6f4FitBlq4iluw3UWc5R4z9cd2+cgOaw4N5lrA5lVnwn
	Ha6JPbZEvAtkAx3aheJfkTOWfhkgctjXlI7Wxrt3bT1MV/8wAsspiCAg
X-Gm-Gg: ASbGncscj1Olg1DGKP8trIUeWX71nJ4BP1W/Ljfd3oeL0KoGTZHNlan+yCxrrHGEphu
	fH/7tzR4O+AUm+tZzhlPdSt8C+faCqvFq/9gb9WWvtR64qTmooGQeVHw3+U0qC/Xg83QPs0mtre
	a6Ug2y523uJMkVeZCDpFf1bpepmDMXRygoVfl2LS3NNWoD8YXM+/ENtNR97xg8FqXkFpYC8ZWy0
	zgqdj534oGFHY1GW98ybZuKXlE7vH2WFnjdrSOSh2Ue2wnIdWiOXLuMqond4gKhujGptgpMmGsv
	w5U5FiUs6SM8L22a7D08u0QPsXoVpidj+7WVO7lZ5RaLxwrB7PIvjBfYLpeDuLIsZQC4pxwJivY
	kojsK5GZ8eP2LcL+PMFS1Zc/SWROmRGpPX650uLFzKQJIJTQgt9hXFydSsQ==
X-Google-Smtp-Source: AGHT+IE2GiIjqdXwdPD/DjVNY5FvlpNDYD6mAOE9DF+isXGRIky0pgWxkfR4Ic5vWRPwpbzzqM4c1A==
X-Received: by 2002:aa7:8892:0:b0:771:e4c6:10cc with SMTP id d2e1a72fcca58-79385324d9bmr21779339b3a.6.1760235986084;
        Sat, 11 Oct 2025 19:26:26 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9992ddsm7180489b3a.80.2025.10.11.19.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 19:26:25 -0700 (PDT)
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
Subject: [PATCH v1 2/3] riscv: dts: sophgo: Add syscon node for cv18xx
Date: Sun, 12 Oct 2025 10:25:53 +0800
Message-ID: <20251012022555.6240-3-looong.bin@gmail.com>
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

Add top syscon node and all subdevice nodes for cv18xx series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ccdb45498653..42303acb2b39 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -25,6 +25,32 @@ soc {
 		#size-cells = <1>;
 		ranges;

+		syscon: syscon@3000000 {
+			compatible = "sophgo,cv1800b-top-syscon",
+				     "syscon", "simple-mfd";
+			reg = <0x03000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			usbphy: phy@48 {
+				compatible = "sophgo,cv1800b-usb2-phy";
+				reg = <0x48 0x4>;
+				#phy-cells = <0>;
+				clocks = <&clk CLK_USB_125M>,
+					 <&clk CLK_USB_33K>,
+					 <&clk CLK_USB_12M>;
+				clock-names = "app", "stb", "lpm";
+				resets = <&rst RST_COMBO_PHY0>;
+			};
+
+			dmamux: dma-router@154 {
+				compatible = "sophgo,cv1800b-dmamux";
+				reg = <0x154 0x8>, <0x298 0x4>;
+				#dma-cells = <2>;
+				dma-masters = <&dmac>;
+			};
+		};
+
 		rst: reset-controller@3003000 {
 			compatible = "sophgo,cv1800b-reset";
 			reg = <0x3003000 0x1000>;
--
2.51.0
