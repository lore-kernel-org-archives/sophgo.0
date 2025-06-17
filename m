Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E7228C5CC
	for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 07:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750143787; cv=none; b=eLNq9JSJ1Ed98C8/X6gra/+BVSLqvzkQcTsJQgGVsuh3NPQFocN4i08+2iqFfqclp7h9cDR7SgTP9b4HfSPAggJX5T5t4Oc+bQVpeMTWgivB8uC7QgoPEBazuEjH2ZxornVJnTDk+6PQYTecvEecK9ySiQWMmMugHss1QgB+Ubg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750143787; c=relaxed/simple;
	bh=dJEq8F2hT61k1w1AqHST/zG24BOat2Aw8uDuHcvUXSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pwl1OAgbLLBCI8qib2GQD2alSIq441yDIWD308b1mt75bec974MWY+bT8AQCQk5KlSv09p4vMx6djX/D9dRbys3oJ0JmU+T8N+Rfz+bjUFs3Vb2M3uiet/UUkdAet9LuJh4K49LRc9V0ygnBDEa3LxwJEF80C8/jjEc9MP57uG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWj7WqAQ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWj7WqAQ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742c73f82dfso4111876b3a.2
        for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 00:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750143785; x=1750748585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kh0sH4nO9aBejb33du+kXnwSDR3QoyXmXuJp5yem4TI=;
        b=SWj7WqAQghwbLWUNWELSsEP0ybVkTJ/r7qNzgN0Ns/R/ISuERxVHSP4/iAHF4cwfLS
         VlfEUw2RSbdI7ABHXsuEStJVH81um+fKPT47tGdDXPcdj6hah3AYbRIQ+TCidRUYVxkj
         ZwQ4RWR1qa401cTYhRbL+ObM9uPh7Vd5o4GCx5fkj0a5/5iKkl5/BCkaVhvaK1xV1JO9
         bVRVyL4lqvTD98lU92d/b7u1pYdSesBqucSAsIbN2I+oKd4Jj97YB6znT/pYKuN5xgrY
         au3GVm5MW5MFT8Ze5yT6/7IA70+iVMQnEzW2FneDpHbcGdvQulxmOAXfNPdN9mtJIjKd
         1taw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143785; x=1750748585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kh0sH4nO9aBejb33du+kXnwSDR3QoyXmXuJp5yem4TI=;
        b=TPLhrifRk6SoKzhV+fR4gJqZbKqycG3oXXlZEPusOw4sKidUPHeJqU7n4ZDQlP8BSf
         +pQdXeURw3zgtj9oVj+fgOA7vIvLk1eMrjfvwyZ11CTiKYLbKqH287xUxYFwlWGGLLq5
         Um6BWdTpvFgkvnR2KxxscsD6rtMJE66XAwhEOl8Ec5rYmEDVw8VpSw9zsg1CHOjCVWW/
         H6IpzMnzkUjx0oKs1lbs+Ovh16QvyhSAMFdiCZe2phfCC8Nzxt284KKIgnsXLTtaPn0h
         1Y7pMw9WX/69vCodyBZxKpUdciDQzQgY+9dcu9GhCu2gLfNhYJEl41x7AN5gjXvNrh1G
         9oqg==
X-Forwarded-Encrypted: i=1; AJvYcCUrQEamr7IjLNekx9nkNuD57yQoMea+xWochbjeatZvLNlxXZviIe6/N7hxnQXtmRwZzEvA2Q8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWrDCLDKg3vrBX5ixMiwvNh1TozL/tRbSS5agipYUlCYs5JFga
	XY48eQerJqOFtcdNYz47rhqpWzEolkw/HpQAe2YUPO2ggrJE6bWsf7cp
X-Gm-Gg: ASbGnctmPowvL9nKTfNolGd8ti1rBdzqCQOw13boTgocZr8BAX5agJ115cSHhSOFsSW
	d8CKWuV0qd63BQbBeUotS1KExsT9LT/GFA61+vaBERj8IgzLzizGhRr/w2b6uoxD9r5GG/pB73T
	khRhJg+5MaFvsKBAhkJHVK5F0lxRfT89B7MktGGWAYvR62YJ38yxu9kaOmeCqWEfCGuRFw7c3gF
	aEUnqZtoYTlGaBQVMhC3OX3Iw7SwgfHqGsMkceffcXG9HkvvzVE81j+hIFuPbCjbrcTDdxcRZV2
	sQcHTQ0QMSDTHjuYPIZuuH6Z+L2Y+j1QLbu8vIX/KDQr22HeeCXtqFx5jSDTouSgtClpEBkS
X-Google-Smtp-Source: AGHT+IFqJ+76sZ5zKGvWfOL25dcAZxuQhj7lH5Cur5AxGcIirIkmcfil+8KNWWqlRuFJb6f7BVgQOg==
X-Received: by 2002:a05:6a00:4f82:b0:748:2ebf:7418 with SMTP id d2e1a72fcca58-7489d00e68bmr18901543b3a.24.1750143785393;
        Tue, 17 Jun 2025 00:03:05 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-748900cec7dsm8065760b3a.153.2025.06.17.00.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:03:05 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Date: Tue, 17 Jun 2025 15:01:39 +0800
Message-ID: <20250617070144.1149926-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>
References: <20250617070144.1149926-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the reset generator on the SOPHGO CV1800B
RISC-V SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
index 1d1b84575960..08d28313b870 100644
--- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
@@ -16,7 +16,9 @@ properties:
           - enum:
               - sophgo,sg2044-reset
           - const: sophgo,sg2042-reset
-      - const: sophgo,sg2042-reset
+      - enum:
+          - sophgo,cv1800b-reset
+          - sophgo,sg2042-reset
 
   reg:
     maxItems: 1
-- 
2.49.0

