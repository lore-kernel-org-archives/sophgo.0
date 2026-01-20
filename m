Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A048330652
	for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 03:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768879969; cv=none; b=QwMwAHfLDQyGyEy/NHfP3VF/FXp645n0+xfJ4bUS0zkHXV3s4r3zCv6DYbNNY5uEziFZEa+AeUd9KVdoZDwyGNOzVbO6GhrYFRWIA9F9UzV9n3SbAjkFdOqDSorrnkVXr+Mt1l61TycrDxldEKVOGndyNMMHrOewAtkdShgWN+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768879969; c=relaxed/simple;
	bh=TnrWvLiHpwdAR1oIsgz5dmEGTJ7Pw1ADVefNWrpsJwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S3eJVn+i/slhJ72WapuSQAnQ8xN5D8w34wRq9+6H/2AWhl8Z4f+yLlQcMGwaDhnnE3K42yYl8U9tns/iAXoBXnPTQ9xVDnyt9tu6JB9dJroobqkU2IsLei9dxoDzAQ6aIdOz7b+ZrK3oUnadA21y222Sa3df8dhWmNOQxk88Vtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nhr1UFXn; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nhr1UFXn"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5014e8b1615so50858031cf.3
        for <sophgo@lists.linux.dev>; Mon, 19 Jan 2026 19:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768879966; x=1769484766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlh3awqwpSDVfosrs2ZgXu5CLF0C481abnvSQYVV+dg=;
        b=Nhr1UFXneO3YWJBWvKEjxOhb8anMPZ9+yF7f3rk/dvxg8wKi6hrYp87X90AKxTrLU8
         h3O3pOXLbV358615xvUbbdexyTBbf4h79ZWZIkSpkyZNijCGgiY3p6O3EDTmy225XK/i
         0qWzgzVqP3uWVjEx4ZXhn6YsC5KwoiwU+eE5w8MI3vmVKaL/dzmkcK0agNIRSNt0Kybu
         5DU/NSf+Pki83MNsZiSR6/SmX/c/sLN1ePltYP6y+2V9yfcLTNZCuoR/v9hYLwEBRoZs
         XgYkrrUIDORzRwSilv15cCSEbIsn7RqonFNxobxyUrKcO48m4CzBijueiV1LV3HMkEmJ
         Z2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768879966; x=1769484766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hlh3awqwpSDVfosrs2ZgXu5CLF0C481abnvSQYVV+dg=;
        b=A6vjQ4QCZeQoPzI92jS1N54H9/Ryf3DBpTzcqJ0D0Fx5/XZW7NbiZZ3Jv7fTXilJFn
         dD7zDXLN6mOg5htNqf5ZL2dLqmU8RS1/Svnj0VgMcqVVbKQq9rdPK4IgSZGlmH4d/xpp
         jdVFA3ekpuXI0vxQG7Dxx2vwjD55uBZt0VzN6hGm2z/bSbKXbcdd1ONyb6uIGAtbFKVO
         CNnyZ1p4XYKwxn5kG3aajsOLi4WWVKxiPO74M8C7wzw+AMiYPaEg+1aRB/Jkhct7ol13
         bsnJGiQj2pV+8geIZywEm9dmm/XSqZFAg42UgCA8KJi7c2DySFpGZkNZFSdv4JYweyy+
         cW3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPLlj5PYFpqdjbS7DH0g+rCsjMW5aWXFHZFSgOGLXFgTFUUAsUQWVDxhE+Wy+FEWjbygWBcbI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUoaGMlmYjjgJeDmqNpDBwxpjZMiunfKZJyhefz463hLOGuwMJ
	lFs4JPG9XwNo0qQ1E28RrLr4yl2+U/7qLqZEfZvNcg3A+XoMrcWaxRVU
X-Gm-Gg: AY/fxX6KNOjNAAlDw+PFcZ+r1noqqzxW0OycloUwbkmzaUxElojp/gkyP4A4aQuoIpm
	7Wk9I03Dbh4xZq3Q8ZU/I1AVEcUeyCXGHtLfBkAEPTFo6sjO9di+DpAFaxlngyugLvs1t1/EBlm
	nEzEQfLTjN4wxOBUgbAEb/Ib9427mcPT0MM+L+kVO+145Qs8/hkOLXG760WZmWH4635bJLJLWIc
	xdT7QGa36/s85O4RD83Ike6s4J71qj9eI5ptNtrS8+5j58NS4ik8wpkxa7QWtsaCZ8rEFfWeSRO
	FGElFodXU0zio4ffbbOWusUdom/X6UzzF7Oi+lkVP9XXsWym7Y39dKFTD5GyymORxsIQ/wYv3gc
	uGpk0s1q2e6ryvEp7i1kIRhWmVdM2gs72zv5ro6cl//6z3GZTjq/ZlibYCfWkgEgf/pU2nSoGEn
	nUyMEU9hEpcg==
X-Received: by 2002:a05:7300:6c89:b0:2ae:4f61:892e with SMTP id 5a478bee46e88-2b6b4eaddf6mr9178898eec.36.1768873045971;
        Mon, 19 Jan 2026 17:37:25 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b36550dfsm15337344eec.25.2026.01.19.17.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:37:25 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
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
	Ze Huang <huangze@whut.edu.cn>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH v3 3/3] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
Date: Tue, 20 Jan 2026 09:37:05 +0800
Message-ID: <20260120013706.436742-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120013706.436742-1-inochiama@gmail.com>
References: <20260120013706.436742-1-inochiama@gmail.com>
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

