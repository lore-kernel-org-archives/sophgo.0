Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2222C15BC
	for <sophgo@lists.linux.dev>; Tue, 15 Jul 2025 22:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752617652; cv=none; b=pPxrfn6NXzsSaOO1Bc9tt+z7yCfqND2WkcxbfkIdk3tTAxdeltvh9nm5JcSM0SQx4n7RCBag2MYp7OYWOVUPpNFhll7D12qxBRD6AqnoiEDao25xKuaGdcQSiV1R4IaOG+Am1UtNp2MBbYbyooZIxVs1Cyptv1UnCCnb5jz2mBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752617652; c=relaxed/simple;
	bh=yrluzH45Dsn6XaGZW7/NQKFSfg+yKKSg8nN2iCt5/jE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gxEa7wAcEK0W/MrLV0jbKbj2jiCuC4AJz8vouAj0QdM/9+I7QpSIWn5ZoXBga9s/W8G6xTL4CnoX36i0apjyoMObJKeHXahVBUaZY+6CqQjGTKSjSL1tQMgl1ipFa2DD96yAbcr6WXwo+tEhsw43XM29Zxd0rIFijY3OOxOsb6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8O5X1rj; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8O5X1rj"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-73972a54919so5432115b3a.3
        for <sophgo@lists.linux.dev>; Tue, 15 Jul 2025 15:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752617650; x=1753222450; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XrA4TJh+BvN7wjadeOIOqG++LC6BTg9ob7hjy1TX3gY=;
        b=j8O5X1rjEaJ4pVmT3xLVu/q5BA9N/I0FcVqgqrqfX7KdPe6vZavNCl07TCrS0f/FDA
         0fIcjH7XT6VXB9QFhYz7u9osn85zAAsEXcqeivXuyvIA7KNi+Wgl9uTuMMNWEz1PB26l
         MBlwzWW9LgALHEAkSwgBYkkNsMa9ufuG/YX15RW8MqYb5rR3yaSdo/2qOSJhl0+r+pBb
         kE9nh+EtipULDLRqbxHYg/cc5ea91j0QrcSpzzMQ4iZH68D8nyzjsIJ7leBRN7YKkFCa
         RsywK/wghdJlExQfmzqpxZI4c4k1r5nDNBJ6mvqcu2miMcC+Gu1rA5K+64pzRN6UU1Nu
         cf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752617650; x=1753222450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrA4TJh+BvN7wjadeOIOqG++LC6BTg9ob7hjy1TX3gY=;
        b=g6Ahoj6Dmz7VNE86h5snl2zUGoBZHctUzb+DY4k4WRCHmDtM7yLDt0xMwtBRyy/n+/
         51YS0T8kt+63Kz7eToYM99RbfuHxfjOxVMiLE2JnwFeR2v7PtHLQ065oM4JGQAtblhap
         1vRIUf9K7N7KCIY7FdMppqHhFQCwtJnVRJ296eYa9Mj92hJvoteXFCxnrgjeLjbg5ruT
         Ltl0qXLUdjni4fkYKgaHySgLQSQvOlEe9MG1GljM786QRkOj4/cIgEygec+BxwD7iX97
         W6js+hC6Rb6W5YJJXtOOHWoSx7FAoUmcE3jPdgZlHsiiYH1B4eNaTn2AHa3dbl1m5LTP
         yr3A==
X-Forwarded-Encrypted: i=1; AJvYcCWAgkl6qiqnyvEm+RcNphquj1mgSsfx0S1N+GnylQ2vRuLS71HIfk6syppBj2k35DOcSdxZzjY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNS3PB+MIRJ7XcT/mRrZtvz8eHIvmWWGPwRLkxRIhIhcr6Iy/F
	eHWvsKoy3bx4I0bO5yMI9VpNM5p5/2DW0wBHC1cNYQw3z/UWyzwldR5/
X-Gm-Gg: ASbGncs9QppK6reV29vikUnAvB29qWLetVZALkn18oArqEbSrxkyzDds5RYWFZ0PMoz
	jh4aB9QjYgp766WLhYT1JlbPrX1M8OaNwrX+t1dT15OxZhz45GqF+2nC/XrCkXgJuxAK4gnAvtW
	cDJXL3/g/vYz8Knj3ITi+Kz6Lbe4jsm5z12qzQ4XIgm6j+rt/mQSzIvcTnK/TBeBAJgvpC39Gtt
	Pf7buxAt3sDDZ0EABOYFxrJZRlmjn2Db0JZmPrTuQJkTs/z3DxQno3hIHU1Tvjpj1RiXrrXVy6H
	CceENRofEFU8P14+MtJ2xxSBHeZJhpIDRBoGlBEHU8tar+wwQiqU6kopGVsFE3m1lYBuRjQyRnr
	6S7h3PJZ4orweEnMJ2aelgw==
X-Google-Smtp-Source: AGHT+IEsInpCl2boS1cuUEjJoih0t5+paTL5H13Al6lEbtovW6VOt0TKWUcx6UhFT5+4ihi1IP+qdA==
X-Received: by 2002:a05:6a00:23d6:b0:736:d297:164 with SMTP id d2e1a72fcca58-7572267949emr327515b3a.1.1752617649472;
        Tue, 15 Jul 2025 15:14:09 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74eb9dd5d30sm13132920b3a.5.2025.07.15.15.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 15:14:08 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: dts: sophgo: fix mdio node name for CV180X
Date: Wed, 16 Jul 2025 06:13:48 +0800
Message-ID: <20250715221349.11034-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the mdio multipledxer is marked as mdio device, the check complains
the mdio bus number exceed the maximum.

Change the node name to mdio-mux to remove the following warnings:
mdio@3009800 (mdio-mux-mmioreg): mdio@80:reg:0:0: 128 is greater than
the maximum of 31

Fixes: b7945143bc33 ("riscv: dts: sophgo: Add mdio multiplexer device for cv18xx")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507140738.XRjv3G8i-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202507121830.POx2KDVi-lkp@intel.com/
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 5f094c6085cb..27056ef70ce4 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -57,7 +57,7 @@ rst: reset-controller@3003000 {
 			#reset-cells = <1>;
 		};

-		mdio: mdio@3009800 {
+		mdio: mdio-mux@3009800 {
 			compatible = "mdio-mux-mmioreg", "mdio-mux";
 			reg = <0x3009800 0x4>;
 			#address-cells = <1>;
--
2.50.1

