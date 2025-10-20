Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EBF2EC560
	for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 08:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760949571; cv=none; b=TUYB/fuLibADuDAYXUEUv0Bds7FgV1BqoQF4jbsjQ7Wl20y/m5GyISB+k/4HaoOc5DF5UvOlsiIKvWCbZOVYcMIjWBWCW9SzqDVIA2at+qMLO82bpm/HkbWBdGW4lwyrTq97dqlCswB4yK3WHhQyoJODxDvko71YS6W2HJUYe6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760949571; c=relaxed/simple;
	bh=Pgz9s4yM7alHVd1TDNAq4J+mf2GXq5txdPu+yTHwbtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMDQKjWR/Jaldp5gBx1hG5Uh5cSSSzXeRJFBhptOorbPGe7CJSxKXDtzcG/fRMAklbnq9wZDoUZ5nGHe45fEyOgEgGv9L0bldTq5xb2TJIpaDSTSTbIDUdYu9iVcM7QxNFRz3gSUABt6prtMLwqypanZNGMMLSzn1e5IDXhZdns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bj7n3Wyh; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bj7n3Wyh"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33d463e79ddso3063948a91.0
        for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 01:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760949569; x=1761554369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIc6x2UqQ/+/MYkhVAsuU2AYMkhOe+CBEJq109yOhQU=;
        b=bj7n3Wyh1n+U3/E38U2LslTx+SuTZdy30u/rW3s8wsYe6//ROaPBzfK27/waYcNZhW
         ayBWz64kGPdSNqAUfALIpQnJO4T3TPg51Gcn6XhZg0D3JggswAnh7QucGiCWq9sAzv6J
         00D+NrBPmrC/XsgaeJ71c9+h3YJpon9J3Ita+3+RC45b+2AMfaUzpcHFMeFhKCfrwV0q
         rtepVYtwMchWXtusVG4UfFIHn8ZrdkhN2a4+i50KanlS6+kz6Fygc0MPqQ0lg1cPuTX/
         DARfYroup/Pxa3+JaqA2TVb16z0USd5fH6kUX/7sLFG4lCpKKJBuOuOnlAiBmptD9OUT
         vZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760949569; x=1761554369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIc6x2UqQ/+/MYkhVAsuU2AYMkhOe+CBEJq109yOhQU=;
        b=cNbYQJODpa0eaJ1PcDXXPFlyU5XG7VdoOj0GGKuJ3w9PrDBWGxClr3Qv+T36/B3LQG
         ltTV6ykXuMzlChen9PBlx3ePPTRiIYcqSV2yznKkr/s3Rkzw5dVuo9HxH27f4c4XLN4X
         KN/XHqFS9rcvi5jmzfy8iJhFxJM5bDaC3pyQMdUznY+PKJ5KaG4I3aMyTw73als81Xh0
         W+xTQ0fn0aVVfnkD6cIrBntMcuFG8+h/tKiT+Tln9Jrg3aX80/kW/x3Kskvil5Kdkjcc
         bDR1GHW3JXAOTgFG+xrj3nAuAfTu30qISb/wf5lwimft2EkoMHw/Pm8SizEUBMRfxP4N
         EI3w==
X-Forwarded-Encrypted: i=1; AJvYcCULMmfFzKATlSisSM2hatONRt0zxtxxPhiqz9Gh/ji5PvzZoEVPMrkqBvB+sfM+hAq9+9JJQ4g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw22FzvwRaRO8btul5VnhoV2OGdSeONMXfK1LkJOicptL18uXeG
	8f8LZ55NJpcAjMdvTg2HzDDhGUE8ZUhveima6EMbjfcZ362mfwwQkfwF
X-Gm-Gg: ASbGnctDdhS7+b7iP9y0cp/jcsHmqM6sdpTbEWI+WnDJmI+pIrotumK1FTz1wG6wqiR
	OYMs0jnMopwSRnDtCpKsr05kr9IZVTsnEn7/BPLcie5+8SAPOW4vrURtjEq4JwQmXVx3gZLbUmX
	f/VgJQ6GDw16VQe1O0O1BM5KOeaktrHISCrP0gPc6bOjNywlvTY/g+SPaDcqq/qPEBrYm//TeqC
	9jEzC1RuWvCR7fM8e2gr5FGN88RthBmwGqg+j+ZGezpS0zJZAHkzKBFCmKydnktLETPIE63xmF4
	wO25TB5/rcEYiQviylV4WAQXfN+tBRlN1CZFPfg9rezPIAXZYVarnMxC2fqB+9SuFz4WYNUonF6
	+FH25uwh+lyS7WBvxZ5quNzVhe2ffurc9EPpmqbt7oQ2QC3G/drE1k2Js618tz3A+iAHmbWb3IC
	Mqg19nFbMevcs2INmg
X-Google-Smtp-Source: AGHT+IFkyp0InjhjZaNKMIDCmJDhxuvBQ0nCOQaXFWprMyh2MBS2FRaBpj3aAHyvwBdPHJzM/Mh1Tw==
X-Received: by 2002:a17:90b:5386:b0:32e:9281:7c7b with SMTP id 98e67ed59e1d1-33bcf85da05mr13624650a91.3.1760949569204;
        Mon, 20 Oct 2025 01:39:29 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b5d0b4sm7062386a12.29.2025.10.20.01.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 01:39:28 -0700 (PDT)
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
Subject: [PATCH v2 2/3] riscv: dts: sophgo: Add syscon node for cv18xx
Date: Mon, 20 Oct 2025 16:38:32 +0800
Message-ID: <20251020083838.67522-3-looong.bin@gmail.com>
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

Add top syscon node and all subdevice nodes for cv18xx series SoC.

Co-authored-by: Inochi Amaoto <inochiama@gmail.com>
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
