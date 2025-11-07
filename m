Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B906322C83
	for <sophgo@lists.linux.dev>; Fri,  7 Nov 2025 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762514262; cv=none; b=qcdhGTLRNb3dHB42soRx7+iyd/h0g4IiE2jNa4E8eHRPnc+c/0YW6L9fiW0Eg0HPwt8VePBlHUuRaiIbXD3yJGEpNKmF7sb9NnErGx01RLUDPV5KgjyReX5bNC42tkmlFlJJYc42F2ytoQP+qja16wwcqu6/uZVIYotOZ1pN5hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762514262; c=relaxed/simple;
	bh=/s3k3gaQa5vELRzkRL0kZbmW5//OLC8cCCrARdlhhI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gSmV5oDNbUGO7dzmWkAXpByKOGiazFeNWlLWJVRb/cqxcN2Zj9stYzNaAHoaHYz1MUZ0BSJetXjST/OQLX62M9xULEAHD+M+9mfQURFjzZCRoYdtwSoGtLlqv7aAoy69jrwrU5rVgAkaoz+uFdUHHIxnU6YlrR159mTvGQ76Y0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfNSX3x2; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfNSX3x2"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso538615b3a.0
        for <sophgo@lists.linux.dev>; Fri, 07 Nov 2025 03:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762514260; x=1763119060; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DZ/Hzt/Z4dyeSpA3JZAv4iA86Nxbb9HIqSS2XvFzQ8=;
        b=dfNSX3x2Ir3u3nQPmjvuelz0hNQ2u6gEacqiwT5HUBk7IWfN4fwHFlDqTDvMen5yB4
         QEwKgZ5DEOsD+h3qMpRCF4h6DaE16PL2LP1SYAnwtcyfxIChZAk5JU/9oiI7Rzuncd0E
         Jhns1lPvoSL8rnFV+EyBF1JyMPJ3uesbXBSYGNr8ZPmIMxKbfRpzCcZE8bZmEZP3CN+x
         X4HopVP+L+xZiQ85jjDQu8qtNPjLf9gcPoPwz7kxQa47pz2xxDrieOP/TkG25DTutn2j
         BC8kZZKZHGbb1gWtXU5UNMYdaKT4r19r/CB0BFuJa0kN2M/iY+c8RlDOPf8Zuajc18M4
         eCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762514260; x=1763119060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+DZ/Hzt/Z4dyeSpA3JZAv4iA86Nxbb9HIqSS2XvFzQ8=;
        b=DOCjSFjxA21eYB0qlmTVCxFuZD7gHYhulNf6tFpgxpbielrbwZVhslfdxrOIBdVtIo
         7gkr6Y1B2KpWAHeZnUdkyVaKfuycgM+kVflYS9U8tfQloNEvqh6VorA9kABgxh9FqDuL
         CXVc25zOOyViKGuVm9fMkAEILaYR/ynUSn4uwOaAZ7gStGQouXoSaHpoS4FOz24gn8vB
         5G2c9yKGELtk/90kO0XcIVoTGTcs5MbcJd4Mb2Df/HhV98UOSG6v+lAXpovEhBs0+q6w
         3Y4kd4A+rWtlu/huyoy7AIbpiB9Ttv5tnqUkN+Lib72dOT9R3rnPxwNJ3CZSM5N6kahK
         lX8w==
X-Forwarded-Encrypted: i=1; AJvYcCVs0o/aZMh/6u78t6Fx8S7SmqAkCtMpUTReN+5sYiSFEDtm5mQ4AapOtzCNY99bBLPlPqze0Zw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6T+MXWKH6vJwPPYGVeuOxCAP/CLq4Z39CYFQYnm5onLEgyvoK
	+MzEKkYfT/hyJJXJetfvB3nMTZHWO7jhB6H7UE4NJspKYfCpnVubN7ZG
X-Gm-Gg: ASbGncteWKYA+5+oQxiDnpXrvkq3kLUtTQ1b0ts+7VHvDtt9NeXZ/pkWLhtGngGhrKV
	P3N1gt8DFic/TLD4So+R/7J9HuyLbmUhvpKY1Yqj6Wjw42jtQmlb77luaAOoT9QBSgCzj8/PncL
	So0WuEEezbjlkswK9FiuU7Ldowfnq1j3L0jCMd6BVtZPHPpXKBH+jMnIhp+Zk7VQtnPzY5bTqI2
	pkzqsAx+iNUSP2wwlo/r6FxZVqgGVl76yiE1dcESEinVqpJ7ZGqtOD+ewNg+qK9AtK9Z6P5K5Ki
	3sM8jiQe7j7HcAA0+SplRALOiwA6GmWzn5ppccOdps557mD02WkETOoXj5IXByHlu87W0ORqSVd
	fbeuIAXmqcisrkP4kvOzbTFFeuay4ShRGITBpA6R8/6yvdh2G1DBdjv4voedmCwjNj9IQW3ZDb5
	Q=
X-Google-Smtp-Source: AGHT+IHjf5f+YuLvxkmcrd3cJvkmjsyY1yheeW5iHSKdbzLJ/p2M1xTgPY5ean6VA+ewJk0yolgl8w==
X-Received: by 2002:a17:902:ec90:b0:24b:1625:5fa5 with SMTP id d9443c01a7336-297c03b66b9mr44655785ad.11.1762514260220;
        Fri, 07 Nov 2025 03:17:40 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8ffe3616fsm5131381a12.19.2025.11.07.03.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 03:17:39 -0800 (PST)
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
Subject: [PATCH v7 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
Date: Fri,  7 Nov 2025 19:17:13 +0800
Message-ID: <20251107111715.3196746-2-inochiama@gmail.com>
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

As the ethernet controller of SG2044 and SG2042 only supports
RGMII phy. Add phy-mode property to restrict the value.

Also, since SG2042 has internal rx delay in its mac, make
only "rgmii-txid" and "rgmii-id" valid for phy-mode.

Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index ce21979a2d9a..ce6fc458be61 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -70,6 +70,25 @@ required:
 
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
 
 unevaluatedProperties: false
 
-- 
2.51.2

