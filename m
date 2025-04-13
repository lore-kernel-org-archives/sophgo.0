Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27201991D2
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583773; cv=none; b=Plz7IPfsdoWxp/CTln7GcLRHiJbh2nAIgEMCT0jkWnBJoJCNVx+xRWnu156AqdKImy4KAs99wPe+m6+510a3+c85iXjKyMubY0mY5JL05qFLHrd6HOC23kBO56DnA3B6Z4pvRiMkMYaLcrB2EDibErgpeDmOQYbTqh7g8lB5mP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583773; c=relaxed/simple;
	bh=Cmf+gOT/kYw+GXuXaWBlLZn/6sHqvZs+gjPpz5AiIIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AMWo44dKTUENd3RQr8bwU1SnduFDicMRjO7W6afyvFfc5O4a5ryvC/e7tOtZS+rNZcVvM6kC4VkUL4ucVpm21SU2mJq7aeQE0Wy00BOi9iPb7ZIheijZPo84s8xUlQEiY/govAKY5N2fecN3lW/dJ+p6dbbDW8bPlbaVi2/nJoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vc0VyHAP; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vc0VyHAP"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ed0cc5eca4so50675706d6.1
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583770; x=1745188570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytUlfm8qXlr28wKDzJ5vAM4ffHx7bGxIhY9dR92BS0k=;
        b=Vc0VyHAPi84fJBrEUXkskAWDhoEaCPPFBTkLZgRWbsBVoLvnb1SsZ5ct9RuqUnnIl1
         ugwQAv3sjTZ6aLNu3+Eu19alg6KROjY8UY66BBGBDuHsrzlfF00QIawn6ZwMUOoJPVBi
         lgpGJexGAYHIFj0ytT9tgv6Z+2zFMl+yeZGxUDvtYHA+dj/gg8qeF+HFDl0GdwRMNuOT
         2JWd6CdYgV/0RpaPtxjUDBAmOO22eJZVKwCr3JhbAZ3vDQj391qVZ5NQ6pjdydVEBYlR
         gCCOnwLSDew34R3DwvEYoaITMoJ5GqddGEXx9fG4x6dKTpUCWMD8vM0By6l+4cERQKkf
         ujOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583770; x=1745188570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytUlfm8qXlr28wKDzJ5vAM4ffHx7bGxIhY9dR92BS0k=;
        b=YpPJXwZnNuq7u7Lz4SIHGcFYJZ2DOhaZGchwyLo/iLIDji9PbLyVO2WKfo09vgCGOr
         DA/PonzVR/TZWIaaC9oslqodJNTGwTWiZr+6uRPPaMGvQ2M+wm8jiOeWv4jQh/5MezrJ
         6hXwJ7SgjVQ7r2R0/8DdLo6BnLwn+INiXfwZuGdlIfrH6XCcsWQnIc1AhlJkQudU09bd
         dHJA0KoOA/4r7FvU2A86i3HX5Vbn6QCoh/DNlTV+A3UbnwA90lmVxgiRCZUUd0ILTZSF
         7bEo04u3LYScDBL2DrEWJH+WhLY5op9ujca/jxp5WWuNH0mossNyLkqZRPne4xjyi3Y5
         5bKA==
X-Forwarded-Encrypted: i=1; AJvYcCXuUx+PWr5aZC7glwW6m8fiQCJTuMNLEcZ4JA/uR/D0DIGIrlRXD4ZjZw0fwrykaX2xUpBezkw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBx049ZRqW3rJLBxSbO3lFhBAmSy6jLym+U/QYWHqzjEcEcujk
	+GqrNoL5a8GosxZdhW99n7eyhaOsaXNtgvanUCiCVZjU/8GAzvSf
X-Gm-Gg: ASbGncuQw9026ZUxuF3MGcUeaRNrLcjlHcI4ty9vHhQYlm34EvMrNzqAWychXnNK2Cj
	KbOiqsOI+EgBL1gqecUat+m/rFV1Ym9PghjjRjkYIK6YZH8lT1KanRdDPYv8RxRF+Biotmgk6Qx
	STyUgQ+WwCHAkiELP9Cxt/6o+3IOs++8z22xdWScT7hBUQuA4VJ+ur6yEYYX3XnRgZPbJz/Smov
	rABbLmTN5V6YbLKYlG5D3aQLZz5MMI/+EsM9nwRFZ8i5JkV5LWGZevEPDWFAZrrNJedVRPBBzZW
	sk7JGzsoYsvYnV+9
X-Google-Smtp-Source: AGHT+IEcPAAd/YdhD+Atm2W3Vnu34/pb8kOdXsK5MR1PkYT0dx5fqZg9D+xlK38+CA7lSZP33riAiw==
X-Received: by 2002:a05:6214:da5:b0:6e2:485d:fddd with SMTP id 6a1803df08f44-6f21413e725mr180382056d6.1.1744583770550;
        Sun, 13 Apr 2025 15:36:10 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0dea104f4sm71033126d6.110.2025.04.13.15.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:10 -0700 (PDT)
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
Subject: [PATCH v2 06/10] dt-bindings: hwmon: Add Sophgo SG2044 external hardware monitor support
Date: Mon, 14 Apr 2025 06:35:00 +0800
Message-ID: <20250413223507.46480-7-inochiama@gmail.com>
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

The MCU device on SG2044 exposes the same interface as SG2042, which is
already supported by the kernel.

Add compatible string for monitor device of SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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

