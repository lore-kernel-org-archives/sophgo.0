Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2730230274
	for <sophgo@lists.linux.dev>; Wed, 10 Sep 2025 02:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757470165; cv=none; b=q5bqf75p+UAqrhQaRESYlQWcswoPKec9GvRPvuDxhS842U1rZBHxqPxl0FdPAGjGmYSZb4r/whjkoC0nKaggprmu3xW93qM0qhcgPApYZaDyrsRIUAO2+UcuoP9D3Q9Lv71YT70zViIf0MmeIYFpozfi6YlhbczA44V3R6Y//DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757470165; c=relaxed/simple;
	bh=7smwJj7dQIrNWzLpxsZgOxIEd7UE823bj8z0yhG3OBw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iOMVJGLADnnbFBQS65rYouRnxBI5OcXpbNitILvDCpEoO1mmqlhnBUwjYPRykpMKXQyNGROxULsRAwf1jOOk+TnvQ1RTRikUmQXRODVUM3Le3kRJGhb15HTLdyNkkB1PiJTRrjBShtviUoWxoZQW99I7UvtILYJoSgJqJa8vCaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D21eH5PI; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D21eH5PI"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-807e414be94so617679185a.1
        for <sophgo@lists.linux.dev>; Tue, 09 Sep 2025 19:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757470163; x=1758074963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvwjuScXFIOkNO4l0NAjh5hmUBFBDILktbVX+sGXQiQ=;
        b=D21eH5PIyZ44rZ9Q9YyjczTqD1yPWSJecjJ71OjaVDLfpn0uUxicH33UrfHCjejVFj
         7udvZ1RMcieqHBLvWMqe+aa7Sw1qAdDpkkn1/Ih3fvNwbFdbMdy60XRKWdnFEQH2F+xq
         RCB79d0GX8cLGQa0L1dDL4BQ9IVZAX9k6jgnVHMuPDu1mEM5guoSfWVt1Wtg2O0o/1cV
         P3fpzppHMms1hyDwDwVc320l9iXtpZ6b1K5UinkXZKXq/TifCbcjDPUpJDHhn2S/FQuR
         kAwEameOBDHLyxxQxfporkggJ/yfOZZUqB9DNJW1i8Up9F6XKF4fapsl4+Rc1htt7Ags
         6Klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757470163; x=1758074963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvwjuScXFIOkNO4l0NAjh5hmUBFBDILktbVX+sGXQiQ=;
        b=PXPOZ0lVTAlDT9K6BkZvlCTXeoVs1v1+2ISkXLBOTQSv+HEY8xYyMMIS057fzd1ZNw
         I5Bwahl3XXSTZ1JOo9GATtDlT2aQJsA0rC2PJiGsL8ew229MsUiuML9s6NKIEqbVtAuE
         HVwvwu52Qkbec2+XWFXWMF/q4vNTMA7Hj0v81+3WqcjzF2M+vHpNYm3463IbvDhEaXAL
         m7P//stYYMjwp0+hpqjyDrZOlOOPC7qW5jzGyvZGeG5karAHTWPFRaBL+rxpgusz9y05
         JVJTRF9CNy5p2svftHy8H+yzQrBEtK8eEZzqhAktIGm3lTQqeIKrMn6WHsrcumfR/XQb
         I2lg==
X-Forwarded-Encrypted: i=1; AJvYcCVh073KAMVAka00HvuUGDzKQId5fBE4GYnxhXh79Uu1vJ44e/FCeuHHaJTKc0Y1CGxlputQHyE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8Towj2Dw/QB065ilnFkKml6BIB2JWylxupM0q44s7TtheEYW8
	CA8kMiEyxaH32Vaf79EcJiIeEFioFjDCcfFDI3SE8gEeljbdLv6mZUax
X-Gm-Gg: ASbGncsFVNFkwqYj3wAIWu34e8LmagBbAK16xAMbCDfpUOg2PEwULRktYEDOfLd2fiH
	NTvU8nsx50tYfsiisY5CR+zQotBaLDvjey6xZ0LzFo7nZrAUMBuB+EQMhlHdrOEcfWxPPp/zlUd
	U68Ma1Uj9Us98FfxCeU8B9cROOqO7/GejpkuwRNmM8bFJ7t3KH4YN+YMAql2K+afTjVmIwQjI5P
	uSTFC5Q0lzwW+Chf7afclxVhk8lpYrP0sNoBkDNC5jQmLBmCwqJlEoKo0lWgywIsi1G15UOYz39
	wOV++JOIEG9hseMBZeoiCN3BL0T3S/wfhHt0DwcY7sDFVhdU0vQvZlVqwfh0kZOVDYk0biKOAA1
	XDAf/2EQBCuAZ1KqW4mfMovB8ji0sBu76
X-Google-Smtp-Source: AGHT+IGWK15y3cJ0ySkBVFDMFIUT+JGKHEf8Zddz6BKl48R5eLCXjRJsTMqwRryUollNpWDOlRLpqQ==
X-Received: by 2002:a05:622a:409:b0:4b4:9666:f1d0 with SMTP id d75a77b69052e-4b5f8445a7emr145405181cf.49.1757470163006;
        Tue, 09 Sep 2025 19:09:23 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b61ba742f9sm17682681cf.10.2025.09.09.19.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:09:22 -0700 (PDT)
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
	fengchun.li@sophgo.com
Subject: [PATCH v2 4/7] riscv: sophgo: dts: add PCIe controllers for SG2042
Date: Wed, 10 Sep 2025 10:09:13 +0800
Message-Id: <5cecf3c854253e508a88995011dd4631fa0c6eae.1757467895.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757467895.git.unicorn_wang@outlook.com>
References: <cover.1757467895.git.unicorn_wang@outlook.com>
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

