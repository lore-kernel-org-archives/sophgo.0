Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE5E2032D
	for <sophgo@lists.linux.dev>; Tue, 16 Sep 2025 13:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028979; cv=none; b=c6LrH5I7+/hURkdhPzh07T6QkjWG+vz5FOkCu9mHBckKsubfbc/viTz0zqqT51XBTxQgeh0J+nmXfc7vEWQsMgKoXrPV0WxX2qax/LgKm12oZ79DuO0SnLi52B5BZM7ZjV4J2LgMa84ZJmcgXtbk+RAJ/fB+F+FdzqBpKio8Uvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028979; c=relaxed/simple;
	bh=CGgTSIYt63qsmZdwIds4EcFmwLudv2lGpTjjwlt+HoE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DEmea3COZl0Vn0rdaEi7GylnVeY7GGI+Rv0l4Duc5rR4jHSiPVOavrCdph65vfZowdQWr7kxfKCQqWyGmcKVECXFNVeKzapTCpHmZ2R0IG5JUCqLvFndiQFCOaxWvi7rKvapGgWuXsr65LD+hkpNyigM2A4OLANPPBjVK1wk9LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EC3yjoxe; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EC3yjoxe"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-77b0a93e067so357189b3a.2
        for <sophgo@lists.linux.dev>; Tue, 16 Sep 2025 06:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758028977; x=1758633777; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zw7XcaE2r1FmXR6hLChylDYbe2XxfsRNzLzDm93R3xY=;
        b=EC3yjoxepz+7gOOVvyYoGroJerlso3luKeke2HsH02WIxspqbZ3qn1T+zRnjF90ahu
         cz4/8ATaADpl4QSD/LiEUOGhXYI1loK75wvQl+3tykzeoCjElQ83K8qjytrUivJOd0hR
         g77yZi0tfbTSNtZE8eUnABlAgMXk6xwgtcLVwAn+Ovbiu6tj59xTckqbOAVLwmiNWBaL
         WWH2MhITA2WbbrozrcwY5kuR5pD+MTWEICEwLAiaFhWr35evMuJtjqdqC1m1TI2LdWD9
         yV2lIC1nUWsoSanATdzBZS3e+ZbybDCFlTB4VFoTbpGgMlKbPjY65jwDcicfalT//Vf0
         hohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758028977; x=1758633777;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zw7XcaE2r1FmXR6hLChylDYbe2XxfsRNzLzDm93R3xY=;
        b=S74j8EeaVcORCJBQs5AJutP29RD5wxJP6cjCC9113NRsi6d5FXIKtbKG1hYD4sOxDx
         X2SkLpmx9RnLtt9i2+sOmOdZBre1aEz6+qDjMo7BiRS5IR4Nr0r+AhCLsNYMng+fSmii
         3lL+ERuOy3jk8mUt7q72kIEPBm8QVIrYrlWnwUFC6nGO1p2EwTif8OblLjGPcgHmR2oa
         Jqa8oZ0jduEqv4B4PRkH+KQP7JAtVqvn7SDKHs60LXf1TEX749aGNvHcU/BGVgSerGxS
         2b3U6T02KyBWUwcWJbhZxjkjNW4o2YzpOQMJnV7FcRK4G9wexK4DGx9x94dtFc4cTyH9
         UaQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkzi+z6VqyHMspNegRmCODCmRHzBpCb3qoSx5Ly7QruWBXtwlkEr5H0jlKYAv0NUIbaYrvTno=@lists.linux.dev
X-Gm-Message-State: AOJu0YwA0atL+JszYnHm+vKxN4FUXz9HvEU/Zm4fP+1Sln54kj747TWu
	sW6MsYwFkCFFf2/KV2cdzXD74Oyj4UR/7Wdku9ylBf3aN3/Ipuac2oUv
X-Gm-Gg: ASbGncs+6tFy/gA/n+ioZ/vbRxFj4j2r1BXsKyCquUoDHinbMqNO2PBejx4D4Di8i7H
	Aqc8BtQizrrybw3ZjtOppZNprgD0yPrx95WZFlzuN4MFh140OVl4Y9X8fzrMh+gr3m7r5ZQRTwg
	VgAkJQCCdZ8EwYlbRAQ0NVtFMa5EPaJxCkUT6LkVewa/yA9BumI0UxyFiR38Bao1DfDyIBIXlNw
	keCUGjC88YAivtBumD/H2trf7ZUuw2sKenTtWjn5inxGxWfo0RJDCD4qtmV+R1nFVUt7jqeJeFb
	CfCB+Czxzi5XmY1w0cYUd4yR3uNYu4Uudsmx6f/iIXt9z5rFQrFGmgzb1HaIdg+olpHYF8km7Js
	wlmpxgxJpcYcCXpCR7w2k6XS7xvHLhQ==
X-Google-Smtp-Source: AGHT+IH8qtkp61xqbdRtMzYn6rP/97r4rWCE3eOFI0oW0kXWAEgQS9ZSayzpkellSCtSLE8uefRSpQ==
X-Received: by 2002:a05:6a00:8c6:b0:776:1804:6fe with SMTP id d2e1a72fcca58-776180409c5mr16008326b3a.7.1758028976698;
        Tue, 16 Sep 2025 06:22:56 -0700 (PDT)
Received: from [127.0.0.1] ([101.76.241.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761562f25dsm13277310b3a.74.2025.09.16.06.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:22:56 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH v2 0/4] Add SPI NOR DTS node for SG2042 SoC and boards
 using it
Date: Tue, 16 Sep 2025 21:22:49 +0800
Message-Id: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKlkyWgC/23Myw6DIBCF4Vcxsy4NULXiqu/RuFAZcJJ6CWNIG
 8O7l7ru8j/J+Q5gDIQMbXFAwEhM65JDXwoYp37xKMjmBi11JRt1E+y84I3szgKxqmVZmto4hHz
 YAjp6n9izyz0R72v4nHZUv/UvE5WQwpjhjnrAxljz8HNPr+u4ztCllL5rQK5+pAAAAA==
X-Change-ID: 20250813-sfg-spidts-ee56044969fe
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Longbin Li <looong.bin@gmail.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758028972; l=1435;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=CGgTSIYt63qsmZdwIds4EcFmwLudv2lGpTjjwlt+HoE=;
 b=frGV+4xLcAYmFm8cXKHpsQaD0uBvclAaMVxAAhak1hE/IpCvgEap926nsl9BMP/TlwV0EZZ+P
 mFr1wUbMukKDMfYQpgs48Il27cqhMfYZvRtaGw2q/TNe6z0g4TVVak7
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

[PATCH 1/4] and [PATCH 2/4] are copied from patch set [1]
[PATCH v4 4/4] with content changes:

According to SG2042 Pioneer and SG2042_EVB_V1/V2 schematics, SPI-NOR Flash
cannot support QSPI due to hardware design.
Thus spi-(tx|rx)-bus-width must be set to 1.

Link: https://lore.kernel.org/linux-riscv/20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com/ [1]

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
Changes in v2:
- Change value of spi-(tx|rx)-bus-width properties to 1 of all boards.
- Decrease spi-max-frequency to 50MHz.
- Link to v1: https://lore.kernel.org/r/20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com

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

