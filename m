Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AE7325730
	for <sophgo@lists.linux.dev>; Fri,  7 Nov 2025 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762514271; cv=none; b=EL283LKy2UAP2tiyZwf5Y4bCCA0smKZEoLRiF7GbHmNAfHpRQuEL2ido/h+WwfaYsrFNylBeFF3bYiJg/UlKNjtjBuhAOwQHU7W6Ie0noMnpnlE6OB5c/MfitKVpJyZPB1P16wYPJB4ETUYHCsYupLDEnmIckgNN9Y7C1LJn5Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762514271; c=relaxed/simple;
	bh=rxp/NrNnXrKf8e0GBNNTRnLO6fRnsXQEhl3HcuPYlQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qYRBIX8PXdzLGb5RfiYJw0qcTY8boHxRfLHTgNSX5JaDt102rWBEiCh7ShODk5xRx86RaC4zP3SlbkbWGA9nc1mWetbwbZ9R3RaQQiIIZxcok5xMLF2KMbsQqV7jrvzobhZzi9W4Ptp9M83ZNd90wCJ2f2MVO0v7Xi5sOKmo/mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpeB+11i; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpeB+11i"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b996c8db896so552598a12.3
        for <sophgo@lists.linux.dev>; Fri, 07 Nov 2025 03:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762514268; x=1763119068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=;
        b=OpeB+11iYiq5Vi5T7yzfJ0FpcUWAXJzNId1QlWTnW0yNdH/hQzpVLZyN14dxLZ2ilf
         udbTRljq7ANzTU6jDtX5mS9Z9o1h0BmWPy401iw8d03YvbY4zKb3E1s65mjlSAnjOIEj
         7/79wacqNb+szn7i0LmwMBlJvw4oXvXGgqgkG+f94xGvYQlbQLtjvRUK97LxKgf1eqUN
         4vN2AK1ZwWxnuQvaFO+ow35aVoRDiD+hP4o4gJaltKIATCF6F07kHZMVIgzzlQU1g0u/
         TQ8xteXRujk5rlkupUCVHMgPxWCUtlQsGE+zMZEwMMsZpf2DUSLS8ofAsl7zi60xAi34
         vK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762514268; x=1763119068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=;
        b=A+DYjf0SINGXad8BT8lJyARSgktrn9aGng+24Sj5IoLGjngz8BkxjZpSBRofo3yWwq
         qdADMIkT7GyH6basPM4ajMm1Eow8PXMXRHw8TzL77bJWhLksfxakFiwT40R8GIentxc1
         25S/c0Q+7RP17ZZgpT/SCVN8xYA2T3PBfp673oWtbbXFnwE921H5JvMAUewPb+QbWpnE
         xgMDbakbZEtijfFEpz8ppbkeqzQq5CrjC1cl6HowfMWiKiGwbFhUN/o/O/aBmgko9Gyh
         QxxUMNHCekuFkpctMzTEb3fYL8TuldKmR5p78aZYd2do3AgSEK1ez/VNQQIYE7UjVK0l
         Tb/w==
X-Forwarded-Encrypted: i=1; AJvYcCX/opcYF9C6c7mzQX3oWD/YSZjimh8GXTeLqy0HdaPuFjw07InjQs00bh3MAmJlpGFCEvV7k2M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxtMpQz0pA+suMiFDIPOdXhncbw34siiULpQv2Us5YGcIHWgWt
	S+xaH+cIi4uo32Z25F2GNuVWR/rP+NlbdKQR6+/MLoKJZ8b7J/AXgpcd
X-Gm-Gg: ASbGnctsF3Ng3etkTv1iOOoVqYf5PsyUattopdGTVyG3icYDZvgztqlZ8jm37JlnLy+
	zCgh4P60ybgzrGRt0a3Z/lqd72EqqdULDEIEmsAlu25jCtB1GZtLShPHGlFJYnPzDbevPSGKB1a
	aZz7Ps8UXLSIVwHme5bZSXdHWrmHxiV87OPFh8VqpA5KAS/6DD0cCJJ+p94vvvTfPe0W/MzPkX0
	WCttCJE8GJIe5n84lAFxhXHeEcavzXkjdP/vEB6KQE0d/c7vOwzUvv5GlKovFZB0Y4fQl4eY3ok
	GaTpol/XGs7EBgoDHmqPJPkpsc+1w+I+c+6OoMqitmqMcfq2cxqDMQXEZuLKrQVaKmWuie/PePW
	UqyaptugOypaKBcwSTq4RSw/6gh9xkdVJobibnjUHQyFE+9nV4KOihPs+9684Gb7ZXQydTBrIuO
	U=
X-Google-Smtp-Source: AGHT+IH5sLTuwaNwygjS88Dd4DuKT5eyLF2e0aAe27R6LJvuFCPtCu+tqMNQVj8foqUaUxe+5POBzg==
X-Received: by 2002:a17:902:f544:b0:295:9e4e:4092 with SMTP id d9443c01a7336-297c0485f18mr38236515ad.56.1762514267918;
        Fri, 07 Nov 2025 03:17:47 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096825esm58574245ad.3.2025.11.07.03.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 03:17:47 -0800 (PST)
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
Subject: [PATCH v7 3/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri,  7 Nov 2025 19:17:15 +0800
Message-ID: <20251107111715.3196746-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107111715.3196746-1-inochiama@gmail.com>
References: <20251107111715.3196746-1-inochiama@gmail.com>
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

