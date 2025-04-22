Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4E319B5B4
	for <sophgo@lists.linux.dev>; Tue, 22 Apr 2025 02:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745288844; cv=none; b=EkiJ1yBdD6lcejnh1IskkiwBbR+BeBzWnVWkXgrv9lvurwaCadFroVjBYA1YYyUk/mnqhweB7eO19caNIWWM35lhBcM9nlVDN0086k9TG8wJj3Nt0SXceYkQInsOVtuoJXaxqWupMXoEDxj4b8XqN3vzPSiPl3WDJqgs6SjZifE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745288844; c=relaxed/simple;
	bh=6ruMT3OdM4nY9Z0xw4P1SJg0rahSN0BTucJQnw6em2c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BBl7h2qDmJK+z5GTxYFPqIPfEBWNfUxQ9nJBoFVaLR5jpZPlboLQwkpinSHaHuCGEzqyPhCtpzSonpigAm4/KriJga4Qq2eHmOxR712n3oKMceVulz4qHdqxyqDR31yv7UdcK1GG7oE4yo9ASwCShd3YBY2MQxNAXAeC+fa2O0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIv7Mryi; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIv7Mryi"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-227cf12df27so40388755ad.0
        for <sophgo@lists.linux.dev>; Mon, 21 Apr 2025 19:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745288842; x=1745893642; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EZ6lBxALj1e3hUxjwMwYeVCjpq+uXRd66ywkq8grLp8=;
        b=GIv7Mryi9Dmg7T6PTjF1vr3LiAsAqJ2DzMSfJu7KZ0l21XjawvJLJ3xHrXB4l3eZEZ
         BCNNrUrqOvvjjB5mlrZon8QvvSn1RyCKwGuNaqEKpJR/WHu5eEQyflIqirgmRWlZoD1P
         ex2ZMmc8HVxTNroa91bkq2AxMtDH6RJn/j2aTkobcUFm/6MZHL5c/BiImdxighigVesQ
         f2L1Lyg/0sDbpuRERlWTJMPOKm0RzmNVHHhROGs+eZvYkngX21fpsuf+OqEwjoASVtfv
         rGyaX2tRkn2ylMsOFAgaTbw2mKmU4hLXADt+N3QYLwExp2wSaXPWRx4fSrIa8GvcvxML
         WKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745288842; x=1745893642;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZ6lBxALj1e3hUxjwMwYeVCjpq+uXRd66ywkq8grLp8=;
        b=vI+QJwm3vkesINmOE1S0V4FV5z7eIolp8g+O5ODBXTfFEnfzmYP6FyZC2ztTMDcSkT
         zlvI2zFqigZq44jpl1HI9o0/+0Q5XOlMyBYRGsPXeDj8Baw0u6E3wZ89Otn4d3Ug8wQk
         39LbqLiueOj1ef7pYJrMG1e94TCcJb+oXqer1fby/I1WL9VMoZG5MjqNB+NgkC2q6PBR
         pvhy3CfoN82GP8bbGYx0d44U1x2HsqMravKxYHfaQkdUZjBpZZxKN1MxjitdebtQgVW4
         S5UotSuwnT9bUENBgVusrP0kfhA5qOobYZKKhqcq+0yFu5MKKgSQU69bLk1AAufEGP1b
         OPig==
X-Forwarded-Encrypted: i=1; AJvYcCXDTk8gVAzslZe/BaJQOQsJxLaJYFn9ZOgkMb9Av3vhORuj+rRHp2EhUCO55l6Zt/GrzAVSn0k=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYmsTNmOgpuD8atIkbxn99R1mLckeEC+KpL3n5Kr2kNOy+/Bnn
	RpNJAOethn7z2riuS4yxZen4Wr7YJenoKHUBWXZlORbG4/C6DF1H
X-Gm-Gg: ASbGncvp+08tnDtsye2NqfTfPbso4xLTulOogAuh9aDGJn8fjiwUFKC9aVjVoCJerHR
	HygN70o3c+IFGAlnogGMa6S+8rQHlIGOBoyuWLMimtkSMhKOf5egNUBMjWDeSY64MpTLI4JWbBa
	efGvrxCz2RNLTVW8C1Wwmej6BLmPbdJkmipbPiIEPNuDFCnqEOWv1oU7M1Io8knFL9T0MfOD3oB
	weZISAuFLMcsVJhsurmukKxhIt/ACSCR8YGp3ZN+jHcTP5/zKnu8/Oocn3zqgGwk2Y+3HT5WyKL
	s7EkH6pwJGohSZwr0XHZpHrGDMB7w0nwTTXB9oX2dPmGhhSTTQR/H47UG+o=
