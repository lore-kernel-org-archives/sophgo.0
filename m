Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650A326059D
	for <sophgo@lists.linux.dev>; Fri, 14 Nov 2025 00:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763080722; cv=none; b=rNVk3tnIgGvtD0SECMAProAtN8KxY7Hr89Xjc20I3tqGWTDpuUKgNdeNpDSbos19KtOGYJd/Dup8jbN+aiOPLwVpaJEwZhqn3wB3IZ/fnhUWOTtGYzlbmFzflt91UnElIFuCVZMh9JNKhrwO/lUH7F5jPvK4DhmW5qHQ2Slc0PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763080722; c=relaxed/simple;
	bh=km+Q85CbXoWksNaZ7smPrMgV3IhcwRncYPUgD1dodvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TC4xc8xDA4CiWVUPUhFa326GRaWOL2e/qFCiy86R10R1frXZQG4U1q8ry94QBdLNSm6IHWz4RVaA2doxGSJ8QohzWfAyOfmFYLp7quHrv5tKj8ooq6/T4w4gMtmZYPcjB8DqR2iDTnxVOdnpTV5jyQh0QfTt4HpcRyO1dE08WZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pne42FLH; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pne42FLH"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-bc09b3d3b17so1182116a12.1
        for <sophgo@lists.linux.dev>; Thu, 13 Nov 2025 16:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763080720; x=1763685520; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAEkeQ8lL8zgGt9X5ptAhWwpyBVXGyV+fHaoeQsAx0w=;
        b=Pne42FLH+5clhga5WajqmwNhwUVZE8arC1I6J5kR0Y2P6qEhbPik38DZUtK1Is8WyN
         28KS9uonYKrkqJZlQ26UYlbqPHB3fKNprZcx1va0R2hhGC1DmWvpsv5kf2Xe9zPwHhzm
         0CbT1Ca+Xd8tspfPyWVMoIN5GKCi4SvluZywxl597yCjQzRZF6sSpG/GVwYQN6f6hItC
         ddMOXhTGYZ1LO9mSdaEe317Ekv3f8ea2J4ba1vymulI1khv9gspWi76EUKvPoq6hHTrI
         SUj10CuQ7Y1sg3abdOdy1nNQhT8fbie+kPHlXtgGoVS28jALS3lLFKZHiHIMCPScSSbC
         ThGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763080720; x=1763685520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OAEkeQ8lL8zgGt9X5ptAhWwpyBVXGyV+fHaoeQsAx0w=;
        b=gcLWJfTCr75afDh5zNTMHKYpZYq4BsuNCx9yM6mSwcMFyE0My8TEa5zjPmYA+Sw/Jf
         Oxt2ibDErfgyjAGodC52ldGnCgM4KPvkkqHK9u/DjsDmf1wYy7XPLtbnmwbEjwy/fTym
         AifI0357ifwurbjG3qB7SqbcKxbeKBOpyUpcIJUMwR+GfiW7qFSsDxusuCy5K3swhQsd
         LeX6/2RQ23uLg4ORcmu2q7llLTnLHy24jMpc/Urz0TMkFrivl+iDO9v8W/zWcxj63uVE
         j4aTCVhaD9FsizFlFXJbHsZ6YdUn1CH38yN7hgC3309BsGOsdwrRVinHCxcVXctxZq+N
         /BRw==
X-Forwarded-Encrypted: i=1; AJvYcCV0Kx/369HMjLkY4GuHlFLdPh8LH3tEZPnFp+HJy2Qh7qWLl6zltzSRpMwXanasOmt77YedwxM=@lists.linux.dev
X-Gm-Message-State: AOJu0YynEOexL9T6Mh/c8QYD+DCamOpn0a+QoCXQz5dRg0cJN3xaOzzG
	i0+kffdrrwC8uEsaktoJh9kMmxIr8IICYV/40bhYtE/DRB+RpObuDNvL
X-Gm-Gg: ASbGncvdrFko77hBWRZg0eS48Byoc1gVaL0jRlL8+X2aVppjcnDVO5gzql7E1lN35pw
	j33ZBNjY3hf+KYS3C1Rm1iGvyVu0z8T9rNCwxS+TgQnxAgQ5nHz+ckx0jVbm+Bd5ZejpclnvGQ2
	l+WYk5GK2WNxP5dK1992SWE8UCceFhfhlDT+CQtyFIzkw3tEJ/M0e4BS3UR4AKqRgR/JUTm7/Wl
	2Mrh0Jylms37UWjjmUwarArFryumcsDrYt0JB3NuQQ7COrIbCGL0tp8xYZ6s+VkIJv124TfI3Qw
	GTJ9+hDhu8uTrloLcD8Cncrub7+ckzN30DrTyr+jhLaiev8gmFlz/T1jzaSQcI/DIwtrxndwxB3
	kL48yHYeA8ZgjDgFSI8JVP4sqwWnA7Xci1yFsvbtCgnopj+0Ms/It5+InDn7HaeUu+n3/EORlvg
	HRq/d/HhUicQ==
X-Google-Smtp-Source: AGHT+IHhHMFOgdJTCCj2iz3xbNhHIo9j6lyjGd6SR7Dx1GmoSljn6NAypb01axUm/7zVz96HeKqrgg==
X-Received: by 2002:a05:7022:6608:b0:11a:4b72:35e8 with SMTP id a92af1059eb24-11b40e81abamr546686c88.6.1763080719556;
        Thu, 13 Nov 2025 16:38:39 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b06088625sm3368287c88.8.2025.11.13.16.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 16:38:39 -0800 (PST)
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
Subject: [PATCH v8 2/3] net: phy: Add helper for fixing RGMII PHY mode based on internal mac delay
Date: Fri, 14 Nov 2025 08:38:04 +0800
Message-ID: <20251114003805.494387-3-inochiama@gmail.com>
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

