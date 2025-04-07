Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79CC221DAB
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 06:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007722; cv=none; b=fPFGKLkRhDRScZQ3rkNWI8v4VWn5UCup9Z6Jjpum3TJglUXrK2GCrpx14vb3XiR8iaVBGTEz/qnqQt5g2XFD4WW00BwHaaoPUsI3JTefnhYI1EzxIGFYdos/f6Q/zU79CZo1Zaw8v1xkHXNAg+P2s4vu+TyngcnR7VG37gqJaKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007722; c=relaxed/simple;
	bh=PrUQRbB1c+rJuvNmtq5sRl5XHonz7LhulE1jv95UeZM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YTi5a9zBHeRMrP2o2x8XL4KafWZErkzsUTBJEW8G6JigP8h0orDWqrsDJupc/RAHybeqXufqoDH5nBs4/FVgLkYz+h/VQ1mGKm5QJTdFSe/BOtzyUCX8UmoJApuy/n9kTbSmvHw0x4W18HwMCK/cNlQWSQjlqmM0o8nz6fQ11o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DevxtKht; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DevxtKht"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so3514017a91.2
        for <sophgo@lists.linux.dev>; Sun, 06 Apr 2025 23:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744007719; x=1744612519; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nUKnCXni+ZS+V5rei8asTaXf4mmG/ra2/KlqUzUvNL8=;
        b=DevxtKhtsgXnQ+VD2LxaNg/u4m7BcVC7KTIe5dX2DzGPojnU4HrnHPamSH7kdUZGXQ
         To6n0R/CLSs2cKlM2GNLeju6uE3otXL9sEuxYWc+z8pm5ViHl1t3z4T95zBZtn5QIWay
         7LGWXc0qOAx7Qlpxoi6Y2IhF+Zvcj6imFtsjYirmENReOuRFKhRAa0aj8Jk3V213vCjo
         EkYzO12jLcBPD4ASICYtaL8P7Jwk1doogHFYHLoRXexNzk7lJ6x9y1XRyumiZ1bv3E9i
         Ct8S+eVADI+eol+5bexaEAOTQgFumc2PTmb77Kj6AdeNwCBCQUHOU5VXeMZLa6CTLVU8
         F+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744007719; x=1744612519;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUKnCXni+ZS+V5rei8asTaXf4mmG/ra2/KlqUzUvNL8=;
        b=C2B8ZNPIJipBcuX4IKOJn0nUg4v6kaXvRC66Lf2PgnRzbtFkv1+N8sQF/nR+NvifqG
         Bl9Z4anC01B+IEWUWY5o4TxJSbflOK+14hDKWbaBm3T++H8amNCVsigiA5lYamapBe6M
         WKDsrHzNs1v6jZwm1ei2SbpT6mFoAoLQvgTdAh5UTOAcbygsxiPWz969AMFcahwomERo
         g8Tpstt956C7HqKHum0CvDy4b+gaTzoQ+JdaV8orshe7Fsj4vVCRzO0cIJIdrEtSSvyB
         c3S6goFpDoRzewn/zcta/eWGxof1hBD+9cI7/kjZHPNUAqKQnQLkN9WLehA3v9VXPY77
         eBgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr8S44G7jcO1jDETDw0L89jqqT3W+0NfIRvUAxTzYzpNeJiB+L7N9KxcfErv/63sy432Tjhsc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6H337A5OzmXiJLxmRO0YCrV0lZNVF+ZT4OMgNx6Xu3PrHU666
	f7oMcg62c7DlBFgbY22fjbm/iM33Q1TEgKRLNfZEzYnx0vIaCEkQ
