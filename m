Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A471E3762
	for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 03:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760931574; cv=none; b=PvPcBcfuawNEjRotillZwUGw0Xwyy0dhE44wVNRtxnlpgrxH18XDx/TOzBH9PJU3NibXJ1gYzce0vKSjTlWZClnFdmCNk0g2Jyk1NEjB0+ZROdvBYFdV6UOaTFgkLh//0JR09iQF4kVgzj7aD11mGJjlwXhfIL4QI4NjtqkoTMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760931574; c=relaxed/simple;
	bh=7ZMKBRn7WTwBL6qsn+lHI9SZa+lKRdoNg2FdbjpyDqE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u4niMhtHpE9glM6FmuiihoOI1uJiGqR5HssEhYlWt0oAG98q7b5LErnlMtCljb/TW4fWZENH6ZceIc+ozuR2dOvgUGn87qMvew68Q5JaWMrjSGASOLfWoa4CoSksIq0hXpGf271UPt4lcRdO+k+IorMSDuL0JSaPThcVmjneD6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWa9bYQT; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWa9bYQT"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7c2846c961fso1736962a34.2
        for <sophgo@lists.linux.dev>; Sun, 19 Oct 2025 20:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760931572; x=1761536372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0NX4YDlfnF2moHa0Gi9m7awPoXSV0rkM143rN50kIc=;
        b=TWa9bYQTIKW3NqLSKoLWD7rIryHCoaAsQgrq8khRFZRByGfpBE4NC4J5S1kuvgvh+I
         xQotQPXcnZXyPjk980ypHJpHpk3mJRTA4AoP66Wr3mBL92Og+ul7wIeP1STZ7PkHr6da
         c2fr4+/B5uK/cyjmXEkZ7mys0gZ16tQ3NKwa6Qfj4nAeAXU2V0boPOuhV3ngaIXvADJw
         et5Dw2z0+Dl49YXaA64LhxE2MKdnKdUfyBigPtF9lYOZp8ZQ+SSPAsJ4lxdGeHy3v6it
         OXYx4W1KTS1lWB8Mg5kbsD1D9zvo7vehYr9wZngAzmGdJV48vxpBb8XDdAYmebg6hXtx
         rX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760931572; x=1761536372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0NX4YDlfnF2moHa0Gi9m7awPoXSV0rkM143rN50kIc=;
        b=ocI54NaECoetkq1VUfZV3U9g/2fuUo3WdWYpmX4efU5TloHS/3ti6q3LNSh2yWduT2
         7b26ECnw2O18BcUYFhF/nbp+TfITmYfYi9yI/c55rAQm7ne4reB1tY0DkPtuMIxFq3dZ
         WBtBMMbniD5U1tYJhDkH7V/jr+BtoCMXvzo88gpEbFMEDq8IXmtnbifGa6vEzsLDy5iT
         nMMusVaj1HthA8CjMfgZ5aMRH+RWS3FItVZWu15GaquJriQf01qSnOwwIJw7D4YIHIX3
         iajM0DE3pBk8qGSq1nFg22kjDnes4lfltGN4mmZMDGUA1gbh8r9O2W32WSjFBka/foLa
         UZkg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0zVhBArZJocamU8zIo6RfoandipJSZNz6/n8Ooe/U4djmS1tm5OrE7utQhZ0pLTBWEXEGgM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRJ8xSyY+zUz9Er4FiMC9Om2EDvB9PzjAduohpuIUnrABdTOgH
	JCdRTXjwLFpW9jg9VaGQX97s7cfh5sj5Dm009f67U9gGE0ED98TFdaE6
X-Gm-Gg: ASbGncsFVWKbG7BKGZsplIiFrEBl9bRSBhCTwNvbThSjKL/EeuP0Tyym1vK7tGiaobh
	bqZdH3v1Kvm3bAjOkX5tP6xsobn8t7STgEk44OzMenaXECgNcxUAlDDINPdETBHWiIdiOX4AjrN
	Xm0Y+jUddbhMG7MOett1syt2ge9xpoY73wEjKQSfcGu9NbeRpUwKXeIZ6xYKsbdOZdGog5oM+Na
	FvXN6EHv2GDoWlnkev8mHBO5jJY/7CagSpv68iukjZP56DSg86IfVfpjPgd1G0jxYkmtqPo467v
	+gGOYYfUvJYhjO7RPuhz45W6FK7nZ2PW7+SHaY+sL/D7xOxFmpxJY8MhM5Q6TvuTdi3EsFHPbAp
	z11PvjBKQHLDUZBLNFUYqjzFY7ICxO7Am2/9gA1ZpM6FsVdKk3we5PIGDxAfKytLeP2BIYFuBxy
	/9P41r7XpBHQ==
X-Google-Smtp-Source: AGHT+IHOs0K/WHwSdDIh+Y1Yr2b9rRO8V71RUx/TA5imJO1TgmZR2tfJC9CXblqfxCEeOeM8R6VM+w==
X-Received: by 2002:a05:6830:4985:b0:745:a30c:b088 with SMTP id 46e09a7af769-7c27c912669mr6299929a34.5.1760931572053;
        Sun, 19 Oct 2025 20:39:32 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c28890f2a6sm2259202a34.24.2025.10.19.20.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 20:39:30 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	rabenda.cn@gmail.com,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	mani@kernel.org,
	liujingqi@lanxincomputing.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 3/4] riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
Date: Mon, 20 Oct 2025 11:39:22 +0800
Message-Id: <1ad96631cc9d9d7403a2bed5585d856fa101a2ef.1760929111.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1760929111.git.unicorn_wang@outlook.com>
References: <cover.1760929111.git.unicorn_wang@outlook.com>
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

