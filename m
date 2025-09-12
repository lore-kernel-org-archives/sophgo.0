Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336EC1DDC2A
	for <sophgo@lists.linux.dev>; Fri, 12 Sep 2025 02:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757644623; cv=none; b=Rx2d0qq/BPBIsub9IbCG2Ccs5Th7hnS926VqC6CMjU7CfEjRjKZh2BTST4GlfHZ37VeWKaHMw3jY53bhGtRlwZ522I4vECrfOdAARW+ZOuW37MOHyAMZtrV81sa4gC3pClwsUsIChUNDk6Eu4XFDgLX66v9KpymDw/4GgeMwfe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757644623; c=relaxed/simple;
	bh=7smwJj7dQIrNWzLpxsZgOxIEd7UE823bj8z0yhG3OBw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ie0VKmsWDVbhOICVaSoItJoCt/8w8qfswX2ibda4RQRHaFK3gpFjLWZByXwncV+Ue0gD/CCSeRQVSR+dSB6J3N9lRw/8pB/CZCtpJDXuVArjq1EYqnRH/rh5wNSnAZRMH1NYVt3WxgMtx8TAfdXRvNU2t2/Sy7ZfSDgK8L6aqQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfxbzsgX; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfxbzsgX"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7459d088020so757933a34.3
        for <sophgo@lists.linux.dev>; Thu, 11 Sep 2025 19:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757644620; x=1758249420; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvwjuScXFIOkNO4l0NAjh5hmUBFBDILktbVX+sGXQiQ=;
        b=LfxbzsgX0dFxBrjoEBq9Ow1A5v7b3EeB4NRk5xFBIBOEw4QluF9VPqD+3WhI2Z8keU
         AXS4/jszeKsaRkSOpYFKvCiflcB+oZOoEkvz35z/QYzWi2F70ZYb5wnMgfWsoQTHOaPl
         qcHIziaBRqGEHu+BRR4/ZQshVW05CnYvjICdqPIIXbzmEab52KV7OQo49PsnHewRPt26
         ppa/hV2jGdTn6ep4cX2Sk7Pc+RGdHoDdSS45FU90WfS2nDMy1qRgw9pvpgzcGiy/i5Kb
         nIWEmY77/o1GwV96s6HrGOHP57wPB7bT6a4W7+SFBTF4VWVlwovApHHHnxlcj2+EE+M7
         2IWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757644620; x=1758249420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvwjuScXFIOkNO4l0NAjh5hmUBFBDILktbVX+sGXQiQ=;
        b=lLsZaOOzkFYGvqwLSKs4/mB4G9q6km+dO83MOkWUntD5SRegDhK+ZC9zwex01MpoHs
         k6a++MFnJ9Ijk54iSVnM3asux8QaDIqmeRFPL6tuiExGHC7Sp5WljLEHMicIdbcQBvsm
         rk0naCyPxmtULHLhbRHntzDPG5AD7GfKdp4fBTYoazH/3hGBLlh5GMWXNKVssCMsjniM
         xaO4C1MpEnC5A6BNlu2L4uDQfdTU81RYwUoBcb9gJ0uzF1ZlwYMB315hNAIyOxg2Q7Pd
         +pfVqEnDIeJJ8gYrgm8R6vwahLNAKopObZ+DqfHMWIpL/Qvvmek69lKZhtGmIBbhcxTe
         PyZA==
X-Forwarded-Encrypted: i=1; AJvYcCUN1/ae7NcgH+ndlLqEdFNjPo8XB5gI5v0S0d95OVGzsRfW/3Y4ye1IpLbdh5B3YFrUn7/R1+4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyV7P0+zHqHnNYuGYYVHN5M4Q7aVgNq9zYfgPkx7wYaXzeVzh+9
	IrzqlfvCzkVacvND0u3EI20sFKVyY6SjwLSyLssixG1eq5aID1l8NRPo
