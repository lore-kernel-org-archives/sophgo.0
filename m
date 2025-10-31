Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B122690D9
	for <sophgo@lists.linux.dev>; Fri, 31 Oct 2025 01:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761873904; cv=none; b=QTmew+Yeyu4u1yYwjR/syNv4XwBlp5fMzpF2HrqDFKC8T95zkiPJ5iSduwawqJAyVd7G/G1OfdVQyhcXwF52zmHKRZ06Vjqlbfka6I4FlsN6u6K/wBBXpzqw8k2cIOMRWx/1jpXz0BgXxZpZ6PPjKCp/peCf61FmsofD0rL4Iqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761873904; c=relaxed/simple;
	bh=0Gc5dl3tKjIa0cqiPh9kEaz9Vhp5pPIGlpBYanSqi3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eMGAgrLyKGnuIZU5jVA0DxvPGDPbMIEBXdFLnQ2Y3OW4YgR4YdfNpF+fyE3lc24Jcyfjh7dkknI2PZPC4sTvSWGx9baDBlKLgpkDv6HYLS2husw1DjOtcWM/PHKBwS1rlVxDUYJnp7qnqsgXJmokA4qpqN6AmknXfacVT6mHsDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgCP5OMr; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgCP5OMr"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2951a817541so6770895ad.2
        for <sophgo@lists.linux.dev>; Thu, 30 Oct 2025 18:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761873903; x=1762478703; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41C7JOVgrQjYgPjIau43ZnUjOEp2Qu+RhNpr65HbzYc=;
        b=mgCP5OMr8CJ6coJyQH820Gn3tKXEdRnLuxfiH8jF/Cw30JjE3SkGmMKGTuti8+dfHE
         heOrEDDw2q8QtEbqg4joS7xDLBaLV1Vjvj8pkaeZ0R0IHaH49iuul3ppDM+PjvEZ4SvO
         dWENuFBBk5hqdk8+0FK/MB7maN/JcT8kuMiFe6CFluhz47knlFCylwIQ9Bmg0rizse13
         bzbG/cTxJIR4tJILHBbND4iFuHrLdm4VkDYp982WqYvxJ5YwmO9d+hjXvlF6NkxAyWRE
         FnYrK2U+ahTfOSFmoUypLRRWRFkOaYzBYX8V9gpm/N1C15CmbVExX9BAAGQ9HKPDHmzK
         Dpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761873903; x=1762478703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41C7JOVgrQjYgPjIau43ZnUjOEp2Qu+RhNpr65HbzYc=;
        b=wp2iJxijXG+YsQz/JDQZS8s+XNBcvi2u6fbMJqPWV5jS/kWjXPrCCoxEvwsZvqhB6V
         fOM04/8qXLjOZy0l8E5+K1lek9P2dxG4SSXNsPUJO+oAZlnuVh3bWJZwrq/4csyRfnyC
         aQKNnWCCVlOoOpJDeH1OsD3rMYxbTRpBJ1hKvV68L4A35oJX1hqn4liQ8Hwfia4Y26Xp
         sDtvjpwMFT04wpyxgXxj/H95jA2YsKxYrMPEcT3q4W0shbOvt/r58YlKkrzdHir771Ri
         hdboy82kSy6heQpw9BR0K9c2zl4ZVBiErwU5STdCMkpFC8kaDScb1YNFyu7s69FYFpIX
         YE2A==
X-Forwarded-Encrypted: i=1; AJvYcCUJzyNye+muMfBg73YBlkJVKCNDPYAqn8ypG9AK/1ZH92owyqrD/z4hmfNDXHuFZgTIQK3u+co=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKl4a3m5RN00YHKU4dXEI7xMzdN9nd0bhKeNzEVRl4JL+fojt3
	v3IlP+xRPjoaJhzEgbVlVqp6xrsUT1NIlojoUbNx3Iul1CN3z0+2Jurq
X-Gm-Gg: ASbGncsBxNw+Iao9yLpPKAxZOkFM2KDPX7kOSCS0PeD7fgi8v0xMlAIB4KTZgyyeSt6
	ztOKSzi4hRoMU9sDdeC/hSqVHhvx4E1GJ7PLKeb8FSWrVhQAvIsxTxb2LgweYaDtGdK579cCWh4
	doVT9n10HlQSAhS/MtwtgdVAbXQRUmpOlZx9SVr7+wDYIa9R4pkBTCQwdsZsITJdN+c9ViFFv/C
	hfic+ESN+kygHQcFMaVpBQ4TpCYViiRHDyS++auWxP2eauPpozU2gn5cNKWchTDLFHX1qK3KEWM
	8dEx75jtCBhClb9WJebL6Fwmq8YB2UiHGVr/b2XzAE3x4PsWUGOWfnbdNcVqENnZ/CeLP9UWwX1
	iZvxWvkc1KFI9BrkIN5WMjgs1GVccq+8bJuQu1ewf1rTkFWaGnVVb2TbC2/N6V6k17i85zBSO9r
	E=
X-Google-Smtp-Source: AGHT+IHwNetbUfw9P+CF7flRnUxbKMyy0u3v4NGRme8B70TIIYaaZvAcpehaNR0ztwmyhfdRon+uhQ==
X-Received: by 2002:a17:902:c94d:b0:295:164d:cebb with SMTP id d9443c01a7336-2951a539003mr21231175ad.47.1761873902502;
        Thu, 30 Oct 2025 18:25:02 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29526871836sm3248465ad.18.2025.10.30.18.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 18:25:02 -0700 (PDT)
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
Subject: [PATCH v5 3/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri, 31 Oct 2025 09:24:28 +0800
Message-ID: <20251031012428.488184-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251031012428.488184-1-inochiama@gmail.com>
References: <20251031012428.488184-1-inochiama@gmail.com>
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

