Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4BE23ED69
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630373; cv=none; b=cGmc8NW+M2YCHfI82jzvHgYeJAglrZ5BqQ/tUQrhOS7cDJ6Oo0aPNiRGCyNJEWeZVX4bRO88v5Fx2areLGjAXIJXghcCq8c9w9jh5WKfiH8ZTQDf7pXZGYQoknQs52ZG83QUKVHX2xSXx48QobujM5D+jvb+5q8nMqLkYC4Kq34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630373; c=relaxed/simple;
	bh=labKHwmoz65gG16kG5cJ8rbFXt/yG0jM37DHW0myKog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hjfP0EEuBtUCt1ndj/TPxYSzXRUk6Ao5c+Ig9BiX9/SWAyVeocttUgEewwSsO7eVPca1j/Y1WERqk4NRmZxz/Wr9ZwqA7Qsz/iTycNYTd2XGtlIXGeeOejLhtzNxAMLOiuNyYa4ombwF7XGKU27QDcc5B/ut/JrdrfdT9W1j9lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPE1qaKx; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPE1qaKx"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476a720e806so58311231cf.0
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 01:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749630369; x=1750235169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mtdf9qP9cVV8qWLubtpWpim66gLvZ/7SjvLD52kK9W0=;
        b=EPE1qaKxZUMcK64OBPHq4SXKZk5U7AiQqeV7PCcudGDIManiOT4REWuXjVULywn62J
         Ghz5WkhPofT6hBHoGgFBjZJLbzPkkWBiNEMDd0nuRURf1WXLC3DnBWQpnw8en04NMQhi
         v2F8Nwdh0dWSLoNN10W3I1u5IJxTN7lNlMIXQJFYdBFayOVX6Sw9CiP+bUPILEC5XtFy
         NjnR/AsvrKfoT4xUh3r4/absoroUpKvdiNMmJINBP5wR/5fYIoNy+N/+sV9gEgnugs87
         LKHvdS41zgs1Lg4ssIDHM1arE76PUN/c0Lsp7nqmTyqfPs2oXfYRRGdmU+W5fWJecJSt
         H/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630369; x=1750235169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mtdf9qP9cVV8qWLubtpWpim66gLvZ/7SjvLD52kK9W0=;
        b=LOL8zqwwWRrQsbNNtZxBx41we0NPEqr/+muXpaPeTWcozQ3Qne2P3cm5J8YSXWfmbd
         N/MyV2uIFO4mombMSYpSPsDIg3+m7r9o/GDTiJ+pmzfySNs5BB4Y0UQStPmUEXjUFV42
         NdWg+Xzb1EMk6CtRUxSmLxNsTCSslyRegyPuWYYXyJPaWdCCMNffHTslaP6o9/cF/URw
         40q7aYeukA/n0ehDhOP+DD0EfyBnNrWYOj+420flmgY+y1gFLzpEYmNrwKvFYAKNoI2T
         qVJFeB33HqSap3kzilOqL9D/ENiXp8He7S7++hb2tM/9cUd51lS5t66cmxnubC6AZr5U
         SLKg==
X-Forwarded-Encrypted: i=1; AJvYcCXkj+rw3rCulBMqiFQmILc527xz2A4ouFT10VycQNhfxAHWM1uXRd+jiuog2nkvYcgOpHYtOic=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqL01ngMboj2UA1y5pql74/6hi0DB41hQIMOZBSYQjbaBaGTUL
	qaawhzWNjX0KPByl8nGFrWcFrZZRzNzntDTNMTHqBAELouZNzxgb3usf
X-Gm-Gg: ASbGncuvw106FW8DG9RyF+vdbZG1OLTEitHaNRHVYZ2OhSFbyzeSc3qmsLdXhx5Si09
	Qik8ihDBBPs7p1LOjJkAUBqi0UsoyqYOHnw+QBUEvhp7BV5tEB8BKx4+gSwaPL8P6naBMmRD/bV
	hU1taBWuQkQUx4i+7MWQtAZdOL9kr+ya7NMsdP4FGvqpPEMISjqY5bQ970iovP5n4C05UjzAUKR
	yjMtvRiBS38MAzCwyG5UpMiF4CUzjZMCrIKUF8n0eOUzjkx50hSKdVWCAN0EIrV0qARQWwqedMT
	5SgVmpvSRph4QuXh3rkn/YIensA4FMaKiBBcog==
X-Google-Smtp-Source: AGHT+IH0qLFsfBv1pQpQxKIbPeTxFHffMKW+/k5Ks09G+LGGw9rZi9lUb697yViqAisSUqzJw3Gi1Q==
X-Received: by 2002:a05:620a:1721:b0:7c5:a41a:b1a with SMTP id af79cd13be357-7d3a8804592mr364704585a.10.1749630368821;
        Wed, 11 Jun 2025 01:26:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d250d7c399sm831902985a.24.2025.06.11.01.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:26:08 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH RFC 2/3] riscv: dts: sophgo: Add syscon node for cv18xx
Date: Wed, 11 Jun 2025 16:24:50 +0800
Message-ID: <20250611082452.1218817-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611082452.1218817-1-inochiama@gmail.com>
References: <20250611082452.1218817-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add top syscon node and all subdevice nodes for cv18xx series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 929864ba1b26..65eceaa5d2f8 100644
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
2.49.0

