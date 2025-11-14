Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5EB254AF5
	for <sophgo@lists.linux.dev>; Fri, 14 Nov 2025 00:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763080718; cv=none; b=XPjnoXEyMsBJaEIBOKt20wiI5IFtwaSu+D4ldUzdMVw/Myy7ddlKCtnXifCinZdpqm38QupP+MNsI9pwbwseF3V9lrTQnvi9PN6tKnGv0dLu4ozeRnx0pcN8D40/Hr7e1X/MeuD5Q2dtMMMIVJnyiXnY2PHbO1zjCtdeYNDJ0dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763080718; c=relaxed/simple;
	bh=TvnpUFMm2ryBKJdRmgf47KJHDbXXufpqPGy+CeMvweg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OLZdJWkoPO6mqlLqctSh2mwriFwfAKbMDwEdVtEkOgYGNebQwTqEf7F/EbgjhYa2/pWV/ZzScKMKpzqsJ0NWcPTTPYYMrPj7hTESKlwTAlae6npMWnmE4enHW4Zxj2pZfPCC+lcIjahpV4jADQotFdanTfhUEgEEfaabV6ZjMn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqAQ1WH8; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqAQ1WH8"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bc0e89640b9so1010359a12.1
        for <sophgo@lists.linux.dev>; Thu, 13 Nov 2025 16:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763080716; x=1763685516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/tU3ToM4CkL60i1rTuRB0FRIV+HElBhBmwOezkh+nI=;
        b=LqAQ1WH8VLYd05l0xsyChlvJoTfd9NvgGyqYD9crSm/PyK+gzgBix67sCuhcjPDanx
         Plbh7oagq+AVE3tznx7cBQU03Gws+JXT/OKw5H1zv5OKtb1C6CqZXdBWs84EkGxtRk3s
         9MmG4qO6r3OA7zfp8ZM53bXaJ9nRNvOTbBmRjcyOZ5iaHK5kbghZxLufoGM0xOpMZU3F
         V/MvewRqwkvQBUFC2RX+KPOMbUwvv+B1BQvSykFWq55sDhceWxJc/KENYJiuhcgjnLNI
         tBuBKpLS2EU2JhX3feprH1eOMWreTeddQiTvuKQKsQtYu0y6t76/0z8LXPdI/5vKcqlJ
         UFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763080716; x=1763685516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C/tU3ToM4CkL60i1rTuRB0FRIV+HElBhBmwOezkh+nI=;
        b=YR6XW1BIhWjwaxdwkXU4RAvWLawuu6GeoLEBpTdsTjL7THb8kfBlvLUa9y8MXmc5ta
         CbFwlmAa+5y2OP0K4afWHRfptJd9dGRzS8Vx0/oQ/qCdZSjNMFANni5kQT9tvvftgThD
         3oDh9uMT+l6BYZvwA8eSz8bu4kuNNisVGcLHw/JNJ5wkTPfLrIxiQR8F3QUFUh/fWQ1J
         lnPLw4PwozulHhtEBTBfl/Q3/T2nTO+G1PtUqvXndhdXj1ADMBnPXOBFP6tdq1IbjHTh
         IiXALB6SBdpkG0X8gY+4D8DhQR2xi8Muo0OgDS9fH5BJ6jtBODfsEq/6Z230XSAvWqgS
         jNVg==
X-Forwarded-Encrypted: i=1; AJvYcCXVPdGvGAFk28pSmEhH+MmyJXZGODg7sYqNar5hJXQKIE6vKyAZDgLXhRBInoJgLrx+dPigpac=@lists.linux.dev
X-Gm-Message-State: AOJu0YydMbu2UlYQrOVBkbdEmGe8t3H1ujFq1nYu5bo5GJx1b6WJfnnw
	raU6k0WUYdqXh8fWtQXDRmcBN3rSsSyx/QsqCh99/AjiNJTJSmkPHQ1x
X-Gm-Gg: ASbGncsxOdQceD+TO8JBxH3weBVRzDv59v0RbEiclBFvgI/lAgr2UUM4jS/CbyRiCID
	/zJOBLWqypfF3nYmsJu3uVD5vFC1JNDy6w8yPYOPmVoPZtJWyH2X1TK3VwFUsiM+m0xklQ0LzSN
	tgdwQL9e+xQuGOxuC69T77RfvNh3DDanu40JdDBoSTe8taaJQQpSJ4GC673pY1lYkSjjqy/6zrL
	s7/ZCwX7lYgge+3Zzg2ilCFwk0gvsRSLIhY6T+RLqLcE363m5PoYupMEZhrIRYEMuqb3P5pu2EA
	EuOEoDHnzY/HRteaBq+CFWKJfd8do90msEjpkj0NkDo/ZbUyTzEJWEu9nMfa4vKG3mXBwC04c6o
	4KxTezUp5sLxXf80kIsx+TOMdL8/n75p56eZ6b1lWX0nhNOLxvf7CayHBEloSkj6kyaGCOH0B8q
	4=
X-Google-Smtp-Source: AGHT+IHOi5i8OOkvh07viYVMPYkqSx80JGxGxStktEkqORfwNsnc52iYhiMNXrcmkKVdUboZXQ8H9w==
X-Received: by 2002:a05:7022:ea51:b0:119:e56c:18ab with SMTP id a92af1059eb24-11b41504d44mr212238c88.19.1763080716287;
        Thu, 13 Nov 2025 16:38:36 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b06088604sm3636365c88.7.2025.11.13.16.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 16:38:35 -0800 (PST)
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
Subject: [PATCH v8 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
Date: Fri, 14 Nov 2025 08:38:03 +0800
Message-ID: <20251114003805.494387-2-inochiama@gmail.com>
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
index ce21979a2d9a..e8d3814db0e9 100644
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
+            - rgmii-rxid
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

