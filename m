Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF141684AE
	for <sophgo@lists.linux.dev>; Wed, 14 May 2025 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747231778; cv=none; b=N1j/OK6x55esJj/CjIsh/k9+k2wriOQNv4FPVQtpI09R9iGKlfA6n0hncuFTUBxnows3kPdr2aXaCEgQSoQ7eH2qnIBUnt+5YqQzgXf44qc433Y4+5j7sF2XlqEageqPXMXyaJ9BO9OirqmAR/2To9/jgsU/G04+KIBD2OeDMKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747231778; c=relaxed/simple;
	bh=ayohP8fLe//c57DmTo1TugkicS31ny495LrOOlyv+xg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y7BpX+kPoV3SaCwLLrZcIf9jAN3kjHZCgY8uAmRaKtkXpi7jHNdvLnGRULYkfdEWEK/r7Et/xCLXHMvTRgtNGXXurn3dhjgwtXoCCJ09HSjJwRRNHwdtdReBRDeA/UKMP1+tqvBBbyCRlIOao4KaazZJz4v1ePVz7SW4OZrNNas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VK2hrzGw; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VK2hrzGw"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22fa414c565so52930685ad.2
        for <sophgo@lists.linux.dev>; Wed, 14 May 2025 07:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747231776; x=1747836576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nn73ykHloddZuPbAEU3+QOc70jop2fReDsUopGcz0T8=;
        b=VK2hrzGwBaPwk9YZfMlot6NL+7kRg97gkJFC6F2pRATn7tq5iGBlns6By8X9hwYCUq
         5stzwawAXNpvNEv9QcajPLKQz657tQD1WeUYCqFuqY79EuXxExuu4qgZNaSPGISmDNcu
         hRUhp7Sm3WhMJKLyVMS1CW4n4P4WI4bOwzXGKFRVMEPlOhLbYgvYY4qXwBy2/PGdRJ0k
         TOkAazYlMvjbAWDFQffqyWqVWaEhTo2xOVfsDvpoepz1jF3v10iuFy2EbKef639NfPvM
         E2trxNaow9W9QblgCNpkaSInLAa8Y7N6vYDE/Py/DYRRh/6HUltW/dqOb5MOSF/v/dl0
         lLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747231776; x=1747836576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nn73ykHloddZuPbAEU3+QOc70jop2fReDsUopGcz0T8=;
        b=tBBCQTp0LU66nkxkGpx0R++HasPx9Sm0dc5AnCO/rE1XHbmVzoE5+iKOewR+ssJElE
         XcFVhAmo3YVn6PSrY4EFzZ5SgGTlnwwonX788lihGx+iIrOlvsQ6ERHsjCLksmCIqJ3F
         U8ppqhpfYf57bfF7HisC7/ej5qDUdf/S5jwoUTtWVMKC317y5r+AzIClecs28vp4EEDA
         9AFykzy5kPH1vIiQ0xk/JGOIqyZ2t7CNMRZDZZAsjug0VInuq84GZOL53ZE227umseHA
         ybTRG6kdDcGK+JET4FiDE10ERrhEwaTcXK+ARWYiWc4N2rp/QoDKbWmJ3mygT1AVg7Ku
         yXNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtznZWJLPi/xRaAbdqV9e2+Z78usi0b8gia1iLQ119HbcN1H7Ro5uUoI0F9q0hUe5uE4/U7aw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyb6APXpzf0cl9iQC7vMQYj/f5f0EU8wao60iDFYlB6/C/q606/
	TkxObO3VHeDfrQDCV/gr5gZ3YeHgafy5UjHRF8WC9wZO6Jj4Uh9v
X-Gm-Gg: ASbGncsoWoBQ98Ten1d6xPtmnJkw4p/JcaVEbBw2xrPYOBZ2eVdvwMUq7CCp4OGY3h+
	lvtum+LYOLeWFqZh/ehQcpWbeT+csrHoIHD7mb9iPqXwF7qZsZ/0J/YQIznu3P+zzdVM7bOB4+H
	CPK8K3vauWOcaGgr12jqkaicESmwkFVe/FNxDhKgLRkp04Bq6QS9Cj88UEEi7XRQ5yCQT6DPIKO
	ZXVtwi9OO2ZxRlPNR15iak+VVHh29o7gObDzN3FufiLg/FaPUKPIMO0iFvP4YiWYaTBq7Lyc7ES
	d2lf3vdI5TSKyQseVbAFVq3RTYuKHCUQgFi+qZsgYbfnRbkWm2mkm4t2V1tUjg==
X-Google-Smtp-Source: AGHT+IGYPQ7AEh2PEScl/20vslZRXfRKA3Io3uLpuFyktZVo/du/cwLIS5UZo4wt53W5E1XOpkOfgw==
X-Received: by 2002:a17:902:e545:b0:224:26f2:97d6 with SMTP id d9443c01a7336-2319816e59bmr61090345ad.28.1747231775439;
        Wed, 14 May 2025 07:09:35 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271ae0sm100407975ad.128.2025.05.14.07.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:09:34 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Add Sophgo EVB V1/V2 Board support
Date: Wed, 14 May 2025 22:08:58 +0800
Message-ID: <cover.1747231254.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo EVB V1/V2 [1][2] is a prototype board based on SOPHON SG2042 [3].
There are many of these two boards in the hands of developers.

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Added ethernet support based on [4].

Changed from v1:
1. replace "sophgo,sg2042-x8/4-evb" with "sophgo,sg2042-evb-v1/2".
2. replace "Sophgo SG2042 X8/X4 EVB" with "Sophgo SG2042 EVB V1.X/V2.0".
v1: https://lore.kernel.org/linux-riscv/cover.1746811744.git.rabenda.cn@gmail.com/

Thanks,
Han

[1]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB
[2]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB
[3]: https://en.sophgo.com/product/introduce/sg2042.html
[4]: https://lore.kernel.org/all/20250506093256.1107770-5-inochiama@gmail.com/

Han Gao (4):
  dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X bindings
  riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X board device tree
  dt-bindings: riscv: add Sophgo SG2042_EVB_V2.0 bindings
  riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0 board device tree

 .../devicetree/bindings/riscv/sophgo.yaml     |   2 +
 arch/riscv/boot/dts/sophgo/Makefile           |   2 +
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts  | 247 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts  | 235 +++++++++++++++++
 4 files changed, 486 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts


base-commit: 550de367614f7a9a0c1d40d7e19764aa9305009a
prerequisite-patch-id: 7a82e319b011e5d0486a6ef4216d931d671c9f53
prerequisite-patch-id: 5a30fb99ec483c1f5a8dca97df862c3a042c9027
prerequisite-patch-id: e0da79790a934916d9fc39c18e8e98c9596d27ab
prerequisite-patch-id: 84d1e1637549f632729eaeb7cf935ca78a642fe3
-- 
2.47.2

