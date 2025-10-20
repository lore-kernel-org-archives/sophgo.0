Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5FE2F549E
	for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954172; cv=none; b=A/59x+/qrTPZly5sYQMiwyy9RJOZmTDWdqsIne+w37bg3kaPhJqvNpcqJG+nreG45ia+8/RAaVwuJyOLD/qKhqHZLA0DennKb+bUlpSDycUJ9Hevqr108vACFSuDaBN6BcQONCsoZYMMrTuspIZ4X9cDZLUrynuc1mqcrEDWvTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954172; c=relaxed/simple;
	bh=PXseH4AXPA1u06jp3KYScqETJ9W5u1LbZmUsWPspIFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5VBJWZci+zMUlJfyAvGBTPGGIGPo+37SHnMN19ZcV70sNvEJNCxQweCS7dkynUUPAScODlxFtoazF1LXB9TMq0N2zidTeZOt0P/UPos8iNi7ADIBEYK/7imGIG6Sp9dGIZfRWy1eGmuAFm2fn3MLLlno1sB22jC3D5bjrm54hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fav3PwRq; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fav3PwRq"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-781206cce18so4198164b3a.0
        for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 02:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760954169; x=1761558969; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWcuoCKPdDJm2TuKaUOD3wYJ8UpWoogH56aNLChKmO0=;
        b=Fav3PwRqC1/nHdPZCnPcbiBWKreyaqtZdtu6hw7hod750n0eXpxZERxGPSzXN/p2k+
         XDZ6XDK+Yjj1iS/mcm0JnPz7swBYez0E1e1I0VPzC9FSM2h3Weckd2Weo7HOcvJTg64l
         aSrPh+p3LNMR2TC7oxVgk6tsian+R3cIgtxcpKtym9Nu7291myzJ3kVfXSdZ9mCD072B
         NLjaIYFl6W1ITP8qJNhDawFJ0iNjv0x/e5VddAYsbHDyWOukyfYtH37FAN919FgAHf8U
         0lZvq76gog28xooWyD70cZPBIb03MAZZTBmhyqqvvO1DULFYs03g9wZaoXTXiKB171Go
         m7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954169; x=1761558969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWcuoCKPdDJm2TuKaUOD3wYJ8UpWoogH56aNLChKmO0=;
        b=cNGOjPyw5E9BCSERupwSSx1KcITacT2p9z/uFY0IZLzCAGUNXL2y4a7RNBKqj5+MAe
         Aekujo4DBDOL/oUXNpZlFj0RBIzuKFrfFKRSEPi64jvvh/llKX5FBok1NZdY7rpKt9qD
         H5H1kvxE5gY+BOvrUrK/nGrSU4bRmLQzBnwjpfA/SytSGKcul7qNrgt463zIlKUMX6jn
         iQhFbnxxb7U96IwAhPCc6nkWBlg+r4QMT6yIPYeSjrHhtpqc2akfnZYboOeKSNgWiHBl
         iB3uQA4EYe6CE4NxfarGTt2tK8F31jogRfBWF73CBRnWDv5VKEyS3AC3jRav0yzq0r4S
         5FgA==
X-Forwarded-Encrypted: i=1; AJvYcCWmRN2oxAuNIFgrSf77MB0OBUsnogSS7iM2xhdT9vhtu54WPLY9HMJRy/dBbrjC46TY7dnvU18=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCiwjqAGSaUUbehJ+zkPlwC2zeqPBroi8MB3niQmh7wTOfg8JU
	YgdB6RNbOFDzFLAZwYCXdcoF/pwhlrYhyt2mBwD8UFVfm1PCrBjIDCbA
X-Gm-Gg: ASbGnct35mri0GWsTYSEoyksIbYG+UvKIf7kE7fvbf+8hcdN0wDDm6ugR3BpTKC0EL7
	TqlS/hCJk3INNbf0nJ6osl9w3hVBoLr3sLleeNt0dZ9ESdd3X92Aw7OwYqs5iNXQlEOCFhcLgmA
	LM2aeHG62JmOz/lp5/k3ni5hEyRW0OCRGKfkYT/OS3jyT5dxkjtnv8NXthM1F3MLgJJHG3+wpTr
	UOK9pSptnG5SEVzwlxtMiHeLblvIyjfC75cpwlNxc0xWjLO/Kjewxsz20B45+HR3sPat5TLwWB6
	K8gPggYXpvfc8fBvvm/OiAhFR3hpgwwBeNJ2h6FsfLUID6UwdMY+DR2n3poeKeaEnhxlupD7u72
	sZ0J+Raf1kXb3ZoWBOSh4wZoPToV2V4juEyy1dNfA4uaVZA5eKHWaGLvOY0fjT5n+/v4C6ysGif
	0=
X-Google-Smtp-Source: AGHT+IGIQ+fpkFQuGh96PYvhkgcTsp4EgXDaVgp46X6ZalhlUpsQFY6hZLjZrBA81Ys4H3/NGCVNzA==
X-Received: by 2002:a05:6a21:3382:b0:2ca:f345:5673 with SMTP id adf61e73a8af0-334a7a4b585mr15454180637.27.1760954169223;
        Mon, 20 Oct 2025 02:56:09 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm7819782b3a.45.2025.10.20.02.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 02:56:08 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
Date: Mon, 20 Oct 2025 17:54:57 +0800
Message-ID: <20251020095500.1330057-2-inochiama@gmail.com>
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
2.51.1.dirty

