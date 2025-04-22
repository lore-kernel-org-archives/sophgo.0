Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A221C5490
	for <sophgo@lists.linux.dev>; Tue, 22 Apr 2025 02:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745288849; cv=none; b=EIj+z6rinAAwIri9bvP1ldtQhwGAQTMYPRFa3Lp1QBt+JsC0u+4m07uGFqIGT16o7ij9ZdspLEnaNysBo2hSwkFhTLuDdcFMvP4c27Nhbd1WSMV8hnnEEa/Fbs3IGyWYDz9fPLXHODjM5YhsQqco7gLvR7enfsPRnfzRZRmoJ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745288849; c=relaxed/simple;
	bh=tfDazU3c4sCQTaha2KecC0sDtKELmF14aksargEQ4Mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s/fXha37T2Qg6JxtqSET6RXrzHONS0Sq2IFPNcv+C4Iim3sBQhfZ0JZQSPk+K0TkvUdFx0+4wftiKEpZpSlK8Gs0myiVoAEBWaNxCYsJ+sC43zHzEvffsiPkVQzix9Sfbblv+Yz0VyLpnthXQFSXLcJNNQPMsk6NR2oRQz5nrCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGzb7yOE; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGzb7yOE"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-227914acd20so43849775ad.1
        for <sophgo@lists.linux.dev>; Mon, 21 Apr 2025 19:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745288847; x=1745893647; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/Rkn8NRc4ZG4GduUL35RYohUYa7cO/V2efDHxSNHpQ=;
        b=IGzb7yOEKkjSJBJIYcY2Dm0hZN8IMKNTFDHfBskWqgT70nYMSRKcVN+nAaMO/i5wRN
         cfFjbzWShNWYTA5gFOaM/xZcY0EcU+8vPqGv5lDUnZb/FvJBSVowDGhcl8G1KStMwxj3
         ILfL7n1nONfTfxF4+gel73lVRuDsXQdwm8rG964IPuvFDLVNAkcimtSNUFCHd9rpL8aU
         tj4+oQYUaLngFiRY6SINbV91TEAqcFNfcUGKafZ+UU11kGcKck/w/HPQsCQVkRR5vEn1
         P6DKSRq11clrA9/svLRW50htEmUK7fDl/5EdPxmmVpZhQMhMXPoNUcq41ZqNGJZgOQW7
         i3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745288847; x=1745893647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/Rkn8NRc4ZG4GduUL35RYohUYa7cO/V2efDHxSNHpQ=;
        b=XuHlDFgg3XBf4RHhT1WzUhWkwq2JSdRwfje10uiUwA6c3tWsDX0FjqtrFigX4ApcOK
         mnWmhBD+eDqvh6MYtEMcO/qj04qXhhfst7ZoMOUNrnAcLDLcn/mQfCMq42FUlkUDT0AV
         1vxvTpAriWgSsmQPdkNOdXMCN7I3RBCHWCBxztmczNVUze4EYQ4+rlSiEAKl7LXe1LBw
         +9gDU8LNErAJTmNbSoS47Vpwf11DPhb9WakarA2mFXa4DXnPKK7twXH1Cp5GdiESvB6N
         i/3nLA37uhONIxnkvC1m/MG++ahSvBhplZe9f558Ry7n0D3g7SJaKb/HVYLGkcQun8lY
         YycQ==
X-Forwarded-Encrypted: i=1; AJvYcCXenPvs0EAZpydd1BzQgU/0kDjtVcM12eDJxRNDNxXP0x7DNWrwRff8h6xFaCdZRW1460tO+qo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzzbwr3hD2e4R7bQaODPmqA2+T/QrXhczqKQPrn+E4bZ8+jUHXQ
	qZJXevWdWubqiREZAusdPjqagOVF9AJtmnMZ724C3ksXsvaBLdJY
