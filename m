Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1411F1537
	for <sophgo@lists.linux.dev>; Fri, 24 Oct 2025 01:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761270942; cv=none; b=tUEUPkQcJYgst11rUQH4D4fObp/5L76Bde1Ahr9row+0nzTf3bfTTv8M3rlWsYHTIruOtwRSnpmYsYwr7uK5enEHovwtEeFctvsqmWVcl9bbztarhoqI8oZhinFBDLWRDoL2TI9vSHOGADIi/+nyrcouvhtnZA9XxkbQCnosuM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761270942; c=relaxed/simple;
	bh=jQBHQfAFYy2LZ9zgMurywoJJdSmMMdqANp1sUZ4+wtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dAAz/U47KNUkSw28wmrkqZU4WDUs5XrEzKFLgOXWQZ1nQakMeHawaj5tFaMNoVrLpHciGDhb/lqSunyB0Hb8p0EsVq6TVgeMcNq+Y5dqUrsAsR6rpi2bPobgON1OfUqxAcEkxoOOOrWojZDGP6QNRbz7Q66juOIIgcV1B6T6yxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGxCH7Sm; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGxCH7Sm"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b6cea3f34ebso1066615a12.0
        for <sophgo@lists.linux.dev>; Thu, 23 Oct 2025 18:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761270940; x=1761875740; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnPNWSYL8/32Ip+DCAgHjLLC5ALgmJeNiRp9bOMc41g=;
        b=eGxCH7SmiHLhz9tPLz4EiqVkevyxoY2AJArdOuGSs1a7JcSTAgOIHVMpLhY05evS+0
         WbHYaKWQLveTzXxfesnfF1Cfd4RR6hZBaP4Pn7/kZa7s9emM8A5vxTlRqf2hNqP8p78u
         RFwg85SrRDo6Pq134fjCJoPd/1qgSiOMzvlBNVKiOJpY9AzIVeD343qQFK1NkqzJAB3V
         czkRLpkxK6QugrbEveyQ0Rzoo1XOOMuCTJPKd/B7cczGC4n4OHjUDytwpYI/ul8LRujU
         CYZwreSXHnyTocX1hlXzEP/OvJRsZUjiQvYRvIe/mVK5A6MFUE2GjPxzBvloxV3WobxV
         Nubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761270940; x=1761875740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnPNWSYL8/32Ip+DCAgHjLLC5ALgmJeNiRp9bOMc41g=;
        b=Cw5PfJ8N8SOsXjkrLfnD6OyCtirnSpnJlVa4rjkJm2Hq5hGSnHmEpitSyGXVKjuet9
         rncfraxZ4ri70sJCvkwZwa9M5DANQf0lwEvE2eLzIGFerl9Ea/xI1GkFS0maRZkSDTKu
         boSfD0J7GmiugIz351WFeEfr0DXh8liziPAGaDwxhPCNxG6r2Wq1Izci7ydPb92S3rqn
         4Enfb0qD3QheYINiDPa5TnXrDS0vhZ5qX96C/erP9IrfAiQ+4jeOqzMqjUDuNx03yOCM
         IJt9YNUE91p7FoHpAemRd3aQtJJP8SrHIToi9kEySQ2Saie94FJMilvYUvevlxX7MNuy
         1Zow==
X-Forwarded-Encrypted: i=1; AJvYcCVdt5AB96wt6FHT2nTIMwzmo5QzO7L4Ln7rS7Aa+WJ51G8JmrUMbckwl1dyvctxL3BKjlZOSs0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGiPQoOfOfbsTSKYOVqLijz9gQyV/1STo6ZYFKwPmgUMJoIvK5
	D9gENOSIWJUNosFMh93tf4E8Sz8aRMPdSQsKxLT6VqPEjVAVzHLdECoi
X-Gm-Gg: ASbGncsLdYT6G/isPA0e8VtZMwV7CNLRv4SKJ6zDKpC6W9gvsIukUqHMIoUxu3Etg7A
	KZj9wzuURCeufTgV5x+j29xbSUczng4jCTgy6skFdbXZUXCF4dJc4pYNTk79r0ZldK51mVHNmhv
	kQJBdCA+mmw3iwSh50IRp9Z1JUw/k8FbAnpXm71Hi3KgAKIiRnIETBjPEyscjoylNE2OroHnOdF
	vVIB1YEG8WCU71Mo5hK5F6PDppHKyntgZbPi8pU3wlJUZuYWqsSZKHhqbqxcxAz6aItSUwAJTls
	Ydw2jcl7AdkJoPmhM8R6jwopRGgd06RHNrHJVKdUgN7bYVHKaIKHLZhXjsAbBlBtIIKMAnvbsF1
	BRU81q55r61RXSRUma21uMRP9dWe003ePfSGP+mwlwrs1aGStXb75WMOMHwMWAHpopNI/sl6Xxg
	k=
X-Google-Smtp-Source: AGHT+IEvrwCV3AqeaXcBCGHkmVsO9zDXt6O5hUjk/JLZSn4FLKu2VrTulSCz8MIwR6RtZ00/qylMQw==
X-Received: by 2002:a17:902:cec7:b0:290:afe9:76ef with SMTP id d9443c01a7336-290caf8505bmr346295515ad.40.1761270939983;
        Thu, 23 Oct 2025 18:55:39 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946ddeb51asm37483385ad.32.2025.10.23.18.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 18:55:39 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
Date: Fri, 24 Oct 2025 09:55:22 +0800
Message-ID: <20251024015524.291013-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024015524.291013-1-inochiama@gmail.com>
References: <20251024015524.291013-1-inochiama@gmail.com>
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
 .../bindings/net/sophgo,sg2044-dwmac.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index ce21979a2d9a..0f1523dc0e36 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -52,6 +52,13 @@ properties:
   interrupt-names:
     maxItems: 1
 
+  phy-mode:
+    enum:
+      - rgmii
+      - rgmii-rxid
+      - rgmii-txid
+      - rgmii-id
+
   resets:
     maxItems: 1
 
@@ -70,6 +77,16 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sophgo,sg2042-dwmac
+    then:
+      phy-mode:
+        enum:
+          - rgmii-txid
+          - rgmii-id
 
 unevaluatedProperties: false
 
-- 
2.51.1

