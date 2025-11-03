Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B55E28B4F0
	for <sophgo@lists.linux.dev>; Mon,  3 Nov 2025 03:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762139151; cv=none; b=L+VXFHtvXU9ZAvyk+s0kxID+HcBXmb33UCWn/VVf4RZM3le00KPAqnWS2r5w21d0hcNuNrGHqCTmGRqtbDjAxD4TnwTfrwROyfTlZJOCguyxDmaFhIS5JLmYx0lJVdcdN/8MvFkJgamdUtNt04Me39LaF7ELRLhaeHrCAe9QiJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762139151; c=relaxed/simple;
	bh=g1gjey22aj0deXr/Rxp5x8gbHU/r8O1Vjh1tF746E4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gXlPCOh8FWRomURQ3qG6vjHLAJp5wS8Nw6eJagN7G6wnHV6JOASpbO6PM0CcLEH+IGx6fdb4J8pcJodNwkOAmjs9YeVUyySSdNWsqLj80qlLz4MTGIf8iPOGfHTuAVPgzoYkboS7D/YZvGGGP31nrowX7MUZU1BwzfOQb064X84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7W1/h59; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7W1/h59"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-780fc3b181aso2701825b3a.2
        for <sophgo@lists.linux.dev>; Sun, 02 Nov 2025 19:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762139150; x=1762743950; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4QTOT55+/ql6/pjv059GwSZ6Db5fZXYVpPWy9XubXk=;
        b=j7W1/h590wrq2r9Qmc13GmI7iGgwHlfLZVPL7cCzz32EcSMIxoBB7RFGa4MwItEBHs
         gwZ3DzNPgiRZRi+7vZEatsUDWmQfBN0UdFtj90PpLdCxPJsTq3bYzOrnhGfGcSTYlM42
         y2q9Ai1Cfdyx+GzP3i+h9oA/ifTQhzViO4+ograczzEWStk/uYompasj9jLU52URolw9
         9qSVqjxoyM58dDf9GrPc0yKBujUDdrmc1cf7RyaevlR2KLfsaJq2rZCL8QD3n/HH1Lud
         Cr0U46LoQU0G7JzeQx3L8gbvwNeQOrb97uTrkYuY6MvDqE5jhLqCqLTSvnm5MubC4G8r
         cWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762139150; x=1762743950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4QTOT55+/ql6/pjv059GwSZ6Db5fZXYVpPWy9XubXk=;
        b=D+NR1Hk4qKDJhDTSdjki6IDVbJnM///p42kmrMblTSxyP4UuoCB1a45eDARjIZeFqu
         OGpA3rOFgQjvdpFB4p51qEAKDtLqsT5Z5MSzGqKQd+8W87pLE4KAiHwEkTUAJsWgZAvw
         pjjN1bT0tkSdrjBnPy1FNWXmThxR3KpaElrqFcV+d0fg91XXdfZu0/pBXh8fBufzl4JO
         rPW64Ubm41GvANXCT82eDdVNnjGoy/XV5Bn+QDm7Dmtj9gS/+7JcRODPOj3RqPOV4cnd
         7BCgDCWs1RWadjST5wkatH7SPaj52Lyf8vORTBd+dEviGX9b87s+cb1uEedD0L8mqTiS
         cfow==
X-Forwarded-Encrypted: i=1; AJvYcCWbLYaTiYI3891vSTaUX8vlJ4CZEGkooL+Nwuam6JBcJwkXLyKoQhCeghtoJnGTHPORgoFXeLA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbmUJmKy+ONIxZhvL8qjD+xlTy13J79ItH2wOQGgCSZl47+dFE
	1LliYWEYgEkszxHUtagZ67gDYthE0/BHyVtGEdXqQkl6S+t9MP047YQH
X-Gm-Gg: ASbGnct0VU2fpRwxTDzWwxj4VxpIklsWFhMi6F9zE0YgYkSDcx4LscdvPYQncXD7rn1
	SOJ1zmGVABnk66Mm7mliQzW2AkVUmUcpr87a6+9sQ3PJLJVv5LJr6T2Jrd/Ez58hZq6xodFzYdi
	sxMB8bXpGlOjS+xKUFnx3n20HY9wgWFXWHFI2QEyAYitGANHnX4dolc+OIWXDmtJsyWCpH225hj
	KewOgMMx1T7+KhUl/dIlNpYqGyLZWc8NABORVFslttmkmYt1jvldFXhpzZ8PHTvwJHux0whJG43
	LNUl9bSmdkkSUldUaSCrJWsZRt+dnDNr/yS+RztqLPfFKMIXxwvyh66sxHeieTkGTXtf+oVG4ah
	6TedleDVpSF9AwewICp+Np02Ol+VrTY2g6ThE/a0E8pBCbDfacppi+4a6T+2t2/NpdjSicd7w93
	I=
X-Google-Smtp-Source: AGHT+IHUj0n47h7V6n+yPrS3AH7Tk+MT/zDMbn/+1x+Z1nt4DmkG8sgKVizJiB0cJZx6/5G2TiyAow==
X-Received: by 2002:a05:6a00:398e:b0:776:1c49:82f8 with SMTP id d2e1a72fcca58-7a777a489f7mr12266459b3a.8.1762139149548;
        Sun, 02 Nov 2025 19:05:49 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db197335sm9410788b3a.47.2025.11.02.19.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 19:05:49 -0800 (PST)
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH v6 2/3] net: phy: Add helper for fixing RGMII PHY mode based on internal mac delay
Date: Mon,  3 Nov 2025 11:05:25 +0800
Message-ID: <20251103030526.1092365-3-inochiama@gmail.com>
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

The "phy-mode" property of devicetree indicates whether the PCB has
delay now, which means the mac needs to modify the PHY mode based
on whether there is an internal delay in the mac.

This modification is similar for many ethernet drivers. To simplify
code, define the helper phy_fix_phy_mode_for_mac_delays(speed, mac_txid,
mac_rxid) to fix PHY mode based on whether mac adds internal delay.

Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
2.51.2

