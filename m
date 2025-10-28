Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABA320F08C
	for <sophgo@lists.linux.dev>; Tue, 28 Oct 2025 00:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761611956; cv=none; b=Ad9jRECel4WxvZTweD2aHIdO7dC3UFP/W8+xvYdh9j1pfdQ0V6hgka9Vpa/LmpqGSdnM+S0Ge0aJE5vtak8pW6DIDGnfZJ2CmkZqP6PQVpNCGRjLOuAl8Zwmd8otWFtJgzdfuZBDonCwlBLKglxMbYKb7/o0WsC3efZiYegR5aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761611956; c=relaxed/simple;
	bh=WFJsAwSAfBll4rXsUKTECSFABgQcDyDelT5akN/S2SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpzjTZ7HsjfW7qwM23JB4meP9EI1F1HbbY6BYmAlaF6bvanWEIkJjyDzbfKcb5KpPl4YbiMourEXU/IvkatIFJn9VxBmzfSl9Scyoj+5MqAIa4S/MXvaCjNcyW6lWT9oSbBK3zZpXsx/Xsozi2LZncuuajnYeshABCPDaDYXiGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UB2zRKgW; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UB2zRKgW"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3402942e79cso532681a91.2
        for <sophgo@lists.linux.dev>; Mon, 27 Oct 2025 17:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761611954; x=1762216754; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WcWCGcgNvS5Hv44YHDTwLTthjpcd05Gmj8wnblh/dE=;
        b=UB2zRKgWrzWDE/HQFxTuh/F/xySgAA7Zgd1jZqOJXLdCMbz8oD9MYAE7MKZUsjoqi3
         Px2Ur0mSjMZ4qalGmDps2DGRJ75IZUs2CLiZRnoptzmsVjjbQHAXFxVaEJMcCaRqFB6M
         Nt2uPUqO51wv90nA/3fFrOi+eCgwNva4LfOHGqmPmYBixFQ2VHweODjpSOvI1S0yN8cs
         ZrBBjMgfBST11gpBG9QmkCIiyTGeNBM5+I4MSuFS0Wo3vBil6R2wmEyFWkfU6tVUkqd/
         9uivWE5JuJguDS+Y6peJD2+y1dAtyGt9ZQdmMemJHOcP/1KpCZF5KV1m9yeg6mbkh5aU
         UdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761611954; x=1762216754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WcWCGcgNvS5Hv44YHDTwLTthjpcd05Gmj8wnblh/dE=;
        b=oMHIeYahVG7uqUsO2950G7o6bY6HZJd81qtBBwdUKJay8oRoUWxKz9gtVpqyqdKPC9
         3hsMnvUN9fwU+/57PvpQ9j3XJdN/EyQQ2uST7bxvWK3DWyXsGgbOAusPlJrzlccM2HiL
         nm089TG7qIp3Eswr8O1rSkMkkehnDwMzaO2X5dZmtHK21NI2RMD6Od+ECXowJVS/Srxc
         rovgwHL5VUPx7XIxCmJ3QWaFSoIgp8zLvnuu76XVn5KcCtG+CD2TVUxv4ScwhUYpDL1v
         eUgyGLmhME28yd5Eu04vQzM6CGqvhsx3JzGCOKtc7rVKhFvHYIqXg/HKe50Qu3Afzalk
         joGg==
X-Forwarded-Encrypted: i=1; AJvYcCXkXWjtbB4MsdBhnyoV8WSWQVoTyNwrzJ6COARc0pDUbVHq8zjXYd+bTmNmcT5ETdUyk4zQkO4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEVO4K/zR8MNY6KK6DSf7RG4W6jz5btGR/JazBA15v3Y4I87FO
	jZmPwkrnhCGJ2E8vlNFvODjWtGcuOau5tQOaeyukTKa3HSFWE/LG7tX+
X-Gm-Gg: ASbGncsUbfcYzlrUg8rPJV5BzY+6USKqXDpc96I+Ni6eP66QtDvHE+gRMisKlwJ5giK
	ZB19CkI6L/+88CqDjX1u9CrCzYpymUQHpyMyrV0jNJ7YbgSwkJzZuAdoKc5MCqmQ8LTp0DVqYsn
	jv6K4iaGwcFe/kbbJ7Ry9sFWKf3VtKh8p4/ky8GFpriSbXIiZZD7pPiJzDthRWyFI3G3Tb3v8xb
	fxuzeuyVtL+fkB3JsW8JD9uLgY+tlYjbtFNa/01Hkocg188Y+vQYpTR1g1DdmNhfif0Dddvf5pN
	eMXiYJCSYaUGaW0O6/si4ZXVgEP2MjWctRT2tVlsGZ/jhUMKopjFF3FKmN6834MW3Y6XLhB9R9E
	AXJeKV344DIC+RRz1JEKOCH8BHEJpuDsfWeQSc4qMV+xjh9zPCwykEyuoLBbqpxMuUtvlYY7EsR
	2uEAA0ZCgNig==
