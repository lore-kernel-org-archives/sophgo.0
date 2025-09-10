Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7ED235355
	for <sophgo@lists.linux.dev>; Wed, 10 Sep 2025 02:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757470213; cv=none; b=KPRTfZIt6+jvEtkL95Ydf1tmmPlGnwzn+eYd7uac0Kvly54CXHB6VlXAnvGWy4cIwjwGFH8EFx3djrme/xs2J4ubzzHvsKagaRVDDrAtpoWQ9KxhsLu4unZFU9oUL40EmkC8DS1+IVzBNPIIo7oOKFCesdmCIO8uyhG+ucNb5Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757470213; c=relaxed/simple;
	bh=7ZMKBRn7WTwBL6qsn+lHI9SZa+lKRdoNg2FdbjpyDqE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rSRT3LuaCgXNUzq71EBtyl22/tFZfDBYRkVkciF6E6l9ABo0iUFRpc0n+RCPmJNH+9LRGHhAkilR7mHpIf924BEpEMD9HxMlObofkEjtipPg3sk8ghUJ+m7c/06kn4x+4nKePAxGrKYdNmuC9ZSNRsgt8cOHa7GjPF2Nga0Mydo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9laIBcq; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9laIBcq"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b5f6ae99c3so38056461cf.1
        for <sophgo@lists.linux.dev>; Tue, 09 Sep 2025 19:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757470211; x=1758075011; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0NX4YDlfnF2moHa0Gi9m7awPoXSV0rkM143rN50kIc=;
        b=L9laIBcqM1bWDZCP7w3He5/l3LDG4K55CD6WYLoJJklyFEKHAJ6HGm43OwobqHEDtk
         GAS5Nt0ZGfHfqUnS/conkZ6USstOOujXM27LG1wLv85Co53t7R/bAwmFe96cWcO08CAu
         FDuxgdG9hZXrZZePswrsDxRY+V4cEyS1zmUBoGR9biIsOuZX5AcZeXlvQZZ3fH7Ur9L0
         +PXsIbEg8ml5RP5bC433ZxmFW1vYtoESse0iwN5edh3oE+Y/WyqMMwyZsFFivAAMFJdg
         bVZfwC4LYKllwyygUoH+i9chhzklyjP1EFa/ZUwczz8HbCnq4/XC8BRGdkRxoAHUHHOG
         dHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757470211; x=1758075011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0NX4YDlfnF2moHa0Gi9m7awPoXSV0rkM143rN50kIc=;
        b=mJkjSrw2Ww+JFCbqYgK0XcUiE/yTTAELj3QhIOaXQhJ+CCYYoPiIsy30+kKZJpfTub
         zD8yMQdFyjZuKrm0UblqyNDuN38zKEaP9bMp+JyOpBs3NufJklyPBxdrjcx8DAOpYRav
         knFHs1ivSV7J2KtxyzkUSucsMYVuMlFONZkfaRBehyqPvXq3Qd54kKmb1uCmRpH3k8h4
         tbaU83a63t2s8C/19/asuQZv1g+yNvHOpkjFmFRHIX+gS7WLqUUtKlbwrVFLRHrUVQ+7
         sNjkyNy6EGFuHLaIJDvM6baoEyzSEVRahgOsFcBwWwD6b53v02F8lBbJTSOvTRXO5GhB
         PgvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVodNC9y1q9ZVf9uOsh635CmSh2yIXIU7llcc6QND9cThOfKSh/nwxS9Tfc6zJWta2Z+/xhtWk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs904P6xMuXRDSz6XqyjPaPqhgAXDNocguARv5Zdbf+UhyuKOc
	aKWZyys5H3hgIQIgAV9WZ6BEQ124QYHQRYpSatA8YaajHbgH3q8Dstdf
X-Gm-Gg: ASbGncsbYNxV4J05bLUxx0bqsRh1Z7x7EABXUvHQrekelk0hAfJzGoy455taRcn2kvb
	yNCzMIUxLbWqwmyqB9ZfQTwxh/CJwfQoRDGFFqXnrzQIIoSquWgcAZM9yIx/bOdtgzvYiy7+61j
	B1hwThKWSYvoeQxY/6Vqwi1uNNcGMLGMrkUh+RkDnkJghAyBZd1WhS6/NL7LyGfzo3536tsFtdt
	/AeKm5GFvH4fr5PK7jfoob2dAkDkVAByErtxLYvmqOB/1gab2i9id4nRG1rjqpEwfOOsh2tkIeI
	iqElEExAhgdccILkDaOpsoSJpdt7kVE7r3LhGsbopezPWBTvF4e/HBDkXU94wPIM0rhRPp79VK/
	IryZd9unRUgpXeS1ibfp4Br4fQoAlJ+NF
X-Google-Smtp-Source: AGHT+IFuaLhFcKitf9ZA1Gn5XpJiUTwI3uqTd3riF4+17FcbGqTmvMmJT20lOqveQiIDe1ADGGm6JA==
X-Received: by 2002:a05:622a:647:b0:4b3:cbc:18b9 with SMTP id d75a77b69052e-4b5f83c890dmr144732481cf.33.1757470210737;
        Tue, 09 Sep 2025 19:10:10 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b61bbbc0ecsm17446521cf.25.2025.09.09.19.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:10:10 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH v2 6/7] riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
Date: Wed, 10 Sep 2025 10:10:01 +0800
Message-Id: <2d85c8b221bf4aceae6f3dfaef6d53221daf7e70.1757467895.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757467895.git.unicorn_wang@outlook.com>
References: <cover.1757467895.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Enable PCIe controllers for Sophgo SG2042_EVB_V1.X board,
which uses SG2042 SoC.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
index 3320bc1dd2c6..a186d036cf36 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
@@ -164,6 +164,18 @@ phy0: phy@0 {
 	};
 };
 
+&pcie_rc0 {
+	status = "okay";
+};
+
+&pcie_rc1 {
+	status = "okay";
+};
+
+&pcie_rc2 {
+	status = "okay";
+};
+
 &pinctrl {
 	emmc_cfg: sdhci-emmc-cfg {
 		sdhci-emmc-wp-pins {
-- 
2.34.1

