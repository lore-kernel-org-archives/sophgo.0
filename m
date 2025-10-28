Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C323E1EF38E
	for <sophgo@lists.linux.dev>; Tue, 28 Oct 2025 00:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761611955; cv=none; b=m+iqJYRS8xoX9SoEA6OYrQSUDqWekpu4f0+HrykO8qvfNOG821iOLDeX4/CBoMjytPL8T7Eq0a3rG1OYzRbCeCFK6MFAHEXJiIVm2YuuCWH/BfnPnMnwFxSBGYDghtHmKz4rbs/tvttY0nR+hCV48WhxgbHF51LznJMYDm+jiu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761611955; c=relaxed/simple;
	bh=la5GWOA6va8nayPbgB6XzEsfdMULSOIbIX750WJpME8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9r9ttUr7D0rcN+37EKlHXL325fQW/NtqdjZU0EPKB5LmyQZMdbyWupwdqZothd2LjdAIib3y+CDnrid1qbWNskg0AP+DXyqC35kyp/VfaHi0ZmoNppHYrOxyMJ0hkDmMYueK/uZe55E4WPRy1fiRmpnG8hp5dGkwbAQYAYMoyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D95QvZcf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D95QvZcf"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29488933a91so50123225ad.2
        for <sophgo@lists.linux.dev>; Mon, 27 Oct 2025 17:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761611951; x=1762216751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKnShh97FzAXK9uF4JYbivS+DlO0bX3Ab4FUiZA04Ec=;
        b=D95QvZcfw8LRrsQj34P0k9zSN4uXs6yMFB2yey1OVBX73cLw9/bzmY5iQIbGlbQPiP
         I7j8HMsJyz+ZxBAwz/TPobv7+Q3poqz1g2f1C+R3Igiyob0uZMRfAI67Zk52O+pGQWVp
         JPb7VwRWQQ5u3FDiQ8eYR+uzhGVndEQNYudFtqLbIOiZxY4umu4rbr6lGg3J+xPoGVSh
         CzlqfGmJBusPJVLoZxIbzKPBRz2sY4yfo6YxlsHGYmdJEO6RGKpIosR8tGU4SCabcKRq
         ol35lnMF0CCLZNra5jkIjwGRiHHwkwo+J0wE2TUEgVZZ4/yCudd6NQxBPjuimHgtBTkD
         eExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761611951; x=1762216751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKnShh97FzAXK9uF4JYbivS+DlO0bX3Ab4FUiZA04Ec=;
        b=UYMljwXpSiYXc+Nwkp5Kf3xZLEYrvKPVsl5TCUmeqssCaDd4dP6v89+cg5JDAznC/S
         gX6g+BCOdlidkssPC2S0ZYQRvx8isbeZbc43w3BIR/lTogQJOiRpla0HGBWDXkj9uXfI
         UHoIdBiSYpz/uYAjb+6vGPu8Sg0nuQrZXfXLZWZ9kPtqwGQO2HWG6Q8ERs5PAuIztRN3
         3v1z/As36g5WJedMdkcwAx1MZUPapHv7Ms7M16XzM5OkyPQ3igICw2V/UZmbu/MJpG8D
         fDHltn7crc93/2Tw0+hB3+SC0sbFK2+RvDDF39qi3muFpvwSBqmojan4Zrw+K6wHaTVl
         YMTw==
X-Forwarded-Encrypted: i=1; AJvYcCU2PsGzvFBLANLHZMUvirnva62kOEBh2YJPfI1fsWv/FtpOpfYjh+uBtijKhxnyuoMNn7cM1G0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlfPsG8DOBWXTH5J843Wm5zBR5L+x9O/NroE52c7z3qPiNhsvM
	B0lDWkQMJyXJeZBtLG3saEVzuwL4P6EosKu/JJlJ4dVJ0Y+YuJ+fs08T
X-Gm-Gg: ASbGncv5hy7LrEQ9JUeMlagoSni0L1hnDmJAbID5dkogLJQ2zBOlxFoh70+SkoajdOY
	mSXi4JUHnYrmrmlSwM4e6LcEEHIKNRuHfj6vTDUlUw3lAXF6YdZ8ldMV7Rpsrv2lJrNnd4TK0UE
	JQgwldUPa9eNQAhIN/iKt0E5qT0suKozJFexVY+nax/ItmbgvNVcGce/JJOGajAAP09VlsJn2ea
	L4CucCkF9HCRIfJ2Gi9pRmKGBkq9bsrm1Qg9JM1RzPbtEsDkR8IvoEhxhD8l6O8RU8fT/c9jFhx
	5WZFg8tkaJBNbDyKHTh8uwoMYpu6TikVx2L3gjUVtLy7WqA7u9eXUS9oDudSLbOFoEljSjuosy5
	uHzfTJXPvRygLiHrGFVChruPMMrGrvLJKso8cYBaAGuiZE+FaGckFQCLN1sVqSjLWDDrVf6S5r7
	Y=
X-Google-Smtp-Source: AGHT+IGDgRzXqJUJJkrtAaCEFJyXOr4mEl+07Z2j/3J+/i5aKBpQqqv/TIGwi4eyT7fk5HkXcUBq3g==
X-Received: by 2002:a17:903:244d:b0:24c:b39f:baaa with SMTP id d9443c01a7336-294cb65f7f9mr16976795ad.49.1761611950502;
        Mon, 27 Oct 2025 17:39:10 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7e7039sm10005885a91.12.2025.10.27.17.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 17:39:10 -0700 (PDT)
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
Subject: [PATCH v4 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
Date: Tue, 28 Oct 2025 08:38:56 +0800
Message-ID: <20251028003858.267040-2-inochiama@gmail.com>
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

As the ethernet controller of SG2044 and SG2042 only supports
RGMII phy. Add phy-mode property to restrict the value.

Also, since SG2042 has internal rx delay in its mac, make
only "rgmii-txid" and "rgmii-id" valid for phy-mode.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
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
2.51.1

