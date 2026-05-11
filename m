Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27387318ED6
	for <sophgo@lists.linux.dev>; Mon, 11 May 2026 06:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481475; cv=none; b=RLI9imRKGbB6w7pBOCGWCaCtGdcdCgJeRdb6WWRPa6hFkl6XG4P89Cnayg2vdBbYIUA6RTalTJjQgl3+euspumRptUrr7wQIgfwT0rTEI7uHnzaZ9nYG2AIUS1sv6TdWcGOWbjzKUcJhSF5PbWegvBTRNsKBtdot24FFW+cvr3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481475; c=relaxed/simple;
	bh=rp9TUgqWsAEGx8ZoT9kL/TuCnQzCen5V/DE+nTxNcxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j8FvNMGbXcqqeHVZSveH02a38z8l0bFUQyryJM3+jzU3WS5AM8j20IZvM56IdYd6mkE9LkwncpwSibTOYd0SNpeZpySXFsoVTROcomqwgD42VF66gjR9FD7O8tVOR6BMdzadEmXOAnClxgLVT8y9ANZDAS+L8laYZP2QcgjQDC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7XmGKSe; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7XmGKSe"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ba0714574fso21320895ad.2
        for <sophgo@lists.linux.dev>; Sun, 10 May 2026 23:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778481473; x=1779086273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bU4crZfic9RXpArU6RhLb52aCOiXrQ2Y+zb7DPebOwE=;
        b=h7XmGKSexWoXXvaO+ts1yFxlD6Bxbgjx7aRngNsrCc6o/LoYV9zNSSvauybigikCPl
         uCpevSNJPC6PsX/hYqog8N3TSSsnVDryuF0R/UW5787EyjzcuNIc+YRKleKcc2EaDhfc
         N+iIAWrB5xv1hJA8974HnGEUfE72HrJzwY4lJAJgPbDySI8jEACSmtq8nsfOlJmE/sDZ
         LlqN6WNFn8R/Sx6jdup/F+zn6KqzSG5d4HpP6ZGGTtgcw42TxhaGCqF+ZwOCH6CvSktX
         HwR+ztRFWmJOETHe4waTdHn/44b3Z9pCiOdBZNALI6UKAds4SUWgtj+O/iQXyNcxAruQ
         0+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481473; x=1779086273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bU4crZfic9RXpArU6RhLb52aCOiXrQ2Y+zb7DPebOwE=;
        b=F5jJ7ip6GVhsCyYlojVchwOJvaOkU8rfczFR/ABuigpOpalrNwmw8dRqhQSW0zHQ8p
         9bA019xL1mw/LvPpsU4mu18BJ269RLcTDmiP/D2PcUfULDZFlvye/dTS3Wy0SW7i4LV3
         wh/+aqYoJis9/wyOm1R0fByCFSxM9/BaVFhMjVsoJuRF6xagSX6d0TKnO16Da3B5wOCG
         mubVr79PnFZpFYkFvkxT72eSN5/9JTiyXeTkFjASYMcQc9HcPGEuB4ioHUgh4Nvny4GU
         Ck6lAQX7Fy8RGSeFEqAvK+PIFUbruzH9s7eZqZLRmJy2it9lVdjUQsrWK6jfTfOpatDx
         5XOA==
X-Forwarded-Encrypted: i=1; AFNElJ8emrWixNcbz0F+kDhEVUWZw+hZxXnftTsV4XFFAoy/7OLFA5fts7Ky9Wb8oySKnxkLLqdc31Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh/NaIc5tl9l8kz7rFywHLMX3pO0ejjaip69QViK/3vrdexjgN
	miKzXsD/ZrSBfsxjuctofgWzEZNHRJigbrWbW9whI29t9vB8NLdfzXQmgbuA5Lp1bO0=
X-Gm-Gg: Acq92OEWGv3wY37Dlx6lAVM6049CmRr59luIVmjX2cSWHgiYu6yEwRJX7mX5E+xTTBJ
	P/8r6T6RfPIGlX0X+DvAy2RZ+YaMKErYRSfjLF7K6JNi8xDVlZzQuQLm7cQn1BPMptSnQR3x6u7
	3WVhAET+iJiDriKOot5nhO+Qpv1+8UqHy0wla2iG8vcpaaKEakWlYjupYWHsyDNcsE/1cbrJ+Ye
	Ny850M14DpVuzEKmcozEssLPcV42HSnKkIbHBpfPJH+yCSvrDMb3drr7Iv0fQrZLmqLXEy++EMv
	x7ToRWYHWG8VKQSHeUs9M82PwaZR8e02vvXWQwW6Ea/qsbCgvplWu1waGSGWWpBX3xUliVJQlUc
	wSariyhf+1c66N2b5UsZY921bmYn3wzbVucxtJpZuUGXlMCJyzE6x0+tT7gVVH1ujuiq1Tg/YCX
	Q2kg4XiDrnxf8y8XZgxpkN5D0=
X-Received: by 2002:a17:902:ef06:b0:2bc:8634:c35c with SMTP id d9443c01a7336-2bc8634c747mr79731485ad.21.1778481473488;
        Sun, 10 May 2026 23:37:53 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3fee3sm86095085ad.18.2026.05.10.23.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:37:53 -0700 (PDT)
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
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 1/2] dt-bindings: dma: snps,dw-axi-dmac: Add fallback compatible for CV1800B
Date: Mon, 11 May 2026 14:37:17 +0800
Message-ID: <20260511063719.460049-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511063719.460049-1-inochiama@gmail.com>
References: <20260511063719.460049-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous version of the binding change only add compatible
string without adding the fallback compatible, this breaks
backward compatibility. Add the needed fallback compatible to
fix this.

Fixes: be3e2a0419c6 ("dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 804514732dbe..0a30a455b0ee 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -21,11 +21,12 @@ properties:
       - enum:
           - snps,axi-dma-1.01a
           - intel,kmb-axi-dma
-          - sophgo,cv1800b-axi-dma
           - starfive,jh7110-axi-dma
           - starfive,jh8100-axi-dma
       - items:
-          - const: altr,agilex5-axi-dma
+          - enum:
+              - altr,agilex5-axi-dma
+              - sophgo,cv1800b-axi-dma
           - const: snps,axi-dma-1.01a
 
   reg:
-- 
2.54.0

