Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4730F1F5437
	for <sophgo@lists.linux.dev>; Sun, 25 May 2025 14:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748185180; cv=none; b=qzCoXXIrijYBNTVRAVI7e0dhaB8G8fM6CytjCd9256siVft7wcYDjY3sGBG/OmwLGHp82h381NI/sq15zKICVbiV/goUn/Sd+C6Fw05ffhUds7io9WzWZrtfjjC6i20GDhx4zn7h9Uz7yG+rVTnBGsX1BBffeB23I94QZq35Qs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748185180; c=relaxed/simple;
	bh=ilUYEgJmQyNUKpmFci8Kk389OiK2lk6BxrCD1iEtz9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l8oARIVOzVn8VShEEU1LKa2L1hhLBKdodGyPSetP3rF0mZ+7umEMZoe80in1+FF8M5ZJnnAfDh2v/zsE7YAvP9/tXoVXsYL6SzsEuQG8KiqWp2DAu7E0VIMgMo2zaCo3uhvrsCJ2jKw4iSQIm1cTlhUiucxWIMOg5uliAI3OCXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUYD8SiO; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUYD8SiO"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2320d06b728so9463565ad.1
        for <sophgo@lists.linux.dev>; Sun, 25 May 2025 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748185179; x=1748789979; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2v8T6KWNdY86EGnTj0qWjYV1Oss6TPbGlyKa00x9/Y=;
        b=hUYD8SiOphwWcNMeqBcqarYuZCoIYsV7rfICW06RHaiDwOmOfB1deJhC9ehVphR2SS
         gEDpaIpA+Uv3/OsQWLobwKWueVxxuFxnXvbi77afyweU+20Xfvhxcj2/uKTLxUg501yo
         UxBAOelW5MrhqMQES3QnXJGw5UTdVmc0tkiwFc7iYYjxckKRACmU5rAMOs5rxF4we9qA
         QPiAhy5IEz2yI45MlaFbcShnjCaqfAxfgKsH4byi3SK8rR3jkjG+l+cMlrr9VA/IN/DP
         U3qVgikKaGZoqSLxmXNApTwW5K2jy44tuhjUdSocC0zShsIdULRTBZ2aLfydhiFfMmc1
         m78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748185179; x=1748789979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2v8T6KWNdY86EGnTj0qWjYV1Oss6TPbGlyKa00x9/Y=;
        b=BcltVt4zqdpalrfgaybpKYISYNXtj8Akd5V/GTiojbAVZapOE5KrgYcl1xrruhJzyy
         zYD0swbMp064F51IR+ZM6/uXrddNbSvxNSvz+fjAvKQzjpYbyWh3qqziRmzHMSH7DXBA
         7YGXWskcYsH1w6LkQRcfv+cPpfw+DJJHsrXsrXGj7OZhEc5/7nqq4RtaVU6Vu2QgrVbm
         jP/FdD3Kdum1qJdIXzk+HJQ60zdajlWor77fPYJzmhU1O8eLKbp/ZuW3onfzAvNgbXPo
         H33rML8L0x5orSs5rzRF0Ge0Wm5m7ZUzIxTwd8W2ROPxLcqIvaNf9RO0n2BE8W6ZWtQs
         bsyg==
X-Forwarded-Encrypted: i=1; AJvYcCWvf09F8N+gsiDVzXf09L55UFt3iQMaSWssq/7pPbdonCpJO0vSjPegeMsqBsZJiCCxAwUG19o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwW0VHkDgxvwHKygUu1XC0wQDnqSYYw7FQKnV/qVs3TJ6+VpG6Q
	r9amKA5Iw3I5652C4AZbVSud7OnYjohAlP88ur+GBvSzmpW1IrG59W2b
X-Gm-Gg: ASbGncvxdccvWyV/ZhyRL4G5PLgN5HB12VSSVYia5tvdclnnNg0iC8z1WYNMSXFe+fm
	2qgihIQunxqRuceMrCrdWABU+8Q24f2HUN6c6EcFOACMFFAt2FMGdrzSEVuUUQ+PO3l3+6h8jR9
	x+xP6Ag+sQo2+itY2pxF6jyAYcHhWe6x2MZVWKvJgC4INPbb8YiYN8RAwFgUFEs8yLald5i1OfX
	zp1AjeY70uEtxzaBZ4ZP6kHUUDWsugg/kQD5gHvg6ksmYPmwgLgRM/uMszzfDVZuXBX5OkrJ4AD
	P0Jn5g+jVl/S+GhhEGbBsiLZjQjeA5ubXNALbiitbk4=
X-Google-Smtp-Source: AGHT+IF3VxyOXCOt5MifU2/DGUUb39EyyEwfytGdkDvdcnGlAfj/NomQNLMDPNZlESfRl5TpLDFVyw==
X-Received: by 2002:a17:902:cf4b:b0:224:1579:5e8e with SMTP id d9443c01a7336-23414f490d3mr103435265ad.1.1748185178225;
        Sun, 25 May 2025 07:59:38 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2343f8e2fbesm12204845ad.250.2025.05.25.07.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 07:59:37 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 25 May 2025 22:58:41 +0800
Subject: [PATCH v2 1/3] spi: dt-bindings: spi-sg2044-nor: Add SOPHGO SG2042
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-sfg-spifmc-v2-1-a3732b6f5ab4@gmail.com>
References: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
In-Reply-To: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748185167; l=972;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=ilUYEgJmQyNUKpmFci8Kk389OiK2lk6BxrCD1iEtz9k=;
 b=/S/3KAGCz8dlqvZlnfhD+8hHniV19KAKuwt34rdhKH1UkljaAUHveB9PC4zxaS9vpti1qMKYN
 o7xr0qeiF8WDgiC+YscypYvEUghQVx83m8v2rb1Nf2MCcchHL7XlOLh
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add bindings for the SOPHGO SG2042 SPI-NOR flash controller,
which is compatible with SOPHGO SG2044.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
index 948ff7a096433a8c3c64cba13fc1339d18f6c19d..66e54dedab140a167ad84c43f312f93af2bfa06a 100644
--- a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
@@ -14,7 +14,12 @@ allOf:
 
 properties:
   compatible:
-    const: sophgo,sg2044-spifmc-nor
+    oneOf:
+      - const: sophgo,sg2044-spifmc-nor
+      - items:
+          - enum:
+              - sophgo,sg2042-spifmc-nor
+          - const: sophgo,sg2044-spifmc-nor
 
   reg:
     maxItems: 1

-- 
2.49.0

