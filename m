Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929E4265CBE
	for <sophgo@lists.linux.dev>; Fri, 14 Nov 2025 00:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763080725; cv=none; b=F91w7NodKOHHVKr1fvkSayP7KIkMAwiQPwmuCGRyuYtU6cWdN2Ap7RswxGd0jCNlD0d0HpX1C3F9yVr3CIK+X5e8Vb2Iuzd6wn1awlSm3JaIroUoKd00JSmXYviwMS49ZEnz1e0wcuTrGPqN4Htie/MXHMm2vcAeiaHjCqmj9e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763080725; c=relaxed/simple;
	bh=rxp/NrNnXrKf8e0GBNNTRnLO6fRnsXQEhl3HcuPYlQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zbshq1EuVyRAAASZTWP0yfYtW9h2WaDlal0O5+i4y9GdpX63c1M1ZKE5Eu86boISYM/dbjS/yA9Mmq4N6NuVHT6rUszeDo4KgmOgSwgZu7tSfxFNXBeeIXtCw5emYAwTuD4CdNiL4H1YiQF1xlO+xwJMsAifjjhbBQ6xY1AKZg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZxHrtyh; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZxHrtyh"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-343ee44d89aso1904576a91.2
        for <sophgo@lists.linux.dev>; Thu, 13 Nov 2025 16:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763080723; x=1763685523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=;
        b=fZxHrtyh3ow19UPQjRfjytK8Vhfb3KSMjA12Hem/qh+fpPi0bjJpo8J1FYpgcpiYmU
         nU3ev8WlrAvpZFjwWE+sGjyQPMXvn0tHru4FiW/S3gbXMOwnbGPbFP4VjQIw3Mcyl1ZS
         8aecDuFrBYsmF1t126BM6Xk9eWfgtBIo4kb97n8PfrWj4bQJBT/1BQBcymacFKo4bN1F
         RnwPQ8vfyFL9rDX5KSDJyqhtMlyJs6pxUsnpfz7c83X4hGJqVcA1ey7CYXwg68FSXg31
         OHlXCl8NPkUNBZZSeiNwCCZiVJ0yizLqTwLUvs0MGh2++ZHDec71TcNIXc3oOtbjjFvF
         rr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763080723; x=1763685523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=;
        b=UNGoFJLiKa07LYWtg0xRZYD72mNBvCYwA1x3/pvMO9nxLiN4zcd/Wvw2KF0d0+8NVS
         FF2uK0Zyrfx+Wj7WbvWYlgb0yt33dFpKuyPHDSUI+SBqnVgxaZ49e/X9wITt/XL/X/2n
         juacVSxbjRf/ZdMt80Y1iX3arWytLdb4JnLsSBaSmD4oSKl3QqZEs1tl4ug8+PTbLXM6
         TI9x1zMEmO9JcmkXtscjnZlJvMIO4WJpvPWLRJGaCrNoQ1UcoAqarRmELDHLhpMz9ZsT
         psizjxrmArElt2j/6To6XCtmL8Mx1c5a9+F1kfYb7yGugUN6FOHljD5iiwt/OZB+Z7EE
         4p8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbH/jxfkqJ/DGYXu9mulq0oaAfJJdoJl5p76RymUmWKWnaMy+M9DB2K3iQk9iyEUoBxBHnJTc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNJ/Gz7753qCgnPkg76xkbHhQriSMI2Erw8S7A5YwXuYcvvMnB
	XK6Zt16+RtE8FPOWsq4lwpSrmkCZjS75CtC1v2hl0o1uyN+T6CACHHCx
X-Gm-Gg: ASbGncst5VuUcxUCVz8oKYavjvURa6Je+VDk+vsDsSd3f96YsO+psfRsZeVZ/1QZ4n1
	O+OHlt7YwtBFXiMHCDBuI1bWNkQNjK9/gBhW3Q/Wu+0WngWPP4K0TEkNkWOe3h6ORgGAQCdf+RE
	1EIpJqOKrITyqQYK/4GuTGWmS9GHTvshzCdvmm6n/JCXeqyZkjkVcbGLd7oG8gTfOOK1IQQbWj2
	J4sZ2pFiVsHG8HCJd1V5bUZZlrQLwWEgepESk6WcAl/5gkL3zCgu9AL6b4Wd5e6g4spPtmFy0ev
	2J3KaiZTa/NlT7eNEVs1/OTj2JFUL5E3U9ObFp3YD/aP0aAaitNPvrvVBQCyRjOgW1L3UqGN/T8
	Ug/j+LfeJIh3N44Q2cenWJTuJZT8lD66QBXQrbLljWUIj+lc4DYNxEobeGTnuuxKlvf1RifCshE
	E=
X-Google-Smtp-Source: AGHT+IHI/lUdW0Aaq91gtsiZA71Q/CcEnh/FJg4f8D3Tkw7Zsxdk4iz040Cwd2DXuBeB7xK+wipiHw==
X-Received: by 2002:a05:693c:8019:b0:2a4:61d1:f433 with SMTP id 5a478bee46e88-2a4abaa29cbmr464993eec.16.1763080722822;
        Thu, 13 Nov 2025 16:38:42 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49da0662dsm4527148eec.2.2025.11.13.16.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 16:38:42 -0800 (PST)
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
	Longbin Li <looong.bin@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v8 3/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri, 14 Nov 2025 08:38:05 +0800
Message-ID: <20251114003805.494387-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114003805.494387-1-inochiama@gmail.com>
References: <20251114003805.494387-1-inochiama@gmail.com>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index 3b7947a7a7ba..fcdda2401968 100644
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
 
+static const struct sophgo_dwmac_data sg2042_dwmac_data = {
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
2.51.2

