Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AB21990B7
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583756; cv=none; b=lgG7cnLgDQZBb0d1dOc4udLu8+bI6zuq8e+FfciwQ6iqVn6b0TlIjyGw9aV94bpw1vDk2MbJ8ApfSgAFOXCEDqq5rQ/cUogcudCbIkQKsX+9cv2V7kCSZ+YSlGH9LLqw2xS/Z9MwtqQwv65VUMNOhCcVkCHFBwV+5W7R83FLXLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583756; c=relaxed/simple;
	bh=KgWPOmCTDfESrFc3oAhBJr9hYSyrIkSb6k+czQLd2Hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rwr2ShRAzE0DrM91dRhR7HsLwnj7mm4yWxDDDVBb5CsaBWhniUQ7hWTzLIw1hzNJ7cWlEm8tbZkgLRiSUEFGHIUwKCfbDetXLK1Lexz5vbCS3kUlHwZ7RCVbBQv7vH5+wHiF38bsJOthykdNXMHZFR4fTqdxg1/cqtpQZZsCdAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFoirRy5; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFoirRy5"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e8fce04655so33002066d6.3
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583754; x=1745188554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lZgrCqn4zngJRfX+93MR+1Yhh+ysY9LollV+OpmUio=;
        b=VFoirRy5wfvz6+TELXBL5dLxjimk4suu+8E+9D47Pch6XyBPhGm12YJ1J4UcZRxGko
         GV/QEqGrq9tOCGjrcrL6zT0JLcr+HXP+SiZ71hjlMQ17N47/7tWEzmaYGl2vMLmY/Ogm
         iI2uZ0+QPcqMgLGSUJgeA6KBrN5qtQzkS+m61Jg/F4SBCCg10UFnY8AZKLSp595o5NnN
         7atADLlMs1scpds6gpSrxqJ3t9Um9XwEvn0xSL/5leQcUcgGk8WGm/tgaXgcAndUEiVN
         vC7UxEK+0rwrgpGMWAp67vwt4FMkkyncFh0uxwrXxgD3GgRGVXBrQlBLB764cvaLzvjx
         A6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583754; x=1745188554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lZgrCqn4zngJRfX+93MR+1Yhh+ysY9LollV+OpmUio=;
        b=E4CrZpPf0FBeA6tZYn9al5EN0DhQxPNlcfGE6XiHZVS6/dNVWL5gYby34NI08H2Gdd
         7mbo7mXlem8/nLn0ZHeOd5g15r0GDlt7kSVLV8rdc1veuXeosGco2pTUYlBMhgQKIGsN
         QTcVh5QAJI6JweuqCi0ir06j1V8M12wHRIRigCvE8pN2/xQ+kYMn0DL19WSGOTNQZedU
         XS4cmS0Mp2Mb2D7l5Nbt20oMy+VasZFx/411lbl5T5kdBbWTqEr2eUepUL0xZsw5AhsX
         /CaYLGK4l0fH+3v6RI8ADQt/OMib1PN55n33+r+COOkTwTf2YrDzMSbTfWCQz0KwNEX0
         /iUg==
X-Forwarded-Encrypted: i=1; AJvYcCVqkGUAyzUFXjEPVu2ELb4qedgeGxJHh7gSL6Tw+2bnw9budr+q9tHQxf4kI+nOVRuLt6aemyg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmNv14G2+Mh3atQRFUQhKVHkVNZZlLEFZkycqIoj3FIgzq+m3g
	S/90CKTGwRJXcT3oRPu1B8TJ0k6iRGKPoLInnwWIWiH25FqnKCfe
X-Gm-Gg: ASbGncuZV29xo3BaoaWdcki3/cI+uVJYC9gH0SkfscEvJrK8qFm7Y4/GsCrWx13AxIj
	7tuiebC/ts63e63L5Z4zHtiSb6+etaXcWJnnrTSILWA9iNve6u/NHJ68VsdxZk9JNpQoQpYOEat
	v15bUoD2uCLbWyP+WFaC0I8meYSr4pii1UOHF2ldrvduAxGiQInOOv2d3HcFKx3ixsLtwsIWK08
	pFhnOHXp3i+FtofigRx1phDf/uMXgjoO9ixm85Kk/vqQx7waRPjy4PRb90BlWoeXBHBchHxLqLF
	U32KX/nSWgxwZUPc
X-Google-Smtp-Source: AGHT+IG8shp+cdQMktaiCiqRlTfz3GoUb3+xi/ND48l0w/3Coj1X/4luu+R/cZPmG6Hdy/95WINopQ==
X-Received: by 2002:a05:6214:e4a:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6f23f15b763mr155629336d6.38.1744583753719;
        Sun, 13 Apr 2025 15:35:53 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de837f9dsm71293886d6.0.2025.04.13.15.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:35:53 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 01/10] dt-bindings: i2c: dw: merge duplicate compatible entry.
Date: Mon, 14 Apr 2025 06:34:55 +0800
Message-ID: <20250413223507.46480-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each vendor have an items entry of its own compatible, It is needless
and some can be merged as it share the same base "snps,designware-i2c"
compatible.

Merge the duplicate compatible entry into one item entry.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/i2c/snps,designware-i2c.yaml  | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index bc5d0fb5abfe..98567dc791c3 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -32,15 +32,12 @@ properties:
           - const: renesas,r9a06g032-i2c  # RZ/N1D
           - const: renesas,rzn1-i2c       # RZ/N1
           - const: snps,designware-i2c
-      - description: Microsemi Ocelot SoCs I2C controller
-        items:
-          - const: mscc,ocelot-i2c
-          - const: snps,designware-i2c
       - description: Baikal-T1 SoC System I2C controller
         const: baikal,bt1-sys-i2c
-      - description: T-HEAD TH1520 SoCs I2C controller
-        items:
-          - const: thead,th1520-i2c
+      - items:
+          - enum:
+              - mscc,ocelot-i2c
+              - thead,th1520-i2c
           - const: snps,designware-i2c
 
   reg:
-- 
2.49.0

