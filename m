Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CC13191AE
	for <sophgo@lists.linux.dev>; Tue, 16 Sep 2025 13:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028987; cv=none; b=XcjmtV1hZ4sPPK7B/PFMFfJ8VhYR2PbGRcwxyxxqGJEtCPd5txWOMqVIcFmAfrEtmmSsFh/pMPPYGLuUjt7t4R676ARzI94yOxh5UxzZloq+XpwswatmWeYpfuQnJO43+GcNn5AxXb/YJXr2eDySPB/QpNwHWUY/jifzU+GVacI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028987; c=relaxed/simple;
	bh=LW8gKY2G7VDUyUL5o7Bf03DIXlO30RMJvYfW4F5X8pE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MOvaP7SwrMRnsju8bUcMG4jkY7+k+kRh9OgHxD4AgrlBTicHj7k+g/zN4r/RKRk0wcYNMPCbub20bS5zeEidbzuvUS6ij+pw2MNCvPhGs8ShKJsQ8jPsU4OgZluYNXmod+xXYgl7JVSz+cuU7XKgljOyl0umv8tsndhbIS2Dd4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpJ6jzVv; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpJ6jzVv"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77786498b5fso1939216b3a.1
        for <sophgo@lists.linux.dev>; Tue, 16 Sep 2025 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758028986; x=1758633786; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyl0BpQ16/PyZbIlinkdVOcrBnbxP1cm62TtUJjokW4=;
        b=TpJ6jzVvDHDvVf2J36SWLGJRgOg4ZX90pb/s/EJY8cIcap0Vh2Pfc0fO+NL715fhqH
         Nhs7W4OnMpbTYt3OXRGF2GD1fOoC9nt/+y+p/jXIG0mhs5LAJJ+D0vN4sESqJ3Qs2q1A
         Q82FfVYcXzJSgVAz3VYxNPRFAxwoO+lOmgWdj/Te0jHwyFClwRIXd/HxPR93w2+qu+3O
         nEdoqDDSN4tDgwSiEeFZhg0QqzCQdy4Gmi/Yy1d6IQCjib173wjVr0x2u594It/mcMIV
         6FWs/0bSu0ewhhuC9GcUJnwT5lL/2ExDkXnyrUjMR0dHKTVWfLhhABTti907W+u/KogT
         1JOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758028986; x=1758633786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyl0BpQ16/PyZbIlinkdVOcrBnbxP1cm62TtUJjokW4=;
        b=IqThOLQLi98XTVWCBP1wWe5WDcRfrqc123oVLDzwRJVuR/eW6RH2pRGf8lhD65tlEO
         ofzOCF6NdFNEYdWLU0z/sZyp8yyb8Lv7ExjKJizqg3llhenMt9pQgt42jms9vJ5tDwRA
         T/erGDxQGxyJR38cp+lVCWp6QeOn3zbbVTwBlmtol31N/OlSbR88EOW9O8GuVNuYvk0Z
         iarRZZISYTflgh+P4TIcSDwCC4fpbJ+FQIHMV1wGm1TzDa8mZPCJ/JIQ3go3hzuZSea6
         ZIP8QhCq1XM+MWQO3ssgt05Tstob8etUUTSp+PZaRrXztc4W6B/fCRF6nTulRXrbCq6O
         mizA==
X-Forwarded-Encrypted: i=1; AJvYcCUR1vu5EvFUQPewWRuAwNQ6HXfMLwzdls3CA4VepfadY8yVdF4Y05MRMkirum3VAnAQhYgZXy4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxY8Lt4f6iSiGVyA9nXl0K2XSgN9NpkXNEQGAHRRPSXBp9//g28
	iwA3X4bc/hM/BTWuYYaJu/07ppvEYERbjMOOFN6uzL6xZIHRPRk/VMie
X-Gm-Gg: ASbGncvnjQYt5EoM55u+hi+4aF6+7Tq9nGHNi6Jx3sArhCtlGVSv/p/+B5xII9f/ESm
	CrFa3K8SiyuwAKF6SThl544Seec71htJthMVoPJgEl4AXjciaLa96OtPNQ7HwL324GeLRRqCeBC
	a4oOzdxEVjo5EM5HOFg5H4ufYBVldpeNGOGB9J0NzbNmXytIbKqblt3Oufh/s4lmtAmBTW4ZX1/
	njgv0qaG9N0JU/Wl47csRsAe8mSuP2sChdiQ2atv/6kXQiW23edAq6En6VVQF1HS1PapmBZrjW2
	ywUch98ncb0+pChU65iGrZgQmknLEMf8dcJ81E3vlwVeKFtFchzma9tHeydDlYcBCyeQSSAd1zM
	kNW0WVNeW2C+fIrDr+iUNsUwSJItT8Q==
X-Google-Smtp-Source: AGHT+IGSbUcFgUuRvZhaEbQGDXU6wqj1uhsdBmleOb5RXYY5OoqndPwdDpqY08h9eGK8Pj5YxrReZA==
X-Received: by 2002:a05:6a20:1594:b0:243:78a:8291 with SMTP id adf61e73a8af0-2602cf10c79mr22060394637.56.1758028985340;
        Tue, 16 Sep 2025 06:23:05 -0700 (PDT)
Received: from [127.0.0.1] ([101.76.241.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761562f25dsm13277310b3a.74.2025.09.16.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:23:04 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Tue, 16 Sep 2025 21:22:51 +0800
Subject: [PATCH v2 2/4] riscv: dts: sophgo: Enable SPI NOR node for
 PioneerBox
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-sfg-spidts-v2-2-b5d9024fe1c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758028972; l=1355;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=LW8gKY2G7VDUyUL5o7Bf03DIXlO30RMJvYfW4F5X8pE=;
 b=LmgXboPjMuiz3VPvrfkLEdDdVW0rUIoVOP3joiPKFCvu9SUeNA/yoJgD6nm7b0aJ96eV9Rtb0
 +QkVfFRRv0kCq67IYvjTluKfTWicee+PH4Ibp9rjh8E8H/WzMTholA4
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Enable SPI NOR node for PioneerBox device tree

According to PioneerBox schematic, SPI-NOR Flash cannot support QSPI
due to hardware design. Thus spi-(tx|rx)-bus-width must be set to 1.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Tested-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index ef3a602172b1e5bf3dcf54a8cacdad5172b7f50e..93fb493995522a88d61de67fa570631c01807718 100644
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
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_cfg>;
 	pinctrl-names = "default";

-- 
2.51.0

