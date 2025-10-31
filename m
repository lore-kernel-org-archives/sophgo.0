Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B550824A049
	for <sophgo@lists.linux.dev>; Fri, 31 Oct 2025 01:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761873898; cv=none; b=uVm/czDbrQ13W08aF4+WQr/MAioMRhek1D5wj3A7SGNmkXBGgjDyZDOkAy/lBRRlUdvaya6F7e47NAtVlWp6WJu67RB9KA35OvSIOq+gy5Z09ixjbMKVxnRtXMSaivlJiL4sNWeelOPHqSZqFEA9PPeQRhPHJO0Qs4RKfRb66JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761873898; c=relaxed/simple;
	bh=n/NOeusvOIuwuiyL6YDKNwZpNTHixN6YVX8wwU6wlnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BFWW/r0ilPPrn40GFEXOZx5zluIryvbDzm4C5v59aP3zWRBgDkeBdEWK2xYkvchEP3WVqT98Vf83GrCk8bdIclS/4ilLMnY5tQ7OLvnfBF9vawf2n7QqFsVaUs0nQS8Gc4As+fYvdvcMR1BYsy515NF3VDJex6HdgylXGLMdHi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eto240wM; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eto240wM"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7a74b13f4f8so700537b3a.1
        for <sophgo@lists.linux.dev>; Thu, 30 Oct 2025 18:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761873896; x=1762478696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3s1Pf2chIyJ4GtiDiT2mhsesiDGOlvUaZYqYIQFp28=;
        b=eto240wMoOI0TNGu0Eec+znwv6TBShjUN/uARt5qk88kBKCgV+qimLtSUvgeczS45O
         pcTUrNqqLWDRG879ORfaMUrlAfP8XWWMGa5eQXRBCzw1xphSrJlXxfbKvPPJ5nRtDUvh
         cLEcv+FpoXTuidfZErruTM5JwBIP7WTyx2fWPXcNSNSIv5KBJ6JQkSQcTEdpBOKkZ4Jf
         fenzscGda9/las0Q6wmDMI2Mz5mw7fjfNf0GDGQMG3928uuwCoBPmy/k0Wu/FKDEjaTV
         9Kxyl21PgiInjNhj1g0CXF5/yTs2r2n+0x530oiPSfHhYf9z1vhQ8SImBNFPF4NyxmFK
         RTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761873896; x=1762478696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3s1Pf2chIyJ4GtiDiT2mhsesiDGOlvUaZYqYIQFp28=;
        b=qWlrTI6l0tFd2+SaTUfnboRijrVg7BOFiMvOKZrm6Sf4dUpFuNIZRX7PCqL1yTL4Y7
         CLShpsXpZ67U9gef00UDVlrpmaHxx6WoW19V8ZPW8Mfmdt2AGtwj0Lr4etmPMHWyRTp0
         4u5H9Tr/5Kj11/gMpjt0lC9ykr1aw8vtHLYm8EDsG8qIURwDF5J4FRSVUbaFQLHMHZt8
         Vy9nlPEGuoC7ZApT9PzQQ3dnxA7z7Ngb6ug2ItgvEL3L9zU2PVmMv492TgV0ESGyrj/3
         rKdXMfSx5B21dgimHBQYkkZjuAg0QfADBsh5WgO4zaUqDlEuooH7ku1C4fWQ3RlEt3Lq
         MWfA==
X-Forwarded-Encrypted: i=1; AJvYcCU7vwVpWNGaeEQqdwY8l5jEGs9OZaTabbiSCjRzgA3rU7gzhzyPQd0UpvNPM1FKA1BzNcQYFiM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx42z4hcbGvPZdOjUmDSi4UIbXBOVL5oGilbSXXrkcWKCtlNYPx
	CtuId53VWAH63EcjGtjAYD3atPmCaLJTvSgwadzl9lQ86CetHAJtw+7n
X-Gm-Gg: ASbGncsKffRQXm4cJtR9CiXk6fi3CPDmJtlq5yiGeKQ9t0pJr5WxWTRkWcVmfW4XqED
	bZWgLnpn+4yVuZKBfWvtr3Gva/WIlJKazDrJqEfWHEZAfK+mIgyaJsJkk/879Zuk9KpUxNlAnJz
	ePjgHvQJB5Vt2cp85llVBLUyoAGh3P/3R4hYiaof8ph0d/F59zSiP1p/WLU3B4OIosuzm2WbtUH
	sUKGtDansHzYShQfAP0vhKBr7oABzhD54GOZMXiw0Bg2CFQ2GFLaMpU8Zq3X8tBoCaH1BPOxqwr
	uwmqE4nYMCda50Jhoz3vzMOxG5SdkdJ+apY645XB305Yq3a/otkee9d0K83bOnyH9tJYxkqGfz7
	I5IvLGV3UssrOIIUJar61VaR+LEU7oajsQ0gcaTts/DuWvkg83sDTo7L8AfknXqKRoU01+fcDam
	CRN73m9P5lTw==
X-Google-Smtp-Source: AGHT+IEQpxdK7nDSwTz1wkNW6JuGLevqLFpUO9kj409rzEmnNWQoF0aH834gvH8ZTJyvDlZYvh+hhA==
X-Received: by 2002:a05:6a20:7290:b0:344:a607:5548 with SMTP id adf61e73a8af0-348cde0a4e6mr2555602637.58.1761873895775;
        Thu, 30 Oct 2025 18:24:55 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407f09fb16sm534423a91.5.2025.10.30.18.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 18:24:55 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
Date: Fri, 31 Oct 2025 09:24:26 +0800
Message-ID: <20251031012428.488184-2-inochiama@gmail.com>
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

As the ethernet controller of SG2044 and SG2042 only supports
RGMII phy. Add phy-mode property to restrict the value.

Also, since SG2042 has internal rx delay in its mac, make
only "rgmii-txid" and "rgmii-id" valid for phy-mode.

Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index ce21979a2d9a..916ef8f4838a 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -70,6 +70,26 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sophgo,sg2042-dwmac
+    then:
+      properties:
+        phy-mode:
+          enum:
+            - rgmii-txid
+            - rgmii-id
+    else:
+      properties:
+        phy-mode:
+          enum:
+            - rgmii
+            - rgmii-rxid
+            - rgmii-txid
+            - rgmii-id
+
 
 unevaluatedProperties: false
 
-- 
2.51.2

