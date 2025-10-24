Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BB122541B
	for <sophgo@lists.linux.dev>; Fri, 24 Oct 2025 01:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761270951; cv=none; b=bM/LoIm0z7AvrzFncPxdEeJKLftGQH9ngwzzyyfr6XOF2ukSBzHVjswnB/+MXo8jOXtD5IvQRvgo874781QF0/HGIQUbvr0MVH9vErspuI2+7sVcIunuH8ZzPYTZ6rRbiXRBehf7NpFqVXkta3X7JbGHby2W+REBtaPg+5rhEyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761270951; c=relaxed/simple;
	bh=P2La+FoJZ35MJzEo8yVcVLSFzhQhJljTmUai3XD3wr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHQnDy4+TMd2tREkAoCcfC//di41Or8eXUSFer2jdXwH04uJrh08jlIpu9ZPAcQNet17vx9GATYvjWbJNIxnyVB/2tA4tw1OEm7UpaDdhvy64NWqNhhjtlDcP266/C+086LxiVK2vM87qPwW4OckdvxqVHkHknIiIbpqt3h2qpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKN3VRVT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKN3VRVT"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-28a5b8b12a1so15401205ad.0
        for <sophgo@lists.linux.dev>; Thu, 23 Oct 2025 18:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761270947; x=1761875747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6e+TNG8HQKWjELTx3r9i/rdMStiwaJjw+wxw++IoG08=;
        b=hKN3VRVTpCVNJtw+3w3mNaGOGVcRdeSETxksrm6bhM6fkcvFRn7lFdqTjZNtdeaX89
         whHqfpoJc0cdjpKtYWw+q03AJnEE87l/mjH6wYX/v42g6+bQDXyFV0O/s+85peeeGd6N
         304S/fx7c0ukAxyjqCui2Eg7rvmEzC0H9xyby9VIY4aTfOYWRYDL/1NcEF2YeHoracaf
         U26+BurXPQCFuECDL9IaeNDf75Vl9hqBrl6y45c8vuX+Yi97Cy+R0ay3ODaR9oH/CXTS
         5/BMxFbkmVaIaIGbp9SRxnvA7dkSZFmluwymK57iWn5kuKGx5LqBYYtbvh/3PAvycq5S
         aPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761270947; x=1761875747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6e+TNG8HQKWjELTx3r9i/rdMStiwaJjw+wxw++IoG08=;
        b=NWX8LPqnMh/yNDxmwOfF7yF47gbB65TFtDd6gs/+pvYGvXYYqhe1oMc8cng7WZZxfv
         hRbkbYLZc2IHy70N8wk1Ju1zazNTWN2nkXJfpbmuVJg7yTls+dGfifS3AZloDyOnnZge
         eaiqC7ouJTlFnHOg7maC1EMrzYWvdrvRMRv+ecUZPIhbZBylXBVlH4NhIm7yMZMPtLEj
         Jv0X2tK9WCzEeesLLXrvzajfswnQYkHNLooF/2jsO3c/jUnWAbNPylF2ijkzgtViJ0En
         wEbhwzHrAbhlcvKIwUaE93eBJMyQ0iAQOJxRUAkmgHPqv8ziAp1TkFLxeVoGrpPMoYbj
         kR9w==
X-Forwarded-Encrypted: i=1; AJvYcCXTlE1D/i+77zvDl8Swbdl+mjwrWcMnXpPQ5lgvqjm5HMO4Dp5pHhO9vr6R1SFrocLLodU6qKY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0f33ko3WK0FccFO/9h+cQ1yR9/mQjWmVSqA4/K7CKiCM3AVCA
	Vk1oEBeubOcmv9k4MM0ZCRNc8VJR0MPZyrj3Ln9mNJXEbhlu/nwxkvvB
X-Gm-Gg: ASbGncuHcGK9J7xBTijLtFwrHnasXdXWvg8u+HuqfwkJdrvJCfdyEMUv7pwmenJ78FU
	X0iHgb8Vbu9ajuV7imNIgIrjm1Zj2ul1MDIFae9RTugeWy7a4EZKFaJFD2Fv1b8vLxr1x7qkexD
	81asCmf41jThUySUcHnZIxCfFm1lqD349q2UZVDLw40DzS8DyHpiI0G4LIEPaqIHFQkLmzwBwyG
	dMqRLk9yUxRi2ActRM9+82UOpp7EJUzRNOEz4HuDS0R9NpRJduXJEb1/qXwuskhqRPAHuvdS9Pf
	8LZ93nZ2ih4J91GO1xN8dD/2bxM0cwlj9sebaGxPkU9euJA0bGpfYhxVkmBlBvgXjg5fA9UKIop
	CMbsgAUn5oF3ioqXZTMjRHyvMdlFbJuH5MzLOHSIQRO+x5XYc+hNdx3iQJOJptWwuNDYH7D306M
	dL2xm8Z4R2rQ==
X-Google-Smtp-Source: AGHT+IHpW5wlGIbn04l1ii92JJTddNPs25LrGmd/cpssrIhv3LxjZMplAv5M1j+a+0YAZnT5qvs+JQ==
X-Received: by 2002:a17:902:db11:b0:240:48f4:40f7 with SMTP id d9443c01a7336-290cba4efc9mr405211955ad.39.1761270947035;
        Thu, 23 Oct 2025 18:55:47 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dda793esm38533865ad.5.2025.10.23.18.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 18:55:46 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 3/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri, 24 Oct 2025 09:55:24 +0800
Message-ID: <20251024015524.291013-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024015524.291013-1-inochiama@gmail.com>
References: <20251024015524.291013-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the SG2042 has an internal rx delay, the delay should be removed
when initializing the mac, otherwise the phy will be misconfigurated.

Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index 3b7947a7a7ba..7f0ca4249a13 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -7,11 +7,16 @@
 
 #include <linux/clk.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 
 #include "stmmac_platform.h"
 
+struct sophgo_dwmac_data {
+	bool has_internal_rx_delay;
+};
+
 static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
 				    struct plat_stmmacenet_data *plat_dat,
 				    struct stmmac_resources *stmmac_res)
@@ -32,6 +37,7 @@ static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
 static int sophgo_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
+	const struct sophgo_dwmac_data *data;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	int ret;
@@ -50,11 +56,23 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	data = device_get_match_data(&pdev->dev);
+	if (data && data->has_internal_rx_delay) {
+		plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
+									  false, true);
+		if (plat_dat->phy_interface == PHY_INTERFACE_MODE_NA)
+			return -EINVAL;
+	}
+
 	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
 }
 
+static struct sophgo_dwmac_data sg2042_dwmac_data = {
+	.has_internal_rx_delay = true,
+};
+
 static const struct of_device_id sophgo_dwmac_match[] = {
-	{ .compatible = "sophgo,sg2042-dwmac" },
+	{ .compatible = "sophgo,sg2042-dwmac", .data = &sg2042_dwmac_data },
 	{ .compatible = "sophgo,sg2044-dwmac" },
 	{ /* sentinel */ }
 };
-- 
2.51.1

