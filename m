Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E86A1AAA23
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 01:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988039; cv=none; b=L2QNjQ/c1SuSTGarotSR/L1sAwA5+/wEWeGdDNtTCeV5lU0T1XtPhAGYHNuzanDSv32xJ3gvuvSpolbW/9kQfCcXM/Dq2hsQdN1VNxpQavFXMd3oXPDgpGIF3YAG3Mkk9XCKrPzqRpZn+rlQPtbKvx0tUlnOhreOQL8yplAvjxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988039; c=relaxed/simple;
	bh=0VDH/LXkgyPWREKGJ6L3ImEQl8jRzmgKxVbe+sXjwvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TU0S3zOyzOGRb+B+d3mI239knnBJQC2X13pN3s6dmKa1lgbXjOJ4U3GtiIKWNGWfZbMKwjcABW6mYiDXR4L/JZBhgkjHCK/LM2r3FRrZHY9nQ6XxaUx0VjjkkwlNY0RfiSrQ3cG7OMkR85J36t4Imz12uNeeRMUaG1b5BGJx6as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRASwSiC; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRASwSiC"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c3bf231660so497378785a.0
        for <sophgo@lists.linux.dev>; Sun, 06 Apr 2025 18:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988035; x=1744592835; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igVn5a9lnYZiv748Bf1nucU57+aqB/uXYfi3TAKJX8Y=;
        b=bRASwSiCsjfvQTm2L4FCC1R+G9w8hwY7q8KUUQ3j/8rnkUQyLKAI/+S7uGZFXzMaTi
         qxwqyUboD/UNfICYrYGBgD9gxdfywWEFmFlpBd7wzCMmlBssV/AYFm2CvMzeteoC57zw
         t/DmrxpahAFDsfB7hv1KB4qApYfipGQTF1twuuFlSu760Kfst5ZDY7b57N8Ze1hGGN0Y
         OEll8LtobjDgI5Rjy/E9TLuGxz7NLuZwsdwwQMiBLaq2HaelPejhJt2rZmZc8sruwjhU
         AUXsLaF7CbVzrlqX45kgeWGDB6XPKs1ASyEmHXe1Wl1tViXbiB3KwWS8H1xUgNNAwbuO
         SzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988035; x=1744592835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igVn5a9lnYZiv748Bf1nucU57+aqB/uXYfi3TAKJX8Y=;
        b=JlnYLDfylFup1WOA/8ubjXTRwCsN8ST5xmG6fML9JrmlpQxglx/jArM4Ye8I06qYwJ
         S/b8HTlpb7aAHnXTWdR77uGyIQtc7XTckKUCgiX8O9z9deVMbU+J4Pd+1oqemKztHTvw
         5tW9YL9ioXhLiE/TbeRYIO/S2caiDfxS+UZBWvuZ0/wUAoEWXnbnXYv4REHnhX2wlToA
         tTLj8PCmkTJXcNdmpqMOvuAdoSEeVh650yuwB+/SZ1aSKXY6QLNJLBg5ks9RErq3Vmvh
         /y3RRFJOBlbiaocD9sHLMWVskbeATYHjguiCsQWuht25Eb7C5hkobzVpmxzn/PjLFiW/
         4qYA==
X-Forwarded-Encrypted: i=1; AJvYcCVBLtnTBmC3JOUFfMaam2nluzvcZrn0XiHLvBjtR9KKmquWS/OUp/HgfgQXiUcwsNT87yJ2LS0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw9YTlLnreIzmm59BQ+bEJ+dT1lXW3LLtfPYxbyiKdkyXBqxE8
	BKvFCU+dYeyYVMQrUtZOU55kusIQXeGh/ZR77fBOBuhCxc2zh0vt
X-Gm-Gg: ASbGncuZEBmbdcqMZSL7C139Ye3NDnNCghqJLNZYf+WBuZ3pGv/ULZGeR/8O406fjry
	nM+bzlNyw/hNLmyx7LvheH+WOtYS+n0h+VD4NEwQN+w+hMODnhyixqK6ilapPjfXKOmh9EZ5buH
	5QXnGWDHpRjwc6RFAe2DLPQSCq5O/AsXmbU3kYQAoLIBjIAYl3GzM0twvGED9csyxq3EII76l/G
	HTqvkxPd5BK8MDqRaB44DgbQ8UeHmnzb9c0URfVH9qS8eii3WTO/AXdsULyoW7pQN0ZJp1Fk4SB
	wR/4gRK2snLFesEDEtWR4pugpgEM1/I=
X-Google-Smtp-Source: AGHT+IFNNT1TQk9hNsU8tcAP1XaXbTB54YiVS5jZhvg0FI/49XFrqaA3CzgEc9xU3GgDXEPKZXqRgw==
X-Received: by 2002:a05:6214:2268:b0:6ea:d6e1:f3f8 with SMTP id 6a1803df08f44-6f01e7f5c1cmr141067116d6.45.1743988035598;
        Sun, 06 Apr 2025 18:07:15 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f010bfasm51815846d6.49.2025.04.06.18.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:14 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 6/9] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2044 support
Date: Mon,  7 Apr 2025 09:06:11 +0800
Message-ID: <20250407010616.749833-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sdhci IP of SG2044 is similar to it of SG2042. They
share the same clock and controller configuration.

Add compatible string for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml        | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
index e6e604072d3c..47b5fc1b8e07 100644
--- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
@@ -19,6 +19,9 @@ properties:
               - rockchip,rk3562-dwcmshc
               - rockchip,rk3576-dwcmshc
           - const: rockchip,rk3588-dwcmshc
+      - items:
+          - const: sophgo,sg2044-dwcmshc
+          - const: sophgo,sg2042-dwcmshc
       - enum:
           - rockchip,rk3568-dwcmshc
           - rockchip,rk3588-dwcmshc
@@ -74,7 +77,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: sophgo,sg2042-dwcmshc
+            enum:
+              - sophgo,sg2042-dwcmshc
+              - sophgo,sg2044-dwcmshc
 
     then:
       properties:
-- 
2.49.0

