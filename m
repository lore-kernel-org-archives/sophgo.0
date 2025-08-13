Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6464B2BE039
	for <sophgo@lists.linux.dev>; Wed, 13 Aug 2025 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755074016; cv=none; b=hOX3Z4SEV8vAyr0XKF6FndgqXzYn5OI0IJTO0pe9FpC5omlCe6q2LwhJHMxr90meqTTTxy1Stj2dCMxHQPv9UXbaytvBoMdiu27aRy9OUqWhNYN9ZnBIo4SFBKB06QYM4krRVBnceJh2CaToXpcPa46KeAWAJ2S1Z76Psj+eDD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755074016; c=relaxed/simple;
	bh=r6Pn4FavBLGpo16RFcdQETEDvimR9cNcZh+43E6Wt98=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ICvhBMee4es8gMcOmJz5JJnEuQVUhefRqNYY0abC9tdWQqJzLa7f6qPpZ/d+zz1ijOy9/ufZusG3b5/xIFzYw56xmwzHbz8XHgeNyQtAcxQe4FDlAfOQ/Stqt3shMnNbyBiapiEGKdr+xd2krwesRIrfZgVgX/mFG0TtmU7TEVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jp40HMHi; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jp40HMHi"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7698e914cd2so7720546b3a.3
        for <sophgo@lists.linux.dev>; Wed, 13 Aug 2025 01:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755074015; x=1755678815; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JPDzkkyEE1PeddGvWneD5aTwEAedh3goCtrGQWQAwUQ=;
        b=jp40HMHiO2cjIr+b10qPXu1PxaCQOtTZ3O5mYQCNGtp7gnvhleAQmD0SeTvFKLtcQ4
         PnBk3Fz3p7BqTjfsiZP+p8K9D1yhrLgVqKNtxOqojHpz9DfePSHYBhk4SnCM/fK23nrX
         KQhc7T60ke4twv5z2Jice5pQB2Px83kYg71cpbspG5fdhqfiT8wRP4XIzaKsBHvDoQ6U
         I5ODz/4L2s50ci3o5YHAKkZIjqnkO3HG8JYfk8S0ePVsNDL0CKr6AwN16m4JDnx+xvtG
         9Ls6olwjTEVOoNQz0UuJRABJUBz6cAYYgk8hFyMdPMN8Ylx3kfJswRWTryGdC4+g2dSv
         WxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755074015; x=1755678815;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPDzkkyEE1PeddGvWneD5aTwEAedh3goCtrGQWQAwUQ=;
        b=bP+qdeTtolmG/jtSGPRFYFWfl6SvKuyfe2bK8Z4pS/yd56UHoRXZpboJwvJngGwHs0
         OS+6lGIPim45ZVgkabNEC/RbHQkn4CQEl83QkpDlTDwNuPrgDKmzIJF8xT07S3MKeSti
         NJNypXOF6+/ISo5tcOxJqa6d9Uy/DnvQ7tkPNygOr7zPwEig6bCzYid/L/xJ6jsMZz6u
         clIjJx9rvrNiiNrGHz2c2JO9p4K9BpWoNnKKZcmv5LukU5gXti5D4kXiGk86PZi7iOC2
         58GoV9TCWLlpn1k4sIz6OUZ4LJRPIjOaxA+vuccfdsUX8CCndT1VqaZEAyWr01ZX1S3+
         mPog==
X-Forwarded-Encrypted: i=1; AJvYcCUfiC0QbRy9WvMY354bNDnLNO0M9tlKpQCcwK9IwG/z8JfkJ9pMmgzZ3q+ycjapRNuxExMcSJE=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt2iknmohjA8gPdmvDN56p0ar6cDzNbSQE7HKZCsM0kliuH3uD
	KBin5DBGpg24JkOeRlG/kM6PCQehAHVuvHE2CjToQ8cywMRNMYXmhgba
X-Gm-Gg: ASbGncvp7+Ccrh6627q9Sor4D6Ysg6/ZUibObfgpE5LmuVL+cpiYO1/oDIAWnOpUucA
	OufUwrNAoabx4rFj/3ARs6WoBxUvYkutSB6iIiIdbOjYBM1vPqXQbuSz0Ae9I5yHHryGP6WKjCk
	kh3mXAR0y8PEFiFJrz/3WoTGqlSczwNemNS+Mndl6w+1H7gtGI3S3XwWvLiXJkTz+yNU6Sa4ByX
	eyRqjpe3cuw9w/a6+gPhhVLzB0LTK7Gob7/NzJjRdqEoF5j4HjqHIYe5cAnGKy5zwE7g8W+mZ4x
	P2A+zkQlWZ2zIOsC0E92iaHe2cIuPHQNN7RNEV8VRKIvnpZDIB3O4WH/p/dsWpYcr2e88vUsL5x
	T39kdrHoBG5Q1S+WQU9spgQ==
X-Google-Smtp-Source: AGHT+IGMVj5qQgOEZF3d8kkN+1z3WSDn/Ir88GWROkr8GIB4WMLaFMX45LhxQA3lGXmOJzy4c16XnA==
X-Received: by 2002:a05:6a20:42a3:b0:240:1ae7:d918 with SMTP id adf61e73a8af0-240a8b8f9bbmr3831126637.45.1755074014305;
        Wed, 13 Aug 2025 01:33:34 -0700 (PDT)
Received: from [127.0.0.1] ([36.255.193.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe50c8sm31307814b3a.120.2025.08.13.01.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 01:33:33 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH 0/4] Add SPI NOR DTS node for SG2042 SoC and boards using
 it
Date: Wed, 13 Aug 2025 16:33:16 +0800
Message-Id: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMxNnGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0Nj3eK0dN3igsyUkmLd1FRTMwMTE0szy7RUJaCGgqLUtMwKsGHRsbW
 1AFUvfmFcAAAA
X-Change-ID: 20250813-sfg-spidts-ee56044969fe
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755074006; l=1045;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=r6Pn4FavBLGpo16RFcdQETEDvimR9cNcZh+43E6Wt98=;
 b=+JRymJXHHVyT36A7Tp9FTHfgaMJLxh95vFfkRmpMEHXieKVf0ypJ3KaezY3uVpY51/Y6yJoFM
 N+tGbq15BpaBwiN75DAzUoL6wMYpQiBkPLEyWXLwhJcsugfSnzY6WNR
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

[PATCH 1/4] and [PATCH 2/4] are copied from patch set [1]
[PATCH v4 4/4] without content changes.

Link: https://lore.kernel.org/linux-riscv/20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com/ [1]

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
Zixian Zeng (4):
      riscv: dts: sophgo: Add SPI NOR node for SG2042
      riscv: dts: sophgo: Enable SPI NOR node for PioneerBox
      riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V1
      riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V2

 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts       | 24 ++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts       | 12 +++++++++++
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 24 ++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++++++
 4 files changed, 84 insertions(+)
---
base-commit: 8a4fdd09c96f6713e6cb47d36e9f9dd6f6694215
change-id: 20250813-sfg-spidts-ee56044969fe

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>

