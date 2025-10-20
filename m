Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53D42F6579
	for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954178; cv=none; b=tAW3G10ZlRTtETL8k8P927Y66YuHqi7cHScAIBbs9BjoOeaKha90XvPmRhlnNjmm1AVoQzswgCPni2UzhZ2YdteAMdT+s3cd3wOa7P6Ooa+4nfTw1RlLiezLjbpH1QaOP5L9yQnWhiB3gwgZ49bMcgWc8MjC8fIO0u5I0OcEkO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954178; c=relaxed/simple;
	bh=+B7PvhGg1S0PvwspMXETMgLYp/UFFAeeaKBgvPZ6eIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/TESXbpLIRIC6Q1x+2hRjIhQKCyrRdJDIVQ3OuXhGuHZbkLGb3IEYvzm76J+FYMXB1+TAE1+pkn9I81CTGrSELKyRBOpTVBfXCCxIKjYLNLRgtgxHfAcyvryM6C05ji/xkz7xG24/iu0i41s5W593LLFnCYw37u0RtLFMnMDbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRY8vMVV; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRY8vMVV"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b556284db11so3598403a12.0
        for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 02:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760954176; x=1761558976; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZEu6atp1wquusXB2V3FIm0pgDgjjEvvFZHTGTlW15k=;
        b=GRY8vMVVjVjiyafreaipPGhBK4OrMFvAv4A8m37EiQm48VAkHLwisDxg3nyIhQ5TNi
         giIybT7l/HAoafogxC2HJk5rxQR3NPa+vlFAE7u83iXXB4n4zET9xdYoEtF8/NdKi0jL
         I67sI1me0UJj6j8K3JAIlz1s8x9QAkjoIBL/eArqGUL0TbGffxgwe2fVV65IULTqr4B0
         EkSjSrqh6/B9mwJaJmBuOWoxmAcQuPU73RG9UBm5u7bHapVDsg5URTHTrPBGDTY5EXAl
         +tUv2dykV92qX8RMcVh1gTEod7gW2+WuUtcfJ6/wIxUGJZbAMAMUbna+/+gXGtpC/vyr
         N9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954176; x=1761558976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZEu6atp1wquusXB2V3FIm0pgDgjjEvvFZHTGTlW15k=;
        b=u7/Qi/bhPw+JrDRBuXRqJaFp+TsxHYP49UVB+xkF2qCvWhG/klat/UBXt7mkzVTFhE
         kHIpEf9/iGYH18coL7PjnNT5rvtVGbRjdce6BWkbPs19h0g/wg9lsMwrEz3x1Ip+ndqA
         ATzB7P6Qi8gqFkFkkzst8ePMvNK1RMU/Jf25sJhVITjD1lrBZ0Y1QFBAB6CWvOK9foT6
         jC2L4FKPjDiayJ5Q/WiN5beiWDwUPvZNDgOwFpD3fcuAoRwv9hT7KTGz4lzFfadrUBWx
         kwtf4dpS51OOb1Jb1Yji49p+FgS4/8QNlzsHjDd5YxG4CooYfDJBBDi5b2Na0MchWKbw
         3CSw==
X-Forwarded-Encrypted: i=1; AJvYcCXcRUAjpu6Nqg1dojVa7qO55Zru8CmZzQiV6MWcnQ+27ItrdFi2ak8b3tICphiYaWUaMgaMA44=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqCp4Tike09a+8QFGoS4PT4ILXWvTG0fHKY3bBrAi2aY0cFkjQ
	SzgBiSZhNKv4A2tamqd/3UGeXOQ3G/C6AKoHHsGuL9s0+2MJblrX5Q4e
X-Gm-Gg: ASbGncuqp6wGZGULYcgx1eRkphP/xSRAqXXATaYFqbyIfUknAcHBF9N/OD03UOKGxHR
	vCCDWqb0s+B3wsyIMv/CiWsHVwnX/PtttXD0coTVW+/HUo70M/SV3KxYrHf6ZLE8VRvdk+ZZAP0
	iH/1h5K7Txq4GWC9p7XKfpqeYQYKrfgEkmK/zHwSrtyUZTNLZXhO0/RS4cAAY3NqA4gc9dpUPJ0
	a8uJASFB0WAHjMt1/KPsT0Z5trYvRp7zLAxvkGDu79rBo7C0uC9ckp24IW3gfMh3nHuXhF2sTKh
	o8V55o1RO07qLv3XIWnLY+ETSeFMa3v4lVBBOLUM9HevMhr3lHzx91+9HYcnYJ1NrmaNCBDUr3g
	EG1GVq1OD4lXUgRk8D9w99ihhVqpYHv63MelbMrLWw8KujyMFWWjpE+jzaikCV0JjSKQ6CJozcM
	k=
X-Google-Smtp-Source: AGHT+IGGbVMAvLRNPJzY/dwiHRiAXKBM0roNWAjS8uuWlxmmRK+1VU9M3wcXUApOTf5kLg4NLvhkzA==
X-Received: by 2002:a17:902:eccb:b0:28e:80d7:662d with SMTP id d9443c01a7336-290cbb483demr161050105ad.58.1760954175971;
        Mon, 20 Oct 2025 02:56:15 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d5794sm74880555ad.53.2025.10.20.02.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 02:56:15 -0700 (PDT)
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
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Mon, 20 Oct 2025 17:54:59 +0800
Message-ID: <20251020095500.1330057-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020095500.1330057-1-inochiama@gmail.com>
References: <20251020095500.1330057-1-inochiama@gmail.com>
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
 .../net/ethernet/stmicro/stmmac/dwmac-sophgo.c  | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index 3b7947a7a7ba..960357d6e282 100644
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
@@ -50,11 +56,20 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;

+	data = device_get_match_data(&pdev->dev);
+	if (data && data->has_internal_rx_delay)
+		plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
+									  false, true);
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
2.51.1.dirty

