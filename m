Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F365C6088F
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 01:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988042; cv=none; b=VVnBL0G/SEwnuuXSm2kRLEmWziJSpUVbrWHEl/X7SlaWRDdoGoRwE7fSXc42ZwzXX2i0hNakHgkidXjWu7Vzn+T590Efr09vaz4meiyPswXyIL0wJUjfdQd/1Mjbd7vup03594ZcwiYBQCeXTDHhhDx9VIRPzaeBw/flidqEnuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988042; c=relaxed/simple;
	bh=ynhhcwUo1f150hGrFqj3199JYk2ae3C5gR/H9LcXv6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uEpLEC9ncnQvXE/V76p6OTqW9U2Y9f19zOgoGT3HspBr6p4jDcrLxPMjYJUkaCYK3ku47SdvhUVRsdQy1IMfIU4XfuRv2+taN6Sw0hdE3/BirOIRzrkvVGVp1athXBFjhi8V7GlaUGzbbEgXMIBg+Fmv23/YV2vOfMFQlcwW5Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpkdMHbr; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpkdMHbr"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4767e969b94so69106361cf.2
        for <sophgo@lists.linux.dev>; Sun, 06 Apr 2025 18:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988040; x=1744592840; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrYRh8veKbR/WK++iUDgB0vjWe+7SJfZOYD+1QkYjj4=;
        b=EpkdMHbrepKt6Ew4lE0p1LnXPSh1Kzx7Qv1sK0iPhsEPYkddE0O/zbUgbXFNW6tzHP
         0tndaERMczyZnqkusyA77gV+6QDkdd6Hdn3hhplniSf+UC81SvMO2ejvSHJV9f/Ftdnp
         KB7uVgqv41pzkCPyVpHMWmkpiSSQN70AxWiS0eAmS82jlKKewWRFSVpJCQtzwZa3AcNF
         uwW5iuswhE9SnpLK2nuvd9176KQKn8P2b2m1U7yjG8Wag8WFsHUqWYFW8dTbkHzdxVwS
         15uX7dwDx6QVr9REWUJ+d0XEl4xbg8x2ZHE7xHGc6Ad1FlxwMvsaK6lTj47r7BCKTdhd
         YbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988040; x=1744592840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrYRh8veKbR/WK++iUDgB0vjWe+7SJfZOYD+1QkYjj4=;
        b=jnWAwxcWvesVZ7/IBHlYeLYO4XCcZr69og1Cn5VYsLnuvwsM1ktpmO4s3sBGTh8blv
         fnavgF3PvG3FIhYoKm1lxmkEo6fN5qLnGoQ0FAFew84I4zIPX/uAqmRNV15KvRN5qKGi
         dW1BX0rKd54N3iEz4KScROJOXW1PGkdlTLbUWQDaUfhaDfW9v1bpb/uKf4kIkv0p2ugE
         tCYhBiv8wtOp8jOmsEZiqOFlnXJovmWF1t03AY3taL6k0O7Sn9Fxzew/SHgei4leT3XS
         Ve0DHbedVWYO3Wy28QVH0jUSXBs9opyOWViWaIjGuYrFrOswYs2iXIdbbLWYiwfZTCMw
         C+RA==
X-Forwarded-Encrypted: i=1; AJvYcCWzj7T5UaRgoq2rFh93QQ8O+Ib4eSfJOrMgSvk2q9FjroegoGl/593s1qBXJ5QVoZZjaH5eGts=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJg26h39jMkKKrKK08dAkPqXFMOeuVs6VCkWQyJV1QKiTBK+Xn
	f4S/6Yosbm1X2gJltxm83VSBv/vkd6xR5YYOW+1zj1vhTCUWNlQj
X-Gm-Gg: ASbGncuFyfDebIOqBrBLRpZfxQWA7bP0e9tFJgmsE7+/SpTZXcSBIbmqAmuc4GZ5R85
	UK3wPXfpgXf0FG4LfHUNthYYy0Q4i20vpX+QUw+85hhn0D+gkGiU/wObcHLtF+mZeuHcAnTO2lN
	lHBCLKaES45R8Xf75qnbyVvAFQcCeqFURBMHS7u+ONR7csGNF0mRpcTObH+6iSLS+sKIn21GkAw
	TXzEb+Kx+BLE6DPHuOqSOmS5bRWMwqTqgMwm/Xu4swTXdAbD6xB48fkhJ7I+Q4q/21QNdcpsX7d
	3GdkzrwKyNjtRcshdJNT
X-Google-Smtp-Source: AGHT+IF7NSVs2pn61LScnRGHsXZgfeBT74D3nMQV8mVDwQLJa+8ffQmAQysOQ6zzmkdzOgl32XpRIA==
X-Received: by 2002:a05:622a:11c9:b0:474:f1b5:519c with SMTP id d75a77b69052e-479249a8342mr185000501cf.32.1743988039684;
        Sun, 06 Apr 2025 18:07:19 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4791b1443a6sm53214521cf.78.2025.04.06.18.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:18 -0700 (PDT)
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
Subject: [PATCH 7/9] dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C controller
Date: Mon,  7 Apr 2025 09:06:12 +0800
Message-ID: <20250407010616.749833-8-inochiama@gmail.com>
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

Add compatible string for Sophgo SG2044 SoC I2C controller which can be
used specifically for the SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/i2c/snps,designware-i2c.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index bc5d0fb5abfe..677b39865af0 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -38,6 +38,10 @@ properties:
           - const: snps,designware-i2c
       - description: Baikal-T1 SoC System I2C controller
         const: baikal,bt1-sys-i2c
+      - description: Sophgo SoCs I2C controller
+        items:
+          - const: sophgo,sg2044-i2c
+          - const: snps,designware-i2c
       - description: T-HEAD TH1520 SoCs I2C controller
         items:
           - const: thead,th1520-i2c
-- 
2.49.0

