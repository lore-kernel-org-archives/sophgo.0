Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB161A5BBB
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 01:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988034; cv=none; b=cj5/HjNCJzPCPH61hycCf1vDLtkG/7Za1VQAsPDfB01j2zzYPS0ZiY6YQ0hsDTqtX92Kdk8siNXOyetxGKQX+63HWDPrD7gDMcRyL9MLsR8i8SfdgQW18783rhSOrusX+ZODxQqNJKGWTnwLhFwoL9Er0/BoBpJlLSIrkbcREZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988034; c=relaxed/simple;
	bh=jm3vxmg+xrH3NcRaQ2m4D+XCcm4xlRDfcDS68lc++s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GXHjxsZUpr7wDI0LnewZxIAt4h+dirCJN8IbmWh4ZQ4/Rld6CxhIYU1f88jTH46LTKtSRQjvofagiT8VUPFq94/Orq+4sIsRgZuLQLA9hk1bemVpI9bPGCUe9sY6ruXI/0z8czo7ZTmolGenYKvHIbjdOKBAwNlo4Rb7qrj25IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXJu6EXR; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXJu6EXR"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-476af5479feso37605851cf.2
        for <sophgo@lists.linux.dev>; Sun, 06 Apr 2025 18:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988032; x=1744592832; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxGj95L/w2Qzs2Ze4BgVcXHP5P/GdsW8Q50TIa9jmhs=;
        b=gXJu6EXRO6QziucF/dsGuiTqyOtxcb5Uy10euwdbxbU8QLMV5PBx1BrbmN8Je2+3lQ
         mMuDN3ASNKH9kxmK5gULU9k6kM7fxCv7e3fVhrP7nKmSk3nIffbsYUWadmjqAD+sUs7O
         2aiso05LI4yAt7aPZpzsW0k2M1k7ALcLC5iDgWBVCit/rwQ6nGESUShdvkVPeJbpvQ99
         nXbuSEU+sGdG5h1rZBwRi9oK7fCiMu6guoF2vTPx3SuonQq1xng3VafjHJSKwxu9Rwb6
         QG1jCoOQdE8nn12510i9oa80JKGriZq5ax7ViN1EWPYVTvrYj06DIthbsTdk+XnT+aEz
         fkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988032; x=1744592832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxGj95L/w2Qzs2Ze4BgVcXHP5P/GdsW8Q50TIa9jmhs=;
        b=v8Vr/KNVMpx2d8S0rRyKg7acnu7Ff1LYYgUqLUxRbOCoQMBQtdVwYYPzm0BDTHtqMY
         SLAyOOBk1V/9C8sC2VLnoUE+EPU10XNnmiPh30n0DMMIyV7fZNNoaZ2X8rK1R7IOYaBU
         Ne3Ectw7ByGDOKeSrrq68TyA1BTg4HjoBCysj2ZWc6qHJZa8OB9ifI8JtaannznMnUU6
         oK8TxCJJhDYSuFptHVV4VcAQ9kpg6s1pb8V1X2V9QqtETlAZjT2ATvcxttOovRCRVg0c
         s8e3a5KxZ6mWZ4tzXhVpTLgVnvFXZlakkU0ghndbD66Q12SfzHigjOYdCk5VnsDWrSKQ
         4niw==
X-Forwarded-Encrypted: i=1; AJvYcCXOVmevw5leNfU4xs0U5Ds1iDprUdlXxTrIAZtWjWgiybvqf02Or1sx9T70PxTuBYLr9k6FmEg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSXosp48iDFzR/H+Gs/vc8M77/4iegTPDxceFAyNXabpFFN4RY
	iiNFpm3WSFOWLsNMJQiYxdj2tZnAZ9K3DKuoIgjOwc8WCN/CN5is
X-Gm-Gg: ASbGncsMU7t8KGf0rugTBjbgeUB+atN6j37z9d4eKw8CNkmLVr0ORG/w5oBf34aBbDN
	kfuiGXZ7GqbRPBOitSvjtUEeDLPMlFfCMG7xvM2MgSEsthQhBKLMWauv1nwJ8Nb55jWgA4eZu6v
	3MGysYS3qggp8NrBEGeJbBOxgXzuE0J0qOjh/851cdn4yvaDLNKn+xg4UEg7dOkBolwpKBwJwx/
	dw3N8lGD448bNc81FJOMOoaQSX6+TP5pNu8QWsYB1ci88Io0yze7edIQFJZbIN7/KizoNdlluSO
	o7jaFch19cyeNYRmSd+/
X-Google-Smtp-Source: AGHT+IHCyM7ZtX7jFmV5IRhKbjQ2Jxv7Idw4a15oEj0OBoQ/eDrGzMbPNQ9/4L42Cket5FjlilXjmg==
X-Received: by 2002:ac8:5aca:0:b0:476:6625:eed4 with SMTP id d75a77b69052e-479249abda4mr164123331cf.38.1743988031833;
        Sun, 06 Apr 2025 18:07:11 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-479364eaa28sm25496661cf.28.2025.04.06.18.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:11 -0700 (PDT)
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
	ghost <2990955050@qq.com>,
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
Subject: [PATCH 5/9] dt-bindings: hwmon: Add Sophgo SG2044 external hardware monitor support
Date: Mon,  7 Apr 2025 09:06:10 +0800
Message-ID: <20250407010616.749833-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MCU device on SG2044 exposes the same interface as SG2042, which is
already supported by the kernel.

Add compatible string for monitor device of SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml  | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
index f0667ac41d75..b76805d39427 100644
--- a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
+++ b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
@@ -11,7 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    const: sophgo,sg2042-hwmon-mcu
+    oneOf:
+      - items:
+          - const: sophgo,sg2044-hwmon-mcu
+          - const: sophgo,sg2042-hwmon-mcu
+      - const: sophgo,sg2042-hwmon-mcu
 
   reg:
     maxItems: 1
-- 
2.49.0