X-Gm-Gg: ASbGnctB4ZZwvNXQsV3wOm3m5WrCi2fSL9/mxv2WRPJ1G4q2BDJam2Xb3qE/MhNHcma
	/DWx/qrGWSnOJw4wedwUgRdQtNtjEcmD3uwVHyuiHqhD+O1SOfO1CnQ/gEzzLBxa52CvMbPRsLg
	c3CbWiZITJAqk/tku6EsmpDsenYkFIythts6lMDh/Bwq0rjN8lbGs3i4OdbxaeYiDmGHvnW3nV6
	OiN54tR7v91DN5MJJYqrERheWPKxPj2YEe2ZpgMegTBuMbtCGdjJz+KYAQ1kBis5CNV9WwxaKWJ
	pLaxturaR4mw5plsXtPDJfZPLoeElZZ9AWKo
X-Google-Smtp-Source: AGHT+IGRG2C26zGOmhoXFbiYCUXmZOta5ZKasjUrRKCZwa8ZEA1iM0n9fmVIC+YnuIVVcjAsIQP16Q==
X-Received: by 2002:a17:90b:5190:b0:2ff:62f8:9a12 with SMTP id 98e67ed59e1d1-306a62134c9mr12842046a91.23.1744007718706;
        Sun, 06 Apr 2025 23:35:18 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::610c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983da691sm8048044a91.47.2025.04.06.23.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 23:35:18 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH v4 0/2] Add basic SPI support for SG2042 SoC
Date: Mon, 07 Apr 2025 14:35:11 +0800
Message-Id: <20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB9y82cC/3XMTQ7CIBCG4as0rMXAQCu48h7GBbRDS2J/AoZom
 t5d2k2NxuU3meedScTgMZJzMZOAyUc/DnnIQ0HqzgwtUt/kTYBByQAUja6lcfIUhQODtWHaWJK
 /p4DOP7fS9ZZ35+NjDK8tnPh6/W0kTjm1WmmDjZaa80vbG38/1mNP1kaCPw6yU9Y6EFaVDcNvJ
 3YnuNidoIxipSoJJ8GlhU+3LMsbN/KdLQ4BAAA=
X-Change-ID: 20250228-sfg-spi-e3f2aeca09ab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
 dlan@gentoo.org, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744007713; l=1831;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=PrUQRbB1c+rJuvNmtq5sRl5XHonz7LhulE1jv95UeZM=;
 b=+Go8UegZSi0E77pZKJXd0DldPDvqti7TxLG0uptVeWXzxZduvooGHEgeSM4M2YYM6pATGfmqi
 JNh79RwI3F1B23p/37XeiAocKXBVwsXHOPhGKqqgwGevMOI5xoQHKvL
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Implemented basic SPI support for SG2042 SoC[1] using 
the upstreamed Synopsys DW-SPI IP.

This is tested on milkv-pioneer board on bus level. Using 
driver/spi/spidev.c for creating virtual /dev/spidevX.Y and 
tools/spi/spidev_test for testing functionality.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
Changes in v4:
- Adjust the order of spi nodes
- Place the binding after Renesas
- Fix the description issues of patches
- Link to v3: https://lore.kernel.org/r/20250313-sfg-spi-v3-0-e686427314b2@gmail.com

Changes in v3:
- Remove the spi status on sg2042-milkv-pioneer board
- Remove remove clock GATE_CLK_SYSDMA_AXI from spi[2]
- Create dt-binding of compatible property
- Replace the general compatible property with SoC-specific in dts
- Link to v2: https://lore.kernel.org/r/20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com

Changes in v2:
- Rebase v1 to sophgo/master(github.com/sophgo/linux.git).
- Order properties in device node.
- Remove unevaluated properties `clock-frequency`.
- Set default status to disable.
- Link to v1: https://lore.kernel.org/r/20250228-sfg-spi-v1-1-b989aed94911@gmail.com

[1] https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/SPI.rst
[2] https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/clock.rst#clock-tree

---
Zixian Zeng (2):
      spi: dt-bindings: snps,dw-apb-ssi: Add compatible for SOPHGO SG2042 SoC
      riscv: sophgo: dts: Add spi controller for SG2042

 .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml   |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 26 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250228-sfg-spi-e3f2aeca09ab

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>

