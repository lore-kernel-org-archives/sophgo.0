Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D81D1DF258
	for <sophgo@lists.linux.dev>; Thu, 28 Aug 2025 02:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756347493; cv=none; b=dO7zrh4jOUzLaoOUwK3Mg76PgldG6Y2FEP/O+T559ZZ4xgsoaXhvhBFUCQSHykMtnpRTEIeGFYH/yQoCnftB6/VtEYVY7nsTv4ljXoRcmB+Cj2+SvdLUIJLGA3Vgx1kEc15NlPx+8Muo3aMm8znA1hCIzV9Cr6AwElJyLlqnSwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756347493; c=relaxed/simple;
	bh=TVeTlkxDwqekJxD6/BHcDv8RS0hvaJMteIaNKw3WWyM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MxeLPF0Q1GpNTdTD87t9pa3hEG29jIPm1aotoUQAkmPAvAh4yyJOyWWStygriDrbfwnHLLd/JUWagY3nn8Sl1SyKNPqFPbQa6YK8RI0wmGA20cgjcMrm3EUqIumYHMoR2ISGMX9KMD9drqFMWIgva8ROhhdGu7ny+tCdGMORIp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAQIkuHe; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAQIkuHe"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-61c030a96f4so98391eaf.3
        for <sophgo@lists.linux.dev>; Wed, 27 Aug 2025 19:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756347489; x=1756952289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lw9R9KQylny50IUlY0ox7tSDg7XfT5zo+Jx/4FOsYMk=;
        b=kAQIkuHeeMfWGFFoNORdK/prSCfHJU5QJH600svUWsU4k639p/47eL+4HuED1ALYiB
         nEgW58mHOAsCv5vhmewS1SLszUqTuZvmZOEx4uiRsWkkRvTEY+YBc3en2NjxbrT4WnvZ
         8K0cPKPopmyK884rDyvQ0H+LwNdxHoOsvPh+Y4ROXNogapl86NWNIZzheo7LODj8LeLx
         LgHxda2l2KJEejl/TnKZdqshu4weADIUG1ZGbOArxpKq+63YOZS+PT+Jr/UBb/dinmZa
         JN5KDWIWeUxukrzF6M4ZHPo3kDkRRE+0xoOKgZ324ArzgzMjNFlOCGgGsnbQ40VyPZu6
         wDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756347489; x=1756952289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lw9R9KQylny50IUlY0ox7tSDg7XfT5zo+Jx/4FOsYMk=;
        b=Lgiy0iOi6Iwa6X2WCFsWjnkNEBDdCowUPVBAWIjc//RIxg7yg0nVGy+24A+9t4QZYO
         8SoiJQ+7bzkXsPS0wLnvXUx5rQY9pcpE0rYzm1LbU0/SsFsgiAQsjkqQE4sbehc9i1Nj
         0btEFf2oGamWWuB0H0T8//zuST5B4++3OGPDvTHroxPxwvavAd0/jJsJ0tGvyekEG80z
         paXYWlYzBNEnvMoVRAME2kuUudo+QmIBQGMbOHnvKprJwj1e9xk6AuxsRI+ndOTjUxvV
         Z4RCYrRXUZc2gu3MqwQm9QDEl9dBZpbJ5xeWwCmeprxc8F/BIsbzLO2KLyqRr+T96fg1
         4d2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKKRv3F7RIeHkyjSmLxx5ofNBNv9yJZS5ofU9LMraRwcu0FKGSjX/HD5kOHFKiR291otZ/GVw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzizxtz49jgDFjVshS/eWFYGhoiehvbiIeG52KgOcOZjJIA2Ow+
	t2aLOPGt6R9f4TTio/7zxomLk1pLcJHPiov+wQ7cTAUW0a6u+GonNnGh
X-Gm-Gg: ASbGnct2n8cgQFL///LYZsSLU2wCEzakfi0GUA8jV2qhO4FKjSv7S4pJNM+q2LhdkGn
	X0s6Qlm2D94NH+L7X+qHOdjx62iAUrx80RYDXVwPvD9V8dNcrBI/8dl80MoVzAMU/qB6958f9cj
	EF8mGxNHQDwujlGJ8z49QjJOxBgq26kt398w2YgD4diBXEt90VJWsLZQh5Ejk+eoyEW/dTdGG+e
	q2U5SKmG9L3PlVCSfC0bOSDqBVnGweEGYFUsaWKU1OpUG30wRl9BX661qmiQ+3meAvIEFe8rP9c
	II1xUZ0LFDmhtonhoxkBkmHfwB8r5PxQbrZi2UqKIgHm9Tqrn8Lmy9IOwwNmj68PVn0PF8b6tka
	UjV/eSzlaoV3roK9CVVcQub0Ty+fGTbTD
X-Google-Smtp-Source: AGHT+IGLh44dGgjMBAdZ8+L1YTxNe6vactvoL8NAqKvzlPhnz8iFt3JVHKV663JR1fRhVGA14N15DQ==
X-Received: by 2002:a05:6808:118d:b0:435:6cc4:9753 with SMTP id 5614622812f47-43785190f04mr9072791b6e.8.1756347489002;
        Wed, 27 Aug 2025 19:18:09 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-437967be68bsm2311340b6e.4.2025.08.27.19.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 19:18:08 -0700 (PDT)
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
Subject: [PATCH 4/5] riscv: sophgo: dts: add pcie controllers for SG2042
Date: Thu, 28 Aug 2025 10:18:00 +0800
Message-Id: <96df911a622547c6c987895fefde9110f3fcac03.1756344464.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756344464.git.unicorn_wang@outlook.com>
References: <cover.1756344464.git.unicorn_wang@outlook.com>
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

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 66 ++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index b3e4d3c18fdc..346aba5bd9bf 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -220,6 +220,72 @@ clkgen: clock-controller@7030012000 {
 			#clock-cells = <1>;
 		};
 
+		pcie_rc0: pcie@7060000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x60000000  0x0 0x02000000>,
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
+		pcie_rc1: pcie@7062000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62000000  0x0 0x00800000>,
+			      <0x48 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <1>;
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
+		pcie_rc2: pcie@7062800000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62800000  0x0 0x00800000>,
+			      <0x4c 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <2>;
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

