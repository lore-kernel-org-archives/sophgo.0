Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD3A252910
	for <sophgo@lists.linux.dev>; Fri, 31 Oct 2025 01:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761873901; cv=none; b=jyTBU4Np+rc62RtOJ17so4094yC6vSdQpb12L92Mh0vKpTfFZsSJQb6669gykuAS1dtNjaGMLY5zW63DOjkM0AKuP8/RshPhJd1yruJd9BnwgZTZyIsQmCVve1nlSFR+CdkBoXqg11lMTPq2tCsaSLZ1b3FK7vQGS5Cv1+V39Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761873901; c=relaxed/simple;
	bh=g1gjey22aj0deXr/Rxp5x8gbHU/r8O1Vjh1tF746E4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SW7U8N554AjDTgQYNwWVUUEk38lWm7EtyV8FoXxEP2D9bfJYgQ6AKU5YIjak4aOmRiuHSJXUJwlZk/mBPhIoOXR6/YUr861Sln1jvuEfeN8gW1RZ/OkveixXDge/WJ8lPp6O3ZWIcbus8ojtpWxhNZX/4VrhEdwf1v31X8ICo50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdyJsyYf; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdyJsyYf"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-781997d195aso1248930b3a.3
        for <sophgo@lists.linux.dev>; Thu, 30 Oct 2025 18:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761873899; x=1762478699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4QTOT55+/ql6/pjv059GwSZ6Db5fZXYVpPWy9XubXk=;
        b=GdyJsyYfXOrO8DAbCO3dGnw9xhYRHrKNDIqv3qXdoHZ+ZVkN/bKnTDP7/0+cSETbqd
         Je5LYpEr57VphH3YI9pvWn8XBsXaedq8aQYKPPCHkWSjosER2mW6Uw01hzZkS0XW4Z6b
         M+ryb/oT50pgG+v9CGpoRe7Vrv0xpAZ2yGjtwoM462JBqCUo5wciGMr/A+890WLnqrRq
         1aC/VvWghWHFNkv0D1bz7INRjlE8R2AYfGkTIHHu79GeAk5YiN8SvKLNQReC9ykaTiDo
         UBhGMLOXU/QilUGuIevMk/vts8v1XOuvl3L5BqmHQQVORSL8t5lR/QG+8YjsboJ45JzP
         pMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761873899; x=1762478699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4QTOT55+/ql6/pjv059GwSZ6Db5fZXYVpPWy9XubXk=;
        b=DBu1U6CUk47tguo/X07Wa4kv3lYqU41nRDx6NC+yiB/B8dUayXDk5VAxo3eLYjY5sN
         Fhb/lEMi+wODOv5EBL3b/9nH79vRF6ylvgBPtA2Y+rw0mKKIHd279Pu6IIwccu2XU2qW
         V3c9HFPGYuAA7p1PW+vQZM0vxrb0GyOotVtwO7IBJ8YrTG9ww7sDX7PLNgu9CNap/fYy
         qn//tTE4PGblFtxb6VJ+e/H5WObiNEmOx/fIqAQS7HI3xPasvmpHQcAp34pNbPdn8Btc
         wTy2sxxkxKrnnOpMLMxyWWv7SeHVypi5rUF/YCunjynUpbdBOYVFM/wt6ZQ9qyjXvzpt
         HJ/g==
X-Forwarded-Encrypted: i=1; AJvYcCX3xjNGzoaB5vUGcxXZM6CMTY7oKZApO8vZTQNzHvifD+H+1nQ6Om1z4pWtUuDWPaNguTMNaYk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8G23vw4V+8iORyjT/kp0rwV/ZlIFScIwwxKDLJg7yWrOU3mTQ
	tpYVASlGjY0yqJHwuhfZkh+gZvd4IXwv7PWw+Ba1CPVFaZyFSz3jn4Br
X-Gm-Gg: ASbGncuwVWQXcXfeQ5uLm9bUUa639YEsgS5ashphJBxxP3ZB4w2TwYH8gJoGsle4jOh
	yC88QB+9Zjb2lvt6OkoQ4HPONYFbSJ+6AhExc0B843G06erluKou+Tq0p4vkHWJTjOuVQGQPObh
	d7QttKv1+KgInfjC4/OTpzwUOGecpmhvn5cnCv47dCPNyEH4nqA9ZS19L385lVU3mQpUIJGNgDH
	SdBJSFuW6AdV3XWS8RwmW6eIyESA+b4C5ZmayIlnd0z9pl3CTLztwhIRYKJs2yk2oGXItAJb3XJ
	Yu+snjyZsqLpL1/6NhKaKBaoRPbe8KuEue4VuN3102scLV0i82gMR0ytaY2U9wyllk41yMgq2fv
	mKKQFuaa0z6a6EzAISwqMBiKgFi4Hbp3iK/OMCdr3MwI6sAKbuU80FyIVrp/GT3BAvsyyJMac1B
	A=
X-Google-Smtp-Source: AGHT+IEs0RZ/akZQh/jHGALZ8vIdUFz+6rVbFCmA91u1uXmk0t+e8i/uOrvYZcU50yYSCbE6p+FSyQ==
X-Received: by 2002:a05:6a20:3d1c:b0:262:1611:6528 with SMTP id adf61e73a8af0-348cc8e455dmr2461008637.29.1761873899175;
        Thu, 30 Oct 2025 18:24:59 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b8c8cdc0sm228117a12.13.2025.10.30.18.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 18:24:58 -0700 (PDT)
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
Subject: [PATCH v5 2/3] net: phy: Add helper for fixing RGMII PHY mode based on internal mac delay
Date: Fri, 31 Oct 2025 09:24:27 +0800
Message-ID: <20251031012428.488184-3-inochiama@gmail.com>
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

