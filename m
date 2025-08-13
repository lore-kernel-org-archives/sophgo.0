Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87BF2EFD8D
	for <sophgo@lists.linux.dev>; Wed, 13 Aug 2025 08:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755074032; cv=none; b=UjlNBshlXr+9OxWQ+wkS3mOPgM75vNm25fQstMG+A9ecPkxQsxw1SL/05XW0l+wpwzzbbKNZpQ8H86bbCqfEv8XVIizgjosw4pZlQHOt3puEfKqj++C+lHzdPwQYBrjkRaEMQgCJSh874xP6y+69uzrA+dmh4hl4uJUpyiOzP8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755074032; c=relaxed/simple;
	bh=XCcBhLdQCV5TovEOw9nFA0f1JDSfRAWiRcTxRItdr/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N4u4ckg7crADhOltdmoPid8CObVhqx4lImzwE9cjWeuGMHyi7YqfNoScGGDaJPC2pAzIFkgiENWAaO/1sYZSt5kLuxNP0aBw875B4YzWde+FHbmTEIbsisb7FYZa/WyBIXcSe36/ItLponc7AjpyFN+srC+eC0b2EghnqXiJSqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3X0yu3R; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3X0yu3R"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76bee58e01cso7541390b3a.1
        for <sophgo@lists.linux.dev>; Wed, 13 Aug 2025 01:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755074030; x=1755678830; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wq2k+55Ab73eX2+RWOpVJZjXZGzL72LB3pCtHrAjwhQ=;
        b=i3X0yu3RemZ1V7kTlXWH4zBLd/gL2MmhOBJiwLrWK30GI0Hyvpahhjf3tZ/65LHfmK
         7Jv1Qj1oP6hWvdJGlBRCs0Eh+3++mmWJvMi4qV+7RyAgN3LE+UhpDJpYCoD/Tn8UIyx0
         kmpGDApLWjsXxTYAgB0roAxA0llHl7jfPkXAbuU9NcCZ++fockiznEL4zI8VTQnPieuJ
         g4IoDm9DsaUq3No/S7KskfnOYPNH5iYvEYhoyIgsJLfPLIx5eSLEc0lbgaKLAekTC888
         pufuRyrO2UT4uec804plCcSwWRb+IHRmjbsHZMXvy1CsN/WF2KfxpH3D5cm4kvZTt33b
         Ce+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755074030; x=1755678830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wq2k+55Ab73eX2+RWOpVJZjXZGzL72LB3pCtHrAjwhQ=;
        b=RTflPcd2CYkwb4uvnlaU6clKkK2EJAORBl3PRAyJKsU+ptsw2ySN9lnDyqMmVdRExR
         sX4C/ubh6Ne9/uk17JRpfeqlfAuxI06/yPRKkGaNG73u9zM21BTvmAgLcd8Zxx1BBWOP
         poydD5bptcB1y/+5dGm4rVIvikQBVq5U/lmH1U7KOQMT4TNX47iyFHR7hhvpj0piu/Nc
         Z3lweKPRq5Rm3T+UumXJ8baKWuBXwk/VCBWlu+pf+NORsBArPoEzyKf9A1S7dwJ4U0iG
         DXhzXYm80sOeuayDWBmY/lhxuHIX4MTMtkAOreDrGxP6UWKZkTQlRY/rX1Stl1pPqa0a
         z3rA==
X-Forwarded-Encrypted: i=1; AJvYcCW81ANZbo83xMcC5uh1laIY9e5xGFFNiu+8r6SnOFp8V5zKUtsjbIstX7xfRjkcEY8LWaq1LzM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxV4/XWl2rIYQpKEI3RlHUVdVOZH2GOMSzGJF8ooab/LHczt5XV
	VQA9DmFFRGdjdul8pl8LgrCmBW3nxq6DQzdikZC7hPCTYfdwWXMUJSHe
X-Gm-Gg: ASbGncu9pt5QjYcSvVcx681nmIXDiw1I7wSjwqprz7ReAW8/u6UL3aWVfYNXHbp5PC/
	SF9+nfSeFM13vQmnZbrofi0YxEnXQ9gWV3H0j45yDLv+JHPKwAZ5XmdDG7uppa8VVHRXNWU33ms
	K2EjhK9rBsTYUe9B96VfazH6rOAL5LatDSglSU9Pv+SjgPia4sdyx6DmtGDBcS+q5Kp7rLKifOF
	ymUjPUIW7KEmNPg40ySv6JZ3E2Bo24fgmQf66qWUgQSNgkZuziZ5057cJnxkkKBBYyROJx0cvs+
	m+ZxcJ2rqN4z5UZV6p/VXY03+/15K5jvA0LTEF1LxsPJe3X42mqnet/QvHQ1mylWiTI1jXA7yY8
	J2K3J26MN6Gn4A8vAwqzVg8zMq7eFXhQ4
X-Google-Smtp-Source: AGHT+IEfk6doVGoDmRTH1HGierQdyb5DZdCYmbzXWdhql7JiBQuLlcrHvNdWPaOoLf3yIBMJIUCv3A==
X-Received: by 2002:a05:6a00:22d0:b0:748:ed51:1305 with SMTP id d2e1a72fcca58-76e20c9a175mr3054927b3a.5.1755074029634;
        Wed, 13 Aug 2025 01:33:49 -0700 (PDT)
Received: from [127.0.0.1] ([36.255.193.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe50c8sm31307814b3a.120.2025.08.13.01.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 01:33:49 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Wed, 13 Aug 2025 16:33:18 +0800
Subject: [PATCH 2/4] riscv: dts: sophgo: Enable SPI NOR node for PioneerBox
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-sfg-spidts-v1-2-99b7e2be89d9@gmail.com>
References: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
In-Reply-To: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755074006; l=1215;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=XCcBhLdQCV5TovEOw9nFA0f1JDSfRAWiRcTxRItdr/c=;
 b=ntXtnj33yA6oSILDv+mHhzb0RrZs+vQ3X8WLAWJ2qXI8BbQZNK0ALxACU+7Yw5qjMlsGU4O9c
 BNYcHJXWHiAC43XNWIS/lhRbb00r/RfpONJEI2RksvXUk2DVRkUahPD
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Enable SPI NOR node for PioneerBox device tree

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Tested-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index ef3a602172b1e5bf3dcf54a8cacdad5172b7f50e..554ec14d58453a44a02a82da40a7aedb80d61dc9 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -138,6 +138,30 @@ &sd {
 	status = "okay";
 };
 
+&spifmc0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_cfg>;
 	pinctrl-names = "default";

-- 
2.50.1

