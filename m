Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFCE2EA754
	for <sophgo@lists.linux.dev>; Mon, 11 May 2026 06:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481525; cv=none; b=VxhLr2C0WuNX5zSHorSNtsKnCwnbwBk0aEpld4Wc8/8Vbc47c3e3/vS2ECvJoWtvfgSdnTl2AhPO576F0/t0K8Gms1EVYzmcwmztAh5OIVNvUfTYdrhlSa0CqCyUfVtxo3VvIgOcZspYN89RG/EU9YeAAhPk0gSnM4H8T0jcxjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481525; c=relaxed/simple;
	bh=yvzklUqCUgxletwdYULmVQM5JhvPwFFqwslMNk2qNBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y9HaCmzq2D/aMNwHl7KrEMcEBTi15SKGbYOOMOrl6khqgWbNSJZe6h6u30gy37GZm6rpv/s4zXbETSCV0zHGTGDdBkAbV+2M36zKHWE4kWoINZ6kv/dWCF59laUSSf38AvaJxuTcAyqNciTq7glCnAibM5EHf+WjgrbmQtLhSM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5DfukXs; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5DfukXs"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c80167f56cdso1438146a12.3
        for <sophgo@lists.linux.dev>; Sun, 10 May 2026 23:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778481523; x=1779086323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrHfqxO5zQWaRSbwjGtMUupsuspxAHrjR7FaYDhyfhQ=;
        b=e5DfukXs7OynCUazGV6u03Pd3GiPEmiyJTnuMfNozFF4LWbGqF4jffnZyc7GdiJxZU
         uOpUrEjdc4sNl+GAgPZ5gj5UU0uuN7g6ZSNb03GrdbmaMkk2vTkLD4Of5PQEBIJ03tJk
         UQVzJ7QUbHMBHc+DIiRfZxfcIG1bl1xefE7EwRLFtIUbNardNxma5WcxP1lG4iy0hgyQ
         T9IJ7EZHqs4SIyFMF/c6fDDB4VKBz25X2mU4pqab2Hs+iYkjSmUF7fBl2xY0VpRMVR5n
         mo7gXU65x0+w4PvuGfmfTE8LGixjL7DiIvLGX9x93xUAAvW2HMZSUQtIS6iio37VaVHv
         Bn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481523; x=1779086323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrHfqxO5zQWaRSbwjGtMUupsuspxAHrjR7FaYDhyfhQ=;
        b=dECQvvPt2PDLF/bgPGOcLbJbjUgjKxhPdTQ6oqapEPop4ympJ6p0FlJ116LuvTSIXO
         40q2jvTNyo4q4s8JUkJTQcw0GuihAv71dPT65A34IvctQ9hGEKEP31Ky6kC1Ynhboe8f
         BJ4D51kwlHFJLcwXyQzN6ijAMfnpDqlXPaMCoOkdN2WhMaUQhfQUCD8oFz1CiRDDxIbP
         wciBkLIExykuc3wwLHeYX81qvKMJi9s6l+fraaSeCETU/7n+/MXASw+UnkCgHut2Ae1K
         5/Z50sIIHKCH7rk6sDGobphf+E+wnpPyq8OWXOkTtAel+BYvb+k1hw02gMk+/ntfQFrX
         Pcog==
X-Forwarded-Encrypted: i=1; AFNElJ+NUXPZnkXkhCjKCdvPaAYCExJRgI8cFL3oE8usS+QDiXq0oS8UuVOP9zYdjXssjDfjll+9XvI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmNGpfLXGZ//NG7S0yYnDITJyPdpp4sif57TZPDAHA4My5lwnM
	elP7+D61NbwjiP2TY9TrkWl0l8RHJNHEsJLqdfy7d3SdOgDtrdSoVPFF
X-Gm-Gg: Acq92OG5nLDdApUxXG2XNygN4A5yRXFdvUpmJAMkcJjw1zHDm0DGJvRPas+AGxtPlGx
	CuLQUtG6tgiroQwlsMGkuDMm9Y4BG80Iz4xC37K73MLJshap5kf637vRzX5cfY/mCNvKAdEor4R
	6FQ0qLI3MwmxDzzK8VgxYc61aYGinzfFvIcPVr6RsTba2b+EQezWf0fFAMTty8jJBq1ZTCzVqYG
	FWvKmv1pp+dF0gtcJpGtL6may8QEPgC8j6kYyZRW682yqb6X6d9N6G0tIqKicUOzU77nwI4LmAY
	lIztRvCmIDWpiAM8pKKydmWkQVlxL2mZpCG95Ua/guHNgSwqG1vDiu49cJKZFVHquB5ZAGTRyYe
	LdGjzlLJHxN5CQmSWoLSDlBwfigxRGayjXzKVJnGzVRiD64BLPOmRgXjiO15QeTPIVHBoyGPwYH
	iMmCsiXFlGbjZQULYUb7Lq8fs=
X-Received: by 2002:a05:6a21:9983:b0:3a2:7ef4:81df with SMTP id adf61e73a8af0-3aa5ab71a24mr24213272637.26.1778481523036;
        Sun, 10 May 2026 23:38:43 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826767be0csm8409174a12.2.2026.05.10.23.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:38:42 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v6 0/2] riscv: sophgo: allow DMA multiplexer set channel number for DMA controller
Date: Mon, 11 May 2026 14:38:15 +0800
Message-ID: <20260511063818.463877-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
the SoC provides a dma multiplexer to reuse the DMA channel. However,
the dma multiplexer also controlls the DMA interrupt multiplexer, which
means that the dma multiplexer needs to know the channel number.

Change the DMA phandle args parsing logic so it can use handshake
number as channel number if necessary.

This patch series add fallback compatiable according to the disscussion.

Link: https://lore.kernel.org/all/MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM

Change from v5:
- https://lore.kernel.org/all/20260426012921.673953-1-inochiama@gmail.com
1. Add dt-bindings patch for fallback compatiable
2. patch 2: Adapt the binding change.

Change from v4:
- https://lore.kernel.org/all/20260225104042.1138901-1-inochiama@gmail.com/
1. drop patch 1 and patch 2 as they are merged
2. Add ABI break statement and clarification for this patch.

Change from v3:
- https://lore.kernel.org/all/20260120013706.436742-1-inochiama@gmail.com/
1. rebase to v7.0-rc1
2. patch 1: Apply Conor's tag
3. patch 2: Apply Frank's tag

Change from v2:
- https://lore.kernel.org/all/20251214224601.598358-1-inochiama@gmail.com/
1. patch 2: rename "AXI_DMA_FLAG_HANDSHAKE_AS_CHAN" to "ARG0_AS_CHAN"

Change from v1:
- https://lore.kernel.org/all/20251212020504.915616-1-inochiama@gmail.com/
1. rebase to v6.19-rc1
2. patch 1: remove a comment placed in wrong place.
3. patch 2: fix typo in comments.
4. patch 2: initialize chan as NULL in dw_axi_dma_of_xlate.

Inochi Amaoto (2):
  dt-bindings: dma: snps,dw-axi-dmac: Add fallback compatible for
    CV1800B
  riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
    number for DMA controller

 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 5 +++--
 arch/riscv/boot/dts/sophgo/cv180x.dtsi                      | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

--
2.54.0

