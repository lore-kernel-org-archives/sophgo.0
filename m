Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BB81946A1
	for <sophgo@lists.linux.dev>; Sun, 16 Feb 2025 12:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739709633; cv=none; b=qNMMP5AyJYIB+giKkO/7LvJCKP0kEBRCtGjtEoR9sOPjbpzSPdzX+KCS+N0IB8NhbF/vnbjH/L2rsZJXDnM1IuMft/1mnzJ03TeSZGUPbW0S036cwMIjRu1+APPdi3HEGVDYeqKSq04Bu4TiTAPUZvfez9xQELLOkCNEn5P1/Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739709633; c=relaxed/simple;
	bh=1Pj52/8KJlgnD25d3/zs/IIeaAZNBOULaUvcOE8jy4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AGZOfMkW35Oz6E7K1SMabxNy3BDikpGnEHHIY18SmFqypobgbVlW+jqN6KCq0cYEKVoywOHhL1AMOdH4Nq3lQiNfyLw6Q3vVYCLbu1quFYIe4LINs7qO4d4GpRAykOPBUNlqxi1rjiz5FAlFHoarG6nQrAhravyfh0F0+u6Dwao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8wH5JLt; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8wH5JLt"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c081fe0a5eso291052385a.2
        for <sophgo@lists.linux.dev>; Sun, 16 Feb 2025 04:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739709631; x=1740314431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbqdsXVR3N15jF5g1M1GQwDGOPgdER4+dFi3kR5bHSs=;
        b=i8wH5JLt7kYQoBN+/3m+nwsOX2Dp/Jb0abMxnf0h2tZS99fnkoGuDMutVfZEdT0g3l
         45Dv9ZSzNyEiMXFpsAHku60lu/TlSa90nvbkLuAP9sVxsLfykd9mEAiuXQmxHNkMRimM
         h831wLwEHc8Dy90VZXChdV021Y5F37MJcs5a0dJ1GFfZa9SaBXo/dwKH0m8NH+0gD4Q3
         uB/RTocH2wXK7yBpjvFaD2t80DMbT58950IhLJEJesupM9Uk1DUGWJdSMqBlHmpaGMUC
         S0Pv96l5vlKe6JuCpjoiWJDxSxGIhxTuGOKA4X5s2Ybe0cIppDuqEvEHyi7FGH0A+PjK
         eZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739709631; x=1740314431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbqdsXVR3N15jF5g1M1GQwDGOPgdER4+dFi3kR5bHSs=;
        b=sd7O3e4TQSGymH1hunHX5tyFbfRW/88cmO44Sa3N4yA/CwI7AvtHqMhTci5J3ZZS9q
         IXBIpZuYsgKUmqArr9OSU68PLpAVhj3MlpC8Z4s+OWLiuiU6VfDGoM6hSawEeM5DYebd
         ka/Ka+Rh1GakG7C67/YCKJ5vPcyvPlnkylujyFJSnSSaBOr/m3neBlsLc64GQ6/k2gYF
         w2G+qYq7/3A9npug7DTRTaJ7umQDzM6Rs8EhdUQhKzLYpz6ujo8kOFrmpEIWA4QpFBr0
         bCXHOUT8/TEFIcMjOgXHy429DE6UW/XSFD5Lt4oLz6jJpauiSzXq4isHX3L1NRAOnLpS
         ZuvA==
X-Forwarded-Encrypted: i=1; AJvYcCXCCdQZIpJwNrFyhlu0uQavscF23bPKOBgYNDxU/iwMah+Wytw1i20u49XcboL6xHSHW/Z6y5I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzS8P333qRNw59FL41305+aaGtaOyr+DCnR0zj/ALSu6Q40axF4
	pNcXo2xOFHB1JTtp9+3QQNpAerr81vCfVREilxalw1iWRSMcQRZQ
X-Gm-Gg: ASbGnct83KtIBDnGUS0Jx0vXj8tWfjgKxE3qqyN6lyWak95AfEE2WgJrazOiv5JQVfl
	gpSwRsGX4QNcMNTJafBlZzfBHCwTh04nso5k6qSqvFcKFDi662pP8jxnKuFaIKtQ4q+e/CBzgRu
	q/TMv89oiwDRMFPYND162oiyp4axFKOBR8WALt/6oaftBWa4EPBFLqq02mfx7jIBsLMY7R+5WL7
	hgxoEd/KyUs/2XejJJYHfbqhcQO3x+3F0NtD7jR3J7uRIQ7LfxObk5hk3XhW/6D3s8=
X-Google-Smtp-Source: AGHT+IF5XSuhiI2P5QLx2nsbWyypxYdcETy3LCJ+aCkIcrEcibIXS/f4XBYvlBrBHEwSP+ZxkyRe4w==
X-Received: by 2002:a05:620a:4010:b0:7bf:fffb:5818 with SMTP id af79cd13be357-7c08aaa2cc8mr943249585a.57.1739709630750;
        Sun, 16 Feb 2025 04:40:30 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c09a14d45dsm31099185a.10.2025.02.16.04.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 04:40:30 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Furong Xu <0x1207@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Serge Semin <fancer.lancer@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH net-next v5 2/3] net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
Date: Sun, 16 Feb 2025 20:39:50 +0800
Message-ID: <20250216123953.1252523-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216123953.1252523-1-inochiama@gmail.com>
References: <20250216123953.1252523-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "snps,dwmac-5.30a" compatible string for 5.30a version that can avoid
to define some platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c   | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index d0e61aa1a495..8dc3bd6946c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -405,6 +405,17 @@ static int stmmac_of_get_mac_mode(struct device_node *np)
 	return -ENODEV;
 }
 
+/* Compatible string array for all gmac4 devices */
+static const char * const stmmac_gmac4_compats[] = {
+	"snps,dwmac-4.00",
+	"snps,dwmac-4.10a",
+	"snps,dwmac-4.20a",
+	"snps,dwmac-5.10a",
+	"snps,dwmac-5.20",
+	"snps,dwmac-5.30a",
+	NULL
+};
+
 /**
  * stmmac_probe_config_dt - parse device-tree driver parameters
  * @pdev: platform_device structure
@@ -538,11 +549,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->pmt = 1;
 	}
 
-	if (of_device_is_compatible(np, "snps,dwmac-4.00") ||
-	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
+	if (of_device_compatible_match(np, stmmac_gmac4_compats)) {
 		plat->has_gmac4 = 1;
 		plat->has_gmac = 0;
 		plat->pmt = 1;
-- 
2.48.1

