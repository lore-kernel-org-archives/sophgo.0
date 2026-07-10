Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C16C3E16A5
	for <sophgo@lists.linux.dev>; Fri, 10 Jul 2026 07:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670383; cv=none; b=RJfy4g+lWxola2zthz3ZYB24aghz4Um9UPkuD6iZwh/7rlNYy5BRyooERW6ziFIQ53SP5rtnNL7bnvzC1Scdbuuecl7aqzva9xZcTLmc5N3rlIRK8h6dztugORS7NFXnBFADCWx3vEwCRVW3SX5y3l52kSNDmCaQ/AVEcNjD9Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670383; c=relaxed/simple;
	bh=2WXm8yz/A3qiEijwIvFLb+YMTiqPBikspFN/zgN9bYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AE+S7BRhUaXU0OZkzuGdHWqoGgNFXkxG1dUBkYmpqgmaSQAY49uqyK8XzLepAslB5M5xF8+j9v5eG1/3y0+suF/paMmuEN7gOknxzypzoe2CsKjh0XmOpSKgL844z8O+LwXSsi+F2dR42nyjsxX8+GOKWRpINhKQxQ7Chugzlrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnAPgCUv; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnAPgCUv"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3800f0907d5so143548a91.0
        for <sophgo@lists.linux.dev>; Fri, 10 Jul 2026 00:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783670381; x=1784275181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNHx+OsQYG/KhT5bcVFP5J4XDttscJh5ndZrWTFJRcI=;
        b=YnAPgCUveuT2SvbF5Vg+OSg44ySvVJRDTP0XaarlY3ne5kGemEnNzd+LBKtDK1ADjv
         2LPtef+z5dFhN3wxjSS+vAjxcNkvzGYj3S6w8jCzhIY3vMetysNZLZtEP3gRIRxnhL2o
         B/dNAJClVR8XK7CeuL64FjJmYMyv1j5Pr6iwdq0osoxFDLDROgykPUXT2uNs5UWlZQHb
         GWOmuSz0Nokm9We/+Qo8y2XdiCyv9qKCjqGr3FdTfsea5/bHV5Z8AhrEXmXVXg/b8e7j
         L5UqfopQFT6Ib6Waiolu4iCUwXdBAOO4o6OyGdPlwISeyMdYHARjP9RmRkWM3J3caEvK
         gaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670381; x=1784275181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNHx+OsQYG/KhT5bcVFP5J4XDttscJh5ndZrWTFJRcI=;
        b=X8I/8RBZCZrt9RJjtIdAAyq+onYRrY55bsLkEd/7TtbFAKJOBkKr3/j9tfHIkNyQd9
         uvNicLhyRmzaE3h8RT/WAnVFqHWwVIawpL/kHyNsii3OBiiFf0b++ClCv0wsRYjpldIU
         +HmcakT+ZuZNrMFbAFqK5k9yzvb2Scf+TxyrSGoxFsI87YYSM26OfnLKySI5petMM9DN
         qRpJTX2bT2tmGqNnaPVdJ+LXdWsoCGXgvwTOjdxL0uDA3jBjcl5Y5cXolvZU9EvLRQC0
         TCaBXdCvkrqpb8GkhYHmW1VNVhcwPDuC4yPasrlA3h5Jyy7stCjF8Q+6zIQTjDZ6o8br
         MlSg==
X-Forwarded-Encrypted: i=1; AHgh+RpJ5tzL7f1st61vPTouNe0JS5dllHXmdqECKbgDMCHm5T2Z7NFw9D81rwASakpXTMhMbNAMAJ4=@lists.linux.dev
X-Gm-Message-State: AOJu0YymBIqSwNjfAurDKBhiT6KzF3VPN7G5o+P/SJ1jy3wkRQshJqBH
	KZqpPn3pIeNjfAQkjnQyBivMqMNmMT9KSjDmf+XIOS3xJ1rwUHk+eWHF
X-Gm-Gg: AfdE7clqsi3zcTZiNwXGoWVCmq8tXt6V+yGfSMZOZELqdfYexXHDTfwRQJ5SqrOjDi3
	Nkg0cS9wVihatJ56mrWilGnP4vFWJmkU+INKR2xyVkWH6CMA3zxZgpQyyD0Vr0LrsFTBxv04WiN
	YZWW4PQ7lIA//cebnFOs3tXroX8C826n/5tCIzf/ncItNgABLExn7UVjFbvUDS+Nd/pf1DBKcfR
	DP7FODnsN3e7nBJwzqz41UWKiXkRdffvQDqljc+MRcgErhDOwEqYABt2lWikzM4WGGiWqgBjf9B
	jgtJ4LjrF0Qj5q/eoaI0c5/sp0FFnc8yBo/n+fbHAHJfxu4yG5yOzknUxm9XOAnyPqsIRQWKM0K
	cmym7LVA6Cnw9m4P7D1/kZYu4Bk+By8bB5tnh0Jrc9/o/weID6uqO/GCkZ0ap0jWnK/bvoAMo8K
	kYjkXGLKJRySv3dU8=
X-Received: by 2002:a17:90b:2f50:b0:37f:e8f6:8d4a with SMTP id 98e67ed59e1d1-3893d33a814mr8798226a91.0.1783670381465;
        Fri, 10 Jul 2026 00:59:41 -0700 (PDT)
Received: from chenyou.. ([140.116.78.205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm19044999eec.26.2026.07.10.00.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:59:40 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
Date: Fri, 10 Jul 2026 15:59:16 +0800
Message-ID: <20260710075917.159969-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710075917.159969-1-chenyou910331@gmail.com>
References: <20260710075917.159969-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CV180x/CV181x family has an additional DesignWare APB GPIO
controller (PWR_GPIO) located in the always-on power domain at
0x5021000. Add the node so that boards can reference GPIOs in this
bank, such as status LEDs.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
The base address and interrupt number match the vendor SDK device
tree (cv181x_base_riscv.dtsi: gpio@05021000, PLIC interrupt 70,
i.e. SOC_PERIPHERAL_IRQ(54)). Verified on Milk-V Duo 256M hardware
via the onboard status LED on porte 2.

 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..25ad2bd265d7 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -160,6 +160,24 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		gpio4: gpio@5021000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x5021000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			porte: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <SOC_PERIPHERAL_IRQ(54) IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		saradc: adc@30f0000 {
 			compatible = "sophgo,cv1800b-saradc";
 			reg = <0x030f0000 0x1000>;
-- 
2.43.0

