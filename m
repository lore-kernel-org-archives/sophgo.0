Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E1E2701A5
	for <sophgo@lists.linux.dev>; Thu, 24 Apr 2025 01:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745457892; cv=none; b=Fbx0LK9z+ciRKUFbRHexRAMziZbncLND6VgdV+N4ln798QPMFTOA6djn2ifvXl4EJ+MRmUsldTzJTA0WSpGjPVyuuacipIDMWpyuiTx876PZobV13w6OyabcJwLbI8wCiUhmE6TJY/Jwe2+kLrVjLhKLDo8k60omNYXc/hXNHG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745457892; c=relaxed/simple;
	bh=NNcZO28M+TCNaUNeh2CyJoOkvA5xCbtTntq07ND+tlw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AvKI4dcSddPO1uYX8pKkHjOGqEPpiQQrCPSe78OkUsvktoosqNgMP8VNLHjjrlHIcOdnotvhqFt+HVeUx76Sjb0941/TRhJEvhMrENEQAiRyZm1G0NLJJTmjHYaWZAR4e+PpSoGA5TbkF1IkNhAxHzfZ28YNw6Pz6tZ2rXheXDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTWcERVQ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTWcERVQ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736aaeed234so356712b3a.0
        for <sophgo@lists.linux.dev>; Wed, 23 Apr 2025 18:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745457890; x=1746062690; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DjSk/riKS3EidNdWxegqsSotH7MqM0ARsO0VOGtlQ00=;
        b=JTWcERVQ2XlWGc3Su6AT8L5jR/PpFbQQAX4mvim8bbjl8RwuLw/pcG9UKYZPaT9iu5
         f7LDah351eyFVbsZzWSghJZZAxLe8ILY576X3FiW4pmAvgCZgETfEzPYEwtkC9xXUt3O
         H/JMT3HtVhEjy/aO0phYUc5vJ/HCu4VVKN7OP8yKxvew9w0tDfBwJtqofx5OsSa9p7KT
         qYVjtmFBYj+2xzUh3GRhKBGsE0TgDlhOExQ+uXJDsltPLM9+Fhps7VZEHunEk6DlsxRK
         CvxIMpc8zsuwTUMTko2NkaRbNeIwMSuaFmGg+g8i37u7l5MBqAYnwJkqpmUaPEO2p0Yb
         XqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745457890; x=1746062690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjSk/riKS3EidNdWxegqsSotH7MqM0ARsO0VOGtlQ00=;
        b=hwMINnapMdjrVdkiA3HDBHKjSDSgZjHedBZxWu2+OSacWRfbtbFQUGPvX5sE0HQBCC
         TdmmHUeoZSPP3xsHigCUEF8kAlIt0+0pQ7NpytMSmVvvFPQ0VIbjupVw5DmnAvQzIcVr
         LZGMIlJporW1UcwUQyMC2hbeFyLRHB58QLwUu1yPZ0Xatc0Ak/UWDSnY+3+5dZhwpwlP
         6J+DTDz+xNDJyRXGs/F1X3M7erszS8V83mqTzJoDORBKz5a3RmEMczGaR8QigC1cXyYW
         kvYcrQr8hrQk6PJP0z0N4bfZrq+6AwrWXw8mbLwcLVFXGMFTKS7yiu9pliBXVG3PxIOj
         KbBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ7liNY3hSKhGiaekrO2TRGJFxMa+cg8YGA9LPsc3d6P+y1CoJQtz2nKs+087njObDFaVMsQ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXyzkFpB6gCFgh23YTiz40yLTsn+rMl609u20OCwZbo7qzXyCr
	quhkJHSK+q7i4a2Fwx/0efVcu9zBPev89K9lCti5BuCo4UkBniqwnf8ung==
X-Gm-Gg: ASbGncuPwoN8ySUXh2q9e1nNECM2zg/ppYCWg+j/FB0h9NlVnUhPjPnPN0wsBd3awWK
	s3EMPeriDAx2PmAotr2Lp9meRmOsnPQ2HWhnLNKOycDJ26ygYam8wO0eRXFKKXLkWUmduEX2yl/
	oonIQdUaxQOK5chOnLo2BdxFxFzjgZfhWnHoBoVrx/PEij7NBRhBgCO/gUv8UIzL31BVTJkmqSp
	xV7g/4IlQl38KF8lN8/YFP6nICOV5xZuqd0MzXy3bvgVh9JZjcNJ4Zk4rg/Wpu57eH7yAlj+gO1
	WRK7t45ceswVkmYQf1yJByct76Vm8EY=
X-Google-Smtp-Source: AGHT+IH+pq8RZMe2Oj6MQ/A9accMBVAbgt/Fo4AIrfNJvsNkLTtCSnyDrQrKFJLlIeZGRpNmZKTc4g==
X-Received: by 2002:a05:6a21:39b:b0:1f5:7d57:8322 with SMTP id adf61e73a8af0-20444fb9aa9mr966608637.26.1745457890068;
        Wed, 23 Apr 2025 18:24:50 -0700 (PDT)
Received: from cu.. ([111.34.70.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a8cdsm231049b3a.115.2025.04.23.18.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 18:24:49 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/3] riscv: pwm: sophgo: add pwm support for SG2044
Date: Thu, 24 Apr 2025 09:23:25 +0800
Message-ID: <20250424012335.6246-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds PWM controller support for four independent
PWM channel outputs.

---

Changes in v3:

  - Rename macro definitions to unify naming.
  - Modify code style.

Changes in v2:
  You can simply review or test the patches at the link [2].

  - Modify variable naming and code logic.
  - update "MODULE_AUTHOR".

Changes in v1:
  You can simply review or test the patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/20250407072056.8629-1-looong.bin@gmail.com/ [1]
Link: https://lore.kernel.org/linux-riscv/20250418022948.22853-1-looong.bin@gmail.com/ [2]
---

Longbin Li (3):
  pwm: sophgo: reorganize the code structure
  pwm: sophgo: add driver for SG2044
  dt-bindings: pwm: sophgo: add pwm controller for SG2044

 .../bindings/pwm/sophgo,sg2042-pwm.yaml       |   4 +-
 drivers/pwm/pwm-sophgo-sg2042.c               | 151 ++++++++++++++----
 2 files changed, 125 insertions(+), 30 deletions(-)

--
2.49.0
