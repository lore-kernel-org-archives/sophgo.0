Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100A22EFD88
	for <sophgo@lists.linux.dev>; Wed, 13 Aug 2025 08:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755074040; cv=none; b=qYtSdaTatDfsiZzyCHzRvjYTtA2OagVv42wRE8DEvDjrP8L7PxM6zd/V274IvZOfnAOAOJnFBU0CEb6q01/C5D8mPUm9xXbG1puNkyg8W+W2gnopkAireQe35sE1W1B2Mja3LwRbr3VxBiyMW6Tq/sn3bn3g+FGNio5MHlL4Gug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755074040; c=relaxed/simple;
	bh=mP87CQG19Zoa2RA1RPyhIuAVJaVjC1v+XuBf7j+Wzzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XGZRvGDMuAuqo3CNM2rieChQ3nFHiHMl36S7tfiEEtBO4iMXGmW98T9JHEzmk2I6YfJ4F0k9dHMbtkYDzDeJzVGJgf4PFj7nffbv8gpNMWsW0+o4opvpC9FfTqyFFvdsD+ldBVWTR/zk62scYsIJeo6fn4UufNBFboQ2D5vj+ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8AE701d; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8AE701d"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76bc5e68e26so5914327b3a.0
        for <sophgo@lists.linux.dev>; Wed, 13 Aug 2025 01:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755074038; x=1755678838; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMX2wwg5qxLiJB6Y+xH52K/4W3C0oAMt7T3m0sUQaiw=;
        b=G8AE701dz9whtUnvNe6gxyTWPrmYkPpZgHCFZ+2sHtEb/Rw3XnH/iRHLhoDKESR9YP
         smQoU04pvRhtmzAPHrHrXbX+3lI2kzTC+drXHKDhI8nyw//cYxqEh0TxyYpEvdYn4ijJ
         xi+UI2ig7kLt8gFZXLn4SnJOUh7V4pKirVOIuSJNQx1JXy5Qip2VjN8n17yErX/2DrPC
         osdKswFCdPl/Vj2wOEFSSJEIRGFQF2fo1uUMAt/J1xjE3Sg5cR0Ftfenw+XJtIrqhAP8
         5oD+oMtRHcgiDpwe6X7C8uHvWy3pA4v537ukinDz76kgBrnk+xa+pE/BGljsM8F2gJty
         314g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755074038; x=1755678838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMX2wwg5qxLiJB6Y+xH52K/4W3C0oAMt7T3m0sUQaiw=;
        b=s2mnUP8Qq72vemgPXo1A1VyJWvzdYIq0lCRAjtwa/K/2AGatZPqrjyMemzv/i4xDlv
         DkOjNXNLet2jyywhHubi7Z0vV1RoU+w7uz9FpCRjwLRwK7bZqk9KYiH6TpDYDx1KMbln
         lAcnDrN5ZCCPhh/d4M6dIilLFyVW5J1JZUBa0YW+UmqkOQ7WpbRKHC/zXb1Ygd+fbRu6
         Q3+YFBgGEbtv+tnbXBvH+Sf8P/9jLs/2Vc8sFVyAm4FHFe+vdu9s/KePlNdEl5MM8+IU
         VBzFT1stEz5zmzoZwzYmtos8Da/A9U7M3342DhKG4tpLyE4sJVgFsrdbG4bSrOJeKvx0
         VU8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDbH/NLhBBEGZ1XH3R2wy07FQXWgoonnDosY2egBNsf3Wvk4JUU7JRXU+PVqFONau3zuDKctk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4vPcxMHBJp/D4YBTw7mAfn/9DpcG6pNSbXVyWenVa0AYSBevV
	+vfMZb9k65zCScSy8sXP4kPBOXswcgKlyli7kc3EecRgF+4yyxd64ocG
X-Gm-Gg: ASbGncvX/StrCLNy3kYzqUKRsy1Ayyct0l43gMtyroIy0NaJban2kS7nwRBtjVMLY7d
	PFpcpXCvQdjLS5oNmUbK+zNAPg8nkqjLVW8q8OeVs3ioWewUDYgAazSo7e3eloxYLaEY54FH50u
	8/uRrdI0DoU7ghgwKJNWw34O5jmAU8REpl3K9TcWhvv40xkZRy+F/aVpK0DAl9AWWlqv+7xtdrd
	GmlnCklMrHDrGx23LbnS9AVxzGtAGIsjGJgOMizcJ+3SRm4YuGRKJmJK1SJtnNNq2ivN9tb8906
	MxH/FP4mAx4lEqkiI9ABjwUNXWI45RQpAtMpvD8e6gnBU+QtyJnonHLQoZvA4LZZ3UvmAZ0ZBg3
	+RdO/vaHcbFezuXQAq+sYyg==
X-Google-Smtp-Source: AGHT+IGj5o8hVlE+Dk8XrFfk3mVJEaO/uVdNHOJLV0qytV//OwbV2WeV+n5C+vKxx6Aq4gjkbNqqsw==
X-Received: by 2002:a05:6a00:1709:b0:748:fb7c:bbe0 with SMTP id d2e1a72fcca58-76e20fa8977mr3864511b3a.24.1755074037944;
        Wed, 13 Aug 2025 01:33:57 -0700 (PDT)
Received: from [127.0.0.1] ([36.255.193.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe50c8sm31307814b3a.120.2025.08.13.01.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 01:33:57 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Wed, 13 Aug 2025 16:33:19 +0800
Subject: [PATCH 3/4] riscv: dts: sophgo: Enable SPI NOR node for
 SG2042_EVB_V1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-sfg-spidts-v1-3-99b7e2be89d9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755074006; l=1133;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=mP87CQG19Zoa2RA1RPyhIuAVJaVjC1v+XuBf7j+Wzzc=;
 b=H7SatGJcG7eupDmrDjtbkNoJnu+FkRemjDVyIyvwmZ0prrLEES4hcDOwL0Tcf4eJqxlpuIAgB
 0BnI2mg9zdUAYkiWJ2yEduyUi06sieCxor0YOvHNP7lZwTTM5D777Im
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Enable SPI NOR node for SG2042_EVB_V1 device tree

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
index 3320bc1dd2c66ab1a77fce719f145070ad51f297..d447d66177ee5c66b12af2d8ca79a22cc920c666 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
@@ -238,6 +238,30 @@ &sd {
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

