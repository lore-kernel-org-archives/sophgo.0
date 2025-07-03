Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166F01FB3
	for <sophgo@lists.linux.dev>; Thu,  3 Jul 2025 02:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751508982; cv=none; b=TX9T4zdm3Yj69hU7Ikn0AYECbCobIzVZJmCLGT2DBFDENKf3HcAhTeBfQ2BzEolAhr8vO3gR2rOhdRla9lCce7s9jU96o0tNm2B5jfuicQCdrBgCH+2F0QbOvwkjzhgRC/22+9sMM/sePZf6/QyCzxArOziaCgNGPHZF7bknHuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751508982; c=relaxed/simple;
	bh=w7P/ThZlp2YoPL7eRVXzxVMbMFbrGp7mOD4RD45qZIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zue+0mPausQtufDjn+JVEZhTLSqcDIFGBpOYrjkZTdODRHAbenNkGsIHgcWrj0y5mf7HYjYsI8ONBioIxT8dmUsbONq/e8qBhIYp+7DSmN2sOQciM9irK/0jZjthmiwkGQ7s8C+AWvjX31+JPccZkSoasWGQP0fJ/mwvEtgVPAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZSvOZht; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZSvOZht"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234b9dfb842so48159325ad.1
        for <sophgo@lists.linux.dev>; Wed, 02 Jul 2025 19:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751508980; x=1752113780; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b73IFjduWMb1WKYfWwZmDk2oXeQfWsAxTJaEVv/UhN4=;
        b=VZSvOZhtOB0DPjcG2aeqnE9bfPC3DvTr5zkNgh4bMWu0Yzsg21zTdh5kb6+s9qD1x6
         B7o7ANWAAazRivF0fwSHM9NJcExi2kJ0+eu17E2NtMs6YGrWKl6YeTpewoM/XTgCgoIf
         f9wE4YV6+UgCS9Bs9UGjIIZCS4Vf3vUo9inYMGXjezUXlv+6EH+fKfR0n7cVAMb9Hd8T
         vC0jvVqlqGIc31jpoBMBCdQVGFbwq5Wr5aV6VOIW2v3vbCcJSC1nA7lr4FADXkE+swAC
         xGIplF7jMg2qOHdgFtQSRxX39N89ZSbDoDVctP8NA/aNTD0sGobPJwnjrjMrtT6AV2IO
         YwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751508980; x=1752113780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b73IFjduWMb1WKYfWwZmDk2oXeQfWsAxTJaEVv/UhN4=;
        b=rEEQa5fMYRqurPDzPn3K8UDqjR5T8yTPkDOUS1tifyBSeSLkMoL/lXm1NYu3YsuLuw
         AB28hrWb81BVGGHwCgN5U3sUOxyxKaCnYhdts0LpnegrGEmsMEZFePTLXSJTBYa0b6MY
         7hsRCwOFKbt87E5GfVyBEXRTmVLrJAD7K6xvdULg8YOsuPtMuRZ0TdXqiwN9wwC1Cp1n
         20021HsIBoNEC65sKrDHkJ99G0saEXg2Lt9lnf4DNmqWh9YQL9vln84i1+vbLci6vkXc
         PitvlyPS1UrmZbIR1J0mbiGWq7R5c6M5pyiUFVOUcgpW2UQZeuy8oaBSBzFyPQoJInZT
         bVWA==
X-Forwarded-Encrypted: i=1; AJvYcCX247iWiRfm3zv5/wS5xRruiFoWGr+7P1X2311zB/24DHkk2t3bYOr8MxvJsqi04/EHORVre5Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8IlLvKM6cShw61OVr7jzwPphpSe30rZMhNHqL6Bwm8JX7Xpye
	Q6ihuwJPl+gdHT+y9QDWV1t39R3AR0Uukyx5/B0YCWe7Nvfu4FdM6k19
X-Gm-Gg: ASbGncsxOFtJDrd490gXuMoeoWXK9nFblICpoKE1X88pidE/C5R5s1bnuHkHt3+yd/2
	Hdse1aOh/FRp2Wlxy4KwQ3krCE+41MMA4jg1TnHF+d6Z/X6QqY+WaM+GQvp61Xg8YaUC2mThdGF
	QvYV1UY7M0ut0TDgMxtN4MXvfA9rj3tJm+qgveUBvt5famBjYQzmTE51lCuDy71dhCFxt9Lt8Tg
	i0mWjQOTsr7Te2dDZVmpZBSTiY6a2D88w1p96E4s1r7VRVt62dN8ucOwpy1e/oJFj1OkasKEG43
	S1FU/mq5KIJbbQ1zMZYLYKrAMIHF4ve6tC2/H5e5ofnjRwv/WMCYb3qkIGZQ2Q==
X-Google-Smtp-Source: AGHT+IF3aWQEIJ3OQUGSFDn1pwNfNUpQyfdxXnfcNGViNxR2eItFwHBlfmUboW2xyi3NlJBMfC4t4A==
X-Received: by 2002:a17:903:41c5:b0:234:c5c1:9b5f with SMTP id d9443c01a7336-23c6e502bbemr72113865ad.16.1751508980315;
        Wed, 02 Jul 2025 19:16:20 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb2f2557sm139107235ad.83.2025.07.02.19.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 19:16:20 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/3] riscv: dts: sophgo: Add ethernet support for cv18xx
Date: Thu,  3 Jul 2025 10:15:55 +0800
Message-ID: <20250703021600.125550-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device binding and dts for CV18XX series SoC.

Change from RFC v4:
- https://lore.kernel.org/all/20250701011730.136002-1-inochiama@gmail.com
1. split the binding patch as a standalone series.

Change from RFC v3:
- https://lore.kernel.org/all/20250626080056.325496-1-inochiama@gmail.com
1. patch 3: change internal phy id from 0 to 1

Change from RFC v2:
- https://lore.kernel.org/all/20250623003049.574821-1-inochiama@gmail.com
1. patch 1: fix wrong binding title
2. patch 3: fix unmatched mdio bus number
3. patch 4: remove setting phy-mode and phy-handle in board dts and move
	    them into patch 3.

Change from RFC v1:
- https://lore.kernel.org/all/20250611080709.1182183-1-inochiama@gmail.com
1. patch 3: switch to mdio-mux-mmioreg
2. patch 4: add configuration for Huashan Pi

Inochi Amaoto (3):
  riscv: dts: sophgo: Add ethernet device for cv18xx
  riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
  riscv: dts: sophgo: Enable ethernet device for Huashan Pi

 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 73 +++++++++++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  8 ++
 2 files changed, 81 insertions(+)


base-commit: a3d69a2aa44f50fb09f513bd2b8d8c91fb175207
prerequisite-patch-id: ab3ca8c9cda888f429945fb0283145122975b734
prerequisite-patch-id: bd94f8bd3d4ce4f3b153cbb36a3896c5dc143c17
prerequisite-patch-id: 52a475a6d4f8743011963384316d9907ed16d5a7
--
2.50.0

