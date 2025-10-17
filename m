Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9523A1F4C90
	for <sophgo@lists.linux.dev>; Fri, 17 Oct 2025 01:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760663934; cv=none; b=JT9w7btM2u6jzuiBSSc/UsSTfJMX26g3Y97S6qVntcS37Da5CAh1NMQ0cnhhn7Y4wVQysX7xnviXjLWC9pK9mKi22dYODRg5ALONWymu8j2e2xQgR/GJRG1AEg1SywRQG7I2D5Nf4TIJk/RDRCqPtBKYJB4w5QMKjBwoDpcM6FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760663934; c=relaxed/simple;
	bh=MItE3VZ9nrWY6YAL83Q4LvoAoVU5qLe8wux5tVVpriA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kV1Mjxib3zZnQqT3QvIVdJcu5NeZwrFxZZTKJxxu95z5HX1PXOZ5VqYgLOmTqTjP3Ge3JgzOfeh7ChXrqzmnogifg6ERP2+H9kL+ccd3EQG5wQBe0y+rwjy0H/PIGZTfZHS9a3dkR/IBMSiqjwKHd/StvdOnl0r1yUELz+/6RMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O586JIXt; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O586JIXt"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-28a5b8b12a1so14216075ad.0
        for <sophgo@lists.linux.dev>; Thu, 16 Oct 2025 18:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760663932; x=1761268732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2WufNMZZ/3kF+kxCtpxLWUmoQMaWHtLSOKhsUHckblc=;
        b=O586JIXtSUa9bNmlhVRXvnPBiOe2GiOs3EWZTz3BapkQcKFG0Yq1zdLFwFqaYujUv/
         tm9gcg5hW+WjiJl3rXj6hdxiQFKxmWVJzIkudxb9q6j4vk79nvI0RH56JrqQqponpBhK
         6A+gOoFKCdvZwItUYp+cKwshdW5EPQSA3OhsSdHpQR+CgALgK5Xdj2a02498S79/QHCq
         0ypXQ6I6A62QB3pttE5+klhCpJfjGG6zKIweULlO+mjih1DT737wjVLGp1SevlsiGyup
         M0xXRGpoBLncr+nzYnj9HDV2Di1nx0BTppPjMNo5gSWeZRI6RCWHupk8gHQKTes+bbKn
         cTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760663932; x=1761268732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WufNMZZ/3kF+kxCtpxLWUmoQMaWHtLSOKhsUHckblc=;
        b=KTkZfqYt7GHmLUdmzeNVItJqpdMCmU6Vx+up1eGA7fSC90+Mlbroo06OrSAG7f33ZW
         mQAAstRkwYHZF/06ZLafVQJ2Iw8/v1ucEBt8QJv4kQHTqom8eBFpyzhzi7ZyxJBLkFbN
         374KhqjxhT4Qt+KLEqkdcp1UL4IQSmX77T3oFDoOCHELnK2kuQRrXVAdVhK+6wbVL0LR
         yxHEcLNbgxtaXJeBuKjsIOs5h1Ztx6jpmpXH9lCiRQbPah3GcP+dYrkM8AO/YkmYVkZ+
         cfEyuYMnZD3uek4Ot2XhN/0UCjDIYgGqQ2SpStfSYLwO00Yn7Xkq7UcfBf15bJaMrio1
         v7XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkUQigf/XTEdMs5X5dkYLiMDXdn3UhC14lgLgFrUmZPdFKjgz7jO2E0LtmkR3J6g8zhPn41lo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyoQYjajUoIabK1KHrbFa60QJhU7vCtZzBaoIxt4pk7+NUoIWO
	eYIB51Jkb9fYIMfCzCoGcOkTTG25/15FLe20vhLrvCq1aSLyRVBqV+fB
X-Gm-Gg: ASbGncsVDS7GRSlJvQTJlTkhHaBnU4azlMUewynjQwcFzBIAUE/dsqtDUOQskGjwZUk
	RGClCsfvrYboeN4lvmgG6NkbJcqaVmHHvG7Vn0pdjzZQb/yA26/SpmVC+fadk4cHvFKVvNt8PLT
	5ZUr84J+zb0BQss0ZQpA+HjSsFChJOw0dHqofygpg2tVR95o8Ngjq5zE3bkDgO1KFYrZhGfAH+H
	7E6MwzIrAHQPv0O5XnDKdmju5l6SR8izAnw+pAuunu8YcxP/z7FMO1zYm7kIZOyaqNl48wnYmzg
	UNWDFJqG8UsCMjK+5Suvsfq4COxFOyEf6aHFvtfVkASk8GOoU/Yzqf31bH+mJCVuGyNFRU13DGd
	5Hcl+/2NnA2cX4Pwb5K6/QhF3fGZQM6e+7pmd/IIeZjZ+Z0AbUNnkWB1pmPMZVVljApdGxGEmnZ
	M=
X-Google-Smtp-Source: AGHT+IGCscuN23O1/GUCRY7mt5g8A0uy7Km3DMtv6zREsA54udw0SWdK9cRyXK5d1lQXl3K9mp81rA==
X-Received: by 2002:a17:902:ce0f:b0:269:8d1b:40c3 with SMTP id d9443c01a7336-290c9cf344bmr22801155ad.12.1760663931864;
        Thu, 16 Oct 2025 18:18:51 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7b032sm44355765ad.63.2025.10.16.18.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 18:18:51 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Cc: netdev@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri, 17 Oct 2025 09:18:01 +0800
Message-ID: <20251017011802.523140-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the SG2042 has an internal rx delay, the delay should be remove
when init the mac, otherwise the phy will be misconfigurated.

Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index 3b7947a7a7ba..b2dee1399eb0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -7,6 +7,7 @@

 #include <linux/clk.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>

@@ -29,8 +30,23 @@ static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
 	return 0;
 }

+static int sophgo_sg2042_set_mode(struct plat_stmmacenet_data *plat_dat)
+{
+	switch (plat_dat->phy_interface) {
+	case PHY_INTERFACE_MODE_RGMII_ID:
+		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_TXID;
+		return 0;
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 static int sophgo_dwmac_probe(struct platform_device *pdev)
 {
+	int (*plat_set_mode)(struct plat_stmmacenet_data *plat_dat);
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -50,11 +66,18 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;

+	plat_set_mode = device_get_match_data(&pdev->dev);
+	if (plat_set_mode) {
+		ret = plat_set_mode(plat_dat);
+		if (ret)
+			return ret;
+	}
+
 	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
 }

 static const struct of_device_id sophgo_dwmac_match[] = {
-	{ .compatible = "sophgo,sg2042-dwmac" },
+	{ .compatible = "sophgo,sg2042-dwmac", .data = sophgo_sg2042_set_mode },
 	{ .compatible = "sophgo,sg2044-dwmac" },
 	{ /* sentinel */ }
 };
--
2.51.0

