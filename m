Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D13285CBA
	for <sophgo@lists.linux.dev>; Fri, 12 Dec 2025 02:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765505171; cv=none; b=KG2PLKaBcqCgrMP6c70ddqLxku5DUSkYjkC+8LVtN4I9XDws4yme3mPBGdN7r6Umkx4MyzQ76JXUEzVKCD4EbGJbif2yXDZSki5P9QnuBpfZAUo/WFWGzKlcorgrJw7NE19arGVvoDRT0pxcwpVW09jOYI+4tXRnkfdL3Zuqv2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765505171; c=relaxed/simple;
	bh=5C+xuJE/8j5c4wzd7i8X2a/0lBR3bC/ArFxnUHcal6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gd0kkq1ySlhl3+9ZNrcFFQ9dGajbh3rCaU6Y1twxPEDt00gvCwwWNUTg5Skk9gxzDSKfNAU8a4izW/gUW5wGUqz5w539ndqmtU5zfVJeAGE4UdqSClRmJDf1tyWE4XBnKRP6aH0c6tyrIeCsoKKnhzAH7PktBfZNe7F6PzPptqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZSCO68F; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZSCO68F"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7baf61be569so848170b3a.3
        for <sophgo@lists.linux.dev>; Thu, 11 Dec 2025 18:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765505168; x=1766109968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcCzUiXMsxI84pITFnN6DrkZDZAsaj1mZ+yE52KyDfA=;
        b=IZSCO68FzByY4vhrM4VX/OMFLhLDDGrSjVeThsubGnQLouO+Vbfrmh/WTukWwm9W1X
         SPm4eeMjX0yeqcC244GLQdxXh1Poh70QiwD/90pIDKTMXbByTCw7+NcsPmliAEc4ex74
         T33JHjey36001AU+dhgqxNlVc5gMiMlDrO9ZkQB4kd1SJvkadzvxAtRVlj2Tv/xd9Ge/
         tEndYaRIq0c0CE+46Q0UPaVRnh0ZS6cR+ATmP9qKGFVxiHzoU1homNOlCuJVyXuIPRO6
         zZ62DFhCi3hDGh1rEMo+Cf46xY8FK6eKx6jWfuK7uHUZOWkPHxvahu3IXf6RC3ZpjxtS
         rvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765505168; x=1766109968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EcCzUiXMsxI84pITFnN6DrkZDZAsaj1mZ+yE52KyDfA=;
        b=v1Hr+ZDia+NPFxRTjNQ/4ru5xOuc9l6odNdW0e5XaUvaUtvAtY0mH9BQf7gIEqI6xv
         XX7DKJyJ2ESvR4F71tH+gCufiEbllvAtdZrHGQ0uydoOH2S9GX3ZBQtQycIvtuqpyCd6
         R/UanahhEelH42g8lXfBMpnIW/1ZKN12dy+sC48tbwIftn4GFczEiczJCnJNqo3pkVDt
         Ic/kHmlz/c5/q2/uNevBvDZJo/ktg7K04sgO5R+TLHscZTJVz+WFHn3nMFP9WZd9kre/
         KndCVbnf0OCgju2j+j6UjuMQiYznhcgDkND5oh/h1Fci6738LqdtHYh2K1JRdP2I9y/P
         bBZg==
X-Forwarded-Encrypted: i=1; AJvYcCWiKlRVmyHnkni1w/kepcg+6oUIYFnOoWiKr9bdmN7QVPMZknfm0qQUhq+7rSy5Yz28wtd9ErA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwH05Ca8Q54y5qlmWVaZMd/0g8K+tLW+dUfy3HD9sEhofV1QfYL
	mg3mMRhMFM/RAX1jbu7Cx65qVRWIDDPA92ssOeb8/rnC2wY/w8panola
X-Gm-Gg: AY/fxX51QY1jaMRUl9wbA6+rEMnjmBAyOsJhXpNruq8HClrT9HInXKKqd6KhKny1Hdb
	YzIckvXOCz0eLVVUN2Exu/5qQI7Ik7zTp1MxCVZop9Sfdg9ixS8meioH5pRz/HoF9XX42xfrGtV
	zxeRsr95ROKSHI45Vnj68ZHwrys+tep9wZXh5sKwn4XNIdX7opiOXDcI8WKnnFLH44IOBaEVkwJ
	dzpBWpIIA5ynmvR2Imo+ITNrW3ZRDV9Yn0q/D3q93NeBZPNZtk2kZxnvCHL3OF3MpoxlngMlkAQ
	5FPTOIlEBOTxRWiwvFwHBagDbOt2FHhzlDbeV3zd/HUc7OQq2h71tsjIdxKo/plKoN/wm3loiQi
	VuVeFdGbsm7wd+YnXaU3vaAkp0uokntLtAafZGGuadDdrnqwbfWLIyfPkwriwgT6iEnzdFTs/RE
	sxFGFZtdxx4A==
X-Google-Smtp-Source: AGHT+IG4OglOWBlD1VKepmk+tiFRagNZMAVHPJzfqBDDWkRcGZOlcpelbUg9zYKtD/uPOdqR748juQ==
X-Received: by 2002:a05:7022:e997:b0:11a:3a1c:6c5c with SMTP id a92af1059eb24-11f349a48c3mr530798c88.3.1765505167760;
        Thu, 11 Dec 2025 18:06:07 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ffae2sm10501159c88.9.2025.12.11.18.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:06:07 -0800 (PST)
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
Cc: "Anton D . Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
Date: Fri, 12 Dec 2025 10:05:01 +0800
Message-ID: <20251212020504.915616-2-inochiama@gmail.com>
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

The DMA controller on CV1800B needs to use the DMA phandle args
as the channel number instead of hardware handshake number, so
add a new compatible for the DMA controller on CV1800B.

Change the DMA phandle args parsing logic so it can use handshake
number as channel number if necessary

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index a393a33c8908..0b5c8314e25e 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - snps,axi-dma-1.01a
       - intel,kmb-axi-dma
+      - sophgo,cv1800b-axi-dma
       - starfive,jh7110-axi-dma
       - starfive,jh8100-axi-dma

--
2.52.0

