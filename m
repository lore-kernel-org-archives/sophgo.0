Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A3828C2DD
	for <sophgo@lists.linux.dev>; Fri, 12 Dec 2025 02:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765505177; cv=none; b=fHRWC99ugakd5b2oZkORpzPxhBYUdalvh940+AivW/Rf9LIRoFJL+z3e8KSQcnZCIOGbDc89ROZS3HiLvhc6kdqoc1rhD0UBAQg9GJuAC1kHGdHcBzXKCVASn5UUIreneVkF7fj0Ye59GKrbAAB5Gx6SDIDrNZcPiyUeA0+BhH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765505177; c=relaxed/simple;
	bh=9q5/APX87RGgYmhMNh/WDYwQpX7HX4MP+fy+fzWDQzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBI2itJFoyDnpDIIrET9P/oWaBchoorYnQI9RvLWux+3wGmUA6FLtAkg+js4G/Wd/tuUQSkzMI3yKCUxC6QOW+8Fm3l2Onzfv/x3G2exAApSLyY/Gu/ki447wD3dQr4HVq/2HIw6rLFCa/v9nz3RBvMUSPo18UoTbsedCFSrt08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuZOfTVX; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuZOfTVX"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2a484a0b7cfso774397eec.1
        for <sophgo@lists.linux.dev>; Thu, 11 Dec 2025 18:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765505175; x=1766109975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDRFsyvQwwFF2ebD1NnNsyQGvhsS9i0D0wecAIBs+ow=;
        b=HuZOfTVXpQI25ujDWeNRZVu9U9ah/aHV90ne28fDsNtiJW2jmK04hdqBbHCcxLm4ml
         QAgKKEU0k6u/zpa6ur+JNBd1CCji4+VTFcR81VsYQ0erOptZQdZ2JHCSks7xLHHm+Xl0
         kJthw4XFzzlXUSLBZddnlou03zi171HpJCxKTUSRd/HsmlwW99tx8bOTdTGIN7Ydq2tW
         PmWHunWwF9Qnyb/KR81uICPvDA89d5dhWHA+OaiqK3kPM6F5V0TIK23qDrk2OzG2ctcb
         cuXrsPUb7iYHY3xHLbTo/6aJPFKFym/CWzQXgmV+JDbGZlmnWciO5OY8tCGA5SPOoPL8
         4CKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765505175; x=1766109975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lDRFsyvQwwFF2ebD1NnNsyQGvhsS9i0D0wecAIBs+ow=;
        b=n6ULxLI8vy1Q0uCwMWARjilQsrkDJlQInCu5zS2h+C3DRdw7zcM6Rl0D50wfm2lJDE
         tgK9dxQVMHSJ/PIN7MkDTWYheXPWLeSGCTpq60cHoOwmFXLvqdPT573hXUGb7JmOAKQp
         DmeBYGIn7pPQMMS+9y4gr6z6yK0MLMsgSBAB6lKaAN3RMmWSI4GA/KTGfrDDK2ZuxwDf
         0sYcxtJyCcBx40onN/wsQhs73vijovzFizvn001JI0eyxwzWnlEIbCMNkYvQ3K+1BK9Q
         bWhug1cDRHfCQuUejstAikL5GTHGsO9Ik1/gQLorJXVkd/WVCY8p55dA2+y6+BEUGq/T
         Ztjw==
X-Forwarded-Encrypted: i=1; AJvYcCUN57vgnjuaV9eOZ7+jCSj0S9iVmaL/ZQojdXEdkCdkvJfVooHYkzIfpzS+BBmp5GjSG0+dLNQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7YJT6EJC4nPT6KL12cvjcJnJqOVYW6ZAuNGILC87v5BvRr/Vv
	POvqd021vLiYtMIf43NdS7FXJSpghu0fJA+z7dgeoLkLH5iYTtsJGO438PqlX4jO
X-Gm-Gg: AY/fxX7ePzikyouyJAA99+ttYcUb1dXYMkYUs/t7s/mDRXbwjd1sxq8Y8H/s1YpLnki
	tfkMb3tEd2irSztRLMFBAurgoNYmizBrv/w2V5Gr301tSYvmZOq/cbqIxZiIjrGPKbqU2rMx0/v
	z9Q+86lyYnZ7DhITkNhkVbtCxLApfFYfowGca7TF2S67r+97Hwkl77TLEp9g+hSUASbtYaba9mO
	pTrUrNKPOa6gxsoD6XiPA1tZcfJQvIfrvB2NeIJYkiUWHnzCVI57/lId5XFbQ6Amdn1UAvNMzQ6
	Cpi3EBI2pzqp5BQKU11/a+6yEFJqrN951yGaeNW6kwmzOy7EoeHdKbbEPcxla0P2rJb+BHRW++D
	xe/nRqpjVXOEhCOZ0XZDwaoGMvE5O2AsL9VzpRqbNQCweMTEUnETYVvU7JjvdmIx7zQivZuYB20
	p5ck/+Uz880w==
X-Google-Smtp-Source: AGHT+IHp4XoVEq8gZitvB+BzE1jK7qxIPLPcDqRDy/MZup4QourLgfB3mVZLdfvqwzeWxynBbGaqDg==
X-Received: by 2002:a05:693c:26c4:b0:2a4:626d:5c38 with SMTP id 5a478bee46e88-2ac1c7af40dmr1966521eec.17.1765505174731;
        Thu, 11 Dec 2025 18:06:14 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac190acd01sm11708576eec.1.2025.12.11.18.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:06:14 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH 3/3] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
Date: Fri, 12 Dec 2025 10:05:03 +0800
Message-ID: <20251212020504.915616-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212020504.915616-1-inochiama@gmail.com>
References: <20251212020504.915616-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the DMA controller compatible to the sophgo,cv1800b-axi-dma,
which supports setting DMA channel number in DMA phandle args.

Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
Reported-by: Anton D. Stavinskii <stavinsky@gmail.com>
Closes: https://github.com/sophgo/linux/issues/9
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 1b2b1969a648..e1b515b46466 100644
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
2.52.0