X-Google-Smtp-Source: AGHT+IGlGdHwoHvvWJbSfq7fs7gWWYLvmYXWrIA0qO3xj1Qshht6xEIpI7sww7p68LXdI3n1iXEunw==
X-Received: by 2002:a17:90b:3882:b0:32e:e18a:368c with SMTP id 98e67ed59e1d1-340279e3fa7mr2149486a91.7.1761611953610;
        Mon, 27 Oct 2025 17:39:13 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414034661sm9665148b3a.26.2025.10.27.17.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 17:39:13 -0700 (PDT)
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
Subject: [PATCH v4 2/3] net: phy: Add helper for fixing RGMII PHY mode based on internal mac delay
Date: Tue, 28 Oct 2025 08:38:57 +0800
Message-ID: <20251028003858.267040-3-inochiama@gmail.com>
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

The "phy-mode" property of devicetree indicates whether the PCB has
delay now, which means the mac needs to modify the PHY mode based
on whether there is an internal delay in the mac.

This modification is similar for many ethernet drivers. To simplify
code, define the helper phy_fix_phy_mode_for_mac_delays(speed, mac_txid,
mac_rxid) to fix PHY mode based on whether mac adds internal delay.

Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/phy/phy-core.c | 43 ++++++++++++++++++++++++++++++++++++++
 include/linux/phy.h        |  3 +++
 2 files changed, 46 insertions(+)

diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index 605ca20ae192..4f258fb409da 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -101,6 +101,49 @@ const char *phy_rate_matching_to_str(int rate_matching)
 }
 EXPORT_SYMBOL_GPL(phy_rate_matching_to_str);
 
+/**
+ * phy_fix_phy_mode_for_mac_delays - Convenience function for fixing PHY
+ * mode based on whether mac adds internal delay
+ *
+ * @interface: The current interface mode of the port
+ * @mac_txid: True if the mac adds internal tx delay
+ * @mac_rxid: True if the mac adds internal rx delay
+ *
+ * Return fixed PHY mode, or PHY_INTERFACE_MODE_NA if the interface can
+ * not apply the internal delay
+ */
+phy_interface_t phy_fix_phy_mode_for_mac_delays(phy_interface_t interface,
+						bool mac_txid, bool mac_rxid)
+{
+	if (!phy_interface_mode_is_rgmii(interface))
+		return interface;
+
+	if (mac_txid && mac_rxid) {
+		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
+			return PHY_INTERFACE_MODE_RGMII;
+		return PHY_INTERFACE_MODE_NA;
+	}
+
+	if (mac_txid) {
+		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
+			return PHY_INTERFACE_MODE_RGMII_RXID;
+		if (interface == PHY_INTERFACE_MODE_RGMII_TXID)
+			return PHY_INTERFACE_MODE_RGMII;
+		return PHY_INTERFACE_MODE_NA;
+	}
+
+	if (mac_rxid) {
+		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
+			return PHY_INTERFACE_MODE_RGMII_TXID;
+		if (interface == PHY_INTERFACE_MODE_RGMII_RXID)
+			return PHY_INTERFACE_MODE_RGMII;
+		return PHY_INTERFACE_MODE_NA;
+	}
+
+	return interface;
+}
+EXPORT_SYMBOL_GPL(phy_fix_phy_mode_for_mac_delays);
+
 /**
  * phy_interface_num_ports - Return the number of links that can be carried by
  *			     a given MAC-PHY physical link. Returns 0 if this is
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3c7634482356..0bc00a4cceb2 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1813,6 +1813,9 @@ static inline bool phy_is_pseudo_fixed_link(struct phy_device *phydev)
 	return phydev->is_pseudo_fixed_link;
 }
 
+phy_interface_t phy_fix_phy_mode_for_mac_delays(phy_interface_t interface,
+						bool mac_txid, bool mac_rxid);
+
 int phy_save_page(struct phy_device *phydev);
 int phy_select_page(struct phy_device *phydev, int page);
 int phy_restore_page(struct phy_device *phydev, int oldpage, int ret);
-- 
2.51.1