X-Gm-Gg: ASbGncvYvzZJ6Mv+y6oteONNPZBPXu3yqRHFUKQxB/9n0MX99qLa6yF6A7Iqe1r06So
	3mB6XS5wjfsedDpdBKMgduWq2L0VzSnmqXk+NWn1DTFQEms1grjKuEKf2vLlJxVWPkqE47hrX6y
	bLRUxT0jtnDGs21SE+aP3zB8dSAseJoyWEIWKF6/YA6YhBkr7cYH7taG1XEf5e6MmlOKKA4N0HI
	Hu9vcxw0RcEGfZYcPGXn3/gTozcF6tF4K4XTxtAmkvceLRD4XRffLStnB57d90t93bsjTOKHCtA
	LL2jvHB+QQlcmzoBtoicRpVg788+xWDaLS7yCJXEpYXWls6sFgUW5bLWq1lRRb2sXrabtxrJX7P
	mYdKJGYoA1KAdwBW2+KmjdlRYvCJ8f4ME
X-Google-Smtp-Source: AGHT+IGyuP3/R9DH/EcaxhL/iQY5WFNGJfVttr0Thdfkkw6lmjBCk6VyxF13AjSvDr/I+XJlRFCejA==
X-Received: by 2002:a05:6830:82f7:b0:745:9a08:c9b2 with SMTP id 46e09a7af769-75352d903f5mr897685a34.5.1757644620197;
        Thu, 11 Sep 2025 19:37:00 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-621b7bf520esm343900eaf.7.2025.09.11.19.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:36:59 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com,
	jeffbai@aosc.io
Subject: [PATCH v3 4/7] riscv: sophgo: dts: add PCIe controllers for SG2042
Date: Fri, 12 Sep 2025 10:36:50 +0800
Message-Id: <828860951ec4973285fe92fceb4b6f0ecb365a2f.1757643388.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757643388.git.unicorn_wang@outlook.com>
References: <cover.1757643388.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Add PCIe controller nodes in DTS for Sophgo SG2042.
Default they are disabled.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 88 ++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index b3e4d3c18fdc..b521f674283e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -220,6 +220,94 @@ clkgen: clock-controller@7030012000 {
 			#clock-cells = <1>;
 		};
 
+		pcie_rc0: pcie@7060000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x60000000  0x0 0x00800000>,
+			      <0x40 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0xc0000000  0x40 0xc0000000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xd0000000  0x40 0xd0000000  0x0 0x10000000>,
+				 <0x02000000 0x0  0xe0000000  0x40 0xe0000000  0x0 0x20000000>,
+				 <0x43000000 0x42 0x00000000  0x42 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x41 0x00000000  0x41 0x00000000  0x1 0x00000000>;
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
+		pcie_rc1: pcie@7060800000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x60800000  0x0 0x00800000>,
+			      <0x44 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0xc0400000  0x44 0xc0400000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xd0000000  0x44 0xd0000000  0x0 0x10000000>,
+				 <0x02000000 0x0  0xe0000000  0x44 0xe0000000  0x0 0x20000000>,
+				 <0x43000000 0x46 0x00000000  0x46 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x45 0x00000000  0x45 0x00000000  0x1 0x00000000>;
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
+		pcie_rc2: pcie@7062000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62000000  0x0 0x00800000>,
+			      <0x48 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <2>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0xc0800000  0x48 0xc0800000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xd0000000  0x48 0xd0000000  0x0 0x10000000>,
+				 <0x02000000 0x0  0xe0000000  0x48 0xe0000000  0x0 0x20000000>,
+				 <0x03000000 0x49 0x00000000  0x49 0x00000000  0x1 0x00000000>,
+				 <0x43000000 0x4a 0x00000000  0x4a 0x00000000  0x2 0x00000000>;
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
+		pcie_rc3: pcie@7062800000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62800000  0x0 0x00800000>,
+			      <0x4c 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <3>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0xc0c00000  0x4c 0xc0c00000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xf8000000  0x4c 0xf8000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0xfc000000  0x4c 0xfc000000  0x0 0x04000000>,
+				 <0x43000000 0x4e 0x00000000  0x4e 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x4d 0x00000000  0x4d 0x00000000  0x1 0x00000000>;
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
 		clint_mswi: interrupt-controller@7094000000 {
 			compatible = "sophgo,sg2042-aclint-mswi", "thead,c900-aclint-mswi";
 			reg = <0x00000070 0x94000000 0x00000000 0x00004000>;
-- 
2.34.1

