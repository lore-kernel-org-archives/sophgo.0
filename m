Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93915A93D
	for <sophgo@lists.linux.dev>; Sun, 29 Jun 2025 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751185427; cv=none; b=sV1TLjCXKzjEkd/xQQ3v4BS4dP81KcLmFfIzBcp7I+TdrPp9ElfACC7t/yGgDeNwG73oM8wsWY4fWspr/oGWEwL+YaXjCpRXrzJixj69mEFDvYq19zAkxXnSUZzNqEUkBu5HKVAeztxgv9uzDHctnX65XMjK38GJgWmivSwnV6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751185427; c=relaxed/simple;
	bh=ETMNqPLnrAXwhjSmox3seEy1rdOzecBNyCB7CgBbOLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S9WLmt/G+cG6q1V3sH7PNUUtphEA9WvNgQD+EYbigFVy5rWwz+dB/QVWKgfZUncyTBttsmP4UOjDPljYcQG9nr5r6USyvTjugqzkK7rHqN4322A25M5BfLbjRLTd+7tVTcBN6jTqfnp0iSA4Ti3RA/5N3AIhmf0KsosJw5CTP34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYR/yMZZ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYR/yMZZ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2349f096605so10193555ad.3
        for <sophgo@lists.linux.dev>; Sun, 29 Jun 2025 01:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751185425; x=1751790225; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5t0qkAHCUwUVEonnqGFQqn/6cdBXFEA5e8qoGS3Oz8=;
        b=QYR/yMZZOJh+8OPOQBTHmgZIEqJ7ErkUng2fs5Hx2QK1yZMg+NpM1oCDlv2KQlEt/p
         xkVP+okUbEByI0V/dWG+VL6tLer45m4/jPAseLe2G4wj0tkE9AStnl9GLlfdnK+SgQpS
         cq1iDSFx5+sU+lsvTMm0srJxX6DbM6A1IYRNGenbz8BnolROqL+c+c+RVuROA0/d+P0x
         g0J2Mgm7bs0AVZc1GPmBccsZzQ8QheQLBPE9tn/SYoNDxgpRgWhhSVVIQ7TevqZG+edG
         THgSvZ4qt57e6UuuzIb5p6vri3ZPTIo4XVsmX76qhjWoSBAtR3IiCPs6Qsa46MNiWnWn
         JCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751185425; x=1751790225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5t0qkAHCUwUVEonnqGFQqn/6cdBXFEA5e8qoGS3Oz8=;
        b=loos3RG0IWLTLMgf6ZBTFg4I7xv5ER04WXPAb6FTYzffKl8OSoYJR7N0nySOKi1TaJ
         8HXxmqoOyWaXxBSf8dnjeWyblWJAXczKg82ZDePYkRExOYGzGQQw2YVWzaiokm4XJCMA
         p51VCgU8wbGyM+vAQHTvtRqJGdePvWcaQrss4o+vjHRwNiqGPdPv9kCctl5OjmtqOgWj
         61+neNoC1YG7jYlGWElRK87rU5+c7HHzphfSUyP8CmNitrLPJTSNBIRWcA3O6kriAh/G
         GSMKeFs/dD+2/7v6g2WGEBp1KBYNIRtfrKoUhThNNsHrYbJXmFfTMXDUzQRvjAgPBsqw
         lENw==
X-Forwarded-Encrypted: i=1; AJvYcCXDqumkk75NZpcsNH0caeTgmEq8ONMKdMSIMZs0I28wsT3OVLpDe3o0FOJF7R7+B2f6AwOwWGQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfrEZ2cuRC1WcSSvgrkyZoYg0dWp/872V5t4yKXWb8kGL2bLeM
	LILubSJ9iIDug13ggl9Otn2yl9OAjPWeWstUeaNVeedRKG9eZ+C4Ep2b
X-Gm-Gg: ASbGncsOf0LsyeftSk1WWBpkcqr+a9LBQE52vtQh7zdMpKAY6I5qKlz//fxURaNVNGb
	BUCidFonnEXRsvO3xzUy1NTi5Fn6ZOmFZU/iqkyPaG8QkJwICMDpdXF6N3T4FQhySN9XzBT+vie
	r7HgwuuE5vx5DidCMxaKJunmnuyynrkRtd+Nw+KZuch+ash1oinIPz4m6E1KG2LZh2Q0aHga5XW
	rXr9Y5eT5o0gDdCur+HtYmjYcYzjcAvvOSChW9cdKFPHwx+EdfIohEztxM1jGW6Vd39xBZQ3c/F
	GP8kfhOCoAPxLiF0m65nO5v1wQ29xtNr6liIkSh4l4g5QWYunh58Bw==
X-Google-Smtp-Source: AGHT+IGbMuEWFzEQmcPfSGUyuO/vpiR0F/dpgN6q2wxjWT/5kSKuK3KVHvhvvINAfAKvfiDaNX3KCg==
X-Received: by 2002:a17:902:d607:b0:235:129a:175f with SMTP id d9443c01a7336-23ac46527famr141581505ad.34.1751185424260;
        Sun, 29 Jun 2025 01:23:44 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::168a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f542661asm10495839a91.26.2025.06.29.01.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 01:23:43 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 29 Jun 2025 16:23:10 +0800
Subject: [PATCH v3 1/4] spi: dt-bindings: spi-sg2044-nor: Change SOPHGO
 SG2042
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250629-sfg-spifmc-v3-1-28db1f27e999@gmail.com>
References: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
In-Reply-To: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751185413; l=953;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=ETMNqPLnrAXwhjSmox3seEy1rdOzecBNyCB7CgBbOLg=;
 b=Ua4qsIQdrMlRlRlRmLVxWOFnI0KLWyYbMeNhHAXkmgvG83CASwH+MS37sIVU/oD/jeC60bVwg
 AhYJmFtW6lHA+b5WGe/HJJWjLetKnjitOuWS/eOms3fYxuQnZejtDr+
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

SG2042 is not fully compatiable with SG2044,
So it is necessary to become independent const

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
index 66e54dedab140a167ad84c43f312f93af2bfa06a..1299097a210d5074cb23b644d4f102a2fb1a0e3a 100644
--- a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
@@ -16,10 +16,7 @@ properties:
   compatible:
     oneOf:
       - const: sophgo,sg2044-spifmc-nor
-      - items:
-          - enum:
-              - sophgo,sg2042-spifmc-nor
-          - const: sophgo,sg2044-spifmc-nor
+      - const: sophgo,sg2042-spifmc-nor
 
   reg:
     maxItems: 1

-- 
2.49.0

