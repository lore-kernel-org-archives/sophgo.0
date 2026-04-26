Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0874E212F89
	for <sophgo@lists.linux.dev>; Sun, 26 Apr 2026 01:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777166969; cv=none; b=XtQemtTbKAV6UgMF0+xbD4Iduef6XNYIN7c17cmGT/5mqv4zOQN9mPRsb7Ani/sRhuWTsuGWypFIK2qlAwoLedoxjlZWI1XgaW5fjsWxYrrHoUqdAL06j2R1dVv7AH98KQDHZqAKOpENPq8phwZ53MsSjIicMbkZ2NrNgSU9F7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777166969; c=relaxed/simple;
	bh=XCk0LOLR9EjU/m3LRK/NWe6BYRHRmRJ7ESoLykZ1VdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zx0SnYsAlca+LMfQrZwrjH3wuuwkFN9/CNPg1KJi+HsHZ7pfmoEXJnEKPLke5qEgFHV8jEd0R/IfIwLnVVLSVZXd49OXqcNjtS6tw7tXEeFW1KYf0heg48X0Dvwe6PhUBbQvNw6+dQcgWD3G7spC7cB6PB5Na61bjiIoxBnMClE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYIyhumg; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYIyhumg"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82418b0178cso5582165b3a.1
        for <sophgo@lists.linux.dev>; Sat, 25 Apr 2026 18:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777166966; x=1777771766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uJGLD2afkf4vXSL7zjJVSaxtWx0uvNk68f2WZ5vGOk4=;
        b=gYIyhumgue7vwUTMaaMpSSrfNKGK5k1BfFPnrGl1B86ljZDhBJa5W2LDCbB1oNCwCp
         grv8/E3Spb7W11X3pIAKyFzKd8+/T5oOp+BS7K42l006txQuxZVhc9BINwgZUkJIF9Op
         BOqqOFPCgCP+qXLkTEX73p90v8k41cN7o+4ZLkmH25+K9Q4M3d/+N5tm9Hdt9bHbKMMs
         urys5WKfpQA7VajMkzqDoxjH3/06eDEOyQfwHWlbnaaU6wEyl3gwb2HXHLgc0iIX1DY6
         JqSlsglOS0toKXiuVNf/rU0qMBXTEOFTWMZlk3us9+omP/JRmoBBHQj2ZtFEYWVDbGyt
         S4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777166966; x=1777771766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJGLD2afkf4vXSL7zjJVSaxtWx0uvNk68f2WZ5vGOk4=;
        b=SGOkJIUsOjJ1NRQsMHX2U3UOPg7Zshm/7boxKYArJOB7rsw5BlAKWk2OcG80odLElk
         7M+SIUyAuyaROGi15j/x1H+GAJZUPjt7J5fC4JmTzoMnM/KqlxIxQGPUyQJIAYYiT8br
         eIpFFjZUhsy7M0Jl4QMPyjPEWah9m8uUJhc6aflhDsCZ0jMG+chwJvZkFn+ibHmO+zr7
         ZuAoPtgq309wlFBOyK4TaDWyLKe7fPZNNF/TquOHK+XwIRH6HmonC/Oqnp7OSFfYei9m
         5CnlipwwD/kO1C9MEJoLmBsder0HWWu6BjQKy6y/cR/KlIbaZ6a0EA5plLhUApIluVYY
         coxg==
X-Forwarded-Encrypted: i=1; AFNElJ/99PB0/YkmCKen+SzMv/JVOS6s8hWR9aVMz/+loQrRNf8ROq2zWJffZFOUkJvQt0qkKfmo+GE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLELzlu/PxU4EW9gMmfKrp2GH7th+qLPFtY1TQSJFtVQAbENvh
	TthR8dRmP/1HW13wo1bb3XYA7FEWyL2xUzV6RGXkqmPG48W3PZsC0JBd
X-Gm-Gg: AeBDieuRSASl1DY2ALa3MAaZloerOlwGDdayZX+kEYLqZUNiO9bPCRxMueGaIqqvDZZ
	QGd4eb9/tlhbN4F64Ap4s1fIJtDlqDc734PweE6lLkpeztBEhEfNRwqGxLJMSGnYqARy0UTRTPx
	1SbVu9mogPTey7ukI9Y9mj1KVGtGKKIAtjbJNZ/Y8b3oB6iJ7cmDjp4pwI8U68YW24AIoEkcJGe
	p1LXcfPybBVi5t877He6qlkKmIA/LjImemJa+qP4HFEdAo1jT3zvPcw74O2//mx+U2qM9ynX5Ds
	3g1x8CY4/sbPdE0Qb4WNJAiOWX2gtG1IShkhiZg1vX9wSEoVxxUPFbjfLUcfv3dsArPR2ZAEvvr
	V2hYZWPR7EQxqtDAR+C+U4J8PYKfTSvbenr6/DvmCIDO0ztn2+uWBjgVo+JrwyZFlvftBGOiDzl
	oEUFg98xFrgUTkXz9vAfQxVs83jjU4lr0RGQ==
X-Received: by 2002:a05:6a00:e08:b0:82f:28da:ec7 with SMTP id d2e1a72fcca58-82f8c8befddmr36874800b3a.27.1777166966192;
        Sat, 25 Apr 2026 18:29:26 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe68ebsm31048541b3a.47.2026.04.25.18.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 18:29:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
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
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v5] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
Date: Sun, 26 Apr 2026 09:29:20 +0800
Message-ID: <20260426012921.673953-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the DMA controller compatible to the sophgo,cv1800b-axi-dma,
which supports setting DMA channel number in DMA phandle args.

This dts introduces an ABI break that changes the compatiable without
adding a fallback. However, this change make no change as the previous
compatiable provides broken DMA chain for other devices, which make
the DMA function unavailable. And apply this patch without adding the
driver does not change the fact of broken DMA function.

Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
Reported-by: Anton D. Stavinskii <stavinsky@gmail.com>
Closes: https://github.com/sophgo/linux/issues/9
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Anton D. Stavinskii <stavinsky@gmail.com>
---

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

---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..8446b4dfe1a1 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -417,7 +417,7 @@ sdhci1: mmc@4320000 {
 		};

 		dmac: dma-controller@4330000 {
-			compatible = "snps,axi-dma-1.01a";
+			compatible = "sophgo,cv1800b-axi-dma";
 			reg = <0x04330000 0x1000>;
 			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
--
2.54.0

