Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6929026B2CE
	for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 03:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760931236; cv=none; b=bgPqhoO+/7s0ZVvhjnzKp8bhWqgZ4BdpEic7oCrpplxcEvD4l2scQ38igat993aOQOz9N6tnfk6m4py97Bb/qYXMVMoqvbE3JC6vTNBsmlN3vo6IYumoUli9exSrGETAsRyUbay7lgOzezVTyuE90JxDpzFZbvotFhU2dux8TJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760931236; c=relaxed/simple;
	bh=jIfey9ih8KXLTx/c1IvRSwzN7kMVHh/BDw+ykH6YUBs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gsQLsjbYkzIeb3rm4R8UCpjRQhcbeUtWIjOerOHe9wK183dikKEjugG5olzpBE1091QgUnkuFCyUlKd4togZ7vL7Tj7MP4IuWRTzdVzASbDwSVxHqgYURuyjopgDCXuOb34cj3B6VOncj1l58gjHdeWn4nFAjqx21H0TBg9Kbm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+tqnLIL; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+tqnLIL"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7c284d4867eso788750a34.3
        for <sophgo@lists.linux.dev>; Sun, 19 Oct 2025 20:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760931232; x=1761536032; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eE+2izhbixPNMGObc2mrhI1AAWPZUT7zIjDQJxZtTJQ=;
        b=W+tqnLILQWP6zNafB14m9anxT4vStomK1+gt+8437VQj2bAETEeUKg4VIi11QVgWgT
         myT8QzK77BVqLSSFvfwcCsTri1sNHRyRxruOMq0qVW4U9kwsfjgy5UWThyH4Cff9EgZD
         q+bkTq4Xd3WYyIk7i0og2m3DwYbsaMRYsu8FMD33lmkyvBmLW2yAFQQTdlRxcOTjSd3W
         lCQJDdMb6PiFqawP0fjwF7HfIZ9qMaQH6XHXJuKPe0uVeVAV3Htusy3xPInvk9yCtCf8
         VOgTk30havP731OUTtwRxOFkBZCbFf+FLGyAdCIRjgGMiQcml0WcQVcKyoe/qSsx7J5a
         DnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760931232; x=1761536032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eE+2izhbixPNMGObc2mrhI1AAWPZUT7zIjDQJxZtTJQ=;
        b=r293KCFOSjRTB8Os03YEwUeC97S5NQJPfcbCog0gIRh8CozijWh3Nemhd+4PJkrGAd
         TDPmVjDZBU+/Ay1eE6BLFIpaQhpamF7/YPbBlDgKHpAx83orETGWlmFN5X6/77odmb/U
         8rytrO8c1yBsN4vOPt/40rsIToAUXc6By1Ayy04fHa1ip+0SEh2gg2oi9MfYQWx6IMom
         +0WtcQxWt4oI2JJ0/cA9JWCB5alpKeoDGW0N3iB8zE4QGXdq1rSRDBs3EU/kbsv9pIWQ
         bGr1iNZ+JqIWUBZiF7I7Y/wSSmUigKg5Lhs0J6cRfk3BMfcLhcrbJwm1Sy/axiW2V4oB
         +Fpg==
X-Forwarded-Encrypted: i=1; AJvYcCWfYCQ2WfvTbs1Vs0D+r2pOF0LJmCnxwK76+L6BEcVGFJrR4nXWDrj+v7jQ27jqXwsJNu8oGIg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzck0QUP9AiKglrAZDlOVk9X1NpZmGLRNMQ/3Tdm5CDyEcLvl90
	Iyh/2S915LfN+Chb2L3FAHsiDlg9FdJkzruK1Xau7LSuY1IklQCcoI59
X-Gm-Gg: ASbGncvRSaGkwbBLxfxfC/k8fjknQBFS/mUxaKFCnIsjsczMcucPaqmO4ij24soiXxX
	KzOYg/aO5EBrKN805w4IA5Lla/aV+7AqpyStPLDU+Cx5HEo95C2ae5LmH4UULj/Fj18yc7gHZMF
	n/ee4YoJilxxdy76p2uMosnthIAQflc1qAjALAHWySwy2ywySjWCOO4ByBijS4Z1WbjGA4dTtP8
	IjmrK6s0Ez8IIBgShF0DNaxrpBEvhXm5OsjlgDD4Qd6SECL6br6RayzVZWpuOkAP0uet5/vLV2W
	8KQ8d9hcLRXqsDEKHuqGMIFSzPxuOkSdl/sHnmXC4wrjUwOnqsT6rQq9lgKJ3gbhpsCozhRZNAo
	9V6j0Fbjcu+1Xut3gfl7uOEzRplwhee0wLCCLOjJpEZq/qtPGgtFnIXrhpxMNSyLwTTijQThceP
	wi1HW4Fmmd9RAgEco/dw2b
X-Google-Smtp-Source: AGHT+IH7yi/yFmj7siKHMPw+MkU92NW4tigcvPRgjiSI1spL5Vh8ashM0eVWC/cROlPfU+WidZl7yA==
X-Received: by 2002:a05:6808:1a23:b0:443:a224:8f98 with SMTP id 5614622812f47-443a3179d1amr4879888b6e.61.1760931232450;
        Sun, 19 Oct 2025 20:33:52 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-443df628a35sm1586544b6e.22.2025.10.19.20.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 20:33:51 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	rabenda.cn@gmail.com,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	mani@kernel.org,
	liujingqi@lanxincomputing.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 1/4] riscv: sophgo: dts: add PCIe controllers for SG2042
Date: Mon, 20 Oct 2025 11:33:43 +0800
Message-Id: <b34d819cd763482e0ecbc5c5ea721f0101d1f844.1760929111.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1760929111.git.unicorn_wang@outlook.com>
References: <cover.1760929111.git.unicorn_wang@outlook.com>
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

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 88 ++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index c5e49709b308..85d8b89cf9fc 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -240,6 +240,94 @@ clkgen: clock-controller@7030012000 {
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
+			ranges = <0x01000000 0x0  0x00000000  0x40 0xc0000000  0x0 0x00400000>,
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
+			ranges = <0x01000000 0x0  0x00000000  0x44 0xc0400000  0x0 0x00400000>,
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
+			ranges = <0x01000000 0x0  0x00000000  0x48 0xc0800000  0x0 0x00400000>,
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
+			ranges = <0x01000000 0x0  0x00000000  0x4c 0xc0c00000  0x0 0x00400000>,
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

