Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC952F60CF
	for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 09:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954175; cv=none; b=it+YF+eQj9tBr5vdun4rikLc3CC9yM6GI76ZWBn8OkooC3HxFdyFtdikEHgBG6jQU+EtrNmveaUDjx0SQTvRWDnUfODKaNGJMK/B1eVKCgBrNOaTNqkEML6m9iOEQfQ5dW/XKAe/ol44Ouas67A0MxlBt3/bhbdVNcCxZoEMB8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954175; c=relaxed/simple;
	bh=v+f2Vjc0v4EBJIBoDldEnMcWRnSy9HeOrciMh+mTn64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWQt+E6ubWfr+S0VNgAdevtxaUvABMaTw0DSeq1nrjCR7OKvwj+GW0Z1SW3i3OfiZJAkDb136O8jV9+EZseq5gZOMvHZ2KkPk4q5+X48Nw88gDjsIocm6l/J8wNDvoSgclxTSJp2jCHYqtFMvkFwb3pPt4GJ65wHsVGQg0QbOU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtrwiR7/; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtrwiR7/"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33ba2f134f1so3877653a91.2
        for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 02:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760954173; x=1761558973; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAetlB1rfruY8L6GWaLiiP+AhNOGwi30zR6SQ1TQ+GY=;
        b=mtrwiR7/EJrzptplK55WaKiIsklsoa4d3EPE2uDLFBevSfEFvN1hjJca9spKePm/Tl
         Xxu/VEnNeZo4VuPPtrr5MIkLdzR0Z0L8cTcLyx1TcTSGd/y5wVxTcGAaAufylFRlGetc
         4PJl/UEK2QgI12JI3QR/UAX6w+KPpeWr0lxwzy4WyesEkns/ypmtMoCul3UsYYdQndIh
         GQRvcnBPI2GTD9zjKx44ikCTd5mY1HqKAYbqnu1zNVz8dYcpuQ92fl+sNAzrRHJG65kE
         VLTt0fDpVgVGb35R4chNATV7k0vu8wnANnMD03DaP+mczZsLR6DPLRB+6Ef9PZHXD4Qg
         jFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954173; x=1761558973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAetlB1rfruY8L6GWaLiiP+AhNOGwi30zR6SQ1TQ+GY=;
        b=U7HSXHdTKuxU6H7FtuLuCi5t4LZFenhsR8/y73xv8ZDxUpcD/yFkUEh9yGnsXeho/E
         mrjNt254Yb3gAyki3R7hryyPFHSpgyP12jxZGcFpSwuRf4/oZ9hBJSDfUVGw+mtNcqfj
         RbSWcEr/91bq/R6rGnaprLE0kLaN8HbgNQmWVgjkxcM7sEwIimlnvJXRCk74Nl0CmMKQ
         Xqdpd14CU+FN7YMYwZzIO1aF+dgWNqmORz3wqcM97pDm4qjTzKpUwbkYpVCmsa7DmTT0
         9z/fpq2G1brpIMDK5zwUjJKExhQB4ndw3TvCtuyqFZ20bY6ER43hRAcB2lBEgxOeM01w
         rq0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFEcth+JSuUrvNDW3TU1TfWJ213jzi5wL6hfo1ueB8c2nwVMnXNGW7Eb2CtqUFooXOfJ87jtA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxaMhzF5SZcxdUbYnWcGY+TOtUo3CQ3W9WYdGRAolwVWNRvDRpX
	ZJcYhAKCNOx1fILfZFOM+pu5YykJ7IBLQQapyUqnQpi2+erTiTQWwsH7
X-Gm-Gg: ASbGnctWtqWEenKPcOKMfpdrOvuMhbvh9WUGjvJBg6X5A9EDkUMcApNMo1HjL2NGI88
	Oci/kqhXxfiSpttQlC/EWJWUJ2XGwd2HdkJMLURMbKtYOQf+HJf+XvTHt+cJBGQFDEok93a3MLa
	IZKlAkfgD8tyFtWExaZtJKpGvDfiymVc03SAxX7JXFu5JndLXGoEX/MFtewanxN//ZNrAQ7QlDW
	q8q+cujH+m7jGnimxmeOP3nVw3FkVAf8PcfzJ18H6m0zQFlTyZ3NPSeuQwBTv7D/AfEJMOei54T
	TTtETUIXuaWbweeqAuMKz+AV2KAIGlh4FadZqevUPyMmL/23Bpu6WUyxmWZYshWfQTHBOuLLcvt
	DJ+bvHa6oIuvoAAYNQrdr3iXWLcaaT4eLFm7NWPVKAg2seJvh/3Y9bc739Plfn9hTSDaz1pTSBg
	HBedOXxDIo5A==
X-Google-Smtp-Source: AGHT+IE7zVwzQMhb5BY4ayD1uNx5wi44qB2+5gan5ZQtQHTnM1ourkvH3ZfDn2OiMchcyVMlnamnPg==
X-Received: by 2002:a17:90a:ec8b:b0:32b:6145:fa63 with SMTP id 98e67ed59e1d1-33bcf860229mr19877507a91.4.1760954172663;
        Mon, 20 Oct 2025 02:56:12 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b33bf3sm7265996a12.19.2025.10.20.02.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 02:56:12 -0700 (PDT)
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
Subject: [PATCH v2 2/3] net: phy: Add helper for fixing RGMII PHY mode based on internal mac delay
Date: Mon, 20 Oct 2025 17:54:58 +0800
Message-ID: <20251020095500.1330057-3-inochiama@gmail.com>
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

The "phy-mode" property of devicetree indicates whether the PCB has
delay now, which means the mac needs to modify the PHY mode based
on whether there is an internal delay in the mac.

This modification is similar for many ethernet drivers. To simplify
code, define the helper phy_fix_phy_mode_for_mac_delays(speed, mac_txid,
mac_rxid) to fix PHY mode based on whether mac adds internal delay.

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
2.51.1.dirty

