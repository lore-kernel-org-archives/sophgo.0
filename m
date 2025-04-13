Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB9D1EBFF0
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583763; cv=none; b=UsYp1B9NbZC08Se+tORbS7nA+22s856f/o1K/V2qiGKyclcAy+Ld7wPWpkKoi62oEPeJPHtLUxa7xafdxmWyxZGSKx+9+8wxRTZu07Qgldp9hwfLBJub+Zk8OzVZk1RfOxv6/MRaKUU4Dt3tpUYhHs7Tit8dVpxPUPmrFqb+RX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583763; c=relaxed/simple;
	bh=7dHme/Vx6fkQgu4u9qEbQyCY/VKmf6dVZl22pAWFhqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQA/dAcEPMCDm3P1HcmEYeVunp9ZZiojUswvFroZCDoA9gdVWxF7rTkVNHJi5AmJdzSqw7UQmh9M57RQ1no60hqaZYWptIQgSiAZHdq6mDZFsvFTQpd1jDchsJdmRdVonRim+yXKbuIc9R3e5KEoUDFWqSOpdEpYp2qXNf3jlVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=no4wXh/F; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="no4wXh/F"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47690a4ec97so37100301cf.2
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583760; x=1745188560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMOUZ6qRg9W4PB6CSqOFfx7Fn9U9SQfI0wC9q+7apzY=;
        b=no4wXh/F5RzNug8p1WiqCaIFdDMFNCpcJJ+Sy3Q8rJUMBLsWTwsV0IjoT2mtvvdqO1
         3ETmMhmaHH5ePRivQasVdkVjVcvfhwcfHAd9eMpNR0d5A0f+HfXaZmPtAmwWtXqndd7h
         5S2YClM4MHT/YiMHNQjfV+N3C3TyYSIyMANDzV9Roy+T1G5wb9qo1Z4FwU83yuyUSTnh
         V80eT+96nxiLQpA2gmjvQNI8IFibeL7mFbeQyUGuRnLBXtGejet5jzfIHuqfN8W8QEqF
         F1cowmU3W7fvBiIzllgFmME1TDEi3+GVUWy4eAcbP1IpD6nsVgABrTHawSZurNW/a5pB
         E9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583760; x=1745188560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMOUZ6qRg9W4PB6CSqOFfx7Fn9U9SQfI0wC9q+7apzY=;
        b=fFAAH5qid02DipukxnUxS41OcSW8HBimK8C8h2p6Vz09gK4W4oBGUQTCu14lK8Ui6A
         B+LyPoueZCSLc44P/6Lzf9nm1aJLyUNj9bsEI87zRfS3G0P4qcA7uzRYMrgjRDykzw6t
         L7Hvc7vAut+EZgMkA3hwVbaSqiBtPeaEr1Qe0Wnujkse2jNDjtU34uRrk/BeTCmXsCSN
         TJrHylGexdQFjRJ7sWCavMT6mem/GeJZQFwu+xNsBvmXBKjp10SMb8blaHHgFSYh0gLW
         sBJGPSlf9RHrxZzrwCUFJUWdqT1b5akAjSxk/xP852T+LYYiCvo4If/rkkzS3SK+O4Li
         xkWw==
X-Forwarded-Encrypted: i=1; AJvYcCUAwZ9vDuaKJyW4BDRDOgIMOBFfWITEMgBGQuGblKqQ2vcXbzTqz6C4LVEucoHeAMgd88brv6c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2UQzSkjUVL2+/GiWIw4tuSuxyJ6QMtrRi1XuSxMfR1YI903d8
	2GJkhyh0mUrFySgGlb3llzvTGPBKdPLMG2OvrBhMH4Gb90ocTToj
X-Gm-Gg: ASbGncugoj7D5fqhX8s07LBfIHJtxwemOPTSRPQDBEWF74SS8/0FJQ49LAfS/VNMytj
	lDYU41S44ZxvuM1ZboXWtJFd4X19Xj9Z24Hk6R4ZUgdShg00BlH+yNlkrFs2XhYCoAo5ZuJDvzI
	EOlejnsyMBcyp0YvIYHOHt/7uVsSsRko4Y+b+QKCPj/1zuo0KdRT3zOkLswoSlayReONFinwHfg
	oeCU4TvQY28FH18s0aqhlcha93806ueSG18YWijRyKPvRpsGQmhlPDAIpuLlagVN2waK619CcnV
	+TuT7Ni84aoLdzW0
X-Google-Smtp-Source: AGHT+IF93rzEVWRRKOIxWAcvcau023Tgxa4/7nUy/JnIgvkSrZ8RcL6P1YK7x8N162WFUx0/ZurzFA==
X-Received: by 2002:a05:622a:2d2:b0:476:8f41:7b8a with SMTP id d75a77b69052e-47977551e2dmr154754621cf.15.1744583760520;
        Sun, 13 Apr 2025 15:36:00 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796eb0b581sm62137321cf.10.2025.04.13.15.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:00 -0700 (PDT)
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
Subject: [PATCH v2 03/10] dt-bindings: interrupt-controller: Add Sophgo SG2044 CLINT mswi
Date: Mon, 14 Apr 2025 06:34:57 +0800
Message-ID: <20250413223507.46480-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As SG2044 also implements an enhanced ACLINT as SG2042, add necessary
compatible string for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/interrupt-controller/thead,c900-aclint-mswi.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 065f2544b63b..d6fb08a54167 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - sophgo,sg2042-aclint-mswi
+          - sophgo,sg2044-aclint-mswi
       - const: thead,c900-aclint-mswi
 
   reg:
-- 
2.49.0

