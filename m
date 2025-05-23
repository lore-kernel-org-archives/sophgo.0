Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BD622A4E9
	for <sophgo@lists.linux.dev>; Fri, 23 May 2025 10:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997700; cv=none; b=G+KsR+5f2akgURA7jfCKlIrDwdYDcaef/CIfKdb8hr4XUlrhMr22t0hrTMHfT1O5LWW7dh5XggciRdbWSApOiootead3XiMiWBgHMqtlRjSLB3y7WNXbsKUCx+0r1qcdbAUmdtyAgTUAbMihK7ftdfrAOD0i7jGLPUwHFGyber8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997700; c=relaxed/simple;
	bh=PDAjNrHei5clcEsWtlb1tcKXX5+6Ez534sPDENqfREs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DkzLCqVhqDKzY4liuW5r/IqGrY98KzWqKXbTLoZlr5sLQrkL8S3zsEJAFOvfrMbaxLeNevbdBO/Vl5k/xH3uziIwIpJcgZnW/dJbSIT3+inAXkqEBWqO9EqHNddeIH518fYWRQ6A3rVyD1ODaoVeJrk5GbZnT0v1G/ijDlk1q/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acwFGDAd; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acwFGDAd"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742c9563fd9so5071695b3a.3
        for <sophgo@lists.linux.dev>; Fri, 23 May 2025 03:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747997698; x=1748602498; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gx2NMAGILchCpYDTM4FKpaWOrSAXV5ZVZLo5ud4chIc=;
        b=acwFGDAdAg5pncdZ2blt+3hYjspXEqlv3DgPL13rIDPPtCKxa7twcAhiVzRqwKvozQ
         gL1Sx7uuI4EWUPd4TY9xStyvJ4uktAQez4WC5NKSR1k7AbrFg3tdweh2L3zuh59EYNQB
         2YtRJ8GwmcU1fpqazfr0gWMiSS3rJrnKRoJGG627poXLpM5kKUhciJs/i/vvf9Pluivl
         E1S/42WGkJnxR8HKZI5qt0+dhCHXt2xwlUjEi+tWFwq7zgXp34hHWqllilz+Nrz5ViWE
         1Z05IccuvDc7QmDy3vNftysUMod3zufqK/qqPAMtYdhSwQ6ot9G130AYfH96hZZZQ3Hc
         4bpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997698; x=1748602498;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gx2NMAGILchCpYDTM4FKpaWOrSAXV5ZVZLo5ud4chIc=;
        b=YBcKrw1L4NOKpl+h0RybStnFNBhZ605Rsz7fBULwDejreltFRA3uxAKIPaoGMODULv
         SP6V+LXp7waMG4hjEuy8uooRWhrlYgb1IuuL3sob3n+DUpHClgeyeamagu1vg/ORyPuR
         IemaheORfCPDoXrnSaNzvkvQZ3IXtUkLa288iRoD8XPgdxB/oo0zqgziCMzu6Wsv1f8L
         Jf/KyY/jtlzh6rKCoYZbCDjPmRUCcsgBwX6fSK4SivRwtfGCvsbslB45tT67W2i4pMGz
         xbyxivNW0nuPdD4yqXqXWXHXYnT4dxkfxR3ulM4TCGiL85G3RVQ1Hb3EzQyUeX7MVw1b
         8IJA==
X-Forwarded-Encrypted: i=1; AJvYcCUbvKhubRQWB9pypptxJmUdRsLbBqak5s9mojL6Q+voVmdRSGdWnJ8sOu+DmKKj83ugoFFyh9c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz3+7nhAuUX/N/9YcKuq5okJGlHBHmP6C9CfLVIXT22NFPsrDM
	NT1DasWB4uIL1wt+bnBORYtUYxdTKSI5maAop0oqVheXzEk02aX8Xrnp
X-Gm-Gg: ASbGncs/MNWKsvjnh19hHbnnsJHoerl4GvSQRaJT++9112V2GnHkoogoPiJnP9bxvPD
	TLD6pQdLXuHBSMSidpzPDB/OTLF1SuTd0OSHHmUxqDjU8YCcnFGusORII17Qv0h7SU5ntNJANyi
	fuChbolTV6voZ63UiS1l8H0tTLnVcvYF7Loh3e30Zek4nmawjxicT3koJDvJ39hHP2f+hgw659d
	yEYxuR6kOWFYFz/0uRXrmLqvJySRv06SXMZZ/lP+5OE4YquXTjRvLhtGjQ0QGaBQRevghOihsPA
	WphKmV0x9IpSQZhVCeblRyv+/vTHnLXWPf8b9J55Kq8=
X-Google-Smtp-Source: AGHT+IFypCY7WCS5VRqKJwgRs1MNVp/Tllo9WTcuJPwUOgHY8A/NI05aS1ZGOdCAv2mrHaxVdZW0kw==
X-Received: by 2002:a05:6a00:a06:b0:742:4545:2d2b with SMTP id d2e1a72fcca58-742acc8d18amr40326934b3a.3.1747997697689;
        Fri, 23 May 2025 03:54:57 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9739cdesm12623687b3a.82.2025.05.23.03.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:54:57 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH 0/3] spi: sophgo: Add SPI NOR controller for SG2042
Date: Fri, 23 May 2025 18:54:48 +0800
Message-Id: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPhTMGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNj3eK0dN3igsy03GRd80RLQwMjS4NUSzMTJaCGgqLUtMwKsGHRsbW
 1AHAnD71cAAAA
X-Change-ID: 20250523-sfg-spifmc-7a910290e964
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
 dlan@gentoo.org, ziyao@disroot.org, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747997691; l=922;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=PDAjNrHei5clcEsWtlb1tcKXX5+6Ez534sPDENqfREs=;
 b=CCKTQTavAwLlkuUXuY4stTPw/85OwemMYUtj6yfdOghqgply89hsXdfJBOkPcCTT9xLG068E0
 Ryh10IHN37YCfwX2Hooj7pBf4WL3JneGkc2cee05xx17dzdi6drcjE4
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add support SPI NOR flash memory controller for SG2042, using upstreamed
SG2044 SPI NOR driver.

Tested on SG2042 Pioneer Box, read, write operations.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
Zixian Zeng (3):
      dt-bindings: spi: Add bindings for SOPHGO SG2042
      mtd: spi-nor: Add GD25LB512ME GigaDevice flash_info
      riscv: dts: sophgo: Add SPI NOR node for SG2042

 .../devicetree/bindings/spi/spi-sg2044-nor.yaml    |  6 +++++-
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 18 ++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++++++
 drivers/mtd/spi-nor/gigadevice.c                   | 17 +++++++++++++++
 4 files changed, 64 insertions(+), 1 deletion(-)
---
base-commit: 99d1d6293ed114e94253ec8b71f57b6c8d938dfd
change-id: 20250523-sfg-spifmc-7a910290e964

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>

