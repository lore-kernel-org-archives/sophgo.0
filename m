Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A5928C2B3
	for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 07:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750143784; cv=none; b=PSrbmhjFpRhs1ukfBvy5Jp7bby3b3r9FU1iEp11U//r8+wdRfhWy116/gIYtQESzqdMR7z1DvnskFxA6cmoszI/8jEBj+Qvhyd7umyYVk3UcCjyA5XXsU7G+YexI2RtPiW2+Uls5QBaXO/4YHRm1JEJ+huWRboHFqNxC3B3/nbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750143784; c=relaxed/simple;
	bh=9uQYlaKrOF8qdMrm3wBT3CKVF83rj42WRbeBiwxnE0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KNMGQ7VQRRLS1BqHWNRRHd0AvrvujYIUd55/8CrHO5PjzCPXcB/IaugzefMtKLzcNUSXRBKiuk1JLIDkgP9BeSRm3LwZLUM32Qp2PIpOPU7GooMXxvqVyXHD00ZrNYITXfOZxsQ+3YFh48VAq+Cn7WA5fR4/J7M6M7h3ldg56Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYUVsshf; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYUVsshf"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23633a6ac50so76348035ad.2
        for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 00:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750143782; x=1750748582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UaG/t7KG9r8h6CuNkV1Xs54wfnnVvv58385nUogNAos=;
        b=hYUVsshfNetWkqdeSyaitxbBXu4W7sIL070cY47o0qQSd5xLDR8XHYA93Veacf/oPq
         QlEUlnRW5K1DeAkt2Oh10FM8FpfNQ15L9gQpis2c5bAKnw94x7SzFXZbpLy2fwi1afYs
         w7gNOEyU5xxI7fPr/hs49YHmCB2rk7preMbGuQevBdfNyZR2GJbsY9ti0vLpEtGQjDJo
         S6pjQBCxBIIQ18xpRt8u9VvAeMSCSUKLB5ErGL5t0ofUjmRkmhc/iy3Q6hDzMb6JwzY4
         4QffPnIRq850O/iSeyAkyZ4CZIaKVeI3+6cslGyhEJlO6N5QorLAdCfwuxcGsn1NufGY
         FfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143782; x=1750748582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UaG/t7KG9r8h6CuNkV1Xs54wfnnVvv58385nUogNAos=;
        b=XZaKH/RYo/21vI7iJu5//3fph/3kGHCBSxql6MyldRIAUjLdDvHijh3zniKjMfK+sW
         8Ur0TsYCyUQG9l9xEwr2KRNkgk0M7MfB7yFvVZCtK/1sHrOJoBlPmoJjhJ9lApFVJEG9
         51kbefekZZg0v+d9dnnLgUl2ZBHsJ0BPNxyDVaG7gLRO1vz8DCrg78x06vUx+/86QeML
         M6LDd3Xvz7flGeGJGwR6aKGxNuEcd75vwQA4KT0gH3YiriJNzl9YbcZxu+G+1DL5J7Kn
         pDSrgVHB/HtGEXi7rR17x0Kl2pJufwu5rFl/Xg7f3SJBt1b+S+8L7MEKTstHIMQ434hY
         vkmw==
X-Forwarded-Encrypted: i=1; AJvYcCX4ix9NFxpQSQZ7fwRpMWu5E4KYaP8JTa1rcgI9IkmPTPP2QhmxDj60MiC2mIlW08TwgWYruAA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWqAPjXAvCedAwfGF7RNA2qpfj/1dk0qVT7gB/NxlVL8SX/Mk7
	xPy4jhLcr5pR2/afmX7fgPWdXFBes4vk++ApH5/s7ag7+axzsrC8OozJ
X-Gm-Gg: ASbGncvpyDA/8TNmBaq6gHYZXfuqR7Lc6lDerWaXmsoWS7361df8+qBsZNUsZsVI6y/
	ay7OGERCZ7fdSQ3Q21eADV5S268N+8SSECO4XGSs2SbJGk+grWZiLuLfsjcpek59V2R0/Rh7Rvl
	3XdSRoPf2CKJo7vP/VG7/OFQ9hONAkiDXfQX7flVYv7rTrIUqtbekCzqwCJoIkcLu507m3dkR3I
	mlXbNqqnWdzljJZ4gudSpyVNaJaeqkrTFHyrG2DLlH7iONHGWzLQqQSlAxCqHL3gUnBpPn+jvcF
	/La8f0/bhRp4FnfA1iO8e8L1K6nxwZVvBpqFrcTHzh76iAOsLjeQ5MOFC/iKHg==
X-Google-Smtp-Source: AGHT+IGqDk0ZeWL4AT26rDLpFZ8Aq+pamnX39szXBefKiFUBuwuWNS2youv83CQvs23AFpZt39mjJQ==
X-Received: by 2002:a17:903:2f4b:b0:234:a139:1217 with SMTP id d9443c01a7336-2366b3505c4mr146544715ad.18.1750143782107;
        Tue, 17 Jun 2025 00:03:02 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23692e44fcesm6154635ad.169.2025.06.17.00.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:03:01 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 0/4] riscv: sophgo: cv18xx: Add reset generator support
Date: Tue, 17 Jun 2025 15:01:38 +0800
Message-ID: <20250617070144.1149926-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
Add necessary code and bindings for it.

Changes from v4:
1. patch 1: convert the compatible as entry of enum.
1. patch 2, 3: apply Alexander's tag.
1. patch 3: apply Junhui's tag.

Changes from v2:
1. patch 3: fix wrong reset ID.

Changes from v1:
1. rebase to v6.16-rc1
2. patch 1: apply Rob's tag
3. patch 3: fix wrong reset ID

Inochi Amaoto (4):
  dt-bindings: reset: sophgo: Add CV1800B support
  reset: simple: add support for Sophgo CV1800B
  riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
  riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series
    SoC

 .../bindings/reset/sophgo,sg2042-reset.yaml   |  4 +-
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 25 +++++
 arch/riscv/boot/dts/sophgo/cv18xx-reset.h     | 98 +++++++++++++++++++
 drivers/reset/reset-simple.c                  |  2 +
 4 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

--
2.49.0

