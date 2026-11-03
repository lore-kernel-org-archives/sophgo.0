Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696346;
	b=Ip8sbe9soTZg7e6N9sIHNxHLs4W1Y+y/kyV28IOHTGdjyt6kA8rhMyQFE7qHB1CEFERM
	 2cK85E9sUoq4WHgph7fsJWtRxyLy0+rTZ2GYXtDQsI1mFUJGAYVF+H4D1rVzf720A4dhS
	 AEZHMC0+mkgS3NmZnB4gkQp0eiThGf9KzC9TXfvTFqag/0gkpmev4Qx9o8wVzg5D4up32
	 olefS5tx0ZZIOVeOj++BIF9DTYm4cmH56f8Ir/BcC4KEj+wRu1osVAwrjW3wtE5+94s+h
	 0hLMBpvFCpwcGS6Op3YEG7I98FysKzTf3981nXeTPlJt0yl55ghyFjbyp2uLsu+l3JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XdWSx5jEVXu7O1L25NHaAg46eSzRTcB1Jp91d+n101c=;
	b=F3w1D33NVB1pSbGMhVh0PTfQKqPMFAqqMPCZFJ9XHHPoCOLmPC12U3COX2d8lbeZG7kp
	 rXep1ZBQ6xPRTCYw+o/aBBIT3zUJ8wwdV7skb0Kc1Ey9ZfmTOjJmVmqNSkchfbzVw3x2m
	 zBrcwOO8E5Cv+ws/eZsCX4x/g3U1jFJ3po6tqLWv8rgnkHPGeP2zzoTSfUmyYmAHzVtF3
	 VS8EycaLPrUZVV4494ZvWKb3kN7W59izMJljn3w+sg5ZlBQpw3EAND35ddJ23f88U2WqD
	 lZuFjZxg1kJs/RdxnzcfiEslj7rl4koR3RabqRPZSNCTdOuyGFiy15NAKtb70pcYcaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tPynosze;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451FF606A329
	for <sophgo@lists.linux.dev>; Tue,  3 Nov 2026 08:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 451FF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tPynosze
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab2cb02816so570044a91.0
        for <sophgo@lists.linux.dev>; Tue, 03 Nov 2026 00:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696346; x=1794301146; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdWSx5jEVXu7O1L25NHaAg46eSzRTcB1Jp91d+n101c=;
        b=tPynoszeQpnbRsb+kryzCH/D+2Go/u1tfIVqZoZpLUSvmoaKLwAjZ3fpJRkjoyw6rw
         cdMm0GwVGHq34UrDBR1NFrf2XHI7YW1tLqRl3P2MWV21KHRTW7BgWvd3WzMdrt5DQhZk
         8lwRxcYTVe3LF6qVbMKM+EvJV3FfyXBTkCnMXhdbTKM4tHLzuXhIkvGAYnpXW7/uPib8
         3l5UHy8xu4rNA8winDUQF8rZcwM8b1viOGW8pPjaRmoj/dwIwf/xY9GrULZEgZJ+YFDa
         gXqNj6MV6Jtwl5a4dn5Q5CSGPk4dRdzYq41R9fREBKEt7w0bMgVfoCTyRdAmY6x44U4d
         8NNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696346; x=1794301146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdWSx5jEVXu7O1L25NHaAg46eSzRTcB1Jp91d+n101c=;
        b=pb/qzfEQUz1+nmMw0p/k8+EfxQryxMzu/RE6dqmMwc7MEeboRayTyz634CN7vFMvKX
         kcByysYC+KmZNuY8NxLh36I8JynUc21qGHnW0Q/KkH8YDBtcy+GneC+S0hR3ujjV4xcm
         ex4MRAb/IYvtmywtFoOmAlAAqaj8hZO42Cs5Igs0HFzcZDDLJDAJ4V9UMhRJXqMcbrNI
         C4Nu9OA1FjcJk8ggWRql6b3kwUidVI1OLIinmpsdOHUQ2pvzrSKT2OX9osQgH3WdFfjL
         JVZwE85hdT8QB7/LUhXgMPf9V7HThfn8ITY2x49mGQBaYUzhexSJyF24k0sXFwlcN7un
         whjw==
