Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDAF311C1E
	for <sophgo@lists.linux.dev>; Tue, 16 Sep 2025 13:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028983; cv=none; b=lHDSLtRPVqm1gthwb3qWtkZpnDrn1BU6fj3fv3+fKZMjCAUMyJo447DdkWQQlAq+KtxCkcig/PuwLuYp1Gcd36/s7DMvUsBb+9jyBK1qWq55cqS8zFmP96TLMdPEejrBodjEUDVU29J32Zw0zYyz6i3xPae2i6V8/M0Ozavqiyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028983; c=relaxed/simple;
	bh=QybYOscoNwdDfY/Wes+QSL8OfKyE3/6HFcIoUfyJOiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b0iSjmRFAPnjOu6FxLNGCnAt6ABb130+Vlr9/UCuifhYOVROYv7YbIC1dFU7m6e4rvp0t8kZlMm4WgPe4l04uf/PiaMFMN/N7zop9KIUnvEAwulqeW105N5fv/r/Hi87HHK/iGZ7jSIzoummAZuQQN9eIolq+AEr0FJuCBklSA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jhm3vrKX; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jhm3vrKX"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-772301f8ae2so5059839b3a.0
        for <sophgo@lists.linux.dev>; Tue, 16 Sep 2025 06:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758028981; x=1758633781; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaxG+kWIaesk2NKerDmk7jBSPRl4JInhM+mFO2hD1V8=;
        b=Jhm3vrKXlhNkRT777RgT0ms3/4cI0eTG162JgPXxyK8WBB0gn71v07LbuB9Cx2o7b3
         T2lYRPeshIVKD47x79K6W2gaMD0Eeij9funbh/U7k3rGhXKK/OWd6VXHqSk0HXZg8Uri
         wHu03NJDNj2wZQRRaqORUzggrU6vVMG0r8TjU+e4mI475VNT8qb4aLDxEHsyPfGBv1LU
         szg5I8Tb+rE8Lt8RcGc7qN8+Kf2DJU9vucrjp6/leiS4pF0/ag5J/oqOzVIz1+3TWraD
         QjVpspInFUKgbCKFZqGOmTlmIFbFDuWlWAxpdMKe69RJOuaisR0nlt37+HGgQz7Bs8e0
         O0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758028981; x=1758633781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iaxG+kWIaesk2NKerDmk7jBSPRl4JInhM+mFO2hD1V8=;
        b=QzOZXyFlfbTXVJUouV/jsFAg6zqqAbmMUvj9yJ73B7+coRaVPGZFCg+PDzXq0dmfjI
         WzGVGz780dInuqaIP4LGeSearQpqqU5ldb0PK1Fjpas8ZnoOwlmv25EpcMnjlmIAcwEP
         SVyXOQjBPj7inKl8Ytj+1nj6vH7I0gnHCATj5Ka0IPaMpNWWDsdaHza7ezwSZevs4+XV
         Mt+O9rnRRmTIuX/gcWqRqV3YZWAiwTi5hhYK51rjsWBFFrSLBvrSRx0q7xlFg8cnW2kx
         bviWwpw5eGDIuqwy76+6qGcENnKyOSwnA/MWFXBCs80o3ADQdiUdQZcfXmikh03ynLKg
         SgUw==
X-Forwarded-Encrypted: i=1; AJvYcCVdZ7Lm/Y+k4UiFmhgFJOh3pqYaA3asksN7JVXMJZqagwsq7XUnNc8brprjlsRwuD046Uazwto=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTyegOuAYMX0vnEmt4INd2J2fqPwVrn4paK6SZ6q71hNsCwGnV
	GWAIYUrhJcgMdeeyM92gHglwyWlnwQnQHwZdGJETUTVoAezVn4wMAflf
X-Gm-Gg: ASbGncuera9oddqrU9EV7erewnIvNxRzMhYnydJ7AZKl/KcY5N5xXesMRD+CrMVC3y4
	amn4M5huqcgIayScDJb7nVO4F25tNFjZD9UoVLcMutr/NS/LvvudWry1kcdyVM2XFRvt2XFCwLE
	qaeurv1EIliHixbqQXlB30mdN/AbBb7vYM3sXtUT5urHs5f+0HmgAOLsWs7B+nsGRKLif/GLE/A
	0YJOmJzPoAOT3P5NfVNBk9W66eE0skpY5eN+m/0p+AursMZmBpW55IuTFGJ9YFWsihutZm7w1p3
	ApHWfe4Kvpm06B6eQziWi+zJu/zR6g1eBV4AeMg9H8WYLQwKGd051Kr2CuDfLN0Ux+G/2W9SJKV
	BQBB+kU7s1j4MCfIA5TpdP9istkskwQ==
X-Google-Smtp-Source: AGHT+IEw/bghXBwSKJHoeHGCMNhxKW0ZFmnDf4/5yHXHLv5gzxmu71658fIQ+i33vla5FL014yEGZw==
X-Received: by 2002:a05:6a20:1590:b0:24d:38c:26bd with SMTP id adf61e73a8af0-2602c90c629mr22551051637.43.1758028981023;
        Tue, 16 Sep 2025 06:23:01 -0700 (PDT)
Received: from [127.0.0.1] ([101.76.241.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761562f25dsm13277310b3a.74.2025.09.16.06.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:23:00 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Tue, 16 Sep 2025 21:22:50 +0800
Subject: [PATCH v2 1/4] riscv: dts: sophgo: Add SPI NOR node for SG2042
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-sfg-spidts-v2-1-b5d9024fe1c8@gmail.com>
References: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
In-Reply-To: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Longbin Li <looong.bin@gmail.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758028972; l=1514;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=QybYOscoNwdDfY/Wes+QSL8OfKyE3/6HFcIoUfyJOiw=;
 b=IXC84u2TUyu2cXBaPXrIM5z07LJd32cnc4k6CDpgCHZCt5iMtHWKaI6Mk+GPruvXAfXbcJFiF
 midMpPuhWb2BBpYExx3tRvDl6IK8XaxHc0wkxLIk0qHUoA33y9iMqtw
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add SPI NOR controller node for SG2042

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Tested-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index b3e4d3c18fdcf94c2294a56ed6ad866fc59a6adb..0f7d8a3743c35046ceec902902af2b8d3ec8e6bd 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -48,6 +48,30 @@ soc: soc {
 		interrupt-parent = <&intc>;
 		ranges;
 
+		spifmc0: spi@7000180000 {
+			compatible = "sophgo,sg2042-spifmc-nor";
+			reg = <0x70 0x00180000 0x0 0x1000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_AHB_SF>;
+			interrupt-parent = <&intc>;
+			interrupts = <108 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_SF0>;
+			status = "disabled";
+		};
+
+		spifmc1: spi@7002180000 {
+			compatible = "sophgo,sg2042-spifmc-nor";
+			reg = <0x70 0x02180000 0x0 0x1000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_AHB_SF>;
+			interrupt-parent = <&intc>;
+			interrupts = <109 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_SF1>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@7030005000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x70 0x30005000 0x0 0x1000>;

-- 
2.51.0

