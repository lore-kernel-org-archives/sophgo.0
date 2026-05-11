Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F06732D0CC
	for <sophgo@lists.linux.dev>; Mon, 11 May 2026 06:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481528; cv=none; b=YaoB+/gL/rpjyqUmqcYl3ee+X2egUPWJb6kvHsg7BFVyiLl6a9aGLC+3rB3b4DXXZ3bNPEGiW987EzwdeW28+LSwfLl6lU4Uc1ZaYixFkZxze3jEkKy4KL9Ph+GcxO71jFF+DCBfecsg7p41BxFgQZ0f5fD4vofNXdiqC3rltTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481528; c=relaxed/simple;
	bh=rp9TUgqWsAEGx8ZoT9kL/TuCnQzCen5V/DE+nTxNcxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NNtzwDZI3f6AqCIlk//unspzlClC74MjHW8pZ2ijOjXfddXttKn7xBkZIhii31bFYzyuF8oQh8LFzL/lJPcrnu98wa7cacYCetH5UlprZBIhvZnOZLcz9ZKS+6ZtXQumMnQd4KJwoUkR9zYVwGYkcqQyH6JLJ7TWCOPze7MHrZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fECEw8aU; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fECEw8aU"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-365d712bbd2so2239354a91.2
        for <sophgo@lists.linux.dev>; Sun, 10 May 2026 23:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778481525; x=1779086325; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bU4crZfic9RXpArU6RhLb52aCOiXrQ2Y+zb7DPebOwE=;
        b=fECEw8aUEgfy8zT1V+f7yCbyGC2m8q3w2qZ7BG0nMQ4oQYmMIBId365bJgsO0YiTWe
         DURrgBgdeaCwBMBiAmJryQkX72XIM3Kg9J0BwhdXTXET+EyzP650Af2lJouhCmgB2o5W
         9+r7dQk31QZib4x88xiBZufQdoxKgZL29pOeygFhl8fhmSNPUG2tUz+cKwYTTBsfS31H
         MmqyJKtCcBXSMqpHcC6uDWZvAGEwv54vQMvH5OYb+Etx/+ZIJULkRGl02E5x2Fay0cl8
         1RYJAGzzi1AE1H7idk60NLAYNe+8OcYaEf/foAxkUelnSrfoo6zRBnroYPzOM7G4qC3s
         gstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481525; x=1779086325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bU4crZfic9RXpArU6RhLb52aCOiXrQ2Y+zb7DPebOwE=;
        b=mHGmMsXr32RMXRLX8dXpsZ4+eksBkCf1kaKuUPlC86Fhffsmw9ogN4W+xT/FugWItl
         CwE/6zhZ7/Jld8tBjo9hxiWX1zH6bBir0nd4jP1X2mop/l75at4Vu/lfn+gUEUzNWT25
         GSUJL1hEMp+UyGmKpjqSYZeDTuZcqjgr1SrrEOgQ7HrDxu+4VLrr4W/Aoi91j7d9zMn/
         Iq54TP1kefun6cIRFIsCFUqjlcBDtxOX0EanPmJvJx0fSgHbaaG6ce05AMBrtEt/vfPr
         V/P5XPzsUNM5j0y0ES81/BBIJcDUgeBBD1Z/wt1OOPaI9+nf7st9LFUqYe/1QWhwTQgS
         t2Wg==
X-Forwarded-Encrypted: i=1; AFNElJ+DEV00nSEbDkWmmNwtHrSpP5/+01KEaEagdl9yfC+EcKm5Tl+T6917dkkiVkoyht6Gx83eWr4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx97/usIqE5oKSiZr3lIiVDPbM/BGqMGsief/ujBj1pVdsChi1/
	WdkenWdRgLb8CpTVb3+i0ju6lUodrzGXkZ6s5+FbUb33UFzoFHbPRGfz
X-Gm-Gg: Acq92OGX6P1UDdrsoGmvCEEffQK22CIpObti5Ugmkrgjqvwr/QIijHaop+fazV7CHQM
	YpPdSCbGRTwVkQGGsy/Mvs9/4fwMhU9BvPQhNKv9mCPVW3APw58xWHDIJ8b4EOMCQGR5GD48LYj
	JjlEsg4YzFbK5qranE/mc5tzxAH3zcRFDOotJjRgJq7qI26RpzJ0KU0rouWVjoL6Rr0MDNy/aeF
	JjTkTT32TTbD3EmWrsVKE8n6dj/4R/UdeVaRtEfAnR91EG5Ii0Gyj2H4CQHhqtESNLv94ncLxI8
	X272dyD+/NWli1FJaxHGY+Qmd4tnNihX4fkIfLX3qSbckdeVG5ILuiCg/3GdKPVRG9o83VkbGdT
	a66BG2ugKl09f/eAA/BLcB/1Qb8TF8p2mrhN7ovVFnx1Fsn6L3/9OPVr92nhobxDcN9C+HQRP1q
	cZ7PdgAtGj1APPFFktb4PrveYnHp4bgeNtZQ==
X-Received: by 2002:a17:90a:2cc6:b0:365:fd4b:24ef with SMTP id 98e67ed59e1d1-365fd5a6b34mr13110423a91.8.1778481525495;
        Sun, 10 May 2026 23:38:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d687a2a8sm6358472a91.15.2026.05.10.23.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:38:45 -0700 (PDT)
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
Subject: [PATCH v6 1/2] dt-bindings: dma: snps,dw-axi-dmac: Add fallback compatible for CV1800B
Date: Mon, 11 May 2026 14:38:16 +0800
Message-ID: <20260511063818.463877-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511063818.463877-1-inochiama@gmail.com>
References: <20260511063818.463877-1-inochiama@gmail.com>
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

