Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBE728D8DB
	for <sophgo@lists.linux.dev>; Mon,  3 Nov 2025 03:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762139154; cv=none; b=hMMOvKKVBUqw9SMoSgVCfz4qdfMJjjiNR8I4PXRGkui3xIhuzk0LKE5xuaNPxLiZjaN4a9bKPxmYsH25x6QfpWX67uyrpQUqm9ytgAfwTV4sU5zw/M3I+2r9CEOL3LkmxGsaCBJPuFqGAIpsQ0g1xTirG93/ez0n9unP+q2mXHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762139154; c=relaxed/simple;
	bh=rxp/NrNnXrKf8e0GBNNTRnLO6fRnsXQEhl3HcuPYlQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rj3ylmAvItUJmA62GTqd2i7p9G04CQ68pPpIJIJauLu0GwJH/PIVPDjXmDoUK1PgxpG7/0fNtj/JMfAAggli/AmMFPxrCIn+1bfjxlBdE0GQ3KB0/N8QjBnf6qwS+vT/zYWw1DHctfAFomTlDvq+Lg5iQMkD7n5p8r34DA68bEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cp2ca0+K; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cp2ca0+K"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77f67ba775aso4901548b3a.3
        for <sophgo@lists.linux.dev>; Sun, 02 Nov 2025 19:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762139153; x=1762743953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=;
        b=Cp2ca0+K7J74vBjM/hwagpk4if+RVGgPGyIyw7a9pp/5eu75jUYNV+xBikQNZRRszj
         41nntnvNABCLXuLwQOfKg8uUW6TCMxYqi4ukzkiDJyb306kiJe9yaF19yMITGBC6cvUm
         oN1FH5jdVxcXRGVPvweZG7VmyPw0eCZM5ehTCm97d6+QHklhwrsOsc4/MghTQDTD5RIe
         Ca1IpgwMSkro5wVEQNsxzZiHY53l++opbsWMYLTNHfKmQQcpfuJpMQ3YYX2mNBDh8poq
         4k+6aCvctL0Fur3rjWJfQcCHR+PfUUowbuSu2Vr5m+aO92DMIm7DIVMWuuWXriCWkJAI
         IcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762139153; x=1762743953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=;
        b=HtwAChOq8zMcGp9Cyv2QrOloloFVpXExNvrIbp4tBvilKj8KHne3m5tFacgpNP/pLJ
         BbePTFP/bjMe/iM5ExABbC5EoroGUlKhgJkZHF5waXfH86B5CT2lC5zZOxfaJVs4EcVt
         RR+QWoKo961ZI2jmanZa2DEKkCMOG2Zw2iscaAvxiUdgWid0tOAW4X597+P85griWfoW
         TVtUrT+tl3OeAw6BRFtNoXncYduBtwqvGyUHUGqBs68yn9yO68+4WbOw57epHvH8lKx7
         ynE04YZvXzqmGaayLQTfiaWwzdblMcHfav6T9YWQXEb8KERs12+I6OEJojcASTFTP4QW
         dr5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVIz6o46HUCn/KfLeHfnqWM7hjbI36ks5W0wVHu9NH47i8sVrKvBnjLSzhDZJsr3gfvjuN1+w=@lists.linux.dev
X-Gm-Message-State: AOJu0YyA+Xf8ERumtngiXj+MnnJrPQMWBUS3r926n7MXOj3/gMT7YtcD
	/yBzqVkleioDncrOKE2Id6LLiHDsGHVN/f18bQ11wg9IlNp2quE61xAj
X-Gm-Gg: ASbGncvI1shltoFJcKmVyO197E2WAw/wh/A7Gx7LaCewAybY/nRKxcp8YfaTOAMll/S
	+Myp73LktLHJwfSyrcG9jBhm5XsCsbLqHLCyJ3ME+LVWteRjKoX2twPKf4Pke7JddoAt4X7vdT7
	7it8v91qydIaRynbAR9IpCgRXBo1x7ZUYeOBV0IdhGLXQJyYQ+/pDuNO91LjvuSpUT4qUQCx8QP
	QjNKVjq48oNmTxe+m+18jUxDY15zDm+NIZsVk+6h3/Ax+WaZ8OYxWi3GrKkD8vA+eT/0UR0HOrl
	XiMMp16aXFttPOcvZ1AZBaMC5AXhR2ROgFw93CG+FoQ/57tw9O8iWZY/jYQGPPqZ5UWTv/h1+W1
	xfqZjXr6Z2h6E3dsfWlqHvtIcw8GVL4PvwXO+mwp/VupKtCeFQs7v4WBperCwxQ+/Tnkol01DzS
	k=
X-Google-Smtp-Source: AGHT+IHPm4B46oBMKEiDtF1pRQ9fXhJATCw1b8SJYuGAuFOpbmfcoaiK6106eJ2qyIrf/kfq6Jj0wQ==
X-Received: by 2002:a05:6a00:2196:b0:7ab:4fce:fa34 with SMTP id d2e1a72fcca58-7ab4fcf3eccmr1842539b3a.1.1762139152609;
        Sun, 02 Nov 2025 19:05:52 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d897c632sm9343229b3a.10.2025.11.02.19.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 19:05:52 -0800 (PST)
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
Subject: [PATCH v6 3/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Mon,  3 Nov 2025 11:05:26 +0800
Message-ID: <20251103030526.1092365-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251103030526.1092365-1-inochiama@gmail.com>
References: <20251103030526.1092365-1-inochiama@gmail.com>
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

