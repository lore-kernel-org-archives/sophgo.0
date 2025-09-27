Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B94222575
	for <sophgo@lists.linux.dev>; Sat, 27 Sep 2025 17:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758994612; cv=none; b=IbBlMb94YY3KP7ZYy7kKMrhSkxmLFtRwQ2d3C8fsAZQuywRb41IudrQu5Zdax9dStVUBzU3nug5blxFDZZxcbmvMUifplPCPz+SyDEVjnYKpWfBbrMaN+mEVXkd9cmZizZ/QoefSWdW/kOGltgM/+filvvDkGvq/VGFbtjd2DgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758994612; c=relaxed/simple;
	bh=HsJMfKubKq4KCsL2bQRV3T0PJUUqA0xHRzloWDTkRjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X31rZ2ljhXuoUwm985ZRQ582ealJHcvGkeVXFgl5rOZBxnEM1xJWz4RJiwPPiVQBX5sXaGIh8ctDVux90n2VInIe8CfLM3Hk3XYqApZXyuwbLihHnRWC6UtyPduzoSJPIPhfhoH3gv9thQm9zUETBcpjTOrl9NDS7+FNt04BCp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cb0Ijnf2; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cb0Ijnf2"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71d71bcac45so31588467b3.0
        for <sophgo@lists.linux.dev>; Sat, 27 Sep 2025 10:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758994610; x=1759599410; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+pu0MJgxB0q79F+DDz2sNZNIC6+gKM+Zmm/VlNlw1w=;
        b=Cb0Ijnf2IXCjek8qRiTA9F2uw/1eK8olGrUbqKxrRi1/AWRRTMh46CP4hPO09u/Nd2
         TLivzy+Lf8C53PSMYE7PnxlwxsZCfjlFsdZ3UB4Lby2s3SOxdPO2uf0xx82gtUi/xHiQ
         ztaQR6FwwIyqqL1hqn9QOMfgcl8W97So0W3KLSs+OvK8g8oJkXke3URfyeeBXL4aU/HH
         tSLhznhV6ZFdv8p1c5XLynU40bhq6BVpp0KAnORK8NpwYb0MOF8WUCBsgUY52QhOIbFz
         B6f2jA+mZc7mrIGYJClFWxTgAYyJfDuelqdzT/9lbDRf9HCwJOszQ3KYbvq7bB9ucQ0S
         1f9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758994610; x=1759599410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+pu0MJgxB0q79F+DDz2sNZNIC6+gKM+Zmm/VlNlw1w=;
        b=i9IZzID2qkRbm/K3z2KVxWj717/kPYnIWJMmKOMDFqTjistYNPJS74ATlD/VRcs4SC
         BB81mYIZPZkBIPsO2TazZDIOSaY5Poz/dMEYe017/K7y0VmSAI80KJBBFSYyij3G+HX2
         L43N+NPXPzS1NrX0TJMQnadeWMVgtut7+sSqB2rWBgIYzFZ80YZB+fxHmJsT7XrQPVPu
         FYnOlsJZ34JsB3QqAF2lPuniYCOaVpvdhDg17hJSm83Lzr1vi5UWh7dsSfAUmnFD5+HX
         +6E4yYYxjf3+pHzGo3RHe/OBZa+sRPidGjapxm1gksMph5UiyzWADKV1jBQygeg8mnMS
         YRQw==
X-Forwarded-Encrypted: i=1; AJvYcCUpJCx0O8yuMhY1t0KhBY5wBmbwdrilTqD7VfKYBSJyUdci0mhtjBUCX9q+DewR1iGL2ybzfzE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8DVxK7EgsoDpuTvykbk9WAZ5UepxhYkyb5awEhWhngLCiJvwO
	5BCXGx62Zjtwv/EKwUqg3AD1KwlwnzlSOiokvkDRdqs0fg5gmLghewAe
X-Gm-Gg: ASbGnctP5s7kvd9pj0wGhbNZj4fF/Y1kW/6II/AFmEe/lQAN/0mndDGrTgVXv/zgSor
	vrEOhkBUlHDzzGULS8jVRj9wocOAOmldtL6xeyWI6WVwZU++hdfIhpOV4JGqw1MdHh+jpirn81B
	oUNjWataq/oMEI7jl21jPpB01yYtCyxaBbDvYCesL7TMYnSU3to3H629AwEsQc4HH9d30wT0dL0
	K2jrB3ZjSymqRAmzk/E1Ihhrt57dAoFuxXWYeAweZYuyx7HhCy8HFW6LZKwW0/PzNOmQ4Y6ej+3
	xjEwlcqth3PkRehS76j1KCTTg58cfY9sECkqPs0DzshvL5aZaj0a1LeM6WDRwcJ41/VcufSwDsz
	C+lVKdIBnQIU=
X-Google-Smtp-Source: AGHT+IFWOUOTcGoj1lCQG0iQiRPQhxPuUKQ+vNAsgEYGwt7nGKevNkkGHvlPTyDU0wlsRHPQIB4BuQ==
X-Received: by 2002:a05:690c:6289:b0:748:9430:cc2 with SMTP id 00721157ae682-7640457b081mr114571697b3.43.1758994609925;
        Sat, 27 Sep 2025 10:36:49 -0700 (PDT)
Received: from sleek ([2600:6c65:7f7f:fe0b::ec0])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-636d5b1d83csm1269716d50.11.2025.09.27.10.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 10:36:49 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: [PATCH 1/2] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
Date: Sat, 27 Sep 2025 13:36:18 -0400
Message-ID: <20250927173619.89768-2-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250927173619.89768-1-josh.milas@gmail.com>
References: <20250927173619.89768-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible strings for the Milk-V Duo S board[1]
which uses the SOPHGO SG2000 SoC[2]

Link: https://milkv.io/duo-s [1]
Link: https://en.sophgo.com/sophon-u/product/introduce/sg200x.html [2]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51..2fcc63b1a036 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -28,6 +28,7 @@ properties:
           - const: sophgo,cv1812h
       - items:
           - enum:
+              - milkv,duo-s
               - milkv,duo-module-01-evb
           - const: milkv,duo-module-01
           - const: sophgo,sg2000
-- 
2.51.0