X-Gm-Gg: ASbGncuR4LWKos09gUrv9s1amFvR9n1R2yTP03SeAG9KysB3mLtlZZ006WnmIGsD2iJ
	bUoxx7jvU1SY8nQro0gABlRL3lP79lLsItT/3y00DNm5zVsLABPvBC33m/f2BbazFo5xP4kZwNz
	IAqbWxRyOrvmNHQst9L9OOT/HxdvnaSJeaVy+UaesSTVmcHQKZuuEFGwOPDbVqmolSJZnUJaZAj
	qppCeLiOWkF61UsVyL/G09NhWXaRcJt/N3W4YMUtrSR7qELE10nQLh59XXjxmGWfQFMKr97rrb4
	MYlSZvYU+YMP/Kvl93TOMdKvCeu+Zi7OewfToGr/e/lh7LUOWZLAHojMyz8=
X-Google-Smtp-Source: AGHT+IEPAwuuwQrRGZYJq83HctY7QlqrADDz0rh531sa64aWa3MYpM1PtKkX9z1DF5vIkTNuvMowHw==
X-Received: by 2002:a17:903:3205:b0:221:1356:10c5 with SMTP id d9443c01a7336-22c50bf0412mr206415465ad.9.1745288846372;
        Mon, 21 Apr 2025 19:27:26 -0700 (PDT)
Received: from [127.0.0.1] ([101.76.241.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4ae9sm72962905ad.110.2025.04.21.19.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 19:27:26 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Tue, 22 Apr 2025 10:27:08 +0800
Subject: [PATCH v5 1/3] spi: dt-bindings: snps,dw-apb-ssi: Merge duplicate
 compatible entry
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-sfg-spi-v5-1-c7f6554a94a0@gmail.com>
References: <20250422-sfg-spi-v5-0-c7f6554a94a0@gmail.com>
In-Reply-To: <20250422-sfg-spi-v5-0-c7f6554a94a0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
 dlan@gentoo.org, linux-renesas-soc@vger.kernel.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745288836; l=2151;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=tfDazU3c4sCQTaha2KecC0sDtKELmF14aksargEQ4Mg=;
 b=tXUv/M8pocPmmvC1U2LatuGZKb4BwdUqCC1TVuXTQS2li6wJWH1xcRg999MU2WaCt+8Aa6xMF
 wsVnNvcfojdCZYREQuLeLz9gUrMc/10m6Qk0kWd3jcxeOpk8eOOqMj6
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Microsemi Ocelot/Jaguar2, Renesas RZ/N1 and T-HEAD TH1520
SoC-specific compatibles, which eventually fallback to the
generic DW ssi compatible, it's better to combine them in single entry

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml       | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index bccd00a1ddd0ad92b437eed5b525a6ea1963db57..a43d2fb9942d85b1482a52782c0a97cd5c6edd99 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -56,19 +56,17 @@ properties:
         enum:
           - snps,dw-apb-ssi
           - snps,dwc-ssi-1.01a
-      - description: Microsemi Ocelot/Jaguar2 SoC SPI Controller
-        items:
-          - enum:
-              - mscc,ocelot-spi
-              - mscc,jaguar2-spi
-          - const: snps,dw-apb-ssi
       - description: Microchip Sparx5 SoC SPI Controller
         const: microchip,sparx5-spi
       - description: Amazon Alpine SPI Controller
         const: amazon,alpine-dw-apb-ssi
-      - description: Renesas RZ/N1 SPI Controller
+      - description: Vendor controllers which use snps,dw-apb-ssi as fallback
         items:
-          - const: renesas,rzn1-spi
+          - enum:
+              - mscc,ocelot-spi
+              - mscc,jaguar2-spi
+              - renesas,rzn1-spi
+              - thead,th1520-spi
           - const: snps,dw-apb-ssi
       - description: Intel Keem Bay SPI Controller
         const: intel,keembay-ssi
@@ -88,10 +86,6 @@ properties:
               - renesas,r9a06g032-spi # RZ/N1D
               - renesas,r9a06g033-spi # RZ/N1S
           - const: renesas,rzn1-spi   # RZ/N1
-      - description: T-HEAD TH1520 SoC SPI Controller
-        items:
-          - const: thead,th1520-spi
-          - const: snps,dw-apb-ssi
 
   reg:
     minItems: 1

-- 
2.49.0

