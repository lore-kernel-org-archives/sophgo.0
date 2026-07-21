Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF5C43E483
	for <sophgo@lists.linux.dev>; Tue, 21 Jul 2026 23:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784676921; cv=none; b=binFsF5OnV8FUBRo2KuFRFkOYzWfbmYBqs62m9VvlxH1QBdPd5V5luyYYGn99zogmPidzGi3QV5SLmoWcVAifFdNRuFqSB0yCZzWHB7AF938U5vdV0GgnkBdACwuzbTq+SpNJuIiH87aV3JoSa6gFRah+u+B+kfHgor3pAXkiiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784676921; c=relaxed/simple;
	bh=rvvIVrU6NElOce9jw/DSBVsP8DTFPxNdAb0x3XVpayU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6YTC8mRtUf+pVEaHQTyo6zTSkllNcaNc3tOu5DIOgxWR2rqhrLk971Dt9H+xmS1xlydjwZ0msA2SwEgh2kD+k+/jUJox06QUNKy8c/SsDUFKnV0Wk8FxrA+Eh9wjYu3NzOzjM9ApVcOFdBy1HgD44hwrPpub1DKGPKA7jlvv8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/0O5BO+; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/0O5BO+"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cad68425a7so17048005ad.1
        for <sophgo@lists.linux.dev>; Tue, 21 Jul 2026 16:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784676919; x=1785281719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIKbYQezXfRqiCRbFbgZE6r12ftiEK/BOxcKH/SDpe4=;
        b=m/0O5BO+dC9Wkrn5wAkVDtno6o4YgSjUV/bSCQCpgL43de5YMi5w5U/tvjbeWixnxv
         z/LhvF4wQCeac1LdQhxvj+IhaxsC6TQYtuyJJFjS00oSPxqX1k3dcz9BRdEDuIJ28+uZ
         813dYFLYkeUrYSzhigLDPaSYCQXAfcz2OHcq58EC5M8AZxBWFGm4q/kaCEX0+w/5oT8o
         zpUYdnSIATZ2ELkC9cVxU/3mfBfdrxuHxu5XQVSLngiei0/ac8PzGsy09J9xQILIq3WR
         Qx0UXva0/VhriS/x/324aB0UgHaPJQKZTe0i/OhbmGlqG8XAK3QQnx+NYQIGcEQ9pUuV
         JVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676919; x=1785281719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIKbYQezXfRqiCRbFbgZE6r12ftiEK/BOxcKH/SDpe4=;
        b=QjUvbk8+ptF3Iug4mZGlS75vgDdXkQtS1rSTSCFNpaQCJ+GwUp3/7Po0ULnoJ80+ZJ
         GcmXCwsE3LLRiNgR1VKKl9ia+wuQGGC0YKh7tml98PpWoEymO2H9ynxFoM04lxllbh/v
         6TQz4b3ITYt44VlIzAgQuvtiORcU+rsuuHeDkY6E0biby+ST+NISIYyXYJbps0ZU+Q6C
         KMxheuMXdQA7X4zGAFC8Kl+i107WhXf96sMmDBPeJdis2brbsR0bKqkUgX3Fl6QiSCb+
         KcjgXuAO4B6cFk+K5aDEwRHYZAi+1JukOlu3FPNSyJH74NMxBBSTUs8CHvr8AO+fmyJ+
         FRHg==
X-Forwarded-Encrypted: i=1; AHgh+RoUDKYYoGPFm5NZSzZ563KDROFpsKCA19rPTMUPHafRAgpkdTJExtYiue4wJfniGnh5IRrEhJA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxppHoBwJ1VmyEv/Nu88Z5GSGHuF/Z0QAg8alOncOI+it+co9Sp
	/mCFreaenTP5bScN9S8pzs/Ea5YFCsV903bnqF0hRxqbIOH49/xmgq+c
X-Gm-Gg: AR+sD13sVGw8bDgo7ejFpS8LObI78qNX0WtiWFqr92Q48lStf4vWFvQhJpFz/WOrsx5
	8VqSbGI96Kb+2mFJ0936ZlLktzHfkNtjPfb0KWFe1/GfQn74KR0MMHB6dXVsJHK4W8cvPbMZotw
	bND4k06fUnyAMU5I7U92mqmFzsGnZBSGu9PIgrpHZCckn8vjdfAbrtY4Bn/F3st8JUjPo1EN81n
	7dwSL2VbfoFvMijtJ1DpugbIA3IIwlqgsuZ1onrk6hJtpw1yWYj46xMYUssF+7x4OTBJzMLheZj
	pF73fG4YcoZLDXYcZocr5N8t43lNAfi+B1miB1ZVmU1QWK1AHkBExUYK26LFlEzlr9oNfs7+I5o
	scqADPaXqA0sQV2aM8RWgcFUzh7WaIvXrCSfiKjMTWI5WHCuEIz/LJn+LzBSMGZF7xCZZ0vKlfZ
	LUXToMu7BCBn+SD3mJ/2H42/1GL8jpmWOT2jhD2QAtjQ8zijo/nU58QMR4wK/qynMTFe4TycBc1
	KPZnonqHke2BaMjYzEEpgWiWbb6Z/fZCh6CPA2E
X-Received: by 2002:a05:6a20:9c8c:b0:3c3:5e14:461b with SMTP id adf61e73a8af0-3c40fa2d957mr3995483637.5.1784676919255;
        Tue, 21 Jul 2026 16:35:19 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ebfcesm245353a12.11.2026.07.21.16.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:35:18 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: chen.wang@linux.dev,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
Date: Wed, 22 Jul 2026 07:34:43 +0800
Message-ID: <20260721233452.112204-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721233452.112204-1-chenyou910331@gmail.com>
References: <20260721233452.112204-1-chenyou910331@gmail.com>
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
Changes since v3:
- Move the pwr_gpio node to follow unit-address ordering (Inochi Amaoto)

 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..8bf67ee4eca5 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -448,6 +448,24 @@ usb: usb@4340000 {
 			status = "disabled";
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
 		rtc@5025000 {
 			compatible = "sophgo,cv1800b-rtc", "syscon";
 			reg = <0x5025000 0x2000>;
-- 
2.43.0