X-Google-Smtp-Source: AGHT+IE8s/PFyhjhaPYvt6bB4xUY2xwxqA7TDLSF0+XalAWL5s37/k3bBFnYGUpM6h2mO0zvjsBAyA==
X-Received: by 2002:a17:903:1ca:b0:215:a303:24e9 with SMTP id d9443c01a7336-22c53e1a14amr189152745ad.3.1745288841169;
        Mon, 21 Apr 2025 19:27:21 -0700 (PDT)
Received: from [127.0.0.1] ([101.76.241.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4ae9sm72962905ad.110.2025.04.21.19.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 19:27:20 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH v5 0/3] Add basic SPI support for SOPHGO SG2042 SoC
Date: Tue, 22 Apr 2025 10:27:07 +0800
Message-Id: <20250422-sfg-spi-v5-0-c7f6554a94a0@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHv+BmgC/3XOTQ6CMBCG4auQrq1pZwq0rryHcdHCAE3kJ9QQD
 eHuFjYYjMtv0udNZxZo9BTYJZnZSJMPvu/iSE8JKxrb1cR9GTcDAakA0DxUNQ+D54QVWCqsMNa
 x+HoYqfKvrXS7x9348OzH9xae5Hr9bUySS+6MNpZKo4yU17q1/nEu+patjQn+OIhOO1cBOp2Wg
 o4Od4cSd4dccMp0piBHqRwcndqdEvnuVHQobBE/aSVh+u2WZfkA/FtuWkYBAAA=
X-Change-ID: 20250228-sfg-spi-e3f2aeca09ab
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
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745288836; l=2109;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=6ruMT3OdM4nY9Z0xw4P1SJg0rahSN0BTucJQnw6em2c=;
 b=Kj1qEicqpG/qzfM8OeIPXYUsPfB0PdPORtKudCqG7QpQxQ0XMb8oe6nVkuDtBB7dm46FpexHj
 NO49kygB3CsCfxsOrjUleGzoqTipOVfWhsD5zr4HT2DxYinoxMp14Uz
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Implemented basic SPI support for SG2042 SoC[1] using
the upstreamed Synopsys DW-SPI IP.

The way of testing can be found here [2].

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
Changes in v5:
- patch 1: New patch merges all vendors fall back to snps,dw-apb-ssi into one entry
- Link to v4: https://lore.kernel.org/r/20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com

Changes in v4:
- Adjust the order of spi nodes
- Place the binding after Renesas
- Fix the description issues of patches
- Link to v3: https://lore.kernel.org/r/20250313-sfg-spi-v3-0-e686427314b2@gmail.com

Changes in v3:
- Remove the spi status on sg2042-milkv-pioneer board
- Remove clock GATE_CLK_SYSDMA_AXI from spi [3]
- Create dt-binding of compatible property
- Replace the general compatible property with SoC-specific in dts
- Link to v2: https://lore.kernel.org/r/20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com

Changes in v2:
- Rebase v1 to sophgo/master(github.com/sophgo/linux.git).
- Order properties in device node.
- Remove unevaluated properties `clock-frequency`.
- Set default status to disable.
- Link to v1: https://lore.kernel.org/r/20250228-sfg-spi-v1-1-b989aed94911@gmail.com

Link: https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/SPI.rst [1]
Link:
https://lore.kernel.org/all/CAKyUbwXqg13Ho7QHw8vV2W6OcObphwhQ8HUrZMDNBxrVxLmdug@mail.gmail.com/
[2]
Link: https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/clock.rst#clock-tree [3]

---
Zixian Zeng (3):
      spi: dt-bindings: snps,dw-apb-ssi: Merge duplicate compatible entry
      spi: dt-bindings: snps,dw-apb-ssi: Add compatible for SOPHGO SG2042 SoC
      riscv: sophgo: dts: Add spi controller for SG2042

 .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml   | 19 ++++++----------
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 26 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 12 deletions(-)
---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250228-sfg-spi-e3f2aeca09ab

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>

