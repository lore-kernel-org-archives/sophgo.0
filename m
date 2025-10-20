Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575822EC559
	for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760949597; cv=none; b=c1hhjVGFUOMKL8Y4d+3hj+i/uLxwZZ8gKEn3IfABp1u1Pdjto4DtSJ0AQO/e6KYT5rhIre8NWH1j9k4unZF65/LShEqfvv2kWr+nHDDDcyCU97XgGCTI+kFzU1n+QS5Hq0BKYjoc8WLC3YR1kZ2/Pevr3SQqo9/Djarg1j/CgTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760949597; c=relaxed/simple;
	bh=g2wucMqTimj4B/Ivo20ub1OfTsfZvS3GyFBla5SPJKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ts899a58MyGO/Wa+KAwbogO8OKbJ6IWCCo/U28Xs9s/jPXV77KBs4bf97T/NeIJtpRoTzA7zBc+LIIxbhbFk4VIapP465zT2ltsucz95sacfGQb869rPb/qRtno7cinPBqKETdSw8D87SXtI8wRdFX2D4zcQumzxx8MvNLwBVJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5L5r21B; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5L5r21B"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-781db5068b8so3122035b3a.0
        for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 01:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760949594; x=1761554394; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Der7FNf7I/75zOWZ+nH7KDaewc2YUf74Wn4YmPEFp9w=;
        b=H5L5r21BkbxPZ0UIVr+iB6orvP35Qut7VGi1+RgwyT/0Kyqm8z1LegmE8J9RkNllfY
         8NuZAXSL9nDkkNs/Gyqo7TnbJg386LDanl+BI1CcSZn+jR1IcfjUK2Oq3lwtbUxz8vjG
         W5JpWRrTsBmZH47V13Pf09o9IQLJteUX50YTkWMKZ0BL0QdA3JhV7nEpO1F6KJz5gBzZ
         ZE/OuxdJ/BVyo2E2R8ULIYeAm6Y5Dn8EQlzf0AONHxz4MTjUdGuw53PckjuSfDzBg7rq
         owvxv+XIatiOJ1QEiaaU23oIV4urcElZpQ8U5p4olBJIpnoSpXg+3mwiadDOZhK5wgms
         fzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760949594; x=1761554394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Der7FNf7I/75zOWZ+nH7KDaewc2YUf74Wn4YmPEFp9w=;
        b=l1ST4yVib8CCNYbMY2ICTHxCNxmXGdVKiZmdWRH9RC/TaEWO5yx9NsCzgHHnfTlIEQ
         KGsTzonjSRMMwDDptYTdUINBgY6AuOlT+DsPO0lEQ1IbMWPvd3+tOiG4+ItTBCIHgZJ1
         Ck5kLGLNcmeiOmk13lk2Jy91ilaQ1sYHngf8+99806vtef/zvKaheEq8rv4m4lznBObR
         MIaCMAKYBFg75rUTZwI3tVvnBmzDrh4YfAnWyONMxNDkMZoabsA7Dl38fCFbcgnMtTLt
         Kqtd/4o3cwk43Xt52939onwLOdRQZDF6ojCwcih99QAoiMqTno9MQ0EAHNuD52R6x4Fh
         PQiA==
X-Forwarded-Encrypted: i=1; AJvYcCXtlCaT+rax0Fv3jcHz+nhaKf9n+JGDwyooCHIjfILEujs9Ek0dXoh7YcuDLfiFZJqDaRE3RB8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIEPNUts10GBB6+LChOWj5v/YZ0PxZkSuOOZYkhNKNvnAutMEu
	mHS9gij39HYhPwHvU3jxjioVacx/vp5P4D4Hnez2Q1kf31n4UdoHl36T
X-Gm-Gg: ASbGncvEv3kn9XgzTIDeVIm4fzGo59cBcGblNfX/5MVAm868NRcHCsdrZN/kl2mxNo6
	BehWcdmSWZ16wyfMEf/40sCW8PfKH64Ni9P8Oz1QPqAlrhqCtU0xJwifi414zf20aX4YPrZX0Nk
	xvcOgTyi1GQIq+AH0Kt62dm5B86XqMqv75pzIm1yo3NrnsizC6x/vuET/UDy3D0A9lBHoOFqHZm
	HjUVwPjKjSPrFkoHvcDginZza5Fc/vXQ3GWIUubciBeNW1nUSDi27Ma60GadIMkAy71RU1hliMf
	s4GG81iOCX/g7JcXFfpW1aLbGQEarvfeCVh6LsC8iQBDeh3tgDPqvNiX4LP9HIrwkANk7uMtUge
	grAsmouh9ANxQ5Ph+AIh+pe/+owKDLP1F2vLyAuhN5tgmQktITrGS8h/CryAptb6SU6aB1+3rua
	oeRZ9CIoU/sRD1ZXbY
X-Google-Smtp-Source: AGHT+IH5hJNrWZcw8SGaOXSO92jouYGCNb4bb6h9USPjEKev2+BmrDNRUvPUZjLgcO+zgva54ShEvw==
X-Received: by 2002:a05:6a20:a11e:b0:334:8d0b:6639 with SMTP id adf61e73a8af0-334a8522be5mr16850362637.10.1760949593658;
        Mon, 20 Oct 2025 01:39:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b5d0b4sm7062386a12.29.2025.10.20.01.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 01:39:53 -0700 (PDT)
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
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] riscv: dts: sophgo: Add USB support for cv18xx
Date: Mon, 20 Oct 2025 16:38:33 +0800
Message-ID: <20251020083838.67522-4-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020083838.67522-1-looong.bin@gmail.com>
References: <20251020083838.67522-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add USB controller node for cv18xx and enable it for Huashan Pi, milkv-duo.

Co-authored-by: Inochi Amaoto <inochiama@gmail.com>
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
