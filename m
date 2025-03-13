Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5169B267B96
	for <sophgo@lists.linux.dev>; Thu, 13 Mar 2025 13:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741871532; cv=none; b=KGCCQZpAI7qGd1vMc184PmJnAfV+KNszCXs/3dP7RnVPIP8OfJKqYN/s/QtN3pJNP/ervXI5NSVcHGNIjOKshrQGSRTowbvM0OU8fcD2bfkiQsbYjRFKcpBi5MUdhtFoYxY87s3TPi4IQiYEEpdRcFV+289kanYBM78O3AwXWqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741871532; c=relaxed/simple;
	bh=9w1ScaeSlWhq6L0g6c/1U2BXB6YORXYaIQ7F9hz9/qY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ARfcF3FOTEe1W40XLWMBcquLQwzByrQKUEoRxBDfuaT87X1nlNHgERFdsgsFemKUMm2BGpz/uxcT63bhEwborJ8Zwd2r5pdAaaJppaygMxl8BQXogNII1bFKN9RyGcQlesOcVrgUShCBfpONkapvkAMLAA2TP/ydDW4f9o6V1FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rkc6NNqQ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rkc6NNqQ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso3717176a91.0
        for <sophgo@lists.linux.dev>; Thu, 13 Mar 2025 06:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741871531; x=1742476331; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwYK1vtIGu8AKr7d5DZZujGnya4yaossipP8/xTscq4=;
        b=Rkc6NNqQXpJGm90wkcT4PEXTYdb9SsA8LTP3VfOtBtKl2pwhiv+p9U40YG0+nAbnHF
         ejKwiKLUT4BGW7rJ/ppj+K1eRciabjPJ6Iose0MJ/Vh3vDXdugSryV2DcCkcO5t0Wmuo
         TaommkByqGKTGM0WjFsAHHCd8Y6fiVyu3CaSYuh1295SR3EcgapOFuaXmMhK1cOifNmy
         UIlXsCdTklVIKnf6WqU/A2nQwT+EiE6MqfFBikldz0/IEBirygSDC2Tl/+gq2dWC1toH
         6rWClZnpyEXjoVxpa2eTXiiaDTRK+AnZdSkZe6IP2BfLI9N3LUzWKqVddpgNiQPmnLFR
         5Mbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871531; x=1742476331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwYK1vtIGu8AKr7d5DZZujGnya4yaossipP8/xTscq4=;
        b=MtDcGkRtcW0L26wvFwDBfLjUDTRMkkw5Ni5v3xAfDbDbz+Mp+UoJuht6kQYCfcPz/f
         qB46wmf/7kUsUy2mMsID6+BTWmodqAj8uWy+NJa61Jg/SDJ2IAAPupwIcV7nWtGmzSex
         IWulAALYLzpJQPeUNbYZE/ZF8eO7jT4236Pvz++JjqqBKYue99FaNSU4EWnScEzAYI3a
         T6mmaWIUzXAWUx7J3g763pg/r7X1So+2XbtTFzyAc6eOy+VZIm6Wa5rhPrsq/2YBF0+a
         UVjq+2yVqlLGTYStXI/cmeoDcKEVoAAbQ2pAS7OwoiJGC68w1RfkbvAkKmfkb5puWp0b
         RVfA==
X-Forwarded-Encrypted: i=1; AJvYcCV9+XqDSj2mhq1ERPYFOk9oX0IcC6kFGaefgGWi+G6RDujE5AU1JtNp9+A1OQbefAl/AfZglRM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu0JW8C9KxUWwpMamC5SKMNHqtLet+hAjm9smer4oNQ1z9xk5U
	ubClQAVOv7oKu9LqZIiUrjjrgvzC55WupyT49lLy5IGXgdWapl7N
X-Gm-Gg: ASbGncvDNE8HBKAZhx5oROMvPuWNmXDVuvXBFsz6K3d1MXXwoz9KXtkIUOc75rmrg7o
	MKCAAzwb7CA1woll1PsNNF/zsFwHZNt8kfRLfTL5MyVbmCE/bd+zkm5Nx86hkH939PFMj9zSW/E
	yQWrX0aJVbacuHkD8/T0wvgabPnQy/iEzUBTZA8TA7S7WyblI8cxoPFlgTUGs9A0GL/wHI7PXgv
	MG5tzg0zU4f8Qmef2iats0COJ7WJ/0HDvcl4hUGL8ouqRSsWRIpk8XWks7/A3evPtSto5JT2SaI
	2Ax7F/f/sieio2yTPjlzHPS+3dZ76dvqQTQ=
X-Google-Smtp-Source: AGHT+IEgH0CG5aSgef06SzCJvmgMptc8klfdSuHRJlwjKBRgnlA8cLsLiRUzsG4uJ77t6uFQlEZL9Q==
X-Received: by 2002:a17:90b:4c48:b0:2fa:603e:905c with SMTP id 98e67ed59e1d1-30135e7dd3bmr3491447a91.2.1741871530193;
        Thu, 13 Mar 2025 06:12:10 -0700 (PDT)
Received: from [198.18.0.9] ([2a0f:7803:fac5:a7b6::1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d52sm12539615ad.116.2025.03.13.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:12:09 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Thu, 13 Mar 2025 21:11:50 +0800
Subject: [PATCH v3 2/2] riscv: sophgo: dts: Add spi controller for SG2042
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-sfg-spi-v3-2-e686427314b2@gmail.com>
References: <20250313-sfg-spi-v3-0-e686427314b2@gmail.com>
In-Reply-To: <20250313-sfg-spi-v3-0-e686427314b2@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, chao.wei@sophgo.com, 
 xiaoguang.xing@sophgo.com, dlan@gentoo.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741871512; l=1436;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=9w1ScaeSlWhq6L0g6c/1U2BXB6YORXYaIQ7F9hz9/qY=;
 b=y6IxyvvuwFXWUchI1WelHOu7+mju3xNDsy3WvdI9VAq511ux6fzKK48wfDsf6hrr+pVYC/vJ3
 fD4fM4zDZdgAqOqp0ypkHLmYA1Iz+IPORpPRGe7/8lHkv6KavaPjD+5
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add spi controllers for SG2042.

SG2042 uses the upstreamed Synopsys DW SPI IP.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55abd922b5ef796ba8c2196383850c4..9e0ec64e91a2330698aea202c8f0a2ca1f7e0919 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -545,5 +545,31 @@ sd: mmc@704002b000 {
 				      "timer";
 			status = "disabled";
 		};
+
+		spi0: spi@7040004000 {
+			compatible = "sophgo,sg2042-spi", "snps,dw-apb-ssi";
+			reg = <0x70 0x40004000 0x00 0x1000>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>;
+			interrupt-parent = <&intc>;
+			interrupts = <110 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <2>;
+			resets = <&rstgen RST_SPI0>;
+			status = "disabled";
+		};
+
+		spi1: spi@7040005000 {
+			compatible = "sophgo,sg2042-spi", "snps,dw-apb-ssi";
+			reg = <0x70 0x40005000 0x00 0x1000>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>;
+			interrupt-parent = <&intc>;
+			interrupts = <111 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <2>;
+			resets = <&rstgen RST_SPI1>;
+			status = "disabled";
+		};
 	};
 };

-- 
2.48.1