X-Forwarded-Encrypted: i=1; AKwUvBweu8WMwgrRuWtcS1O6qcZnIkotW/5/WiawxLa315q7XpSnlsoIJHZ1YwkWOMXGuBeej4GATI4=@lists.linux.dev
X-Gm-Message-State: APuU4Z9qp6SHLXl3iyMejMZ6MWPBOW6tQYbFEfT504FVsHWYA91urjSR
	JABG9zqctL2kLyXWs7+LJmfzkq8adtBY4TB0PU9Vwkhsr6eRE1HmpeRX
X-Gm-Gg: AYBFou2MbefaPe60tnqsd5BzyCKtiI+3h0hOqaNwTohi/1H4/chigVMagTGuminDW5j
	GS9m9qSMq4ArY7Z0EsmQZOOFkyxiF5s0A1I5M/q1Ux1405q+Rg/B5NaTi5BBYQX4WKPbCgDMpwx
	A1YUBAg+PH6FH1m8JqxU9OTPvGi0r3/0/kDaEdU9QQ+tblPo4Kfqb4wVLCDZHX/9/VAY7a23Pz4
	cIL/TFYt2BkpXPbKnd5/wSuB8fyti8ugSIvUfPtZN9jcke3YsL5oNOpfBYygGbPikr9fKS9JsqH
	9pqLXBRpjbE98j/hK6fmXMXeuTf9mDNw+v3uE3hgpy8MMdTIN1J32EVZ08b77COphcQrk6ay3Wk
	tvju/0IL1wZpDju1NybjD883vkxcBNJFi7Ep22ghOQFRzMT2ErfXxyVDV2Q49HzuQd5FyDP6m/E
	AS4YfjIfqNHSJAPGd5zN5VfxJOWw+HEm92yxADYGvOiiQoQ4jeWfbtpMtmMNoZKas/nqDEiC9K1
	u8aW7y1Bjgb4UOa+R6fC0YOCqm+wwDWQY7S1y6uWwjhJJTi5cB8FjFGjc1eZGSd7SWUDdl8KPP7
	CclhBmm44+usHgARmtWJHuoFy387qtpLgiIEB34mXQEshXC2Dho2fmVAEsj36D/ToppqzwIWUXn
	yW2loSst8rg8F
X-Received: by 2002:a17:90b:4487:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3ae89626108mr17481897a91.2.1793696345686;
        Tue, 03 Nov 2026 00:59:05 -0800 (PST)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3345662a91.10.2026.11.03.00.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:59:04 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hiago De Franco <hfranco@baylibre.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 1/3] dt-bindings: phy: sophgo,cv1800b-usb2-phy: Add USB role switch properties
Date: Tue,  3 Nov 2026 16:58:45 +0800
Message-ID: <20261103085847.338613-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103085847.338613-1-chenyou910331@gmail.com>
References: <20261103085847.338613-1-chenyou910331@gmail.com>
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB role on CV18XX/SG200X is selected by the ID override in the top
syscon, which belongs to this PHY, so the PHY is what provides the role
switch.

Allow usb-role-switch and role-switch-default-mode on the PHY node. The
default mode only has a meaning when the role switch is present.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
index 2ff8f85d0282..a1d164686b07 100644
--- a/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
@@ -34,6 +34,15 @@ properties:
   resets:
     maxItems: 1
 
+  usb-role-switch:
+    $ref: /schemas/usb/usb-drd.yaml#/properties/usb-role-switch
+
+  role-switch-default-mode:
+    $ref: /schemas/usb/usb-drd.yaml#/properties/role-switch-default-mode
+
+dependencies:
+  role-switch-default-mode: [ usb-role-switch ]
+
 required:
   - compatible
   - "#phy-cells"
@@ -51,4 +60,6 @@ examples:
       clocks = <&clk 93>, <&clk 94>, <&clk 95>;
       clock-names = "app", "stb", "lpm";
       resets = <&rst 58>;
+      usb-role-switch;
+      role-switch-default-mode = "peripheral";
     };
-- 
2.43.0

