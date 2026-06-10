Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21BC405C33
	for <sophgo@lists.linux.dev>; Wed, 10 Jun 2026 12:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093446; cv=none; b=Lw/N2o7wZNof4y+2BObu+BuH+ydtYrb1IDuVCYYoVh/NRUAlX7nEO97BYeuK1QVA9hqEXktFQ+8R3AjGPs+FuWoFjRV9CqfxJHX7Yg40g+8ephZ+NNAdRlkuVYKLmLMzFzTn6NFLrxkrGI3SRYkJtH8yVlQPaMPd0d1/F5/GXhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093446; c=relaxed/simple;
	bh=st8y4T5YN6SqtZtFwtiBYLCoyPi/Wo5ON08Qei/HluI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M5VlxRpsraByzW+InxiKyXN7gHXS3JdjDYqE9AkDvUSC2MSen8xCZHsBssVZ8Ob4ImvOPH+zNj1nQgHRIlr2fKy3URh0/fi3u13TY0dOAUBG8Sx1WTHGPnAHf4vT1snuk7ivPnFgNwdcu2H/RdrjqPLE7SFNj7Ap/Ispds9OSn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hF4pTON1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hF4pTON1"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf20ddcaeeso5646985ad.0
        for <sophgo@lists.linux.dev>; Wed, 10 Jun 2026 05:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781093445; x=1781698245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qvjNxqwnoH3kM1IlyzkqqQUMkDcovkXPiLWFB1jUKmE=;
        b=hF4pTON10tvKDGR9ZyYO3ESrV5knVx3BlxJc77k6kqQZc8az2qCB7CIdqUioBwnTHK
         O8vYrtC62XbG8wykFErRVxuvEHNV1xQQ7zkK7jN54nCeR6ulADdKXnkVV/D9QqitDP1I
         TilZjCecZNPJ93dN3i2c6iVFgKQlaofVBonj/XJ2Ddc9thrgwMgzZBXTZGrriQ+cGc6S
         /RLADd0rr1QFgGaIeGjQQJcKo+sS6+wU1U/Z8Iv/0EhV6pWMNbzEWIu3I7NqI18iTI7x
         rmL8GkEJOJFRFUkKnN/SQJat/YlIREeYtFnSE7RLEpH1kgU04tDHOdo6N7+LgFlr8m9K
         eQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093445; x=1781698245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvjNxqwnoH3kM1IlyzkqqQUMkDcovkXPiLWFB1jUKmE=;
        b=gDEBkNHX7+3tOmWLOJta1me/1NTDxZB5vmhcVhO59AKYOvR7bQsfQGpgUkOYsMjv7E
         jmGKxXZU/OuYjwDkOPEQ4lYAR8iZfL6ZNsfhwOCgfftY9Uz6/yRIidLc4MYj801mwCDN
         BwijqP0ub+GkVKICEzJ96T9cXIap6aYYFlkFG1a8n1yPxb6a0ngXwppg9ZDT8UBIzM0/
         oor2XRXj5G7nrqFycWkYN779ZyYgC0wWZ9nWhGiaXkuSaRfYAKk79irxTno+kBV9LmFf
         y0fzae5ldCFM9u+htF5850z+jLA8WcAsq4G7z3YWVswbNMuq2Uy/YPTNGRI79O1UXGRb
         Rqpg==
X-Forwarded-Encrypted: i=1; AFNElJ8YWFEHxebqu5hMrzxq9CmsYoK5siD6COv7e5ZgOBdMfL1qxO4BO+IW6MdyvX4PCCdDv4cwslA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr8fI+CPUnJ7xvw2nngSAoCOi5JVaKR9wcy0KJzHe6dZpGd1CP
	0VbJNdXaD3Mxfukb6JjyzVehVxWBVzJFa4mHzDhaDKJ1cDHvdJDiJhkeq2bbeNS4Tz4=
X-Gm-Gg: Acq92OG/i80qqcUKhQJ3pT9KZ5xDbroQOe1aZdvdt5iQOZC3l6+J0k9bUEbGIepM5RF
	0fe2gps6rj9jXHORcidhrCUbOfEHbFMFYZez5Vwn6Xi07+wKfw/S6Kj31WKh/dvidoJTCHJB7am
	Mz7atriptaJqqbcZDVnSYX4EclrkkIl7OYrunx7hDn8VziZm4ETonrWc4pwDkYB8nxMt0GMnAG0
	5MRlqDnJu5B/yQ8P69o8/Qb02MMr6H+X6rCz8aA0gHothVte2VPZ7aSX5l8ap3F2b/YJCahQ11J
	2B61UXHagZjbv212rBl4HqMF+CQey8ynbGmyzZdzoGWOHsQlr1sKj1LKiTWbUn7Z9PrL0Ztac75
	xLVpcxA+u5xKS2Y0UmbQ4h6YO6DWQSKS3p8lFk8CjtzH2Yx/Z8toDvDfnQBjbw7xoI29EpUTAPs
	MASNBEbVpHtxuyiwmZ5LNFWX2dyxj34hYE37Fl
X-Received: by 2002:a17:902:e78f:b0:2c0:b359:99c1 with SMTP id d9443c01a7336-2c1e7af05f6mr128447045ad.2.1781093445308;
        Wed, 10 Jun 2026 05:10:45 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm245738445ad.26.2026.06.10.05.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:10:44 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: unicorn_wang@outlook.com,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] dt-bindings: soc: sophgo: add Milk-V Duo 256M board
Date: Wed, 10 Jun 2026 20:10:09 +0800
Message-ID: <20260610121026.1517621-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for the Milk-V Duo 256M board.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51..fcb1d905da7d 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -31,6 +31,10 @@ properties:
               - milkv,duo-module-01-evb
           - const: milkv,duo-module-01
           - const: sophgo,sg2000
+      - items:
+          - enum:
+              - milkv,duo256m
+          - const: sophgo,sg2002
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.43.0

