Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347CF54763
	for <sophgo@lists.linux.dev>; Fri, 25 Apr 2025 02:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745548123; cv=none; b=mT1NzYNDFV9s+IKdwtylYOs+IQTMmbiFoOjEDXPwFSzkXZhjX2NEuKRWor6woOt7JY1+cOMHEyBGYedYHDqCnSwllODKDUzMkMEusdTI8o4NtFZ9yHHvAEJOHGD0Q0xIYCa2Sb/uaJ87VLqWw6uhE/0yXzpfcWk1LTS6aV37vuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745548123; c=relaxed/simple;
	bh=pY3vTEVbaS9arUU2DTwNLKkGCYTqxU1iZeoetYpIdvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJM7jspgyRFe847iJU3DeLO/jAvN3e2MFj3E92Iu5/ZdKejNhjse9583sIBM6nxNQq6ZzXb/e3/ok7G4uQdcFmqstxvgmblk+SzOU8vWek4Wjf/RidyZeEtGacBhQJvSvaKHdeOR90lqpjJONibpu5pJKXOG4ql6KZlf4DY3aFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QK2C/wRu; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QK2C/wRu"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30572effb26so1587032a91.0
        for <sophgo@lists.linux.dev>; Thu, 24 Apr 2025 19:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745548120; x=1746152920; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hvb/VP20MUGNozLWEP39Ab8rauqcNP3o7sMaDncZOMw=;
        b=QK2C/wRuppPkUAyFUYr1RBihpCZc4vD5GYO96A2whdgJy+FsMHjTk4l05mwVW4J6xb
         pa1rbXd2wPuwwte0HKpKK5AuNJI5l5UsaednaBcjmIPkRZMXw9VznBJErSpOPRSJ2PEl
         DeTzY2t1e8RJ8QSDoa+3SDP5J/sPpzM2dRzBhgRi8CdVfoKAdRs0JTmKyF27dd5OnMuO
         uQbaxVQlfQhelrF0sCsL/ytMn5Dyc++vcmHjzFlQaN7wUUW+q9AWyJdOkfZ7G8vvYcJ9
         f7x6+1WXZotzTq8VLwLJC/yBcKZ7iNu8FW0DHbFnhFaw9ALGjpE/q1RJTdkIwuYs/Azy
         00rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745548120; x=1746152920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hvb/VP20MUGNozLWEP39Ab8rauqcNP3o7sMaDncZOMw=;
        b=bTXGsUR20dfQR31GAgadYyXbEGDhp2hjOKUByqM21eSOzsT6zCRVRj4rQK7P0S9yxa
         /hhffSG7xmGZQDLytWX8lzr2cXs6Zfn/Q7howP5bPsO7OxK3uw+eKcsTagXT3VrDTrrZ
         EgGYPW0FQKgbuc+JISBcV9tlm/yccN2RWruYRhp5c712TfGKxGJEAVIq7fR/PDPHRKMN
         ks8UubkSOw1WEtzNYCqrqfilQqxrIMvGnbIzsIwY8GFzo7ciMBGQxRdnNCSt8ji/jIXa
         zNya1JOJmHeIVR9xFmO1yqYfrMYhwHlLPdpu//Cq5fatLqhXFNoHbUm+SkRQ0nbe4ncx
         ev2g==
X-Forwarded-Encrypted: i=1; AJvYcCUQs7iCHR68E9NpAZAehqf4Y4q+hCi1Ckd7PYTl/MA5eqd7KeYEFg5+qEwcqYypirf7W+j+fA4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7JRikKPoYaWGhH7DlWYAgHqwDRIgE4XbLKJ+sibbr+CrFr5WW
	trbxbdaHPOo8PHmd3Rew86WqlUM9t7dEEbsSPrRdj3pIs8C2qxR+
X-Gm-Gg: ASbGncs370sH+WjTqpL/tWPZiLEidqm9wCJ9jMIiKAaaMjjAYB9VZQNVOlUf42c2fwC
	dlhWabTFOiO2fo5CRafJJBCiJGF8k2ll1ChVKa4b1g0EWuC91Fz02dUg7odDy+T18iKkulUoD+G
	n5YfnT6tPxbVliq1UMKDgyUkuS3CP8ChFT5niPCtM2ntXEYjmZAyi4Q+x45UwW0aQotO2/ILpYw
	hlPKE+nNjTBrb1getfPwomgDiVDzxbVorIkMje68LwCtEm+2u9eSI6CaZpbxYOZ4FZyl/51xGoh
	L+JP3hpT522dz7g0AWOGZ6K8Z52G12zamllhBuiNH8ErcA==
X-Google-Smtp-Source: AGHT+IHYIaj7CJzLMY6PM8+BoRfshbDXB+G3kScEAt6QCPkf34bKcjCrpt7zX/Lk2ha4MMHwrFVrbw==
X-Received: by 2002:a17:90b:254b:b0:305:5f25:fcf8 with SMTP id 98e67ed59e1d1-309f8d8cd5bmr637136a91.5.1745548120083;
        Thu, 24 Apr 2025 19:28:40 -0700 (PDT)
Received: from [127.0.0.1] ([223.80.110.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d4a9sm365455a91.30.2025.04.24.19.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 19:28:39 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Fri, 25 Apr 2025 10:28:12 +0800
Subject: [PATCH v6 1/3] spi: dt-bindings: snps,dw-apb-ssi: Merge duplicate
 compatible entry
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-sfg-spi-v6-1-2dbe7bb46013@gmail.com>
References: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
In-Reply-To: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
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
 Zixian Zeng <sycamoremoon376@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745548101; l=2218;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=pY3vTEVbaS9arUU2DTwNLKkGCYTqxU1iZeoetYpIdvY=;
 b=JwqDiWAI4yDpO2RC2mJtTDqGMhWrFmg1Fq+7NA1CRh44u3baP6c6Qz8vK0YBRavQ9e6hAKevq
 DLeQoa/Qd4KDxhmlyFIAq1jZxFt9fyLvx+tgQQIRF9k/tRj8wZbc6Ku
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Microsemi Ocelot/Jaguar2, Renesas RZ/N1 and T-HEAD TH1520
SoC-specific compatibles, which eventually fallback to the
generic DW ssi compatible, it's better to combine them in single entry

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

