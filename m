Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE56392C5B
	for <sophgo@lists.linux.dev>; Wed, 25 Feb 2026 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772016078; cv=none; b=KI1nfkJxEMSCS6r1DAw/65rTJFVcBWEwBC4vy2XI0/FHrU+B7rc8fjEoOhg+h+Osh6mb9KqJdQZ7HgG1WI2VjeN88HRBDZJAyowIXf8UvG/5iqgHc296qJdDD7Mk9LLsgywzF6yq3hWxtuJe0ggiEGt2l30LVW6ibceHv6qQQIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772016078; c=relaxed/simple;
	bh=Ee5cJqs9AGlHrnOai87Vw6G7NhsrebwsNUtzf+WjlHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/kJsxHT/pU6cmzaCxth8WoBm4YUTLnMHNO4NUouxtIbt3IPHaD+FSdeVjmv547ySIi8jOryfT1r/ToUbuFOVDzT4NAZG1DRbnMLxt3UrPtU/7vYN4IQ13bBPSOt+VST59LhvExG/U64I9df3KJOUvw/ctamcu53Tra1mjTrrp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bm+rRBfZ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bm+rRBfZ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ad617d5b80so41067235ad.1
        for <sophgo@lists.linux.dev>; Wed, 25 Feb 2026 02:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772016076; x=1772620876; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSPeK2iXnMV3LrwSQxDZgTSQGbBxT4o3wiSW4SZQv5k=;
        b=bm+rRBfZgNtB79WCPE1KNnr53SnFJTvcj4t9G31eg1jjxbX75UKKP0n159pk5Y/WXr
         bZKWAnWwPDanXBv3OgyW6pLve3QBf4NQbBZSMcClgbtLjPhVG1TyVgxxlnJuRDCE6y+a
         BSiLNcBvIUSLPqhmbpgz1v8wodeKvkWdM7UrM0s9zt0MVs/aXokoXSJceFagqPA3tiaa
         LLFFv2CHkhaRqoTGvshSZfWMh3tCKPSt7eD7SOxVonsX/A4lT2UCXkfaeAP8lXieftmh
         wNusdvBlBlC9jgEdYtPD3Wctr/A4knPm3Bod0sUQxZmnmsAxn/l8acEwg5L4RUG2zZcf
         MXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772016076; x=1772620876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZSPeK2iXnMV3LrwSQxDZgTSQGbBxT4o3wiSW4SZQv5k=;
        b=LpU/q7rAojbZ01vlTXJb4G4uTggETut+a+OmNNfmY2r0qpBRrJ8ZxpHWcqDBl7l6uR
         3xbG5tkqsX5ZgF7cxpHkywI7Yqc+M+UJd2np1+RCR7pDuYLRt5YWbxRuSqeUWNJjGElF
         WRB8JFYNNn4Y+J8BzmNZVezLv5yGu4jdEJcUl1TTvosa1jAtPciBxvox1epKOq9kqiKW
         5umZOSXU4bjbGbeLROLyAiyAHR3Vys/QyEjdCX4mTPXfOUYL/qj3mGdMa6UZ46ZD+FrN
         +3oJSf9Fgg/A9oX4HZkAvftxP8chGCkX/9uTnwakS7YmvdRqahL/+/VEeNkzn2VpfrSW
         L7NQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3qbRL0+BM8z+WpG6qCIL9EX+dr28DgPVz2ZQsvZ41rSGEJtHvjdnsrRQve9htCxeL5qn9vio=@lists.linux.dev
X-Gm-Message-State: AOJu0YxssexU1adrbDG9f5G7YV+MWphew7ZsyOMFbQS75k1Qk8aIETsK
	72geSXZ6+7UmWR6dznuAThe0cw3Myqi/2sxEDeiM39dFDhjXO5inP/sW
X-Gm-Gg: ATEYQzxL92vkivWDlSpxPNYu2RWPfpcCyBp3dMYK4BI4cikYWI8RYkN+vKqph7GYELp
	TTiMlC+ayrPGw9acLDwgBoJjkSdhV1KsEFIj3tfLKXtHzSoYJroSeObeiEZJODsti9pKPij0H9N
	X/wbDXXwA0ciUcza9QIIpiwqh2HWlUg+7Guu2F4Iu2i6wE2WBTeTRxMYzdtQ+aAotd4Y2CdYslw
	U/yvBHTyG/eDcwtskFirvKZC68/wDp3Pi+JcbRBYl0PaJ4E++uM6tcEmMuOBiSLAQtcyWxgqRTn
	96h4H98pV1XLAq39557jYEaZG2SOW5zM/m4KL2Rt+uxzXhXLarR/ExzI09R4Meuavar28KXhHzl
	CDVehCFO4kf0DVKkRkDbMbyTswyU89WCOK0PgixG7fEnVaeWozWkn7EyoP68eB4bSMSYeb+mN7p
	nAUcUUWWQPdg9VqVnouNbu1w==
X-Received: by 2002:a17:903:3bc8:b0:2a7:561e:690d with SMTP id d9443c01a7336-2ad74556ee6mr139419385ad.46.1772016076534;
        Wed, 25 Feb 2026 02:41:16 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad97d6132asm52860285ad.68.2026.02.25.02.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:41:16 -0800 (PST)
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
	Ze Huang <huangze@whut.edu.cn>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v4 3/3] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
Date: Wed, 25 Feb 2026 18:40:41 +0800
Message-ID: <20260225104042.1138901-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225104042.1138901-1-inochiama@gmail.com>
References: <20260225104042.1138901-1-inochiama@gmail.com>
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
Tested-by: Anton D. Stavinskii <stavinsky@gmail.com>
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
2.53.0

