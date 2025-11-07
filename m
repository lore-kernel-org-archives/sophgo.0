Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B953254A8
	for <sophgo@lists.linux.dev>; Fri,  7 Nov 2025 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762514266; cv=none; b=aiCc0rhu+UoBWMrQ+MqUje4gz7ydd9FW9lT87lXQasD5xNoIRLhS2WYt20fcMrk6YHT2mmY9V70Oua53ydSMTAamGnBp1t8dAbXeJ0XIYqkKGfswPDZAgWk50zXiDJXYN7FeBS/AA/r6it1zstpdCUvxWV4LOiF1pU9lgEZznW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762514266; c=relaxed/simple;
	bh=km+Q85CbXoWksNaZ7smPrMgV3IhcwRncYPUgD1dodvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jMYGiteUWwaIox4gFhwLSKFC8StWwaWl2gGFY9Tn490rJ7gyo7hd1A4rHBnSYd6NcnATb5wyeeb7zbNvjanQHeJ87zmMQ3h7nkh5swsmXQbzBuuAp2w+vRLTMkdn10+b4Sph/UYlAofSRYKzqMVqgJPc2lwyzyRfVNB6/akiRWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMmhkdtw; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMmhkdtw"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29599f08202so7982985ad.3
        for <sophgo@lists.linux.dev>; Fri, 07 Nov 2025 03:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762514264; x=1763119064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAEkeQ8lL8zgGt9X5ptAhWwpyBVXGyV+fHaoeQsAx0w=;
        b=DMmhkdtwiWE2SWQLlDTAzzxpGwlWPojqpZYKdi+HHs7I6SMQGY3k37wA0cIMO85VkI
         GYW33YVWMxQVlV4V7UhRM61fs+XaZa3uwJxnXVaGHMHjMlTkoxr7lq49tNLLmNHCZv/K
         T3s/XIdUciA3ahoK4+mLlCS+owwtyLWtzGmRKeZGYZuVXCXD49wEyOaLakkPRuv6b9T+
         OmP4ggjHWH6M+T1HVjfgIwjYR5MzBCYj0P5Mzn2UxjPzjWg1yPE3MQ4mZPockbRKRGww
         oTou1tdxCy+d9n6b4FBnizniS2kVFWjgsnngBSYcJ1RIB1dyp0+Do3SUlzTXfx5tHAtq
         hkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762514264; x=1763119064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OAEkeQ8lL8zgGt9X5ptAhWwpyBVXGyV+fHaoeQsAx0w=;
        b=Elc5BIyAjA0EvqbmClvP0tWLzlsCSh0YXjndyKkfUcigGq7PBUlzC+4P0nZtamLO+3
         hRcRnOOM7+RK+rTjQCg12W4aqMFr9i31yaJONZMgmTpu7LD3+ymybwEs1fRfPAAtqOBK
         SFP3uI5hK5asQ8wdFBrcSjIWWrGe/t9VxNN+GcPHeb/+vPi4doej2EKGlzCFPdfo0aHT
         MRtglTFLplQh/ceJ7eIaWgtTzzDw0Mg9atX/9tsvMg4zzsqDAlCl7lcy+M2YSAcGvoTo
         TE/cqa3MWGNql2o744hQ6lxsgUiZBTjStB8yyM0mwpje7TYPdMqSk5VzFUGWVXNCJ726
         clpw==
X-Forwarded-Encrypted: i=1; AJvYcCUVyofjiZEz7ujZsrcuEPbmij2EYJNAIeoDRD6NHg1eIhPkDScyQJbTTx5NrTV+QCs9kXEx8qQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyY1IdGxwa4ufeQHvfq1jx4OzIhfAVbA+Tp7VM6xv5mX9ZB+mX4
	VYqv0hRGV5XDyzhaOKbcqEcWE4lsEj1XAHmSeVIc76TgqFxV32ETJmsi
X-Gm-Gg: ASbGnctr/KjyQVkLtzKEJ/J0/1AMVlDeDbTuGsDERewn6K+Ymalgp4WERbZcPLbeCH0
	XUlv2LtYD6+WKMrcVurKI4znGYJMXLwkpL4vrmiDaW0XUmQ5Pf2PSWj+t3wW+EZWRSbk8spj+QY
	VsP7Loeb+BZRe/1OCgLJq0/IUUK3W5E0RGMOClvN8WJzK33flMXfTmLsELlnrjb+5hP4GyiF9dd
	XEhiIwhEBA+CUPRLB+JJmHwZebBumNuOVlj9jmFHXUlZIeTnh/yZ3QmLfq9Sz8wKBosr8PrPLoW
	pW8KMmr1s2BaNNxV+yGal9xtboPst58VMC0qp+bcoJCzD5hxRkFT1gZaLhackQ3fHKq5eURrzG6
	suHEGotrfr3chCJMd754atLAnB2v5zHzEDaZ930mgZvY4BRXfPN8pvAC+RJvV9yMIgQWAXEueba
	U=
X-Google-Smtp-Source: AGHT+IGmhW4l2QYXug4vN9BCUJXlqsiwbMW15g9DF995bQ1tw6dyuhIw+sFYeLzZjXJTBAXyKbUeTA==
X-Received: by 2002:a17:903:1aee:b0:295:9db1:ff2b with SMTP id d9443c01a7336-297c048e371mr36463155ad.57.1762514263694;
        Fri, 07 Nov 2025 03:17:43 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297d766efe6sm5186215ad.49.2025.11.07.03.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 03:17:43 -0800 (PST)
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
Subject: [PATCH v7 2/3] net: phy: Add helper for fixing RGMII PHY mode based on internal mac delay
Date: Fri,  7 Nov 2025 19:17:14 +0800
Message-ID: <20251107111715.3196746-3-inochiama@gmail.com>
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
index 605ca20ae192..0c63e6ba2cb0 100644
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
+ * Return: fixed PHY mode, or PHY_INTERFACE_MODE_NA if the interface can
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

