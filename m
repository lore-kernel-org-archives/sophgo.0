Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44C1221FD4
	for <sophgo@lists.linux.dev>; Tue, 28 Oct 2025 00:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761611960; cv=none; b=e4640OpZqLEu91uUpCE7mYf6UZd1SGwz97uj8OswWQ59zKpPTuO7cgyq4me6SOlwcrunVX0kaPD3nRhmOWTK0dIrb6jZi1f9UD6+EBN4M2cNbr05Of4Y9izcT5EUZhbxCbEH1G1DzZeNd1a0WZvY1N4JofW/mDvQG+izlCYS1ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761611960; c=relaxed/simple;
	bh=P2La+FoJZ35MJzEo8yVcVLSFzhQhJljTmUai3XD3wr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kYtIAiK+lhq+k308RIZ8SFzULwlJZBA9s0k0DuwTyMKSJW+NlUp61SIsIDimHOmgUTTT8Z+0HDvR3OCcoT5TV6vcDpbfO2KDTWpEdX8dOsLYbeZ0AvswILNktbi87kIL5PseJSxVgVLUu1F9B0S3nvRyBt0SqrW7NMM/mL3a1zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCe2kXSd; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCe2kXSd"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-292322d10feso44624295ad.0
        for <sophgo@lists.linux.dev>; Mon, 27 Oct 2025 17:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761611958; x=1762216758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6e+TNG8HQKWjELTx3r9i/rdMStiwaJjw+wxw++IoG08=;
        b=gCe2kXSd290CQ1fO/+BxWOi9nBL4q/N1AGweVZ67fpYragmbkE2EX40PogLsPYMAX1
         +r+AzB+lkP5KiY1moXqqWx2COjJjR3A+qi/oXnweY8PLQzEwgny9CMEPTk3pZgpIdfl/
         zeH1U7uYOIgDRPy0xHad20x6VWyHjVcntiIoAsYJjjZrt6WfePYDLRs9u7qTY1KhW2ed
         ToF+NZwwssP7wkSH+whX02+APilIbGui89FB74mUwwXXn33NqmT+z7Ysupr84/QE+3Ba
         8mJBumI3Yf4dwz/ORN0gGNQTv1ViVoDcGt1dWjsBTnp4IpMU0wN2ls3w4AhZH4uvKJIJ
         V/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761611958; x=1762216758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6e+TNG8HQKWjELTx3r9i/rdMStiwaJjw+wxw++IoG08=;
        b=BpJ0kqySDVQQGzmfngdZtFseaE8EYX7hXqqekdZBVBiJ817lf2gNl3hfgKe9IzoUXu
         66G0v+0YZq08Zaivz7SGqZXQ0v2Fvvo62piKH2nYFfQzrdQFVkAbUkUsXN6bBCy5KBhk
         EQRQ0x0wjGIe3rFu6VHKLnk0XsNXMOL5k2RZ5prH/RDM0YQOOw6AlL21gq7lVxv3UdDU
         NonvB6giJKKTHci+bNU74+wYq3rJnXVfnrMO55l0mgptNPnU0nF69QpeYtXPIia696v8
         BraFOJZTFsR+oo0nWoqRrV7w7khY1s+YhFtxPzo59cVBiPA5z+ggdhLa+iyX5mer968d
         PJ8w==
X-Forwarded-Encrypted: i=1; AJvYcCVGCOB1v3kWCBA7XhxqrY5vV7XFQ4iEt6BLhA0AXkUUTpyK33V/Qe19GPMXohKoJGTmiEaXBRY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9k9DpST4B0DFi9/NHwPEMuKu9fxGGpc4y1mVzxBlkc4uMFd6G
	lNm3Thyd9d0QNR2aMn31vY0L6XHNHbJzwSiuT266NYZbr8FId8S/MLz5
X-Gm-Gg: ASbGncvMmGB5n8N3dOy3qSBrbwqFF2Ml5BzOV2ViKMJl9pXWI6WnhIE+HvnS6y7pIKE
	JW7dxMyHcbVbkHLiqvlGP1og8cgppuZxLi9aMY8dgQNQ0TCTrGBtDNc4R5U4D508sDES75nbDI5
	fRyBJRzKs9ATziwox/pLGgaeDz2fpIa5HXxdXqR12J6fZcxWpCuoi9zAcnhlWpO8QBauI1dJTT1
	o6Jm0sPyrxH8obrTnZMo8vKGhRxHk1Lk0hOHY/kXCvBOpdOrHtruVbG8/aaAOnPIO3ahtOfoR9j
	024hKJPFLuy6IgYBoiTu5u52wfDaLHZrj9wNMtXIyMwvQ9uiYZIpXF+LhDLRAmxyr8zeD27NbyL
	oKpSCxwtNP06YgeFPqirE4Nl2drsMokDMaXXxCmBua9kEaehP+53eiMfIEbyQZq6yHHWDOysfhk
	ilq9XIiwGiGA==
X-Google-Smtp-Source: AGHT+IGvU4zqUoctToOTJAwyDs9+4diulCuRP+v5NnW7F2ld07v4djcWl4rSSI6JXslPZV+bpZFdZA==
X-Received: by 2002:a17:902:ea0a:b0:271:fa2d:534c with SMTP id d9443c01a7336-294cc74e4dfmr14030645ad.22.1761611956679;
        Mon, 27 Oct 2025 17:39:16 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3bbcsm94917065ad.15.2025.10.27.17.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 17:39:16 -0700 (PDT)
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
Subject: [PATCH v4 3/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Tue, 28 Oct 2025 08:38:58 +0800
Message-ID: <20251028003858.267040-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251028003858.267040-1-inochiama@gmail.com>
References: <20251028003858.267040-1-inochiama@gmail.com>
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

