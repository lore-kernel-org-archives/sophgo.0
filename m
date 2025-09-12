Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788142144C7
	for <sophgo@lists.linux.dev>; Fri, 12 Sep 2025 02:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757644686; cv=none; b=PuD1edjPWYQksQ6hoi8stZf7s89wTm2KSBx/0e/0+6B9cGRLFf9zti1/vFxJLzsUciAge8GEJSStToMEr98UcBZplAuDKJLTvx4R+K4z4cJJSU2xFzcFgAgp2yLsl0q6kNMl3K4TCT1MHwSrz0jT8OL6TuTl1yNn8mfbenlJ4ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757644686; c=relaxed/simple;
	bh=+sDUkA3o71u4xm0yCZaBibtMSUQ/NK+r5JUrUR+q7Ew=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cxXPy3A53cLnyuyUZHZbbD1MX3zQnbCFC5emkZHkP7uoaor1EqnzCQ+ehkh8WMvSKQ9DbItoaofSPS+HMTU4xfwFo7L6R2EJl0CaYlSY/qTJg8x0A11tDO7tv8fnv/0/QlOXh6UptNbPB8HaTg7yMUWIsPoLhcLoMsKEgTNfmXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSR9v3Dp; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSR9v3Dp"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-74382048b8cso1184188a34.3
        for <sophgo@lists.linux.dev>; Thu, 11 Sep 2025 19:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757644683; x=1758249483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8dXK+URwMz/QYwLwmlxkiqTgmS0zDdGrSZfnYxwO4o=;
        b=hSR9v3Dpf88TPMgBTe6U9/bOreO6rCSeVtDEHsJIA0PmCOT/l/Il7Zzn9eL8w6ykyA
         AfBfMzQ2mJjWu3rkPJGd1Jpe7BrXG6+QIBLB0Wqw+lbxwDfDWr3uchyW13yO2tBuRJdT
         W2/caEekwYJCiJJZbnQeVOptF4FX9PSVMZvB2CVow7meR0Lb4qmHtXsfP8svz1PyN2Ir
         pE1rTxAplAunTb9/fm0F0WFvh86rTNzgMARGLNAhsPLjO7R87jCw4DmQjxr9dTaGvVpO
         Q/FhsVMLuLKZ4r6W/DI4sj0X0FIJL9gifl0tyVQ/oMaXBQsRg5gGt0FsL+P1p+SqrgVP
         ttNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757644683; x=1758249483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8dXK+URwMz/QYwLwmlxkiqTgmS0zDdGrSZfnYxwO4o=;
        b=LT5u1ACtDhdhUTxkb/DKcuhtHScM9MhaYAPOnSXs5A2byMtUKF68PghkGv2G/VXiTf
         UCGpFO8kijTYwn91wXO73J0Sgsb6i2FxAkQHjrNclH4++c6JBl9MmLbAEvCrgwiLwDdD
         w7FLudlysplGXBb5vSSiMc3Z5TsBlNU5rCglunA9Qsuo7hoQDmwkQETihYy9GzltitKB
         BVDx93GW2H5vjqPPQcxz1HFF6N+0UtEPOpfGeiyGYVX3za9gq4KLvlnnW0BDD2N8anmj
         e361nEYVkjO24BXVGS6BXn6QYqtw+FQJbC1OgASaJVNyuju9FrbgPBgSDqCP7ZcOiXkz
         5u/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPn8zUkOqHAJfxo1pRPFGHBJ3h0Qf2f5yBoU6+3mmnVjoDNJ2HIQzL4dvSmNBj7GKgZGpj9IA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVX6tWUmLffE4ww584e2yZl2pCIwZV4fLDUHUVa3J/6TD4NrM3
	f9kMb2nRNOUoQE7/tmtbZ1mTYIsCX9L5Bz1ZzxMY9Vx8mK6UEXMMEMlv
X-Gm-Gg: ASbGncuTwxp+xFDYY7kThOdcYb+5Cdib6J7JKKwS79ze9jvOgdKapDEOcz9HDQYmV2r
	nuuYU2S7JLyT2zeXsrhfxRnu8UHtsojmAE2x+rRBaSpTTSqdXPWhA0tpNt7NB3PsTet6XhXb9sT
	rmq2r6XCpg2ZGNwMDkxxKlprVjxw1X+8Ybski687aJiEsz6lgiHwYVjvF1bzMuX9yo9ndIxfZfL
	5ncEkjzP7feDeD15xGY8q9UqTUVIAynhS9cl6fTVLwzU33iePtu/9JH/8IS/fNGtrFWfIkFT00F
	kpsFurXDnF5oyUNkBUkR0l3W0pl/8NN2joe/k6cHZkA1StI8gqlc/tuenVbFYbYCVjpbyL6lYmy
	5aFa4woSyngMvtmD0agYJoe/e24QGrsGB
X-Google-Smtp-Source: AGHT+IETqLmXYZmyiMH+mKY1KPo6Sff/q9RyP4s68oN/ZgPUPkjihsjoo2nIbRNYpa7WwZvbeHu73A==
X-Received: by 2002:a05:6808:470a:b0:439:b198:23c7 with SMTP id 5614622812f47-43b8da0c548mr626312b6e.31.1757644683591;
        Thu, 11 Sep 2025 19:38:03 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43b8293163csm565701b6e.12.2025.09.11.19.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:38:02 -0700 (PDT)
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
	fengchun.li@sophgo.com,
	jeffbai@aosc.io
Subject: [PATCH v3 7/7] riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0
Date: Fri, 12 Sep 2025 10:37:54 +0800
Message-Id: <16831a3277a6c8c19436a17ac199d2f9b80f9ce5.1757643388.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757643388.git.unicorn_wang@outlook.com>
References: <cover.1757643388.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Enable PCIe controllers for Sophgo SG2042_EVB_V2.0 board,
which uses SG2042 SoC.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
index 46980e41b886..0cd0dc0f537c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
@@ -152,6 +152,18 @@ phy0: phy@0 {
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

